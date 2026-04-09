using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Security;
using System.Security.Permissions;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
using FFmpeg.AutoGen;
using GoogleAnalytics;
using Microsoft.Win32;
using NAudio.Wave;
using NAudio.Wave.SampleProviders;
using Newtonsoft.Json;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Config;
using SuperWebSocket;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.common.utilities;
using lenovo.mbg.service.framework.devicemgt;
using lenovo.mbg.service.framework.lang;
using lenovo.mbg.service.framework.services;
using lenovo.mbg.service.framework.services.Device;
using lenovo.mbg.service.framework.services.Model;
using lenovo.mbg.service.framework.socket;
using lenovo.mbg.service.lmsa.common.ImportExport;
using lenovo.mbg.service.lmsa.hostproxy;
using lenovo.mbg.service.lmsa.phoneManager.Business;
using lenovo.mbg.service.lmsa.phoneManager.Model;
using lenovo.mbg.service.lmsa.tooBox.Business;
using lenovo.mbg.service.lmsa.toolbox.Business;
using lenovo.mbg.service.lmsa.toolbox.GifMaker;
using lenovo.mbg.service.lmsa.toolbox.GifMaker.Comm;
using lenovo.mbg.service.lmsa.toolbox.GifMaker.Gif.Encode;
using lenovo.mbg.service.lmsa.toolbox.GifMaker.Gif.PlotCore;
using lenovo.mbg.service.lmsa.toolbox.GifMaker.Model;
using lenovo.mbg.service.lmsa.toolbox.GifMaker.View;
using lenovo.mbg.service.lmsa.toolbox.GifMaker.ViewModel;
using lenovo.mbg.service.lmsa.toolbox.Ringtone.Core;
using lenovo.mbg.service.lmsa.toolbox.Ringtone.View;
using lenovo.mbg.service.lmsa.toolbox.ScreenCapture.BLL;
using lenovo.mbg.service.lmsa.toolbox.ScreenCapture.Model;
using lenovo.mbg.service.lmsa.toolbox.UserControlsV6;
using lenovo.mbg.service.lmsa.toolbox.ViewModelV6;
using lenovo.themes.generic;
using lenovo.themes.generic.Attributes;
using lenovo.themes.generic.Component.DataListControl;
using lenovo.themes.generic.Controls;
using lenovo.themes.generic.Controls.Windows;
using lenovo.themes.generic.ControlsV6;
using lenovo.themes.generic.Dialog;
using lenovo.themes.generic.Interactivity.Ex;
using lenovo.themes.generic.ViewModelV6;
using lenovo.themes.generic.ViewModels;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.lmsa.toolbox")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("05a36776ecc34a8d9ce981a1d26337bb")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: ThemeInfo(/*Could not decode attribute arguments.*/)]
[assembly: AssemblyFileVersion("6.6.2.4")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: SecurityPermission(SecurityAction.RequestMinimum, SkipVerification = true)]
[assembly: AssemblyVersion("6.6.2.4")]
[module: UnverifiableCode]
namespace lenovo.mbg.service.lmsa.tooBox.Business
{
	public class DeviceClipboardManagement : IDeviceClipboard
	{
		public string GetClipboardInfo()
		{
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Expected O, but got Unknown
			//IL_0068: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Invalid comparison between Unknown and I4
			string result = string.Empty;
			Stopwatch stopwatch = new Stopwatch();
			stopwatch.Start();
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			BusinessData val2 = new BusinessData((BusinessType)2120, (DeviceEx)(object)val, (BusinessStatus)0);
			if (val == null)
			{
				stopwatch.Stop();
				HostProxy.BehaviorService.Collect((BusinessType)2120, val2.Update(stopwatch.ElapsedMilliseconds, (BusinessStatus)20, (object)null));
				return result;
			}
			if (((DeviceEx)val).Property.ApiLevel >= 29 && (int)((DeviceEx)val).ConnectType != 4 && !((DeviceEx)val).DeviceOperator.Command("shell dumpsys \"window | grep mFocusedApp\"", -1, ((DeviceEx)val).Identifer).Contains("com.motorola.lmsaappclient"))
			{
				val.FocuseApp();
			}
			MessageReaderAndWriter val3 = val.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (val3 == null)
				{
					return result;
				}
				if (val3 == null)
				{
					return result;
				}
				long num = HostProxy.Sequence.New();
				List<string> list = null;
				bool flag = false;
				if (val3.SendAndReceiveSync<string, string>("getDeviceClipboardInfo", "getDeviceClipboardInfoResponse", new List<string>(), num, ref list) && list != null && list != null && list[1].Contains("success"))
				{
					flag = true;
					result = GlobalFun.DecodeBase64(list[2]);
				}
				stopwatch.Stop();
				HostProxy.BehaviorService.Collect((BusinessType)2120, val2.Update(stopwatch.ElapsedMilliseconds, (BusinessStatus)(flag ? 10 : 20), (object)null));
				return result;
			}
			finally
			{
				((IDisposable)val3)?.Dispose();
			}
		}

		public bool ImportClipboardInfo(string ClipBoardContent)
		{
			bool result = false;
			List<PropItem> list = null;
			if (!string.IsNullOrEmpty(ClipBoardContent))
			{
				List<string> list2 = new List<string> { "text/plain", ClipBoardContent };
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
				if (val == null)
				{
					return false;
				}
				MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
				try
				{
					if (val2 == null)
					{
						return false;
					}
					long num = HostProxy.Sequence.New();
					if (val2.SendAndReceiveSync<string, PropItem>("importClipboardInfo", "importClipboardInfoResponse", list2, num, ref list) && list != null)
					{
						result = list.Exists((PropItem m) => "success".Equals(m.Value));
					}
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
			return result;
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox
{
	public class ToolboxFrameV6 : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public ToolBoxListViewModelV6 VM { get; }

		public ToolboxFrameV6()
		{
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Expected O, but got Unknown
			InitializeComponent();
			VM = new ToolBoxListViewModelV6();
			((FrameworkElement)this).DataContext = VM;
			((FrameworkElement)this).Loaded += (RoutedEventHandler)delegate
			{
				HostProxy.deviceManager.MasterDeviceChanged += DeviceManager_MasterDeviceChanged;
			};
		}

		private void DeviceManager_MasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				e.Current.SoftStatusChanged += Current_SoftStatusChanged;
			}
			if (e.Previous != null)
			{
				e.Previous.SoftStatusChanged -= Current_SoftStatusChanged;
			}
		}

		private void Current_SoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				//IL_002f: Unknown result type (might be due to invalid IL or missing references)
				//IL_0034: Unknown result type (might be due to invalid IL or missing references)
				//IL_0035: Unknown result type (might be due to invalid IL or missing references)
				//IL_0038: Unknown result type (might be due to invalid IL or missing references)
				//IL_003a: Invalid comparison between Unknown and I4
				if (VM.CurrentView is ClipboardUserControlV6 || VM.CurrentView is ScreenCaptureFrameV6)
				{
					DeviceSoftStateEx val = e;
					if ((int)val != 0)
					{
						if ((int)val == 2)
						{
							ToolboxViewContext.SingleInstance.CloseTutorialsView();
						}
					}
					else
					{
						ToolboxViewContext.SingleInstance.ShowTutorialsView();
					}
				}
			});
		}

		private void ConnectButtonClick(object sender, RoutedEventArgs e)
		{
			ToolboxViewContext.SingleInstance.ShowTutorialsView();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/toolboxframev6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Expected O, but got Unknown
			if (connectionId == 1)
			{
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(ConnectButtonClick);
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class ToolBoxListViewModelV6 : ViewModelBase
	{
		private FrameworkElement _CurrentView;

		private Visibility _mainViewVisbility;

		private Visibility _toolViewVisbility = (Visibility)2;

		public ObservableCollection<ToolBoxItemViewModel> ToolboxList { get; set; }

		public ReplayCommand ClickCommand { get; private set; }

		public ReplayCommand BackCommand { get; private set; }

		public FrameworkElement CurrentView
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

		public Visibility MainViewVisbility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _mainViewVisbility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_mainViewVisbility = value;
				((NotifyBase)this).OnPropertyChanged("MainViewVisbility");
			}
		}

		public Visibility ToolViewVisbility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _toolViewVisbility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_toolViewVisbility = value;
				((NotifyBase)this).OnPropertyChanged("ToolViewVisbility");
			}
		}

		public ToolBoxListViewModelV6()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Expected O, but got Unknown
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Expected O, but got Unknown
			ClickCommand = new ReplayCommand((Action<object>)ClickCommandCommandHandler);
			BackCommand = new ReplayCommand((Action<object>)BackCommandCommandHandler);
			ToolboxList = new ObservableCollection<ToolBoxItemViewModel>();
			ToolboxList.Add(new ToolBoxItemViewModel
			{
				ToolboxIcon = "pack://application:,,,/lenovo.mbg.service.lmsa.toolBox;component/ResourcesV6/icon_clipboard.png",
				ToolboxTitle = "Clipboard",
				ToolboxDescrption = "Copy text between device and PC",
				ToolBoxType = ToolBoxType.Clipboard,
				ItemClickCommand = ClickCommand
			});
			ToolboxList.Add(new ToolBoxItemViewModel
			{
				ToolboxIcon = "pack://application:,,,/lenovo.mbg.service.lmsa.toolBox;component/ResourcesV6/icon_ringtone.png",
				ToolboxTitle = "Ringtone Maker",
				ToolboxDescrption = "Make ringtone from your music",
				ToolBoxType = ToolBoxType.RingtoneMaker,
				ItemClickCommand = ClickCommand
			});
			ToolboxList.Add(new ToolBoxItemViewModel
			{
				ToolboxIcon = "pack://application:,,,/lenovo.mbg.service.lmsa.toolBox;component/ResourcesV6/icon_gif_maker.png",
				ToolboxTitle = "GIF Maker",
				ToolboxDescrption = "Make animated GIFs from pictures on PC",
				ToolBoxType = ToolBoxType.GIFMaker,
				ItemClickCommand = ClickCommand
			});
			ToolboxList.Add(new ToolBoxItemViewModel
			{
				ToolboxIcon = "pack://application:,,,/lenovo.mbg.service.lmsa.toolBox;component/ResourcesV6/icon_screen_recorder.png",
				ToolboxTitle = "Screen Recorder",
				ToolboxDescrption = "Record device screen",
				ToolBoxType = ToolBoxType.ScreenRecorder,
				ItemClickCommand = ClickCommand
			});
		}

		private void ClickCommandCommandHandler(object prameter)
		{
			MainViewVisbility = (Visibility)2;
			ToolViewVisbility = (Visibility)0;
			switch ((ToolBoxType)prameter)
			{
			case ToolBoxType.Clipboard:
				OnClipBoard();
				break;
			case ToolBoxType.GIFMaker:
				OnGifMaker();
				break;
			case ToolBoxType.RingtoneMaker:
				OnRingtoneMaker();
				break;
			case ToolBoxType.ScreenRecorder:
				OnScreenCapture();
				break;
			}
		}

		private void BackCommandCommandHandler(object prameter)
		{
			MainViewVisbility = (Visibility)0;
			ToolViewVisbility = (Visibility)2;
			((IDisposable)CurrentView).Dispose();
			CurrentView = null;
		}

		private void OnClipBoard()
		{
			HostProxy.BehaviorService.Collect((BusinessType)2100, (BusinessData)null);
			((SimpleTracker)Plugin.Tracker).Send(HitBuilder.CreateCustomEvent(Plugin.Category, "clipboardClick", "Click clipboard tool button", 0L).Build());
			((SimpleTracker)Plugin.Tracker).Send(HitBuilder.CreateScreenView("lmsa-plugin-toolbox-clipboard").Build());
			CurrentView = (FrameworkElement)(object)new ClipboardUserControlV6();
		}

		private void OnGifMaker()
		{
			HostProxy.BehaviorService.Collect((BusinessType)2200, (BusinessData)null);
			((SimpleTracker)Plugin.Tracker).Send(HitBuilder.CreateCustomEvent(Plugin.Category, "gifMakerClick", "Click GIF Maker tool button", 0L).Build());
			((SimpleTracker)Plugin.Tracker).Send(HitBuilder.CreateScreenView("lmsa-plugin-toolbox-gifmaker").Build());
			CurrentView = (FrameworkElement)(object)new GifMakerViewV6();
		}

		private void OnRingtoneMaker()
		{
			HostProxy.BehaviorService.Collect((BusinessType)2300, (BusinessData)null);
			((SimpleTracker)Plugin.Tracker).Send(HitBuilder.CreateCustomEvent(Plugin.Category, "ringtoneMakerClick", "Click Ringtone Maker tool button", 0L).Build());
			((SimpleTracker)Plugin.Tracker).Send(HitBuilder.CreateScreenView("lmsa-plugin-toolbox-ringtonemaker").Build());
			CurrentView = (FrameworkElement)(object)new RingtoneMakerViewV6();
		}

		private void OnScreenCapture()
		{
			HostProxy.BehaviorService.Collect((BusinessType)2400, (BusinessData)null);
			((SimpleTracker)Plugin.Tracker).Send(HitBuilder.CreateCustomEvent(Plugin.Category, "screenCaptureClick", "Click Screen Capture tool button", 0L).Build());
			((SimpleTracker)Plugin.Tracker).Send(HitBuilder.CreateScreenView("lmsa-plugin-toolbox-screencapture").Build());
			CurrentView = (FrameworkElement)(object)new ScreenCaptureFrameV6();
		}
	}
	public class ToolBoxItemViewModel : ViewModelBase
	{
		public ToolBoxType ToolBoxType { get; set; }

		public string ToolboxIcon { get; set; }

		public string ToolboxTitle { get; set; }

		public string ToolboxDescrption { get; set; }

		public ReplayCommand ItemClickCommand { get; set; }
	}
	public enum ToolBoxType
	{
		Clipboard,
		RingtoneMaker,
		GIFMaker,
		ScreenRecorder
	}
	public class ClipboardUserControl : Window, IComponentConnector
	{
		private const int WM_CLIPBOARDUPDATE = 797;

		private Action ClipboardChangedHandle;

		private DeviceClipboardManagement mgt = new DeviceClipboardManagement();

		private string _UID;

		private IntPtr handle;

		internal Button toPhone;

		internal Button fromPhone;

		internal Grid clipboardContent;

		internal RichTextBox clipboardTxt;

		internal Grid deviceConnectedTips;

		private bool _contentLoaded;

		[DllImport("user32.dll")]
		public static extern bool AddClipboardFormatListener(IntPtr hwnd);

		[DllImport("user32.dll")]
		public static extern bool RemoveClipboardFormatListener(IntPtr hwnd);

		protected virtual IntPtr WndProc(IntPtr hwnd, int msg, IntPtr wParam, IntPtr lParam, ref bool handled)
		{
			if (msg == 797 && ClipboardChangedHandle != null)
			{
				ClipboardChangedHandle();
			}
			return IntPtr.Zero;
		}

		public ClipboardUserControl(string uid)
		{
			InitializeComponent();
			_UID = uid;
			InitializeAction();
		}

		protected override void OnClosing(CancelEventArgs e)
		{
			((Window)this).OnClosing(e);
			if (handle != IntPtr.Zero)
			{
				RemoveClipboardFormatListener(handle);
			}
		}

		private void InitializeAction()
		{
			ClipboardChangedHandle = delegate
			{
				try
				{
					IDataObject dataObject = Clipboard.GetDataObject();
					if (dataObject.GetDataPresent(DataFormats.UnicodeText))
					{
						object dataValue = dataObject.GetData(DataFormats.UnicodeText);
						if (dataValue != null)
						{
							Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
							if (currentDispatcher != null)
							{
								currentDispatcher.Invoke((Action)delegate
								{
									//IL_002c: Unknown result type (might be due to invalid IL or missing references)
									//IL_0032: Expected O, but got Unknown
									//IL_003d: Unknown result type (might be due to invalid IL or missing references)
									//IL_0043: Expected O, but got Unknown
									((TextElementCollection<Block>)(object)clipboardTxt.Document.Blocks).Clear();
									if (!string.IsNullOrEmpty(dataValue.ToString()))
									{
										Paragraph val = new Paragraph();
										Run val2 = new Run(dataValue.ToString());
										((TextElementCollection<Inline>)(object)val.Inlines).Add((Inline)(object)val2);
										((TextElementCollection<Block>)(object)clipboardTxt.Document.Blocks).Add((Block)(object)val);
									}
								});
							}
						}
						else
						{
							Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
							if (currentDispatcher2 != null)
							{
								currentDispatcher2.Invoke((Action)delegate
								{
									((TextElementCollection<Block>)(object)clipboardTxt.Document.Blocks).Clear();
								});
							}
						}
					}
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("Clipboard changed handle throw exception:" + ex.ToString(), false);
				}
			};
		}

		protected override void OnSourceInitialized(EventArgs e)
		{
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			((Window)this).OnSourceInitialized(e);
			win_SourceInitialized(this, e);
			handle = new WindowInteropHelper((Window)(object)this).Handle;
			AddClipboardFormatListener(handle);
		}

		private void win_SourceInitialized(object sender, EventArgs e)
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			PresentationSource obj = PresentationSource.FromVisual((Visual)(object)this);
			HwndSource val = (HwndSource)(object)((obj is HwndSource) ? obj : null);
			if (val != null)
			{
				val.AddHook(new HwndSourceHook(WndProc));
			}
		}

		private void CToPhoneClick(object sender, RoutedEventArgs e)
		{
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Expected O, but got Unknown
			TextRange clipboardContent = new TextRange(clipboardTxt.Document.ContentStart, clipboardTxt.Document.ContentEnd);
			if (!string.IsNullOrEmpty(clipboardContent.Text))
			{
				Task.Run(delegate
				{
					//IL_0068: Unknown result type (might be due to invalid IL or missing references)
					Stopwatch stopwatch = new Stopwatch();
					stopwatch.Start();
					bool flag = mgt.ImportClipboardInfo(clipboardContent.Text.Trim(new char[1] { '\n' }).Trim(new char[1] { '\r' }));
					stopwatch.Stop();
					HostProxy.BehaviorService.Collect((BusinessType)2110, new BusinessData((BusinessType)2110, HostProxy.deviceManager.MasterDevice, (BusinessStatus)0).Update(stopwatch.ElapsedMilliseconds, (BusinessStatus)(flag ? 10 : 20), (object)null));
					return flag;
				}).GetAwaiter().OnCompleted(delegate
				{
					MessageWindowHelper.Instance.Show("K0185", "K0370", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				});
			}
		}

		private void CFormPhoneClick(object sender, RoutedEventArgs e)
		{
			((UIElement)fromPhone).IsEnabled = false;
			LogHelper.LogInstance.Info("get clipboard content", false);
			Task<string> task = Task.Run(() => mgt.GetClipboardInfo());
			task.GetAwaiter().OnCompleted(delegate
			{
				string clipboardContent = task.Result;
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						try
						{
							Clipboard.SetDataObject((object)clipboardContent);
						}
						catch (Exception)
						{
						}
						((UIElement)fromPhone).IsEnabled = true;
					});
				}
			});
		}

		public void DeviceConnected()
		{
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					//IL_0040: Unknown result type (might be due to invalid IL or missing references)
					//IL_0045: Unknown result type (might be due to invalid IL or missing references)
					//IL_004f: Expected O, but got Unknown
					//IL_005f: Unknown result type (might be due to invalid IL or missing references)
					//IL_0064: Unknown result type (might be due to invalid IL or missing references)
					//IL_006e: Expected O, but got Unknown
					//IL_0083: Unknown result type (might be due to invalid IL or missing references)
					//IL_0088: Unknown result type (might be due to invalid IL or missing references)
					//IL_0092: Expected O, but got Unknown
					//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
					//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
					//IL_00b6: Expected O, but got Unknown
					((UIElement)deviceConnectedTips).Visibility = (Visibility)2;
					((UIElement)clipboardContent).Visibility = (Visibility)0;
					((UIElement)toPhone).IsEnabled = true;
					((UIElement)fromPhone).IsEnabled = true;
					((Control)toPhone).Background = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2"));
					((Control)fromPhone).Background = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2"));
					((Control)toPhone).Foreground = (Brush)new SolidColorBrush(Color.FromRgb(byte.MaxValue, byte.MaxValue, byte.MaxValue));
					((Control)fromPhone).Foreground = (Brush)new SolidColorBrush(Color.FromRgb(byte.MaxValue, byte.MaxValue, byte.MaxValue));
				});
			}
		}

		public void DeviceDisconnected()
		{
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					//IL_005a: Unknown result type (might be due to invalid IL or missing references)
					//IL_005f: Unknown result type (might be due to invalid IL or missing references)
					//IL_0069: Expected O, but got Unknown
					//IL_007e: Unknown result type (might be due to invalid IL or missing references)
					//IL_0083: Unknown result type (might be due to invalid IL or missing references)
					//IL_008d: Expected O, but got Unknown
					//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
					//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
					//IL_00b1: Expected O, but got Unknown
					//IL_00c6: Unknown result type (might be due to invalid IL or missing references)
					//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
					//IL_00d5: Expected O, but got Unknown
					((TextElementCollection<Block>)(object)clipboardTxt.Document.Blocks).Clear();
					((UIElement)deviceConnectedTips).Visibility = (Visibility)0;
					((UIElement)clipboardContent).Visibility = (Visibility)2;
					((UIElement)toPhone).IsEnabled = false;
					((UIElement)fromPhone).IsEnabled = false;
					((Control)toPhone).Foreground = (Brush)new SolidColorBrush(Color.FromRgb((byte)136, (byte)136, (byte)136));
					((Control)fromPhone).Foreground = (Brush)new SolidColorBrush(Color.FromRgb((byte)136, (byte)136, (byte)136));
					((Control)toPhone).Background = (Brush)new SolidColorBrush(Color.FromRgb((byte)221, (byte)221, (byte)221));
					((Control)fromPhone).Background = (Brush)new SolidColorBrush(Color.FromRgb((byte)221, (byte)221, (byte)221));
				});
			}
		}

		private void closeBtn_Click(object sender, RoutedEventArgs e)
		{
			((Window)this).DialogResult = true;
			((TextElementCollection<Block>)(object)clipboardTxt.Document.Blocks).Clear();
			RemoveClipboardFormatListener(handle);
			ToolboxViewContext.SingleInstance.HostOperationService.CloseMaskLayer(_UID);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/usercontrols/clipboardusercontrol.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0049: Expected O, but got Unknown
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Expected O, but got Unknown
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Expected O, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			//IL_0087: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Expected O, but got Unknown
			//IL_0094: Unknown result type (might be due to invalid IL or missing references)
			//IL_009e: Expected O, but got Unknown
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(closeBtn_Click);
				break;
			case 2:
				toPhone = (Button)target;
				((ButtonBase)toPhone).Click += new RoutedEventHandler(CToPhoneClick);
				break;
			case 3:
				fromPhone = (Button)target;
				((ButtonBase)fromPhone).Click += new RoutedEventHandler(CFormPhoneClick);
				break;
			case 4:
				clipboardContent = (Grid)target;
				break;
			case 5:
				clipboardTxt = (RichTextBox)target;
				break;
			case 6:
				deviceConnectedTips = (Grid)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class ToolboxViewContext
	{
		private static ToolboxViewContext _singleInstance;

		private IHost _host;

		private DeviceTutorialsDialogViewV6 m_DeviceTutorialsViewV6;

		private volatile bool m_MessageBoxShow;

		public static ToolboxViewContext SingleInstance
		{
			get
			{
				if (_singleInstance == null)
				{
					_singleInstance = new ToolboxViewContext();
				}
				return _singleInstance;
			}
		}

		public IHost Host
		{
			get
			{
				return _host;
			}
			set
			{
				_host = value;
			}
		}

		public IHostOperationService HostOperationService { get; private set; }

		public ILanguage LanuageService { get; private set; }

		public IMessageBox MessageBox { get; set; }

		public void Initialize()
		{
			Host = HostProxy.Host;
			HostOperationService = HostProxy.HostOperationService;
			LanuageService = HostProxy.LanguageService;
		}

		public void ShowTutorialsView()
		{
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Expected O, but got Unknown
			if (!m_MessageBoxShow && !(HostProxy.HostNavigation.CurrentPluginID != "dd537b5c6c074ae49cc8b0b2965ce54a"))
			{
				m_MessageBoxShow = true;
				m_DeviceTutorialsViewV6 = new DeviceTutorialsDialogViewV6(false);
				((Window)m_DeviceTutorialsViewV6).Closed += delegate
				{
					m_MessageBoxShow = false;
				};
				MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)m_DeviceTutorialsViewV6, (bool?)true);
			}
		}

		public void CloseTutorialsView()
		{
			m_MessageBoxShow = false;
			DeviceTutorialsDialogViewV6 deviceTutorialsViewV = m_DeviceTutorialsViewV6;
			if (deviceTutorialsViewV != null)
			{
				((Window)deviceTutorialsViewV).Close();
			}
		}
	}
	public class ImageButton : Button
	{
		public static readonly DependencyProperty ImageBackgroundProperty = DependencyProperty.Register("ImageBackground", typeof(ImageSource), typeof(ImageButton), new PropertyMetadata((PropertyChangedCallback)null));

		public static readonly DependencyProperty MouseDownImageProperty = DependencyProperty.Register("MouseDownImage", typeof(ImageSource), typeof(ImageButton), new PropertyMetadata((PropertyChangedCallback)null));

		public ImageSource ImageBackground
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Expected O, but got Unknown
				return (ImageSource)((DependencyObject)this).GetValue(ImageBackgroundProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ImageBackgroundProperty, (object)value);
			}
		}

		public ImageSource MouseDownImage
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Expected O, but got Unknown
				return (ImageSource)((DependencyObject)this).GetValue(MouseDownImageProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(MouseDownImageProperty, (object)value);
			}
		}
	}
	public class MainWindow : Window, IComponentConnector
	{
		private bool _contentLoaded;

		public MainWindow()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/mainwindow.xaml", UriKind.Relative);
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
	[PluginExport(typeof(IPlugin), "dd537b5c6c074ae49cc8b0b2965ce54a")]
	public class Plugin : PluginBase
	{
		private ToolboxFrameV6 _toolBoxWindow;

		private string abdPath = string.Empty;

		public const string toolboxScreenName = "lmsa-plugin-Toolbox-main";

		public const string clipboardScreenName = "lmsa-plugin-toolbox-clipboard";

		public const string gifMakerScreenName = "lmsa-plugin-toolbox-gifmaker";

		public const string ringtoneMakerScreenName = "lmsa-plugin-toolbox-ringtonemaker";

		public const string screenCaptureScreenName = "lmsa-plugin-toolbox-screencapture";

		public static readonly string Category = "Plugin-Toolbox";

		public static Tracker Tracker => HostProxy.GoogleAnalyticsTracker.Tracker;

		public override void Init()
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			ResourceDictionary val = new ResourceDictionary();
			val.Source = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/Themes/AllResourceDir.xaml", UriKind.Relative);
			Application.Current.Resources.MergedDictionaries.Add(val);
			ToolboxViewContext.SingleInstance.Initialize();
		}

		public override FrameworkElement CreateControl(IMessageBox iMsg)
		{
			string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Temp");
			if (!Directory.Exists(path))
			{
				Directory.CreateDirectory(path);
			}
			_toolBoxWindow = new ToolboxFrameV6();
			ToolboxViewContext.SingleInstance.MessageBox = iMsg;
			return (FrameworkElement)(object)_toolBoxWindow;
		}

		public override void Dispose()
		{
			string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Temp");
			if (Directory.Exists(path))
			{
				Directory.Delete(path, recursive: true);
			}
			((PluginBase)this).Dispose();
		}

		public override bool CanClose()
		{
			return false;
		}

		public override bool IsExecuteWork()
		{
			return false;
		}

		public override bool IsNonBusinessPage()
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Invalid comparison between Unknown and I4
			if (_toolBoxWindow != null)
			{
				return (int)_toolBoxWindow.VM.MainViewVisbility == 0;
			}
			return true;
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.Properties
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
					resourceMan = new ResourceManager("lenovo.mbg.service.lmsa.toolbox.Properties.Resources", typeof(Resources).Assembly);
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
	[GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "14.0.0.0")]
	internal sealed class Settings : ApplicationSettingsBase
	{
		private static Settings defaultInstance = (Settings)(object)SettingsBase.Synchronized((SettingsBase)(object)new Settings());

		public static Settings Default => defaultInstance;
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.ViewModelV6
{
	public class GifMakerViewModelV6 : ViewModelBase
	{
		private GifMakerViewV6 wnd;

		public static ICommand AddImgCmd = (ICommand)new RoutedCommand();

		public static ICommand ImagePlotCmd = (ICommand)new RoutedCommand();

		public static ICommand DelImgCmd = (ICommand)new RoutedCommand();

		private volatile bool _createGifCancel;

		public ObservableCollection<ImageEntitiy> ImageArr { get; set; }

		public ICommand CloseCmd { get; set; }

		public ICommand AddDelayCmd { get; set; }

		public ICommand DelDelayCmd { get; set; }

		public ICommand SelDirPathCmd { get; set; }

		public ICommand PlayerCmd { get; set; }

		public ICommand CreateGifCmd { get; set; }

		public GifMakerModel Model { get; set; }

		public GifMakerViewModelV6(GifMakerViewV6 view)
		{
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Expected O, but got Unknown
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Expected O, but got Unknown
			//IL_0089: Unknown result type (might be due to invalid IL or missing references)
			//IL_0093: Expected O, but got Unknown
			//IL_008e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Expected O, but got Unknown
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Expected O, but got Unknown
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Expected O, but got Unknown
			//IL_00c1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cb: Expected O, but got Unknown
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d7: Expected O, but got Unknown
			//IL_00ef: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f9: Expected O, but got Unknown
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fe: Expected O, but got Unknown
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			//IL_010a: Expected O, but got Unknown
			//IL_0122: Unknown result type (might be due to invalid IL or missing references)
			//IL_012c: Expected O, but got Unknown
			//IL_0127: Unknown result type (might be due to invalid IL or missing references)
			//IL_0131: Expected O, but got Unknown
			//IL_0133: Unknown result type (might be due to invalid IL or missing references)
			//IL_013d: Expected O, but got Unknown
			//IL_0155: Unknown result type (might be due to invalid IL or missing references)
			//IL_015f: Expected O, but got Unknown
			//IL_015a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0164: Expected O, but got Unknown
			//IL_0166: Unknown result type (might be due to invalid IL or missing references)
			//IL_0170: Expected O, but got Unknown
			//IL_0188: Unknown result type (might be due to invalid IL or missing references)
			//IL_0192: Expected O, but got Unknown
			//IL_018d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0197: Expected O, but got Unknown
			//IL_01af: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b9: Expected O, but got Unknown
			//IL_01b4: Unknown result type (might be due to invalid IL or missing references)
			//IL_01be: Expected O, but got Unknown
			wnd = view;
			Model = new GifMakerModel();
			CloseCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(CloseCmd, (ExecutedRoutedEventHandler)delegate
			{
				ImageArr.Clear();
				Model.GifImage = null;
				wnd = null;
			}));
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(AddImgCmd, (ExecutedRoutedEventHandler)delegate
			{
				//IL_000e: Unknown result type (might be due to invalid IL or missing references)
				//IL_0018: Expected O, but got Unknown
				OpenFileDialog dlg = new OpenFileDialog();
				((FileDialog)dlg).Filter = "Image|*.jpg;*.jpeg;*.png;*.bmp";
				dlg.Multiselect = true;
				if (((CommonDialog)dlg).ShowDialog() == true)
				{
					Task.Factory.StartNew(delegate
					{
						string[] fileNames = ((FileDialog)dlg).FileNames;
						foreach (string filePath in fileNames)
						{
							ImageEntitiy entity = new ImageEntitiy
							{
								IsImage = true,
								FilePath = filePath,
								Index = Guid.NewGuid().ToString()
							};
							if (entity.BitmapImage != null)
							{
								((DispatcherObject)wnd).Dispatcher.BeginInvoke((Delegate)(Action)delegate
								{
									ImageArr.Insert(ImageArr.Count - 1, entity);
								}, Array.Empty<object>());
							}
						}
					});
				}
			}));
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(DelImgCmd, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				ImageEntitiy imageEntitiy = ImageArr.FirstOrDefault((ImageEntitiy p) => p.Index == (string)e.Parameter);
				imageEntitiy.BitmapImage = null;
				ImageArr.Remove(imageEntitiy);
			}));
			AddDelayCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(AddDelayCmd, (ExecutedRoutedEventHandler)delegate
			{
				if (Model.GifDelay < 30)
				{
					GifMakerModel model = Model;
					int gifDelay = model.GifDelay + 1;
					model.GifDelay = gifDelay;
				}
			}));
			DelDelayCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(DelDelayCmd, (ExecutedRoutedEventHandler)delegate
			{
				if (Model.GifDelay > 1)
				{
					GifMakerModel model = Model;
					int gifDelay = model.GifDelay - 1;
					model.GifDelay = gifDelay;
				}
			}));
			SelDirPathCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(SelDirPathCmd, (ExecutedRoutedEventHandler)delegate
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Expected O, but got Unknown
				//IL_0021: Unknown result type (might be due to invalid IL or missing references)
				//IL_0026: Invalid comparison between I4 and Unknown
				FolderBrowserDialog val = new FolderBrowserDialog();
				val.SelectedPath = Model.GifPath;
				val.ShowNewFolderButton = true;
				if (1 == (int)FolderBrowserLauncher.ShowFolderBrowser(val))
				{
					Model.GifPath = val.SelectedPath;
				}
			}));
			PlayerCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(PlayerCmd, (ExecutedRoutedEventHandler)delegate
			{
				if (Model.IsAnimation)
				{
					if (ImageArr.Count > 1)
					{
						int num = 0;
						int num2 = 0;
						if (Model.GifWidth > Model.GifHeight && Model.GifWidth > 200)
						{
							num = 200;
							num2 = 200 * Model.GifHeight / Model.GifWidth;
						}
						else if (Model.GifHeight > Model.GifWidth && Model.GifHeight > 200)
						{
							num2 = 200;
							num = 200 * Model.GifWidth / Model.GifHeight;
						}
						else
						{
							num = Model.GifWidth;
							num2 = Model.GifHeight;
						}
						if (Model.IsChanged)
						{
							Model.IsChanged = false;
							Model.GifImage = null;
							ImageToGif(Model.GifFile, num, num2);
						}
						else
						{
							wnd.ResumeAnimation();
						}
						Model.IsGifMakeOk = true;
					}
				}
				else
				{
					Model.IsGifMakeOk = false;
					wnd.StopAnimation();
				}
			}));
			CreateGifCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(CreateGifCmd, (ExecutedRoutedEventHandler)delegate
			{
				//IL_0021: Unknown result type (might be due to invalid IL or missing references)
				//IL_0027: Expected O, but got Unknown
				//IL_0057: Unknown result type (might be due to invalid IL or missing references)
				//IL_005c: Invalid comparison between I4 and Unknown
				if (ImageArr.Count > 1)
				{
					if (!GlobalFun.Exists(Model.GifPath))
					{
						FolderBrowserDialog val = new FolderBrowserDialog();
						val.Description = HostProxy.LanguageService.Translate("Please select a new save path");
						val.SelectedPath = Model.GifPath;
						val.ShowNewFolderButton = true;
						if (1 != (int)FolderBrowserLauncher.ShowFolderBrowser(val))
						{
							return;
						}
						Model.GifPath = val.SelectedPath;
					}
					HostProxy.BehaviorService.Collect((BusinessType)2210, (BusinessData)null);
					string giffile = Path.Combine(Model.GifPath, DateTime.Now.ToString("yyyyMMddHHmmss") + ".gif");
					ImageToGif(giffile, Model.GifWidth, Model.GifHeight);
				}
			}));
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(ImagePlotCmd, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
				string index = (string)e.Parameter;
				ImageEntitiy imageEntitiy = ImageArr.FirstOrDefault((ImageEntitiy p) => p.Index == index);
				BitmapImage displayImage = LoadImage(imageEntitiy.FilePath);
				PlotViewV6 plotViewV = new PlotViewV6();
				((Window)plotViewV).Title = LangTranslation.Translate("K0200");
				plotViewV.ViewModel.Model.DisplayImage = (BitmapSource)(object)displayImage;
				plotViewV.ViewModel.Model.TempDir = Model.TempDir;
				((Window)plotViewV).ShowInTaskbar = false;
				((Window)plotViewV).WindowStartupLocation = (WindowStartupLocation)2;
				string text = Guid.NewGuid().ToString("N");
				IntPtr owner = HostProxy.HostOperationService.ShowMaskLayer(text, (WindowState)0);
				new WindowInteropHelper((Window)(object)plotViewV).Owner = owner;
				if (((Window)plotViewV).ShowDialog() == true)
				{
					Model.IsAnimation = false;
					Model.IsChanged = true;
					imageEntitiy.FilePath = plotViewV.ViewModel.Model.NewFile;
				}
				plotViewV.ViewModel.Model = null;
				plotViewV.ViewModel = null;
				HostProxy.HostOperationService.CloseMaskLayer(text);
			}));
			ImageArr = new ObservableCollection<ImageEntitiy>();
			ImageArr.Add(new ImageEntitiy
			{
				IsImage = false,
				FilePath = string.Empty,
				Index = Guid.NewGuid().ToString()
			});
			ImageArr.CollectionChanged += delegate(object sender, NotifyCollectionChangedEventArgs e)
			{
				if (e.Action == NotifyCollectionChangedAction.Add || e.Action == NotifyCollectionChangedAction.Remove)
				{
					Model.IsChanged = true;
					Model.IsAnimation = false;
				}
			};
			((NotifyBase)Model).PropertyChanged += delegate(object sender, PropertyChangedEventArgs e)
			{
				if (e.PropertyName == "IsAnimation" && !Model.IsAnimation)
				{
					wnd.StopAnimation();
				}
			};
		}

		private void ImageToGif(string giffile, int width, int height, bool repeat = true)
		{
			_createGifCancel = false;
			GifProgressViewV6 prg = new GifProgressViewV6();
			GifProgressViewV6 gifProgressViewV = prg;
			gifProgressViewV.CancelHandler = (EventHandler)Delegate.Combine(gifProgressViewV.CancelHandler, (EventHandler)delegate
			{
				_createGifCancel = true;
			});
			Task.Factory.StartNew(delegate
			{
				GifEncoder gifEncoder = new GifEncoder();
				gifEncoder.Start(giffile);
				gifEncoder.SetDelay(1000 / Model.GifDelay);
				gifEncoder.SetRepeat((!repeat) ? (-1) : 0);
				int num = 0;
				int num2 = ImageArr.Count - 1;
				foreach (ImageEntitiy item in ImageArr)
				{
					if (item.IsImage)
					{
						if (_createGifCancel)
						{
							gifEncoder.Finish();
							Model.IsAnimation = false;
							Model.IsChanged = true;
							File.Delete(giffile);
							return;
						}
						gifEncoder.AddFrame(Image.FromFile(item.FilePath).ScaleToFit(new Size(width, height), dispose: true, ScalingMode.Overflow));
						prg.Model.Percentage = ++num * 100 / num2;
					}
				}
				gifEncoder.Finish();
				Thread.Sleep(500);
				((DispatcherObject)prg).Dispatcher.Invoke((Action)delegate
				{
					prg.Result = false;
					((Window)prg).Close();
				});
				Model.LoadBitmap();
			});
			MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)prg, (bool?)true);
		}

		public BitmapImage LoadImage(string file)
		{
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			if (string.IsNullOrEmpty(file) || !File.Exists(file))
			{
				return null;
			}
			try
			{
				Image obj = Image.FromFile(file);
				double num = obj.Width;
				double num2 = obj.Height;
				obj.Dispose();
				BitmapImage val = new BitmapImage();
				val.BeginInit();
				if (num > 1366.0 || num2 > 768.0)
				{
					if (num2 / num > 0.0)
					{
						val.DecodePixelHeight = 768;
					}
					else
					{
						val.DecodePixelWidth = 1366;
					}
				}
				val.CacheOption = (BitmapCacheOption)1;
				val.UriSource = new Uri(file);
				val.EndInit();
				((Freezable)val).Freeze();
				return val;
			}
			catch (Exception)
			{
				return null;
			}
		}
	}
	public class PlotViewModelV6
	{
		[Serializable]
		[CompilerGenerated]
		private sealed class <>c
		{
			public static readonly <>c <>9 = new <>c();

			public static MouseButtonEventHandler <>9__39_2;

			public static Func<FrameworkElement, object> <>9__40_0;

			internal void <DrawText>b__39_2(object sender, MouseButtonEventArgs e)
			{
				((RoutedEventArgs)e).Handled = true;
			}

			internal object <DrawClip>b__40_0(FrameworkElement param)
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_0005: Unknown result type (might be due to invalid IL or missing references)
				//IL_0017: Unknown result type (might be due to invalid IL or missing references)
				//IL_001c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0026: Expected O, but got Unknown
				//IL_0027: Expected O, but got Unknown
				return (object)new Grid
				{
					Background = (Brush)new SolidColorBrush(Color.FromArgb((byte)20, byte.MaxValue, byte.MaxValue, byte.MaxValue))
				};
			}
		}

		private PlotViewV6 viewWnd;

		private PlotType ElementType;

		private IPlotBase CurElement;

		public ICommand CloseCmd { get; set; }

		public ICommand UndoCmd { get; set; }

		public ICommand ChangeSizeCmd { get; set; }

		public ICommand SaveImageCmd { get; set; }

		public ICommand ToolBarItemCmd { get; set; }

		public PlotModel Model { get; set; }

		public PlotViewModelV6(PlotViewV6 wnd)
		{
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Expected O, but got Unknown
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			//IL_0087: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Expected O, but got Unknown
			//IL_008c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0096: Expected O, but got Unknown
			//IL_0098: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a2: Expected O, but got Unknown
			//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c4: Expected O, but got Unknown
			//IL_00bf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Expected O, but got Unknown
			//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d5: Expected O, but got Unknown
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f7: Expected O, but got Unknown
			//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fc: Expected O, but got Unknown
			//IL_00fe: Unknown result type (might be due to invalid IL or missing references)
			//IL_0108: Expected O, but got Unknown
			//IL_0120: Unknown result type (might be due to invalid IL or missing references)
			//IL_012a: Expected O, but got Unknown
			//IL_0125: Unknown result type (might be due to invalid IL or missing references)
			//IL_012f: Expected O, but got Unknown
			PlotViewModelV6 plotViewModelV = this;
			viewWnd = wnd;
			Model = new PlotModel();
			CloseCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(CloseCmd, (ExecutedRoutedEventHandler)delegate
			{
				((Window)wnd).Close();
			}));
			SaveImageCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(SaveImageCmd, (ExecutedRoutedEventHandler)async delegate
			{
				bool isClipRegion = plotViewModelV.CurElement != null && plotViewModelV.CurElement.PlType == PlotType.Clip;
				if (isClipRegion)
				{
					Rect bound = (plotViewModelV.CurElement as PlotShape).GetBound();
					isClipRegion = ((Rect)(ref bound)).Width >= 10.0 && ((Rect)(ref bound)).Height >= 10.0;
				}
				bool? flag = await MessageWindowHelper.Instance.Show((string)null, "K0224", "K0327", "K0208", false, (MessageBoxImage)64, (string)null, false, true, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				bool isClip = isClipRegion && flag.Value;
				plotViewModelV.Model.NewFile = string.Format("{0}\\{1}.jpg", plotViewModelV.Model.TempDir, DateTime.Now.ToString("yyyyMMddHHmmss"));
				HostProxy.ResourcesLoggingService.RegisterFile(plotViewModelV.Model.NewFile);
				BitmapSource val = plotViewModelV.CreateMemoryImage(isClip);
				using (FileStream fileStream = File.Create(plotViewModelV.Model.NewFile))
				{
					((BitmapEncoder)new JpegBitmapEncoder
					{
						Frames = { BitmapFrame.Create(val) }
					}).Save((Stream)fileStream);
					fileStream.Flush();
				}
				((Window)plotViewModelV.viewWnd).DialogResult = true;
				plotViewModelV.viewWnd = null;
			}));
			ToolBarItemCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(ToolBarItemCmd, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				if (e.Parameter is string text)
				{
					switch (text.Length)
					{
					case 4:
						switch (text[0])
						{
						case 'L':
							if (text == "LINE")
							{
								plotViewModelV.Model.Cursor = Cursors.Cross;
								plotViewModelV.ElementType = PlotType.Line;
							}
							break;
						case 'R':
							if (text == "RECT")
							{
								plotViewModelV.Model.Cursor = Cursors.Cross;
								plotViewModelV.ElementType = PlotType.Rect;
							}
							break;
						case 'T':
							if (text == "TEXT")
							{
								plotViewModelV.Model.Cursor = Cursors.IBeam;
								plotViewModelV.ElementType = PlotType.Text;
							}
							break;
						case 'F':
							if (text == "FONT")
							{
								plotViewModelV.SetFontSetting();
							}
							break;
						}
						break;
					case 7:
						if (text == "ELLIPSE")
						{
							plotViewModelV.Model.Cursor = Cursors.Cross;
							plotViewModelV.ElementType = PlotType.Ellipse;
						}
						break;
					case 3:
						if (text == "CUT")
						{
							plotViewModelV.Model.Cursor = Cursors.Cross;
							plotViewModelV.ElementType = PlotType.Clip;
						}
						break;
					case 5:
						if (text == "COLOR")
						{
							plotViewModelV.SetColorSetting();
						}
						break;
					case 6:
						break;
					}
				}
			}));
			UndoCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(UndoCmd, (ExecutedRoutedEventHandler)delegate
			{
				plotViewModelV.viewWnd.DelLatestElement();
				plotViewModelV.CurElement = null;
			}));
			ChangeSizeCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(ChangeSizeCmd, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				((Window)wnd).WindowState = (WindowState)(((bool)e.Parameter) ? 2 : 0);
			}));
		}

		private void SetFontSetting()
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0087: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Invalid comparison between Unknown and I4
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			FontDialog val = new FontDialog();
			FontStyle val2 = (FontStyle)0;
			if (Model.Settings.IsItalic && Model.Settings.IsBold)
			{
				val2 = (FontStyle)3;
			}
			else if (Model.Settings.IsItalic)
			{
				val2 = (FontStyle)2;
			}
			else if (Model.Settings.IsBold)
			{
				val2 = (FontStyle)1;
			}
			val.Font = new Font(Model.Settings.FontFamily, (float)Model.Settings.FontSize, val2);
			if ((int)((CommonDialog)val).ShowDialog() == 1)
			{
				Model.Settings.FontFamily = val.Font.Name;
				Model.Settings.FontSize = val.Font.Size;
				Model.Settings.IsBold = val.Font.Bold;
				Model.Settings.IsItalic = val.Font.Italic;
			}
		}

		private void SetColorSetting()
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Invalid comparison between Unknown and I4
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			ColorDialog val = new ColorDialog();
			Color color = Model.Settings.Color;
			byte a = ((Color)(ref color)).A;
			color = Model.Settings.Color;
			byte r = ((Color)(ref color)).R;
			color = Model.Settings.Color;
			byte g = ((Color)(ref color)).G;
			color = Model.Settings.Color;
			val.Color = Color.FromArgb(a, r, g, ((Color)(ref color)).B);
			if ((int)((CommonDialog)val).ShowDialog() == 1)
			{
				Model.Settings.Color = Color.FromArgb(val.Color.A, val.Color.R, val.Color.G, val.Color.B);
			}
		}

		public void OnMouseLeftBtnUp(object sender, MouseButtonEventArgs e)
		{
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			if (CurElement != null)
			{
				CurElement.OnMouseUp(((MouseEventArgs)e).GetPosition((IInputElement)(object)viewWnd.canvas));
			}
		}

		public void OnMouseMove(object sender, MouseEventArgs e)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			if (CurElement != null && (int)e.LeftButton != 0)
			{
				CurElement.OnMouseMove(e.GetPosition((IInputElement)(object)viewWnd.canvas));
			}
		}

		public void OnMouseLeftBtnDown(object sender, MouseButtonEventArgs e)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			Point position = ((MouseEventArgs)e).GetPosition((IInputElement)(object)viewWnd.canvas);
			switch (ElementType)
			{
			case PlotType.Ellipse:
				DrawEllipse(position);
				break;
			case PlotType.Rect:
				DrawRectangle(position);
				break;
			case PlotType.Line:
				DrawLine(position).Wait();
				break;
			case PlotType.Text:
				DrawText(position);
				break;
			case PlotType.Clip:
				DrawClip(position);
				break;
			case PlotType.None:
			case PlotType.Arc:
				break;
			}
		}

		private async Task<bool> IsNeedNewElement(PlotType type, Point pt)
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			if (CurElement != null && CurElement.IsEditModel && CurElement.PlType == type && CurElement.IsOnAchor())
			{
				CurElement.OnMouseDown(pt);
				return false;
			}
			if (CurElement != null && CurElement.IsEditModel)
			{
				if (!CurElement.IsValidate())
				{
					PlotViewV6 plotViewV = viewWnd;
					IPlotBase curElement = CurElement;
					plotViewV.DelElement((UIElement)((curElement is UIElement) ? curElement : null));
					CurElement = null;
					return false;
				}
				if (ElementType == PlotType.Clip && CurElement.PlType == PlotType.Clip)
				{
					Rect bound = (CurElement as PlotShape).GetBound();
					if (((Rect)(ref bound)).Width < 10.0 || ((Rect)(ref bound)).Height < 10.0)
					{
						return false;
					}
					if (await MessageWindowHelper.Instance.Show((string)null, "K0224", "K0327", "K0208", false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false) == true)
					{
						Model.DisplayImage = CreateMemoryImage(isClip: true);
					}
					PlotViewV6 plotViewV2 = viewWnd;
					IPlotBase curElement2 = CurElement;
					plotViewV2.DelElement((UIElement)((curElement2 is UIElement) ? curElement2 : null));
					CurElement = null;
					return false;
				}
				CurElement.IsEditModel = false;
				CurElement.Achor = AchorType.None;
				return false;
			}
			return true;
		}

		private bool ProcessWithMasker(Func<bool> task)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			string text = Guid.NewGuid().ToString("N");
			try
			{
				HostProxy.HostOperationService.ShowMaskLayer(text, ((Window)viewWnd).WindowState);
				return task();
			}
			finally
			{
				HostProxy.HostOperationService.CloseMaskLayer(text);
			}
		}

		private BitmapSource CreateMemoryImage(bool isClip)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_0147: Unknown result type (might be due to invalid IL or missing references)
			//IL_014c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0152: Expected O, but got Unknown
			//IL_015f: Unknown result type (might be due to invalid IL or missing references)
			Int32Rect clip = Int32Rect.Empty;
			DrawingVisual val = new DrawingVisual();
			DrawingContext val2 = val.RenderOpen();
			try
			{
				val2.DrawImage((ImageSource)(object)Model.DisplayImage, new Rect(0.0, 0.0, ((ImageSource)Model.DisplayImage).Width, ((ImageSource)Model.DisplayImage).Height));
				foreach (IPlotBase child in ((Panel)viewWnd.canvas).Children)
				{
					if (child.PlType != PlotType.Clip)
					{
						child.PlotElement(val2);
						continue;
					}
					Rect bound = (child as PlotShape).GetBound();
					clip = new Int32Rect((int)((Rect)(ref bound)).X, (int)((Rect)(ref bound)).Y, (int)((Rect)(ref bound)).Width, (int)((Rect)(ref bound)).Height);
				}
				val2.Close();
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
			viewWnd.DelAllElement();
			RenderTargetBitmap val3 = new RenderTargetBitmap(Model.DisplayImage.PixelWidth, Model.DisplayImage.PixelHeight, Model.DisplayImage.DpiX, Model.DisplayImage.DpiY, PixelFormats.Pbgra32);
			val3.Render((Visual)(object)val);
			if (!isClip)
			{
				return (BitmapSource)(object)val3;
			}
			return ClipCurrentImage(clip, (BitmapSource)(object)val3);
		}

		private BitmapSource ClipCurrentImage(Int32Rect clip, BitmapSource src)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			PixelFormat format = src.Format;
			int num = ((PixelFormat)(ref format)).BitsPerPixel * ((Int32Rect)(ref clip)).Width / 8;
			byte[] array = new byte[((Int32Rect)(ref clip)).Height * num];
			src.CopyPixels(clip, (Array)array, num, 0);
			src = null;
			return BitmapSource.Create(((Int32Rect)(ref clip)).Width, ((Int32Rect)(ref clip)).Height, 96.0, 96.0, PixelFormats.Pbgra32, (BitmapPalette)null, (Array)array, num);
		}

		private async Task CreateRectElement(Point pt, PlotType type, Func<FrameworkElement, object> callback)
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			if (await IsNeedNewElement(type, pt))
			{
				PlotShape plotShape = new PlotShape
				{
					Start = pt,
					OwnerSize = ((UIElement)viewWnd.canvas).RenderSize,
					Number = viewWnd.GetElementCount() + 1,
					IsEditModel = true,
					SetModel = Model.Settings.Clone(),
					Achor = AchorType.Achor5,
					PlType = type
				};
				((ContentControl)plotShape).Content = callback((FrameworkElement)(object)plotShape);
				Canvas.SetLeft((UIElement)(object)plotShape, ((Point)(ref pt)).X);
				Canvas.SetTop((UIElement)(object)plotShape, ((Point)(ref pt)).Y);
				viewWnd.AddElement((UIElement)(object)plotShape);
				CurElement = plotShape;
			}
		}

		private async Task DrawLine(Point pt)
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			if (await IsNeedNewElement(PlotType.Line, pt))
			{
				PlotLine plotLine = new PlotLine
				{
					Start = pt,
					OwnerSize = ((UIElement)viewWnd.canvas).RenderSize,
					Number = viewWnd.GetElementCount() + 1,
					IsEditModel = true,
					PlType = PlotType.Line,
					SetModel = Model.Settings,
					Stroke = new SolidColorBrush(Model.Settings.Color),
					StrokeThickness = Model.Settings.LineWeight
				};
				Canvas.SetLeft((UIElement)(object)plotLine, ((Point)(ref pt)).X);
				Canvas.SetTop((UIElement)(object)plotLine, ((Point)(ref pt)).Y);
				viewWnd.AddElement((UIElement)(object)plotLine);
				CurElement = plotLine;
			}
		}

		private void DrawText(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			CreateRectElement(pt, PlotType.Text, delegate(FrameworkElement param)
			{
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0022: Unknown result type (might be due to invalid IL or missing references)
				//IL_002e: Unknown result type (might be due to invalid IL or missing references)
				//IL_0033: Unknown result type (might be due to invalid IL or missing references)
				//IL_003d: Expected O, but got Unknown
				//IL_003d: Unknown result type (might be due to invalid IL or missing references)
				//IL_004e: Unknown result type (might be due to invalid IL or missing references)
				//IL_0058: Expected O, but got Unknown
				//IL_0058: Unknown result type (might be due to invalid IL or missing references)
				//IL_0078: Expected O, but got Unknown
				//IL_0090: Unknown result type (might be due to invalid IL or missing references)
				//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
				//IL_00cc: Unknown result type (might be due to invalid IL or missing references)
				//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
				//IL_00de: Unknown result type (might be due to invalid IL or missing references)
				//IL_00e8: Expected O, but got Unknown
				//IL_00ed: Expected O, but got Unknown
				//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
				//IL_00fe: Unknown result type (might be due to invalid IL or missing references)
				//IL_0105: Unknown result type (might be due to invalid IL or missing references)
				//IL_0110: Unknown result type (might be due to invalid IL or missing references)
				//IL_011a: Expected O, but got Unknown
				//IL_011f: Expected O, but got Unknown
				//IL_015c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0166: Expected O, but got Unknown
				//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
				//IL_0185: Unknown result type (might be due to invalid IL or missing references)
				//IL_018a: Unknown result type (might be due to invalid IL or missing references)
				//IL_0190: Expected O, but got Unknown
				TextBox val = new TextBox
				{
					FontSize = Model.Settings.FontSize,
					Foreground = (Brush)new SolidColorBrush(Model.Settings.Color),
					FontFamily = new FontFamily(Model.Settings.FontFamily)
				};
				object obj = ((FrameworkElement)viewWnd).FindResource((object)"TextBoxStyle");
				((FrameworkElement)val).Style = (Style)((obj is Style) ? obj : null);
				TextBox txt = val;
				if (Model.Settings.IsBold)
				{
					((Control)txt).FontWeight = FontWeights.Bold;
				}
				if (Model.Settings.IsItalic)
				{
					((Control)txt).FontStyle = FontStyles.Italic;
				}
				((FrameworkElement)txt).SetBinding(FrameworkElement.WidthProperty, (BindingBase)new Binding
				{
					Source = param,
					Path = new PropertyPath("ActualWidth", Array.Empty<object>())
				});
				((FrameworkElement)txt).SetBinding(FrameworkElement.HeightProperty, (BindingBase)new Binding
				{
					Source = param,
					Path = new PropertyPath("ActualHeight", Array.Empty<object>())
				});
				FocusManager.SetFocusedElement((DependencyObject)(object)viewWnd, (IInputElement)(object)txt);
				param.Width = 120.0;
				param.Height = 32.0;
				((FrameworkElement)txt).Loaded += (RoutedEventHandler)delegate
				{
					((UIElement)txt).Focus();
				};
				TextBox obj2 = txt;
				RoutedEvent mouseLeftButtonDownEvent = UIElement.MouseLeftButtonDownEvent;
				object obj3 = <>c.<>9__39_2;
				if (obj3 == null)
				{
					MouseButtonEventHandler val2 = delegate(object sender, MouseButtonEventArgs e)
					{
						((RoutedEventArgs)e).Handled = true;
					};
					<>c.<>9__39_2 = val2;
					obj3 = (object)val2;
				}
				((UIElement)obj2).AddHandler(mouseLeftButtonDownEvent, (Delegate)obj3, true);
				return txt;
			}).Wait();
		}

		private void DrawClip(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			CreateRectElement(pt, PlotType.Clip, (FrameworkElement param) => (object)new Grid
			{
				Background = (Brush)new SolidColorBrush(Color.FromArgb((byte)20, byte.MaxValue, byte.MaxValue, byte.MaxValue))
			}).Wait();
		}

		private void DrawEllipse(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			CreateRectElement(pt, PlotType.Ellipse, (FrameworkElement param) => (object)new Ellipse
			{
				Stroke = (Brush)new SolidColorBrush(Model.Settings.Color),
				StrokeThickness = Model.Settings.LineWeight
			}).Wait();
		}

		private void DrawRectangle(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			CreateRectElement(pt, PlotType.Rect, (FrameworkElement param) => (object)new Rectangle
			{
				Stroke = (Brush)new SolidColorBrush(Model.Settings.Color),
				StrokeThickness = Model.Settings.LineWeight
			}).Wait();
		}
	}
	public class ScreenCaptureFrameViewModeV6 : ViewModelBase
	{
		private VideoBLL videoBLL = new VideoBLL();

		private bool _exportBtnEnable;

		private bool _deleteBtnEnable;

		private bool _refreshBtnEnable = true;

		private ReplayCommand startCommand;

		private bool startBtnEnable;

		private bool _isAllSelected;

		private Visibility connectDeviceTipsVisibility;

		private Visibility screenCupturePanelVisibility = (Visibility)2;

		private Visibility _txtTipsVisibility = (Visibility)2;

		public ObservableCollection<CaptureVideoItemDetailViewModelV6> VideoDataList { get; private set; }

		public ReplayCommand ExportBtnClick { get; private set; }

		public ReplayCommand DeleteBtnClick { get; private set; }

		public ReplayCommand RefreshBtnClick { get; private set; }

		public bool ExportBtnEnable
		{
			get
			{
				return _exportBtnEnable;
			}
			set
			{
				_exportBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("ExportBtnEnable");
			}
		}

		public bool DeleteBtnEnable
		{
			get
			{
				return _deleteBtnEnable;
			}
			set
			{
				_deleteBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("DeleteBtnEnable");
			}
		}

		public bool RefreshBtnEnable
		{
			get
			{
				return _refreshBtnEnable;
			}
			set
			{
				_refreshBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("RefreshBtnEnable");
			}
		}

		public ReplayCommand StartCommand
		{
			get
			{
				return startCommand;
			}
			set
			{
				if (startCommand != value)
				{
					startCommand = value;
					((NotifyBase)this).OnPropertyChanged("StartCommand");
				}
			}
		}

		public bool StartBtnEnable
		{
			get
			{
				return startBtnEnable;
			}
			set
			{
				if (startBtnEnable != value)
				{
					startBtnEnable = value;
					((NotifyBase)this).OnPropertyChanged("StartBtnEnable");
				}
			}
		}

		public bool IsAllSelected
		{
			get
			{
				return _isAllSelected;
			}
			set
			{
				_isAllSelected = value;
				((NotifyBase)this).OnPropertyChanged("IsAllSelected");
			}
		}

		public Visibility ConnectDeviceTipsVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return connectDeviceTipsVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (connectDeviceTipsVisibility != value)
				{
					connectDeviceTipsVisibility = value;
					((NotifyBase)this).OnPropertyChanged("ConnectDeviceTipsVisibility");
				}
			}
		}

		public Visibility ScreenCupturePanelVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return screenCupturePanelVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (screenCupturePanelVisibility != value)
				{
					screenCupturePanelVisibility = value;
					((NotifyBase)this).OnPropertyChanged("ScreenCupturePanelVisibility");
				}
			}
		}

		public Visibility TxtTipsVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _txtTipsVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (_txtTipsVisibility != value)
				{
					_txtTipsVisibility = value;
					((NotifyBase)this).OnPropertyChanged("TxtTipsVisibility");
				}
			}
		}

		public ScreenCaptureFrameViewModeV6()
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Expected O, but got Unknown
			VideoDataList = new ObservableCollection<CaptureVideoItemDetailViewModelV6>();
			StartCommand = new ReplayCommand((Action<object>)StartCommandHandler);
			HostProxy.deviceManager.MasterDeviceChanged += DeviceManager_MasterDeviceChanged;
			InitButton();
			RefreshCommandHandler(null);
		}

		private void DeviceManager_MasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				e.Current.SoftStatusChanged += Current_SoftStatusChanged;
			}
			if (e.Previous != null)
			{
				e.Previous.SoftStatusChanged -= Current_SoftStatusChanged;
			}
		}

		public override void Dispose()
		{
			((ViewModelBase)this).Dispose();
			HostProxy.deviceManager.MasterDeviceChanged -= DeviceManager_MasterDeviceChanged;
		}

		private void InitButton()
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Expected O, but got Unknown
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			ExportBtnClick = new ReplayCommand((Action<object>)ExportCommandHandler);
			DeleteBtnClick = new ReplayCommand((Action<object>)DeleteCommandHandler);
			RefreshBtnClick = new ReplayCommand((Action<object>)RefreshCommandHandler);
		}

		private void Current_SoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Invalid comparison between Unknown and I4
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			TcpAndroidDevice val = (TcpAndroidDevice)sender;
			SetStartBtnEnableStatus(e);
			IAndroidDevice property = ((DeviceEx)val).Property;
			SetPanelVisibility(e, ((property != null) ? property.Category : null) == "tablet");
			((ViewModelBase)this).LoadData((object)val);
			if ((int)e == 2)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						RefreshCommandHandler(null);
					});
				}
			}
			else
			{
				if ((int)e != 0)
				{
					return;
				}
				ExportBtnEnable = false;
				DeleteBtnEnable = false;
				Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
				if (currentDispatcher2 != null)
				{
					currentDispatcher2.Invoke((Action)delegate
					{
						VideoDataList.Clear();
					});
				}
			}
		}

		private bool SetStartBtnEnableStatus(DeviceSoftStateEx deviceStatus)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0003: Invalid comparison between Unknown and I4
			StartBtnEnable = (int)deviceStatus == 2;
			return StartBtnEnable;
		}

		private void StartCommandHandler(object e)
		{
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Invalid comparison between Unknown and I4
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Expected O, but got Unknown
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice currentDevice = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (currentDevice == null)
			{
				return;
			}
			if ((int)((DeviceEx)currentDevice).ConnectType == 4)
			{
				MessageWindowHelper.Instance.Show((string)null, "K0257", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				return;
			}
			HostProxy.BehaviorService.Collect((BusinessType)2410, new BusinessData((BusinessType)2410, (DeviceEx)(object)currentDevice, (BusinessStatus)0));
			HostProxy.PermissionService.BeginConfirmAppIsReady(HostProxy.deviceManager.MasterDevice, "ScreenRecord", (CancellationTokenSource)null, (Action<bool?>)delegate(bool? isReady)
			{
				if (isReady.HasValue && isReady.Value)
				{
					Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
					if (currentDispatcher != null)
					{
						currentDispatcher.Invoke((Action)delegate
						{
							//IL_0006: Unknown result type (might be due to invalid IL or missing references)
							//IL_000b: Unknown result type (might be due to invalid IL or missing references)
							//IL_0012: Unknown result type (might be due to invalid IL or missing references)
							DeviceSoftStateEx softStatus = ((DeviceEx)currentDevice).SoftStatus;
							if (SetStartBtnEnableStatus(softStatus))
							{
								StartBtnEnable = false;
								Task.Factory.StartNew(delegate
								{
									new VideoBLL().StartScreenCapture(delegate
									{
										Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
										if (currentDispatcher2 != null)
										{
											currentDispatcher2.Invoke((Action)delegate
											{
												StartBtnEnable = true;
											});
										}
									});
								});
							}
						});
					}
				}
			});
		}

		private void SetPanelVisibility(DeviceSoftStateEx deviceStatus, bool _isTablet)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Invalid comparison between Unknown and I4
			bool flag = (int)deviceStatus == 2;
			ConnectDeviceTipsVisibility = (Visibility)(flag ? 1 : 0);
			ScreenCupturePanelVisibility = (Visibility)(!flag);
			TxtTipsVisibility = (Visibility)(!_isTablet);
		}

		private void ExportCommandHandler(object e)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Invalid comparison between Unknown and I4
			FolderBrowserDialog folderBrowser = new FolderBrowserDialog();
			if ((int)((CommonDialog)folderBrowser).ShowDialog() != 1)
			{
				return;
			}
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher == null)
			{
				return;
			}
			currentDispatcher.Invoke((Action)delegate
			{
				//IL_0076: Unknown result type (might be due to invalid IL or missing references)
				_ = folderBrowser.SelectedPath;
				List<string> list = (from m in VideoDataList
					where m.IsChecked
					select m.Id).ToList();
				string text = folderBrowser.SelectedPath.Trim();
				new ImportAndExportWrapper().ExportFile((BusinessType)2420, 20, list, "K0567", "{8BEBE14B-4E45-4D36-8726-8442E6242C01}", "Videos", text, (Func<string, Header, string>)null);
			});
		}

		private void RefreshCommandHandler(object e)
		{
			IsAllSelected = false;
			ExportBtnEnable = false;
			DeleteBtnEnable = false;
			RefreshBtnEnable = false;
			List<string> idList = videoBLL.GetIdList("RecordScreen", "id", isSortDesc: false);
			List<VideoDetailModel> videoInfoList = videoBLL.GetVideoInfoList(idList);
			VideoDataList.Clear();
			if (videoInfoList != null)
			{
				foreach (VideoDetailModel item in videoInfoList)
				{
					VideoDataList.Add(new CaptureVideoItemDetailViewModelV6
					{
						Id = item.Id,
						VideoName = item.Name,
						LongDuration = item.Duration,
						Size = item.Size,
						ModifiedDate = item.ModifiedDateDisplayString
					});
				}
				Task.Factory.StartNew(delegate
				{
					try
					{
						UpdateVideoImages(VideoDataList);
					}
					catch
					{
					}
				});
			}
			RefreshBtnEnable = true;
		}

		private void UpdateVideoImages(IEnumerable<CaptureVideoItemDetailViewModelV6> target)
		{
			List<string> idList = target.Select((CaptureVideoItemDetailViewModelV6 m) => m.Id).ToList();
			string exportFolder = Path.Combine(Configurations.PicCacheDir, "ScreenCAP");
			videoBLL.ExportVideoThumbnailList(idList, exportFolder, delegate(string id, bool success, string path)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						//IL_002d: Unknown result type (might be due to invalid IL or missing references)
						//IL_0033: Expected O, but got Unknown
						foreach (CaptureVideoItemDetailViewModelV6 item in target)
						{
							if (item.Id.Equals(id))
							{
								try
								{
									BitmapImage val = new BitmapImage();
									val.BeginInit();
									val.CacheOption = (BitmapCacheOption)1;
									val.UriSource = new Uri(path, UriKind.Absolute);
									val.EndInit();
									item.IconSource = (ImageSource)(object)val;
									break;
								}
								catch
								{
									break;
								}
							}
						}
					});
				}
			});
		}

		private async void DeleteCommandHandler(object e)
		{
			if (await MessageWindowHelper.Instance.Show((string)null, "K0569", "K0327", "K0208", false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false) != true)
			{
				return;
			}
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val != null)
			{
				BusinessData val2 = new BusinessData((BusinessType)2430, (DeviceEx)(object)val, (BusinessStatus)0);
				Stopwatch stopwatch = new Stopwatch();
				stopwatch.Start();
				List<string> idList = (from m in VideoDataList
					where m.IsChecked
					select m.Id).ToList();
				bool flag = videoBLL.DeleteVideo(idList);
				stopwatch.Stop();
				HostProxy.BehaviorService.Collect((BusinessType)2430, val2.Update(stopwatch.ElapsedMilliseconds, (BusinessStatus)(flag ? 10 : 20), (object)null));
				if (flag)
				{
					RefreshCommandHandler(null);
				}
			}
		}
	}
	public class CaptureVideoItemDetailViewModelV6 : ViewModelBase
	{
		private string _id;

		private string videoName;

		private long longDuration;

		private long size;

		private string modifiedDate;

		private ImageSource iconSource;

		private bool isChecked;

		public string Id
		{
			get
			{
				return _id;
			}
			set
			{
				if (!(_id == value))
				{
					_id = value;
					((NotifyBase)this).OnPropertyChanged("Id");
				}
			}
		}

		public string VideoName
		{
			get
			{
				return videoName;
			}
			set
			{
				if (!(videoName == value))
				{
					videoName = value;
					((NotifyBase)this).OnPropertyChanged("VideoName");
				}
			}
		}

		public string Duration => new TimeSpan(0, 0, (int)LongDuration / 1000).ToString("hh\\:mm\\:ss");

		public long LongDuration
		{
			get
			{
				return longDuration;
			}
			set
			{
				if (longDuration != value)
				{
					longDuration = value;
					((NotifyBase)this).OnPropertyChanged("LongDuration");
				}
			}
		}

		public long Size
		{
			get
			{
				return size;
			}
			set
			{
				if (size != value)
				{
					size = value;
					((NotifyBase)this).OnPropertyChanged("Size");
				}
			}
		}

		public string ModifiedDate
		{
			get
			{
				return modifiedDate;
			}
			set
			{
				if (!(modifiedDate == value))
				{
					modifiedDate = value;
					((NotifyBase)this).OnPropertyChanged("ModifiedDate");
				}
			}
		}

		public ImageSource IconSource
		{
			get
			{
				return iconSource;
			}
			set
			{
				if (iconSource != value)
				{
					iconSource = value;
					((NotifyBase)this).OnPropertyChanged("IconSource");
				}
			}
		}

		public bool IsChecked
		{
			get
			{
				return isChecked;
			}
			set
			{
				if (isChecked != value)
				{
					isChecked = value;
					((NotifyBase)this).OnPropertyChanged("IsChecked");
				}
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.UserControlsV6
{
	public class ClipboardUserControlV6 : UserControl, IDisposable, IComponentConnector
	{
		private DeviceClipboardManagement mgt = new DeviceClipboardManagement();

		private bool _copyWin2PhoneStatus = true;

		internal LangButton btnCopyFrom;

		internal Button btnTransfer;

		internal LangButton btnCopyTo;

		internal TextBox clipboardTxt;

		internal LangButton btnCopy;

		private bool _contentLoaded;

		public ClipboardUserControlV6()
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Expected O, but got Unknown
			InitializeComponent();
			((FrameworkElement)this).Loaded += (RoutedEventHandler)delegate
			{
				//IL_0027: Unknown result type (might be due to invalid IL or missing references)
				//IL_002d: Invalid comparison between Unknown and I4
				HostProxy.deviceManager.MasterDeviceChanged += DeviceManager_MasterDeviceChanged;
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				if (masterDevice == null || (int)masterDevice.SoftStatus != 2)
				{
					ToolboxViewContext.SingleInstance.ShowTutorialsView();
				}
			};
		}

		private void DeviceManager_MasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				e.Current.SoftStatusChanged += Current_SoftStatusChanged;
			}
			else
			{
				SetButtonStatus(_enable: false);
			}
			if (e.Previous != null)
			{
				e.Previous.SoftStatusChanged -= Current_SoftStatusChanged;
			}
		}

		private void Current_SoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0003: Invalid comparison between Unknown and I4
			SetButtonStatus((int)e == 2);
		}

		private void SetButtonStatus(bool _enable)
		{
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					((UIElement)btnTransfer).IsEnabled = _enable;
					((UIElement)btnCopy).IsEnabled = _enable;
				});
			}
		}

		private void TransferClick(object sender, RoutedEventArgs e)
		{
			_copyWin2PhoneStatus = !_copyWin2PhoneStatus;
			if (_copyWin2PhoneStatus)
			{
				btnCopyFrom.LangKey = "K0756";
				btnCopyTo.LangKey = "K0757";
				btnCopy.LangKey = "K0185";
				((FrameworkElement)clipboardTxt).Tag = "K1352";
			}
			else
			{
				btnCopyFrom.LangKey = "K0757";
				btnCopyTo.LangKey = "K0756";
				btnCopy.LangKey = "K0186";
				((FrameworkElement)clipboardTxt).Tag = "K0188";
			}
		}

		private void btnCopy_Click(object sender, RoutedEventArgs e)
		{
			SetButtonStatus(_enable: false);
			if (_copyWin2PhoneStatus)
			{
				string _clipboardText = clipboardTxt.Text;
				if (!string.IsNullOrEmpty(_clipboardText))
				{
					Task.Run(delegate
					{
						//IL_0016: Unknown result type (might be due to invalid IL or missing references)
						//IL_001c: Expected O, but got Unknown
						Stopwatch stopwatch = new Stopwatch();
						BusinessData val = new BusinessData((BusinessType)2110, HostProxy.deviceManager.MasterDevice, (BusinessStatus)0);
						stopwatch.Start();
						bool flag = mgt.ImportClipboardInfo(_clipboardText.Trim(new char[1] { '\n' }).Trim(new char[1] { '\r' }));
						stopwatch.Stop();
						HostProxy.BehaviorService.Collect((BusinessType)2110, val.Update(stopwatch.ElapsedMilliseconds, (BusinessStatus)(flag ? 10 : 20), (object)null));
						return flag;
					}).GetAwaiter().OnCompleted(async delegate
					{
						await MessageWindowHelper.Instance.Show("K0185", "K0370", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
						SetButtonStatus(_enable: true);
					});
					return;
				}
				MessageWindowHelper.Instance.Show((string)null, "K1413", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).ContinueWith(delegate
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						SetButtonStatus(_enable: true);
					});
				});
				return;
			}
			LogHelper.LogInstance.Info("get clipboard content", false);
			Task<string> task = Task.Run(() => mgt.GetClipboardInfo());
			task.GetAwaiter().OnCompleted(delegate
			{
				string clipboardContent = task.Result;
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						try
						{
							clipboardTxt.Text = clipboardContent;
							Clipboard.SetDataObject((object)clipboardContent);
						}
						catch
						{
						}
					});
				}
				SetButtonStatus(_enable: true);
			});
		}

		public void Dispose()
		{
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/usercontrolsv6/clipboardusercontrolv6.xaml", UriKind.Relative);
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
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0068: Expected O, but got Unknown
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Expected O, but got Unknown
			//IL_0082: Unknown result type (might be due to invalid IL or missing references)
			//IL_008c: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnCopyFrom = (LangButton)target;
				break;
			case 2:
				btnTransfer = (Button)target;
				((ButtonBase)btnTransfer).Click += new RoutedEventHandler(TransferClick);
				break;
			case 3:
				btnCopyTo = (LangButton)target;
				break;
			case 4:
				clipboardTxt = (TextBox)target;
				break;
			case 5:
				btnCopy = (LangButton)target;
				((ButtonBase)btnCopy).Click += new RoutedEventHandler(btnCopy_Click);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class GifMakerViewV6 : UserControl, IDisposable, IComponentConnector
	{
		internal ListBox ImgList;

		internal Grid player;

		internal Image gif;

		internal Image img;

		internal TextBox txtWidth;

		internal TextBox txtHeight;

		internal Slider mcSlider;

		private bool _contentLoaded;

		public GifMakerViewModelV6 ViewModel { get; set; }

		public GifMakerViewV6()
		{
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Expected O, but got Unknown
			InitializeComponent();
			ViewModel = new GifMakerViewModelV6(this);
			((FrameworkElement)this).DataContext = ViewModel;
			((FrameworkElement)this).Unloaded += (RoutedEventHandler)delegate
			{
				ViewModel.Model.GifImage = null;
				ViewModel.Model.IsAnimation = false;
				ViewModel.Model.IsChanged = true;
			};
		}

		private void OnTextChanged(object sender, TextChangedEventArgs e)
		{
			TextBox val = (TextBox)((sender is TextBox) ? sender : null);
			if (img.Source == null || !((UIElement)val).IsFocused)
			{
				return;
			}
			int num = (int)img.Source.Width;
			int num2 = (int)img.Source.Height;
			if (string.IsNullOrEmpty(val.Text))
			{
				ViewModel.Model.GifWidth = 1;
				ViewModel.Model.GifHeight = 1;
			}
			else if (((FrameworkElement)val).Name == "txtHeight")
			{
				if (ViewModel.Model.GifHeight > 4000)
				{
					ViewModel.Model.GifHeight /= 10;
					txtHeight.SelectionStart = txtHeight.Text.Length;
					return;
				}
				if (ViewModel.Model.GifHeight == 0)
				{
					ViewModel.Model.GifHeight = 1;
					return;
				}
				num = num * ViewModel.Model.GifHeight / num2;
				if (num > 4000)
				{
					ViewModel.Model.GifWidth = 4000;
				}
				else if (num == 0)
				{
					ViewModel.Model.GifWidth = 1;
				}
				else
				{
					ViewModel.Model.GifWidth = num;
				}
			}
			else
			{
				if (!(((FrameworkElement)val).Name == "txtWidth"))
				{
					return;
				}
				if (ViewModel.Model.GifWidth > 4000)
				{
					ViewModel.Model.GifWidth /= 10;
					txtWidth.SelectionStart = txtWidth.Text.Length;
					return;
				}
				if (ViewModel.Model.GifWidth == 0)
				{
					ViewModel.Model.GifWidth = 1;
					return;
				}
				num2 = num2 * ViewModel.Model.GifWidth / num;
				if (num2 > 4000)
				{
					ViewModel.Model.GifHeight = 4000;
				}
				else if (num2 == 0)
				{
					ViewModel.Model.GifHeight = 1;
				}
				else
				{
					ViewModel.Model.GifHeight = num2;
				}
			}
		}

		private void OnPreviewTextInput(object sender, TextCompositionEventArgs e)
		{
			if (new Regex("[^0-9.-]+").IsMatch(e.Text))
			{
				((RoutedEventArgs)e).Handled = true;
			}
		}

		public void StopAnimation()
		{
		}

		public void ResumeAnimation()
		{
		}

		public void Dispose()
		{
			((ViewModelBase)ViewModel).Dispose();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/usercontrolsv6/gifmakerviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Expected O, but got Unknown
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Expected O, but got Unknown
			//IL_0052: Unknown result type (might be due to invalid IL or missing references)
			//IL_005c: Expected O, but got Unknown
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Expected O, but got Unknown
			//IL_0076: Unknown result type (might be due to invalid IL or missing references)
			//IL_0080: Expected O, but got Unknown
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0097: Expected O, but got Unknown
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Expected O, but got Unknown
			//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bb: Expected O, but got Unknown
			//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d2: Expected O, but got Unknown
			//IL_00d5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00df: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				ImgList = (ListBox)target;
				break;
			case 2:
				player = (Grid)target;
				break;
			case 3:
				gif = (Image)target;
				break;
			case 4:
				img = (Image)target;
				break;
			case 5:
				txtWidth = (TextBox)target;
				((TextBoxBase)txtWidth).TextChanged += new TextChangedEventHandler(OnTextChanged);
				((UIElement)txtWidth).PreviewTextInput += new TextCompositionEventHandler(OnPreviewTextInput);
				break;
			case 6:
				txtHeight = (TextBox)target;
				((TextBoxBase)txtHeight).TextChanged += new TextChangedEventHandler(OnTextChanged);
				((UIElement)txtHeight).PreviewTextInput += new TextCompositionEventHandler(OnPreviewTextInput);
				break;
			case 7:
				mcSlider = (Slider)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class PlotViewV6 : Window, IComponentConnector
	{
		internal Canvas canvas;

		internal ScaleTransform scale;

		private bool _contentLoaded;

		public PlotViewModelV6 ViewModel { get; set; }

		public PlotViewV6()
		{
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Expected O, but got Unknown
			InitializeComponent();
			((Window)this).WindowStartupLocation = (WindowStartupLocation)1;
			ViewModel = new PlotViewModelV6(this);
			((UIElement)canvas).MouseLeftButtonDown += new MouseButtonEventHandler(ViewModel.OnMouseLeftBtnDown);
			((UIElement)canvas).MouseMove += new MouseEventHandler(ViewModel.OnMouseMove);
			((UIElement)canvas).MouseLeftButtonUp += new MouseButtonEventHandler(ViewModel.OnMouseLeftBtnUp);
			((FrameworkElement)this).DataContext = ViewModel;
		}

		public void AddElement(UIElement element)
		{
			((Panel)canvas).Children.Add(element);
		}

		public void DelElement(UIElement element)
		{
			((Panel)canvas).Children.Remove(element);
		}

		public void DelAllElement()
		{
			((Panel)canvas).Children.Clear();
		}

		public int GetElementCount()
		{
			return ((Panel)canvas).Children.Count;
		}

		public void DelLatestElement()
		{
			int num = -1;
			IPlotBase plotBase = null;
			foreach (IPlotBase child in ((Panel)canvas).Children)
			{
				if (child.Number > num)
				{
					num = child.Number;
					plotBase = child;
				}
			}
			if (plotBase != null)
			{
				DelElement((UIElement)((plotBase is UIElement) ? plotBase : null));
			}
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
		}

		protected override void OnClosed(EventArgs e)
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Expected O, but got Unknown
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			((UIElement)this).CommandBindings.Clear();
			((UIElement)canvas).MouseMove -= new MouseEventHandler(ViewModel.OnMouseMove);
			((UIElement)canvas).MouseLeftButtonUp -= new MouseButtonEventHandler(ViewModel.OnMouseLeftBtnUp);
			((UIElement)canvas).MouseLeftButtonDown -= new MouseButtonEventHandler(ViewModel.OnMouseLeftBtnDown);
			((Window)this).OnClosed(e);
		}

		public Window GetMsgUi()
		{
			throw new NotImplementedException();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/usercontrolsv6/plotviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Expected O, but got Unknown
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				canvas = (Canvas)target;
				break;
			case 3:
				scale = (ScaleTransform)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class GifProgressViewV6 : Window, IMessageWindowV6, IComponentConnector
	{
		public EventHandler CancelHandler;

		private bool _contentLoaded;

		public ProgressModel Model { get; set; }

		public bool? Result { get; set; }

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; }

		public Action<IMessageWindowV6> CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool CanExecute(object parameter)
		{
			if (ExecutePredicate != null)
			{
				return ExecutePredicate(parameter);
			}
			return true;
		}

		public bool CanClose(object parameter)
		{
			if (CanClosePredicate != null)
			{
				return CanClosePredicate(parameter);
			}
			return true;
		}

		public GifProgressViewV6()
		{
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Expected O, but got Unknown
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).ShowInTaskbar = false;
			((Window)this).WindowStartupLocation = (WindowStartupLocation)1;
			Model = new ProgressModel
			{
				Percentage = 0.0,
				CloseCmd = (ICommand)new RoutedCommand(),
				Information = "K0226"
			};
			((FrameworkElement)this).DataContext = Model;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			CancelHandler(null, null);
			Result = false;
			((Window)this).Close();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/usercontrolsv6/gifprogressviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Expected O, but got Unknown
			if (connectionId == 1)
			{
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(OnBtnClose);
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class RingtoneMakerViewV6 : UserControl, IDisposable, IComponentConnector
	{
		private const int MAX_COUNT = 200;

		private RingtoneMakerModel vm;

		private WaveOut waveOut;

		private FileStream stream;

		private Mp3FileReader reader;

		private volatile bool isThreadActive;

		internal PlayerCtrlV6 player;

		internal LangButton btnSave;

		internal Popup saveModel;

		private bool _contentLoaded;

		public RingtoneMakerViewV6()
		{
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Expected O, but got Unknown
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0066: Expected O, but got Unknown
			//IL_007f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0089: Expected O, but got Unknown
			//IL_0084: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Expected O, but got Unknown
			//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b1: Expected O, but got Unknown
			//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b6: Expected O, but got Unknown
			//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d9: Expected O, but got Unknown
			//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00de: Expected O, but got Unknown
			//IL_00f7: Unknown result type (might be due to invalid IL or missing references)
			//IL_0101: Expected O, but got Unknown
			//IL_00fc: Unknown result type (might be due to invalid IL or missing references)
			//IL_0106: Expected O, but got Unknown
			//IL_011f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0129: Expected O, but got Unknown
			//IL_0124: Unknown result type (might be due to invalid IL or missing references)
			//IL_012e: Expected O, but got Unknown
			//IL_0147: Unknown result type (might be due to invalid IL or missing references)
			//IL_0151: Expected O, but got Unknown
			//IL_014c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0156: Expected O, but got Unknown
			//IL_016f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0179: Expected O, but got Unknown
			//IL_0174: Unknown result type (might be due to invalid IL or missing references)
			//IL_017e: Expected O, but got Unknown
			//IL_0197: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a1: Expected O, but got Unknown
			//IL_019c: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a6: Expected O, but got Unknown
			InitializeComponent();
			vm = new RingtoneMakerModel();
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.CloseCommand, (ExecutedRoutedEventHandler)delegate
			{
				OnCloseCommand();
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.LoadCommand, (ExecutedRoutedEventHandler)delegate
			{
				OnLoadCommand();
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.PlayCommand, (ExecutedRoutedEventHandler)delegate
			{
				OnPlayCommand();
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.SaveCommand, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				string text = e.Parameter as string;
				if (!string.IsNullOrEmpty(text))
				{
					vm.IsPlay = false;
					OnSaveCommand(text);
				}
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.StartCommand, (ExecutedRoutedEventHandler)delegate
			{
				vm.Start = vm.Current;
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.SetEndCommand, (ExecutedRoutedEventHandler)delegate
			{
				vm.End = vm.Current;
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.RingtoneCommand, (ExecutedRoutedEventHandler)delegate
			{
				OnRingtoneCommand();
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.IncreaseCommand, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				string text = e.Parameter as string;
				if (text == "StartTime")
				{
					if (vm.Start + 1.0 < vm.End)
					{
						vm.Start += 1.0;
					}
					else
					{
						vm.Start = vm.End;
					}
				}
				else if (text == "EndTime")
				{
					if (vm.End + 1.0 < vm.Max)
					{
						vm.End += 1.0;
					}
					else
					{
						vm.End = vm.Max;
					}
				}
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.DecreaseCommand, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				string text = e.Parameter as string;
				if (text == "StartTime")
				{
					if (vm.Start - 1.0 < 0.0)
					{
						vm.Start = 0.0;
					}
					else
					{
						vm.Start -= 1.0;
					}
				}
				else if (text == "EndTime")
				{
					if (vm.End - 1.0 < vm.Start)
					{
						vm.End = vm.Start;
					}
					else
					{
						vm.End -= 1.0;
					}
				}
			}));
			((UIElement)this).CommandBindings.Add(new CommandBinding(vm.SelModelCommand, (ExecutedRoutedEventHandler)delegate
			{
				((UIElement)saveModel).BeginAnimation(Popup.IsOpenProperty, (AnimationTimeline)null);
				saveModel.IsOpen = true;
			}));
			((FrameworkElement)this).DataContext = vm;
			player.StartChangedEvent = delegate(double param)
			{
				if (reader != null && vm.Current < param)
				{
					reader.TimeCurrent = param;
					vm.Current = param;
				}
			};
			player.EndChangedEvent = delegate(double param)
			{
				if (reader != null && vm.Current > param)
				{
					vm.Current = param;
				}
			};
			WaveCallbackInfo callbackInfo = WaveCallbackInfo.FunctionCallback();
			waveOut = new WaveOut(callbackInfo);
			waveOut.DeviceNumber = 0;
			waveOut.DesiredLatency = 300;
			HostProxy.deviceManager.MasterDeviceChanged += DeviceManager_MasterDeviceChanged;
		}

		private void DeviceManager_MasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				e.Current.SoftStatusChanged += Current_SoftStatusChanged;
			}
			else
			{
				vm.IsDevOnLine = false;
			}
			if (e.Previous != null)
			{
				e.Previous.SoftStatusChanged -= Current_SoftStatusChanged;
			}
		}

		private void Current_SoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Invalid comparison between Unknown and I4
			vm.IsDevOnLine = (int)e == 2;
		}

		private void OnLoadCommand()
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Expected O, but got Unknown
			OpenFileDialog dlg = new OpenFileDialog();
			((FileDialog)dlg).Filter = "MP3|*.mp3";
			dlg.Multiselect = false;
			if (((CommonDialog)dlg).ShowDialog() != true)
			{
				return;
			}
			StopMusic();
			vm.PlayTime = 0.0;
			vm.MediaFile = string.Empty;
			AnimationProgressWindow prg = new AnimationProgressWindow("K0235");
			Task.Factory.StartNew(delegate
			{
				try
				{
					stream = File.Open(((FileDialog)dlg).FileName, FileMode.Open);
					reader = new Mp3FileReader(stream);
					int num = 0;
					double num2 = 0.0;
					short[] array = new short[4800];
					new List<short>();
					List<double> dataArr = new List<double>();
					reader.ReadNextFrame();
					reader.ReadFrameSample(array);
					while ((num = reader.ReadFrameSample(array)) != 0)
					{
						num2 = array.Take(num).Average((short p) => Math.Abs(p));
						dataArr.Add(num2);
					}
					vm.Max = reader.TotalTime.TotalSeconds;
					if (dataArr.Count < 200)
					{
						((DispatcherObject)player).Dispatcher.Invoke((Action)delegate
						{
							player.ItemsSource = dataArr;
						});
					}
					else
					{
						List<double> list = new List<double>();
						double num3 = (double)dataArr.Count / Convert.ToDouble(200);
						for (int num4 = 0; num4 < 200; num4++)
						{
							list.Add(dataArr.Skip((int)((double)num4 * num3)).Take((int)num3).Sum() / num3);
						}
						((DispatcherObject)player).Dispatcher.Invoke((Action)delegate
						{
							player.ItemsSource = list;
						});
					}
					vm.MediaFile = ((FileDialog)dlg).FileName;
					vm.FileName = ((FileDialog)dlg).SafeFileName;
				}
				catch
				{
					StopMusic();
				}
				finally
				{
					((DispatcherObject)prg).Dispatcher.Invoke((Action)delegate
					{
						((Window)prg).Close();
					});
				}
			});
			MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)prg, (bool?)true);
		}

		private void OnPlayCommand()
		{
			if (vm.IsPlay)
			{
				if (WaveOut.DeviceCount <= 0 || string.IsNullOrEmpty(vm.MediaFile))
				{
					vm.IsPlay = false;
					return;
				}
				if (!vm.IsPause || vm.Current < vm.Start || vm.Current >= vm.End)
				{
					waveOut.Stop();
					reader.Seek(0L, SeekOrigin.Begin);
					MeteringSampleProvider sampleProvider = new MeteringSampleProvider(new SampleChannel(reader, forceStereo: true));
					waveOut.Init(sampleProvider);
					vm.Current = vm.Start;
				}
				vm.IsPause = false;
				reader.TimeCurrent = vm.Current;
				waveOut.Play();
				Task.Factory.StartNew(delegate
				{
					isThreadActive = true;
					while (isThreadActive && reader.Position < reader.Length && !(vm.Current > vm.End))
					{
						vm.Current = reader.CurrentTime.TotalSeconds;
						vm.PlayTime = vm.Current - vm.Start;
						Thread.Sleep(20);
					}
					waveOut.Stop();
					vm.IsPlay = false;
					isThreadActive = false;
				});
			}
			else
			{
				waveOut.Pause();
				vm.IsPause = true;
				isThreadActive = false;
			}
		}

		private async void OnSaveCommand(string param)
		{
			if (!(await ValidateMusicEditOk()))
			{
				return;
			}
			string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(vm.MediaFile);
			string ringtoneFileName = GetRingtoneFileName(fileNameWithoutExtension, param);
			if (!string.IsNullOrEmpty(ringtoneFileName))
			{
				if (param == "PC")
				{
					SaveToPC(ringtoneFileName);
				}
				else
				{
					SaveToDevice(ringtoneFileName);
				}
			}
		}

		private void SaveToPC(string file)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Expected O, but got Unknown
			AnimationProgressWindow prg = new AnimationProgressWindow("K0253");
			SaveRingtone(file, delegate(bool isOk)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						string msg = "K0237";
						if (!isOk)
						{
							msg = "K0236";
						}
						((DispatcherObject)prg).Dispatcher.Invoke((Action)delegate
						{
							prg.Message = msg;
							prg.IsBtnVisible = true;
						});
					});
				}
			});
			MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)prg, (bool?)true);
		}

		private void SaveToDevice(string file)
		{
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0049: Expected O, but got Unknown
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice currentDevice = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (currentDevice == null)
			{
				return;
			}
			BusinessData businessData = new BusinessData((BusinessType)2320, (DeviceEx)(object)currentDevice, (BusinessStatus)0);
			HostProxy.PermissionService.BeginConfirmAppIsReady((DeviceEx)(object)currentDevice, "SetRingTone", (CancellationTokenSource)null, (Action<bool?>)async delegate(bool? isReady)
			{
				if (isReady.HasValue && isReady.Value)
				{
					AnimationProgressWindow prg = null;
					Stopwatch sw = new Stopwatch();
					sw.Start();
					SaveRingtone(file, delegate(bool isOk)
					{
						//IL_008b: Unknown result type (might be due to invalid IL or missing references)
						//IL_0090: Unknown result type (might be due to invalid IL or missing references)
						//IL_0091: Unknown result type (might be due to invalid IL or missing references)
						//IL_0093: Invalid comparison between Unknown and I4
						//IL_0106: Unknown result type (might be due to invalid IL or missing references)
						//IL_0108: Invalid comparison between Unknown and I4
						//IL_0118: Unknown result type (might be due to invalid IL or missing references)
						sw.Stop();
						HostProxy.BehaviorService.Collect((BusinessType)2320, businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)(isOk ? 10 : 20), (object)null));
						string msg = string.Empty;
						if (!isOk)
						{
							msg = "K0236";
						}
						else
						{
							TransferResult val = SaveAndSetRingtone(file, "importMusicFiles", "transferStatus", (MusicType)1);
							if ((int)val == 4)
							{
								if (((DeviceEx)currentDevice).Property.AndroidVersion.Contains("6.0"))
								{
									MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)((DispatcherObject)Application.Current).Dispatcher.Invoke<RegrantAppPermissionTips>((Func<RegrantAppPermissionTips>)(() => new RegrantAppPermissionTips
									{
										ShowNow = true
									})), (bool?)true).Wait();
								}
								msg = "K0236";
							}
							else if ((int)val == 2)
							{
								msg = "K0238";
							}
							else
							{
								msg = (((int)val == 0) ? "K0237" : "K0236");
								File.Exists(file);
							}
						}
						Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
						if (currentDispatcher != null)
						{
							currentDispatcher.Invoke((Action)delegate
							{
								prg.Message = msg;
								prg.IsBtnVisible = true;
							});
						}
					});
					await MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)((DispatcherObject)Application.Current).Dispatcher.Invoke<AnimationProgressWindow>((Func<AnimationProgressWindow>)delegate
					{
						//IL_0006: Unknown result type (might be due to invalid IL or missing references)
						//IL_000b: Unknown result type (might be due to invalid IL or missing references)
						//IL_000d: Expected O, but got Unknown
						//IL_0012: Expected O, but got Unknown
						AnimationProgressWindow val = new AnimationProgressWindow("K0253");
						AnimationProgressWindow result = val;
						prg = val;
						return result;
					}), (bool?)true);
				}
			});
		}

		private void OnCloseCommand()
		{
			StopMusic();
			waveOut?.Dispose();
			HostProxy.deviceManager.MasterDeviceChanged -= DeviceManager_MasterDeviceChanged;
		}

		private void StopMusic()
		{
			vm.IsPause = false;
			isThreadActive = false;
			waveOut?.Stop();
			stream?.Close();
			reader?.Close();
			stream = null;
			reader = null;
		}

		private async void OnRingtoneCommand()
		{
			if (!(await ValidateMusicEditOk()))
			{
				return;
			}
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice currentDevice = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (currentDevice == null)
			{
				return;
			}
			BusinessData businessData = new BusinessData((BusinessType)2310, (DeviceEx)(object)currentDevice, (BusinessStatus)0);
			await HostProxy.PermissionService.BeginConfirmAppIsReady((DeviceEx)(object)currentDevice, "SetRingTone", (CancellationTokenSource)null, (Action<bool?>)async delegate(bool? isReady)
			{
				if (isReady.HasValue && isReady.Value)
				{
					AnimationProgressWindow prg = null;
					string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(vm.MediaFile);
					string arg = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Temp");
					string file = string.Format("{0}\\{1}{2}.mp3", arg, fileNameWithoutExtension, DateTime.Now.ToString("yyyyMMddHHmmss"));
					Stopwatch sw = new Stopwatch();
					sw.Start();
					SaveRingtone(file, delegate(bool isOk)
					{
						//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
						//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
						//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
						//IL_00be: Invalid comparison between Unknown and I4
						//IL_0131: Unknown result type (might be due to invalid IL or missing references)
						//IL_0133: Invalid comparison between Unknown and I4
						//IL_0143: Unknown result type (might be due to invalid IL or missing references)
						vm.IsPlay = false;
						sw.Stop();
						HostProxy.BehaviorService.Collect((BusinessType)2310, businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)(isOk ? 10 : 20), (object)null));
						string msg = string.Empty;
						if (!isOk)
						{
							msg = "K0236";
						}
						else
						{
							TransferResult val = SaveAndSetRingtone(file, "setMusicAsRingtone", "setResult", (MusicType)((!vm.IsMessage) ? 1 : 2));
							if ((int)val == 4)
							{
								if (((DeviceEx)currentDevice).Property.AndroidVersion.Contains("6.0"))
								{
									MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)((DispatcherObject)Application.Current).Dispatcher.Invoke<RegrantAppPermissionTips>((Func<RegrantAppPermissionTips>)(() => new RegrantAppPermissionTips
									{
										ShowNow = true
									})), (bool?)true).Wait();
								}
								msg = "K0553";
							}
							else if ((int)val == 2)
							{
								msg = "K0238";
							}
							else
							{
								msg = (((int)val == 0) ? "K0552" : "K0553");
								File.Exists(file);
							}
						}
						Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
						if (currentDispatcher != null)
						{
							currentDispatcher.Invoke((Action)delegate
							{
								prg.Message = msg;
								prg.IsBtnVisible = true;
							});
						}
					});
					await MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)((DispatcherObject)Application.Current).Dispatcher.Invoke<AnimationProgressWindow>((Func<AnimationProgressWindow>)delegate
					{
						//IL_0006: Unknown result type (might be due to invalid IL or missing references)
						//IL_000b: Unknown result type (might be due to invalid IL or missing references)
						//IL_000d: Expected O, but got Unknown
						//IL_0012: Expected O, but got Unknown
						AnimationProgressWindow val = new AnimationProgressWindow("K0253");
						AnimationProgressWindow result = val;
						prg = val;
						return result;
					}), (bool?)true);
				}
			});
		}

		private void SaveRingtone(string fileName, Action<bool> callback = null)
		{
			if (string.IsNullOrEmpty(fileName) || fileName.Length >= 255)
			{
				callback?.Invoke(obj: false);
				return;
			}
			waveOut.Stop();
			Task.Factory.StartNew(delegate
			{
				try
				{
					reader.Seek(0L, SeekOrigin.Begin);
					using (FileStream fileStream = File.Open(fileName, FileMode.Create))
					{
						if (reader.Id3v2Tag != null)
						{
							fileStream.Write(reader.Id3v2Tag.RawData, 0, reader.Id3v2Tag.RawData.Length);
						}
						reader.TimeCurrent = vm.End;
						int frameIndex = reader.FrameIndex;
						long position = stream.Position;
						reader.TimeCurrent = vm.Start;
						int frameIndex2 = reader.FrameIndex;
						long num = position - stream.Position;
						if (reader.XingHeader != null)
						{
							reader.XingHeader.Frames = frameIndex - reader.FrameIndex;
							reader.XingHeader.Bytes = (int)num;
							fileStream.Write(reader.XingHeader.Mp3Frame.RawData, 0, reader.XingHeader.Mp3Frame.RawData.Length);
						}
						int num2 = 10240;
						int count = num2;
						byte[] array = new byte[num2];
						if (!vm.IsFadein && !vm.IsFadeout)
						{
							int num3 = 0;
							while (num3 < num)
							{
								if (num3 + num2 > num)
								{
									count = (int)(num - num3);
								}
								num3 += num2;
								stream.Read(array, 0, count);
								fileStream.Write(array, 0, count);
							}
						}
						else
						{
							IntPtr context = LameApi.lame_init();
							LameApi.lame_set_in_samplerate(context, reader.WaveFormat.SampleRate);
							LameApi.lame_set_VBR(context, VBRMode.MTRH);
							LameApi.lame_set_brate(context, 128);
							LameApi.lame_set_num_channels(context, reader.WaveFormat.Channels);
							LameApi.lame_set_mode(context, MPEGMode.JointStereo);
							LameApi.lame_init_params(context);
							short[] array2 = new short[9600];
							reader.TimeCurrent = vm.Start;
							int num4 = 0;
							int num5 = 0;
							int num6 = 0;
							int num7 = 0;
							if (frameIndex - frameIndex2 < 384)
							{
								num4 = (num5 = frameIndex2 + (frameIndex - frameIndex2) / 2);
								num6 = (frameIndex - frameIndex2) / 18;
							}
							else
							{
								num4 = frameIndex2 + 192;
								num5 = frameIndex - 192;
								num6 = 21;
							}
							double num8 = 0.0;
							bool flag = false;
							bool flag2 = false;
							for (int i = frameIndex2; i <= frameIndex; i++)
							{
								flag = vm.IsFadein && i <= num4;
								flag2 = vm.IsFadeout && i >= num5;
								if (flag || flag2)
								{
									num8 = ((!flag) ? (0.9 - (double)((i - num5) / num6) * 0.1) : (0.1 + (double)((i - frameIndex2) / num6) * 0.1));
									num7 = reader.ReadFrameSample(array2);
									for (int j = 0; j < num7; j++)
									{
										array2[j] = (short)((double)array2[j] * num8);
									}
									count = LameApi.lame_encode_buffer_interleaved(context, array2, num7 / reader.WaveFormat.Channels, array, num2);
									fileStream.Write(array, 0, count);
									if (i == num4 || i == frameIndex)
									{
										count = LameApi.lame_encode_flush(context, array, num2);
										fileStream.Write(array, 0, count);
									}
								}
								else
								{
									Mp3Frame mp3Frame = reader.ReadNextFrame();
									fileStream.Write(mp3Frame.RawData, 0, mp3Frame.FrameLength);
								}
							}
							LameApi.lame_close(context);
						}
						if (reader.Id3v1Tag != null)
						{
							fileStream.Write(reader.Id3v1Tag, 0, reader.Id3v1Tag.Length);
						}
						fileStream.Flush();
						fileStream.Close();
					}
					callback?.Invoke(obj: true);
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Warn("Create ringtone file fail:" + ex, false);
					callback?.Invoke(obj: false);
				}
			});
		}

		public bool AnalysisResult(string strJson, string valueKey)
		{
			List<PropItem> list = JsonUtils.Parse<List<PropItem>>(strJson);
			if (list == null)
			{
				return false;
			}
			PropItem val = list.FirstOrDefault((PropItem p) => p.Key.Equals(valueKey));
			if (val == null)
			{
				return false;
			}
			return val.Value.Equals("true");
		}

		private TransferResult SaveAndSetRingtone(string fileName, string actionName, string resultKey, MusicType type)
		{
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bf: Expected O, but got Unknown
			//IL_00f3: Unknown result type (might be due to invalid IL or missing references)
			if (!string.IsNullOrEmpty(fileName))
			{
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
				if (val != null)
				{
					string appSaveDir = ((DeviceEx)val).Property.InternalStoragePath + "/LMSA/Audio/";
					bool importIsSuccess = false;
					new ImportAndExportWrapper().ImportFileWithNoProgress(19, new List<string> { fileName }, (Func<string, string>)((string sourcePath) => appSaveDir + Path.GetFileName(sourcePath)), (Action<string, bool>)delegate(string path, bool isSuccess)
					{
						importIsSuccess = isSuccess;
					}, (Action<long, long>)null);
					if (importIsSuccess)
					{
						if (!(actionName == "importMusicFiles"))
						{
							if (actionName == "setMusicAsRingtone")
							{
								Thread.Sleep(4000);
								DeviceMusicManagement val2 = new DeviceMusicManagement();
								List<MusicInfo> musicListByName = val2.GetMusicListByName(Path.GetFileName(fileName));
								if (musicListByName != null)
								{
									MusicInfo val3 = musicListByName.FirstOrDefault((MusicInfo m) => m.DisplayName.Equals(Path.GetFileName(fileName)));
									if (val3 != null)
									{
										if (val2.SetMusicAsRingtone(val3, type).Result == 0)
										{
											return (TransferResult)0;
										}
										return (TransferResult)4;
									}
									return (TransferResult)4;
								}
								return (TransferResult)4;
							}
							return (TransferResult)0;
						}
						return (TransferResult)0;
					}
					return (TransferResult)4;
				}
				return (TransferResult)4;
			}
			return (TransferResult)4;
		}

		private string GetRingtoneFileName(string name, string param)
		{
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Invalid comparison between I4 and Unknown
			string arg = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Temp");
			if (param == "PC")
			{
				FolderBrowserDialog val = new FolderBrowserDialog();
				val.SelectedPath = Path.GetDirectoryName(vm.MediaFile);
				val.ShowNewFolderButton = true;
				if (1 != (int)FolderBrowserLauncher.ShowFolderBrowser(val))
				{
					return string.Empty;
				}
				arg = val.SelectedPath;
			}
			string text = string.Format("{0}//{1}{2}.mp3", arg, name, DateTime.Now.ToString("yyyyMMddHHmmss"));
			HostProxy.ResourcesLoggingService.RegisterFile(text);
			return text;
		}

		private async Task<bool> ValidateMusicEditOk()
		{
			if (string.IsNullOrEmpty(vm.MediaFile))
			{
				return false;
			}
			if (vm.End - vm.Start < 4.0)
			{
				await MessageWindowHelper.Instance.Show("K0071", "K0240", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				return false;
			}
			return true;
		}

		public void Dispose()
		{
			HostProxy.deviceManager.MasterDeviceChanged -= DeviceManager_MasterDeviceChanged;
			RingtoneMakerModel ringtoneMakerModel = vm;
			if (ringtoneMakerModel != null)
			{
				((ViewModelBase)ringtoneMakerModel).Dispose();
			}
			waveOut?.Dispose();
			stream?.Dispose();
			reader?.Dispose();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/usercontrolsv6/ringtonemakerviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		internal Delegate _CreateDelegate(Type delegateType, string handler)
		{
			return Delegate.CreateDelegate(delegateType, this, handler);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Expected O, but got Unknown
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				player = (PlayerCtrlV6)target;
				break;
			case 2:
				btnSave = (LangButton)target;
				break;
			case 3:
				saveModel = (Popup)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class ScreenCaptureFrameV6 : UserControl, IDisposable, IComponentConnector, IStyleConnector
	{
		[Serializable]
		[CompilerGenerated]
		private sealed class <>c
		{
			public static readonly <>c <>9 = new <>c();

			public static RoutedEventHandler <>9__1_0;

			public static Func<CaptureVideoItemDetailViewModelV6, bool> <>9__8_0;

			public static Func<CaptureVideoItemDetailViewModelV6, bool> <>9__8_1;

			public static Func<CaptureVideoItemDetailViewModelV6, bool> <>9__9_0;

			public static Func<CaptureVideoItemDetailViewModelV6, bool> <>9__9_1;

			internal void <.ctor>b__1_0(object obj, RoutedEventArgs e)
			{
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0017: Invalid comparison between Unknown and I4
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				if (masterDevice == null || (int)masterDevice.SoftStatus != 2)
				{
					ToolboxViewContext.SingleInstance.ShowTutorialsView();
				}
			}

			internal bool <CellCheckBoxClick>b__8_0(CaptureVideoItemDetailViewModelV6 p)
			{
				return !p.IsChecked;
			}

			internal bool <CellCheckBoxClick>b__8_1(CaptureVideoItemDetailViewModelV6 p)
			{
				return p.IsChecked;
			}

			internal bool <lbTileVideoSelectionChanged>b__9_0(CaptureVideoItemDetailViewModelV6 v)
			{
				return v.IsChecked;
			}

			internal bool <lbTileVideoSelectionChanged>b__9_1(CaptureVideoItemDetailViewModelV6 p)
			{
				return !p.IsChecked;
			}
		}

		private ScreenCaptureFrameViewModeV6 _VM;

		internal LangButton btnExport;

		internal IconButton btnDelete;

		internal StackPanel spForVideo;

		internal RadioButton rbtListView;

		internal RadioButton rbtTileView;

		internal Grid VideoView;

		internal DataGrid dg;

		internal ScrollViewer VideoTileView;

		internal ListBox lbTileView;

		private bool _contentLoaded;

		private ScreenCaptureFrameViewModeV6 GetCurrentContext => _VM;

		public ScreenCaptureFrameV6()
		{
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			InitializeComponent();
			_VM = new ScreenCaptureFrameViewModeV6();
			((FrameworkElement)this).DataContext = _VM;
			object obj = <>c.<>9__1_0;
			if (obj == null)
			{
				RoutedEventHandler val = delegate
				{
					//IL_0011: Unknown result type (might be due to invalid IL or missing references)
					//IL_0017: Invalid comparison between Unknown and I4
					DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
					if (masterDevice == null || (int)masterDevice.SoftStatus != 2)
					{
						ToolboxViewContext.SingleInstance.ShowTutorialsView();
					}
				};
				<>c.<>9__1_0 = val;
				obj = (object)val;
			}
			((FrameworkElement)this).Loaded += (RoutedEventHandler)obj;
		}

		public void Dispose()
		{
			((ViewModelBase)_VM).Dispose();
			_VM = null;
		}

		private void ViewButtonClick(object sender, RoutedEventArgs e)
		{
		}

		private void VideoTileList_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			ScrollViewer val = (ScrollViewer)sender;
			val.ScrollToVerticalOffset(val.VerticalOffset - (double)(e.Delta / 2));
			((RoutedEventArgs)e).Handled = true;
		}

		private void CheckAllClick(object sender, RoutedEventArgs e)
		{
			CheckBox val = (CheckBox)((sender is CheckBox) ? sender : null);
			if (val != null && ((ToggleButton)val).IsChecked.HasValue)
			{
				bool _checked = ((ToggleButton)val).IsChecked.Value;
				GetCurrentContext.VideoDataList.All(delegate(CaptureVideoItemDetailViewModelV6 v)
				{
					v.IsChecked = _checked;
					return true;
				});
				LangButton obj = btnExport;
				bool isEnabled = (((UIElement)btnDelete).IsEnabled = GetCurrentContext.VideoDataList.Count != 0 && ((ToggleButton)val).IsChecked.Value);
				((UIElement)obj).IsEnabled = isEnabled;
				if (!((ToggleButton)val).IsChecked.Value && lbTileView.SelectedItems.Count > 0)
				{
					((Selector)lbTileView).SelectedIndex = -1;
				}
			}
		}

		private void CellCheckBoxClick(object sender, RoutedEventArgs e)
		{
			CheckBox val = (CheckBox)((sender is CheckBox) ? sender : null);
			if (val == null || !((ToggleButton)val).IsChecked.HasValue)
			{
				return;
			}
			if (((ToggleButton)val).IsChecked == true)
			{
				LangButton obj = btnExport;
				bool isEnabled = (((UIElement)btnDelete).IsEnabled = true);
				((UIElement)obj).IsEnabled = isEnabled;
				GetCurrentContext.IsAllSelected = !GetCurrentContext.VideoDataList.Any((CaptureVideoItemDetailViewModelV6 p) => !p.IsChecked);
			}
			else
			{
				LangButton obj2 = btnExport;
				bool isEnabled = (((UIElement)btnDelete).IsEnabled = GetCurrentContext.VideoDataList.Any((CaptureVideoItemDetailViewModelV6 p) => p.IsChecked));
				((UIElement)obj2).IsEnabled = isEnabled;
				GetCurrentContext.IsAllSelected = false;
			}
		}

		private void lbTileVideoSelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (GetCurrentContext.VideoDataList.Any((CaptureVideoItemDetailViewModelV6 v) => v.IsChecked))
			{
				LangButton obj = btnExport;
				bool isEnabled = (((UIElement)btnDelete).IsEnabled = true);
				((UIElement)obj).IsEnabled = isEnabled;
				GetCurrentContext.IsAllSelected = !GetCurrentContext.VideoDataList.Any((CaptureVideoItemDetailViewModelV6 p) => !p.IsChecked);
			}
			else
			{
				LangButton obj2 = btnExport;
				bool isEnabled = (((UIElement)btnDelete).IsEnabled = false);
				((UIElement)obj2).IsEnabled = isEnabled;
				GetCurrentContext.IsAllSelected = false;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/usercontrolsv6/screencaptureframev6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Expected O, but got Unknown
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Expected O, but got Unknown
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a7: Expected O, but got Unknown
			//IL_00aa: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Expected O, but got Unknown
			//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c1: Expected O, but got Unknown
			//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ce: Expected O, but got Unknown
			//IL_00db: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e5: Expected O, but got Unknown
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f2: Expected O, but got Unknown
			//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
			//IL_0109: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnExport = (LangButton)target;
				break;
			case 2:
				btnDelete = (IconButton)target;
				break;
			case 3:
				spForVideo = (StackPanel)target;
				break;
			case 4:
				rbtListView = (RadioButton)target;
				((ButtonBase)rbtListView).Click += new RoutedEventHandler(ViewButtonClick);
				break;
			case 5:
				rbtTileView = (RadioButton)target;
				((ButtonBase)rbtTileView).Click += new RoutedEventHandler(ViewButtonClick);
				break;
			case 6:
				VideoView = (Grid)target;
				break;
			case 7:
				dg = (DataGrid)target;
				break;
			case 10:
				VideoTileView = (ScrollViewer)target;
				((UIElement)VideoTileView).PreviewMouseWheel += new MouseWheelEventHandler(VideoTileList_PreviewMouseWheel);
				break;
			case 11:
				lbTileView = (ListBox)target;
				((Selector)lbTileView).SelectionChanged += new SelectionChangedEventHandler(lbTileVideoSelectionChanged);
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
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected O, but got Unknown
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			switch (connectionId)
			{
			case 8:
				((ButtonBase)(CheckBox)target).Click += new RoutedEventHandler(CheckAllClick);
				break;
			case 9:
				((ButtonBase)(CheckBox)target).Click += new RoutedEventHandler(CellCheckBoxClick);
				break;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.ScreenPlayer
{
	public class AVDecoderHelper
	{
		private int_array4 stride;

		private byte_ptrArray4 render_data;

		private unsafe AVPacket* packet = null;

		private unsafe AVFrame* encode_frame = null;

		private unsafe SwsContext* swcontext = null;

		private unsafe AVCodecContext* decoderCtx = null;

		public unsafe AVDecoderHelper()
		{
			stride = default(int_array4);
			render_data = default(byte_ptrArray4);
			AVCodec* codec = ffmpeg.avcodec_find_decoder(AVCodecID.AV_CODEC_ID_H264);
			decoderCtx = ffmpeg.avcodec_alloc_context3(codec);
			ffmpeg.avcodec_open2(decoderCtx, codec, null);
			packet = (AVPacket*)ffmpeg.av_malloc((ulong)sizeof(AVPacket));
			encode_frame = ffmpeg.av_frame_alloc();
		}

		public unsafe void SizeChanged(int width, int height, byte* buff, int srcWidth, int srcHeight)
		{
			ffmpeg.av_image_fill_arrays(ref render_data, ref stride, buff, AVPixelFormat.AV_PIX_FMT_BGRA, width, height, 1);
			if (swcontext != null)
			{
				ffmpeg.sws_freeContext(swcontext);
			}
			swcontext = ffmpeg.sws_getContext(srcWidth, srcHeight, AVPixelFormat.AV_PIX_FMT_YUV420P, width, height, AVPixelFormat.AV_PIX_FMT_BGRA, 4, null, null, null);
		}

		public unsafe bool DecodeFrame(byte[] buff, int len, int offset = 4)
		{
			if (packet == null || decoderCtx == null || swcontext == null)
			{
				return false;
			}
			try
			{
				ffmpeg.av_new_packet(packet, len);
				Marshal.Copy(buff, offset, (IntPtr)packet->data, len);
				ffmpeg.avcodec_send_packet(decoderCtx, packet);
				ffmpeg.av_packet_unref(packet);
				if (ffmpeg.avcodec_receive_frame(decoderCtx, encode_frame) < 0)
				{
					return false;
				}
				return ffmpeg.sws_scale(swcontext, encode_frame->data, encode_frame->linesize, 0, encode_frame->height, render_data, stride) > 0;
			}
			catch
			{
				return false;
			}
		}

		public unsafe void Release()
		{
			ffmpeg.avcodec_close(decoderCtx);
			fixed (AVCodecContext** avctx = &decoderCtx)
			{
				ffmpeg.avcodec_free_context(avctx);
			}
			ffmpeg.av_free(packet);
			fixed (AVFrame** frame = &encode_frame)
			{
				ffmpeg.av_frame_free(frame);
			}
			ffmpeg.sws_freeContext(swcontext);
		}
	}
	public class MAHideNotifyView : Window, IComponentConnector
	{
		private bool _contentLoaded;

		public MAHideNotifyViewModel VM { get; private set; }

		public MAHideNotifyView()
		{
			InitializeComponent();
			VM = new MAHideNotifyViewModel((Window)(object)this);
			((FrameworkElement)this).DataContext = VM;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/screenplayer/mahidenotifyview.xaml", UriKind.Relative);
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
	public class MAHideNotifyViewModel : NotifyBase
	{
		public bool IsOk { get; private set; }

		public ReplayCommand NextCommand { get; set; }

		public ReplayCommand CloseCommand { get; set; }

		public MAHideNotifyViewModel(Window wnd)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Expected O, but got Unknown
			MAHideNotifyViewModel mAHideNotifyViewModel = this;
			CloseCommand = new ReplayCommand((Action<object>)delegate(object param)
			{
				mAHideNotifyViewModel.IsOk = Convert.ToBoolean(param as string);
				wnd.Close();
			});
		}
	}
	public class NoNetworkView : Window, IComponentConnector
	{
		private bool _contentLoaded;

		public NoNetworkViewModel VM { get; set; }

		public NoNetworkView()
		{
			InitializeComponent();
			VM = new NoNetworkViewModel((Window)(object)this);
			((FrameworkElement)this).DataContext = VM;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/screenplayer/nonetworkview.xaml", UriKind.Relative);
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
	public class NoNetworkViewModel : NotifyBase
	{
		public ReplayCommand TutorialCommand { get; set; }

		public ReplayCommand CloseCommand { get; set; }

		public bool IsOk { get; private set; }

		public NoNetworkViewModel(Window wnd)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Expected O, but got Unknown
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Expected O, but got Unknown
			NoNetworkViewModel noNetworkViewModel = this;
			TutorialCommand = new ReplayCommand((Action<object>)delegate
			{
				noNetworkViewModel.IsOk = true;
				wnd.Close();
			});
			CloseCommand = new ReplayCommand((Action<object>)delegate
			{
				noNetworkViewModel.IsOk = false;
				wnd.Close();
			});
		}
	}
	public class UsbConnectView : Window, IComponentConnector
	{
		internal RadioButton btnPhone;

		internal RadioButton btnTablet;

		internal LangButton btnStart;

		private bool _contentLoaded;

		public UsbConnectViewModel VM { get; set; }

		public UsbConnectView()
		{
			InitializeComponent();
			VM = new UsbConnectViewModel((Window)(object)this);
			((FrameworkElement)this).DataContext = VM;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/screenplayer/usbconnectview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Expected O, but got Unknown
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnPhone = (RadioButton)target;
				break;
			case 2:
				btnTablet = (RadioButton)target;
				break;
			case 3:
				btnStart = (LangButton)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class UsbConnectViewModel : NotifyBase
	{
		private bool _IsBtnEnable;

		private Visibility _DeviceLoadingVisible;

		public ReplayCommand NextCommand { get; set; }

		public ReplayCommand CloseCommand { get; set; }

		public ReplayCommand TutorialCommand { get; set; }

		public ReplayCommand DownloadCommand { get; set; }

		public bool IsOk { get; set; }

		public int CloseMode { get; set; }

		public bool IsBtnEnable
		{
			get
			{
				return _IsBtnEnable;
			}
			set
			{
				_IsBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsBtnEnable");
			}
		}

		public Visibility DeviceLoadingVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _DeviceLoadingVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_DeviceLoadingVisible = value;
				((NotifyBase)this).OnPropertyChanged("DeviceLoadingVisible");
			}
		}

		public UsbConnectViewModel(Window wnd)
		{
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Expected O, but got Unknown
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Expected O, but got Unknown
			//IL_006f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Expected O, but got Unknown
			//IL_0099: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a3: Expected O, but got Unknown
			UsbConnectViewModel usbConnectViewModel = this;
			DeviceLoadingVisible = (Visibility)2;
			NextCommand = new ReplayCommand((Action<object>)delegate(object param)
			{
				usbConnectViewModel.IsOk = true;
				usbConnectViewModel.CloseMode = (Convert.ToBoolean(param) ? 1 : 2);
				if (HostProxy.deviceManager.MasterDevice != null)
				{
					HostProxy.deviceManager.MasterDevice.SoftStatusChanged -= usbConnectViewModel.OnMasterDeviceOnLine;
				}
				HostProxy.deviceManager.MasterDeviceChanged -= usbConnectViewModel.OnMasterDeviceChanged;
				HostProxy.CurrentDispatcher.Invoke((Action)delegate
				{
					wnd.Close();
				});
			});
			CloseCommand = new ReplayCommand((Action<object>)delegate
			{
				usbConnectViewModel.IsOk = false;
				usbConnectViewModel.CloseMode = 0;
				if (HostProxy.deviceManager.MasterDevice != null)
				{
					HostProxy.deviceManager.MasterDevice.SoftStatusChanged -= usbConnectViewModel.OnMasterDeviceOnLine;
				}
				HostProxy.deviceManager.MasterDeviceChanged -= usbConnectViewModel.OnMasterDeviceChanged;
				HostProxy.CurrentDispatcher.Invoke((Action)delegate
				{
					wnd.Close();
				});
			});
			TutorialCommand = new ReplayCommand((Action<object>)delegate
			{
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_0016: Expected O, but got Unknown
				MessageWindowHelper.Instance.Show((IMessageWindowV6)new UsbDebugTutorialView(false), (bool?)true);
			});
			DownloadCommand = new ReplayCommand((Action<object>)delegate
			{
				GlobalFun.OpenUrlByBrowser(Configurations.QrCodeDownloadMaUrl);
			});
			IsBtnEnable = false;
			if (HostProxy.deviceManager.MasterDevice != null)
			{
				HostProxy.deviceManager.MasterDevice.SoftStatusChanged += OnMasterDeviceOnLine;
			}
			HostProxy.deviceManager.MasterDeviceChanged += OnMasterDeviceChanged;
		}

		private void OnMasterDeviceOnLine(object sender, DeviceSoftStateEx e)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Invalid comparison between Unknown and I4
			if ((int)e == 2)
			{
				DeviceLoadingVisible = (Visibility)2;
				NextCommand.Execute((object)true);
			}
		}

		private void OnMasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				DeviceLoadingVisible = (Visibility)0;
				e.Current.SoftStatusChanged += OnMasterDeviceOnLine;
			}
			if (e.Previous != null)
			{
				if (e.Current == null)
				{
					DeviceLoadingVisible = (Visibility)2;
				}
				e.Previous.SoftStatusChanged -= OnMasterDeviceOnLine;
			}
		}
	}
	public class WifiConnectView : Window, IComponentConnector
	{
		internal Image qcode;

		private bool _contentLoaded;

		public WifiConnectViewModel VM { get; set; }

		public WifiConnectView()
		{
			InitializeComponent();
			VM = new WifiConnectViewModel((Window)(object)this);
			((FrameworkElement)this).DataContext = VM;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/screenplayer/wificonnectview.xaml", UriKind.Relative);
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
				qcode = (Image)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class WifiConnectViewModel : NotifyBase
	{
		private bool _IsBtnEnable;

		private string _IPAddress;

		private ImageSource _QrCodeImage;

		public ReplayCommand TutorialCommand { get; set; }

		public ReplayCommand CloseCommand { get; set; }

		public bool? IsConnectedtoMA { get; set; }

		public bool IsBtnEnable
		{
			get
			{
				return _IsBtnEnable;
			}
			set
			{
				_IsBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsBtnEnable");
			}
		}

		public string IPAddress
		{
			get
			{
				return _IPAddress;
			}
			set
			{
				_IPAddress = value;
				((NotifyBase)this).OnPropertyChanged("IPAddress");
			}
		}

		public ImageSource QrCodeImage
		{
			get
			{
				return _QrCodeImage;
			}
			set
			{
				_QrCodeImage = value;
				((NotifyBase)this).OnPropertyChanged("QrCodeImage");
			}
		}

		public WifiConnectViewModel(Window wnd)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_0084: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Expected O, but got Unknown
			WifiConnectViewModel wifiConnectViewModel = this;
			CloseCommand = new ReplayCommand((Action<object>)delegate(object param)
			{
				//IL_0069: Unknown result type (might be due to invalid IL or missing references)
				//IL_0073: Expected O, but got Unknown
				wifiConnectViewModel.IsConnectedtoMA = (bool?)param;
				if (HostProxy.deviceManager.MasterDevice != null)
				{
					HostProxy.deviceManager.MasterDevice.SoftStatusChanged -= wifiConnectViewModel.OnMasterDeviceOnLine;
				}
				HostProxy.deviceManager.MasterDeviceChanged -= wifiConnectViewModel.OnMasterDeviceChanged;
				HostProxy.deviceManager.WifiMonitoringEndPointChanged -= new WirelessMornitoringAddressChangedHandler(wifiConnectViewModel.OnWifiMonitoringEndPointChanged);
				HostProxy.CurrentDispatcher.Invoke((Action)delegate
				{
					wnd.Close();
				});
			});
			TutorialCommand = new ReplayCommand((Action<object>)delegate
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Expected O, but got Unknown
				GifDisplayWindow val = new GifDisplayWindow();
				val.VM.Init("K1062", new Uri[3]
				{
					new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.toolbox;component/Resources/tutorial1.gif"),
					new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.toolbox;component/Resources/tutorial2.gif"),
					new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.toolbox;component/Resources/tutorial3.gif")
				}, new string[3] { "K1063", "K1064", "K1065" });
				MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)val, (bool?)true);
			});
			IsBtnEnable = false;
			HostProxy.deviceManager.MasterDeviceChanged += OnMasterDeviceChanged;
			HostProxy.deviceManager.WifiMonitoringEndPointChanged += new WirelessMornitoringAddressChangedHandler(OnWifiMonitoringEndPointChanged);
			OnWifiMonitoringEndPointChanged(HostProxy.deviceManager.WirelessWaitForConnectEndPoints);
		}

		private void OnWifiMonitoringEndPointChanged(List<Tuple<string, string>> ipGateWayArr)
		{
			if (ipGateWayArr == null)
			{
				return;
			}
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.Append($"V:{Configurations.AppMinVersionCodeOfMA}").Append(Environment.NewLine);
			stringBuilder.Append($"DV:{Configurations.AppMinVersionCodeOfMoto}").Append(Environment.NewLine);
			string text = string.Empty;
			foreach (Tuple<string, string> item in ipGateWayArr)
			{
				stringBuilder.Append("IP:").Append(item.Item1).Append(Environment.NewLine);
				stringBuilder.Append("GATEWAY:").Append(item.Item2).Append(Environment.NewLine);
				string[] array = item.Item1.Split(new char[1] { ':' });
				if (array.Length == 2)
				{
					text = text + array[0] + "; ";
				}
			}
			IPAddress = (string.IsNullOrEmpty(text) ? "No ip available" : text.Trim(new char[1] { ' ' }).Trim(new char[1] { ';' }));
			try
			{
				MemoryStream stream = QrCodeUtility.GenerateQrCodeImageStream(stringBuilder.ToString());
				HostProxy.CurrentDispatcher.BeginInvoke((Delegate)(Action)delegate
				{
					//IL_0000: Unknown result type (might be due to invalid IL or missing references)
					//IL_0006: Expected O, but got Unknown
					BitmapImage val = new BitmapImage();
					val.BeginInit();
					val.StreamSource = new MemoryStream(stream.ToArray());
					val.EndInit();
					QrCodeImage = (ImageSource)(object)val;
				}, Array.Empty<object>());
			}
			catch (Exception)
			{
			}
		}

		private void OnMasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				e.Current.SoftStatusChanged += OnMasterDeviceOnLine;
			}
			if (e.Previous != null)
			{
				e.Previous.SoftStatusChanged -= OnMasterDeviceOnLine;
			}
		}

		private void OnMasterDeviceOnLine(object sender, DeviceSoftStateEx e)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Invalid comparison between Unknown and I4
			if ((int)e == 2)
			{
				CloseCommand.Execute((object)false);
			}
		}
	}
	public class FFmpegBinariesHelper
	{
		internal static void RegisterFFmpegBinaries()
		{
			string text = Environment.CurrentDirectory;
			string path = "FFmpeg";
			while (text != null)
			{
				string text2 = Path.Combine(text, path);
				if (Directory.Exists(text2))
				{
					ffmpeg.RootPath = text2;
					break;
				}
				text = Directory.GetParent(text)?.FullName;
			}
		}
	}
	internal static class FFmpegHelper
	{
		public unsafe static string av_strerror(int error)
		{
			int num = 1024;
			byte* ptr = stackalloc byte[(int)(uint)num];
			ffmpeg.av_strerror(error, ptr, (ulong)num);
			return Marshal.PtrToStringAnsi((IntPtr)ptr);
		}

		public static string GetErrorMessage(int error)
		{
			if (error < 0)
			{
				return "Unknown error occured!";
			}
			return av_strerror(error);
		}
	}
	public class ScreenView : Window, IComponentConnector
	{
		internal Image img;

		private bool _contentLoaded;

		public ScreenView()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/screenplayer/screenview.xaml", UriKind.Relative);
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
				img = (Image)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class ScreenViewModel : NotifyBase
	{
		private string _AuthorizeImagePath;

		private Visibility _IsAuthorize1Visible;

		private Visibility _IsUsbModelVisible;

		private ScreenView _Win;

		private byte[] buff;

		private Int32Rect rectUpdate;

		private WriteableBitmap _Bitmap;

		private AVDecoderHelper decoderHelper;

		private WebSocketSession socketSession;

		private WebSocketServer webSocket;

		private System.Timers.Timer tipTimer;

		private System.Timers.Timer tickTimer;

		private int tickCount;

		private bool isStartMirror;

		private bool isVerticalMode;

		private bool isNormalState;

		private volatile bool IsDecoderUnEable;

		private object async_lock = new object();

		private Stopwatch watch = new Stopwatch();

		public ReplayCommand MinCommand { get; set; }

		public ReplayCommand MaxCommand { get; set; }

		public ReplayCommand CloseCommand { get; set; }

		public string AuthorizeImagePath
		{
			get
			{
				return _AuthorizeImagePath;
			}
			set
			{
				_AuthorizeImagePath = value;
				((NotifyBase)this).OnPropertyChanged("AuthorizeImagePath");
			}
		}

		public Visibility IsAuthorize1Visible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _IsAuthorize1Visible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_IsAuthorize1Visible = value;
				((NotifyBase)this).OnPropertyChanged("IsAuthorize1Visible");
			}
		}

		public Visibility IsUsbModelVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _IsUsbModelVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_IsUsbModelVisible = value;
				((NotifyBase)this).OnPropertyChanged("IsUsbModelVisible");
			}
		}

		public WriteableBitmap Bitmap
		{
			get
			{
				return _Bitmap;
			}
			set
			{
				_Bitmap = value;
				((NotifyBase)this).OnPropertyChanged("Bitmap");
			}
		}

		public Action<Size> OnClientStartEvent { get; set; }

		public bool IsUsbModel { get; set; }

		public ScreenViewModel(ScreenView win)
		{
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Expected O, but got Unknown
			//IL_0077: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Expected O, but got Unknown
			//IL_008e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Expected O, but got Unknown
			_Win = win;
			isStartMirror = false;
			isNormalState = true;
			IsDecoderUnEable = true;
			IsAuthorize1Visible = (Visibility)2;
			_IsUsbModelVisible = (Visibility)2;
			AuthorizeImagePath = "pack://application:,,,/lenovo.mbg.service.lmsa.toolbox;component/Resources/authorize.png";
			MinCommand = new ReplayCommand((Action<object>)delegate
			{
				((Window)_Win).WindowState = (WindowState)1;
			});
			MaxCommand = new ReplayCommand((Action<object>)delegate
			{
				isNormalState = !isNormalState;
				SetWindowSize(isNormalState);
			});
			CloseCommand = new ReplayCommand((Action<object>)delegate
			{
				WebSocketSession webSocketSession = socketSession;
				if (webSocketSession != null && webSocketSession.Connected)
				{
					socketSession.Send("SERVER_STOP");
				}
				Stop();
				NotifyStopCmd();
				lock (async_lock)
				{
					decoderHelper?.Release();
					IsDecoderUnEable = true;
				}
				((Window)_Win).Close();
			});
			buff = new byte[1048576];
			tickTimer = new System.Timers.Timer();
			tickTimer.Interval = 2000.0;
			tickTimer.Elapsed += delegate
			{
				tickCount++;
				WebSocketSession webSocketSession = socketSession;
				if (webSocketSession == null || !webSocketSession.Connected)
				{
					tickTimer.Stop();
					((DispatcherObject)_Win).Dispatcher.Invoke((Action)delegate
					{
						CloseCommand.Execute((object)_Win);
					});
					MessageWindowHelper.Instance.Show((string)null, "K1120", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, true, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
				}
				else if (isStartMirror && tickCount > 30)
				{
					tickTimer.Stop();
					if (MessageWindowHelper.Instance.Show((string)null, "K1114", "K0327", "K0208", false, (MessageBoxImage)64, (string)null, false, true, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Result == true)
					{
						((DispatcherObject)_Win).Dispatcher.Invoke((Action)delegate
						{
							CloseCommand.Execute((object)_Win);
						});
					}
				}
			};
			tipTimer = new System.Timers.Timer();
			tipTimer.Interval = 5000.0;
			tipTimer.Elapsed += delegate
			{
				tipTimer.Stop();
				((DispatcherObject)_Win).Dispatcher.Invoke((Action)delegate
				{
					IsUsbModelVisible = (Visibility)2;
				});
			};
		}

		public void InitFFmpeg(int srcWidth, int srcHeight)
		{
			IsDecoderUnEable = true;
			decoderHelper = new AVDecoderHelper();
			InitBitmapAndDecorder(srcWidth, srcHeight);
			SetWindowSize(isNormalState);
			IsDecoderUnEable = false;
		}

		public void SocketProc(Window wnd, int time)
		{
			if (time != 0)
			{
				return;
			}
			webSocket = new WebSocketServer();
			webSocket.NewSessionConnected += delegate(WebSocketSession session)
			{
				WebSocketSession webSocketSession = socketSession;
				if (webSocketSession == null || !webSocketSession.Connected)
				{
					socketSession = session;
					tickTimer.Start();
				}
				else
				{
					session.Send("CMD_ANOTHER_CONNECTION_EXISTED");
					session.Close(CloseReason.Unknown);
				}
			};
			webSocket.SessionClosed += delegate(WebSocketSession session, CloseReason value)
			{
				if (socketSession?.SessionID == session.SessionID)
				{
					socketSession = null;
				}
			};
			webSocket.NewMessageReceived += delegate(WebSocketSession session, string msg)
			{
				if (!(socketSession?.SessionID != session.SessionID))
				{
					OnNetMsgCommand(msg, session);
				}
			};
			webSocket.NewDataReceived += delegate(WebSocketSession session, byte[] data)
			{
				if (!IsDecoderUnEable && session.Connected && !(socketSession?.SessionID != session.SessionID))
				{
					tickCount = 0;
					lock (async_lock)
					{
						if (!decoderHelper.DecodeFrame(data, data.Length - 4))
						{
							return;
						}
					}
					OnUpdateScreenAfterDataRecv();
				}
			};
			webSocket.Setup(new ServerConfig
			{
				Ip = "Any",
				Port = 10086,
				MaxConnectionNumber = 4,
				MaxRequestLength = 5242880,
				ReceiveBufferSize = 5242880
			});
			webSocket.Start();
		}

		public void Stop()
		{
			tickTimer?.Stop();
			IsDecoderUnEable = true;
			socketSession?.Close();
			webSocket?.Stop();
		}

		[DllImport("kernel32.dll", SetLastError = true)]
		private static extern void RtlMoveMemory(IntPtr dest, IntPtr source, int size);

		private void OnUpdateScreenAfterDataRecv()
		{
			((DispatcherObject)Application.Current).Dispatcher.InvokeAsync((Action)delegate
			{
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				try
				{
					Bitmap.Lock();
					Bitmap.AddDirtyRect(rectUpdate);
				}
				finally
				{
					Bitmap.Unlock();
				}
			});
		}

		private void OnNetMsgCommand(string message, WebSocketSession session)
		{
			((DispatcherObject)_Win).Dispatcher.BeginInvoke((Delegate)(Action)delegate
			{
				//IL_0155: Unknown result type (might be due to invalid IL or missing references)
				string[] array = message.Split(new char[2] { '&', '#' });
				switch (array[0])
				{
				case "CMD_STOP_WEBSOCKET":
				case "CMD_CLIENT_CANCEL":
					isStartMirror = false;
					CloseCommand.Execute((object)_Win);
					break;
				case "CMD_START_NOW":
					isStartMirror = true;
					IsUsbModelVisible = (Visibility)((!IsUsbModel) ? 2 : 0);
					IsAuthorize1Visible = (Visibility)2;
					tipTimer.Start();
					break;
				case "CMD_SCREEN_SPIN":
					IsDecoderUnEable = true;
					InitBitmapAndDecorder(Convert.ToInt32(array[1]), Convert.ToInt32(array[2]));
					SetWindowSize(isNormalState);
					IsDecoderUnEable = false;
					break;
				case "CMD_CLIENT_START":
					OnClientStartEvent?.Invoke(new Size((double)Convert.ToInt32(array[1]), (double)Convert.ToInt32(array[2])));
					break;
				case "CMD_CAPTURE_AUTHORIZE":
					IsAuthorize1Visible = (Visibility)0;
					if (Convert.ToInt32(array[1]) >= 10)
					{
						AuthorizeImagePath = "pack://application:,,,/lenovo.mbg.service.lmsa.toolbox;component/Resources/authorize.png";
					}
					else
					{
						AuthorizeImagePath = "pack://application:,,,/lenovo.mbg.service.lmsa.toolbox;component/Resources/authorize3.png";
					}
					break;
				}
			}, Array.Empty<object>());
		}

		public bool NotifyStopCmd()
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null)
			{
				return false;
			}
			IMessageManager messageManager = val.MessageManager;
			MessageReaderAndWriter val2 = ((messageManager != null) ? messageManager.CreateMessageReaderAndWriter(2000) : null);
			try
			{
				if (val2 == null)
				{
					return false;
				}
				long num = HostProxy.Sequence.New();
				List<string> list = null;
				try
				{
					if (val2.SendAndReceiveSync<string, string>("stopScreenCapture", "stopScreenCaptureResponse", new List<string>(), num, ref list) && list != null)
					{
						return true;
					}
					return false;
				}
				catch (Exception)
				{
					return false;
				}
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}

		private void SaveXXX(WriteableBitmap wtbBmp)
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Expected O, but got Unknown
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_0076: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Expected O, but got Unknown
			if (wtbBmp == null)
			{
				return;
			}
			try
			{
				RenderTargetBitmap val = new RenderTargetBitmap(((BitmapSource)wtbBmp).PixelWidth, ((BitmapSource)wtbBmp).PixelHeight, ((BitmapSource)wtbBmp).DpiX, ((BitmapSource)wtbBmp).DpiY, PixelFormats.Default);
				DrawingVisual val2 = new DrawingVisual();
				DrawingContext val3 = val2.RenderOpen();
				try
				{
					val3.DrawImage((ImageSource)(object)wtbBmp, new Rect(0.0, 0.0, ((ImageSource)wtbBmp).Width, ((ImageSource)wtbBmp).Height));
				}
				finally
				{
					((IDisposable)val3)?.Dispose();
				}
				val.Render((Visual)(object)val2);
				JpegBitmapEncoder val4 = new JpegBitmapEncoder();
				((BitmapEncoder)val4).Frames.Add(BitmapFrame.Create((BitmapSource)(object)val));
				string text = "D:\\XXX\\";
				string path = text + DateTime.Now.ToString("yyyyMMddfff") + ".jpg";
				if (!Directory.Exists(text))
				{
					Directory.CreateDirectory(text);
				}
				if (!File.Exists(path))
				{
					((BitmapEncoder)val4).Save((Stream)File.OpenWrite(path));
				}
			}
			catch (Exception)
			{
			}
		}

		private unsafe void UpdateUI()
		{
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			Random random = new Random();
			byte* ptr = (byte*)(void*)Bitmap.BackBuffer;
			for (int i = 0; i < 1280; i++)
			{
				for (int j = 0; j < 720; j++)
				{
					*ptr = (byte)random.Next(255);
					ptr++;
					*ptr = (byte)random.Next(255);
					ptr++;
					*ptr = (byte)random.Next(255);
					ptr++;
					*ptr = byte.MaxValue;
					ptr++;
				}
			}
			Bitmap.Lock();
			Bitmap.AddDirtyRect(rectUpdate);
			Bitmap.Unlock();
		}

		private unsafe void InitBitmapAndDecorder(int wScene, int hScene)
		{
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00af: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Expected O, but got Unknown
			int num = 0;
			int num2 = 0;
			isVerticalMode = wScene < hScene;
			wScene = 16 * (wScene / 16);
			hScene = 2 * (hScene / 2);
			if (isVerticalMode)
			{
				num = ((wScene > 720) ? 720 : wScene);
				num2 = ((wScene > 720) ? (720 * hScene / wScene) : hScene);
			}
			else
			{
				num = ((hScene > 720) ? (720 * wScene / hScene) : wScene);
				num2 = ((hScene > 720) ? 720 : hScene);
			}
			lock (async_lock)
			{
				rectUpdate = new Int32Rect(0, 0, num, num2);
				Bitmap = new WriteableBitmap(num, num2, 96.0, 96.0, PixelFormats.Bgra32, (BitmapPalette)null);
				decoderHelper.SizeChanged(num, num2, (byte*)(void*)Bitmap.BackBuffer, wScene, hScene);
			}
		}

		private void SetWindowSize(bool isNormalSize)
		{
			//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
			int num = 0;
			int num2 = 0;
			if (isVerticalMode)
			{
				num = 700 * (int)((ImageSource)Bitmap).Width / (int)((ImageSource)Bitmap).Height;
				num2 = 700;
			}
			else
			{
				num = 700;
				num2 = 700 * (int)((ImageSource)Bitmap).Height / (int)((ImageSource)Bitmap).Width;
			}
			if (isNormalSize)
			{
				((FrameworkElement)_Win).Width = num;
				((FrameworkElement)_Win).Height = num2;
				((FrameworkElement)_Win.img).Width = num;
				((FrameworkElement)_Win.img).Height = num2;
				ScreenView win = _Win;
				Rect workArea = SystemParameters.WorkArea;
				((Window)win).Left = (((Rect)(ref workArea)).Width - (double)num) / 2.0;
				ScreenView win2 = _Win;
				workArea = SystemParameters.WorkArea;
				((Window)win2).Top = (((Rect)(ref workArea)).Height - (double)num2) / 2.0;
				((Window)_Win).WindowState = (WindowState)0;
				return;
			}
			((Window)_Win).WindowState = (WindowState)2;
			if (isVerticalMode)
			{
				((FrameworkElement)_Win.img).Width = (double)num * ((FrameworkElement)_Win).Height / (double)num2;
				((FrameworkElement)_Win.img).Height = ((FrameworkElement)_Win).Height;
				return;
			}
			double num3 = ((FrameworkElement)_Win).Width * (double)num2 / (double)num;
			if (num3 < ((FrameworkElement)_Win).Height)
			{
				((FrameworkElement)_Win.img).Width = ((FrameworkElement)_Win).Width;
				((FrameworkElement)_Win.img).Height = num3;
			}
			else
			{
				((FrameworkElement)_Win.img).Width = ((FrameworkElement)_Win).Height * (double)num / (double)num2;
				((FrameworkElement)_Win.img).Height = ((FrameworkElement)_Win).Height;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.ScreenCapture.View
{
	public class ScreenCaptureFrame : UserControl, IMessageViewV6, IComponentConnector
	{
		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public ScreenCaptureFrame()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void CommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
		{
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/screencapture/view/screencaptureframe.xaml", UriKind.Relative);
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
}
namespace lenovo.mbg.service.lmsa.toolbox.ScreenCapture.ViewModel
{
	public class ScreenCaptureFrameViewMode : ViewModelBase
	{
		private VideoDataListViewModel videoDataListViewModel;

		private ReplayCommand startCommand;

		private long running;

		private bool startBtnEnable;

		private Visibility connectDeviceTipsVisibility;

		private Visibility screenCupturePanelVisibility = (Visibility)2;

		private Visibility _TxtTipsVisibility = (Visibility)2;

		private ReplayCommand cancelButtonClickCommand;

		public VideoDataListViewModel VideoDataListViewModel
		{
			get
			{
				return videoDataListViewModel;
			}
			set
			{
				if (videoDataListViewModel != value)
				{
					videoDataListViewModel = value;
					((NotifyBase)this).OnPropertyChanged("VideoDataListViewModel");
				}
			}
		}

		public ReplayCommand StartCommand
		{
			get
			{
				return startCommand;
			}
			set
			{
				if (startCommand != value)
				{
					startCommand = value;
					((NotifyBase)this).OnPropertyChanged("StartCommand");
				}
			}
		}

		public bool StartBtnEnable
		{
			get
			{
				return startBtnEnable;
			}
			set
			{
				if (startBtnEnable != value)
				{
					startBtnEnable = value;
					((NotifyBase)this).OnPropertyChanged("StartBtnEnable");
				}
			}
		}

		public Visibility ConnectDeviceTipsVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return connectDeviceTipsVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (connectDeviceTipsVisibility != value)
				{
					connectDeviceTipsVisibility = value;
					((NotifyBase)this).OnPropertyChanged("ConnectDeviceTipsVisibility");
				}
			}
		}

		public Visibility ScreenCupturePanelVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return screenCupturePanelVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (screenCupturePanelVisibility != value)
				{
					screenCupturePanelVisibility = value;
					((NotifyBase)this).OnPropertyChanged("ScreenCupturePanelVisibility");
				}
			}
		}

		public Visibility TxtTipsVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _TxtTipsVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (_TxtTipsVisibility != value)
				{
					_TxtTipsVisibility = value;
					((NotifyBase)this).OnPropertyChanged("TxtTipsVisibility");
				}
			}
		}

		public ReplayCommand CancelButtonClickCommand
		{
			get
			{
				return cancelButtonClickCommand;
			}
			set
			{
				if (cancelButtonClickCommand != value)
				{
					cancelButtonClickCommand = value;
					((NotifyBase)this).OnPropertyChanged("CancelButtonClickCommand");
				}
			}
		}

		public ScreenCaptureFrameViewMode()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Expected O, but got Unknown
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Expected O, but got Unknown
			VideoDataListViewModel = new VideoDataListViewModel();
			CancelButtonClickCommand = new ReplayCommand((Action<object>)CancelButtonClickCommandHandler);
			StartCommand = new ReplayCommand((Action<object>)StartCommandHandler);
			HostProxy.deviceManager.MasterDeviceChanged += delegate(object s, MasterDeviceChangedEventArgs e)
			{
				if (e.Current != null)
				{
					e.Current.SoftStatusChanged += Current_SoftStatusChanged;
				}
				if (e.Previous != null)
				{
					e.Previous.SoftStatusChanged -= Current_SoftStatusChanged;
				}
			};
		}

		private void Current_SoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			TcpAndroidDevice val = (TcpAndroidDevice)sender;
			SetStartBtnEnableStatus(e);
			IAndroidDevice property = ((DeviceEx)val).Property;
			SetPanelVisibility(e, ((property != null) ? property.Category : null) == "tablet");
			((ViewModelBase)this).LoadData((object)val);
			if ((int)e == 0)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						((ViewModelBase)VideoDataListViewModel).Reset();
					});
				}
			}
			else
			{
				((ViewModelBase)VideoDataListViewModel).LoadData();
			}
		}

		private bool SetStartBtnEnableStatus(DeviceSoftStateEx deviceStatus)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0003: Invalid comparison between Unknown and I4
			StartBtnEnable = (int)deviceStatus == 2;
			return StartBtnEnable;
		}

		private async void StartCommandHandler(object e)
		{
			if (Interlocked.Read(in running) != 0L)
			{
				return;
			}
			try
			{
				Interlocked.Exchange(ref running, 1L);
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				TcpAndroidDevice currentDevice = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
				if (currentDevice == null)
				{
					return;
				}
				if ((int)((DeviceEx)currentDevice).ConnectType == 4)
				{
					await MessageWindowHelper.Instance.Show((string)null, "K0257", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
					return;
				}
				HostProxy.BehaviorService.Collect((BusinessType)2410, (BusinessData)null);
				await HostProxy.PermissionService.BeginConfirmAppIsReady(HostProxy.deviceManager.MasterDevice, "ScreenRecord", (CancellationTokenSource)null, (Action<bool?>)delegate(bool? isReady)
				{
					if (isReady.HasValue && isReady.Value)
					{
						Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
						if (currentDispatcher != null)
						{
							currentDispatcher.Invoke((Action)delegate
							{
								//IL_0006: Unknown result type (might be due to invalid IL or missing references)
								//IL_000b: Unknown result type (might be due to invalid IL or missing references)
								//IL_0012: Unknown result type (might be due to invalid IL or missing references)
								DeviceSoftStateEx softStatus = ((DeviceEx)currentDevice).SoftStatus;
								if (SetStartBtnEnableStatus(softStatus))
								{
									StartBtnEnable = false;
									Task.Factory.StartNew(delegate
									{
										new VideoBLL().StartScreenCapture(delegate
										{
											Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
											if (currentDispatcher2 != null)
											{
												currentDispatcher2.Invoke((Action)delegate
												{
													StartBtnEnable = true;
												});
											}
										});
									});
								}
							});
						}
					}
				});
			}
			finally
			{
				Interlocked.Exchange(ref running, 0L);
			}
		}

		private void SetPanelVisibility(DeviceSoftStateEx deviceStatus, bool _isTablet)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Invalid comparison between Unknown and I4
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			bool flag = (int)deviceStatus == 2;
			ConnectDeviceTipsVisibility = (Visibility)(flag ? 1 : 0);
			ScreenCupturePanelVisibility = (Visibility)(!flag);
			_TxtTipsVisibility = (Visibility)(!_isTablet);
		}

		private void CancelButtonClickCommandHandler(object args)
		{
			Window val = (Window)((args is Window) ? args : null);
			if (val != null)
			{
				val.Close();
			}
		}
	}
	public class VideoDataListViewModel : DataListViewModel<VideoDetailListItemViewModel, string>
	{
		private class SortingStatus
		{
			public Dictionary<string, SortingInfo> SortMapping { get; set; }

			public string CurrentSortMemberPath { get; set; }
		}

		private class SortingInfo
		{
			public string SortProtertyName { get; set; }

			public bool SortDataIsLoaded { get; set; }

			public string SortMemberPath { get; set; }
		}

		private VideoBLL videoBLL = new VideoBLL();

		private ReplayCommand detailListScrollChangedCommand;

		private int ICON_VIEW_COLUMN_COUNT = 4;

		private int ICON_VIEW_ITEM_PANEL_HEIGHT = 166;

		private SortingStatus mSortingStatus;

		private ReplayCommand sortingCommand;

		public ReplayCommand DetailListScrollChangedCommand
		{
			get
			{
				return detailListScrollChangedCommand;
			}
			set
			{
				if (detailListScrollChangedCommand != value)
				{
					detailListScrollChangedCommand = value;
					((NotifyBase)this).OnPropertyChanged("DetailListScrollChangedCommand");
				}
			}
		}

		public ReplayCommand SortingCommand
		{
			get
			{
				return sortingCommand;
			}
			set
			{
				if (sortingCommand != value)
				{
					sortingCommand = value;
					((NotifyBase)this).OnPropertyChanged("SortingCommand");
				}
			}
		}

		public VideoDataListViewModel()
		{
			//IL_005b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0065: Expected O, but got Unknown
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Expected O, but got Unknown
			base.ExportEnable = false;
			base.DeleteEnable = false;
			base.RefreshEnable = true;
			base.ImportVisibility = (Visibility)2;
			base.CheckAllBoxVisibility = (Visibility)2;
			((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).CurrentLoadingPageSize = 25;
			DetailListScrollChangedCommand = new ReplayCommand((Action<object>)DetailListScrollChangedCommandHandler);
			SortingCommand = new ReplayCommand((Action<object>)SortingCommandHandler);
		}

		public override void LoadData()
		{
			((ViewModelBase)this).LoadData();
			((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).BeginLoadIdList((Action<object, Exception>)delegate(object p1, Exception exception1)
			{
				if (exception1 == null)
				{
					((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).BeginLoadBigPropertyData((Action<object, Exception>)null);
				}
			});
		}

		protected override bool FillBasicProperty(IEnumerable<VideoDetailListItemViewModel> target)
		{
			List<string> idList = target.Select((VideoDetailListItemViewModel m) => ((PageLoadingItemViewModelBase<string>)m).Id).ToList();
			List<VideoDetailModel> basicInfoList = videoBLL.GetVideoInfoList(idList);
			if (basicInfoList != null && basicInfoList.Count > 0)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						foreach (VideoDetailModel item in basicInfoList)
						{
							foreach (VideoDetailListItemViewModel item2 in target)
							{
								if (((PageLoadingItemViewModelBase<string>)item2).Id.Equals(item.Id))
								{
									((PageLoadingItemViewModelBase<string>)item2).Id = item.Id;
									item2.Name = item.Name;
									item2.LongDuration = item.Duration;
									item2.LongSize = item.Size;
									item2.LongModifiedDate = item.ModifiedDate;
									item2.ModifiedDate = item.ModifiedDateDisplayString;
									((PageLoadingItemViewModelBase<string>)item2).BasicPropertyIsLoaded = true;
									break;
								}
							}
						}
					});
				}
			}
			return true;
		}

		protected override bool FillBigProperty(IEnumerable<VideoDetailListItemViewModel> target, CancellationTokenSource cancel)
		{
			List<string> idList = target.Select((VideoDetailListItemViewModel m) => ((PageLoadingItemViewModelBase<string>)m).Id).ToList();
			string exportFolder = Path.Combine(Configurations.PicCacheDir, "ScreenCAP");
			videoBLL.ExportVideoThumbnailList(idList, exportFolder, delegate(string id, bool success, string path)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						//IL_002d: Unknown result type (might be due to invalid IL or missing references)
						//IL_0033: Expected O, but got Unknown
						foreach (VideoDetailListItemViewModel item in target)
						{
							if (((PageLoadingItemViewModelBase<string>)item).Id.Equals(id))
							{
								try
								{
									BitmapImage val = new BitmapImage();
									val.BeginInit();
									val.CacheOption = (BitmapCacheOption)1;
									val.UriSource = new Uri(path, UriKind.Absolute);
									val.EndInit();
									item.IconSource = (ImageSource)(object)val;
									((PageLoadingItemViewModelBase<string>)item).BigPropertyIsLoaded = true;
									break;
								}
								catch
								{
									break;
								}
							}
						}
					});
				}
			});
			return true;
		}

		protected override IEnumerable<string> PrepareIdList()
		{
			return videoBLL.GetIdList("RecordScreen", "id", isSortDesc: false);
		}

		protected override int PrepareTotalCount()
		{
			return 1000;
		}

		private void DetailListScrollChangedCommandHandler(object e)
		{
			object obj = ((e is InvokeCommandActionParameters) ? e : null);
			object invokeParameter = ((InvokeCommandActionParameters)obj).InvokeParameter;
			ScrollChangedEventArgs e2 = (ScrollChangedEventArgs)((invokeParameter is ScrollChangedEventArgs) ? invokeParameter : null);
			string value = ((InvokeCommandActionParameters)obj).CommandParameter.ToString();
			double verticalOffset = e2.VerticalOffset;
			if ("detail".Equals(value))
			{
				((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).CurrentLoadingStartIndex = (int)verticalOffset;
				((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).BeginLoadBasicPropertyData((Action<object, Exception>)null);
			}
			else
			{
				((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).CurrentLoadingStartIndex = ((!(verticalOffset < (double)ICON_VIEW_ITEM_PANEL_HEIGHT)) ? ((int)Math.Ceiling(verticalOffset / (double)ICON_VIEW_ITEM_PANEL_HEIGHT) - 1) : 0) * ICON_VIEW_COLUMN_COUNT;
				((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).BeginLoadBigPropertyData((Action<object, Exception>)null);
			}
		}

		protected override void OnItemInitialized(VideoDetailListItemViewModel model)
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Expected O, but got Unknown
			((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).OnItemInitialized(model);
			model.CheckCammand = new ReplayCommand((Action<object>)delegate(object e)
			{
				if ((bool)e)
				{
					base.IsAllChecked = ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource.Where((VideoDetailListItemViewModel m) => !m.IsChecked).Count() == 0;
					bool exportEnable = (base.DeleteEnable = true);
					base.ExportEnable = exportEnable;
				}
				else
				{
					base.IsAllChecked = false;
					bool exportEnable = (base.DeleteEnable = ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource.Where((VideoDetailListItemViewModel m) => m.IsChecked).Count() > 0);
					base.ExportEnable = exportEnable;
				}
			});
		}

		protected override void OnStartLoadingId(Dictionary<string, object> tag)
		{
			base.RefreshEnable = false;
			base.ExportEnable = false;
			base.DeleteEnable = false;
			base.ImportEnable = false;
		}

		protected override void OnStopLoadingId(Dictionary<string, object> tag)
		{
			base.RefreshEnable = true;
			bool exportEnable = (base.DeleteEnable = ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource.Where((VideoDetailListItemViewModel m) => m.IsChecked).Count() > 0);
			base.ExportEnable = exportEnable;
			base.IsAllChecked = ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource.Count > 0 && ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource.Where((VideoDetailListItemViewModel m) => !m.IsChecked).Count() == 0;
		}

		protected override void OnShowModeChanged(bool isDetailMode)
		{
			base.CheckAllBoxVisibility = (Visibility)(isDetailMode ? 2 : 0);
		}

		protected override void CheckAllCommandHandler(object e)
		{
			bool flag = (bool)e;
			foreach (VideoDetailListItemViewModel item in ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource)
			{
				item.IsChecked = flag;
			}
			bool exportEnable = (base.DeleteEnable = flag && ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource.Where((VideoDetailListItemViewModel m) => m.IsChecked).Count() > 0);
			base.ExportEnable = exportEnable;
		}

		protected override void SyncUIDataFromCache(IEnumerable<VideoDetailListItemViewModel> news, IEnumerable<VideoDetailListItemViewModel> removed)
		{
			((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).SyncUIDataFromCache(news, removed);
			if (news != null && news.Count() > 0)
			{
				ClearSortStatus();
			}
		}

		protected override void ExportCommandHandler(object e)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Invalid comparison between Unknown and I4
			FolderBrowserDialog folderBrowser = new FolderBrowserDialog();
			if ((int)((CommonDialog)folderBrowser).ShowDialog() != 1)
			{
				return;
			}
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher == null)
			{
				return;
			}
			currentDispatcher.Invoke((Action)delegate
			{
				//IL_0076: Unknown result type (might be due to invalid IL or missing references)
				_ = folderBrowser.SelectedPath;
				List<string> list = (from m in ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource
					where m.IsChecked
					select ((PageLoadingItemViewModelBase<string>)m).Id).ToList();
				string text = folderBrowser.SelectedPath.Trim();
				new ImportAndExportWrapper().ExportFile((BusinessType)2420, 20, list, "K0567", "{8BEBE14B-4E45-4D36-8726-8442E6242C01}", "Videos", text, (Func<string, Header, string>)null);
			});
		}

		protected override void RefreshCommandHandler(object e)
		{
			((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).BeginLoadIdList((Action<object, Exception>)delegate(object p1, Exception exception1)
			{
				if (exception1 == null && !base.IsDetailMode)
				{
					((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).BeginLoadBigPropertyData((Action<object, Exception>)null);
				}
			});
		}

		protected override void DeleteCommandHandler(object e)
		{
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher == null)
			{
				return;
			}
			currentDispatcher.Invoke<Task>((Func<Task>)async delegate
			{
				if (await MessageWindowHelper.Instance.Show("K0585", "K0569", "K0583", "K0208", false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false) == true)
				{
					((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).OnStartLoadingId((Dictionary<string, object>)null);
					((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DoProcessAsync((Action<object>)delegate
					{
						try
						{
							List<string> idList = (from m in ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource
								where m.IsChecked
								select ((PageLoadingItemViewModelBase<string>)m).Id).ToList();
							if (videoBLL.DeleteVideo(idList))
							{
								((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).UpdateDataCollection(((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).PrepareIdList());
							}
						}
						finally
						{
							Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
							if (currentDispatcher2 != null)
							{
								currentDispatcher2.Invoke((Action)delegate
								{
									((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).OnStopLoadingId((Dictionary<string, object>)null);
								});
							}
						}
					}, (object)null);
				}
			});
		}

		private void ClearSortStatus()
		{
			if (mSortingStatus != null)
			{
				foreach (KeyValuePair<string, SortingInfo> item in mSortingStatus.SortMapping)
				{
					item.Value.SortDataIsLoaded = false;
				}
				mSortingStatus.CurrentSortMemberPath = string.Empty;
			}
			foreach (VideoDetailListItemViewModel item2 in ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource)
			{
				item2.ClearSortStatus();
			}
		}

		private void SortingCommandHandler(object e)
		{
			//IL_0097: Unknown result type (might be due to invalid IL or missing references)
			//IL_009e: Expected O, but got Unknown
			object invokeParameter = ((InvokeCommandActionParameters)((e is InvokeCommandActionParameters) ? e : null)).InvokeParameter;
			DataGridSortingEventArgs e2 = (DataGridSortingEventArgs)((invokeParameter is DataGridSortingEventArgs) ? invokeParameter : null);
			DataGridColumn column = ((DataGridColumnEventArgs)e2).Column;
			ListSortDirection listSortDirection = ((column.SortDirection == ListSortDirection.Descending) ? ListSortDirection.Descending : ListSortDirection.Ascending);
			string sortMemberPath = column.SortMemberPath;
			if (string.IsNullOrEmpty(sortMemberPath))
			{
				return;
			}
			if (mSortingStatus == null)
			{
				mSortingStatus = new SortingStatus();
				Dictionary<string, SortingInfo> dictionary = new Dictionary<string, SortingInfo>();
				Type? typeFromHandle = typeof(VideoDetailListItemViewModel);
				Type typeFromHandle2 = typeof(SortProtertyNameAttribute);
				PropertyInfo[] properties = typeFromHandle.GetProperties();
				for (int i = 0; i < properties.Length; i++)
				{
					object[] customAttributes = properties[i].GetCustomAttributes(typeFromHandle2, inherit: true);
					for (int j = 0; j < customAttributes.Length; j++)
					{
						SortProtertyNameAttribute val = (SortProtertyNameAttribute)customAttributes[j];
						dictionary[val.SortMemberPath] = new SortingInfo
						{
							SortDataIsLoaded = false,
							SortMemberPath = val.SortMemberPath,
							SortProtertyName = val.SortPropertyName
						};
					}
				}
				mSortingStatus.SortMapping = dictionary;
			}
			if (PreparSorting(sortMemberPath, listSortDirection))
			{
				mSortingStatus.CurrentSortMemberPath = sortMemberPath;
				column.SortDirection = ((listSortDirection == ListSortDirection.Ascending) ? ListSortDirection.Descending : ListSortDirection.Ascending);
			}
			e2.Handled = true;
		}

		private bool PreparSorting(string sortMemberPath, ListSortDirection currentDirection)
		{
			if (!mSortingStatus.SortMapping[sortMemberPath].SortDataIsLoaded)
			{
				List<string> idList = videoBLL.GetIdList("RecordScreen", mSortingStatus.SortMapping[sortMemberPath].SortProtertyName, isSortDesc: false);
				if (idList == null)
				{
					return false;
				}
				for (int i = 0; i < idList.Count; i++)
				{
					foreach (VideoDetailListItemViewModel item in ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource)
					{
						if (idList[i].Equals(((PageLoadingItemViewModelBase<string>)item).Id))
						{
							item.AddSortMapping(sortMemberPath, i);
							break;
						}
					}
				}
			}
			if (!sortMemberPath.Equals(mSortingStatus.CurrentSortMemberPath))
			{
				foreach (VideoDetailListItemViewModel item2 in ((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource)
				{
					item2.SetCurrentSortIndex(sortMemberPath);
				}
			}
			if (currentDirection == ListSortDirection.Descending)
			{
				((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource = new ObservableCollection<VideoDetailListItemViewModel>(((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource.OrderByDescending((VideoDetailListItemViewModel m) => m.SortIndex));
			}
			else
			{
				((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource = new ObservableCollection<VideoDetailListItemViewModel>(((PageLoadingViewModelBase<VideoDetailListItemViewModel, string>)(object)this).DataItemsSource.OrderBy((VideoDetailListItemViewModel m) => m.SortIndex));
			}
			return true;
		}
	}
	public class VideoDetailListItemViewModel : PageLoadingItemViewModelBase<string>
	{
		private string name;

		private string duration;

		private string size;

		private string modifiedDate;

		private ImageSource iconSource;

		private VideoDetailModel detailModel;

		private long longDuration;

		private long longSize;

		private long longModifiedDate;

		private bool isChecked;

		private ReplayCommand checkCammand;

		private int sortIndex;

		private Dictionary<string, int> sortMapping;

		[SortProtertyName(SortPropertyName = "name", SortMemberPath = "Name")]
		public string Name
		{
			get
			{
				return name;
			}
			set
			{
				if (!(name == value))
				{
					name = value;
					((NotifyBase)this).OnPropertyChanged("Name");
				}
			}
		}

		public string Duration
		{
			get
			{
				return duration;
			}
			private set
			{
				if (!(duration == value))
				{
					duration = value;
					((NotifyBase)this).OnPropertyChanged("Duration");
				}
			}
		}

		[SortProtertyName(SortPropertyName = "duration", SortMemberPath = "LongDuration")]
		public long LongDuration
		{
			get
			{
				return longDuration;
			}
			set
			{
				if (longDuration != value)
				{
					longDuration = value;
					if (longDuration <= 0)
					{
						Duration = "0.0.0";
					}
					else
					{
						Duration = TimeSpan.FromMilliseconds((double)value).ToString("hh\\:mm\\:ss");
					}
				}
			}
		}

		public string Size
		{
			get
			{
				return size;
			}
			set
			{
				if (!(size == value))
				{
					size = value;
					((NotifyBase)this).OnPropertyChanged("Size");
				}
			}
		}

		[SortProtertyName(SortPropertyName = "size", SortMemberPath = "LongSize")]
		public long LongSize
		{
			get
			{
				return longSize;
			}
			set
			{
				if (longSize != value)
				{
					Size = GlobalFun.ConvertLong2String(value, "F1", true);
					longSize = value;
				}
			}
		}

		public string ModifiedDate
		{
			get
			{
				return modifiedDate;
			}
			set
			{
				if (!(modifiedDate == value))
				{
					modifiedDate = value;
					((NotifyBase)this).OnPropertyChanged("ModifiedDate");
				}
			}
		}

		[SortProtertyName(SortPropertyName = "modifiedDate", SortMemberPath = "LongModifiedDate")]
		public long LongModifiedDate
		{
			get
			{
				return longModifiedDate;
			}
			set
			{
				_ = longModifiedDate;
			}
		}

		public ImageSource IconSource
		{
			get
			{
				return iconSource;
			}
			set
			{
				if (iconSource != value)
				{
					iconSource = value;
					((NotifyBase)this).OnPropertyChanged("IconSource");
				}
			}
		}

		public bool IsChecked
		{
			get
			{
				return isChecked;
			}
			set
			{
				if (isChecked != value)
				{
					isChecked = value;
					((NotifyBase)this).OnPropertyChanged("IsChecked");
				}
			}
		}

		public ReplayCommand CheckCammand
		{
			get
			{
				return checkCammand;
			}
			set
			{
				if (checkCammand != value)
				{
					checkCammand = value;
					((NotifyBase)this).OnPropertyChanged("CheckCammand");
				}
			}
		}

		public int SortIndex
		{
			get
			{
				return sortIndex;
			}
			set
			{
				if (sortIndex != value)
				{
					sortIndex = value;
					((NotifyBase)this).OnPropertyChanged("SortIndex");
				}
			}
		}

		public VideoDetailListItemViewModel()
		{
			sortMapping = new Dictionary<string, int>();
		}

		public VideoDetailListItemViewModel(VideoDetailModel detailModel)
		{
			this.detailModel = detailModel;
		}

		public void AddSortMapping(string sortMemberPath, int sortIndex)
		{
			sortMapping[sortMemberPath] = sortIndex;
		}

		public void SetCurrentSortIndex(string sortMemberPath)
		{
			SortIndex = sortMapping[sortMemberPath];
		}

		public void ClearSortStatus()
		{
			if (sortMapping != null)
			{
				sortMapping.Clear();
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.ScreenCapture.Model
{
	public class VideoDetailModel
	{
		[JsonProperty("id")]
		private string id;

		[JsonProperty("name")]
		private string name;

		[JsonProperty("duration")]
		private long duration;

		[JsonProperty("size")]
		private long size;

		[JsonProperty("modifiedDate")]
		private long modifiedDate;

		[JsonProperty("modifiedDateDisplayString")]
		private string modifiedDateDisplayString;

		public string Id
		{
			get
			{
				return id;
			}
			set
			{
				id = value;
			}
		}

		public string Name
		{
			get
			{
				return name;
			}
			set
			{
				name = value;
			}
		}

		public long Duration
		{
			get
			{
				return duration;
			}
			set
			{
				duration = value;
			}
		}

		public long Size
		{
			get
			{
				return size;
			}
			set
			{
				size = value;
			}
		}

		public long ModifiedDate
		{
			get
			{
				return modifiedDate;
			}
			set
			{
				modifiedDate = value;
			}
		}

		public string ModifiedDateDisplayString
		{
			get
			{
				return modifiedDateDisplayString;
			}
			set
			{
				modifiedDateDisplayString = value;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.ScreenCapture.BLL
{
	public class VideoBLL
	{
		public List<string> GetIdList(string albumName, string sortPropertyName, bool isSortDesc)
		{
			List<string> list = null;
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null || val.MessageManager == null)
			{
				return list;
			}
			MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (val2 == null)
				{
					return list;
				}
				_ = val.FileTransferManager;
				long num = HostProxy.Sequence.New();
				List<string> list2 = null;
				if (val2.SendAndReceiveSync<string, string>("getScreenCAPIdList", "getScreenCAPIdListResponse", new List<string>
				{
					albumName,
					sortPropertyName,
					isSortDesc.ToString()
				}, num, ref list2) && list2 != null)
				{
					list = list2;
				}
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
			if (list == null)
			{
				list = new List<string>();
			}
			return list;
		}

		public List<VideoDetailModel> GetVideoInfoList(List<string> idList)
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null || val.MessageManager == null)
			{
				return null;
			}
			MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (val2 == null)
				{
					return null;
				}
				_ = val.FileTransferManager;
				long num = HostProxy.Sequence.New();
				List<VideoDetailModel> list = null;
				if (val2.SendAndReceiveSync<string, VideoDetailModel>("getScreenCAPInfoList", "getScreenCAPInfoListResponse", idList, num, ref list) && list != null)
				{
					return list;
				}
				return null;
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}

		public void ExportVideoThumbnailList(List<string> idList, string exportFolder, Action<string, bool, string> callback)
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null)
			{
				return;
			}
			MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (val2 == null)
				{
					return;
				}
				IFileTransferManager fileTransferManager = val.FileTransferManager;
				ISequence sequence = HostProxy.Sequence;
				long num = sequence.New();
				List<PropItem> list = null;
				if (!val2.TryEnterLock(10000))
				{
					return;
				}
				try
				{
					num = sequence.New();
					if (!val2.Send<string>("exportScreenCAPThumbnail", idList, num))
					{
						return;
					}
					try
					{
						FileTransferWrapper val3 = fileTransferManager.CreateFileTransfer(num);
						try
						{
							if (val3 == null)
							{
								return;
							}
							TransferFileInfo val4 = null;
							for (int i = 0; i < idList.Count; i++)
							{
								if (val3.ReceiveFile(exportFolder, ref val4) && val4 != null)
								{
									string virtualFileName = val4.VirtualFileName;
									string arg = virtualFileName.Substring(0, virtualFileName.IndexOf('_'));
									callback(arg, arg2: true, val4.localFilePath);
								}
								else
								{
									callback(string.Empty, arg2: false, string.Empty);
								}
								val3.NotifyFileReceiveComplete();
							}
						}
						finally
						{
							((IDisposable)val3)?.Dispose();
						}
					}
					finally
					{
						list = null;
						if (!val2.Receive<PropItem>("exportScreenCAPThumbnailResponse", ref list, 13000))
						{
						}
					}
				}
				finally
				{
					val2.ExitLock();
				}
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}

		public TransferResult ExportVideo(List<string> idList, string exportFolder, IAsyncTaskContext context, Action<string, TransferResult> callback)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_0221: Unknown result type (might be due to invalid IL or missing references)
			//IL_01f8: Unknown result type (might be due to invalid IL or missing references)
			//IL_01f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_009c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0094: Unknown result type (might be due to invalid IL or missing references)
			//IL_0208: Unknown result type (might be due to invalid IL or missing references)
			//IL_0209: Unknown result type (might be due to invalid IL or missing references)
			//IL_0104: Unknown result type (might be due to invalid IL or missing references)
			//IL_011e: Unknown result type (might be due to invalid IL or missing references)
			//IL_011f: Unknown result type (might be due to invalid IL or missing references)
			if (idList == null)
			{
				return (TransferResult)4;
			}
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null)
			{
				return (TransferResult)4;
			}
			TransferResult result = (TransferResult)0;
			MessageReaderAndWriter msgRWriter = val.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (msgRWriter == null)
				{
					return (TransferResult)4;
				}
				context.AddCancelSource((Action)delegate
				{
					msgRWriter.Dispose();
				});
				IFileTransferManager fileTransferManager = val.FileTransferManager;
				ISequence sequence = HostProxy.Sequence;
				long num = sequence.New();
				List<PropItem> list = null;
				if (!msgRWriter.TryEnterLock(10000))
				{
					return (TransferResult)4;
				}
				try
				{
					if (context.IsCancelCommandRequested)
					{
						return (TransferResult)1;
					}
					result = (TransferResult)4;
					num = sequence.New();
					if (msgRWriter.Send<string>("exportScreenCAPFile", idList, num))
					{
						try
						{
							FileTransferWrapper fileTransfer = fileTransferManager.CreateFileTransfer(num);
							try
							{
								if (fileTransfer != null)
								{
									context.AddCancelSource((Action)delegate
									{
										fileTransfer.Dispose();
									});
									TransferFileInfo val2 = null;
									for (int num2 = 0; num2 < idList.Count; num2++)
									{
										if (context.IsCancelCommandRequested)
										{
											return (TransferResult)1;
										}
										if (!fileTransfer.ReceiveFile(exportFolder, ref val2))
										{
											result = (TransferResult)4;
											return (TransferResult)4;
										}
										callback?.Invoke(string.Empty, (TransferResult)0);
										HostProxy.ResourcesLoggingService.RegisterFile(val2.localFilePath);
										fileTransfer.NotifyFileReceiveComplete();
									}
								}
							}
							finally
							{
								if (fileTransfer != null)
								{
									((IDisposable)fileTransfer).Dispose();
								}
							}
						}
						finally
						{
							list = null;
							if (msgRWriter.Receive<PropItem>("exportScreenCAPFileResponse", ref list, 13000) && list != null)
							{
								result = (list.Exists((PropItem m) => "SUCCESS".Equals(m.Value)) ? ((TransferResult)0) : ((!list.Exists((PropItem m) => "NONEXISTENCE".Equals(m.Value))) ? ((TransferResult)4) : ((TransferResult)3)));
							}
						}
					}
				}
				finally
				{
					msgRWriter.ExitLock();
				}
				return result;
			}
			finally
			{
				if (msgRWriter != null)
				{
					((IDisposable)msgRWriter).Dispose();
				}
			}
		}

		public bool DeleteVideo(List<string> idList)
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null)
			{
				return false;
			}
			MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (val2 == null)
				{
					return false;
				}
				_ = val.FileTransferManager;
				long num = HostProxy.Sequence.New();
				List<PropItem> list = null;
				if (val2.SendAndReceiveSync<string, PropItem>("deleteScreenCAP", "deleteScreenCAPResponse", idList, num, ref list) && list != null)
				{
					return list.Exists((PropItem m) => "true".Equals(m.Value));
				}
				return false;
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}

		public void StartScreenCapture(Action<List<PropItem>> callback)
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null)
			{
				callback?.Invoke(null);
				return;
			}
			List<PropItem> list = null;
			MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (val2 == null)
				{
					callback?.Invoke(null);
					return;
				}
				_ = val.FileTransferManager;
				long num = HostProxy.Sequence.New();
				AdbDeviceEx val3 = (AdbDeviceEx)(object)((val is AdbDeviceEx) ? val : null);
				if (val3 != null)
				{
					((TcpAndroidDevice)val3).FocuseApp();
				}
				else
				{
					Thread.Sleep(1000);
				}
				if (val2.SendAndReceiveSync<PropItem, PropItem>("readyScreenRecord", "readyScreenRecordResponse", new List<PropItem>(), num, ref list) && list != null)
				{
					callback?.Invoke(list);
					return;
				}
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
			callback?.Invoke(list);
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.Ringtone
{
	public enum MusicType
	{
		Call = 1,
		Notification = 2,
		Alarm = 4
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.Ringtone.View
{
	public class RegrantAppPermissionTips : Window, IMessageWindowV6, IComponentConnector
	{
		internal LangButton btnIsReady;

		internal LangButton btnCancel;

		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; }

		public Action<IMessageWindowV6> CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool CanExecute(object parameter)
		{
			if (ExecutePredicate != null)
			{
				return ExecutePredicate(parameter);
			}
			return true;
		}

		public bool CanClose(object parameter)
		{
			if (CanClosePredicate != null)
			{
				return CanClosePredicate(parameter);
			}
			return true;
		}

		public RegrantAppPermissionTips()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void btnIsReady_Click(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/ringtone/view/regrantapppermissiontips.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Expected O, but got Unknown
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Expected O, but got Unknown
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnIsReady = (LangButton)target;
				((ButtonBase)btnIsReady).Click += new RoutedEventHandler(btnIsReady_Click);
				break;
			case 2:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(btnCancel_Click);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RingtoneMakerModel : ViewModelBase
	{
		private double _start;

		private double _end;

		private double _max;

		private double _current;

		private bool _isPlay;

		private string _mediaFile;

		private string _fileName;

		private bool _isMessage;

		private bool _isFileOk;

		private bool _isDevOnLine;

		private bool _isFadein;

		private bool _isFadeout;

		private double _playTime;

		public ICommand CloseCommand { get; set; }

		public ICommand StartCommand { get; set; }

		public ICommand SetEndCommand { get; set; }

		public ICommand PlayCommand { get; set; }

		public ICommand LoadCommand { get; set; }

		public ICommand SaveCommand { get; set; }

		public ICommand SelModelCommand { get; set; }

		public ICommand RingtoneCommand { get; set; }

		public ICommand IncreaseCommand { get; set; }

		public ICommand DecreaseCommand { get; set; }

		public double Start
		{
			get
			{
				return _start;
			}
			set
			{
				_start = value;
				((NotifyBase)this).OnPropertyChanged("Start");
			}
		}

		public double End
		{
			get
			{
				return _end;
			}
			set
			{
				_end = value;
				((NotifyBase)this).OnPropertyChanged("End");
			}
		}

		public double Max
		{
			get
			{
				return _max;
			}
			set
			{
				_max = value;
				((NotifyBase)this).OnPropertyChanged("Max");
			}
		}

		public double Current
		{
			get
			{
				return _current;
			}
			set
			{
				_current = value;
				((NotifyBase)this).OnPropertyChanged("Current");
			}
		}

		public bool IsPlay
		{
			get
			{
				return _isPlay;
			}
			set
			{
				_isPlay = value;
				((NotifyBase)this).OnPropertyChanged("IsPlay");
			}
		}

		public bool IsPause { get; set; }

		public string MediaFile
		{
			get
			{
				return _mediaFile;
			}
			set
			{
				_mediaFile = value;
				IsFileOk = !string.IsNullOrEmpty(_mediaFile);
				((NotifyBase)this).OnPropertyChanged("MediaFile");
			}
		}

		public string FileName
		{
			get
			{
				return _fileName;
			}
			set
			{
				_fileName = value;
				((NotifyBase)this).OnPropertyChanged("FileName");
			}
		}

		public bool IsMessage
		{
			get
			{
				return _isMessage;
			}
			set
			{
				_isMessage = value;
				((NotifyBase)this).OnPropertyChanged("IsMessage");
			}
		}

		public bool IsFileOk
		{
			get
			{
				return _isFileOk;
			}
			set
			{
				_isFileOk = value;
				((NotifyBase)this).OnPropertyChanged("IsFileOk");
			}
		}

		public bool IsDevOnLine
		{
			get
			{
				return _isDevOnLine;
			}
			set
			{
				_isDevOnLine = value;
				((NotifyBase)this).OnPropertyChanged("IsDevOnLine");
			}
		}

		public bool IsFadein
		{
			get
			{
				return _isFadein;
			}
			set
			{
				_isFadein = value;
				((NotifyBase)this).OnPropertyChanged("IsFadein");
			}
		}

		public bool IsFadeout
		{
			get
			{
				return _isFadeout;
			}
			set
			{
				_isFadeout = value;
				((NotifyBase)this).OnPropertyChanged("IsFadeout");
			}
		}

		public double PlayTime
		{
			get
			{
				return _playTime;
			}
			set
			{
				_playTime = value;
				((NotifyBase)this).OnPropertyChanged("PlayTime");
			}
		}

		public RingtoneMakerModel()
		{
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Expected O, but got Unknown
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Expected O, but got Unknown
			//IL_0084: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Expected O, but got Unknown
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0099: Expected O, but got Unknown
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Expected O, but got Unknown
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00af: Expected O, but got Unknown
			//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ba: Expected O, but got Unknown
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c5: Expected O, but got Unknown
			//IL_00c6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d0: Expected O, but got Unknown
			//IL_00d1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00db: Expected O, but got Unknown
			Start = 0.0;
			Current = 0.0;
			End = 0.0;
			Max = 0.0;
			PlayTime = 0.0;
			IsPlay = false;
			IsMessage = false;
			IsFadein = false;
			IsFadeout = false;
			CloseCommand = (ICommand)new RoutedCommand();
			StartCommand = (ICommand)new RoutedCommand();
			SetEndCommand = (ICommand)new RoutedCommand();
			PlayCommand = (ICommand)new RoutedCommand();
			LoadCommand = (ICommand)new RoutedCommand();
			SaveCommand = (ICommand)new RoutedCommand();
			SelModelCommand = (ICommand)new RoutedCommand();
			RingtoneCommand = (ICommand)new RoutedCommand();
			IncreaseCommand = (ICommand)new RoutedCommand();
			DecreaseCommand = (ICommand)new RoutedCommand();
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.Ringtone.Core
{
	internal enum LAMEPreset
	{
		ABR_8 = 8,
		ABR_16 = 16,
		ABR_32 = 32,
		ABR_48 = 48,
		ABR_64 = 64,
		ABR_96 = 96,
		ABR_128 = 128,
		ABR_160 = 160,
		ABR_256 = 256,
		ABR_320 = 320,
		V9 = 410,
		VBR_10 = 410,
		V8 = 420,
		VBR_20 = 420,
		V7 = 430,
		VBR_30 = 430,
		V6 = 440,
		VBR_40 = 440,
		V5 = 450,
		VBR_50 = 450,
		V4 = 460,
		VBR_60 = 460,
		V3 = 470,
		VBR_70 = 470,
		V2 = 480,
		VBR_80 = 480,
		V1 = 490,
		VBR_90 = 490,
		V0 = 500,
		VBR_100 = 500,
		R3MIX = 1000,
		STANDARD = 1001,
		EXTREME = 1002,
		INSANE = 1003,
		STANDARD_FAST = 1004,
		EXTREME_FAST = 1005,
		MEDIUM = 1006,
		MEDIUM_FAST = 1007
	}
	public delegate void ReportFunction(string text);
	[UnmanagedFunctionPointer(CallingConvention.Cdecl, SetLastError = true, CharSet = CharSet.Ansi)]
	internal delegate void delReportFunction(string fmt, IntPtr args);
	public delegate void GenreCallback(int index, string genre);
	[UnmanagedFunctionPointer(CallingConvention.Cdecl, SetLastError = true, CharSet = CharSet.Ansi)]
	internal delegate void delGenreCallback(int index, string genre, IntPtr cookie);
	public enum MPEGMode : uint
	{
		Stereo,
		JointStereo,
		DualChannel,
		Mono,
		NotSet
	}
	public enum ASMOptimizations : uint
	{
		MMX = 1u,
		AMD_3DNow,
		SSE
	}
	public enum VBRMode : uint
	{
		Off = 0u,
		MT = 1u,
		RH = 2u,
		ABR = 3u,
		MTRH = 4u,
		Default = 4u
	}
	public enum MPEGVersion
	{
		MPEG2,
		MPEG1,
		MPEG2_5
	}
	[StructLayout(LayoutKind.Sequential)]
	public class LAMEVersion
	{
		public int major;

		public int minor;

		[MarshalAs(UnmanagedType.Bool)]
		public bool alpha;

		[MarshalAs(UnmanagedType.Bool)]
		public bool beta;

		public int psy_major;

		public int psy_minor;

		[MarshalAs(UnmanagedType.Bool)]
		public bool psy_alpha;

		[MarshalAs(UnmanagedType.Bool)]
		public bool psy_beta;

		private IntPtr features_ptr = IntPtr.Zero;

		public string features
		{
			get
			{
				if (features_ptr != IntPtr.Zero)
				{
					return Marshal.PtrToStringAuto(features_ptr);
				}
				return null;
			}
		}
	}
	public struct mp3data
	{
		[MarshalAs(UnmanagedType.Bool)]
		public bool header_parsed;

		public int stereo;

		public int samplerate;

		public int bitrate;

		public int mode;

		public int mode_ext;

		public int framesize;

		public ulong nsamp;

		public int totalframes;

		public int framenum;
	}
	public class LameApi
	{
		private const string libname = "libmp3lame.32.dll";

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern IntPtr lame_init();

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_close(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern uint lame_get_lametag_frame(IntPtr context, [In][Out] byte[] buffer, [In] uint size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern string get_lame_version();

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern string get_lame_short_version();

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern string get_lame_very_short_version();

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern string get_psy_version();

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern string get_lame_url();

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern string get_lame_os_bitness();

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void get_lame_version_numerical([Out] LAMEVersion ver);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_num_samples(IntPtr context, ulong num_samples);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern ulong lame_get_num_samples(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_in_samplerate(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_in_samplerate(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_num_channels(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_num_channels(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_scale(IntPtr context, float value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_scale(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_scale_left(IntPtr context, float value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_scale_left(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_scale_right(IntPtr context, float value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_scale_right(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_out_samplerate(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_out_samplerate(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_analysis(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_analysis(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_bWriteVbrTag(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern bool lame_get_bWriteVbrTag(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_decode_only(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern bool lame_get_decode_only(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_quality(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_quality(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_mode(IntPtr context, MPEGMode value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern MPEGMode lame_get_mode(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_force_ms(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_force_ms(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_free_format(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_free_format(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_findReplayGain(IntPtr context, [In][MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_findReplayGain(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_decode_on_the_fly(IntPtr context, [In][MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_decode_on_the_fly(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_nogap_total(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_nogap_total(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_nogap_currentindex(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_nogap_currentindex(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_brate(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_brate(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_compression_ratio(IntPtr context, float value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_compression_ratio(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_preset(IntPtr context, LAMEPreset value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_asm_optimizations(IntPtr context, ASMOptimizations opt, [MarshalAs(UnmanagedType.Bool)] bool val);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_copyright(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_copyright(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_original(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_original(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_error_protection(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_error_protection(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_extension(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_extension(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_strict_ISO(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_strict_ISO(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_disable_reservoir(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_disable_reservoir(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_quant_comp(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_quant_comp(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_quant_comp_short(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_quant_comp_short(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_experimentalX(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_experimentalX(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_experimentalY(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_experimentalY(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_experimentalZ(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_experimentalZ(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_exp_nspsytune(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_exp_nspsytune(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_msfix(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_msfix(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_set_VBR(IntPtr context, VBRMode value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern VBRMode lame_get_VBR(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_set_VBR_q(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_get_VBR_q(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_set_VBR_quality(IntPtr context, float value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern float lame_get_VBR_quality(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_set_VBR_mean_bitrate_kbps(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_get_VBR_mean_bitrate_kbps(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_set_VBR_min_bitrate_kbps(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_get_VBR_min_bitrate_kbps(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_set_VBR_max_bitrate_kbps(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_get_VBR_max_bitrate_kbps(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int lame_set_VBR_hard_min(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_VBR_hard_min(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_lowpassfreq(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_lowpassfreq(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_lowpasswidth(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_lowpasswidth(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_highpassfreq(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_highpassfreq(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_highpasswidth(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_highpasswidth(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_ATHonly(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_ATHonly(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_ATHshort(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_ATHshort(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_noATH(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_noATH(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_ATHtype(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_ATHtype(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_ATHlower(IntPtr context, float value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_ATHlower(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_athaa_type(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_athaa_type(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_athaa_sensitivity(IntPtr context, float value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_athaa_sensitivity(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_allow_diff_short(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_allow_diff_short(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_useTemporal(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_useTemporal(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_interChRatio(IntPtr context, float value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_interChRatio(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_no_short_blocks(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_no_short_blocks(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_force_short_blocks(IntPtr context, [MarshalAs(UnmanagedType.Bool)] bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_force_short_blocks(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_emphasis(IntPtr context, int value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_emphasis(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern MPEGVersion lame_get_version(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_encoder_delay(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_encoder_padding(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_framesize(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_mf_samples_to_encode(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_size_mp3buffer(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_frameNum(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_totalframes(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_RadioGain(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_AudiophileGain(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_PeakSample(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_noclipGainChange(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern float lame_get_noclipScale(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_init_params(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer(IntPtr context, [In] short[] buffer_l, [In] short[] buffer_r, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_interleaved(IntPtr context, [In] short[] pcm, int num_samples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_float(IntPtr context, [In] float[] pcm_l, [In] float[] pcm_r, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_ieee_float(IntPtr context, [In] float[] pcm_l, [In] float[] pcm_r, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_interleaved_ieee_float(IntPtr context, [In] float[] pcm, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_ieee_double(IntPtr context, [In] double[] pcm_l, [In] double[] pcm_r, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_interleaved_ieee_double(IntPtr context, [In] double[] pcm, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_long(IntPtr context, [In] long[] buffer_l, [In] long[] buffer_r, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_long2(IntPtr context, [In] long[] buffer_l, [In] long[] buffer_r, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_buffer_int(IntPtr context, [In] int[] buffer_l, [In] int[] buffer_r, int nSamples, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_flush(IntPtr context, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_encode_flush_nogap(IntPtr context, [In][Out] byte[] mp3buf, int mp3buf_size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_init_bitstream(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_errorf(IntPtr context, delReportFunction fn);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_debugf(IntPtr context, delReportFunction fn);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_set_msgf(IntPtr context, delReportFunction fn);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void lame_print_config(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void lame_print_internals(IntPtr context);

		[DllImport("msvcrt.dll", BestFitMapping = false, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi, ThrowOnUnmappableChar = true)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		internal static extern int _vsnprintf_s([In][Out][MarshalAs(UnmanagedType.LPStr)] StringBuilder str, int sizeOfBuffer, int count, [In][MarshalAs(UnmanagedType.LPStr)] string format, [In] IntPtr va_args);

		internal static string printf(string format, IntPtr va_args)
		{
			StringBuilder stringBuilder = new StringBuilder(4096);
			_vsnprintf_s(stringBuilder, stringBuilder.Capacity, stringBuilder.Capacity - 2, format.Replace("\t", "ÿ"), va_args);
			return stringBuilder.ToString().Replace("ÿ", "\t");
		}

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern IntPtr hip_decode_init();

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int hip_decode_exit(IntPtr decContext);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void hip_set_errorf(IntPtr decContext, delReportFunction f);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void hip_set_debugf(IntPtr decContext, delReportFunction f);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void hip_set_msgf(IntPtr decContext, delReportFunction f);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int hip_decode(IntPtr decContext, [In] byte[] mp3buf, int len, [In][Out] short[] pcm_l, [In][Out] short[] pcm_r);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int hip_decode_headers(IntPtr decContext, [In] byte[] mp3buf, int len, IntPtr pcm_l, IntPtr pcm_r, [Out] mp3data mp3data);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int hip_decode1(IntPtr decContext, [In] byte[] mp3buf, int len, [In][Out] short[] pcm_l, [In][Out] short[] pcm_r);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int hip_decode1_headers(IntPtr decContext, [In] byte[] mp3buf, int len, [In][Out] short[] pcm_l, [In][Out] short[] pcm_r, [Out] mp3data mp3data);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int hip_decode(IntPtr decContext, [In] byte[] mp3buf, int len, [In][Out] short[] pcm_l, [In][Out] short[] pcm_r, [Out] mp3data mp3data, out int enc_delay, out int enc_padding);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_genre_list(delGenreCallback handler, IntPtr cookie);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_init(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_add_v2(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_v1_only(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_v2_only(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_space_v1(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_pad_v2(IntPtr context);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_set_pad(IntPtr context, int n);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_set_title(IntPtr context, string title);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_set_artist(IntPtr context, string artist);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_set_album(IntPtr context, string album);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_set_year(IntPtr context, string year);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void id3tag_set_comment(IntPtr context, string comment);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool id3tag_set_track(IntPtr context, string track);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int id3tag_set_genre(IntPtr context, string genre);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool id3tag_set_fieldvalue(IntPtr context, string value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool id3tag_set_albumart(IntPtr context, [In] byte[] image, int size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_id3v1_tag(IntPtr context, [In][Out] byte[] buffer, int size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern int lame_get_id3v2_tag(IntPtr context, [In][Out] byte[] buffer, int size);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		internal static extern void lame_set_write_id3tag_automatic(IntPtr context, bool value);

		[DllImport("libmp3lame.32.dll", CallingConvention = CallingConvention.Cdecl)]
		[return: MarshalAs(UnmanagedType.Bool)]
		internal static extern bool lame_get_write_id3tag_automatic(IntPtr context);
	}
	public class PlayerCtrlV6 : Control
	{
		[Serializable]
		[CompilerGenerated]
		private sealed class <>c
		{
			public static readonly <>c <>9 = new <>c();

			public static MouseEventHandler <>9__73_0;

			public static MouseEventHandler <>9__73_1;

			public static Func<double, double> <>9__74_0;

			internal void <.cctor>b__0_0(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					if ((bool)((DependencyPropertyChangedEventArgs)(ref e)).NewValue)
					{
						playerCtrlV.RemoveBtnEvent(playerCtrlV.realButton);
					}
					else
					{
						playerCtrlV.SetBtnEvent(playerCtrlV.realButton);
					}
				}
			}

			internal void <.cctor>b__0_1(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					if (playerCtrlV.StartChangedEvent != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue != ((DependencyPropertyChangedEventArgs)(ref e)).OldValue)
					{
						playerCtrlV.StartChangedEvent((double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue);
					}
					playerCtrlV.PhysicStart = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrlV.timeLine).ActualWidth / playerCtrlV.MaxValue;
				}
			}

			internal void <.cctor>b__0_2(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					if (playerCtrlV.EndChangedEvent != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue != ((DependencyPropertyChangedEventArgs)(ref e)).OldValue)
					{
						playerCtrlV.EndChangedEvent((double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue);
					}
					playerCtrlV.PhysicEnd = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrlV.timeLine).ActualWidth / playerCtrlV.MaxValue;
				}
			}

			internal void <.cctor>b__0_3(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					playerCtrlV.PhysicCur = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrlV.timeLine).ActualWidth / playerCtrlV.MaxValue;
				}
			}

			internal void <.cctor>b__0_4(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					playerCtrlV.Current = 0.0;
					playerCtrlV.StartValue = 0.0;
					playerCtrlV.EndValue = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue;
					int num = (int)playerCtrlV.EndValue;
					((ContentControl)playerCtrlV.endText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}

			internal void <DrawBars>b__73_0(object sender, MouseEventArgs e)
			{
			}

			internal void <DrawBars>b__73_1(object sender, MouseEventArgs e)
			{
			}

			internal double <GetMaxOfYAxis>b__74_0(double p)
			{
				return p;
			}
		}

		public static readonly DependencyProperty ItemsSourceProperty;

		public static readonly DependencyProperty BarNormalBrushProperty;

		public static readonly DependencyProperty BarHoverBrushProperty;

		public static readonly DependencyProperty IsPlayProperty;

		public static readonly DependencyProperty StartValueProperty;

		public static readonly DependencyProperty EndValueProperty;

		public static readonly DependencyProperty CurrentProperty;

		public static readonly DependencyProperty MaxValueProperty;

		private double maxYAxis;

		private Grid barContent;

		private Border leftRegion;

		private Border rightRegion;

		private Border realRegion;

		private Border realProgress;

		private Border timeLine;

		private Button leftButton;

		private Button rightButton;

		private Button realButton;

		private Label realText;

		private Label startText;

		private Label endText;

		private Button moveBtn;

		private Point start;

		private MouseButtonEventArgs autoEventArgs;

		private double physicStart;

		private double physicEnd;

		private double physicCur;

		public IEnumerable<double> ItemsSource
		{
			get
			{
				return (IEnumerable<double>)((DependencyObject)this).GetValue(ItemsSourceProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ItemsSourceProperty, (object)value);
			}
		}

		public Brush BarNormalBrush
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Expected O, but got Unknown
				return (Brush)((DependencyObject)this).GetValue(BarNormalBrushProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(BarNormalBrushProperty, (object)value);
			}
		}

		public Brush BarHoverBrush
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Expected O, but got Unknown
				return (Brush)((DependencyObject)this).GetValue(BarHoverBrushProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(BarHoverBrushProperty, (object)value);
			}
		}

		public bool IsPlay
		{
			get
			{
				return (bool)((DependencyObject)this).GetValue(IsPlayProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(IsPlayProperty, (object)value);
			}
		}

		public double StartValue
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(StartValueProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StartValueProperty, (object)value);
			}
		}

		public double EndValue
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(EndValueProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(EndValueProperty, (object)value);
			}
		}

		public double Current
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(CurrentProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(CurrentProperty, (object)value);
			}
		}

		public double MaxValue
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(MaxValueProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(MaxValueProperty, (object)value);
			}
		}

		public Action<double> StartChangedEvent { get; set; }

		public Action<double> EndChangedEvent { get; set; }

		private double PhysicCur
		{
			get
			{
				return physicCur;
			}
			set
			{
				//IL_009b: Unknown result type (might be due to invalid IL or missing references)
				//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
				if (physicCur != value)
				{
					if (value < 0.0)
					{
						physicCur = 0.0;
					}
					else if (value > ((FrameworkElement)timeLine).ActualWidth)
					{
						physicCur = ((FrameworkElement)timeLine).ActualWidth;
					}
					else
					{
						physicCur = value;
					}
					((FrameworkElement)realRegion).Width = physicCur + 3.0;
					((FrameworkElement)realButton).Margin = new Thickness(physicCur - 7.0, -5.0, -5.0, -5.0);
					((FrameworkElement)realText).Margin = new Thickness(physicCur - 38.0, 0.0, -38.0, 3.0);
					int num = (int)Current;
					((ContentControl)realText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}
		}

		private double PhysicStart
		{
			get
			{
				return physicStart;
			}
			set
			{
				//IL_0080: Unknown result type (might be due to invalid IL or missing references)
				//IL_00fd: Unknown result type (might be due to invalid IL or missing references)
				if (physicStart != value)
				{
					if (value < 0.0)
					{
						physicStart = 0.0;
					}
					else if (value > ((FrameworkElement)timeLine).ActualWidth)
					{
						physicStart = ((FrameworkElement)timeLine).ActualWidth;
					}
					else
					{
						physicStart = value;
					}
					((FrameworkElement)leftButton).Margin = new Thickness(physicStart - 8.0, -5.0, -5.0, -5.0);
					((FrameworkElement)leftRegion).Width = physicStart + 3.0;
					StartValue = MaxValue * PhysicStart / ((FrameworkElement)timeLine).ActualWidth;
					int num = (int)StartValue;
					((FrameworkElement)startText).Margin = new Thickness(physicStart - 45.0, 0.0, -45.0, 0.0);
					((ContentControl)startText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}
		}

		private double PhysicEnd
		{
			get
			{
				return physicEnd;
			}
			set
			{
				//IL_008c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0115: Unknown result type (might be due to invalid IL or missing references)
				if (physicEnd != value)
				{
					if (value < 0.0)
					{
						physicEnd = 0.0;
					}
					else if (value > ((FrameworkElement)timeLine).ActualWidth)
					{
						physicEnd = ((FrameworkElement)timeLine).ActualWidth;
					}
					else
					{
						physicEnd = value;
					}
					((FrameworkElement)rightButton).Margin = new Thickness(-5.0, -5.0, ((FrameworkElement)timeLine).ActualWidth - physicEnd - 8.0, -5.0);
					((FrameworkElement)rightRegion).Width = ((FrameworkElement)timeLine).ActualWidth - physicEnd + 3.0;
					EndValue = MaxValue * PhysicEnd / ((FrameworkElement)timeLine).ActualWidth;
					int num = (int)EndValue;
					((FrameworkElement)endText).Margin = new Thickness(physicEnd - 45.0, 0.0, -45.0, 0.0);
					((ContentControl)endText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}
		}

		static PlayerCtrlV6()
		{
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Expected O, but got Unknown
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Expected O, but got Unknown
			//IL_0066: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Expected O, but got Unknown
			//IL_0098: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a7: Expected O, but got Unknown
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Expected O, but got Unknown
			//IL_00db: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e5: Expected O, but got Unknown
			//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ea: Expected O, but got Unknown
			//IL_0121: Unknown result type (might be due to invalid IL or missing references)
			//IL_012b: Expected O, but got Unknown
			//IL_0126: Unknown result type (might be due to invalid IL or missing references)
			//IL_0130: Expected O, but got Unknown
			//IL_0167: Unknown result type (might be due to invalid IL or missing references)
			//IL_0171: Expected O, but got Unknown
			//IL_016c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0176: Expected O, but got Unknown
			//IL_01ad: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b7: Expected O, but got Unknown
			//IL_01b2: Unknown result type (might be due to invalid IL or missing references)
			//IL_01bc: Expected O, but got Unknown
			//IL_01f3: Unknown result type (might be due to invalid IL or missing references)
			//IL_01fd: Expected O, but got Unknown
			//IL_01f8: Unknown result type (might be due to invalid IL or missing references)
			//IL_0202: Expected O, but got Unknown
			//IL_0220: Unknown result type (might be due to invalid IL or missing references)
			//IL_022a: Expected O, but got Unknown
			ItemsSourceProperty = DependencyProperty.Register("ItemsSource", typeof(IEnumerable<double>), typeof(PlayerCtrlV6), new PropertyMetadata((object)new List<double>(), new PropertyChangedCallback(OnItemsSourceChanged)));
			BarNormalBrushProperty = DependencyProperty.Register("BarNormalBrush", typeof(Brush), typeof(PlayerCtrlV6), new PropertyMetadata((object)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF96A6B8"))));
			BarHoverBrushProperty = DependencyProperty.Register("BarHoverBrush", typeof(Brush), typeof(PlayerCtrlV6), new PropertyMetadata((object)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF96A6B8"))));
			IsPlayProperty = DependencyProperty.Register("IsPlay", typeof(bool), typeof(PlayerCtrlV6), new PropertyMetadata((object)false, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					if ((bool)((DependencyPropertyChangedEventArgs)(ref e)).NewValue)
					{
						playerCtrlV.RemoveBtnEvent(playerCtrlV.realButton);
					}
					else
					{
						playerCtrlV.SetBtnEvent(playerCtrlV.realButton);
					}
				}
			}));
			StartValueProperty = DependencyProperty.Register("StartValue", typeof(double), typeof(PlayerCtrlV6), new PropertyMetadata((object)0.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					if (playerCtrlV.StartChangedEvent != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue != ((DependencyPropertyChangedEventArgs)(ref e)).OldValue)
					{
						playerCtrlV.StartChangedEvent((double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue);
					}
					playerCtrlV.PhysicStart = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrlV.timeLine).ActualWidth / playerCtrlV.MaxValue;
				}
			}));
			EndValueProperty = DependencyProperty.Register("EndValue", typeof(double), typeof(PlayerCtrlV6), new PropertyMetadata((object)120.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					if (playerCtrlV.EndChangedEvent != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue != ((DependencyPropertyChangedEventArgs)(ref e)).OldValue)
					{
						playerCtrlV.EndChangedEvent((double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue);
					}
					playerCtrlV.PhysicEnd = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrlV.timeLine).ActualWidth / playerCtrlV.MaxValue;
				}
			}));
			CurrentProperty = DependencyProperty.Register("Current", typeof(double), typeof(PlayerCtrlV6), new PropertyMetadata((object)0.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					playerCtrlV.PhysicCur = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrlV.timeLine).ActualWidth / playerCtrlV.MaxValue;
				}
			}));
			MaxValueProperty = DependencyProperty.Register("MaxValue", typeof(double), typeof(PlayerCtrlV6), new PropertyMetadata((object)120.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrlV6 playerCtrlV = sender as PlayerCtrlV6;
				if (playerCtrlV.leftRegion != null)
				{
					playerCtrlV.Current = 0.0;
					playerCtrlV.StartValue = 0.0;
					playerCtrlV.EndValue = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue;
					int num = (int)playerCtrlV.EndValue;
					((ContentControl)playerCtrlV.endText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}));
			FrameworkElement.DefaultStyleKeyProperty.OverrideMetadata(typeof(PlayerCtrlV6), (PropertyMetadata)new FrameworkPropertyMetadata((object)typeof(PlayerCtrlV6)));
		}

		private static void OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			PlayerCtrlV6 playerCtrlV = d as PlayerCtrlV6;
			if (playerCtrlV.leftRegion != null)
			{
				playerCtrlV.DrawBars();
			}
		}

		public PlayerCtrlV6()
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Expected O, but got Unknown
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Expected O, but got Unknown
			((FrameworkElement)this).SizeChanged += (SizeChangedEventHandler)delegate
			{
				PhysicStart = 0.0;
				PhysicEnd = ((FrameworkElement)timeLine).ActualWidth;
				DrawBars();
			};
			((UIElement)this).MouseMove += new MouseEventHandler(PlayerCtrl_MouseMove);
			((UIElement)this).MouseLeftButtonDown += (MouseButtonEventHandler)delegate(object sender, MouseButtonEventArgs e)
			{
				//IL_002d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0032: Unknown result type (might be due to invalid IL or missing references)
				if (((RoutedEventArgs)e).OriginalSource is Grid)
				{
					object originalSource = ((RoutedEventArgs)e).OriginalSource;
					if (((FrameworkElement)((originalSource is Grid) ? originalSource : null)).Tag is Button)
					{
						start = ((MouseEventArgs)e).GetPosition((IInputElement)(object)this);
						object originalSource2 = ((RoutedEventArgs)e).OriginalSource;
						object tag = ((FrameworkElement)((originalSource2 is Grid) ? originalSource2 : null)).Tag;
						moveBtn = (Button)((tag is Button) ? tag : null);
						if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)leftButton).Name)
						{
							Panel.SetZIndex((UIElement)(object)startText, 8080);
							Panel.SetZIndex((UIElement)(object)endText, 0);
						}
						else if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)rightButton).Name)
						{
							Panel.SetZIndex((UIElement)(object)startText, 0);
							Panel.SetZIndex((UIElement)(object)endText, 8080);
						}
						return;
					}
				}
				moveBtn = null;
			};
			((UIElement)this).MouseLeftButtonUp += (MouseButtonEventHandler)delegate(object sender, MouseButtonEventArgs e)
			{
				moveBtn = null;
				((RoutedEventArgs)e).Handled = true;
			};
			autoEventArgs = new MouseButtonEventArgs(Mouse.PrimaryDevice, 0, (MouseButton)0);
			((RoutedEventArgs)autoEventArgs).RoutedEvent = UIElement.MouseLeftButtonUpEvent;
		}

		private void PlayerCtrl_MouseMove(object sender, MouseEventArgs e)
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Invalid comparison between Unknown and I4
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d8: Unknown result type (might be due to invalid IL or missing references)
			_ = ((FrameworkElement)timeLine).ActualWidth;
			((RoutedEventArgs)e).Handled = true;
			if ((int)e.LeftButton != 1 || moveBtn == null)
			{
				return;
			}
			Point position = e.GetPosition((IInputElement)(object)this);
			double num = ((Point)(ref position)).X - ((Point)(ref start)).X;
			if (num == 0.0)
			{
				start = position;
				return;
			}
			if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)leftButton).Name)
			{
				if (physicStart + num > physicEnd)
				{
					moveBtn = rightButton;
					double num2 = physicStart + num;
					PhysicStart = physicEnd;
					PhysicEnd = num2;
					Panel.SetZIndex((UIElement)(object)startText, 0);
					Panel.SetZIndex((UIElement)(object)endText, 8080);
				}
				else
				{
					PhysicStart += num;
				}
			}
			else if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)rightButton).Name)
			{
				if (physicEnd + num < physicStart)
				{
					moveBtn = leftButton;
					double num3 = physicEnd + num;
					PhysicEnd = physicStart;
					PhysicStart = num3;
					Panel.SetZIndex((UIElement)(object)startText, 8080);
					Panel.SetZIndex((UIElement)(object)endText, 0);
				}
				else
				{
					PhysicEnd += num;
				}
			}
			else if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)realButton).Name)
			{
				double num4 = physicCur;
				num4 = ((num4 + num < PhysicStart) ? PhysicStart : ((!(num4 + num > PhysicEnd)) ? (num4 + num) : PhysicEnd));
				Current = num4 * MaxValue / ((FrameworkElement)timeLine).ActualWidth;
			}
			start = position;
		}

		public override void OnApplyTemplate()
		{
			object obj = ((FrameworkTemplate)((Control)this).Template).FindName("PART_barcontent", (FrameworkElement)(object)this);
			barContent = (Grid)((obj is Grid) ? obj : null);
			object obj2 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_LeftRegion", (FrameworkElement)(object)this);
			leftRegion = (Border)((obj2 is Border) ? obj2 : null);
			object obj3 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_RightRegion", (FrameworkElement)(object)this);
			rightRegion = (Border)((obj3 is Border) ? obj3 : null);
			object obj4 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_RealData", (FrameworkElement)(object)this);
			realRegion = (Border)((obj4 is Border) ? obj4 : null);
			object obj5 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_ProReal", (FrameworkElement)(object)this);
			realProgress = (Border)((obj5 is Border) ? obj5 : null);
			object obj6 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_TimeLine", (FrameworkElement)(object)this);
			timeLine = (Border)((obj6 is Border) ? obj6 : null);
			object obj7 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_BtnLeft", (FrameworkElement)(object)this);
			leftButton = (Button)((obj7 is Button) ? obj7 : null);
			object obj8 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_BtnRight", (FrameworkElement)(object)this);
			rightButton = (Button)((obj8 is Button) ? obj8 : null);
			object obj9 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_BtnReal", (FrameworkElement)(object)this);
			realButton = (Button)((obj9 is Button) ? obj9 : null);
			object obj10 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_RealText", (FrameworkElement)(object)this);
			realText = (Label)((obj10 is Label) ? obj10 : null);
			object obj11 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_StartText", (FrameworkElement)(object)this);
			startText = (Label)((obj11 is Label) ? obj11 : null);
			object obj12 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_EndText", (FrameworkElement)(object)this);
			endText = (Label)((obj12 is Label) ? obj12 : null);
			SetBtnEvent(leftButton);
			SetBtnEvent(rightButton);
			SetBtnEvent(realButton);
			((FrameworkElement)this).OnApplyTemplate();
		}

		private void DrawBars()
		{
			//IL_006c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Expected O, but got Unknown
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f4: Expected O, but got Unknown
			//IL_0125: Unknown result type (might be due to invalid IL or missing references)
			//IL_012a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0130: Expected O, but got Unknown
			//IL_0166: Unknown result type (might be due to invalid IL or missing references)
			//IL_0170: Expected O, but got Unknown
			//IL_014b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0150: Unknown result type (might be due to invalid IL or missing references)
			//IL_0156: Expected O, but got Unknown
			maxYAxis = GetMaxOfYAxis();
			barContent.ColumnDefinitions.Clear();
			barContent.RowDefinitions.Clear();
			((Panel)barContent).Children.Clear();
			double actualHeight = ((FrameworkElement)barContent).ActualHeight;
			double actualWidth = ((FrameworkElement)barContent).ActualWidth;
			foreach (double item in ItemsSource)
			{
				Rectangle val = new Rectangle
				{
					Fill = BarNormalBrush,
					Height = actualHeight * (item / maxYAxis),
					Width = actualWidth / (double)ItemsSource.Count() * 0.6,
					VerticalAlignment = (VerticalAlignment)1
				};
				((Panel)barContent).Children.Add((UIElement)(object)val);
				DoubleAnimation val2 = new DoubleAnimation(0.0, actualHeight * (item / maxYAxis), new Duration(new TimeSpan(0, 0, 0, 0, 1000)));
				((UIElement)val).BeginAnimation(FrameworkElement.HeightProperty, (AnimationTimeline)(object)val2);
				((FrameworkElement)val).Tag = item;
				object obj = <>c.<>9__73_0;
				if (obj == null)
				{
					MouseEventHandler val3 = delegate
					{
					};
					<>c.<>9__73_0 = val3;
					obj = (object)val3;
				}
				((UIElement)val).MouseEnter += (MouseEventHandler)obj;
				object obj2 = <>c.<>9__73_1;
				if (obj2 == null)
				{
					MouseEventHandler val4 = delegate
					{
					};
					<>c.<>9__73_1 = val4;
					obj2 = (object)val4;
				}
				((UIElement)val).MouseLeave += (MouseEventHandler)obj2;
				barContent.ColumnDefinitions.Add(new ColumnDefinition());
				Grid.SetColumn((UIElement)(object)val, barContent.ColumnDefinitions.Count - 1);
			}
		}

		private double GetMaxOfYAxis()
		{
			if (ItemsSource == null || ItemsSource.Count() == 0)
			{
				return 200.0;
			}
			double num = ItemsSource.Max((double p) => p);
			int num2 = 1;
			if (num > 1.0)
			{
				int num3 = 2;
				while ((double)num2 < num)
				{
					num2 = 5 * num3;
					num3 += 2;
				}
				num2 /= 10;
			}
			return num2 * 11 * 4 / 3;
		}

		private void SetBtnEvent(Button btn)
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Expected O, but got Unknown
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Expected O, but got Unknown
			((UIElement)btn).AddHandler(UIElement.MouseMoveEvent, (Delegate)new MouseEventHandler(OnMouseMoveEvent), true);
			((UIElement)btn).AddHandler(UIElement.MouseLeftButtonDownEvent, (Delegate)new MouseButtonEventHandler(OnLeftButtonEvent), true);
			((UIElement)btn).AddHandler(UIElement.MouseLeftButtonUpEvent, (Delegate)new MouseButtonEventHandler(OnLeftButtonEvent), true);
		}

		private void RemoveBtnEvent(Button btn)
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Expected O, but got Unknown
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			((UIElement)btn).RemoveHandler(UIElement.MouseMoveEvent, (Delegate)new MouseEventHandler(OnMouseMoveEvent));
			((UIElement)btn).RemoveHandler(UIElement.MouseLeftButtonDownEvent, (Delegate)new MouseButtonEventHandler(OnLeftButtonEvent));
			((UIElement)btn).RemoveHandler(UIElement.MouseLeftButtonUpEvent, (Delegate)new MouseButtonEventHandler(OnLeftButtonEvent));
		}

		private void OnMouseMoveEvent(object sender, MouseEventArgs e)
		{
			((RoutedEventArgs)e).Handled = false;
		}

		private void OnLeftButtonEvent(object sender, MouseButtonEventArgs e)
		{
			((RoutedEventArgs)e).Handled = false;
		}
	}
	public class PlayerCtrl : Control
	{
		[Serializable]
		[CompilerGenerated]
		private sealed class <>c
		{
			public static readonly <>c <>9 = new <>c();

			public static MouseEventHandler <>9__73_0;

			public static MouseEventHandler <>9__73_1;

			public static Func<double, double> <>9__74_0;

			internal void <.cctor>b__0_0(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					if ((bool)((DependencyPropertyChangedEventArgs)(ref e)).NewValue)
					{
						playerCtrl.RemoveBtnEvent(playerCtrl.realButton);
					}
					else
					{
						playerCtrl.SetBtnEvent(playerCtrl.realButton);
					}
				}
			}

			internal void <.cctor>b__0_1(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					if (playerCtrl.StartChangedEvent != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue != ((DependencyPropertyChangedEventArgs)(ref e)).OldValue)
					{
						playerCtrl.StartChangedEvent((double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue);
					}
					playerCtrl.PhysicStart = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrl.timeLine).ActualWidth / playerCtrl.MaxValue;
				}
			}

			internal void <.cctor>b__0_2(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					if (playerCtrl.EndChangedEvent != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue != ((DependencyPropertyChangedEventArgs)(ref e)).OldValue)
					{
						playerCtrl.EndChangedEvent((double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue);
					}
					playerCtrl.PhysicEnd = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrl.timeLine).ActualWidth / playerCtrl.MaxValue;
				}
			}

			internal void <.cctor>b__0_3(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					playerCtrl.PhysicCur = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrl.timeLine).ActualWidth / playerCtrl.MaxValue;
				}
			}

			internal void <.cctor>b__0_4(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					playerCtrl.Current = 0.0;
					playerCtrl.StartValue = 0.0;
					playerCtrl.EndValue = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue;
					int num = (int)playerCtrl.EndValue;
					((ContentControl)playerCtrl.endText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}

			internal void <DrawBars>b__73_0(object sender, MouseEventArgs e)
			{
			}

			internal void <DrawBars>b__73_1(object sender, MouseEventArgs e)
			{
			}

			internal double <GetMaxOfYAxis>b__74_0(double p)
			{
				return p;
			}
		}

		public static readonly DependencyProperty ItemsSourceProperty;

		public static readonly DependencyProperty BarNormalBrushProperty;

		public static readonly DependencyProperty BarHoverBrushProperty;

		public static readonly DependencyProperty IsPlayProperty;

		public static readonly DependencyProperty StartValueProperty;

		public static readonly DependencyProperty EndValueProperty;

		public static readonly DependencyProperty CurrentProperty;

		public static readonly DependencyProperty MaxValueProperty;

		private double maxYAxis;

		private Grid barContent;

		private Border leftRegion;

		private Border rightRegion;

		private Border realRegion;

		private Border realProgress;

		private Border timeLine;

		private Button leftButton;

		private Button rightButton;

		private Button realButton;

		private Label realText;

		private Label startText;

		private Label endText;

		private Button moveBtn;

		private Point start;

		private MouseButtonEventArgs autoEventArgs;

		private double physicStart;

		private double physicEnd;

		private double physicCur;

		public IEnumerable<double> ItemsSource
		{
			get
			{
				return (IEnumerable<double>)((DependencyObject)this).GetValue(ItemsSourceProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ItemsSourceProperty, (object)value);
			}
		}

		public Brush BarNormalBrush
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Expected O, but got Unknown
				return (Brush)((DependencyObject)this).GetValue(BarNormalBrushProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(BarNormalBrushProperty, (object)value);
			}
		}

		public Brush BarHoverBrush
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Expected O, but got Unknown
				return (Brush)((DependencyObject)this).GetValue(BarHoverBrushProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(BarHoverBrushProperty, (object)value);
			}
		}

		public bool IsPlay
		{
			get
			{
				return (bool)((DependencyObject)this).GetValue(IsPlayProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(IsPlayProperty, (object)value);
			}
		}

		public double StartValue
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(StartValueProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StartValueProperty, (object)value);
			}
		}

		public double EndValue
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(EndValueProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(EndValueProperty, (object)value);
			}
		}

		public double Current
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(CurrentProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(CurrentProperty, (object)value);
			}
		}

		public double MaxValue
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(MaxValueProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(MaxValueProperty, (object)value);
			}
		}

		public Action<double> StartChangedEvent { get; set; }

		public Action<double> EndChangedEvent { get; set; }

		private double PhysicCur
		{
			get
			{
				return physicCur;
			}
			set
			{
				//IL_009b: Unknown result type (might be due to invalid IL or missing references)
				//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
				if (physicCur != value)
				{
					if (value < 0.0)
					{
						physicCur = 0.0;
					}
					else if (value > ((FrameworkElement)timeLine).ActualWidth)
					{
						physicCur = ((FrameworkElement)timeLine).ActualWidth;
					}
					else
					{
						physicCur = value;
					}
					((FrameworkElement)realRegion).Width = physicCur + 3.0;
					((FrameworkElement)realButton).Margin = new Thickness(physicCur - 7.0, -5.0, -5.0, -5.0);
					((FrameworkElement)realText).Margin = new Thickness(physicCur - 30.0, 0.0, -30.0, 10.0);
					int num = (int)Current;
					((ContentControl)realText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}
		}

		private double PhysicStart
		{
			get
			{
				return physicStart;
			}
			set
			{
				//IL_0080: Unknown result type (might be due to invalid IL or missing references)
				//IL_00fd: Unknown result type (might be due to invalid IL or missing references)
				if (physicStart != value)
				{
					if (value < 0.0)
					{
						physicStart = 0.0;
					}
					else if (value > ((FrameworkElement)timeLine).ActualWidth)
					{
						physicStart = ((FrameworkElement)timeLine).ActualWidth;
					}
					else
					{
						physicStart = value;
					}
					((FrameworkElement)leftButton).Margin = new Thickness(physicStart - 11.0, -5.0, -5.0, -5.0);
					((FrameworkElement)leftRegion).Width = physicStart + 3.0;
					StartValue = MaxValue * PhysicStart / ((FrameworkElement)timeLine).ActualWidth;
					int num = (int)StartValue;
					((FrameworkElement)startText).Margin = new Thickness(physicStart - 45.0, 10.0, -45.0, 0.0);
					((ContentControl)startText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}
		}

		private double PhysicEnd
		{
			get
			{
				return physicEnd;
			}
			set
			{
				//IL_008c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0115: Unknown result type (might be due to invalid IL or missing references)
				if (physicEnd != value)
				{
					if (value < 0.0)
					{
						physicEnd = 0.0;
					}
					else if (value > ((FrameworkElement)timeLine).ActualWidth)
					{
						physicEnd = ((FrameworkElement)timeLine).ActualWidth;
					}
					else
					{
						physicEnd = value;
					}
					((FrameworkElement)rightButton).Margin = new Thickness(-5.0, -5.0, ((FrameworkElement)timeLine).ActualWidth - physicEnd - 14.0, -5.0);
					((FrameworkElement)rightRegion).Width = ((FrameworkElement)timeLine).ActualWidth - physicEnd + 3.0;
					EndValue = MaxValue * PhysicEnd / ((FrameworkElement)timeLine).ActualWidth;
					int num = (int)EndValue;
					((FrameworkElement)endText).Margin = new Thickness(physicEnd - 45.0, 10.0, -45.0, 0.0);
					((ContentControl)endText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}
		}

		static PlayerCtrl()
		{
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Expected O, but got Unknown
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Expected O, but got Unknown
			//IL_0066: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Expected O, but got Unknown
			//IL_0098: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a7: Expected O, but got Unknown
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Expected O, but got Unknown
			//IL_00db: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e5: Expected O, but got Unknown
			//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ea: Expected O, but got Unknown
			//IL_0121: Unknown result type (might be due to invalid IL or missing references)
			//IL_012b: Expected O, but got Unknown
			//IL_0126: Unknown result type (might be due to invalid IL or missing references)
			//IL_0130: Expected O, but got Unknown
			//IL_0167: Unknown result type (might be due to invalid IL or missing references)
			//IL_0171: Expected O, but got Unknown
			//IL_016c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0176: Expected O, but got Unknown
			//IL_01ad: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b7: Expected O, but got Unknown
			//IL_01b2: Unknown result type (might be due to invalid IL or missing references)
			//IL_01bc: Expected O, but got Unknown
			//IL_01f3: Unknown result type (might be due to invalid IL or missing references)
			//IL_01fd: Expected O, but got Unknown
			//IL_01f8: Unknown result type (might be due to invalid IL or missing references)
			//IL_0202: Expected O, but got Unknown
			//IL_0220: Unknown result type (might be due to invalid IL or missing references)
			//IL_022a: Expected O, but got Unknown
			ItemsSourceProperty = DependencyProperty.Register("ItemsSource", typeof(IEnumerable<double>), typeof(PlayerCtrl), new PropertyMetadata((object)new List<double>(), new PropertyChangedCallback(OnItemsSourceChanged)));
			BarNormalBrushProperty = DependencyProperty.Register("BarNormalBrush", typeof(Brush), typeof(PlayerCtrl), new PropertyMetadata((object)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFA9CDFD"))));
			BarHoverBrushProperty = DependencyProperty.Register("BarHoverBrush", typeof(Brush), typeof(PlayerCtrl), new PropertyMetadata((object)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFA9CDFD"))));
			IsPlayProperty = DependencyProperty.Register("IsPlay", typeof(bool), typeof(PlayerCtrl), new PropertyMetadata((object)false, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					if ((bool)((DependencyPropertyChangedEventArgs)(ref e)).NewValue)
					{
						playerCtrl.RemoveBtnEvent(playerCtrl.realButton);
					}
					else
					{
						playerCtrl.SetBtnEvent(playerCtrl.realButton);
					}
				}
			}));
			StartValueProperty = DependencyProperty.Register("StartValue", typeof(double), typeof(PlayerCtrl), new PropertyMetadata((object)0.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					if (playerCtrl.StartChangedEvent != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue != ((DependencyPropertyChangedEventArgs)(ref e)).OldValue)
					{
						playerCtrl.StartChangedEvent((double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue);
					}
					playerCtrl.PhysicStart = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrl.timeLine).ActualWidth / playerCtrl.MaxValue;
				}
			}));
			EndValueProperty = DependencyProperty.Register("EndValue", typeof(double), typeof(PlayerCtrl), new PropertyMetadata((object)120.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					if (playerCtrl.EndChangedEvent != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue != ((DependencyPropertyChangedEventArgs)(ref e)).OldValue)
					{
						playerCtrl.EndChangedEvent((double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue);
					}
					playerCtrl.PhysicEnd = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrl.timeLine).ActualWidth / playerCtrl.MaxValue;
				}
			}));
			CurrentProperty = DependencyProperty.Register("Current", typeof(double), typeof(PlayerCtrl), new PropertyMetadata((object)0.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					playerCtrl.PhysicCur = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue * ((FrameworkElement)playerCtrl.timeLine).ActualWidth / playerCtrl.MaxValue;
				}
			}));
			MaxValueProperty = DependencyProperty.Register("MaxValue", typeof(double), typeof(PlayerCtrl), new PropertyMetadata((object)120.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlayerCtrl playerCtrl = sender as PlayerCtrl;
				if (playerCtrl.leftRegion != null)
				{
					playerCtrl.Current = 0.0;
					playerCtrl.StartValue = 0.0;
					playerCtrl.EndValue = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue;
					int num = (int)playerCtrl.EndValue;
					((ContentControl)playerCtrl.endText).Content = $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
				}
			}));
			FrameworkElement.DefaultStyleKeyProperty.OverrideMetadata(typeof(PlayerCtrl), (PropertyMetadata)new FrameworkPropertyMetadata((object)typeof(PlayerCtrl)));
		}

		private static void OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			PlayerCtrl playerCtrl = d as PlayerCtrl;
			if (playerCtrl.leftRegion != null)
			{
				playerCtrl.DrawBars();
			}
		}

		public PlayerCtrl()
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Expected O, but got Unknown
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Expected O, but got Unknown
			((FrameworkElement)this).SizeChanged += (SizeChangedEventHandler)delegate
			{
				PhysicStart = 0.0;
				PhysicEnd = ((FrameworkElement)timeLine).ActualWidth;
				DrawBars();
			};
			((UIElement)this).MouseMove += new MouseEventHandler(PlayerCtrl_MouseMove);
			((UIElement)this).MouseLeftButtonDown += (MouseButtonEventHandler)delegate(object sender, MouseButtonEventArgs e)
			{
				//IL_002d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0032: Unknown result type (might be due to invalid IL or missing references)
				if (((RoutedEventArgs)e).OriginalSource is Grid)
				{
					object originalSource = ((RoutedEventArgs)e).OriginalSource;
					if (((FrameworkElement)((originalSource is Grid) ? originalSource : null)).Tag is Button)
					{
						start = ((MouseEventArgs)e).GetPosition((IInputElement)(object)this);
						object originalSource2 = ((RoutedEventArgs)e).OriginalSource;
						object tag = ((FrameworkElement)((originalSource2 is Grid) ? originalSource2 : null)).Tag;
						moveBtn = (Button)((tag is Button) ? tag : null);
						if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)leftButton).Name)
						{
							Panel.SetZIndex((UIElement)(object)startText, 8080);
							Panel.SetZIndex((UIElement)(object)endText, 0);
						}
						else if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)rightButton).Name)
						{
							Panel.SetZIndex((UIElement)(object)startText, 0);
							Panel.SetZIndex((UIElement)(object)endText, 8080);
						}
						return;
					}
				}
				moveBtn = null;
			};
			((UIElement)this).MouseLeftButtonUp += (MouseButtonEventHandler)delegate(object sender, MouseButtonEventArgs e)
			{
				moveBtn = null;
				((RoutedEventArgs)e).Handled = true;
			};
			autoEventArgs = new MouseButtonEventArgs(Mouse.PrimaryDevice, 0, (MouseButton)0);
			((RoutedEventArgs)autoEventArgs).RoutedEvent = UIElement.MouseLeftButtonUpEvent;
		}

		private void PlayerCtrl_MouseMove(object sender, MouseEventArgs e)
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Invalid comparison between Unknown and I4
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d8: Unknown result type (might be due to invalid IL or missing references)
			_ = ((FrameworkElement)timeLine).ActualWidth;
			((RoutedEventArgs)e).Handled = true;
			if ((int)e.LeftButton != 1 || moveBtn == null)
			{
				return;
			}
			Point position = e.GetPosition((IInputElement)(object)this);
			double num = ((Point)(ref position)).X - ((Point)(ref start)).X;
			if (num == 0.0)
			{
				start = position;
				return;
			}
			if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)leftButton).Name)
			{
				if (physicStart + num > physicEnd)
				{
					moveBtn = rightButton;
					double num2 = physicStart + num;
					PhysicStart = physicEnd;
					PhysicEnd = num2;
					Panel.SetZIndex((UIElement)(object)startText, 0);
					Panel.SetZIndex((UIElement)(object)endText, 8080);
				}
				else
				{
					PhysicStart += num;
				}
			}
			else if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)rightButton).Name)
			{
				if (physicEnd + num < physicStart)
				{
					moveBtn = leftButton;
					double num3 = physicEnd + num;
					PhysicEnd = physicStart;
					PhysicStart = num3;
					Panel.SetZIndex((UIElement)(object)startText, 8080);
					Panel.SetZIndex((UIElement)(object)endText, 0);
				}
				else
				{
					PhysicEnd += num;
				}
			}
			else if (((FrameworkElement)moveBtn).Name == ((FrameworkElement)realButton).Name)
			{
				double num4 = physicCur;
				num4 = ((num4 + num < PhysicStart) ? PhysicStart : ((!(num4 + num > PhysicEnd)) ? (num4 + num) : PhysicEnd));
				Current = num4 * MaxValue / ((FrameworkElement)timeLine).ActualWidth;
			}
			start = position;
		}

		public override void OnApplyTemplate()
		{
			object obj = ((FrameworkTemplate)((Control)this).Template).FindName("PART_barcontent", (FrameworkElement)(object)this);
			barContent = (Grid)((obj is Grid) ? obj : null);
			object obj2 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_LeftRegion", (FrameworkElement)(object)this);
			leftRegion = (Border)((obj2 is Border) ? obj2 : null);
			object obj3 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_RightRegion", (FrameworkElement)(object)this);
			rightRegion = (Border)((obj3 is Border) ? obj3 : null);
			object obj4 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_RealData", (FrameworkElement)(object)this);
			realRegion = (Border)((obj4 is Border) ? obj4 : null);
			object obj5 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_ProReal", (FrameworkElement)(object)this);
			realProgress = (Border)((obj5 is Border) ? obj5 : null);
			object obj6 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_TimeLine", (FrameworkElement)(object)this);
			timeLine = (Border)((obj6 is Border) ? obj6 : null);
			object obj7 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_BtnLeft", (FrameworkElement)(object)this);
			leftButton = (Button)((obj7 is Button) ? obj7 : null);
			object obj8 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_BtnRight", (FrameworkElement)(object)this);
			rightButton = (Button)((obj8 is Button) ? obj8 : null);
			object obj9 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_BtnReal", (FrameworkElement)(object)this);
			realButton = (Button)((obj9 is Button) ? obj9 : null);
			object obj10 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_RealText", (FrameworkElement)(object)this);
			realText = (Label)((obj10 is Label) ? obj10 : null);
			object obj11 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_StartText", (FrameworkElement)(object)this);
			startText = (Label)((obj11 is Label) ? obj11 : null);
			object obj12 = ((FrameworkTemplate)((Control)this).Template).FindName("PART_EndText", (FrameworkElement)(object)this);
			endText = (Label)((obj12 is Label) ? obj12 : null);
			SetBtnEvent(leftButton);
			SetBtnEvent(rightButton);
			SetBtnEvent(realButton);
			((FrameworkElement)this).OnApplyTemplate();
		}

		private void DrawBars()
		{
			//IL_006c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Expected O, but got Unknown
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f4: Expected O, but got Unknown
			//IL_0125: Unknown result type (might be due to invalid IL or missing references)
			//IL_012a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0130: Expected O, but got Unknown
			//IL_0166: Unknown result type (might be due to invalid IL or missing references)
			//IL_0170: Expected O, but got Unknown
			//IL_014b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0150: Unknown result type (might be due to invalid IL or missing references)
			//IL_0156: Expected O, but got Unknown
			maxYAxis = GetMaxOfYAxis();
			barContent.ColumnDefinitions.Clear();
			barContent.RowDefinitions.Clear();
			((Panel)barContent).Children.Clear();
			double actualHeight = ((FrameworkElement)barContent).ActualHeight;
			double actualWidth = ((FrameworkElement)barContent).ActualWidth;
			foreach (double item in ItemsSource)
			{
				Rectangle val = new Rectangle
				{
					Fill = BarNormalBrush,
					Height = actualHeight * (item / maxYAxis),
					Width = actualWidth / (double)ItemsSource.Count() * 0.6,
					VerticalAlignment = (VerticalAlignment)2
				};
				((Panel)barContent).Children.Add((UIElement)(object)val);
				DoubleAnimation val2 = new DoubleAnimation(0.0, actualHeight * (item / maxYAxis), new Duration(new TimeSpan(0, 0, 0, 0, 1000)));
				((UIElement)val).BeginAnimation(FrameworkElement.HeightProperty, (AnimationTimeline)(object)val2);
				((FrameworkElement)val).Tag = item;
				object obj = <>c.<>9__73_0;
				if (obj == null)
				{
					MouseEventHandler val3 = delegate
					{
					};
					<>c.<>9__73_0 = val3;
					obj = (object)val3;
				}
				((UIElement)val).MouseEnter += (MouseEventHandler)obj;
				object obj2 = <>c.<>9__73_1;
				if (obj2 == null)
				{
					MouseEventHandler val4 = delegate
					{
					};
					<>c.<>9__73_1 = val4;
					obj2 = (object)val4;
				}
				((UIElement)val).MouseLeave += (MouseEventHandler)obj2;
				barContent.ColumnDefinitions.Add(new ColumnDefinition());
				Grid.SetColumn((UIElement)(object)val, barContent.ColumnDefinitions.Count - 1);
			}
		}

		private double GetMaxOfYAxis()
		{
			if (ItemsSource == null || ItemsSource.Count() == 0)
			{
				return 200.0;
			}
			double num = ItemsSource.Max((double p) => p);
			int num2 = 1;
			if (num > 1.0)
			{
				int num3 = 2;
				while ((double)num2 < num)
				{
					num2 = 5 * num3;
					num3 += 2;
				}
				num2 /= 10;
			}
			return num2 * 11 * 4 / 3;
		}

		private void SetBtnEvent(Button btn)
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Expected O, but got Unknown
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Expected O, but got Unknown
			((UIElement)btn).AddHandler(UIElement.MouseMoveEvent, (Delegate)new MouseEventHandler(OnMouseMoveEvent), true);
			((UIElement)btn).AddHandler(UIElement.MouseLeftButtonDownEvent, (Delegate)new MouseButtonEventHandler(OnLeftButtonEvent), true);
			((UIElement)btn).AddHandler(UIElement.MouseLeftButtonUpEvent, (Delegate)new MouseButtonEventHandler(OnLeftButtonEvent), true);
		}

		private void RemoveBtnEvent(Button btn)
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Expected O, but got Unknown
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			((UIElement)btn).RemoveHandler(UIElement.MouseMoveEvent, (Delegate)new MouseEventHandler(OnMouseMoveEvent));
			((UIElement)btn).RemoveHandler(UIElement.MouseLeftButtonDownEvent, (Delegate)new MouseButtonEventHandler(OnLeftButtonEvent));
			((UIElement)btn).RemoveHandler(UIElement.MouseLeftButtonUpEvent, (Delegate)new MouseButtonEventHandler(OnLeftButtonEvent));
		}

		private void OnMouseMoveEvent(object sender, MouseEventArgs e)
		{
			((RoutedEventArgs)e).Handled = false;
		}

		private void OnLeftButtonEvent(object sender, MouseButtonEventArgs e)
		{
			((RoutedEventArgs)e).Handled = false;
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.Ringtone.Comm
{
	public class MarginConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_007b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			if (value == null)
			{
				return (object)new Thickness(-5.0);
			}
			if (parameter == null)
			{
				return (object)new Thickness((double)value - 10.0, -5.0, -5.0, -5.0);
			}
			return (object)new Thickness(-5.0, -5.0, (double)value - 10.0, -5.0);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class Number2TimeStrConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return "00:00:00";
			}
			int num = (int)(double)value;
			return $"{num / 3600:00}:{num % 3600 / 60:00}:{num % 60:00}";
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class MultiBoolConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values == null || values.Length < 2)
			{
				return false;
			}
			for (int i = 0; i < values.Length; i++)
			{
				if (!System.Convert.ToBoolean(values[i]))
				{
					return false;
				}
			}
			return true;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.GifMaker
{
	public class ImageEntitiy : ViewModelBase
	{
		private string _FilePath;

		private BitmapSource _BitmapImage;

		public ICommand ImageOperCmd { get; set; }

		public bool IsImage { get; set; }

		public string Index { get; set; }

		public string FilePath
		{
			get
			{
				return _FilePath;
			}
			set
			{
				if (!(_FilePath == value))
				{
					_FilePath = value;
					LoadImage(_FilePath);
				}
			}
		}

		public BitmapSource BitmapImage
		{
			get
			{
				return _BitmapImage;
			}
			set
			{
				_BitmapImage = value;
				((NotifyBase)this).OnPropertyChanged("BitmapImage");
			}
		}

		public void LoadImage(string file)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			if (string.IsNullOrEmpty(file) || !File.Exists(file))
			{
				return;
			}
			try
			{
				BitmapImage val = new BitmapImage();
				val.BeginInit();
				val.DecodePixelWidth = 250;
				val.CacheOption = (BitmapCacheOption)1;
				val.UriSource = new Uri(file);
				val.EndInit();
				((Freezable)val).Freeze();
				BitmapImage = (BitmapSource)(object)val;
			}
			catch (Exception)
			{
			}
		}
	}
	public class ImageListSelector : DataTemplateSelector
	{
		public DataTemplate ImageTemplate { get; set; }

		public DataTemplate BtnTemplate { get; set; }

		public override DataTemplate SelectTemplate(object item, DependencyObject container)
		{
			if (item != null && item is ImageEntitiy imageEntitiy)
			{
				if (!imageEntitiy.IsImage)
				{
					return BtnTemplate;
				}
				return ImageTemplate;
			}
			return ((DataTemplateSelector)this).SelectTemplate(item, container);
		}
	}
	public class ItemStyleSelector : StyleSelector
	{
		public Style NoramlStyle { get; set; }

		public Style AddBtnStyle { get; set; }

		public override Style SelectStyle(object item, DependencyObject container)
		{
			if (item != null && item is ImageEntitiy imageEntitiy)
			{
				if (!imageEntitiy.IsImage)
				{
					return AddBtnStyle;
				}
				return NoramlStyle;
			}
			return ((StyleSelector)this).SelectStyle(item, container);
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.GifMaker.View
{
	public class PlotView : Window, IComponentConnector
	{
		internal Canvas canvas;

		internal ScaleTransform scale;

		private bool _contentLoaded;

		public PlotViewModel ViewModel { get; set; }

		public PlotView()
		{
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Expected O, but got Unknown
			InitializeComponent();
			((Window)this).WindowStartupLocation = (WindowStartupLocation)1;
			ViewModel = new PlotViewModel(this);
			((UIElement)canvas).MouseLeftButtonDown += new MouseButtonEventHandler(ViewModel.OnMouseLeftBtnDown);
			((UIElement)canvas).MouseMove += new MouseEventHandler(ViewModel.OnMouseMove);
			((UIElement)canvas).MouseLeftButtonUp += new MouseButtonEventHandler(ViewModel.OnMouseLeftBtnUp);
			((FrameworkElement)this).DataContext = ViewModel;
		}

		public void AddElement(UIElement element)
		{
			((Panel)canvas).Children.Add(element);
		}

		public void DelElement(UIElement element)
		{
			((Panel)canvas).Children.Remove(element);
		}

		public void DelAllElement()
		{
			((Panel)canvas).Children.Clear();
		}

		public int GetElementCount()
		{
			return ((Panel)canvas).Children.Count;
		}

		public void DelLatestElement()
		{
			int num = -1;
			IPlotBase plotBase = null;
			foreach (IPlotBase child in ((Panel)canvas).Children)
			{
				if (child.Number > num)
				{
					num = child.Number;
					plotBase = child;
				}
			}
			if (plotBase != null)
			{
				DelElement((UIElement)((plotBase is UIElement) ? plotBase : null));
			}
		}

		protected override void OnClosed(EventArgs e)
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Expected O, but got Unknown
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			((UIElement)this).CommandBindings.Clear();
			((UIElement)canvas).MouseMove -= new MouseEventHandler(ViewModel.OnMouseMove);
			((UIElement)canvas).MouseLeftButtonUp -= new MouseButtonEventHandler(ViewModel.OnMouseLeftBtnUp);
			((UIElement)canvas).MouseLeftButtonDown -= new MouseButtonEventHandler(ViewModel.OnMouseLeftBtnDown);
			((Window)this).OnClosed(e);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/gifmaker/view/plotview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Expected O, but got Unknown
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				canvas = (Canvas)target;
				break;
			case 2:
				scale = (ScaleTransform)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class ProgressView : Window, IComponentConnector
	{
		private bool _contentLoaded;

		public ProgressModel Model { get; set; }

		public ProgressView()
		{
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Expected O, but got Unknown
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Expected O, but got Unknown
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Expected O, but got Unknown
			InitializeComponent();
			((Window)this).ShowInTaskbar = false;
			((Window)this).WindowStartupLocation = (WindowStartupLocation)1;
			Model = new ProgressModel
			{
				Percentage = 0.0,
				CloseCmd = (ICommand)new RoutedCommand(),
				Information = "K0226"
			};
			((UIElement)this).CommandBindings.Add(new CommandBinding(Model.CloseCmd, (ExecutedRoutedEventHandler)delegate
			{
				((Window)this).Close();
			}));
			((FrameworkElement)this).DataContext = Model;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/gifmaker/view/progressview.xaml", UriKind.Relative);
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
	public class GifMakerView : Window, IComponentConnector
	{
		internal Grid player;

		internal Image gif;

		internal Image img;

		internal TextBox txtWidth;

		internal TextBox txtHeight;

		internal ListBox ImgList;

		private bool _contentLoaded;

		public GifMakerViewModel ViewModel { get; set; }

		public GifMakerView()
		{
			InitializeComponent();
			ViewModel = new GifMakerViewModel(this);
			((FrameworkElement)this).DataContext = ViewModel;
			((Window)this).WindowStartupLocation = (WindowStartupLocation)1;
		}

		private void OnTextChanged(object sender, TextChangedEventArgs e)
		{
			TextBox val = (TextBox)((sender is TextBox) ? sender : null);
			if (img.Source == null || !((UIElement)val).IsFocused)
			{
				return;
			}
			int num = (int)img.Source.Width;
			int num2 = (int)img.Source.Height;
			if (string.IsNullOrEmpty(val.Text))
			{
				ViewModel.Model.GifWidth = 1;
				ViewModel.Model.GifHeight = 1;
			}
			else if (((FrameworkElement)val).Name == "txtHeight")
			{
				if (ViewModel.Model.GifHeight > 4000)
				{
					ViewModel.Model.GifHeight /= 10;
					txtHeight.SelectionStart = txtHeight.Text.Length;
					return;
				}
				if (ViewModel.Model.GifHeight == 0)
				{
					ViewModel.Model.GifHeight = 1;
					return;
				}
				num = num * ViewModel.Model.GifHeight / num2;
				if (num > 4000)
				{
					ViewModel.Model.GifWidth = 4000;
				}
				else if (num == 0)
				{
					ViewModel.Model.GifWidth = 1;
				}
				else
				{
					ViewModel.Model.GifWidth = num;
				}
			}
			else
			{
				if (!(((FrameworkElement)val).Name == "txtWidth"))
				{
					return;
				}
				if (ViewModel.Model.GifWidth > 4000)
				{
					ViewModel.Model.GifWidth /= 10;
					txtWidth.SelectionStart = txtWidth.Text.Length;
					return;
				}
				if (ViewModel.Model.GifWidth == 0)
				{
					ViewModel.Model.GifWidth = 1;
					return;
				}
				num2 = num2 * ViewModel.Model.GifWidth / num;
				if (num2 > 4000)
				{
					ViewModel.Model.GifHeight = 4000;
				}
				else if (num2 == 0)
				{
					ViewModel.Model.GifHeight = 1;
				}
				else
				{
					ViewModel.Model.GifHeight = num2;
				}
			}
		}

		private void OnPreviewTextInput(object sender, TextCompositionEventArgs e)
		{
			if (new Regex("[^0-9.-]+").IsMatch(e.Text))
			{
				((RoutedEventArgs)e).Handled = true;
			}
		}

		public void StopAnimation()
		{
		}

		public void ResumeAnimation()
		{
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.toolbox;component/gifmaker/view/gifmakerview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Expected O, but got Unknown
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Expected O, but got Unknown
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Expected O, but got Unknown
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			//IL_007c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Expected O, but got Unknown
			//IL_0089: Unknown result type (might be due to invalid IL or missing references)
			//IL_0093: Expected O, but got Unknown
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00aa: Expected O, but got Unknown
			//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c1: Expected O, but got Unknown
			//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ce: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				player = (Grid)target;
				break;
			case 2:
				gif = (Image)target;
				break;
			case 3:
				img = (Image)target;
				break;
			case 4:
				txtWidth = (TextBox)target;
				((TextBoxBase)txtWidth).TextChanged += new TextChangedEventHandler(OnTextChanged);
				((UIElement)txtWidth).PreviewTextInput += new TextCompositionEventHandler(OnPreviewTextInput);
				break;
			case 5:
				txtHeight = (TextBox)target;
				((TextBoxBase)txtHeight).TextChanged += new TextChangedEventHandler(OnTextChanged);
				((UIElement)txtHeight).PreviewTextInput += new TextCompositionEventHandler(OnPreviewTextInput);
				break;
			case 6:
				ImgList = (ListBox)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.GifMaker.ViewModel
{
	public class PlotViewModel
	{
		[Serializable]
		[CompilerGenerated]
		private sealed class <>c
		{
			public static readonly <>c <>9 = new <>c();

			public static Func<bool> <>9__27_5;

			public static Func<bool> <>9__33_0;

			public static MouseButtonEventHandler <>9__39_2;

			public static Func<FrameworkElement, object> <>9__40_0;

			internal bool <.ctor>b__27_5()
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_002a: Unknown result type (might be due to invalid IL or missing references)
				LenovoPopupWindow obj = new OkCancelWindowModel().CreateWindow(HostProxy.Host.HostMainWindowHandle, "K0071", "K0224", "K0208", "K0327", (ImageSource)null);
				new WindowInteropHelper((Window)(object)obj).Owner = HostProxy.Host.HostMainWindowHandle;
				((Window)obj).WindowStartupLocation = (WindowStartupLocation)2;
				((Window)obj).ShowDialog();
				return obj.WindowModel.GetViewModel<OKCancelViewModel>().IsOKResult;
			}

			internal bool <IsNeedNewElement>b__33_0()
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_002a: Unknown result type (might be due to invalid IL or missing references)
				LenovoPopupWindow obj = new OkCancelWindowModel().CreateWindow(HostProxy.Host.HostMainWindowHandle, "K0071", "K0224", "K0208", "K0327", (ImageSource)null);
				new WindowInteropHelper((Window)(object)obj).Owner = HostProxy.Host.HostMainWindowHandle;
				((Window)obj).WindowStartupLocation = (WindowStartupLocation)2;
				((Window)obj).ShowDialog();
				return obj.WindowModel.GetViewModel<OKCancelViewModel>().IsOKResult;
			}

			internal void <DrawText>b__39_2(object sender, MouseButtonEventArgs e)
			{
				((RoutedEventArgs)e).Handled = true;
			}

			internal object <DrawClip>b__40_0(FrameworkElement param)
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_0005: Unknown result type (might be due to invalid IL or missing references)
				//IL_0017: Unknown result type (might be due to invalid IL or missing references)
				//IL_001c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0026: Expected O, but got Unknown
				//IL_0027: Expected O, but got Unknown
				return (object)new Grid
				{
					Background = (Brush)new SolidColorBrush(Color.FromArgb((byte)20, byte.MaxValue, byte.MaxValue, byte.MaxValue))
				};
			}
		}

		private PlotView viewWnd;

		private PlotType ElementType;

		private IPlotBase CurElement;

		public ICommand CloseCmd { get; set; }

		public ICommand UndoCmd { get; set; }

		public ICommand ChangeSizeCmd { get; set; }

		public ICommand SaveImageCmd { get; set; }

		public ICommand ToolBarItemCmd { get; set; }

		public PlotModel Model { get; set; }

		public PlotViewModel(PlotView wnd)
		{
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Expected O, but got Unknown
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			//IL_0087: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Expected O, but got Unknown
			//IL_008c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0096: Expected O, but got Unknown
			//IL_0098: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a2: Expected O, but got Unknown
			//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c4: Expected O, but got Unknown
			//IL_00bf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Expected O, but got Unknown
			//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d5: Expected O, but got Unknown
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f7: Expected O, but got Unknown
			//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fc: Expected O, but got Unknown
			//IL_00fe: Unknown result type (might be due to invalid IL or missing references)
			//IL_0108: Expected O, but got Unknown
			//IL_0120: Unknown result type (might be due to invalid IL or missing references)
			//IL_012a: Expected O, but got Unknown
			//IL_0125: Unknown result type (might be due to invalid IL or missing references)
			//IL_012f: Expected O, but got Unknown
			PlotViewModel plotViewModel = this;
			viewWnd = wnd;
			Model = new PlotModel();
			CloseCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(CloseCmd, (ExecutedRoutedEventHandler)delegate
			{
				((Window)wnd).Close();
			}));
			SaveImageCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(SaveImageCmd, (ExecutedRoutedEventHandler)delegate
			{
				//IL_0037: Unknown result type (might be due to invalid IL or missing references)
				//IL_003c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0114: Unknown result type (might be due to invalid IL or missing references)
				//IL_0119: Unknown result type (might be due to invalid IL or missing references)
				bool flag = plotViewModel.CurElement != null && plotViewModel.CurElement.PlType == PlotType.Clip;
				if (flag)
				{
					Rect bound = (plotViewModel.CurElement as PlotShape).GetBound();
					flag = ((Rect)(ref bound)).Width >= 10.0 && ((Rect)(ref bound)).Height >= 10.0;
				}
				bool isClip = flag && plotViewModel.ProcessWithMasker(delegate
				{
					//IL_0000: Unknown result type (might be due to invalid IL or missing references)
					//IL_002a: Unknown result type (might be due to invalid IL or missing references)
					LenovoPopupWindow obj = new OkCancelWindowModel().CreateWindow(HostProxy.Host.HostMainWindowHandle, "K0071", "K0224", "K0208", "K0327", (ImageSource)null);
					new WindowInteropHelper((Window)(object)obj).Owner = HostProxy.Host.HostMainWindowHandle;
					((Window)obj).WindowStartupLocation = (WindowStartupLocation)2;
					((Window)obj).ShowDialog();
					return obj.WindowModel.GetViewModel<OKCancelViewModel>().IsOKResult;
				});
				plotViewModel.Model.NewFile = string.Format("{0}\\{1}.jpg", plotViewModel.Model.TempDir, DateTime.Now.ToString("yyyyMMddHHmmss"));
				HostProxy.ResourcesLoggingService.RegisterFile(plotViewModel.Model.NewFile);
				BitmapSource val = plotViewModel.CreateMemoryImage(isClip);
				using (FileStream fileStream = File.Create(plotViewModel.Model.NewFile))
				{
					((BitmapEncoder)new JpegBitmapEncoder
					{
						Frames = { BitmapFrame.Create(val) }
					}).Save((Stream)fileStream);
					fileStream.Flush();
				}
				((Window)plotViewModel.viewWnd).DialogResult = true;
				plotViewModel.viewWnd = null;
			}));
			ToolBarItemCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(ToolBarItemCmd, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				if (e.Parameter is string text)
				{
					switch (text.Length)
					{
					case 4:
						switch (text[0])
						{
						case 'L':
							if (text == "LINE")
							{
								plotViewModel.Model.Cursor = Cursors.Cross;
								plotViewModel.ElementType = PlotType.Line;
							}
							break;
						case 'R':
							if (text == "RECT")
							{
								plotViewModel.Model.Cursor = Cursors.Cross;
								plotViewModel.ElementType = PlotType.Rect;
							}
							break;
						case 'T':
							if (text == "TEXT")
							{
								plotViewModel.Model.Cursor = Cursors.IBeam;
								plotViewModel.ElementType = PlotType.Text;
							}
							break;
						case 'F':
							if (text == "FONT")
							{
								plotViewModel.SetFontSetting();
							}
							break;
						}
						break;
					case 7:
						if (text == "ELLIPSE")
						{
							plotViewModel.Model.Cursor = Cursors.Cross;
							plotViewModel.ElementType = PlotType.Ellipse;
						}
						break;
					case 3:
						if (text == "CUT")
						{
							plotViewModel.Model.Cursor = Cursors.Cross;
							plotViewModel.ElementType = PlotType.Clip;
						}
						break;
					case 5:
						if (text == "COLOR")
						{
							plotViewModel.SetColorSetting();
						}
						break;
					case 6:
						break;
					}
				}
			}));
			UndoCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(UndoCmd, (ExecutedRoutedEventHandler)delegate
			{
				plotViewModel.viewWnd.DelLatestElement();
				plotViewModel.CurElement = null;
			}));
			ChangeSizeCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(ChangeSizeCmd, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				((Window)wnd).WindowState = (WindowState)(((bool)e.Parameter) ? 2 : 0);
			}));
		}

		private void SetFontSetting()
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0087: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Invalid comparison between Unknown and I4
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			FontDialog val = new FontDialog();
			FontStyle val2 = (FontStyle)0;
			if (Model.Settings.IsItalic && Model.Settings.IsBold)
			{
				val2 = (FontStyle)3;
			}
			else if (Model.Settings.IsItalic)
			{
				val2 = (FontStyle)2;
			}
			else if (Model.Settings.IsBold)
			{
				val2 = (FontStyle)1;
			}
			val.Font = new Font(Model.Settings.FontFamily, (float)Model.Settings.FontSize, val2);
			if ((int)((CommonDialog)val).ShowDialog() == 1)
			{
				Model.Settings.FontFamily = val.Font.Name;
				Model.Settings.FontSize = val.Font.Size;
				Model.Settings.IsBold = val.Font.Bold;
				Model.Settings.IsItalic = val.Font.Italic;
			}
		}

		private void SetColorSetting()
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Invalid comparison between Unknown and I4
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			ColorDialog val = new ColorDialog();
			Color color = Model.Settings.Color;
			byte a = ((Color)(ref color)).A;
			color = Model.Settings.Color;
			byte r = ((Color)(ref color)).R;
			color = Model.Settings.Color;
			byte g = ((Color)(ref color)).G;
			color = Model.Settings.Color;
			val.Color = Color.FromArgb(a, r, g, ((Color)(ref color)).B);
			if ((int)((CommonDialog)val).ShowDialog() == 1)
			{
				Model.Settings.Color = Color.FromArgb(val.Color.A, val.Color.R, val.Color.G, val.Color.B);
			}
		}

		public void OnMouseLeftBtnUp(object sender, MouseButtonEventArgs e)
		{
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			if (CurElement != null)
			{
				CurElement.OnMouseUp(((MouseEventArgs)e).GetPosition((IInputElement)(object)viewWnd.canvas));
			}
		}

		public void OnMouseMove(object sender, MouseEventArgs e)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			if (CurElement != null && (int)e.LeftButton != 0)
			{
				CurElement.OnMouseMove(e.GetPosition((IInputElement)(object)viewWnd.canvas));
			}
		}

		public void OnMouseLeftBtnDown(object sender, MouseButtonEventArgs e)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			Point position = ((MouseEventArgs)e).GetPosition((IInputElement)(object)viewWnd.canvas);
			switch (ElementType)
			{
			case PlotType.Ellipse:
				DrawEllipse(position);
				break;
			case PlotType.Rect:
				DrawRectangle(position);
				break;
			case PlotType.Line:
				DrawLine(position);
				break;
			case PlotType.Text:
				DrawText(position);
				break;
			case PlotType.Clip:
				DrawClip(position);
				break;
			case PlotType.None:
			case PlotType.Arc:
				break;
			}
		}

		private bool IsNeedNewElement(PlotType type, Point pt)
		{
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
			if (CurElement != null && CurElement.IsEditModel && CurElement.PlType == type && CurElement.IsOnAchor())
			{
				CurElement.OnMouseDown(pt);
				return false;
			}
			if (CurElement != null && CurElement.IsEditModel)
			{
				if (!CurElement.IsValidate())
				{
					PlotView plotView = viewWnd;
					IPlotBase curElement = CurElement;
					plotView.DelElement((UIElement)((curElement is UIElement) ? curElement : null));
					CurElement = null;
					return false;
				}
				if (ElementType == PlotType.Clip && CurElement.PlType == PlotType.Clip)
				{
					Rect bound = (CurElement as PlotShape).GetBound();
					if (((Rect)(ref bound)).Width < 10.0 || ((Rect)(ref bound)).Height < 10.0)
					{
						return false;
					}
					if (ProcessWithMasker(delegate
					{
						//IL_0000: Unknown result type (might be due to invalid IL or missing references)
						//IL_002a: Unknown result type (might be due to invalid IL or missing references)
						LenovoPopupWindow obj = new OkCancelWindowModel().CreateWindow(HostProxy.Host.HostMainWindowHandle, "K0071", "K0224", "K0208", "K0327", (ImageSource)null);
						new WindowInteropHelper((Window)(object)obj).Owner = HostProxy.Host.HostMainWindowHandle;
						((Window)obj).WindowStartupLocation = (WindowStartupLocation)2;
						((Window)obj).ShowDialog();
						return obj.WindowModel.GetViewModel<OKCancelViewModel>().IsOKResult;
					}))
					{
						Model.DisplayImage = CreateMemoryImage(isClip: true);
					}
					PlotView plotView2 = viewWnd;
					IPlotBase curElement2 = CurElement;
					plotView2.DelElement((UIElement)((curElement2 is UIElement) ? curElement2 : null));
					CurElement = null;
					return false;
				}
				CurElement.IsEditModel = false;
				CurElement.Achor = AchorType.None;
				return false;
			}
			return true;
		}

		private bool ProcessWithMasker(Func<bool> task)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			string text = Guid.NewGuid().ToString("N");
			try
			{
				HostProxy.HostOperationService.ShowMaskLayer(text, ((Window)viewWnd).WindowState);
				return task();
			}
			finally
			{
				HostProxy.HostOperationService.CloseMaskLayer(text);
			}
		}

		private BitmapSource CreateMemoryImage(bool isClip)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_0147: Unknown result type (might be due to invalid IL or missing references)
			//IL_014c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0152: Expected O, but got Unknown
			//IL_015f: Unknown result type (might be due to invalid IL or missing references)
			Int32Rect clip = Int32Rect.Empty;
			DrawingVisual val = new DrawingVisual();
			DrawingContext val2 = val.RenderOpen();
			try
			{
				val2.DrawImage((ImageSource)(object)Model.DisplayImage, new Rect(0.0, 0.0, ((ImageSource)Model.DisplayImage).Width, ((ImageSource)Model.DisplayImage).Height));
				foreach (IPlotBase child in ((Panel)viewWnd.canvas).Children)
				{
					if (child.PlType != PlotType.Clip)
					{
						child.PlotElement(val2);
						continue;
					}
					Rect bound = (child as PlotShape).GetBound();
					clip = new Int32Rect((int)((Rect)(ref bound)).X, (int)((Rect)(ref bound)).Y, (int)((Rect)(ref bound)).Width, (int)((Rect)(ref bound)).Height);
				}
				val2.Close();
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
			viewWnd.DelAllElement();
			RenderTargetBitmap val3 = new RenderTargetBitmap(Model.DisplayImage.PixelWidth, Model.DisplayImage.PixelHeight, Model.DisplayImage.DpiX, Model.DisplayImage.DpiY, PixelFormats.Pbgra32);
			val3.Render((Visual)(object)val);
			if (!isClip)
			{
				return (BitmapSource)(object)val3;
			}
			return ClipCurrentImage(clip, (BitmapSource)(object)val3);
		}

		private BitmapSource ClipCurrentImage(Int32Rect clip, BitmapSource src)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			PixelFormat format = src.Format;
			int num = ((PixelFormat)(ref format)).BitsPerPixel * ((Int32Rect)(ref clip)).Width / 8;
			byte[] array = new byte[((Int32Rect)(ref clip)).Height * num];
			src.CopyPixels(clip, (Array)array, num, 0);
			src = null;
			return BitmapSource.Create(((Int32Rect)(ref clip)).Width, ((Int32Rect)(ref clip)).Height, 96.0, 96.0, PixelFormats.Pbgra32, (BitmapPalette)null, (Array)array, num);
		}

		private void CreateRectElement(Point pt, PlotType type, Func<FrameworkElement, object> callback)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			if (IsNeedNewElement(type, pt))
			{
				PlotShape plotShape = new PlotShape
				{
					Start = pt,
					OwnerSize = ((UIElement)viewWnd.canvas).RenderSize,
					Number = viewWnd.GetElementCount() + 1,
					IsEditModel = true,
					SetModel = Model.Settings.Clone(),
					Achor = AchorType.Achor5,
					PlType = type
				};
				((ContentControl)plotShape).Content = callback((FrameworkElement)(object)plotShape);
				Canvas.SetLeft((UIElement)(object)plotShape, ((Point)(ref pt)).X);
				Canvas.SetTop((UIElement)(object)plotShape, ((Point)(ref pt)).Y);
				viewWnd.AddElement((UIElement)(object)plotShape);
				CurElement = plotShape;
			}
		}

		private void DrawLine(Point pt)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Expected O, but got Unknown
			if (IsNeedNewElement(PlotType.Line, pt))
			{
				PlotLine plotLine = new PlotLine
				{
					Start = pt,
					OwnerSize = ((UIElement)viewWnd.canvas).RenderSize,
					Number = viewWnd.GetElementCount() + 1,
					IsEditModel = true,
					PlType = PlotType.Line,
					SetModel = Model.Settings,
					Stroke = new SolidColorBrush(Model.Settings.Color),
					StrokeThickness = Model.Settings.LineWeight
				};
				Canvas.SetLeft((UIElement)(object)plotLine, ((Point)(ref pt)).X);
				Canvas.SetTop((UIElement)(object)plotLine, ((Point)(ref pt)).Y);
				viewWnd.AddElement((UIElement)(object)plotLine);
				CurElement = plotLine;
			}
		}

		private void DrawText(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			CreateRectElement(pt, PlotType.Text, delegate(FrameworkElement param)
			{
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0022: Unknown result type (might be due to invalid IL or missing references)
				//IL_002e: Unknown result type (might be due to invalid IL or missing references)
				//IL_0033: Unknown result type (might be due to invalid IL or missing references)
				//IL_003d: Expected O, but got Unknown
				//IL_003d: Unknown result type (might be due to invalid IL or missing references)
				//IL_004e: Unknown result type (might be due to invalid IL or missing references)
				//IL_0058: Expected O, but got Unknown
				//IL_0058: Unknown result type (might be due to invalid IL or missing references)
				//IL_0078: Expected O, but got Unknown
				//IL_0090: Unknown result type (might be due to invalid IL or missing references)
				//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
				//IL_00cc: Unknown result type (might be due to invalid IL or missing references)
				//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
				//IL_00de: Unknown result type (might be due to invalid IL or missing references)
				//IL_00e8: Expected O, but got Unknown
				//IL_00ed: Expected O, but got Unknown
				//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
				//IL_00fe: Unknown result type (might be due to invalid IL or missing references)
				//IL_0105: Unknown result type (might be due to invalid IL or missing references)
				//IL_0110: Unknown result type (might be due to invalid IL or missing references)
				//IL_011a: Expected O, but got Unknown
				//IL_011f: Expected O, but got Unknown
				//IL_015c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0166: Expected O, but got Unknown
				//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
				//IL_0185: Unknown result type (might be due to invalid IL or missing references)
				//IL_018a: Unknown result type (might be due to invalid IL or missing references)
				//IL_0190: Expected O, but got Unknown
				TextBox val = new TextBox
				{
					FontSize = Model.Settings.FontSize,
					Foreground = (Brush)new SolidColorBrush(Model.Settings.Color),
					FontFamily = new FontFamily(Model.Settings.FontFamily)
				};
				object obj = ((FrameworkElement)viewWnd).FindResource((object)"TextBoxStyle");
				((FrameworkElement)val).Style = (Style)((obj is Style) ? obj : null);
				TextBox txt = val;
				if (Model.Settings.IsBold)
				{
					((Control)txt).FontWeight = FontWeights.Bold;
				}
				if (Model.Settings.IsItalic)
				{
					((Control)txt).FontStyle = FontStyles.Italic;
				}
				((FrameworkElement)txt).SetBinding(FrameworkElement.WidthProperty, (BindingBase)new Binding
				{
					Source = param,
					Path = new PropertyPath("ActualWidth", Array.Empty<object>())
				});
				((FrameworkElement)txt).SetBinding(FrameworkElement.HeightProperty, (BindingBase)new Binding
				{
					Source = param,
					Path = new PropertyPath("ActualHeight", Array.Empty<object>())
				});
				FocusManager.SetFocusedElement((DependencyObject)(object)viewWnd, (IInputElement)(object)txt);
				param.Width = 120.0;
				param.Height = 32.0;
				((FrameworkElement)txt).Loaded += (RoutedEventHandler)delegate
				{
					((UIElement)txt).Focus();
				};
				TextBox obj2 = txt;
				RoutedEvent mouseLeftButtonDownEvent = UIElement.MouseLeftButtonDownEvent;
				object obj3 = <>c.<>9__39_2;
				if (obj3 == null)
				{
					MouseButtonEventHandler val2 = delegate(object sender, MouseButtonEventArgs e)
					{
						((RoutedEventArgs)e).Handled = true;
					};
					<>c.<>9__39_2 = val2;
					obj3 = (object)val2;
				}
				((UIElement)obj2).AddHandler(mouseLeftButtonDownEvent, (Delegate)obj3, true);
				return txt;
			});
		}

		private void DrawClip(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			CreateRectElement(pt, PlotType.Clip, (FrameworkElement param) => (object)new Grid
			{
				Background = (Brush)new SolidColorBrush(Color.FromArgb((byte)20, byte.MaxValue, byte.MaxValue, byte.MaxValue))
			});
		}

		private void DrawEllipse(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			CreateRectElement(pt, PlotType.Ellipse, (FrameworkElement param) => (object)new Ellipse
			{
				Stroke = (Brush)new SolidColorBrush(Model.Settings.Color),
				StrokeThickness = Model.Settings.LineWeight
			});
		}

		private void DrawRectangle(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			CreateRectElement(pt, PlotType.Rect, (FrameworkElement param) => (object)new Rectangle
			{
				Stroke = (Brush)new SolidColorBrush(Model.Settings.Color),
				StrokeThickness = Model.Settings.LineWeight
			});
		}
	}
	public class GifMakerViewModel : ViewModelBase
	{
		private GifMakerView wnd;

		public static ICommand ImagePlotCmd = (ICommand)new RoutedCommand();

		public static ICommand AddImgCmd = (ICommand)new RoutedCommand();

		public static ICommand DelImgCmd = (ICommand)new RoutedCommand();

		public ObservableCollection<ImageEntitiy> ImageArr { get; set; }

		public ICommand CloseCmd { get; set; }

		public ICommand AddDelayCmd { get; set; }

		public ICommand DelDelayCmd { get; set; }

		public ICommand SelDirPathCmd { get; set; }

		public ICommand PlayerCmd { get; set; }

		public ICommand CreateGifCmd { get; set; }

		public GifMakerModel Model { get; set; }

		public GifMakerViewModel(GifMakerView view)
		{
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Expected O, but got Unknown
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Expected O, but got Unknown
			//IL_0089: Unknown result type (might be due to invalid IL or missing references)
			//IL_0093: Expected O, but got Unknown
			//IL_008e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Expected O, but got Unknown
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Expected O, but got Unknown
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Expected O, but got Unknown
			//IL_00c1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cb: Expected O, but got Unknown
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d7: Expected O, but got Unknown
			//IL_00ef: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f9: Expected O, but got Unknown
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fe: Expected O, but got Unknown
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			//IL_010a: Expected O, but got Unknown
			//IL_0122: Unknown result type (might be due to invalid IL or missing references)
			//IL_012c: Expected O, but got Unknown
			//IL_0127: Unknown result type (might be due to invalid IL or missing references)
			//IL_0131: Expected O, but got Unknown
			//IL_0133: Unknown result type (might be due to invalid IL or missing references)
			//IL_013d: Expected O, but got Unknown
			//IL_0155: Unknown result type (might be due to invalid IL or missing references)
			//IL_015f: Expected O, but got Unknown
			//IL_015a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0164: Expected O, but got Unknown
			//IL_0166: Unknown result type (might be due to invalid IL or missing references)
			//IL_0170: Expected O, but got Unknown
			//IL_0188: Unknown result type (might be due to invalid IL or missing references)
			//IL_0192: Expected O, but got Unknown
			//IL_018d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0197: Expected O, but got Unknown
			//IL_01af: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b9: Expected O, but got Unknown
			//IL_01b4: Unknown result type (might be due to invalid IL or missing references)
			//IL_01be: Expected O, but got Unknown
			wnd = view;
			Model = new GifMakerModel();
			CloseCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(CloseCmd, (ExecutedRoutedEventHandler)delegate
			{
				ImageArr.Clear();
				Model.GifImage = null;
				((Window)wnd).Close();
				wnd = null;
				GC.Collect();
			}));
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(AddImgCmd, (ExecutedRoutedEventHandler)delegate
			{
				//IL_000e: Unknown result type (might be due to invalid IL or missing references)
				//IL_0018: Expected O, but got Unknown
				OpenFileDialog dlg = new OpenFileDialog();
				((FileDialog)dlg).Filter = "Image|*.jpg;*.jpeg;*.png;*.bmp";
				dlg.Multiselect = true;
				if (((CommonDialog)dlg).ShowDialog() == true)
				{
					Task.Factory.StartNew(delegate
					{
						string[] fileNames = ((FileDialog)dlg).FileNames;
						foreach (string filePath in fileNames)
						{
							ImageEntitiy entity = new ImageEntitiy
							{
								IsImage = true,
								FilePath = filePath,
								Index = Guid.NewGuid().ToString()
							};
							if (entity.BitmapImage != null)
							{
								((DispatcherObject)wnd).Dispatcher.BeginInvoke((Delegate)(Action)delegate
								{
									ImageArr.Insert(ImageArr.Count - 1, entity);
								}, Array.Empty<object>());
							}
						}
					});
				}
			}));
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(DelImgCmd, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				ImageEntitiy imageEntitiy = ImageArr.FirstOrDefault((ImageEntitiy p) => p.Index == (string)e.Parameter);
				imageEntitiy.BitmapImage = null;
				ImageArr.Remove(imageEntitiy);
			}));
			AddDelayCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(AddDelayCmd, (ExecutedRoutedEventHandler)delegate
			{
				if (Model.GifDelay < 30)
				{
					GifMakerModel model = Model;
					int gifDelay = model.GifDelay + 1;
					model.GifDelay = gifDelay;
				}
			}));
			DelDelayCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(DelDelayCmd, (ExecutedRoutedEventHandler)delegate
			{
				if (Model.GifDelay > 1)
				{
					GifMakerModel model = Model;
					int gifDelay = model.GifDelay - 1;
					model.GifDelay = gifDelay;
				}
			}));
			SelDirPathCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(SelDirPathCmd, (ExecutedRoutedEventHandler)delegate
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Expected O, but got Unknown
				//IL_0021: Unknown result type (might be due to invalid IL or missing references)
				//IL_0026: Invalid comparison between I4 and Unknown
				FolderBrowserDialog val = new FolderBrowserDialog();
				val.SelectedPath = Model.GifPath;
				val.ShowNewFolderButton = true;
				if (1 == (int)FolderBrowserLauncher.ShowFolderBrowser(val))
				{
					Model.GifPath = val.SelectedPath;
				}
			}));
			PlayerCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(PlayerCmd, (ExecutedRoutedEventHandler)delegate
			{
				if (Model.IsAnimation)
				{
					if (ImageArr.Count > 1)
					{
						int num = 0;
						int num2 = 0;
						if (Model.GifWidth > Model.GifHeight && Model.GifWidth > 200)
						{
							num = 200;
							num2 = 200 * Model.GifHeight / Model.GifWidth;
						}
						else if (Model.GifHeight > Model.GifWidth && Model.GifHeight > 200)
						{
							num2 = 200;
							num = 200 * Model.GifWidth / Model.GifHeight;
						}
						else
						{
							num = Model.GifWidth;
							num2 = Model.GifHeight;
						}
						if (Model.IsChanged)
						{
							Model.IsChanged = false;
							Model.GifImage = null;
							ImageToGif(Model.GifFile, num, num2);
						}
						else
						{
							wnd.ResumeAnimation();
						}
						Model.IsGifMakeOk = true;
					}
				}
				else
				{
					Model.IsGifMakeOk = false;
					wnd.StopAnimation();
				}
			}));
			CreateGifCmd = (ICommand)new RoutedCommand();
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(CreateGifCmd, (ExecutedRoutedEventHandler)delegate
			{
				//IL_0021: Unknown result type (might be due to invalid IL or missing references)
				//IL_0027: Expected O, but got Unknown
				//IL_0057: Unknown result type (might be due to invalid IL or missing references)
				//IL_005c: Invalid comparison between I4 and Unknown
				if (ImageArr.Count > 1)
				{
					if (!GlobalFun.Exists(Model.GifPath))
					{
						FolderBrowserDialog val = new FolderBrowserDialog();
						val.Description = HostProxy.LanguageService.Translate("Please select a new save path");
						val.SelectedPath = Model.GifPath;
						val.ShowNewFolderButton = true;
						if (1 != (int)FolderBrowserLauncher.ShowFolderBrowser(val))
						{
							return;
						}
						Model.GifPath = val.SelectedPath;
					}
					HostProxy.BehaviorService.Collect((BusinessType)2210, (BusinessData)null);
					string giffile = Path.Combine(Model.GifPath, DateTime.Now.ToString("yyyyMMddHHmmss") + ".gif");
					ImageToGif(giffile, Model.GifWidth, Model.GifHeight);
				}
			}));
			((UIElement)wnd).CommandBindings.Add(new CommandBinding(ImagePlotCmd, (ExecutedRoutedEventHandler)delegate(object sender, ExecutedRoutedEventArgs e)
			{
				//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
				string index = (string)e.Parameter;
				ImageEntitiy imageEntitiy = ImageArr.FirstOrDefault((ImageEntitiy p) => p.Index == index);
				BitmapImage displayImage = LoadImage(imageEntitiy.FilePath);
				PlotView plotView = new PlotView();
				((Window)plotView).Title = LangTranslation.Translate("K0200");
				plotView.ViewModel.Model.DisplayImage = (BitmapSource)(object)displayImage;
				plotView.ViewModel.Model.TempDir = Model.TempDir;
				((Window)plotView).ShowInTaskbar = false;
				((Window)plotView).WindowStartupLocation = (WindowStartupLocation)2;
				string text = Guid.NewGuid().ToString("N");
				IntPtr owner = HostProxy.HostOperationService.ShowMaskLayer(text, (WindowState)0);
				new WindowInteropHelper((Window)(object)plotView).Owner = owner;
				if (((Window)plotView).ShowDialog() == true)
				{
					Model.IsAnimation = false;
					Model.IsChanged = true;
					imageEntitiy.FilePath = plotView.ViewModel.Model.NewFile;
				}
				plotView.ViewModel.Model = null;
				plotView.ViewModel = null;
				HostProxy.HostOperationService.CloseMaskLayer(text);
			}));
			ImageArr = new ObservableCollection<ImageEntitiy>();
			ImageArr.Add(new ImageEntitiy
			{
				IsImage = false,
				FilePath = string.Empty,
				Index = Guid.NewGuid().ToString()
			});
			ImageArr.CollectionChanged += delegate(object sender, NotifyCollectionChangedEventArgs e)
			{
				if (e.Action == NotifyCollectionChangedAction.Add || e.Action == NotifyCollectionChangedAction.Remove)
				{
					Model.IsChanged = true;
					Model.IsAnimation = false;
				}
			};
			((NotifyBase)Model).PropertyChanged += delegate(object sender, PropertyChangedEventArgs e)
			{
				if (e.PropertyName == "IsAnimation" && !Model.IsAnimation)
				{
					wnd.StopAnimation();
				}
			};
		}

		private void ImageToGif(string giffile, int width, int height, bool repeat = true)
		{
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			ProgressView prg = new ProgressView();
			Task.Factory.StartNew(delegate
			{
				GifEncoder gifEncoder = new GifEncoder();
				gifEncoder.Start(giffile);
				gifEncoder.SetDelay(1000 / Model.GifDelay);
				gifEncoder.SetRepeat((!repeat) ? (-1) : 0);
				int num = 0;
				int num2 = ImageArr.Count - 1;
				foreach (ImageEntitiy item in ImageArr)
				{
					if (item.IsImage)
					{
						gifEncoder.AddFrame(Image.FromFile(item.FilePath).ScaleToFit(new Size(width, height), dispose: true, ScalingMode.Overflow));
						prg.Model.Percentage = ++num * 100 / num2;
					}
				}
				gifEncoder.Finish();
				Thread.Sleep(500);
				((DispatcherObject)prg).Dispatcher.Invoke((Action)delegate
				{
					((Window)prg).Close();
				});
				Model.LoadBitmap();
			});
			string text = Guid.NewGuid().ToString("N");
			IntPtr owner = HostProxy.HostOperationService.ShowMaskLayer(text, (WindowState)0);
			new WindowInteropHelper((Window)(object)prg).Owner = owner;
			((Window)prg).WindowStartupLocation = (WindowStartupLocation)2;
			((Window)prg).ShowDialog();
			HostProxy.HostOperationService.CloseMaskLayer(text);
		}

		public BitmapImage LoadImage(string file)
		{
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			if (string.IsNullOrEmpty(file) || !File.Exists(file))
			{
				return null;
			}
			try
			{
				Image obj = Image.FromFile(file);
				double num = obj.Width;
				double num2 = obj.Height;
				obj.Dispose();
				BitmapImage val = new BitmapImage();
				val.BeginInit();
				if (num > 1366.0 || num2 > 768.0)
				{
					if (num2 / num > 0.0)
					{
						val.DecodePixelHeight = 768;
					}
					else
					{
						val.DecodePixelWidth = 1366;
					}
				}
				val.CacheOption = (BitmapCacheOption)1;
				val.UriSource = new Uri(file);
				val.EndInit();
				((Freezable)val).Freeze();
				return val;
			}
			catch (Exception)
			{
				return null;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.GifMaker.Model
{
	public class PlotModel : ViewModelBase
	{
		private double _Zoom;

		private double _Scale;

		private BitmapSource _DisplayImage;

		private Cursor _Cursor;

		public double Zoom
		{
			get
			{
				return _Zoom;
			}
			set
			{
				_Zoom = value;
				Scale = _Zoom / 100.0;
				((NotifyBase)this).OnPropertyChanged("Zoom");
			}
		}

		public double Scale
		{
			get
			{
				return _Scale;
			}
			set
			{
				_Scale = value;
				((NotifyBase)this).OnPropertyChanged("Scale");
			}
		}

		public BitmapSource DisplayImage
		{
			get
			{
				return _DisplayImage;
			}
			set
			{
				_DisplayImage = value;
				((NotifyBase)this).OnPropertyChanged("DisplayImage");
			}
		}

		public Cursor Cursor
		{
			get
			{
				return _Cursor;
			}
			set
			{
				if (Cursor != value)
				{
					_Cursor = value;
					((NotifyBase)this).OnPropertyChanged("Cursor");
				}
			}
		}

		public string NewFile { get; set; }

		public string TempDir { get; set; }

		public PlotSetModel Settings { get; set; }

		public List<double> ZoomArr { get; set; }

		public List<double> LineArr { get; set; }

		public PlotModel()
		{
			Zoom = 100.0;
			Scale = 1.0;
			ZoomArr = new List<double>
			{
				10.0, 20.0, 30.0, 40.0, 50.0, 75.0, 100.0, 110.0, 120.0, 130.0,
				140.0, 150.0, 200.0, 300.0, 400.0, 500.0
			};
			LineArr = new List<double> { 1.0, 3.0, 5.0, 8.0 };
			Cursor = Cursors.Arrow;
			Settings = new PlotSetModel();
		}
	}
	public class ProgressModel : ViewModelBase
	{
		private double _Percentage;

		private string _Information;

		public double Percentage
		{
			get
			{
				return _Percentage;
			}
			set
			{
				_Percentage = value;
				((NotifyBase)this).OnPropertyChanged("Percentage");
			}
		}

		public string Information
		{
			get
			{
				return _Information;
			}
			set
			{
				_Information = value;
				((NotifyBase)this).OnPropertyChanged("Information");
			}
		}

		public ICommand CloseCmd { get; set; }
	}
	public class GifMakerModel : ViewModelBase
	{
		private int _delay;

		private int _GifHeight;

		private int _GifWidth;

		private string _GifPath;

		private bool _IsAnimation;

		private bool _IsGifMakeOk;

		private BitmapImage _GifImage;

		public int GifDelay
		{
			get
			{
				return _delay;
			}
			set
			{
				if (_delay != value)
				{
					_delay = value;
					IsAnimation = false;
					IsChanged = true;
					((NotifyBase)this).OnPropertyChanged("GifDelay");
				}
			}
		}

		public int GifHeight
		{
			get
			{
				return _GifHeight;
			}
			set
			{
				if (_GifHeight != value)
				{
					_GifHeight = value;
					IsAnimation = false;
					IsChanged = true;
					((NotifyBase)this).OnPropertyChanged("GifHeight");
				}
			}
		}

		public int GifWidth
		{
			get
			{
				return _GifWidth;
			}
			set
			{
				if (_GifWidth != value)
				{
					_GifWidth = value;
					IsAnimation = false;
					IsChanged = true;
					((NotifyBase)this).OnPropertyChanged("GifWidth");
				}
			}
		}

		public string GifPath
		{
			get
			{
				return _GifPath;
			}
			set
			{
				_GifPath = value;
				IsAnimation = false;
				((NotifyBase)this).OnPropertyChanged("GifPath");
				Configurations.GifSavePath = _GifPath;
			}
		}

		public bool IsAnimation
		{
			get
			{
				return _IsAnimation;
			}
			set
			{
				if (_IsAnimation != value)
				{
					_IsAnimation = value;
					if (!_IsAnimation)
					{
						IsGifMakeOk = false;
					}
					((NotifyBase)this).OnPropertyChanged("IsAnimation");
				}
			}
		}

		public bool IsGifMakeOk
		{
			get
			{
				return _IsGifMakeOk;
			}
			set
			{
				if (_IsGifMakeOk != value)
				{
					_IsGifMakeOk = value;
					((NotifyBase)this).OnPropertyChanged("IsGifMakeOk");
				}
			}
		}

		public bool IsChanged { get; set; }

		public string TempDir { get; private set; }

		public string GifFile { get; private set; }

		public BitmapImage GifImage
		{
			get
			{
				return _GifImage;
			}
			set
			{
				_GifImage = value;
				((NotifyBase)this).OnPropertyChanged("GifImage");
			}
		}

		public GifMakerModel()
		{
			GifImage = null;
			IsChanged = false;
			GifDelay = 4;
			GifHeight = 200;
			GifWidth = 200;
			IsGifMakeOk = false;
			IsAnimation = false;
			TempDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Temp");
			GifPath = Configurations.GifSavePath;
			GifFile = Path.Combine(TempDir, "temp.gif");
		}

		public void LoadBitmap()
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Expected O, but got Unknown
			if (File.Exists(GifFile))
			{
				BitmapImage val = new BitmapImage();
				val.BeginInit();
				val.CacheOption = (BitmapCacheOption)1;
				val.StreamSource = File.Open(GifFile, FileMode.Open);
				val.EndInit();
				((Freezable)val).Freeze();
				GifImage = val;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.GifMaker.Gif.Encode
{
	public static class ColorExtensions
	{
		public static bool EqualsColor(this UnsafeBitmapContext.Pixel pixel, Color color)
		{
			if (color.A != 0 || pixel.Alpha != 0)
			{
				if (color.A == pixel.Alpha && color.R == pixel.Red && color.G == pixel.Green)
				{
					return color.B == pixel.Blue;
				}
				return false;
			}
			return true;
		}

		public static bool EqualsPixel(this Color color, UnsafeBitmapContext.Pixel pixel)
		{
			return pixel.EqualsColor(color);
		}

		public static Color FadeTo(this Color from, Color to, float fade)
		{
			return Color.FromArgb((int)Math.Min(255f, Math.Max(0f, (float)(int)from.A + (float)(to.A - from.A) * fade)), (int)Math.Min(255f, Math.Max(0f, (float)(int)from.R + (float)(to.R - from.R) * fade)), (int)Math.Min(255f, Math.Max(0f, (float)(int)from.G + (float)(to.G - from.G) * fade)), (int)Math.Min(255f, Math.Max(0f, (float)(int)from.B + (float)(to.B - from.B) * fade)));
		}
	}
	public class GifEncoder
	{
		protected int width;

		protected int height;

		protected Color transparent = Color.Empty;

		protected int transIndex;

		protected int repeat = -1;

		protected int delay;

		protected bool started;

		protected FileStream fs;

		protected Image image;

		protected byte[] pixels;

		protected byte[] indexedPixels;

		protected int colorDepth;

		protected byte[] colorTab;

		protected bool[] usedEntry = new bool[256];

		protected int palSize = 7;

		protected int dispose = -1;

		protected bool closeStream;

		protected bool firstFrame = true;

		protected bool sizeSet;

		protected int sample = 10;

		public void SetDelay(int ms)
		{
			delay = (int)Math.Round((float)ms / 10f);
		}

		public void SetDispose(int code)
		{
			if (code >= 0)
			{
				dispose = code;
			}
		}

		public void SetRepeat(int iter)
		{
			if (iter >= 0)
			{
				repeat = iter;
			}
		}

		public void SetTransparent(Color c)
		{
			transparent = c;
		}

		public bool AddFrame(Image im)
		{
			if (im == null || !started)
			{
				return false;
			}
			bool result = true;
			try
			{
				if (!sizeSet)
				{
					SetSize(im.Width, im.Height);
				}
				image = im;
				GetImagePixels();
				AnalyzePixels();
				if (firstFrame)
				{
					WriteLSD();
					WritePalette();
					if (repeat >= 0)
					{
						WriteNetscapeExt();
					}
				}
				WriteGraphicCtrlExt();
				WriteImageDesc();
				if (!firstFrame)
				{
					WritePalette();
				}
				WritePixels();
				firstFrame = false;
			}
			catch
			{
				result = false;
			}
			return result;
		}

		public bool Finish()
		{
			if (!started)
			{
				return false;
			}
			bool result = true;
			started = false;
			try
			{
				fs.WriteByte(59);
				fs.Flush();
				if (closeStream)
				{
					fs.Close();
				}
			}
			catch
			{
				result = false;
			}
			transIndex = 0;
			fs = null;
			image = null;
			pixels = null;
			indexedPixels = null;
			colorTab = null;
			closeStream = false;
			firstFrame = true;
			return result;
		}

		public void SetFrameRate(float fps)
		{
			if (fps != 0f)
			{
				delay = (int)Math.Round(100f / fps);
			}
		}

		public void SetQuality(int quality)
		{
			if (quality < 1)
			{
				quality = 1;
			}
			sample = quality;
		}

		public void SetSize(int w, int h)
		{
			if (!started || firstFrame)
			{
				width = w;
				height = h;
				if (width < 1)
				{
					width = 320;
				}
				if (height < 1)
				{
					height = 240;
				}
				sizeSet = true;
			}
		}

		public bool Start(FileStream os)
		{
			if (os == null)
			{
				return false;
			}
			bool flag = true;
			closeStream = false;
			fs = os;
			try
			{
				WriteString("GIF89a");
			}
			catch
			{
				flag = false;
			}
			return started = flag;
		}

		public bool Start(string file)
		{
			bool flag = true;
			try
			{
				if (File.Exists(file))
				{
					File.Delete(file);
				}
				fs = new FileStream(file, FileMode.Create, FileAccess.Write, FileShare.None);
				flag = Start(fs);
				closeStream = true;
			}
			catch
			{
				flag = false;
			}
			return started = flag;
		}

		protected void AnalyzePixels()
		{
			int num = pixels.Length;
			int num2 = num / 3;
			indexedPixels = new byte[num2];
			NeuQuant neuQuant = new NeuQuant(pixels, num, sample);
			colorTab = neuQuant.Process();
			int num3 = 0;
			for (int i = 0; i < num2; i++)
			{
				int num4 = neuQuant.Map(pixels[num3++] & 0xFF, pixels[num3++] & 0xFF, pixels[num3++] & 0xFF);
				usedEntry[num4] = true;
				indexedPixels[i] = (byte)num4;
			}
			pixels = null;
			colorDepth = 8;
			palSize = 7;
			if (transparent != Color.Empty)
			{
				transIndex = FindClosest(transparent);
			}
		}

		protected int FindClosest(Color c)
		{
			if (colorTab == null)
			{
				return -1;
			}
			int r = c.R;
			int g = c.G;
			int b = c.B;
			int result = 0;
			int num = 16777216;
			int num2 = colorTab.Length;
			for (int i = 0; i < num2; i++)
			{
				int num3 = r - (colorTab[i++] & 0xFF);
				int num4 = g - (colorTab[i++] & 0xFF);
				int num5 = b - (colorTab[i] & 0xFF);
				int num6 = num3 * num3 + num4 * num4 + num5 * num5;
				int num7 = i / 3;
				if (usedEntry[num7] && num6 < num)
				{
					num = num6;
					result = num7;
				}
			}
			return result;
		}

		protected void GetImagePixels()
		{
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_008c: Expected O, but got Unknown
			int num = image.Width;
			int num2 = image.Height;
			if (num != width || num2 != height)
			{
				Image val = (Image)new Bitmap(width, height);
				Graphics obj = Graphics.FromImage(val);
				obj.DrawImage(image, 0, 0);
				image = val;
				obj.Dispose();
			}
			pixels = new byte[3 * image.Width * image.Height];
			int num3 = 0;
			Bitmap val2 = new Bitmap(image);
			for (int i = 0; i < image.Height; i++)
			{
				for (int j = 0; j < image.Width; j++)
				{
					Color pixel = val2.GetPixel(j, i);
					pixels[num3] = pixel.R;
					num3++;
					pixels[num3] = pixel.G;
					num3++;
					pixels[num3] = pixel.B;
					num3++;
				}
			}
		}

		protected void WriteGraphicCtrlExt()
		{
			fs.WriteByte(33);
			fs.WriteByte(249);
			fs.WriteByte(4);
			int num;
			int num2;
			if (transparent == Color.Empty)
			{
				num = 0;
				num2 = 0;
			}
			else
			{
				num = 1;
				num2 = 2;
			}
			if (dispose >= 0)
			{
				num2 = dispose & 7;
			}
			num2 <<= 2;
			fs.WriteByte(Convert.ToByte(0 | num2 | 0 | num));
			WriteShort(delay);
			fs.WriteByte(Convert.ToByte(transIndex));
			fs.WriteByte(0);
		}

		protected void WriteImageDesc()
		{
			fs.WriteByte(44);
			WriteShort(0);
			WriteShort(0);
			WriteShort(width);
			WriteShort(height);
			if (firstFrame)
			{
				fs.WriteByte(0);
			}
			else
			{
				fs.WriteByte(Convert.ToByte(0x80 | palSize));
			}
		}

		protected void WriteLSD()
		{
			WriteShort(width);
			WriteShort(height);
			fs.WriteByte(Convert.ToByte(0xF0 | palSize));
			fs.WriteByte(0);
			fs.WriteByte(0);
		}

		protected void WriteNetscapeExt()
		{
			fs.WriteByte(33);
			fs.WriteByte(byte.MaxValue);
			fs.WriteByte(11);
			WriteString("NETSCAPE2.0");
			fs.WriteByte(3);
			fs.WriteByte(1);
			WriteShort(repeat);
			fs.WriteByte(0);
		}

		protected void WritePalette()
		{
			fs.Write(colorTab, 0, colorTab.Length);
			int num = 768 - colorTab.Length;
			for (int i = 0; i < num; i++)
			{
				fs.WriteByte(0);
			}
		}

		protected void WritePixels()
		{
			new LZWEncoder(width, height, indexedPixels, colorDepth).Encode(fs);
		}

		protected void WriteShort(int value)
		{
			fs.WriteByte(Convert.ToByte(value & 0xFF));
			fs.WriteByte(Convert.ToByte((value >> 8) & 0xFF));
		}

		protected void WriteString(string s)
		{
			char[] array = s.ToCharArray();
			for (int i = 0; i < array.Length; i++)
			{
				fs.WriteByte((byte)array[i]);
			}
		}
	}
	public static class ImageExtensions
	{
		public static UnsafeBitmapContext CreateUnsafeContext(this Image image)
		{
			return new UnsafeBitmapContext(image);
		}

		public static Rectangle DetectPadding(this Image image, Color backgroundColor = default(Color))
		{
			if (backgroundColor.IsEmpty)
			{
				backgroundColor = Color.Transparent;
			}
			int num = image.Height;
			int num2 = 0;
			int num3 = image.Width;
			int num4 = 0;
			int num5 = image.Width - 1;
			int num6 = image.Height - 1;
			using (UnsafeBitmapContext unsafeBitmapContext = new UnsafeBitmapContext(image))
			{
				for (int i = 0; i < unsafeBitmapContext.Height; i++)
				{
					for (int j = 0; j < unsafeBitmapContext.Width && (num5 - num4 > j || num3 > j || num6 - num2 > i); j++)
					{
						if (j < num3 && !unsafeBitmapContext.GetRawPixel(j, i).EqualsColor(backgroundColor))
						{
							if (i < num)
							{
								num = i;
							}
							num3 = j;
						}
						if (j < num5 - num4 && !unsafeBitmapContext.GetRawPixel(num5 - j, i).EqualsColor(backgroundColor))
						{
							if (i < num)
							{
								num = i;
							}
							num4 = num5 - j;
						}
						if (i < num6 - num2 && !unsafeBitmapContext.GetRawPixel(j, num6 - i).EqualsColor(backgroundColor))
						{
							num2 = num6 - i;
						}
					}
				}
			}
			num5 = Math.Max(0, num4 - num3);
			num6 = Math.Max(0, num2 - num);
			return new Rectangle(num3, num, num5, num6);
		}

		public static Image ScaleToFit(this Image image, Size size, ScalingMode mode = ScalingMode.FitContent)
		{
			return image.ScaleToFit(size, default(Color), dispose: true, mode);
		}

		public static Image ScaleToFit(this Image image, Size size, Color backgroundColor, ScalingMode mode = ScalingMode.FitContent)
		{
			return image.ScaleToFit(size, backgroundColor, dispose: true, mode);
		}

		public static Image ScaleToFit(this Image image, Size size, bool dispose, ScalingMode mode = ScalingMode.FitContent)
		{
			return image.ScaleToFit(size, default(Color), dispose, mode);
		}

		public static Image ScaleToFit(this Image image, Size size, Color backgroundColor, bool dispose = true, ScalingMode mode = ScalingMode.FitContent)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Expected O, but got Unknown
			Bitmap val = new Bitmap(size.Width, size.Height);
			Graphics val2 = Graphics.FromImage((Image)(object)val);
			try
			{
				if (!backgroundColor.IsEmpty)
				{
					val2.Clear(backgroundColor);
				}
				val2.DrawImage(image, new Rectangle(0, 0, size.Width, size.Height), new Rectangle(0, 0, image.Width, image.Height), (GraphicsUnit)2);
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
			if (dispose)
			{
				image.Dispose();
			}
			return (Image)(object)val;
		}

		public static Image Stretch(this Image image, Size size, bool dispose = true)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Expected O, but got Unknown
			Bitmap val = new Bitmap(size.Width, size.Height);
			Graphics val2 = Graphics.FromImage((Image)(object)val);
			try
			{
				val2.DrawImage(image, 0, 0, size.Width, size.Height);
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
			if (dispose)
			{
				image.Dispose();
			}
			return (Image)(object)val;
		}

		public static Image Rotate(this Image image, double angle, ScalingMode mode = ScalingMode.Overflow)
		{
			return image.Rotate(angle, dispose: true, mode);
		}

		public static Image Rotate(this Image image, double angle, bool dispose, ScalingMode mode = ScalingMode.Overflow)
		{
			//IL_0117: Unknown result type (might be due to invalid IL or missing references)
			//IL_011d: Expected O, but got Unknown
			int num = image.Width;
			int num2 = image.Height;
			if (mode == ScalingMode.FitContent)
			{
				double num3 = angle % 180.0;
				double num4 = Math.Sqrt(Math.Pow(image.Width, 2.0) + Math.Pow(image.Height, 2.0));
				num2 = (int)(Math.Sin((Math.Atan((double)image.Height / (double)image.Width) * 180.0 / Math.PI + ((num3 > 90.0) ? (180.0 - num3) : num3)) * Math.PI / 180.0) * num4);
				num = (int)(Math.Cos((Math.Atan((double)(-image.Height) / (double)image.Width) * 180.0 / Math.PI + ((num3 > 90.0) ? (180.0 - num3) : num3)) * Math.PI / 180.0) * num4);
			}
			Bitmap val = new Bitmap(num, num2);
			Graphics val2 = Graphics.FromImage((Image)(object)val);
			try
			{
				val2.TranslateTransform((float)(-image.Width) / 2f, (float)(-image.Height) / 2f, (MatrixOrder)0);
				val2.RotateTransform((float)angle, (MatrixOrder)1);
				val2.TranslateTransform((float)((Image)val).Width / 2f, (float)((Image)val).Height / 2f, (MatrixOrder)1);
				val2.DrawImage(image, 0, 0);
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
			if (dispose)
			{
				image.Dispose();
			}
			return (Image)(object)val;
		}
	}
	public enum ScalingMode
	{
		FitContent,
		Overflow
	}
	public class LZWEncoder
	{
		private static readonly int EOF = -1;

		private int imgW;

		private int imgH;

		private byte[] pixAry;

		private int initCodeSize;

		private int remaining;

		private int curPixel;

		private static readonly int BITS = 12;

		private static readonly int HSIZE = 5003;

		private int n_bits;

		private int maxbits = BITS;

		private int maxcode;

		private int maxmaxcode = 1 << BITS;

		private int[] htab = new int[HSIZE];

		private int[] codetab = new int[HSIZE];

		private int hsize = HSIZE;

		private int free_ent;

		private bool clear_flg;

		private int g_init_bits;

		private int ClearCode;

		private int EOFCode;

		private int cur_accum;

		private int cur_bits;

		private int[] masks = new int[17]
		{
			0, 1, 3, 7, 15, 31, 63, 127, 255, 511,
			1023, 2047, 4095, 8191, 16383, 32767, 65535
		};

		private int a_count;

		private byte[] accum = new byte[256];

		public LZWEncoder(int width, int height, byte[] pixels, int color_depth)
		{
			imgW = width;
			imgH = height;
			pixAry = pixels;
			initCodeSize = Math.Max(2, color_depth);
		}

		private void Add(byte c, Stream outs)
		{
			accum[a_count++] = c;
			if (a_count >= 254)
			{
				Flush(outs);
			}
		}

		private void ClearTable(Stream outs)
		{
			ResetCodeTable(hsize);
			free_ent = ClearCode + 2;
			clear_flg = true;
			Output(ClearCode, outs);
		}

		private void ResetCodeTable(int hsize)
		{
			for (int i = 0; i < hsize; i++)
			{
				htab[i] = -1;
			}
		}

		private void Compress(int init_bits, Stream outs)
		{
			g_init_bits = init_bits;
			clear_flg = false;
			n_bits = g_init_bits;
			maxcode = MaxCode(n_bits);
			ClearCode = 1 << init_bits - 1;
			EOFCode = ClearCode + 1;
			free_ent = ClearCode + 2;
			a_count = 0;
			int num = NextPixel();
			int num2 = 0;
			for (int num3 = hsize; num3 < 65536; num3 *= 2)
			{
				num2++;
			}
			num2 = 8 - num2;
			int num4 = hsize;
			ResetCodeTable(num4);
			Output(ClearCode, outs);
			int num5;
			while ((num5 = NextPixel()) != EOF)
			{
				int num3 = (num5 << maxbits) + num;
				int num6 = (num5 << num2) ^ num;
				if (htab[num6] == num3)
				{
					num = codetab[num6];
					continue;
				}
				if (htab[num6] >= 0)
				{
					int num7 = num4 - num6;
					if (num6 == 0)
					{
						num7 = 1;
					}
					while (true)
					{
						if ((num6 -= num7) < 0)
						{
							num6 += num4;
						}
						if (htab[num6] == num3)
						{
							break;
						}
						if (htab[num6] >= 0)
						{
							continue;
						}
						goto IL_0121;
					}
					num = codetab[num6];
					continue;
				}
				goto IL_0121;
				IL_0121:
				Output(num, outs);
				num = num5;
				if (free_ent < maxmaxcode)
				{
					codetab[num6] = free_ent++;
					htab[num6] = num3;
				}
				else
				{
					ClearTable(outs);
				}
			}
			Output(num, outs);
			Output(EOFCode, outs);
		}

		public void Encode(Stream os)
		{
			os.WriteByte(Convert.ToByte(initCodeSize));
			remaining = imgW * imgH;
			curPixel = 0;
			Compress(initCodeSize + 1, os);
			os.WriteByte(0);
		}

		private void Flush(Stream outs)
		{
			if (a_count > 0)
			{
				outs.WriteByte(Convert.ToByte(a_count));
				outs.Write(accum, 0, a_count);
				a_count = 0;
			}
		}

		private int MaxCode(int n_bits)
		{
			return (1 << n_bits) - 1;
		}

		private int NextPixel()
		{
			if (remaining == 0)
			{
				return EOF;
			}
			remaining--;
			if (curPixel + 1 < pixAry.GetUpperBound(0))
			{
				return pixAry[curPixel++] & 0xFF;
			}
			return 255;
		}

		private void Output(int code, Stream outs)
		{
			cur_accum &= masks[cur_bits];
			if (cur_bits > 0)
			{
				cur_accum |= code << cur_bits;
			}
			else
			{
				cur_accum = code;
			}
			cur_bits += n_bits;
			while (cur_bits >= 8)
			{
				Add((byte)(cur_accum & 0xFF), outs);
				cur_accum >>= 8;
				cur_bits -= 8;
			}
			if (free_ent > maxcode || clear_flg)
			{
				if (clear_flg)
				{
					maxcode = MaxCode(n_bits = g_init_bits);
					clear_flg = false;
				}
				else
				{
					n_bits++;
					if (n_bits == maxbits)
					{
						maxcode = maxmaxcode;
					}
					else
					{
						maxcode = MaxCode(n_bits);
					}
				}
			}
			if (code == EOFCode)
			{
				while (cur_bits > 0)
				{
					Add((byte)(cur_accum & 0xFF), outs);
					cur_accum >>= 8;
					cur_bits -= 8;
				}
				Flush(outs);
			}
		}
	}
	public class NeuQuant
	{
		protected static readonly int netsize = 256;

		protected static readonly int prime1 = 499;

		protected static readonly int prime2 = 491;

		protected static readonly int prime3 = 487;

		protected static readonly int prime4 = 503;

		protected static readonly int minpicturebytes = 3 * prime4;

		protected static readonly int maxnetpos = netsize - 1;

		protected static readonly int netbiasshift = 4;

		protected static readonly int ncycles = 100;

		protected static readonly int intbiasshift = 16;

		protected static readonly int intbias = 1 << intbiasshift;

		protected static readonly int gammashift = 10;

		protected static readonly int gamma = 1 << gammashift;

		protected static readonly int betashift = 10;

		protected static readonly int beta = intbias >> betashift;

		protected static readonly int betagamma = intbias << gammashift - betashift;

		protected static readonly int initrad = netsize >> 3;

		protected static readonly int radiusbiasshift = 6;

		protected static readonly int radiusbias = 1 << radiusbiasshift;

		protected static readonly int initradius = initrad * radiusbias;

		protected static readonly int radiusdec = 30;

		protected static readonly int alphabiasshift = 10;

		protected static readonly int initalpha = 1 << alphabiasshift;

		protected int alphadec;

		protected static readonly int radbiasshift = 8;

		protected static readonly int radbias = 1 << radbiasshift;

		protected static readonly int alpharadbshift = alphabiasshift + radbiasshift;

		protected static readonly int alpharadbias = 1 << alpharadbshift;

		protected byte[] thepicture;

		protected int lengthcount;

		protected int samplefac;

		protected int[][] network;

		protected int[] netindex = new int[256];

		protected int[] bias = new int[netsize];

		protected int[] freq = new int[netsize];

		protected int[] radpower = new int[initrad];

		public NeuQuant(byte[] thepic, int len, int sample)
		{
			thepicture = thepic;
			lengthcount = len;
			samplefac = sample;
			network = new int[netsize][];
			for (int i = 0; i < netsize; i++)
			{
				network[i] = new int[4];
				int[] array = network[i];
				array[0] = (array[1] = (array[2] = (i << netbiasshift + 8) / netsize));
				freq[i] = intbias / netsize;
				bias[i] = 0;
			}
		}

		public byte[] ColorMap()
		{
			byte[] array = new byte[3 * netsize];
			int[] array2 = new int[netsize];
			for (int i = 0; i < netsize; i++)
			{
				array2[network[i][3]] = i;
			}
			int num = 0;
			for (int j = 0; j < netsize; j++)
			{
				int num2 = array2[j];
				array[num++] = (byte)network[num2][0];
				array[num++] = (byte)network[num2][1];
				array[num++] = (byte)network[num2][2];
			}
			return array;
		}

		public void Inxbuild()
		{
			int num = 0;
			int num2 = 0;
			for (int i = 0; i < netsize; i++)
			{
				int[] array = network[i];
				int num3 = i;
				int num4 = array[1];
				int[] array2;
				for (int j = i + 1; j < netsize; j++)
				{
					array2 = network[j];
					if (array2[1] < num4)
					{
						num3 = j;
						num4 = array2[1];
					}
				}
				array2 = network[num3];
				if (i != num3)
				{
					int j = array2[0];
					array2[0] = array[0];
					array[0] = j;
					j = array2[1];
					array2[1] = array[1];
					array[1] = j;
					j = array2[2];
					array2[2] = array[2];
					array[2] = j;
					j = array2[3];
					array2[3] = array[3];
					array[3] = j;
				}
				if (num4 != num)
				{
					netindex[num] = num2 + i >> 1;
					for (int j = num + 1; j < num4; j++)
					{
						netindex[j] = i;
					}
					num = num4;
					num2 = i;
				}
			}
			netindex[num] = num2 + maxnetpos >> 1;
			for (int j = num + 1; j < 256; j++)
			{
				netindex[j] = maxnetpos;
			}
		}

		public void Learn()
		{
			if (lengthcount < minpicturebytes)
			{
				samplefac = 1;
			}
			alphadec = 30 + (samplefac - 1) / 3;
			byte[] array = thepicture;
			int num = 0;
			int num2 = lengthcount;
			int num3 = lengthcount / (3 * samplefac);
			int num4 = num3 / ncycles;
			int num5 = initalpha;
			int num6 = initradius;
			int num7 = num6 >> radiusbiasshift;
			if (num7 <= 1)
			{
				num7 = 0;
			}
			int i;
			for (i = 0; i < num7; i++)
			{
				radpower[i] = num5 * ((num7 * num7 - i * i) * radbias / (num7 * num7));
			}
			int num8 = ((lengthcount < minpicturebytes) ? 3 : ((lengthcount % prime1 != 0) ? (3 * prime1) : ((lengthcount % prime2 != 0) ? (3 * prime2) : ((lengthcount % prime3 == 0) ? (3 * prime4) : (3 * prime3)))));
			i = 0;
			while (i < num3)
			{
				int b = (array[num] & 0xFF) << netbiasshift;
				int g = (array[num + 1] & 0xFF) << netbiasshift;
				int r = (array[num + 2] & 0xFF) << netbiasshift;
				int i2 = Contest(b, g, r);
				Altersingle(num5, i2, b, g, r);
				if (num7 != 0)
				{
					Alterneigh(num7, i2, b, g, r);
				}
				num += num8;
				if (num >= num2)
				{
					num -= lengthcount;
				}
				i++;
				if (num4 == 0)
				{
					num4 = 1;
				}
				if (i % num4 == 0)
				{
					num5 -= num5 / alphadec;
					num6 -= num6 / radiusdec;
					num7 = num6 >> radiusbiasshift;
					if (num7 <= 1)
					{
						num7 = 0;
					}
					for (i2 = 0; i2 < num7; i2++)
					{
						radpower[i2] = num5 * ((num7 * num7 - i2 * i2) * radbias / (num7 * num7));
					}
				}
			}
		}

		public int Map(int b, int g, int r)
		{
			int num = 1000;
			int result = -1;
			int num2 = netindex[g];
			int num3 = num2 - 1;
			while (num2 < netsize || num3 >= 0)
			{
				int[] array;
				int num5;
				int num4;
				if (num2 < netsize)
				{
					array = network[num2];
					num4 = array[1] - g;
					if (num4 >= num)
					{
						num2 = netsize;
					}
					else
					{
						num2++;
						if (num4 < 0)
						{
							num4 = -num4;
						}
						num5 = array[0] - b;
						if (num5 < 0)
						{
							num5 = -num5;
						}
						num4 += num5;
						if (num4 < num)
						{
							num5 = array[2] - r;
							if (num5 < 0)
							{
								num5 = -num5;
							}
							num4 += num5;
							if (num4 < num)
							{
								num = num4;
								result = array[3];
							}
						}
					}
				}
				if (num3 < 0)
				{
					continue;
				}
				array = network[num3];
				num4 = g - array[1];
				if (num4 >= num)
				{
					num3 = -1;
					continue;
				}
				num3--;
				if (num4 < 0)
				{
					num4 = -num4;
				}
				num5 = array[0] - b;
				if (num5 < 0)
				{
					num5 = -num5;
				}
				num4 += num5;
				if (num4 < num)
				{
					num5 = array[2] - r;
					if (num5 < 0)
					{
						num5 = -num5;
					}
					num4 += num5;
					if (num4 < num)
					{
						num = num4;
						result = array[3];
					}
				}
			}
			return result;
		}

		public byte[] Process()
		{
			Learn();
			Unbiasnet();
			Inxbuild();
			return ColorMap();
		}

		public void Unbiasnet()
		{
			for (int i = 0; i < netsize; i++)
			{
				network[i][0] >>= netbiasshift;
				network[i][1] >>= netbiasshift;
				network[i][2] >>= netbiasshift;
				network[i][3] = i;
			}
		}

		protected void Alterneigh(int rad, int i, int b, int g, int r)
		{
			int num = i - rad;
			if (num < -1)
			{
				num = -1;
			}
			int num2 = i + rad;
			if (num2 > netsize)
			{
				num2 = netsize;
			}
			int num3 = i + 1;
			int num4 = i - 1;
			int num5 = 1;
			while (num3 < num2 || num4 > num)
			{
				int num6 = radpower[num5++];
				if (num3 < num2)
				{
					int[] array = network[num3++];
					try
					{
						array[0] -= num6 * (array[0] - b) / alpharadbias;
						array[1] -= num6 * (array[1] - g) / alpharadbias;
						array[2] -= num6 * (array[2] - r) / alpharadbias;
					}
					catch
					{
					}
				}
				if (num4 > num)
				{
					int[] array = network[num4--];
					try
					{
						array[0] -= num6 * (array[0] - b) / alpharadbias;
						array[1] -= num6 * (array[1] - g) / alpharadbias;
						array[2] -= num6 * (array[2] - r) / alpharadbias;
					}
					catch
					{
					}
				}
			}
		}

		protected void Altersingle(int alpha, int i, int b, int g, int r)
		{
			int[] array = network[i];
			array[0] -= alpha * (array[0] - b) / initalpha;
			array[1] -= alpha * (array[1] - g) / initalpha;
			array[2] -= alpha * (array[2] - r) / initalpha;
		}

		protected int Contest(int b, int g, int r)
		{
			int num = int.MaxValue;
			int num2 = num;
			int num3 = -1;
			int result = num3;
			for (int i = 0; i < netsize; i++)
			{
				int[] obj = network[i];
				int num4 = obj[0] - b;
				if (num4 < 0)
				{
					num4 = -num4;
				}
				int num5 = obj[1] - g;
				if (num5 < 0)
				{
					num5 = -num5;
				}
				num4 += num5;
				num5 = obj[2] - r;
				if (num5 < 0)
				{
					num5 = -num5;
				}
				num4 += num5;
				if (num4 < num)
				{
					num = num4;
					num3 = i;
				}
				int num6 = num4 - (bias[i] >> intbiasshift - netbiasshift);
				if (num6 < num2)
				{
					num2 = num6;
					result = i;
				}
				int num7 = freq[i] >> betashift;
				freq[i] -= num7;
				bias[i] += num7 << gammashift;
			}
			freq[num3] += beta;
			bias[num3] -= betagamma;
			return result;
		}
	}
	public sealed class UnsafeBitmapContext : IDisposable
	{
		public struct Pixel
		{
			public byte Blue;

			public byte Green;

			public byte Red;

			public byte Alpha;
		}

		private Stream _originalStream;

		private Bitmap _bitmap;

		private BitmapData _lockData;

		private unsafe byte* _ptrBase;

		private int _pixelWidth;

		public int Width { get; private set; }

		public int Height { get; private set; }

		public UnsafeBitmapContext(Bitmap bitmap)
		{
			_bitmap = bitmap;
			LockBits();
		}

		public UnsafeBitmapContext(Image image)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0025: Expected O, but got Unknown
			if (!(image is Bitmap))
			{
				throw new ArgumentException("Image must be convertable to a bitmap.");
			}
			_bitmap = (Bitmap)image;
			LockBits();
		}

		public UnsafeBitmapContext(Stream stream)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			try
			{
				_originalStream = stream;
				stream.Position = 0L;
				_bitmap = (Bitmap)Image.FromStream(stream);
			}
			catch
			{
				throw new ArgumentException("Stream did not contain a valid image format.");
			}
			LockBits();
		}

		private unsafe void LockBits()
		{
			Width = ((Image)_bitmap).Width;
			Height = ((Image)_bitmap).Height;
			_pixelWidth = sizeof(Pixel);
			_lockData = _bitmap.LockBits(new Rectangle(0, 0, ((Image)_bitmap).Width, ((Image)_bitmap).Height), (ImageLockMode)3, (PixelFormat)2498570);
			_ptrBase = (byte*)_lockData.Scan0.ToPointer();
		}

		public void Dispose()
		{
			_bitmap.UnlockBits(_lockData);
			_lockData = null;
			if (_originalStream != null)
			{
				_originalStream.SetLength(0L);
				_originalStream.Position = 0L;
				((Image)_bitmap).Save(_originalStream, ((Image)_bitmap).RawFormat);
				((Image)_bitmap).Dispose();
				_originalStream.Position = 0L;
			}
			_originalStream = null;
			_bitmap = null;
		}

		public Color GetPixel(int x, int y)
		{
			Pixel rawPixel = GetRawPixel(x, y);
			return Color.FromArgb(rawPixel.Alpha, rawPixel.Red, rawPixel.Green, rawPixel.Blue);
		}

		public unsafe Pixel GetRawPixel(int x, int y)
		{
			return *Pointer(x, y);
		}

		public void SetPixel(int x, int y, Color color)
		{
			SetPixel(x, y, color.A, color.R, color.G, color.B);
		}

		public unsafe void SetPixel(int x, int y, byte alpha, byte red, byte green, byte blue)
		{
			Pixel* intPtr = Pointer(x, y);
			intPtr->Alpha = alpha;
			intPtr->Red = red;
			intPtr->Green = green;
			intPtr->Blue = blue;
		}

		private unsafe Pixel* Pointer(int x, int y)
		{
			if (x >= Width || x < 0 || y >= Height || y < 0)
			{
				Dispose();
				throw new ArgumentException("The X and Y parameters must be within the scope of the image pixel ranges.");
			}
			return (Pixel*)(_ptrBase + y * _lockData.Stride + x * _pixelWidth);
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.GifMaker.Gif.PlotCore
{
	public interface IPlotBase
	{
		Size OwnerSize { get; set; }

		Point Start { get; set; }

		AchorType Achor { get; set; }

		PlotType PlType { get; set; }

		bool IsEditModel { get; set; }

		PlotSetModel SetModel { get; set; }

		int Number { get; set; }

		bool IsOnAchor();

		bool IsValidate();

		void OnMouseDown(Point pt);

		void OnMouseMove(Point pt);

		void OnMouseUp(Point pt);

		void PlotElement(DrawingContext context);
	}
	public enum AchorType
	{
		None,
		Achor1,
		Achor2,
		Achor3,
		Achor4,
		Achor5,
		Achor6,
		Achor7,
		Achor8,
		All
	}
	public enum PlotType
	{
		None,
		Line,
		Rect,
		Ellipse,
		Arc,
		Text,
		Clip
	}
	public class PlotLine : Control, IPlotBase
	{
		public static DependencyProperty StrokeProperty;

		public static DependencyProperty StrokeThicknessProperty;

		public static DependencyProperty AchorProperty;

		public static DependencyProperty EndXProperty;

		public static DependencyProperty EndYProperty;

		private Grid editPanel;

		private Line line;

		private Line area;

		private Border[] achorArr;

		private bool isEditModel;

		public double EndX
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(EndXProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(EndXProperty, (object)value);
			}
		}

		public double EndY
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(EndYProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(EndYProperty, (object)value);
			}
		}

		public SolidColorBrush Stroke
		{
			get
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Expected O, but got Unknown
				return (SolidColorBrush)((DependencyObject)this).GetValue(StrokeProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrokeProperty, (object)value);
			}
		}

		public double StrokeThickness
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(StrokeThicknessProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrokeThicknessProperty, (object)value);
			}
		}

		public AchorType Achor
		{
			get
			{
				return (AchorType)((DependencyObject)this).GetValue(AchorProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(AchorProperty, (object)value);
			}
		}

		public Point Start { get; set; }

		public Size OwnerSize { get; set; }

		public int Number { get; set; }

		public PlotType PlType { get; set; }

		public PlotSetModel SetModel { get; set; }

		public bool IsEditModel
		{
			get
			{
				return isEditModel;
			}
			set
			{
				isEditModel = value;
				if (editPanel != null)
				{
					((UIElement)editPanel).Visibility = (Visibility)((!isEditModel) ? 2 : 0);
				}
			}
		}

		static PlotLine()
		{
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Expected O, but got Unknown
			//IL_0087: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Expected O, but got Unknown
			//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d2: Expected O, but got Unknown
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d7: Expected O, but got Unknown
			//IL_010e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0118: Expected O, but got Unknown
			//IL_0113: Unknown result type (might be due to invalid IL or missing references)
			//IL_011d: Expected O, but got Unknown
			//IL_013b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0145: Expected O, but got Unknown
			StrokeProperty = DependencyProperty.Register("Stroke", typeof(Brush), typeof(PlotLine), new PropertyMetadata((object)new SolidColorBrush(Colors.Black)));
			StrokeThicknessProperty = DependencyProperty.Register("StrokeThickness", typeof(double), typeof(PlotLine), new PropertyMetadata((object)1.0));
			AchorProperty = DependencyProperty.Register("Achor", typeof(AchorType), typeof(PlotLine), new PropertyMetadata((object)AchorType.Achor8));
			EndXProperty = DependencyProperty.Register("EndX", typeof(double), typeof(PlotLine), new PropertyMetadata((object)0.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlotLine plotLine = sender as PlotLine;
				if (plotLine.line != null)
				{
					plotLine.line.X2 = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue;
					plotLine.area.X2 = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue;
				}
			}));
			EndYProperty = DependencyProperty.Register("EndY", typeof(double), typeof(PlotLine), new PropertyMetadata((object)0.0, (PropertyChangedCallback)delegate(DependencyObject sender, DependencyPropertyChangedEventArgs e)
			{
				PlotLine plotLine = sender as PlotLine;
				if (plotLine.line != null)
				{
					plotLine.line.Y2 = (double)((DependencyPropertyChangedEventArgs)(ref e)).NewValue;
					plotLine.area.Y2 = plotLine.line.Y2 - 0.0;
				}
			}));
			FrameworkElement.DefaultStyleKeyProperty.OverrideMetadata(typeof(PlotLine), (PropertyMetadata)new FrameworkPropertyMetadata((object)typeof(PlotLine)));
		}

		public PlotLine()
		{
			isEditModel = true;
			((FrameworkElement)this).Cursor = Cursors.SizeNS;
		}

		public override void OnApplyTemplate()
		{
			//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ae: Expected O, but got Unknown
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Expected O, but got Unknown
			//IL_00dc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e6: Expected O, but got Unknown
			//IL_00f3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fd: Expected O, but got Unknown
			((FrameworkElement)this).OnApplyTemplate();
			achorArr = (Border[])(object)new Border[2];
			object obj = ((FrameworkTemplate)((Control)this).Template).FindName("line", (FrameworkElement)(object)this);
			line = (Line)((obj is Line) ? obj : null);
			object obj2 = ((FrameworkTemplate)((Control)this).Template).FindName("area", (FrameworkElement)(object)this);
			area = (Line)((obj2 is Line) ? obj2 : null);
			object obj3 = ((FrameworkTemplate)((Control)this).Template).FindName("editPanel", (FrameworkElement)(object)this);
			editPanel = (Grid)((obj3 is Grid) ? obj3 : null);
			for (int i = 0; i < 2; i++)
			{
				Border[] array = achorArr;
				int num = i;
				object obj4 = ((FrameworkTemplate)((Control)this).Template).FindName($"achor{i + 1}", (FrameworkElement)(object)this);
				array[num] = (Border)((obj4 is Border) ? obj4 : null);
				((UIElement)achorArr[i]).MouseEnter += new MouseEventHandler(OnAchorMoseEnter);
				((UIElement)achorArr[i]).MouseLeave += new MouseEventHandler(OnAchorMouseLeave);
			}
			((UIElement)area).MouseEnter += new MouseEventHandler(PlotLine_MouseEnter);
			((UIElement)area).MouseLeave += new MouseEventHandler(PlotLine_MouseLeave);
		}

		private void PlotLine_MouseLeave(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Invalid comparison between Unknown and I4
			if ((int)e.LeftButton != 1)
			{
				((FrameworkElement)this).Cursor = Cursors.Cross;
				Achor = AchorType.None;
			}
		}

		private void PlotLine_MouseEnter(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Invalid comparison between Unknown and I4
			if ((int)e.LeftButton != 1)
			{
				((FrameworkElement)this).Cursor = Cursors.SizeAll;
				Achor = AchorType.All;
			}
		}

		private void OnAchorMoseEnter(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Invalid comparison between Unknown and I4
			if ((int)e.LeftButton != 1 && sender is Border)
			{
				Border val = (Border)((sender is Border) ? sender : null);
				if (((FrameworkElement)val).Name == "achor1")
				{
					((FrameworkElement)this).Cursor = Cursors.SizeNS;
					Achor = AchorType.Achor1;
				}
				else if (((FrameworkElement)val).Name == "achor2")
				{
					((FrameworkElement)this).Cursor = Cursors.SizeNS;
					Achor = AchorType.Achor8;
				}
				else
				{
					Achor = AchorType.None;
					((FrameworkElement)this).Cursor = Cursors.Cross;
				}
			}
		}

		private void OnAchorMouseLeave(object sender, MouseEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Invalid comparison between Unknown and I4
			if ((int)e.LeftButton != 1)
			{
				((FrameworkElement)this).Cursor = Cursors.Cross;
				Achor = AchorType.None;
			}
		}

		private void SetEndAchor()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_00be: Unknown result type (might be due to invalid IL or missing references)
			Thickness margin = default(Thickness);
			((Thickness)(ref margin)).Left = ((EndX > 0.0) ? EndX : (2.0 * EndX));
			((Thickness)(ref margin)).Top = ((EndY > 0.0) ? EndY : (2.0 * EndY));
			((Thickness)(ref margin)).Left = ((Thickness)(ref margin)).Left - 24.0;
			((Thickness)(ref margin)).Top = ((Thickness)(ref margin)).Top - 30.0;
			((Thickness)(ref margin)).Right = -20.0;
			((Thickness)(ref margin)).Bottom = -20.0;
			((FrameworkElement)achorArr[1]).Margin = margin;
		}

		private Point GetStartPt()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			Point result = default(Point);
			((Point)(ref result)).X = Canvas.GetLeft((UIElement)(object)this);
			((Point)(ref result)).Y = Canvas.GetTop((UIElement)(object)this);
			return result;
		}

		private Point GetEndPt()
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			Point startPt = GetStartPt();
			((Point)(ref startPt)).X = ((Point)(ref startPt)).X + (double)(float)line.X2;
			((Point)(ref startPt)).Y = ((Point)(ref startPt)).Y + (double)(float)line.Y2;
			return startPt;
		}

		public bool IsOnAchor()
		{
			return Achor != AchorType.None;
		}

		public bool IsValidate()
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			Point startPt = GetStartPt();
			Point endPt = GetEndPt();
			if (!(Math.Abs(((Point)(ref endPt)).X - ((Point)(ref startPt)).X) > 2.0))
			{
				return Math.Abs(((Point)(ref endPt)).Y - ((Point)(ref startPt)).Y) > 2.0;
			}
			return true;
		}

		public void OnMouseDown(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			Start = pt;
		}

		public void OnMouseMove(Point pt)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fb: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0120: Unknown result type (might be due to invalid IL or missing references)
			//IL_0125: Unknown result type (might be due to invalid IL or missing references)
			//IL_01cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d0: Unknown result type (might be due to invalid IL or missing references)
			if (pt == Start)
			{
				return;
			}
			double x = ((Point)(ref pt)).X;
			Point start = Start;
			double num = x - ((Point)(ref start)).X;
			double y = ((Point)(ref pt)).Y;
			start = Start;
			double num2 = y - ((Point)(ref start)).Y;
			Size ownerSize;
			if (Achor == AchorType.Achor8)
			{
				double num3 = Canvas.GetLeft((UIElement)(object)this) + num + EndX;
				double num4 = Canvas.GetTop((UIElement)(object)this) + num2 + EndY;
				if (num3 < 0.0)
				{
					return;
				}
				ownerSize = OwnerSize;
				if (num3 > ((Size)(ref ownerSize)).Width || num4 < 0.0)
				{
					return;
				}
				ownerSize = OwnerSize;
				if (num4 > ((Size)(ref ownerSize)).Height)
				{
					return;
				}
				EndX += num;
				EndY += num2;
				SetEndAchor();
			}
			else if (Achor == AchorType.Achor1)
			{
				if (((Point)(ref pt)).X < 0.0)
				{
					return;
				}
				double x2 = ((Point)(ref pt)).X;
				ownerSize = OwnerSize;
				if (x2 > ((Size)(ref ownerSize)).Width || ((Point)(ref pt)).Y < 0.0)
				{
					return;
				}
				double y2 = ((Point)(ref pt)).Y;
				ownerSize = OwnerSize;
				if (y2 > ((Size)(ref ownerSize)).Height)
				{
					return;
				}
				Canvas.SetLeft((UIElement)(object)this, ((Point)(ref pt)).X);
				Canvas.SetTop((UIElement)(object)this, ((Point)(ref pt)).Y);
				EndX -= num;
				EndY -= num2;
				SetEndAchor();
			}
			else if (Achor == AchorType.All)
			{
				double num5 = num + Canvas.GetLeft((UIElement)(object)this);
				double num6 = num2 + Canvas.GetTop((UIElement)(object)this);
				if (num5 < 0.0)
				{
					return;
				}
				double num7 = num5 + EndX;
				ownerSize = OwnerSize;
				if (num7 > ((Size)(ref ownerSize)).Width || num6 < 0.0)
				{
					return;
				}
				double num8 = num6 + EndY;
				ownerSize = OwnerSize;
				if (num8 > ((Size)(ref ownerSize)).Height)
				{
					return;
				}
				Canvas.SetLeft((UIElement)(object)this, num5);
				Canvas.SetTop((UIElement)(object)this, num6);
			}
			Start = pt;
		}

		public void OnMouseUp(Point pt)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0076: Unknown result type (might be due to invalid IL or missing references)
			//IL_007b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
			Rect val = default(Rect);
			((Rect)(ref val)).Width = 6.0;
			((Rect)(ref val)).Height = 6.0;
			Rect val2 = val;
			if (Achor == AchorType.Achor1)
			{
				Point startPt = GetStartPt();
				((Rect)(ref val2)).X = ((Point)(ref startPt)).X - 3.0;
				((Rect)(ref val2)).Y = ((Point)(ref startPt)).Y - 3.0;
			}
			else
			{
				if (Achor != AchorType.Achor8)
				{
					return;
				}
				Point endPt = GetEndPt();
				((Rect)(ref val2)).X = ((Point)(ref endPt)).X - 3.0;
				((Rect)(ref val2)).Y = ((Point)(ref endPt)).Y - 3.0;
			}
			if (!((Rect)(ref val2)).Contains(pt))
			{
				((FrameworkElement)this).Cursor = Cursors.Cross;
				Achor = AchorType.None;
			}
		}

		public void PlotElement(DrawingContext context)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Expected O, but got Unknown
			Point startPt = GetStartPt();
			Point endPt = GetEndPt();
			context.DrawLine(new Pen((Brush)(object)Stroke, StrokeThickness), startPt, endPt);
		}
	}
	public class PlotSetModel : ViewModelBase
	{
		private string _FontFamily;

		private bool _IsBold;

		private bool _IsItalic;

		private double _FontSize;

		private Color _Color;

		private double _LineWeight;

		public string FontFamily
		{
			get
			{
				return _FontFamily;
			}
			set
			{
				_FontFamily = value;
				((NotifyBase)this).OnPropertyChanged("FontFamily");
			}
		}

		public bool IsBold
		{
			get
			{
				return _IsBold;
			}
			set
			{
				_IsBold = value;
				((NotifyBase)this).OnPropertyChanged("IsBold");
			}
		}

		public bool IsItalic
		{
			get
			{
				return _IsItalic;
			}
			set
			{
				_IsItalic = value;
				((NotifyBase)this).OnPropertyChanged("IsItalic");
			}
		}

		public double FontSize
		{
			get
			{
				return _FontSize;
			}
			set
			{
				_FontSize = value;
				((NotifyBase)this).OnPropertyChanged("FontSize");
			}
		}

		public Color Color
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _Color;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_Color = value;
				((NotifyBase)this).OnPropertyChanged("Color");
			}
		}

		public double LineWeight
		{
			get
			{
				return _LineWeight;
			}
			set
			{
				_LineWeight = value;
				((NotifyBase)this).OnPropertyChanged("LineWeight");
			}
		}

		public PlotSetModel()
		{
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			FontFamily = "Arial";
			IsBold = false;
			IsItalic = false;
			FontSize = 12.0;
			Color = Colors.Black;
			LineWeight = 1.0;
		}

		public PlotSetModel Clone()
		{
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			return new PlotSetModel
			{
				LineWeight = LineWeight,
				FontFamily = FontFamily,
				IsBold = IsBold,
				IsItalic = IsItalic,
				FontSize = FontSize,
				Color = Color
			};
		}
	}
	public class PlotShape : ContentControl, IPlotBase
	{
		public static DependencyProperty AchorProperty;

		private Grid border;

		private Border[] rectArr;

		private Rectangle area;

		private bool isEditModel;

		public AchorType Achor
		{
			get
			{
				return (AchorType)((DependencyObject)this).GetValue(AchorProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(AchorProperty, (object)value);
			}
		}

		public Point Start { get; set; }

		public Size OwnerSize { get; set; }

		public int Number { get; set; }

		public PlotType PlType { get; set; }

		public PlotSetModel SetModel { get; set; }

		public bool IsEditModel
		{
			get
			{
				return isEditModel;
			}
			set
			{
				isEditModel = value;
				if (border != null)
				{
					((UIElement)border).Visibility = (Visibility)((!isEditModel) ? 2 : 0);
				}
			}
		}

		static PlotShape()
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Expected O, but got Unknown
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			AchorProperty = DependencyProperty.Register("Achor", typeof(AchorType), typeof(PlotShape), new PropertyMetadata((object)AchorType.Achor8));
			FrameworkElement.DefaultStyleKeyProperty.OverrideMetadata(typeof(PlotShape), (PropertyMetadata)new FrameworkPropertyMetadata((object)typeof(PlotShape)));
		}

		public PlotShape()
		{
			((FrameworkElement)this).Width = 0.0;
			((FrameworkElement)this).Height = 0.0;
			isEditModel = true;
			((FrameworkElement)this).Cursor = Cursors.SizeNWSE;
		}

		public override void OnApplyTemplate()
		{
			//IL_0168: Unknown result type (might be due to invalid IL or missing references)
			//IL_0172: Expected O, but got Unknown
			//IL_017f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0189: Expected O, but got Unknown
			//IL_01a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_01aa: Expected O, but got Unknown
			//IL_01b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c1: Expected O, but got Unknown
			//IL_01d0: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d5: Unknown result type (might be due to invalid IL or missing references)
			((FrameworkElement)this).OnApplyTemplate();
			rectArr = (Border[])(object)new Border[8];
			Border[] array = rectArr;
			object obj = ((FrameworkTemplate)((Control)this).Template).FindName("achor1", (FrameworkElement)(object)this);
			array[0] = (Border)((obj is Border) ? obj : null);
			Border[] array2 = rectArr;
			object obj2 = ((FrameworkTemplate)((Control)this).Template).FindName("achor2", (FrameworkElement)(object)this);
			array2[1] = (Border)((obj2 is Border) ? obj2 : null);
			Border[] array3 = rectArr;
			object obj3 = ((FrameworkTemplate)((Control)this).Template).FindName("achor3", (FrameworkElement)(object)this);
			array3[2] = (Border)((obj3 is Border) ? obj3 : null);
			Border[] array4 = rectArr;
			object obj4 = ((FrameworkTemplate)((Control)this).Template).FindName("achor4", (FrameworkElement)(object)this);
			array4[3] = (Border)((obj4 is Border) ? obj4 : null);
			Border[] array5 = rectArr;
			object obj5 = ((FrameworkTemplate)((Control)this).Template).FindName("achor5", (FrameworkElement)(object)this);
			array5[4] = (Border)((obj5 is Border) ? obj5 : null);
			Border[] array6 = rectArr;
			object obj6 = ((FrameworkTemplate)((Control)this).Template).FindName("achor6", (FrameworkElement)(object)this);
			array6[5] = (Border)((obj6 is Border) ? obj6 : null);
			Border[] array7 = rectArr;
			object obj7 = ((FrameworkTemplate)((Control)this).Template).FindName("achor7", (FrameworkElement)(object)this);
			array7[6] = (Border)((obj7 is Border) ? obj7 : null);
			Border[] array8 = rectArr;
			object obj8 = ((FrameworkTemplate)((Control)this).Template).FindName("achor8", (FrameworkElement)(object)this);
			array8[7] = (Border)((obj8 is Border) ? obj8 : null);
			object obj9 = ((FrameworkTemplate)((Control)this).Template).FindName("border", (FrameworkElement)(object)this);
			border = (Grid)((obj9 is Grid) ? obj9 : null);
			object obj10 = ((FrameworkTemplate)((Control)this).Template).FindName("area", (FrameworkElement)(object)this);
			area = (Rectangle)((obj10 is Rectangle) ? obj10 : null);
			Border[] array9 = rectArr;
			foreach (Border item in array9)
			{
				((UIElement)item).MouseEnter += (MouseEventHandler)delegate(object sender, MouseEventArgs e)
				{
					//IL_0001: Unknown result type (might be due to invalid IL or missing references)
					//IL_0007: Invalid comparison between Unknown and I4
					if ((int)e.LeftButton != 1)
					{
						string name = ((FrameworkElement)item).Name;
						if (name != null)
						{
							int length = name.Length;
							if (length == 6)
							{
								switch (name[5])
								{
								case '1':
									if (name == "achor1")
									{
										((FrameworkElement)this).Cursor = Cursors.SizeNWSE;
										Achor = AchorType.Achor1;
									}
									break;
								case '2':
									if (name == "achor2")
									{
										((FrameworkElement)this).Cursor = Cursors.SizeNS;
										Achor = AchorType.Achor2;
									}
									break;
								case '3':
									if (name == "achor3")
									{
										((FrameworkElement)this).Cursor = Cursors.SizeNESW;
										Achor = AchorType.Achor3;
									}
									break;
								case '4':
									if (name == "achor4")
									{
										((FrameworkElement)this).Cursor = Cursors.SizeWE;
										Achor = AchorType.Achor4;
									}
									break;
								case '5':
									if (name == "achor5")
									{
										((FrameworkElement)this).Cursor = Cursors.SizeNWSE;
										Achor = AchorType.Achor5;
									}
									break;
								case '6':
									if (name == "achor6")
									{
										((FrameworkElement)this).Cursor = Cursors.SizeNS;
										Achor = AchorType.Achor6;
									}
									break;
								case '7':
									if (name == "achor7")
									{
										((FrameworkElement)this).Cursor = Cursors.SizeNESW;
										Achor = AchorType.Achor7;
									}
									break;
								case '8':
									if (name == "achor8")
									{
										((FrameworkElement)this).Cursor = Cursors.SizeWE;
										Achor = AchorType.Achor8;
									}
									break;
								}
							}
						}
					}
				};
				((UIElement)item).MouseLeave += (MouseEventHandler)delegate(object sender, MouseEventArgs e)
				{
					//IL_0001: Unknown result type (might be due to invalid IL or missing references)
					//IL_0007: Invalid comparison between Unknown and I4
					if ((int)e.LeftButton != 1 && ((((FrameworkElement)item).Name == "achor1" && Achor == AchorType.Achor1) || (((FrameworkElement)item).Name == "achor2" && Achor == AchorType.Achor2) || (((FrameworkElement)item).Name == "achor3" && Achor == AchorType.Achor3) || (((FrameworkElement)item).Name == "achor4" && Achor == AchorType.Achor4) || (((FrameworkElement)item).Name == "achor5" && Achor == AchorType.Achor5) || (((FrameworkElement)item).Name == "achor6" && Achor == AchorType.Achor6) || (((FrameworkElement)item).Name == "achor7" && Achor == AchorType.Achor7) || (((FrameworkElement)item).Name == "achor8" && Achor == AchorType.Achor8)))
					{
						Achor = AchorType.None;
						if (PlType == PlotType.Text)
						{
							((FrameworkElement)this).Cursor = Cursors.IBeam;
							object content = ((ContentControl)this).Content;
							((UIElement)((content is TextBox) ? content : null)).Focus();
						}
						else
						{
							((FrameworkElement)this).Cursor = Cursors.Cross;
						}
					}
				};
			}
			((UIElement)area).MouseEnter += (MouseEventHandler)delegate(object sender, MouseEventArgs e)
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Invalid comparison between Unknown and I4
				if ((int)e.LeftButton != 1)
				{
					((FrameworkElement)this).Cursor = Cursors.SizeAll;
					Achor = AchorType.All;
				}
			};
			((UIElement)area).MouseLeave += (MouseEventHandler)delegate(object sender, MouseEventArgs e)
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Invalid comparison between Unknown and I4
				if ((int)e.LeftButton != 1)
				{
					((FrameworkElement)this).Cursor = Cursors.Cross;
					Achor = AchorType.None;
					if (((ContentControl)this).Content is TextBox)
					{
						object content = ((ContentControl)this).Content;
						((UIElement)((content is TextBox) ? content : null)).Focus();
					}
				}
			};
			((Shape)area).Fill = (Brush)((PlType == PlotType.Text) ? ((SolidColorBrush)null) : new SolidColorBrush(Colors.Transparent));
		}

		public Rect GetBound()
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			float num = (float)Canvas.GetLeft((UIElement)(object)this);
			float num2 = (float)Canvas.GetTop((UIElement)(object)this);
			float num3 = (float)((FrameworkElement)this).Width;
			float num4 = (float)((FrameworkElement)this).Height;
			return new Rect((double)num, (double)num2, (double)num3, (double)num4);
		}

		public string GetText()
		{
			if (PlType != PlotType.Text)
			{
				return string.Empty;
			}
			object content = ((ContentControl)this).Content;
			return ((TextBox)((content is TextBox) ? content : null)).Text;
		}

		public bool IsOnAchor()
		{
			return Achor != AchorType.None;
		}

		public bool IsValidate()
		{
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			if (PlType == PlotType.Text && string.IsNullOrWhiteSpace(GetText()))
			{
				return false;
			}
			Rect bound = GetBound();
			if (((Rect)(ref bound)).Width >= 2.0)
			{
				return ((Rect)(ref bound)).Height >= 2.0;
			}
			return false;
		}

		public void OnMouseDown(Point pt)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			Start = pt;
		}

		public void OnMouseMove(Point pt)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_015a: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_009b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f0: Unknown result type (might be due to invalid IL or missing references)
			//IL_0116: Unknown result type (might be due to invalid IL or missing references)
			//IL_011b: Unknown result type (might be due to invalid IL or missing references)
			//IL_013b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0140: Unknown result type (might be due to invalid IL or missing references)
			if (pt == Start)
			{
				return;
			}
			switch (Achor)
			{
			case AchorType.Achor1:
				MoveLeft(pt);
				MoveTop(pt);
				break;
			case AchorType.Achor2:
				MoveTop(pt);
				break;
			case AchorType.Achor3:
				MoveRight(pt);
				MoveTop(pt);
				break;
			case AchorType.Achor4:
				MoveRight(pt);
				break;
			case AchorType.Achor5:
				MoveRight(pt);
				MoveBottom(pt);
				break;
			case AchorType.Achor6:
				MoveBottom(pt);
				break;
			case AchorType.Achor7:
				MoveLeft(pt);
				MoveBottom(pt);
				break;
			case AchorType.Achor8:
				MoveLeft(pt);
				break;
			case AchorType.All:
			{
				double x = ((Point)(ref pt)).X;
				Point start = Start;
				double num = x - ((Point)(ref start)).X + Canvas.GetLeft((UIElement)(object)this);
				double y = ((Point)(ref pt)).Y;
				start = Start;
				double num2 = y - ((Point)(ref start)).Y + Canvas.GetTop((UIElement)(object)this);
				if (num < 0.0)
				{
					break;
				}
				double num3 = num + ((FrameworkElement)this).Width;
				Size ownerSize = OwnerSize;
				if (!(num3 > ((Size)(ref ownerSize)).Width) && !(num2 < 0.0))
				{
					double num4 = num2 + ((FrameworkElement)this).Height;
					ownerSize = OwnerSize;
					if (!(num4 > ((Size)(ref ownerSize)).Height))
					{
						Canvas.SetLeft((UIElement)(object)this, num);
						Canvas.SetTop((UIElement)(object)this, num2);
					}
				}
				break;
			}
			}
			Start = pt;
		}

		public void OnMouseUp(Point pt)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_0250: Unknown result type (might be due to invalid IL or missing references)
			//IL_0251: Unknown result type (might be due to invalid IL or missing references)
			//IL_0254: Unknown result type (might be due to invalid IL or missing references)
			Rect val = default(Rect);
			((Rect)(ref val)).Width = 20.0;
			((Rect)(ref val)).Height = 20.0;
			Rect val2 = val;
			Rect val3 = GeShapetBound();
			switch (Achor)
			{
			case AchorType.Achor1:
				((Rect)(ref val2)).X = ((Rect)(ref val3)).X - 10.0;
				((Rect)(ref val2)).Y = ((Rect)(ref val3)).Y - 10.0;
				break;
			case AchorType.Achor2:
				((Rect)(ref val2)).X = ((Rect)(ref val3)).X + ((Rect)(ref val3)).Width / 2.0 - 10.0;
				((Rect)(ref val2)).Y = ((Rect)(ref val3)).Y - 10.0;
				break;
			case AchorType.Achor3:
				((Rect)(ref val2)).X = ((Rect)(ref val3)).Right - 10.0;
				((Rect)(ref val2)).Y = ((Rect)(ref val3)).Top - 10.0;
				break;
			case AchorType.Achor4:
				((Rect)(ref val2)).X = ((Rect)(ref val3)).Right - 10.0;
				((Rect)(ref val2)).Y = ((Rect)(ref val3)).Y + ((Rect)(ref val3)).Height / 2.0 - 10.0;
				break;
			case AchorType.Achor5:
				((Rect)(ref val2)).X = ((Rect)(ref val3)).Right - 10.0;
				((Rect)(ref val2)).Y = ((Rect)(ref val3)).Bottom - 10.0;
				break;
			case AchorType.Achor6:
				((Rect)(ref val2)).X = ((Rect)(ref val3)).X + ((Rect)(ref val3)).Width / 2.0 - 10.0;
				((Rect)(ref val2)).Y = ((Rect)(ref val3)).Bottom - 10.0;
				break;
			case AchorType.Achor7:
				((Rect)(ref val2)).X = ((Rect)(ref val3)).X - 10.0;
				((Rect)(ref val2)).Y = ((Rect)(ref val3)).Bottom - 10.0;
				break;
			case AchorType.Achor8:
				((Rect)(ref val2)).X = ((Rect)(ref val3)).X - 10.0;
				((Rect)(ref val2)).Y = ((Rect)(ref val3)).X + ((Rect)(ref val3)).Height / 2.0 - 10.0;
				break;
			case AchorType.All:
				val2 = val3;
				break;
			}
			if (!((Rect)(ref val2)).Contains(pt))
			{
				((FrameworkElement)this).Cursor = Cursors.Cross;
				Achor = AchorType.None;
			}
		}

		public void PlotElement(DrawingContext context)
		{
			switch (PlType)
			{
			case PlotType.Ellipse:
				PlotEllipse(context);
				break;
			case PlotType.Rect:
				PlotRect(context);
				break;
			case PlotType.Text:
				PlotText(context);
				break;
			case PlotType.Arc:
				break;
			}
		}

		public Pen GetPen()
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Expected O, but got Unknown
			return new Pen((Brush)new SolidColorBrush(SetModel.Color), (double)(float)SetModel.LineWeight);
		}

		private Brush GetBrush()
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Expected O, but got Unknown
			return (Brush)new SolidColorBrush(SetModel.Color);
		}

		private Rect GeShapetBound()
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			float num = (float)Canvas.GetLeft((UIElement)(object)this);
			float num2 = (float)Canvas.GetTop((UIElement)(object)this);
			float num3 = (float)((FrameworkElement)this).Width;
			float num4 = (float)((FrameworkElement)this).Height;
			return new Rect((double)num, (double)num2, (double)num3, (double)num4);
		}

		private void PlotText(DrawingContext context)
		{
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Unknown result type (might be due to invalid IL or missing references)
			//IL_004c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0056: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_008c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_009f: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bb: Expected O, but got Unknown
			//IL_00be: Unknown result type (might be due to invalid IL or missing references)
			string text = GetText();
			FontStyle val = (SetModel.IsItalic ? FontStyles.Italic : FontStyles.Normal);
			FontWeight val2 = (SetModel.IsBold ? FontWeights.Bold : FontWeights.Normal);
			Typeface val3 = new Typeface(new FontFamily(SetModel.FontFamily), val, val2, FontStretches.Normal);
			Rect val4 = GeShapetBound();
			Point val5 = default(Point);
			((Point)(ref val5))..ctor(((Rect)(ref val4)).X, ((Rect)(ref val4)).Y);
			CultureInfo currentCulture = CultureInfo.CurrentCulture;
			double fontSize = SetModel.FontSize;
			Brush brush = GetBrush();
			DpiScale dpi = VisualTreeHelper.GetDpi((Visual)(object)this);
			FormattedText val6 = new FormattedText(text, currentCulture, (FlowDirection)0, val3, fontSize, brush, ((DpiScale)(ref dpi)).PixelsPerDip)
			{
				MaxTextWidth = ((Rect)(ref val4)).Width,
				MaxTextHeight = ((Rect)(ref val4)).Height
			};
			context.DrawText(val6, val5);
		}

		private void PlotRect(DrawingContext context)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Expected O, but got Unknown
			context.DrawRectangle((Brush)new SolidColorBrush(Colors.Transparent), GetPen(), GeShapetBound());
		}

		private void PlotEllipse(DrawingContext context)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			Rect val = GeShapetBound();
			double num = ((Rect)(ref val)).Width / 2.0;
			double num2 = ((Rect)(ref val)).Height / 2.0;
			Point val2 = default(Point);
			((Point)(ref val2)).X = ((Rect)(ref val)).X + num;
			((Point)(ref val2)).Y = ((Rect)(ref val)).Y + num2;
			Point val3 = val2;
			context.DrawEllipse((Brush)new SolidColorBrush(Colors.Transparent), GetPen(), val3, num, num2);
		}

		private void MoveTop(Point pt)
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			if (!(((Point)(ref pt)).Y < 0.0))
			{
				Point start = Start;
				double num = ((Point)(ref start)).Y - ((Point)(ref pt)).Y;
				start = Start;
				double num2 = ((Point)(ref start)).Y - Canvas.GetTop((UIElement)(object)this);
				double num3 = num + ((FrameworkElement)this).Height - num2;
				if (num3 >= 0.0)
				{
					Canvas.SetTop((UIElement)(object)this, ((Point)(ref pt)).Y);
					((FrameworkElement)this).Height = num3;
				}
			}
		}

		private void MoveLeft(Point pt)
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			if (!(((Point)(ref pt)).X <= 0.0))
			{
				Point start = Start;
				double num = ((Point)(ref start)).X - ((Point)(ref pt)).X;
				start = Start;
				double num2 = ((Point)(ref start)).X - Canvas.GetLeft((UIElement)(object)this);
				double num3 = num + ((FrameworkElement)this).Width - num2;
				if (num3 >= 0.0)
				{
					Canvas.SetLeft((UIElement)(object)this, ((Point)(ref pt)).X);
					((FrameworkElement)this).Width = num3;
				}
			}
		}

		private void MoveRight(Point pt)
		{
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			double x = ((Point)(ref pt)).X;
			Point start = Start;
			double num = x - ((Point)(ref start)).X;
			start = Start;
			double num2 = ((Point)(ref start)).X - (Canvas.GetLeft((UIElement)(object)this) + ((FrameworkElement)this).Width);
			double num3 = num + ((FrameworkElement)this).Width + num2;
			if (num3 >= 0.0)
			{
				double num4 = Canvas.GetLeft((UIElement)(object)this) + num3;
				Size ownerSize = OwnerSize;
				if (num4 <= ((Size)(ref ownerSize)).Width)
				{
					((FrameworkElement)this).Width = num3;
				}
			}
		}

		private void MoveBottom(Point pt)
		{
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			double y = ((Point)(ref pt)).Y;
			Point start = Start;
			double num = y - ((Point)(ref start)).Y;
			start = Start;
			double num2 = ((Point)(ref start)).Y - (Canvas.GetTop((UIElement)(object)this) + ((FrameworkElement)this).Height);
			double num3 = num + ((FrameworkElement)this).Height + num2;
			if (num3 >= 0.0)
			{
				double num4 = Canvas.GetTop((UIElement)(object)this) + num3;
				Size ownerSize = OwnerSize;
				if (num4 <= ((Size)(ref ownerSize)).Height)
				{
					((FrameworkElement)this).Height = num3;
				}
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.GifMaker.Comm
{
	public static class FolderBrowserLauncher
	{
		private const string _topLevelSearchString = "Browse For Folder";

		private const int _dlgItemBrowseControl = 0;

		private const int _dlgItemTreeView = 100;

		private const int TV_FIRST = 4352;

		private const int TVM_SELECTITEM = 4363;

		private const int TVM_GETNEXTITEM = 4362;

		private const int TVM_GETITEM = 4364;

		private const int TVM_ENSUREVISIBLE = 4372;

		private const int TVGN_ROOT = 0;

		private const int TVGN_NEXT = 1;

		private const int TVGN_CHILD = 4;

		private const int TVGN_FIRSTVISIBLE = 5;

		private const int TVGN_NEXTVISIBLE = 6;

		private const int TVGN_CARET = 9;

		[DllImport("user32.dll", SetLastError = true)]
		private static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

		[DllImport("user32.dll")]
		private static extern IntPtr GetDlgItem(IntPtr hDlg, int nIDDlgItem);

		[DllImport("user32.dll", CharSet = CharSet.Auto)]
		private static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);

		public static DialogResult ShowFolderBrowser(FolderBrowserDialog dlg, IWin32Window parent = null)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Expected O, but got Unknown
			//IL_004c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_0068: Unknown result type (might be due to invalid IL or missing references)
			DialogResult val = (DialogResult)2;
			int retries = 10;
			Timer t = new Timer();
			try
			{
				t.Tick += delegate
				{
					if (retries > 0)
					{
						int num = retries - 1;
						retries = num;
						IntPtr intPtr = FindWindow(null, "Browse For Folder");
						if (intPtr != IntPtr.Zero)
						{
							IntPtr dlgItem = GetDlgItem(intPtr, 0);
							if (dlgItem != IntPtr.Zero)
							{
								IntPtr dlgItem2 = GetDlgItem(dlgItem, 100);
								if (dlgItem2 != IntPtr.Zero)
								{
									IntPtr intPtr2 = SendMessage(dlgItem2, 4362u, new IntPtr(9), IntPtr.Zero);
									if (intPtr2 != IntPtr.Zero)
									{
										SendMessage(dlgItem2, 4372u, IntPtr.Zero, intPtr2);
										retries = 0;
										t.Stop();
									}
								}
							}
						}
					}
					else
					{
						t.Stop();
						SendKeys.SendWait("{TAB}{TAB}{DOWN}{DOWN}{UP}{UP}");
					}
				};
				t.Interval = 10;
				t.Start();
				return ((CommonDialog)dlg).ShowDialog(parent);
			}
			finally
			{
				if (t != null)
				{
					((IDisposable)t).Dispose();
				}
			}
		}
	}
	public class PlayerVisibleConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			try
			{
				if (values == null || values.Length < 2)
				{
					return (object)(Visibility)2;
				}
				string? text = values[0].ToString();
				uint num = System.Convert.ToUInt32(values[1]);
				return (object)(Visibility)((!(text == "True") || num < 2) ? 2 : 0);
			}
			catch
			{
				return (object)(Visibility)2;
			}
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class ZoomConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values == null || values.Length != 2)
			{
				return "Auto";
			}
			double num = System.Convert.ToDouble(values[0]);
			double num2 = System.Convert.ToDouble(values[1]);
			return num * num2;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class Color2BrushConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Expected O, but got Unknown
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Expected O, but got Unknown
			if (value != null && value is Color)
			{
				return (object)new SolidColorBrush((Color)value);
			}
			return (object)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#494949"));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class String2ImageConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			string text = value as string;
			if (string.IsNullOrEmpty(text) || !File.Exists(text))
			{
				return null;
			}
			return (object)new BitmapImage(new Uri(text, UriKind.RelativeOrAbsolute));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class LangStringConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			string text = value as string;
			if (string.IsNullOrEmpty(text))
			{
				return string.Empty;
			}
			int result = 30;
			if (parameter == null)
			{
				result = 30;
			}
			else
			{
				int.TryParse(parameter.ToString(), out result);
			}
			if (text.Length > result)
			{
				return text.Substring(0, result) + "...";
			}
			return text;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class GifVisiableConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			try
			{
				if (values.Length < 2)
				{
					return (object)(Visibility)2;
				}
				bool num = System.Convert.ToBoolean(values[0]);
				bool flag = System.Convert.ToBoolean(values[1]);
				return (object)(Visibility)((!(num && flag)) ? 2 : 0);
			}
			catch
			{
				return (object)(Visibility)2;
			}
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
}
namespace lenovo.mbg.service.lmsa.toolbox.Business
{
	internal class ClipboardInfo
	{
		[JsonProperty("type")]
		public string Type { get; set; }

		[JsonProperty("content")]
		public string Content { get; set; }

		[JsonProperty("size")]
		public string Size { get; set; }
	}
	internal interface IDeviceClipboard
	{
		bool ImportClipboardInfo(string ClipBoardContent);

		string GetClipboardInfo();
	}
}
