using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Threading;
using Newtonsoft.Json.Linq;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.common.utilities;
using lenovo.mbg.service.framework.devicemgt;
using lenovo.mbg.service.framework.lang;
using lenovo.mbg.service.framework.services;
using lenovo.mbg.service.framework.services.Device;
using lenovo.mbg.service.framework.services.Model;
using lenovo.mbg.service.framework.socket;
using lenovo.mbg.service.lmsa.hardwaretest.Model;
using lenovo.mbg.service.lmsa.hardwaretest.View;
using lenovo.mbg.service.lmsa.hardwaretest.ViewModel;
using lenovo.mbg.service.lmsa.hostproxy;
using lenovo.themes.generic;
using lenovo.themes.generic.ControlsV6;
using lenovo.themes.generic.ViewModelV6;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.lmsa.hardwaretest")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("lenovo.mbg.service.lmsa.hardwaretest")]
[assembly: AssemblyCopyright("Copyright ©  2023")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: ThemeInfo(/*Could not decode attribute arguments.*/)]
[assembly: AssemblyFileVersion("1.1.0.0")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("1.1.0.0")]
namespace lenovo.mbg.service.lmsa.hardwaretest
{
	public enum ViewType
	{
		START = 1,
		MAIN = 10
	}
	public class Context
	{
		public static SortedList<ViewType, ViewDescription> view = new SortedList<ViewType, ViewDescription>
		{
			{
				ViewType.START,
				new ViewDescription(typeof(StartView), typeof(StartViewModel), (string)null)
			},
			{
				ViewType.MAIN,
				new ViewDescription(typeof(MainView), typeof(MainViewModel), (string)null)
			}
		};

		protected static IUserMsgControl Win;

		private static MainFrameViewModel _mainFrame;

		private static object locker = new object();

		public static MainFrameViewModel MainFrame
		{
			get
			{
				if (_mainFrame == null)
				{
					lock (locker)
					{
						if (_mainFrame == null)
						{
							_mainFrame = new MainFrameViewModel();
						}
					}
				}
				return _mainFrame;
			}
		}

		public static DeviceEx CurrentDevice { get; set; }

		public static IMessageBox MessageBox { get; set; }

		public static ViewType CurrentViewType { get; set; }

		public static Dispatcher Dispatcher => ((DispatcherObject)Application.Current).Dispatcher;

		public static void Switch(ViewType viewType)
		{
			Switch(viewType, reloadData: false);
		}

		public static void Switch(ViewType viewType, bool reloadData)
		{
			Switch(viewType, null, reload: false, reloadData);
		}

		public static void Switch(ViewType viewType, object initilizeData, bool reload, bool reloadData = false)
		{
			//IL_0066: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Invalid comparison between Unknown and I4
			if (CurrentViewType == viewType && !reload && !reloadData)
			{
				return;
			}
			CurrentViewType = viewType;
			if (Thread.CurrentThread.IsBackground)
			{
				Thread.CurrentThread.TrySetApartmentState(ApartmentState.STA);
			}
			object currentView = HostProxy.ViewContext.SwitchView(view[viewType], initilizeData, reload, reloadData);
			MainFrame.CurrentView = currentView;
			if (CurrentViewType == ViewType.MAIN && CurrentDevice != null && (int)CurrentDevice.ConnectType == 1)
			{
				MessageWindowHelper.Instance.Show("K0711", "K1608", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)(() => CurrentViewType != ViewType.MAIN || CurrentDevice == null || (int)CurrentDevice.ConnectType != 1), (bool?)true, false);
			}
		}

		public static FrameworkElement FindView(Type viewType)
		{
			return HostProxy.ViewContext.FindView(viewType, (string)null);
		}

		public static TViewModel FindViewModel<TViewModel>(Type viewType, string uiid = null) where TViewModel : IViewModelBase
		{
			return HostProxy.ViewContext.FindViewModel<TViewModel>(viewType, uiid);
		}
	}
	[PluginExport(typeof(IPlugin), "985c66acdde2483ed96844a6b5ea4337")]
	public class Plugin : PluginBase
	{
		public override FrameworkElement CreateControl(IMessageBox iMessage)
		{
			Context.MessageBox = iMessage;
			MainFrame mainFrame = new MainFrame();
			((FrameworkElement)mainFrame).DataContext = Context.MainFrame;
			((ViewModelBase)Context.MainFrame).LoadData();
			return (FrameworkElement)(object)mainFrame;
		}

		public override void Init()
		{
		}

		public override void OnInit(object data)
		{
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Invalid comparison between Unknown and I4
			((PluginBase)this).OnInit(data);
			DeviceEx device = HostProxy.deviceManager.MasterDevice;
			if (device == null || (int)device.SoftStatus != 2)
			{
				return;
			}
			DeviceEx currentDevice = Context.MainFrame.CurrentDevice;
			if (!(((currentDevice != null) ? currentDevice.Identifer : null) == device.Identifer))
			{
				Task.Run(delegate
				{
					Context.MainFrame.SetHWTestDevice(device);
				});
			}
		}

		public override bool IsNonBusinessPage()
		{
			return Context.CurrentViewType == ViewType.START;
		}
	}
}
namespace lenovo.mbg.service.lmsa.hardwaretest.Properties
{
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
	[DebuggerNonUserCode]
	[CompilerGenerated]
	internal class Resources
	{
		private static ResourceManager resourceMan;

		private static CultureInfo resourceCulture;

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static ResourceManager ResourceManager
		{
			get
			{
				if (resourceMan == null)
				{
					resourceMan = new ResourceManager("lenovo.mbg.service.lmsa.hardwaretest.Properties.Resources", typeof(Resources).Assembly);
				}
				return resourceMan;
			}
		}

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static CultureInfo Culture
		{
			get
			{
				return resourceCulture;
			}
			set
			{
				resourceCulture = value;
			}
		}

		internal Resources()
		{
		}
	}
	[CompilerGenerated]
	[GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "11.0.0.0")]
	internal sealed class Settings : ApplicationSettingsBase
	{
		private static Settings defaultInstance = (Settings)(object)SettingsBase.Synchronized((SettingsBase)(object)new Settings());

		public static Settings Default => defaultInstance;
	}
}
namespace lenovo.mbg.service.lmsa.hardwaretest.View
{
	public class MainFrame : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public MainFrame()
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Expected O, but got Unknown
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Expected O, but got Unknown
			InitializeComponent();
			((FrameworkElement)this).Unloaded += new RoutedEventHandler(MainFrame_Unloaded);
			((FrameworkElement)this).Loaded += new RoutedEventHandler(MainFrame_Loaded);
		}

		private void MainFrame_Loaded(object sender, RoutedEventArgs e)
		{
			if (Context.CurrentViewType == ViewType.MAIN)
			{
				MainViewModel mainViewModel = Context.FindViewModel<MainViewModel>(typeof(MainView), (string)null);
				if (mainViewModel.Started)
				{
					mainViewModel.StartLoop();
				}
			}
		}

		private void MainFrame_Unloaded(object sender, RoutedEventArgs e)
		{
			if (Context.CurrentViewType == ViewType.MAIN)
			{
				MainViewModel mainViewModel = Context.FindViewModel<MainViewModel>(typeof(MainView), (string)null);
				if (mainViewModel.Started)
				{
					mainViewModel.StopLoop();
				}
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.hardwaretest;component/view/mainframe.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			_contentLoaded = true;
		}
	}
	public class MainView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public MainView()
		{
			InitializeComponent();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.hardwaretest;component/view/mainview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			_contentLoaded = true;
		}
	}
	public class StartView : UserControl, IComponentConnector
	{
		internal TextBlock txtRandomCode;

		private bool _contentLoaded;

		public StartView()
		{
			InitializeComponent();
			txtRandomCode.Text = RandomAesKeyHelper.Instance.EncryptCode;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.hardwaretest;component/view/startview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Expected O, but got Unknown
			if (connectionId == 1)
			{
				txtRandomCode = (TextBlock)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class WifiConnectHelpWindow : Window, IUserMsgControl, IComponentConnector, IStyleConnector
	{
		internal ListView lv;

		internal Image qrCode;

		internal Image wifiCode;

		internal Grid encryptCode;

		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Action<bool?> CloseAction { get; set; }

		public Action<bool?> CallBackAction { get; set; }

		public WifiConnectHelpWindow()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
			((FrameworkElement)lv).Tag = HostProxy.LanguageService.IsChinaRegionAndLanguage();
			GlobalCmdHelper.Instance.CloseWifiTutorialEvent = delegate
			{
				((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
				{
					((Window)this).Close();
					GlobalCmdHelper.Instance.CloseWifiTutorialEvent = null;
				});
			};
		}

		protected override void OnClosed(EventArgs e)
		{
			CloseAction?.Invoke(true);
			((Window)this).OnClosed(e);
		}

		public Window GetMsgUi()
		{
			return (Window)(object)this;
		}

		private void OnSelectedChanged(object sender, SelectionChangedEventArgs e)
		{
			WifiConnectHelpWindowModel wifiConnectHelpWindowModel = ((FrameworkElement)this).DataContext as WifiConnectHelpWindowModel;
			int selectedIndex = ((Selector)((sender is ListView) ? sender : null)).SelectedIndex;
			switch (selectedIndex)
			{
			case 0:
				wifiConnectHelpWindowModel.IsPrevBtnEnable = false;
				wifiConnectHelpWindowModel.IsNextBtnEnable = true;
				break;
			case 4:
				wifiConnectHelpWindowModel.IsPrevBtnEnable = true;
				wifiConnectHelpWindowModel.IsNextBtnEnable = false;
				break;
			default:
				wifiConnectHelpWindowModel.IsPrevBtnEnable = true;
				wifiConnectHelpWindowModel.IsNextBtnEnable = true;
				break;
			}
			switch (selectedIndex)
			{
			case 1:
				((UIElement)qrCode).Visibility = (Visibility)0;
				((UIElement)wifiCode).Visibility = (Visibility)2;
				((UIElement)encryptCode).Visibility = (Visibility)2;
				break;
			case 4:
				((UIElement)qrCode).Visibility = (Visibility)2;
				((UIElement)wifiCode).Visibility = (Visibility)0;
				((UIElement)encryptCode).Visibility = (Visibility)0;
				break;
			default:
				((UIElement)qrCode).Visibility = (Visibility)2;
				((UIElement)wifiCode).Visibility = (Visibility)2;
				((UIElement)encryptCode).Visibility = (Visibility)2;
				break;
			}
		}

		private void ListViewItemSelected(object sender, RoutedEventArgs e)
		{
			ListViewItem val = (ListViewItem)((sender is ListViewItem) ? sender : null);
			if (val != null)
			{
				((FrameworkElement)val).BringIntoView();
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.hardwaretest;component/view/wificonnecthelpwindow.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Expected O, but got Unknown
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0068: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				lv = (ListView)target;
				((Selector)lv).SelectionChanged += new SelectionChangedEventHandler(OnSelectedChanged);
				break;
			case 3:
				qrCode = (Image)target;
				break;
			case 4:
				wifiCode = (Image)target;
				break;
			case 5:
				encryptCode = (Grid)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IStyleConnector.Connect(int connectionId, object target)
		{
			//IL_0004: Unknown result type (might be due to invalid IL or missing references)
			//IL_000a: Expected O, but got Unknown
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Expected O, but got Unknown
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			if (connectionId == 2)
			{
				EventSetter val = new EventSetter();
				val.Event = ListBoxItem.SelectedEvent;
				val.Handler = (Delegate)new RoutedEventHandler(ListViewItemSelected);
				((Collection<SetterBase>)(object)((Style)target).Setters).Add((SetterBase)(object)val);
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.hardwaretest.ViewModel
{
	public class MainFrameViewModel : ViewModelBase
	{
		private object _CurrentView;

		private Visibility _BottomLineVisibility = (Visibility)2;

		private ImageSource _qrImageSource;

		public DeviceEx CurrentDevice
		{
			get
			{
				return Context.CurrentDevice;
			}
			private set
			{
				Context.CurrentDevice = value;
				if (value == null)
				{
					Context.Dispatcher.Invoke((Action)delegate
					{
						BottomLineVisibility = (Visibility)2;
						Context.Switch(ViewType.START);
					});
				}
				else
				{
					Context.Dispatcher.Invoke((Action)delegate
					{
						BottomLineVisibility = (Visibility)0;
						Context.Switch(ViewType.MAIN, reloadData: true);
					});
				}
			}
		}

		public object CurrentView
		{
			get
			{
				return _CurrentView;
			}
			set
			{
				_CurrentView = value;
				((NotifyBase)this).OnPropertyChanged("CurrentView");
			}
		}

		public Visibility BottomLineVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _BottomLineVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_BottomLineVisibility = value;
				((NotifyBase)this).OnPropertyChanged("BottomLineVisibility");
			}
		}

		public ImageSource QrImageSource
		{
			get
			{
				return _qrImageSource;
			}
			set
			{
				_qrImageSource = value;
				((NotifyBase)this).OnPropertyChanged("QrImageSource");
			}
		}

		public override void LoadData()
		{
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			Context.Switch(ViewType.START);
			HostProxy.deviceManager.MasterDeviceChanged += FireMasterDeviceChanged;
			HostProxy.deviceManager.Connecte += delegate(object sender, DeviceEx e)
			{
				e.SoftStatusChanged += OnSoftStatusChanged;
			};
			HostProxy.deviceManager.DisConnecte += delegate(object sender, DeviceEx e)
			{
				e.SoftStatusChanged -= OnSoftStatusChanged;
			};
			HostProxy.deviceManager.WifiMonitoringEndPointChanged += new WirelessMornitoringAddressChangedHandler(OnWifiMonitoringEndPointChanged);
			OnWifiMonitoringEndPointChanged(HostProxy.deviceManager.WirelessWaitForConnectEndPoints);
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			if (masterDevice != null && !masterDevice.IsHWEnable())
			{
				DeviceEx val = HostProxy.deviceManager.ConntectedDevices.FirstOrDefault((DeviceEx p) => p.IsHWEnable());
				if (val != null)
				{
					HostProxy.deviceManager.SwitchDevice(val.Identifer);
				}
			}
			((ViewModelBase)this).LoadData();
		}

		private void OnSoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0025: Invalid comparison between Unknown and I4
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Invalid comparison between Unknown and I4
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Expected O, but got Unknown
			if (HostProxy.HostNavigation.CurrentPluginID != "985c66acdde2483ed96844a6b5ea4337")
			{
				return;
			}
			DeviceEx val = (DeviceEx)((sender is DeviceEx) ? sender : null);
			if ((int)val.SoftStatus == 2)
			{
				if ((int)val.ConnectType == 4)
				{
					GlobalCmdHelper.Instance.Execute((object)new GlobalCmdData
					{
						type = (GlobalCmdType)7
					});
				}
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				if (masterDevice != null && !masterDevice.IsHWEnable() && val.IsHWEnable())
				{
					HostProxy.deviceManager.SwitchDevice(val.Identifer);
				}
			}
		}

		private void FireMasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				e.Current.SoftStatusChanged -= SoftStatusChangedHandler;
				e.Current.SoftStatusChanged += SoftStatusChangedHandler;
			}
			if (e.Previous != null)
			{
				e.Previous.SoftStatusChanged -= SoftStatusChangedHandler;
			}
		}

		private void SoftStatusChangedHandler(object sender, DeviceSoftStateEx e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Invalid comparison between Unknown and I4
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Invalid comparison between Unknown and I4
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Expected O, but got Unknown
			DeviceEx val = (DeviceEx)sender;
			if ((int)e == 2)
			{
				if ((int)val.ConnectType == 4)
				{
					GlobalCmdHelper.Instance.Execute((object)new GlobalCmdData
					{
						type = (GlobalCmdType)7
					});
				}
				SetHWTestDevice(val);
			}
			else
			{
				CurrentDevice = null;
			}
		}

		public void SetHWTestDevice(DeviceEx device)
		{
			if (HostProxy.HostNavigation.CurrentPluginID != "985c66acdde2483ed96844a6b5ea4337")
			{
				return;
			}
			if (device.IsHWEnable())
			{
				CurrentDevice = device;
				return;
			}
			DeviceEx val = HostProxy.deviceManager.ConntectedDevices.FirstOrDefault((DeviceEx p) => p.IsHWEnable());
			if (val != null)
			{
				HostProxy.deviceManager.SwitchDevice(val.Identifer);
			}
			else
			{
				MotoHelperCheck(device);
			}
		}

		private void MotoHelperCheck(DeviceEx device)
		{
			if (MessageWindowHelper.Instance.Show("K0071", "K1475", "K0327", "K1444", false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Result == true)
			{
				AdbDeviceEx val = (AdbDeviceEx)(object)((device is AdbDeviceEx) ? device : null);
				if (val != null)
				{
					val.ForceInstallMa();
				}
				Context.Dispatcher.Invoke((Action)delegate
				{
					//IL_0007: Unknown result type (might be due to invalid IL or missing references)
					//IL_000c: Unknown result type (might be due to invalid IL or missing references)
					//IL_000e: Unknown result type (might be due to invalid IL or missing references)
					//IL_0018: Expected O, but got Unknown
					//IL_0019: Expected O, but got Unknown
					IMessageWindowV6 val2 = (IMessageWindowV6)new WifiConnectHelpWindowV6(true, string.Empty, (WifiTutorialsType)2)
					{
						DataContext = (object)new WifiConnectHelpWindowModelV6((WifiTutorialsType)2)
					};
					MessageWindowHelper.Instance.Show(val2, (bool?)true);
				});
			}
		}

		private void OnWifiMonitoringEndPointChanged(List<Tuple<string, string>> underWatchEndPoints)
		{
			if (underWatchEndPoints == null)
			{
				return;
			}
			StringBuilder sb = new StringBuilder();
			sb.Append($"V:{Configurations.AppMinVersionCodeOfMA}").Append(Environment.NewLine);
			sb.Append($"DV:{Configurations.AppMinVersionCodeOfMoto}").Append(Environment.NewLine);
			foreach (Tuple<string, string> underWatchEndPoint in underWatchEndPoints)
			{
				sb.Append("IP:").Append(underWatchEndPoint.Item1).Append(Environment.NewLine);
			}
			try
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher == null)
				{
					return;
				}
				currentDispatcher.BeginInvoke((Delegate)(Action)delegate
				{
					//IL_0011: Unknown result type (might be due to invalid IL or missing references)
					//IL_0017: Expected O, but got Unknown
					MemoryStream memoryStream = QrCodeUtility.GenerateQrCodeImageStream(sb.ToString());
					BitmapImage val = new BitmapImage();
					val.BeginInit();
					val.StreamSource = new MemoryStream(memoryStream.ToArray());
					val.EndInit();
					try
					{
						QrImageSource = (ImageSource)(object)val;
					}
					catch (Exception)
					{
					}
				}, Array.Empty<object>());
			}
			catch (Exception)
			{
			}
		}
	}
	public class MainViewModel : ViewModelBase
	{
		protected enum TestItemType
		{
			AudioConnection,
			Backlight,
			Battery,
			Bluetooth,
			Display,
			EarSpeaker,
			Earphone,
			Flash,
			FrontCamera,
			GPS,
			GravitySensor,
			Mirophone,
			Multitouch,
			Proximitysensor,
			Mobilenetwork,
			Receiver,
			RearCamera,
			Touchscreen,
			Speaker,
			Volumebutton,
			Vibration,
			WiFi
		}

		protected Dictionary<TestItemType, List<string>> ItemNameMap = new Dictionary<TestItemType, List<string>>
		{
			{
				TestItemType.AudioConnection,
				new List<string> { "Audio connection" }
			},
			{
				TestItemType.Backlight,
				new List<string> { "Back light", "Backlight" }
			},
			{
				TestItemType.Battery,
				new List<string> { "Battery" }
			},
			{
				TestItemType.Bluetooth,
				new List<string> { "Bluetooth" }
			},
			{
				TestItemType.Display,
				new List<string> { "Display" }
			},
			{
				TestItemType.EarSpeaker,
				new List<string> { "Ear Speaker", "EarSpeaker" }
			},
			{
				TestItemType.Earphone,
				new List<string> { "Earphone" }
			},
			{
				TestItemType.Flash,
				new List<string> { "Flash" }
			},
			{
				TestItemType.FrontCamera,
				new List<string> { "Front Camera", "FrontCamera" }
			},
			{
				TestItemType.GPS,
				new List<string> { "GPS" }
			},
			{
				TestItemType.GravitySensor,
				new List<string> { "Gravity Sensor", "GravitySensor" }
			},
			{
				TestItemType.Mirophone,
				new List<string> { "Microphone" }
			},
			{
				TestItemType.Multitouch,
				new List<string> { "Multi touch", "Multi-touch" }
			},
			{
				TestItemType.Proximitysensor,
				new List<string> { "Proximity sensor", "ProximitySensor", "Distance Sensor", "DistanceSensor" }
			},
			{
				TestItemType.Mobilenetwork,
				new List<string> { "Mobile network" }
			},
			{
				TestItemType.Receiver,
				new List<string> { "Receiver" }
			},
			{
				TestItemType.RearCamera,
				new List<string> { "Rear Camera", "RearCamera" }
			},
			{
				TestItemType.Touchscreen,
				new List<string> { "Touchscreen", "Touch Screen", "TouchScreen" }
			},
			{
				TestItemType.Speaker,
				new List<string> { "Speaker" }
			},
			{
				TestItemType.Volumebutton,
				new List<string> { "Volume", "Volume Button" }
			},
			{
				TestItemType.Vibration,
				new List<string> { "Vibration" }
			},
			{
				TestItemType.WiFi,
				new List<string> { "Wi-Fi", "WLAN" }
			}
		};

		protected Dictionary<TestItemType, TestItemViewModel> TestItemMap = new Dictionary<TestItemType, TestItemViewModel>
		{
			{
				TestItemType.AudioConnection,
				new TestItemViewModel("K1494", "Icon-Audio connection@2x.png")
			},
			{
				TestItemType.Backlight,
				new TestItemViewModel("K1495", "Icon-Backlight@2x.png")
			},
			{
				TestItemType.Battery,
				new TestItemViewModel("K1496", "Icon-Battery@2x.png")
			},
			{
				TestItemType.Bluetooth,
				new TestItemViewModel("K1497", "Icon-Buletooth@2x.png")
			},
			{
				TestItemType.Display,
				new TestItemViewModel("K1498", "Icon-Display@2x.png")
			},
			{
				TestItemType.EarSpeaker,
				new TestItemViewModel("K1499", "Icon-Ear Speaker@2x.png")
			},
			{
				TestItemType.Earphone,
				new TestItemViewModel("K1500", "Icon-Earphone@2x.png")
			},
			{
				TestItemType.Flash,
				new TestItemViewModel("K1501", "Icon-Flash@2x.png")
			},
			{
				TestItemType.FrontCamera,
				new TestItemViewModel("K1502", "Icon-Front Camera@2x.png")
			},
			{
				TestItemType.GPS,
				new TestItemViewModel("K1503", "Icon-GPS@2x.png")
			},
			{
				TestItemType.GravitySensor,
				new TestItemViewModel("K1504", "Icon-Gravity sensor@2x.png")
			},
			{
				TestItemType.Mirophone,
				new TestItemViewModel("K1505", "Icon-Miro phone@2x.png")
			},
			{
				TestItemType.Multitouch,
				new TestItemViewModel("K1506", "Icon-Multi touch@2x.png")
			},
			{
				TestItemType.Proximitysensor,
				new TestItemViewModel("K1507", "Icon-Proximity sensor@2x.png")
			},
			{
				TestItemType.Mobilenetwork,
				new TestItemViewModel("K1508", "Icon-Mobile network@2x.png")
			},
			{
				TestItemType.Receiver,
				new TestItemViewModel("K1509", "Icon-Receiver@2x.png")
			},
			{
				TestItemType.RearCamera,
				new TestItemViewModel("K1510", "Icon-Rear Camera@2x.png")
			},
			{
				TestItemType.Touchscreen,
				new TestItemViewModel("K1511", "Icon-Touch screen@2x.png")
			},
			{
				TestItemType.Speaker,
				new TestItemViewModel("K1512", "Icon-Speaker@2x.png")
			},
			{
				TestItemType.Volumebutton,
				new TestItemViewModel("K1513", "Icon-Volume button@2x.png")
			},
			{
				TestItemType.Vibration,
				new TestItemViewModel("K1514", "Icon-Vibration@2x.png")
			},
			{
				TestItemType.WiFi,
				new TestItemViewModel("K1515", "Icon-WIfi@2x.png")
			}
		};

		protected long CurTimestemp;

		private long readlocker;

		private static bool LoopRunning = true;

		private bool _IsEnabled;

		protected BusinessData businessData;

		protected List<HwTestResultModel> TestResult;

		protected List<string> TestItems;

		protected Stopwatch sw = new Stopwatch();

		private bool _Started;

		private Uri _StarttingUri;

		public ObservableCollection<TestItemViewModel> Items { get; set; }

		public ReplayCommand ReadResultCommand { get; }

		public ReplayCommand StartTestCommand { get; }

		public bool IsEnabled
		{
			get
			{
				return _IsEnabled;
			}
			set
			{
				_IsEnabled = value;
				((NotifyBase)this).OnPropertyChanged("IsEnabled");
			}
		}

		public bool Started
		{
			get
			{
				return _Started;
			}
			set
			{
				_Started = value;
				((NotifyBase)this).OnPropertyChanged("Started");
			}
		}

		public Uri StarttingUri
		{
			get
			{
				return _StarttingUri;
			}
			set
			{
				_StarttingUri = value;
				((NotifyBase)this).OnPropertyChanged("StarttingUri");
			}
		}

		public MainViewModel()
		{
			//IL_04c6: Unknown result type (might be due to invalid IL or missing references)
			//IL_04d0: Expected O, but got Unknown
			//IL_04dd: Unknown result type (might be due to invalid IL or missing references)
			//IL_04e7: Expected O, but got Unknown
			Items = new ObservableCollection<TestItemViewModel>();
			StartTestCommand = new ReplayCommand((Action<object>)StartTestCommandHandler);
			ReadResultCommand = new ReplayCommand((Action<object>)ReadResultCommandHandler);
		}

		public override void LoadData(object data)
		{
			StopLoop();
			LoadTestItem();
			((ViewModelBase)this).LoadData(data);
		}

		public void StartLoop()
		{
			Task task = LoopReadResultAsync();
			Task.Run(() => task.Wait(1800000)).ContinueWith(delegate(Task<bool> ar)
			{
				if (!ar.Result)
				{
					if (!Started || FireTimeout() == true)
					{
						StopLoop();
					}
					else
					{
						LoopRunning = false;
						StartLoop();
					}
				}
			});
		}

		private bool? FireTimeout()
		{
			if (HostProxy.HostNavigation.CurrentPluginID != "985c66acdde2483ed96844a6b5ea4337")
			{
				return false;
			}
			return MessageWindowHelper.Instance.Show("K0071", "K1522", "K0571", "K0570", false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Result;
		}

		public void StopLoop()
		{
			LoopRunning = false;
			readlocker = 0L;
			IsEnabled = false;
			Started = false;
		}

		private void LoadTestItem()
		{
			Task.Run(delegate
			{
				DeviceEx currentDevice = Context.CurrentDevice;
				MessageReaderAndWriter val = ((TcpAndroidDevice)((currentDevice is TcpAndroidDevice) ? currentDevice : null)).MessageManager.CreateMessageReaderAndWriter(0);
				try
				{
					if (val == null)
					{
						return (List<string>)null;
					}
					long num = HostProxy.Sequence.New();
					List<string> result = null;
					val.SendAndReceiveSync<string, string>("hardwareTestList", "hardwareTestListResponse", new List<string>(), num, ref result);
					return result;
				}
				finally
				{
					((IDisposable)val)?.Dispose();
				}
			}).ContinueWith(delegate(Task<List<string>> ar)
			{
				Context.Dispatcher.Invoke((Action)delegate
				{
					TestItems = ar.Result;
					Items.Clear();
					if (ar.Result != null && ar.Result.Count > 0)
					{
						ar.Result.ForEach(delegate(string n)
						{
							KeyValuePair<TestItemType, List<string>> keyValuePair = ItemNameMap.FirstOrDefault((KeyValuePair<TestItemType, List<string>> s) => s.Value.Contains<string>(n, StringComparer.CurrentCultureIgnoreCase));
							if (keyValuePair.Value != null && TestItemMap.ContainsKey(keyValuePair.Key))
							{
								TestItemViewModel testItemViewModel = TestItemMap[keyValuePair.Key];
								testItemViewModel.Test = n;
								testItemViewModel.Status = -1;
								testItemViewModel.Idx = Items.Count;
								Items.Add(testItemViewModel);
							}
						});
					}
				});
			});
		}

		private void StartTestCommandHandler(object data)
		{
			StarttingUri = null;
			if (!Started)
			{
				Task.Run(delegate
				{
					//IL_0030: Unknown result type (might be due to invalid IL or missing references)
					//IL_003a: Expected O, but got Unknown
					sw.Reset();
					sw.Start();
					TestResult = null;
					DeviceEx currentDevice = Context.CurrentDevice;
					TcpAndroidDevice val = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
					businessData = new BusinessData((BusinessType)5000, (DeviceEx)(object)val, (BusinessStatus)0);
					MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
					try
					{
						if (val2 == null)
						{
							return (List<JObject>)null;
						}
						long num = HostProxy.Sequence.New();
						List<JObject> result = null;
						val2.SendAndReceiveSync<string, JObject>("hardwareTestHomePage", "hardwareTestHomePageResponse", new List<string>(), num, ref result);
						return result;
					}
					finally
					{
						((IDisposable)val2)?.Dispose();
					}
				}).ContinueWith(delegate(Task<List<JObject>> ar)
				{
					if (ar.Result != null && ar.Result.Count > 0)
					{
						if (((JToken)ar.Result[0]).Value<bool>((object)"value"))
						{
							CurTimestemp = GetStartTimeSpan();
							LogHelper.LogInstance.Debug($"Click start hwtest timestemp: {CurTimestemp}", false);
							Context.Dispatcher.Invoke((Action)delegate
							{
								Started = true;
								IsEnabled = true;
								StarttingUri = new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.hardwaretest;component/Resource/Hardware testing gif.gif");
							});
							HostProxy.BehaviorService.Collect((BusinessType)5000, businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)0, (object)TestItems));
							StartLoop();
						}
						else
						{
							string text = string.Format(LangTranslation.Translate("K1567"), "Mobile Assistant");
							if (Context.CurrentDevice.ConnectedAppType == "Moto")
							{
								text = string.Format(LangTranslation.Translate("K1567"), "Device Help");
							}
							MessageWindowHelper.Instance.Show("K0711", text, "K0327", (string)null, true, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
						}
					}
				});
			}
			else
			{
				StopLoop();
				Task.Run(delegate
				{
					//IL_0034: Unknown result type (might be due to invalid IL or missing references)
					sw.Stop();
					long elapsedMilliseconds = sw.ElapsedMilliseconds;
					ReadResultAsync().Wait();
					BusinessData val = BusinessData.Clone(businessData);
					val.useCaseStep = ((object)(BusinessType)5010/*cast due to .constrained prefix*/).ToString();
					HostProxy.BehaviorService.Collect((BusinessType)5010, val.Update(elapsedMilliseconds, (BusinessStatus)10, (object)TestResult));
				});
			}
		}

		private void ReadResultCommandHandler(object data)
		{
			ReadResultAsync();
		}

		private Task LoopReadResultAsync()
		{
			return Task.Run(delegate
			{
				lock (this)
				{
					LoopRunning = true;
					do
					{
						Thread.Sleep(60000);
						if (!LoopRunning)
						{
							break;
						}
						ReadResultAsync()?.Wait();
					}
					while (LoopRunning && Started);
					Thread.Sleep(10000);
				}
			});
		}

		private Task<List<HwTestResultModel>> ReadResultAsync()
		{
			if (Interlocked.Read(in readlocker) != 0L)
			{
				return null;
			}
			Interlocked.Exchange(ref readlocker, 1L);
			return Task.Run(delegate
			{
				DeviceEx currentDevice = Context.CurrentDevice;
				TcpAndroidDevice val = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
				if (val == null)
				{
					StopLoop();
					return (List<HwTestResultModel>)null;
				}
				MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
				try
				{
					if (val2 == null)
					{
						return (List<HwTestResultModel>)null;
					}
					long num = HostProxy.Sequence.New();
					List<HwTestResultModel> result = null;
					val2.SendAndReceiveSync<string, HwTestResultModel>("readHardwareTestResult", "readHardwareTestResultResponse", new List<string>(), num, ref result);
					return result;
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}).ContinueWith(delegate(Task<List<HwTestResultModel>> ar)
			{
				if (ar.Result != null && ar.Result.Count > 0)
				{
					TestResult = ar.Result;
					LogHelper.LogInstance.Info("Revice readHardwareTestResultResponse: " + JsonHelper.SerializeObject2Json((object)ar.Result), false);
					Context.Dispatcher.Invoke((Action)delegate
					{
						ar.Result.ForEach(delegate(HwTestResultModel n)
						{
							TestItemViewModel testItemViewModel = Items.FirstOrDefault((TestItemViewModel m) => m.Test.Equals(n.hardwareTest, StringComparison.CurrentCultureIgnoreCase));
							if (testItemViewModel != null && n.lastRun >= CurTimestemp)
							{
								testItemViewModel.Status = n.result;
							}
						});
					});
				}
				else
				{
					LogHelper.LogInstance.Info("Revice readHardwareTestResultResponse: null", false);
				}
				Interlocked.Exchange(ref readlocker, 0L);
				return ar.Result;
			});
		}

		private long GetStartTimeSpan()
		{
			DateTime dateTime = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
			DateTime dateTime2 = TimeZone.CurrentTimeZone.ToLocalTime(DateTime.Now).AddDays(-2.0);
			return (long)(dateTime2 - dateTime).TotalMilliseconds;
		}
	}
	public class TestItemViewModel : ViewModelBase
	{
		private ImageSource _Image;

		private string _Result;

		private int _Status;

		private int idx;

		public string Test { get; set; }

		public string Item { get; set; }

		public string Result
		{
			get
			{
				return _Result;
			}
			set
			{
				_Result = value;
				((NotifyBase)this).OnPropertyChanged("Result");
			}
		}

		public ImageSource Image
		{
			get
			{
				return _Image;
			}
			set
			{
				_Image = value;
				((NotifyBase)this).OnPropertyChanged("Image");
			}
		}

		public int Status
		{
			get
			{
				return _Status;
			}
			set
			{
				_Status = value;
				((NotifyBase)this).OnPropertyChanged("Status");
			}
		}

		public Thickness BorderThickness { get; set; }

		public int Idx
		{
			get
			{
				return idx;
			}
			set
			{
				//IL_0061: Unknown result type (might be due to invalid IL or missing references)
				//IL_0031: Unknown result type (might be due to invalid IL or missing references)
				idx = value;
				if (value % 2 == 0)
				{
					BorderThickness = new Thickness(1.0, 0.0, 1.0, 1.0);
				}
				else
				{
					BorderThickness = new Thickness(0.0, 0.0, 1.0, 1.0);
				}
			}
		}

		public TestItemViewModel(string item, string icon)
		{
			//IL_004f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Expected O, but got Unknown
			object obj = Application.Current.Resources[(object)""];
			_Image = (ImageSource)((obj is ImageSource) ? obj : null);
			_Result = "K1491";
			_Status = -1;
			((ViewModelBase)this)..ctor();
			Item = item;
			Image = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.hardwaretest;component/Resource/icons/" + icon));
			Status = -1;
		}
	}
	public class StartViewModel : ViewModelBase
	{
		public ReplayCommand GotoWifiCommand { get; }

		public MainFrameViewModel MainFrame => Context.MainFrame;

		public StartViewModel()
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			GotoWifiCommand = new ReplayCommand((Action<object>)GotoWifiCommandHandler);
		}

		private void GotoWifiCommandHandler(object data)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0019: Expected O, but got Unknown
			IMessageWindowV6 val = (IMessageWindowV6)new WifiConnectHelpWindowV6(true, string.Empty, (WifiTutorialsType)2)
			{
				DataContext = (object)new WifiConnectHelpWindowModelV6((WifiTutorialsType)2)
			};
			MessageWindowHelper.Instance.Show(val, (bool?)true);
		}
	}
	public class WifiConnectHelpWindowModel : ViewModelBase
	{
		private bool _IsPrevBtnEnable;

		private bool _IsNextBtnEnable = true;

		private ImageSource _qrImageSource;

		private string _EncryptCode = RandomAesKeyHelper.Instance.EncryptCode;

		public ReplayCommand CloseCommand { get; }

		public ReplayCommand NextCommand { get; }

		public ReplayCommand PreviousCommand { get; }

		public MainFrameViewModel MainFrame => Context.MainFrame;

		public ObservableCollection<StepViewModel> Steps { get; set; }

		public bool IsPrevBtnEnable
		{
			get
			{
				return _IsPrevBtnEnable;
			}
			set
			{
				_IsPrevBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsPrevBtnEnable");
			}
		}

		public bool IsNextBtnEnable
		{
			get
			{
				return _IsNextBtnEnable;
			}
			set
			{
				_IsNextBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsNextBtnEnable");
			}
		}

		public ImageSource QrImageSource
		{
			get
			{
				return _qrImageSource;
			}
			set
			{
				_qrImageSource = value;
				((NotifyBase)this).OnPropertyChanged("QrImageSource");
			}
		}

		public string EncryptCode
		{
			get
			{
				return _EncryptCode;
			}
			set
			{
				_EncryptCode = value;
				((NotifyBase)this).OnPropertyChanged("EncryptCode");
			}
		}

		public WifiConnectHelpWindowModel()
		{
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Expected O, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			//IL_0099: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a3: Expected O, but got Unknown
			//IL_00db: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e5: Expected O, but got Unknown
			//IL_0116: Unknown result type (might be due to invalid IL or missing references)
			//IL_0120: Expected O, but got Unknown
			//IL_0151: Unknown result type (might be due to invalid IL or missing references)
			//IL_015b: Expected O, but got Unknown
			//IL_018c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0196: Expected O, but got Unknown
			CloseCommand = new ReplayCommand((Action<object>)CloseCommandHandler);
			NextCommand = new ReplayCommand((Action<object>)NextCommandHandler);
			PreviousCommand = new ReplayCommand((Action<object>)PreviousCommandHandler);
			Steps = new ObservableCollection<StepViewModel>();
			Steps.Add(new StepViewModel
			{
				FirstTitle = "1.",
				Content = "K1477",
				TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.hardwaretest;component/Resource/Step1.png")),
				IsSelected = true
			});
			Steps.Add(new StepViewModel
			{
				FirstTitle = "2.",
				Content = "K1479",
				TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.hardwaretest;component/Resource/Step2.png"))
			});
			Steps.Add(new StepViewModel
			{
				FirstTitle = "3.",
				Content = "K1480",
				TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.hardwaretest;component/Resource/Step3.png"))
			});
			Steps.Add(new StepViewModel
			{
				FirstTitle = "4.",
				Content = "K1481",
				TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.hardwaretest;component/Resource/Step4.png"))
			});
			Steps.Add(new StepViewModel
			{
				FirstTitle = "5.",
				Content = "K1482",
				TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.hardwaretest;component/Resource/Step5.png"))
			});
			GenerateQrCode();
		}

		private void CloseCommandHandler(object data)
		{
			object obj = ((data is Window) ? data : null);
			if (obj != null)
			{
				((Window)obj).Close();
			}
		}

		private void NextCommandHandler(object data)
		{
			if (data != null)
			{
				StepViewModel stepViewModel = data as StepViewModel;
				int index = Steps.IndexOf(stepViewModel);
				StepViewModel nextStep = GetNextStep(index);
				if (nextStep != null)
				{
					int num = Steps.IndexOf(nextStep);
					IsNextBtnEnable = num < Steps.Count - 1;
					IsPrevBtnEnable = true;
					stepViewModel.IsSelected = false;
					nextStep.IsSelected = true;
				}
			}
		}

		private void PreviousCommandHandler(object data)
		{
			StepViewModel stepViewModel = data as StepViewModel;
			int index = Steps.IndexOf(stepViewModel);
			StepViewModel prevStep = GetPrevStep(index);
			int num = Steps.IndexOf(prevStep);
			IsPrevBtnEnable = num > 0;
			IsNextBtnEnable = true;
			stepViewModel.IsSelected = false;
			prevStep.IsSelected = true;
		}

		public StepViewModel GetNextStep(int index)
		{
			StepViewModel result = null;
			if (index < Steps.Count - 1)
			{
				result = Steps[++index];
			}
			return result;
		}

		public StepViewModel GetPrevStep(int index)
		{
			StepViewModel result = null;
			if (index > 0)
			{
				result = Steps.Take(index).LastOrDefault();
			}
			return result;
		}

		private void GenerateQrCode()
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Expected O, but got Unknown
			MemoryStream memoryStream = QrCodeUtility.GenerateQrCodeImageStream(Configurations.QrCodeDownloadMaUrl);
			BitmapImage val = new BitmapImage();
			val.BeginInit();
			val.StreamSource = new MemoryStream(memoryStream.ToArray());
			val.EndInit();
			try
			{
				QrImageSource = (ImageSource)(object)val;
			}
			catch (Exception)
			{
			}
		}
	}
	public class StepViewModel : ViewModelBase
	{
		private bool isSelected;

		private string firstTitle;

		private string content;

		private ImageSource tipImage;

		public bool IsSelected
		{
			get
			{
				return isSelected;
			}
			set
			{
				isSelected = value;
				((NotifyBase)this).OnPropertyChanged("IsSelected");
			}
		}

		public string FirstTitle
		{
			get
			{
				return firstTitle;
			}
			set
			{
				firstTitle = value;
				((NotifyBase)this).OnPropertyChanged("FirstTitle");
			}
		}

		public string Content
		{
			get
			{
				return content;
			}
			set
			{
				content = value;
				((NotifyBase)this).OnPropertyChanged("Content");
			}
		}

		public ImageSource TipImage
		{
			get
			{
				return tipImage;
			}
			set
			{
				tipImage = value;
				((NotifyBase)this).OnPropertyChanged("TipImage");
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.hardwaretest.Model
{
	public class HwTestResultModel
	{
		public string hardwareTest { get; set; }

		public long lastRun { get; set; }

		public int result { get; set; }
	}
}
