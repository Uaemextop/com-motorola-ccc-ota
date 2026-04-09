using System;
using System.CodeDom.Compiler;
using System.Collections.Concurrent;
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
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Threading;
using Microsoft.Win32;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.common.utilities;
using lenovo.mbg.service.common.webservices;
using lenovo.mbg.service.common.webservices.WebApiModel;
using lenovo.mbg.service.common.webservices.WebApiServices;
using lenovo.mbg.service.framework.devicemgt;
using lenovo.mbg.service.framework.lang;
using lenovo.mbg.service.framework.services;
using lenovo.mbg.service.framework.services.Device;
using lenovo.mbg.service.framework.services.Model;
using lenovo.mbg.service.framework.socket;
using lenovo.mbg.service.lmsa.backuprestore.Business;
using lenovo.mbg.service.lmsa.backuprestore.Business.Backup;
using lenovo.mbg.service.lmsa.backuprestore.Business.ExceptionDefine;
using lenovo.mbg.service.lmsa.backuprestore.Business.Restore;
using lenovo.mbg.service.lmsa.backuprestore.Business.Storage;
using lenovo.mbg.service.lmsa.backuprestore.Common;
using lenovo.mbg.service.lmsa.backuprestore.EntityModel;
using lenovo.mbg.service.lmsa.backuprestore.View;
using lenovo.mbg.service.lmsa.backuprestore.ViewContext;
using lenovo.mbg.service.lmsa.backuprestore.ViewModel;
using lenovo.mbg.service.lmsa.common;
using lenovo.mbg.service.lmsa.common.Form.FormVerify;
using lenovo.mbg.service.lmsa.common.Form.ViewModel;
using lenovo.mbg.service.lmsa.common.ImportExport;
using lenovo.mbg.service.lmsa.hostproxy;
using lenovo.themes.generic;
using lenovo.themes.generic.Component.Progress;
using lenovo.themes.generic.Controls.Windows;
using lenovo.themes.generic.ControlsV6;
using lenovo.themes.generic.Dialog;
using lenovo.themes.generic.Dialog.Permissions;
using lenovo.themes.generic.Exceptions;
using lenovo.themes.generic.ModelV6;
using lenovo.themes.generic.ViewModelV6;
using lenovo.themes.generic.ViewModels;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.lmsa.backuprestore")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("lenovo.mbg.service.lmsa.backuprestore")]
[assembly: AssemblyCopyright("Copyright ©  2023")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: ThemeInfo(/*Could not decode attribute arguments.*/)]
[assembly: AssemblyFileVersion("7.5.5.19")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("7.5.5.19")]
namespace lenovo.mbg.service.lmsa.backuprestore
{
	[PluginExport(typeof(IPlugin), "13f79fe4cfc98747c78794a943886bcd")]
	public class Plugin : PluginBase
	{
		public override FrameworkElement CreateControl(IMessageBox iMessage)
		{
			MainFrame mainFrame = new MainFrame();
			((FrameworkElement)mainFrame).DataContext = Context.MainFrame;
			Context.RsaMainWindow = iMessage;
			((ViewModelBase)Context.MainFrame).LoadData();
			return (FrameworkElement)(object)mainFrame;
		}

		public override void Init()
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			ResourceDictionary val = new ResourceDictionary();
			val.Source = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/UserResources/Style.xaml", UriKind.Relative);
			Application.Current.Resources.MergedDictionaries.Add(val);
			InitBackupLastDateTime();
		}

		private void InitBackupLastDateTime()
		{
			if (!(Configurations.BackupLastDateTime == DateTime.MinValue))
			{
				return;
			}
			List<BackupDescription> backupList = new DeviceBackupMgt().GetBackupList();
			if (backupList != null && backupList.Count > 0)
			{
				Configurations.BackupLastDateTime = Convert.ToDateTime(backupList.OrderByDescending((BackupDescription m) => m.BackupDateTime).First().BackupDateTime);
			}
			else
			{
				DateTime minValue = DateTime.MinValue;
				Configurations.BackupLastDateTime = minValue.AddYears(1);
			}
		}

		public override void OnInit(object data)
		{
			((PluginBase)this).OnInit(data);
			HostProxy.ViewContext.FindViewModel<BackupRestoreMainViewModel>(typeof(BackupRestoreMainView), (string)null)?.InitSdCard();
			if (Context.CurrentViewType == ViewType.BACKUPMAIN)
			{
				((ViewModelBase)HostProxy.ViewContext.FindViewModel<BackupMainViewModel>(typeof(BackUpMainView), (string)null)).LoadData((object)null);
			}
		}

		public override bool IsNonBusinessPage()
		{
			return Context.CurrentViewType == ViewType.START;
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.Properties
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
					resourceMan = new ResourceManager("lenovo.mbg.service.lmsa.backuprestore.Properties.Resources", typeof(Resources).Assembly);
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
namespace lenovo.mbg.service.lmsa.backuprestore.View
{
	public class BackUpHelpGuideView : Window, IMessageWindowV6, IComponentConnector
	{
		internal Image imgDownQR;

		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; set; }

		Action<IMessageWindowV6> IMessageWindowV6.CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; } = new AutoResetEvent(initialState: false);

		public BackUpHelpGuideView()
		{
			InitializeComponent();
			GenerateQrCode();
		}

		public bool CanExecute(object parameter)
		{
			return true;
		}

		public bool CanClose(object parameter)
		{
			return true;
		}

		private void BtnCloseClick(object sender, RoutedEventArgs e)
		{
			Result = false;
			((Window)this).Close();
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
				imgDownQR.Source = (ImageSource)(object)val;
			}
			catch (Exception)
			{
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/backuphelpguideview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected O, but got Unknown
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(BtnCloseClick);
				break;
			case 2:
				imgDownQR = (Image)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class BackUpMainView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public BackUpMainView()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/backupmainview.xaml", UriKind.Relative);
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
	public class BackupRestoreMainView : UserControl, IComponentConnector
	{
		private CategoryViewModel vmSMS;

		private CategoryViewModel vmCONTACT;

		private CategoryViewModel vmCALLLOG;

		internal SdCardView sdview;

		internal ContentPresenter mainContent;

		internal Button btnHelpGuide;

		private bool _contentLoaded;

		public BackupRestoreMainView()
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Expected O, but got Unknown
			InitializeComponent();
			((FrameworkElement)this).Loaded += (RoutedEventHandler)delegate
			{
				//IL_003e: Unknown result type (might be due to invalid IL or missing references)
				//IL_0048: Expected O, but got Unknown
				//IL_005a: Unknown result type (might be due to invalid IL or missing references)
				//IL_0064: Expected O, but got Unknown
				HostProxy.deviceManager.MasterDeviceChanged -= DeviceManager_OnMasterDeviceChanged;
				HostProxy.deviceManager.MasterDeviceChanged += DeviceManager_OnMasterDeviceChanged;
				((Selector)sdview.Cbx).SelectionChanged -= new SelectionChangedEventHandler(OnStorageChanged);
				((Selector)sdview.Cbx).SelectionChanged += new SelectionChangedEventHandler(OnStorageChanged);
				if (((FrameworkElement)this).DataContext is BackupRestoreMainViewModel backupRestoreMainViewModel)
				{
					BackUpMainView obj = backupRestoreMainViewModel.CurrentView as BackUpMainView;
					_ = ((obj != null) ? ((FrameworkElement)obj).DataContext : null) is BackupMainViewModel;
				}
			};
		}

		private void DeviceManager_OnMasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			HostProxy.CurrentDispatcher.Invoke((Action)delegate
			{
				bool? flag = null;
				if (mainContent.Content is BackUpMainView)
				{
					BackupMainViewModel backupMainViewModel = ((FrameworkElement)(mainContent.Content as BackUpMainView)).DataContext as BackupMainViewModel;
					if (backupMainViewModel?.VM != null)
					{
						flag = backupMainViewModel.VM.IsRunning;
					}
				}
				else if (mainContent.Content is RestoreView)
				{
					RestoreViewModel restoreViewModel = ((FrameworkElement)(mainContent.Content as RestoreView)).DataContext as RestoreViewModel;
					if (restoreViewModel?.VM != null)
					{
						flag = restoreViewModel.VM.IsRunning;
					}
				}
				DeviceEx current = e.Current;
				if (((current != null) ? current.Property.Category : null) == "tablet" || flag.HasValue)
				{
					((UIElement)btnHelpGuide).Visibility = (Visibility)1;
				}
				else
				{
					((UIElement)btnHelpGuide).Visibility = (Visibility)0;
				}
			});
		}

		private void OnStorageChanged(object sender, SelectionChangedEventArgs e)
		{
			if (((Selector)((sender is ComboBox) ? sender : null)).SelectedIndex == -1 || !(((FrameworkElement)this).DataContext is BackupRestoreMainViewModel backupRestoreMainViewModel))
			{
				return;
			}
			BackUpMainView obj = backupRestoreMainViewModel.CurrentView as BackUpMainView;
			if (!(((obj != null) ? ((FrameworkElement)obj).DataContext : null) is BackupMainViewModel backupMainViewModel))
			{
				return;
			}
			if (backupMainViewModel.UpdateSelSotrageAction == null)
			{
				backupMainViewModel.UpdateSelSotrageAction = SetSelStorage;
			}
			bool flag = backupRestoreMainViewModel.SdCarVm.StorageSelIndex == 0;
			LogHelper.LogInstance.Info("Storage drop down box selected: " + (flag ? "Internal" : "SD Card"), false);
			if (flag)
			{
				if (vmCONTACT != null && !backupMainViewModel.CategoriesViewModel.Categories.Contains(vmCONTACT))
				{
					backupMainViewModel.CategoriesViewModel.Categories.Insert(0, vmCONTACT);
				}
				if (vmCALLLOG != null && !backupMainViewModel.CategoriesViewModel.Categories.Contains(vmCALLLOG))
				{
					backupMainViewModel.CategoriesViewModel.Categories.Insert(0, vmCALLLOG);
				}
				if (vmSMS != null && !backupMainViewModel.CategoriesViewModel.Categories.Contains(vmSMS))
				{
					backupMainViewModel.CategoriesViewModel.Categories.Insert(0, vmSMS);
				}
			}
			else
			{
				vmSMS = backupMainViewModel.CategoriesViewModel.Categories.Where((CategoryViewModel x) => x.ResourceType == "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}").FirstOrDefault();
				vmCONTACT = backupMainViewModel.CategoriesViewModel.Categories.Where((CategoryViewModel x) => x.ResourceType == "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}").FirstOrDefault();
				vmCALLLOG = backupMainViewModel.CategoriesViewModel.Categories.Where((CategoryViewModel x) => x.ResourceType == "{89D4DB68-4258-4002-8557-E65959C558B3}").FirstOrDefault();
				backupMainViewModel.CategoriesViewModel.Categories.Remove(vmSMS);
				backupMainViewModel.CategoriesViewModel.Categories.Remove(vmCALLLOG);
				backupMainViewModel.CategoriesViewModel.Categories.Remove(vmCONTACT);
			}
			if (backupMainViewModel.IsInternalStorage != flag)
			{
				backupMainViewModel.IsInternalStorage = flag;
				backupMainViewModel.LoadResourceInfo();
			}
		}

		private void SetSelStorage(bool isInternal)
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			if (((masterDevice != null) ? masterDevice.ConnectedAppType : null) == "Moto")
			{
				(((FrameworkElement)this).DataContext as BackupRestoreMainViewModel).SdCarVm.StorageSelIndex = -1;
			}
			else
			{
				(((FrameworkElement)this).DataContext as BackupRestoreMainViewModel).SdCarVm.StorageSelIndex = 0;
			}
		}

		private void BtnHelpGuideClick(object sender, RoutedEventArgs e)
		{
			MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)new BackUpHelpGuideView(), (bool?)true);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/backuprestoremainview.xaml", UriKind.Relative);
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
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				sdview = (SdCardView)target;
				break;
			case 2:
				mainContent = (ContentPresenter)target;
				break;
			case 3:
				btnHelpGuide = (Button)target;
				((ButtonBase)btnHelpGuide).Click += new RoutedEventHandler(BtnHelpGuideClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class BackupTips : Window, IMessageWindowV6, IComponentConnector
	{
		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; set; }

		Action<IMessageWindowV6> IMessageWindowV6.CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; } = new AutoResetEvent(initialState: false);

		public BackupTips()
		{
			InitializeComponent();
		}

		public bool CanExecute(object parameter)
		{
			return true;
		}

		public bool CanClose(object parameter)
		{
			return true;
		}

		private void OnBtnClick(object sender, RoutedEventArgs e)
		{
			Result = false;
			((Window)this).Close();
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			Result = true;
			((Window)this).Close();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/backuptips.xaml", UriKind.Relative);
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
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_005d: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClick);
				break;
			case 2:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(OnBtnClick);
				break;
			case 3:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(OnBtnOk);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class DeviceTutorialsView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public DeviceTutorialsView()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/devicetutorialsview.xaml", UriKind.Relative);
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
	public class EnterPasswordView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public EnterPasswordView()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/enterpasswordview.xaml", UriKind.Relative);
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
	public class EnterPasswordWindow : Window, IMessageWindowV6, IComponentConnector
	{
		private bool _contentLoaded;

		public bool? Result { get; set; } = true;

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; set; }

		Action<IMessageWindowV6> IMessageWindowV6.CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; } = new AutoResetEvent(initialState: false);

		public EnterPasswordWindow()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
		}

		public bool CanExecute(object parameter)
		{
			return true;
		}

		public bool CanClose(object parameter)
		{
			return true;
		}

		protected override void OnClosed(EventArgs e)
		{
			((Window)this).OnClosed(e);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/enterpasswordwindow.xaml", UriKind.Relative);
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
	public class MainFrame : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public MainFrame()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/mainframe.xaml", UriKind.Relative);
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
	public class RestoreMainView : UserControl, IComponentConnector
	{
		internal RestoreMainView restoremainview;

		private bool _contentLoaded;

		public RestoreMainView()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/restoremainview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			if (connectionId == 1)
			{
				restoremainview = (RestoreMainView)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class RestoreView : UserControl, IComponentConnector
	{
		internal Grid grid1;

		private bool _contentLoaded;

		public RestoreView()
		{
			InitializeComponent();
		}

		private void ListView_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
		{
		}

		private void ListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			(((FrameworkElement)this).DataContext as RestoreViewModel).FireCategorySelectionChanged();
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			((UIElement)grid1).Visibility = (Visibility)2;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/restoreview.xaml", UriKind.Relative);
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
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				grid1 = (Grid)target;
				break;
			case 2:
				((Selector)(ListView)target).SelectionChanged += new SelectionChangedEventHandler(ListView_SelectionChanged);
				((UIElement)(ListView)target).MouseLeftButtonUp += new MouseButtonEventHandler(ListView_MouseLeftButtonUp);
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(Button_Click);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class ControlMainVisibleConvert : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values[0] == null || values[1] == null)
			{
				return (object)(Visibility)0;
			}
			return (object)(Visibility)2;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class ControlRunningVisibleConvert : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values[0] == null)
			{
				return (object)(Visibility)2;
			}
			if (values[1] != null && bool.Parse(values[1].ToString()))
			{
				return (object)(Visibility)0;
			}
			return (object)(Visibility)2;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class ControlFinishVisibleConvert : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values[0] == null)
			{
				return (object)(Visibility)2;
			}
			if (values[1] != null && !bool.Parse(values[1].ToString()))
			{
				return (object)(Visibility)0;
			}
			return (object)(Visibility)2;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class SetPasswordWindow : Window, IMessageWindowV6, IComponentConnector
	{
		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; set; }

		public Action<IMessageWindowV6> CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; } = new AutoResetEvent(initialState: false);

		public bool CanExecute(object parameter)
		{
			return true;
		}

		public bool CanClose(object parameter)
		{
			return true;
		}

		public SetPasswordWindow()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/setpasswordwindow.xaml", UriKind.Relative);
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
		internal Button GetStartBtn;

		private bool _contentLoaded;

		public StartView()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/startview.xaml", UriKind.Relative);
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
				GetStartBtn = (Button)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class SubCategoryWindow : Window, IMessageWindowV6, IComponentConnector
	{
		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; set; }

		Action<IMessageWindowV6> IMessageWindowV6.CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; } = new AutoResetEvent(initialState: false);

		public SubCategoryWindow()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
		}

		public bool CanExecute(object parameter)
		{
			return true;
		}

		public bool CanClose(object parameter)
		{
			return true;
		}

		public void CloseCallback(bool? status)
		{
			Result = status;
		}

		protected override void OnClosed(EventArgs e)
		{
			Result = false;
			((Window)this).OnClosed(e);
		}

		private void OnClose(object sender, RoutedEventArgs e)
		{
			(((FrameworkElement)this).DataContext as SubCategoryWindowModel).ChangeParentTitle();
			((Window)this).Close();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/subcategorywindow.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected O, but got Unknown
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnClose);
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class UserConsentWindow : Window, IMessageWindowV6, IComponentConnector
	{
		internal Button btnClose;

		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; set; }

		Action<IMessageWindowV6> IMessageWindowV6.CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; } = new AutoResetEvent(initialState: false);

		protected ConfirmAppPermissionIsReadyViewModel Vm { get; }

		public UserConsentWindow(CancellationTokenSource cts)
		{
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Expected O, but got Unknown
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
			Vm = new ConfirmAppPermissionIsReadyViewModel
			{
				ManualColseNotifyEvent = delegate
				{
					cts.Cancel();
				}
			};
			((FrameworkElement)this).DataContext = Vm;
		}

		public bool CanExecute(object parameter)
		{
			return true;
		}

		public bool CanClose(object parameter)
		{
			return true;
		}

		protected override void OnClosed(EventArgs e)
		{
			Result = true;
			((Window)this).OnClosed(e);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.backuprestore;component/view/userconsentwindow.xaml", UriKind.Relative);
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
				btnClose = (Button)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.ViewModel
{
	public class BackupHistoryListItemViewModel : ViewModelBase
	{
		private ImageSource _deviceNameIcon;

		private string _deviceName = string.Empty;

		private string _modelName = string.Empty;

		private string _version = string.Empty;

		private double _size;

		private string _sizeStrFormat = string.Empty;

		private string _backupDateStrFormat = string.Empty;

		private string _notes = string.Empty;

		private bool _isSelected;

		private bool _IsPhone;

		public ImageSource DeviceNameIcon
		{
			get
			{
				return _deviceNameIcon;
			}
			set
			{
				if (_deviceNameIcon != value)
				{
					_deviceNameIcon = value;
					((NotifyBase)this).OnPropertyChanged("DeviceNameIcon");
				}
			}
		}

		public string DeviceName
		{
			get
			{
				return _deviceName;
			}
			set
			{
				if (!(_deviceName == value))
				{
					_deviceName = value;
					((NotifyBase)this).OnPropertyChanged("DeviceName");
				}
			}
		}

		public string ModelName
		{
			get
			{
				return _modelName;
			}
			set
			{
				if (!(_modelName == value))
				{
					_modelName = value;
					((NotifyBase)this).OnPropertyChanged("ModelName");
				}
			}
		}

		public string Version
		{
			get
			{
				return _version;
			}
			set
			{
				if (!(_version == value))
				{
					_version = value;
					((NotifyBase)this).OnPropertyChanged("Version");
				}
			}
		}

		public double Size
		{
			get
			{
				return _size;
			}
			set
			{
				if (_size != value)
				{
					_size = value;
					((NotifyBase)this).OnPropertyChanged("Size");
				}
			}
		}

		public string SizeStrFormat
		{
			get
			{
				return _sizeStrFormat;
			}
			set
			{
				if (!(_sizeStrFormat == value))
				{
					_sizeStrFormat = value;
					((NotifyBase)this).OnPropertyChanged("SizeStrFormat");
				}
			}
		}

		private DateTime BackupDate { get; set; }

		public string BackupDateStrFormat
		{
			get
			{
				return _backupDateStrFormat;
			}
			set
			{
				if (!(_backupDateStrFormat == value))
				{
					_backupDateStrFormat = value;
					((NotifyBase)this).OnPropertyChanged("BackupDateStrFormat");
				}
			}
		}

		public string Notes
		{
			get
			{
				return _notes;
			}
			set
			{
				if (!(_notes == value))
				{
					_notes = value;
					((NotifyBase)this).OnPropertyChanged("Notes");
				}
			}
		}

		public string Storagepath { get; set; }

		public bool IsSelected
		{
			get
			{
				return _isSelected;
			}
			set
			{
				if (_isSelected != value)
				{
					_isSelected = value;
					((NotifyBase)this).OnPropertyChanged("IsSelected");
				}
			}
		}

		public bool IsPhone
		{
			get
			{
				return _IsPhone;
			}
			set
			{
				_IsPhone = value;
				((NotifyBase)this).OnPropertyChanged("IsPhone");
			}
		}

		public ButtonViewModel OpenViewButtonViewModel { get; set; }

		public ButtonViewModel DeleteButtonViewModel { get; set; }

		public BackupDescription BackupDescriptionInfo { get; set; }

		public BackupHistoryListItemViewModel()
		{
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0076: Expected O, but got Unknown
			//IL_0076: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_007e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0096: Expected O, but got Unknown
			//IL_0096: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ad: Expected O, but got Unknown
			//IL_00b2: Expected O, but got Unknown
			//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e0: Expected O, but got Unknown
			//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_0100: Expected O, but got Unknown
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			//IL_010d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0117: Expected O, but got Unknown
			//IL_011c: Expected O, but got Unknown
			object obj = Application.Current.FindResource((object)"searchDrawingImage");
			ImageSource val = (ImageSource)((obj is ImageSource) ? obj : null);
			OpenViewButtonViewModel = new ButtonViewModel
			{
				Background = (Brush)new ImageBrush(val)
				{
					Stretch = (Stretch)0
				},
				Visibility = (Visibility)0,
				Content = (object)new Image
				{
					Source = val,
					Stretch = (Stretch)0
				},
				ClickCommand = new ReplayCommand((Action<object>)OpenViewButtonClickCommandHandler)
			};
			object obj2 = Application.Current.FindResource((object)"delete_DrawingImage");
			ImageSource val2 = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
			DeleteButtonViewModel = new ButtonViewModel
			{
				Background = (Brush)new ImageBrush(val2)
				{
					Stretch = (Stretch)0
				},
				Visibility = (Visibility)0,
				Content = (object)new Image
				{
					Source = val2,
					Stretch = (Stretch)0
				},
				ClickCommand = new ReplayCommand((Action<object>)DeleteButtonClickCommandHandler)
			};
		}

		private void OpenViewButtonClickCommandHandler(object parameter)
		{
		}

		private void DeleteButtonClickCommandHandler(object parameter)
		{
		}
	}
	public class BackupMainViewModel : ViewModelBase
	{
		private enum Result
		{
			Unknown,
			Allow,
			Deny,
			Waiting
		}

		private static Dictionary<string, string> sBackupProgressResourceTypeTitleMapping = new Dictionary<string, string>
		{
			{
				"{773D71F7-CE8A-42D7-BE58-5F875DF58C16}",
				BackupRestoreStaticResources.SingleInstance.PIC
			},
			{
				"{242C8F16-6AC7-431B-BBF1-AE24373860F1}",
				BackupRestoreStaticResources.SingleInstance.MUSIC
			},
			{
				"{8BEBE14B-4E45-4D36-8726-8442E6242C01}",
				BackupRestoreStaticResources.SingleInstance.VIDEO
			},
			{
				"{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}",
				BackupRestoreStaticResources.SingleInstance.SMS
			},
			{
				"{89D4DB68-4258-4002-8557-E65959C558B3}",
				BackupRestoreStaticResources.SingleInstance.CALLLOG
			},
			{
				"{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}",
				BackupRestoreStaticResources.SingleInstance.CONTACT
			},
			{
				"{580C48C8-6CEF-4BBB-AF37-D880B349D142}",
				BackupRestoreStaticResources.SingleInstance.FILE
			}
		};

		protected Stopwatch sw;

		protected ResourceExecuteResult executeResult;

		public TcpAndroidDevice locConnecRestoreDevice;

		public int CycleTime;

		public DateTime startBackTime = DateTime.MinValue;

		private volatile bool _IsLoading;

		public WorkTransferWindowViewModel _VM;

		public volatile bool doRetry;

		protected Dictionary<string, List<string>> retryselectedTypes;

		protected DeviceBackupWorkerEx backupWorker;

		private bool _isEnabled;

		private string _storagePath = Configurations.BackupPath;

		public object _tips;

		private bool _isCheckedProtect;

		private bool isEncryptBackup = true;

		private FontSizeConverter _fontSizeConverter;

		private string _NotesValue;

		private bool _NotesTextBoxVisibility = true;

		public WorkTransferWindowViewModel VM
		{
			get
			{
				return _VM;
			}
			set
			{
				_VM = value;
				((NotifyBase)this).OnPropertyChanged("VM");
			}
		}

		public Action<bool> UpdateSelSotrageAction { get; set; }

		public bool IsInternalStorage { get; set; }

		public CategoriesViewModel CategoriesViewModel { get; set; }

		public ReplayCommand BackupCommand { get; private set; }

		public ReplayCommand ModifyButtonClickCommand { get; private set; }

		public ReplayCommand ViewButtonClickCommand { get; private set; }

		private int _SelectedCount => CategoriesViewModel.Categories.Count((CategoryViewModel n) => n.IsSelected);

		public bool IsEnabled
		{
			get
			{
				return _isEnabled;
			}
			set
			{
				if (_isEnabled != value)
				{
					_isEnabled = value;
					((NotifyBase)this).OnPropertyChanged("IsEnabled");
				}
			}
		}

		public string StoragePath
		{
			get
			{
				return _storagePath;
			}
			set
			{
				if (_storagePath != value)
				{
					_storagePath = value;
					SetBackupButtonIsEnable();
					((NotifyBase)this).OnPropertyChanged("StoragePath");
				}
			}
		}

		public object Tips
		{
			get
			{
				return _tips;
			}
			set
			{
				if (_tips != value)
				{
					_tips = value;
					((NotifyBase)this).OnPropertyChanged("Tips");
				}
			}
		}

		public bool IsCheckedProtect
		{
			get
			{
				return _isCheckedProtect;
			}
			set
			{
				if (_isCheckedProtect != value)
				{
					_isCheckedProtect = value;
					((NotifyBase)this).OnPropertyChanged("IsCheckedProtect");
				}
			}
		}

		public bool IsEncryptBackup
		{
			get
			{
				return isEncryptBackup;
			}
			set
			{
				if (isEncryptBackup != value)
				{
					isEncryptBackup = value;
					((NotifyBase)this).OnPropertyChanged("IsEncryptBackup");
				}
			}
		}

		private FontSizeConverter FontSizeConverter
		{
			get
			{
				//IL_0009: Unknown result type (might be due to invalid IL or missing references)
				//IL_0013: Expected O, but got Unknown
				if (_fontSizeConverter == null)
				{
					_fontSizeConverter = new FontSizeConverter();
				}
				return _fontSizeConverter;
			}
		}

		public string NotesValue
		{
			get
			{
				return _NotesValue;
			}
			set
			{
				_NotesValue = value;
				((NotifyBase)this).OnPropertyChanged("NotesValue");
			}
		}

		public bool NotesTextBoxVisibility
		{
			get
			{
				return _NotesTextBoxVisibility;
			}
			set
			{
				_NotesTextBoxVisibility = value;
				((NotifyBase)this).OnPropertyChanged("NotesTextBoxVisibility");
			}
		}

		public BackupMainViewModel()
		{
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Expected O, but got Unknown
			//IL_0078: Unknown result type (might be due to invalid IL or missing references)
			//IL_0082: Expected O, but got Unknown
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0099: Expected O, but got Unknown
			IsInternalStorage = true;
			CategoriesViewModel = new CategoriesViewModel(isBackup: true);
			CategoriesViewModel.CategorySelectionChanged += delegate
			{
				SetBackupButtonIsEnable();
			};
			BackupCommand = new ReplayCommand((Action<object>)BackupCommandHandler);
			ModifyButtonClickCommand = new ReplayCommand((Action<object>)ModifyButtonClickCommandHandler);
			ViewButtonClickCommand = new ReplayCommand((Action<object>)ViewButtonClickCommandHandler);
		}

		private void LoadResourceByStorage()
		{
			foreach (CategoryViewModel category in CategoriesViewModel.Categories)
			{
				category.ShowSubWindow = false;
				category.IsSelected = false;
				ObservableCollection<ComboBoxModel> childs = ((ComboBoxModel)category).Childs;
				if (childs != null && childs.Count > 0)
				{
					List<CategoryViewModel> list = ((ComboBoxModel)category).Childs.OfType<CategoryViewModel>().ToList();
					foreach (CategoryViewModel item in list)
					{
						item.SubItemVisible = (Visibility)0;
					}
					int count = (((ComboBoxModel)category).CountNum = list.Sum((CategoryViewModel p) => ((ComboBoxModel)p).CountNum));
					category.Count = count;
				}
				else if (!IsInternalStorage)
				{
					((ComboBoxModel)category).CountNum = 0;
					category.IsEnabled = false;
				}
				else
				{
					((ComboBoxModel)category).CountNum = category.Count;
					DeviceEx currentDevice = Context.CurrentDevice;
					if (((currentDevice != null) ? currentDevice.ConnectedAppType : null) == "Moto")
					{
						if (category.ResourceType == "{580C48C8-6CEF-4BBB-AF37-D880B349D142}" || category.ResourceType == "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}" || category.ResourceType == "{89D4DB68-4258-4002-8557-E65959C558B3}")
						{
							category.IsEnabled = true;
						}
						else
						{
							category.IsEnabled = category.Count > 0;
						}
					}
					else
					{
						category.IsEnabled = category.Count > 0;
					}
				}
				category.ShowSubWindow = true;
			}
		}

		public override void LoadData()
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				((ViewModelBase)this).LoadData();
				IsInternalStorage = true;
				UpdateSelSotrageAction?.Invoke(obj: true);
				CategoriesViewModel.LoadingProcessVisibility = (Visibility)0;
				((ViewModelBase)CategoriesViewModel).Reset();
				CategoriesViewModel.LoadCategories(CategoriesViewModel.CategoriesList);
				NotesTextBoxVisibility = true;
				NotesValue = string.Empty;
			});
			Task.Run(delegate
			{
				LoadResourceInfo();
			});
		}

		public override void Reset()
		{
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					((ViewModelBase)this).Reset();
					NotesTextBoxVisibility = true;
					NotesValue = string.Empty;
				});
			}
		}

		public void LoadResourceInfo(string resourceType)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Invalid comparison between Unknown and I4
			if (Context.CurrentDevice == null || (int)Context.CurrentDevice.SoftStatus != 2 || string.IsNullOrEmpty(resourceType))
			{
				return;
			}
			DeviceEx currentDevice = Context.CurrentDevice;
			TcpAndroidDevice device = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
			new BackupRestoreProcessor().LoadDeviceIdAndSizeV2(device, resourceType, IsInternalStorage, delegate(string k, Dictionary<string, long> v)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						CategoryViewModel categoryViewModel = CategoriesViewModel.Categories.First((CategoryViewModel n) => n.ResourceType == k);
						if (categoryViewModel != null)
						{
							((ComboBoxModel)categoryViewModel).CountNum = v.Count;
							categoryViewModel.Count = v.Count;
							categoryViewModel.IdAndSizeMapping = v;
						}
					});
				}
			}, delegate(string k, List<JObject> v)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						CategoryViewModel found = CategoriesViewModel.Categories.First((CategoryViewModel n) => n.ResourceType == k);
						List<CategoryViewModel> list = new List<CategoryViewModel>();
						if (found != null && ((ComboBoxModel)found).Childs != null && ((ComboBoxModel)found).Childs.Count > 0)
						{
							list = (from CategoryViewModel x in ((ComboBoxModel)found).Childs
								where x.IsSelected
								select x).ToList();
						}
						List<CategoryViewModel> childList = new List<CategoryViewModel>();
						if (v != null && v.Count > 0)
						{
							v.ForEach(delegate(JObject n)
							{
								if (n != null && ((JToken)n).HasValues)
								{
									string text = ((JToken)n).Value<string>((object)"name");
									string path = ((JToken)n).Value<string>((object)"path");
									text = (string.IsNullOrEmpty(text) ? null : text.Substring(text.LastIndexOf("/") + 1));
									JToken value = n.GetValue("idSizeMap");
									Dictionary<string, long> dictionary = new Dictionary<string, long>();
									if (value != null && value.HasValues)
									{
										dictionary = JsonHelper.DeserializeJson2Object<Dictionary<string, long>>(((object)value).ToString());
									}
									CategoryViewModel categoryViewModel2 = new CategoryViewModel();
									((ComboBoxModel)categoryViewModel2).Key = text;
									((ComboBoxModel)categoryViewModel2).Parent = (ComboBoxModel)(object)found;
									((ComboBoxModel)categoryViewModel2).Path = path;
									((ComboBoxModel)categoryViewModel2).CountNum = dictionary.Count;
									categoryViewModel2.IdAndSizeMapping = dictionary;
									CategoryViewModel categoryViewModel3 = categoryViewModel2;
									categoryViewModel3.SubItemVisible = (Visibility)0;
									childList.Add(categoryViewModel3);
								}
							});
						}
						int num = childList.Sum((CategoryViewModel p) => ((ComboBoxModel)p).CountNum);
						((ComboBoxModel)found).CountNum = num;
						found.Count = num;
						if (list != null && list.Count > 0)
						{
							foreach (CategoryViewModel item in list)
							{
								CategoryViewModel categoryViewModel = childList.FirstOrDefault((CategoryViewModel x) => ((ComboBoxModel)x).Key == ((ComboBoxModel)item).Key && ((ComboBoxModel)x).Path == ((ComboBoxModel)item).Path);
								if (categoryViewModel != null)
								{
									categoryViewModel.IsSelected = true;
								}
							}
						}
						((ComboBoxModel)found).Childs = new ObservableCollection<ComboBoxModel>((IEnumerable<ComboBoxModel>)childList);
						((ComboBoxModel)found).ToggleButtonVisibility = (Visibility)((num <= 0) ? 2 : 0);
					});
				}
			});
		}

		public void LoadResourceInfo()
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Invalid comparison between Unknown and I4
			if (_IsLoading || Context.CurrentDevice == null || (int)Context.CurrentDevice.SoftStatus != 2)
			{
				return;
			}
			_IsLoading = true;
			DeviceEx currentDevice = Context.CurrentDevice;
			TcpAndroidDevice device = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
			BackupRestoreProcessor backupRestoreProcessor = new BackupRestoreProcessor();
			List<string> resourcesType = CategoriesViewModel.Categories.Select((CategoryViewModel m) => m.ResourceType).ToList();
			backupRestoreProcessor.LoadDeviceIdAndSizeV2(device, resourcesType, IsInternalStorage, delegate(string k, Dictionary<string, long> v)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						CategoryViewModel categoryViewModel = CategoriesViewModel.Categories.First((CategoryViewModel n) => n.ResourceType == k);
						((ComboBoxModel)categoryViewModel).CountNum = v.Count;
						categoryViewModel.Count = v.Count;
						categoryViewModel.IdAndSizeMapping = v;
					});
				}
			}, delegate(string k, List<JObject> v)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						CategoryViewModel found = CategoriesViewModel.Categories.First((CategoryViewModel n) => n.ResourceType == k);
						List<CategoryViewModel> childList = new List<CategoryViewModel>();
						if (v != null && v.Count > 0)
						{
							v.ForEach(delegate(JObject n)
							{
								if (n != null && ((JToken)n).HasValues)
								{
									string text = ((JToken)n).Value<string>((object)"name");
									string path = ((JToken)n).Value<string>((object)"path");
									text = text.Substring(text.LastIndexOf("/") + 1);
									JToken value = n.GetValue("idSizeMap");
									Dictionary<string, long> dictionary = new Dictionary<string, long>();
									if (value != null && value.HasValues)
									{
										dictionary = JsonHelper.DeserializeJson2Object<Dictionary<string, long>>(((object)value).ToString());
									}
									CategoryViewModel categoryViewModel = new CategoryViewModel();
									((ComboBoxModel)categoryViewModel).Key = text;
									((ComboBoxModel)categoryViewModel).Parent = (ComboBoxModel)(object)found;
									((ComboBoxModel)categoryViewModel).Path = path;
									((ComboBoxModel)categoryViewModel).CountNum = dictionary.Count;
									categoryViewModel.IdAndSizeMapping = dictionary;
									CategoryViewModel categoryViewModel2 = categoryViewModel;
									categoryViewModel2.SubItemVisible = (Visibility)0;
									childList.Add(categoryViewModel2);
								}
							});
						}
						int num = childList.Sum((CategoryViewModel p) => ((ComboBoxModel)p).CountNum);
						((ComboBoxModel)found).CountNum = num;
						found.Count = num;
						((ComboBoxModel)found).Childs = new ObservableCollection<ComboBoxModel>((IEnumerable<ComboBoxModel>)childList);
						((ComboBoxModel)found).ToggleButtonVisibility = (Visibility)((num <= 0) ? 2 : 0);
					});
				}
			}, delegate
			{
				_IsLoading = false;
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						CategoryViewModel categoryViewModel = CategoriesViewModel.Categories.FirstOrDefault((CategoryViewModel n) => n.ResourceType == "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}");
						if (((categoryViewModel != null) ? ((ComboBoxModel)categoryViewModel).Childs : null) != null && ((ComboBoxModel)categoryViewModel).Childs.Count == 1)
						{
							((ComboBoxModel)categoryViewModel).Key = ((ComboBoxModel)categoryViewModel).Childs.First().Key;
							((ComboBoxModel)categoryViewModel).CountNum = ((ComboBoxModel)categoryViewModel).CountNum;
						}
						LoadResourceByStorage();
						CategoriesViewModel.LoadingProcessVisibility = (Visibility)2;
					});
				}
			});
		}

		private void SetBackupButtonIsEnable()
		{
			IsEnabled = _SelectedCount > 0 && !string.IsNullOrEmpty(StoragePath);
		}

		private async void BackupCommandHandler(object parameter)
		{
			if (string.IsNullOrEmpty(StoragePath))
			{
				return;
			}
			Dictionary<string, Dictionary<string, long>> selResTypeArr = new Dictionary<string, Dictionary<string, long>>();
			foreach (CategoryViewModel item in CategoriesViewModel.Categories.Where((CategoryViewModel n) => n.IsSelected))
			{
				if (item.IsSelected)
				{
					Dictionary<string, long> idAndSizeMapping = item.IdAndSizeMapping;
					if (idAndSizeMapping != null && idAndSizeMapping.Count > 0)
					{
						Dictionary<string, long> value = item.IdAndSizeMapping.ToDictionary((KeyValuePair<string, long> p) => p.Key, (KeyValuePair<string, long> p) => p.Value);
						selResTypeArr.Add(item.ResourceType, value);
						continue;
					}
				}
				ObservableCollection<ComboBoxModel> childs = ((ComboBoxModel)item).Childs;
				if (childs != null && childs.Count > 0)
				{
					Dictionary<string, long> value2 = (from p in ((ComboBoxModel)item).Childs.OfType<CategoryViewModel>()
						where p.IsSelected
						select p).SelectMany((CategoryViewModel p) => p.IdAndSizeMapping).ToDictionary((KeyValuePair<string, long> p) => p.Key, (KeyValuePair<string, long> p) => p.Value);
					selResTypeArr.Add(item.ResourceType, value2);
				}
			}
			if (selResTypeArr.Count == 0)
			{
				LogHelper.LogInstance.Debug("click backup button, selectedResourcesType is null", false);
				await MessageWindowHelper.Instance.Show("K0711", "K1252", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				return;
			}
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice device = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (device != null && (int)((DeviceEx)device).ConnectType == 4 && await MessageWindowHelper.Instance.Show("K0711", "K1440", "K0612", "K0208", false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false) == false)
			{
				return;
			}
			Check(async delegate
			{
				Action<string> task = async delegate(string password)
				{
					if (!GlobalFun.Exists(StoragePath))
					{
						FolderBrowserDialog val = new FolderBrowserDialog();
						val.SelectedPath = Configurations.BackupPath;
						val.ShowNewFolderButton = true;
						val.Description = HostProxy.LanguageService.Translate("Please select a new save path");
						if (1 != (int)((CommonDialog)val).ShowDialog())
						{
							return;
						}
						StoragePath = val.SelectedPath;
						Configurations.BackupPath = StoragePath;
					}
					NotesTextBoxVisibility = false;
					LogHelper.LogInstance.Info("========================backup start===========================", false);
					string text = Path.Combine(StoragePath, DateTime.Now.ToString("yyyyMMddHHmmss") + ".mabk");
					HostProxy.ResourcesLoggingService.RegisterFile(text);
					retryselectedTypes = new Dictionary<string, List<string>>();
					FileInfo fileInfo = new FileInfo(text);
					doRetry = false;
					new List<string>();
					List<string> list = new List<string>();
					List<string> _removeResTypeKeys = new List<string>();
					List<string> list2 = new List<string>();
					_ = string.Empty;
					BackupRestoreProcessor backupRestoreProcessor = new BackupRestoreProcessor();
					foreach (KeyValuePair<string, Dictionary<string, long>> _tmpResType in selResTypeArr)
					{
						list2.Clear();
						foreach (KeyValuePair<string, long> item2 in _tmpResType.Value)
						{
							if (item2.Value > 4294967296L)
							{
								LogHelper.LogInstance.Warn("The file is larger than 4G in size. key:[" + item2.Key + "] size:[" + GlobalFun.ConvertLong2String(item2.Value, "F1", true) + "].", false);
								list2.Add(item2.Key);
								list.Add(backupRestoreProcessor.GetFileFullPathById(device, _tmpResType.Key, item2.Key));
							}
						}
						list2.ForEach(delegate(string m)
						{
							_tmpResType.Value.Remove(m);
						});
						if (_tmpResType.Value.Count == 0)
						{
							_removeResTypeKeys.Add(_tmpResType.Key);
						}
						LogHelper.LogInstance.Debug(string.Format("backup resources type:[{0}], file count:[{1}], file total size:[{2}].", ResourceTypeDefine.ResourceTypeMap[_tmpResType.Key], _tmpResType.Value.Count, GlobalFun.ConvertLong2String(_tmpResType.Value.Sum((KeyValuePair<string, long> n) => n.Value), "F1", true)), false);
					}
					if (list.Count > 0)
					{
						File.WriteAllText(Configurations.TRANSFER_FILE_ERROR_TXT_PATH, string.Join(Environment.NewLine, list));
						Larger4GBDialogView val2 = new Larger4GBDialogView(0);
						await MessageWindowHelper.Instance.Show((IMessageViewV6)(object)val2, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true);
					}
					_removeResTypeKeys.ForEach(delegate(string m)
					{
						selResTypeArr.Remove(m);
					});
					if (selResTypeArr.Count > 0)
					{
						BackupMainViewModel backupMainViewModel = this;
						DeviceEx masterDevice2 = HostProxy.deviceManager.MasterDevice;
						await backupMainViewModel.DoBackupEx((TcpAndroidDevice)(object)((masterDevice2 is TcpAndroidDevice) ? masterDevice2 : null), selResTypeArr, fileInfo, password);
					}
				};
				if (!IsEncryptBackup)
				{
					task(string.Empty);
				}
				else
				{
					SetPasswordViewModel vm = new SetPasswordViewModel();
					SetPasswordWindow setPasswordWindow = new SetPasswordWindow();
					((FrameworkElement)setPasswordWindow).DataContext = vm;
					SetPasswordWindow setPasswordWindow2 = setPasswordWindow;
					bool? flag = await MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)setPasswordWindow2, (bool?)true);
					if (flag == true)
					{
						task(vm.PassWord);
					}
					else if (flag == false && await MessageWindowHelper.Instance.Show("K0800", "K0796", "K0612", "K0208", false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false) == true)
					{
						task(null);
					}
				}
			});
		}

		public async Task DoBackupEx(TcpAndroidDevice currentDevice, Dictionary<string, Dictionary<string, long>> selectedTypes, FileInfo storageFileInfo, string password)
		{
			if (currentDevice == null || ((DeviceEx)currentDevice).Property == null)
			{
				return;
			}
			IAndroidDevice property = ((DeviceEx)currentDevice).Property;
			string id = Guid.NewGuid().ToString();
			BackupDescription description = new BackupDescription
			{
				Id = id,
				ModelName = property.ModelName,
				AndroidVersion = property.AndroidVersion,
				BackupDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
				BuildNumber = property.CustomerVersion,
				Notes = NotesValue,
				Category = (((DeviceEx)currentDevice).Property.Category ?? "phone"),
				StoragePath = storageFileInfo.FullName
			};
			AsyncTaskContext taskContext = new AsyncTaskContext((object)null);
			backupWorker = new DeviceBackupWorkerEx(currentDevice, (IAsyncTaskContext)(object)taskContext, storageFileInfo, description);
			try
			{
				backupWorker.PrepareWorker(selectedTypes, password);
			}
			catch (Exception ex)
			{
				if (ex.HResult == -2147024857 || ex.HResult == -2147024784)
				{
					await MessageWindowHelper.Instance.Show("K0071", "K0784", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
					return;
				}
			}
			WorkTransferWindowWrapper progress = new WorkTransferWindowWrapper(Context.CurrentDevice.Property.ModelName, "K1397", "K1400", true);
			VM = progress.Vm;
			Context.RsaMainWindow.ChangeIsEnabled(false, "13f79fe4cfc98747c78794a943886bcd");
			BackupRestoreMainViewModel mv11 = HostProxy.ViewContext.FindViewModel<BackupRestoreMainViewModel>(typeof(BackupRestoreMainView), (string)null);
			if (mv11 != null)
			{
				mv11.TitleBarlVisible = (Visibility)2;
				mv11.BtnHelpGuidelVisible = (Visibility)2;
			}
			BusinessData businessData = new BusinessData((BusinessType)2010, (DeviceEx)(object)currentDevice, (BusinessStatus)0);
			progress.OnRetryCommandFired = delegate
			{
				if (retryselectedTypes.Count > 0)
				{
					LogHelper.LogInstance.Info("========================backup retry===========================", false);
					LogHelper.LogInstance.Debug("retry data:[" + JsonHelper.SerializeObject2Json((object)retryselectedTypes) + "]", false);
					doRetry = true;
					int num = retryselectedTypes.Sum((KeyValuePair<string, List<string>> m) => m.Value.Count);
					progress.Init(num);
					Task.Factory.StartNew(delegate
					{
						backupWorker.RetryCallback?.Invoke(retryselectedTypes);
					});
				}
			};
			progress.CompletedCallback = delegate
			{
				progress.UpdateResultTitle("K1399", "#005D7F");
				LogHelper.LogInstance.Info("========================backup end===========================", false);
			};
			progress.BeginProcess((Action<WorkTransferWindowWrapper>)async delegate(WorkTransferWindowWrapper self)
			{
				bool spaceNoteEnough = false;
				bool isCancel = false;
				bool isFailed = false;
				self.OnCancelCmmandFired = delegate
				{
					isCancel = true;
					LogHelper.LogInstance.Info("========================backup cancel===========================", false);
					Context.IsNoNeedRefresh = true;
				};
				self.ProgressMaxValue = selectedTypes.Sum((KeyValuePair<string, Dictionary<string, long>> m) => m.Value.Count);
				self.CloseWindowCallback = async delegate(int code)
				{
					if (code == -1)
					{
						CycleTime = (DateTime.Now - startBackTime).Seconds;
					}
					if (executeResult.HasFailedUndo && HostProxy.GlobalCache.Get("BackupRestoreHasFailed") == null)
					{
						HostProxy.GlobalCache.AddOrUpdate("BackupRestoreHasFailed", (object)true);
					}
					sw.Stop();
					BusinessData val = businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)((code == -1) ? 30 : ((executeResult.Status == 1) ? 10 : 20)), (object)null);
					HostProxy.BehaviorService.Collect((BusinessType)2010, val);
					SysSleepManager.ResetSleep();
					if (backupWorker != null)
					{
						backupWorker?.Dispose();
						backupWorker = null;
					}
					if (executeResult.Status == 1 && !isFailed && !isCancel && !spaceNoteEnough)
					{
						description.StorageSize = storageFileInfo.Length;
						await new DeviceBackupMgt().AddOrUpdateBackup(description);
						Configurations.BackupLastDateTime = Convert.ToDateTime(description.BackupDateTime);
					}
					taskContext.Cancel();
					Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
					if (currentDispatcher != null)
					{
						currentDispatcher.Invoke((Action)async delegate
						{
							NotesTextBoxVisibility = true;
							IsEncryptBackup = true;
							if (code == 1 && !isFailed && await MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)new BackupTips(), (bool?)true) == true)
							{
								HostProxy.HostNavigation.SwitchTo("8ab04aa975e34f1ca4f9dc3a81374e2c", (object)"mydevicerescue");
							}
						});
					}
					UploadBackDataLogToSite();
					((ViewModelBase)this).LoadData();
					if (mv11 != null)
					{
						mv11.TitleBarlVisible = (Visibility)0;
						mv11.BtnHelpGuidelVisible = (Visibility)0;
					}
					Context.RsaMainWindow.ChangeIsEnabled(true, "13f79fe4cfc98747c78794a943886bcd");
					if (Context.CurrentDevice == null || (Context.CurrentDevice != null && (int)Context.CurrentDevice.SoftStatus != 2))
					{
						Context.CurrentRestoreViewType = ViewType.MAIN;
						Context.Switch(ViewType.START);
					}
					LogHelper.LogInstance.Debug("refresh backup data.", false);
				};
				try
				{
					string resourceType_Ref = string.Empty;
					Context.RegisterWorker(backupWorker);
					backupWorker.ResourceTypeStartBackupCallback = delegate(string resourceType, int count)
					{
						HostProxy.CurrentDispatcher.Invoke((Action)delegate
						{
							resourceType_Ref = sBackupProgressResourceTypeTitleMapping[resourceType];
							LogHelper.LogInstance.Info("start backup resource type:[" + resourceType_Ref + "].", false);
							if (!doRetry)
							{
								self.SetSubProgressInfo(resourceType_Ref, count);
							}
							else
							{
								HostProxy.CurrentDispatcher.Invoke((Action)delegate
								{
									self.ChangeCurrentDeatilsGroupViewMode(resourceType_Ref, count);
								});
							}
						});
					};
					backupWorker.ResourceItemFinishBackupCallback = delegate(string resType, string text, string path, BackupRestoreResult _result)
					{
						//IL_0017: Unknown result type (might be due to invalid IL or missing references)
						//IL_0035: Unknown result type (might be due to invalid IL or missing references)
						//IL_0121: Unknown result type (might be due to invalid IL or missing references)
						//IL_0112: Unknown result type (might be due to invalid IL or missing references)
						executeResult.Update(resType, 1, _result, doRetry);
						if ((int)_result == 0)
						{
							if (doRetry)
							{
								self.RetrySuccess(text, path);
							}
							else
							{
								self.AddSuccessCount(text, 1);
							}
						}
						else
						{
							isFailed = true;
							if (!string.IsNullOrEmpty(text))
							{
								if (retryselectedTypes.ContainsKey(resType))
								{
									List<string> list = retryselectedTypes[resType];
									if (!list.Contains(text))
									{
										list.Add(text);
									}
								}
								else
								{
									retryselectedTypes.Add(resType, new List<string> { text });
								}
							}
							if (!doRetry)
							{
								self.AddFailCount(resType, text, path, 1, _result);
							}
							else
							{
								self.RetryFailed(1, _result);
							}
						}
					};
					backupWorker.ResourceItemBackupProgressCallback = delegate(string resType, string name, int rl, long rt, long len)
					{
						HostProxy.CurrentDispatcher.Invoke((Action)delegate
						{
							self.UpdateRate(name, rt, len);
						});
					};
					executeResult = new ResourceExecuteResult();
					executeResult.SetIsInternal(IsInternalStorage);
					sw = new Stopwatch();
					sw.Start();
					SysSleepManager.PreventSleep();
					startBackTime = DateTime.Now;
					BackupMainViewModel backupMainViewModel = this;
					DeviceEx currentDevice2 = Context.CurrentDevice;
					backupMainViewModel.locConnecRestoreDevice = (TcpAndroidDevice)(object)((currentDevice2 is TcpAndroidDevice) ? currentDevice2 : null);
					backupWorker.DoProcess(null);
					CycleTime = (DateTime.Now - startBackTime).Seconds;
				}
				catch (Exception ex2)
				{
					isFailed = true;
					spaceNoteEnough = ex2.HResult == -2147024857 || ex2.HResult == -2147024784;
					if (!isCancel)
					{
						LogHelper.LogInstance.Error("backup exception:", ex2, false);
						self.Finish();
					}
					GlobalFun.TryDeleteFile(storageFileInfo.FullName);
				}
				if (spaceNoteEnough)
				{
					self.StopAndCloseWindow();
					await MessageWindowHelper.Instance.Show("K0071", "K0784", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				}
				if (isCancel)
				{
					GlobalFun.TryDeleteFile(storageFileInfo.FullName);
				}
			});
		}

		public backupRestoreComponents ConvertModelValueToComponent(KeyValuePair<string, Dictionary<string, int>> valuePair)
		{
			return new backupRestoreComponents
			{
				componentType = valuePair.Key.ToUpper(),
				success = valuePair.Value["success"],
				failed = valuePair.Value["failed"],
				undo = valuePair.Value["undo"],
				undoDisconnected = valuePair.Value["undo_disconnected"]
			};
		}

		public string GetMarktNameByModelName(string modelname)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			dictionary.Add("modelName", modelname);
			DeviceModelInfoModel deviceModelInfoModel = new ApiService().RequestContent<DeviceModelInfoModel>(WebApiUrl.GET_FASTBOOTDATA_RECIPE, (object)dictionary, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
			if (deviceModelInfoModel != null)
			{
				return deviceModelInfoModel.MarketName;
			}
			return modelname;
		}

		private void UploadBackDataLogToSite()
		{
			Context.IsNoNeedRefresh = true;
			Task.Run(delegate
			{
				//IL_0258: Unknown result type (might be due to invalid IL or missing references)
				//IL_0115: Unknown result type (might be due to invalid IL or missing references)
				//IL_011a: Unknown result type (might be due to invalid IL or missing references)
				lmsa_record_backup_restore lmsa_record_backup_restore2 = new lmsa_record_backup_restore();
				Dictionary<string, Dictionary<string, int>> resultMap = executeResult.ResultMap;
				KeyValuePair<string, Dictionary<string, int>> keyValuePair = resultMap.FirstOrDefault((KeyValuePair<string, Dictionary<string, int>> x) => x.Key == "Setting");
				int settingIsInternal = ((keyValuePair.Value != null) ? keyValuePair.Value["IsInternal"] : 0);
				TcpAndroidDevice val = locConnecRestoreDevice;
				foreach (KeyValuePair<string, Dictionary<string, int>> item in resultMap)
				{
					if (ResourceTypeDefine.ResourceTypeMap.FirstOrDefault((KeyValuePair<string, string> x) => x.Value == item.Key).Value != null)
					{
						lmsa_record_backup_restore2.backupRestoreComponents.Add(ConvertModelValueToComponent(item));
					}
				}
				if (val != null)
				{
					lmsa_record_backup_restore2.androidVersion = ((DeviceEx)val).Property.AndroidVersion;
					lmsa_record_backup_restore2.appType = ((DeviceEx)val).ConnectedAppType;
					lmsa_record_backup_restore2.batteryQuantityPercentage = (int)((DeviceEx)val).Property.BatteryQuantityPercentage;
					lmsa_record_backup_restore2.brand = ((DeviceEx)val).Property.Brand;
					lmsa_record_backup_restore2.connectType = ((object)((DeviceEx)val).ConnectType/*cast due to .constrained prefix*/).ToString();
					lmsa_record_backup_restore2.externalStoragePath = ((DeviceEx)val).Property.ExternalStoragePath;
					lmsa_record_backup_restore2.freeExternalStorage = ((DeviceEx)val).Property.FreeExternalStorage;
					lmsa_record_backup_restore2.freeInternalStorage = ((DeviceEx)val).Property.FreeInternalStorage;
					lmsa_record_backup_restore2.imei1 = ((DeviceEx)val).Property.IMEI1;
					lmsa_record_backup_restore2.imei2 = ((DeviceEx)val).Property.IMEI2;
					lmsa_record_backup_restore2.internalStoragePath = ((DeviceEx)val).Property.InternalStoragePath;
					lmsa_record_backup_restore2.modelName = ((DeviceEx)val).Property.ModelName;
					lmsa_record_backup_restore2.marketName = GetMarktNameByModelName(((DeviceEx)val).Property.ModelName);
					lmsa_record_backup_restore2.sn = ((DeviceEx)val).Property.SN;
					lmsa_record_backup_restore2.totalExternalStorage = ((DeviceEx)val).Property.TotalExternalStorage;
					lmsa_record_backup_restore2.totalInternalStorage = ((DeviceEx)val).Property.TotalInternalStorage;
					lmsa_record_backup_restore2.usedExternalStorage = ((DeviceEx)val).Property.UsedExternalStorage;
					lmsa_record_backup_restore2.usedInternalStorage = ((DeviceEx)val).Property.UsedInternalStorage;
				}
				lmsa_record_backup_restore2.backupRestoreType = "BACKUPRESTORE_BACKUP";
				lmsa_record_backup_restore2.clientDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
				lmsa_record_backup_restore2.cycleTime = CycleTime;
				lmsa_record_backup_restore2.settingIsInternal = settingIsInternal;
				lmsa_record_backup_restore2.country = GlobalFun.GetRegionInfo().TwoLetterISORegionName;
				ResponseModel<object> val2 = ((ApiBaseService)new ApiService()).RequestBase(WebApiUrl.FEEDBACK_BACKUP_RESTORE, (object)lmsa_record_backup_restore2, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				if (!val2.success)
				{
					LogHelper.LogInstance.Info("UploadBackDataLogToSite failed Message:" + val2.desc, false);
				}
			});
		}

		private void Check(Action<bool> callback, bool isRetry = true)
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice currentDevice = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (((DeviceEx)currentDevice).ConnectedAppType == "Ma")
			{
				callback?.Invoke(obj: true);
				return;
			}
			currentDevice.CallAppToFrontstage();
			CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
			CancellationToken cancellationToken = cancellationTokenSource.Token;
			UserConsentWindow ucwin = new UserConsentWindow(cancellationTokenSource);
			MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)ucwin, (bool?)true);
			Task<Result> task1 = Task.Run(() => DoTask(currentDevice, cancellationToken), cancellationToken);
			Task.Run(delegate
			{
				//IL_0090: Unknown result type (might be due to invalid IL or missing references)
				//IL_0096: Invalid comparison between Unknown and I4
				Result result = Result.Unknown;
				if (task1.Wait(300000))
				{
					result = task1.Result;
				}
				else
				{
					cancellationTokenSource.Cancel();
				}
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					((Window)ucwin).Close();
				});
				switch (result)
				{
				case Result.Allow:
					callback(obj: true);
					break;
				case Result.Deny:
					if (currentDevice != null && (object)currentDevice == HostProxy.deviceManager.MasterDevice && (int)((DeviceEx)currentDevice).SoftStatus == 2)
					{
						MessageWindowHelper.Instance.Show("K0711", "K0791", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
					}
					break;
				}
			});
		}

		private Result DoTask(TcpAndroidDevice currentDevice, CancellationToken cancellationToken, int pollingTimeout = 10000)
		{
			//IL_0004: Unknown result type (might be due to invalid IL or missing references)
			//IL_000a: Invalid comparison between Unknown and I4
			//IL_0118: Unknown result type (might be due to invalid IL or missing references)
			//IL_011e: Invalid comparison between Unknown and I4
			if (currentDevice == null || (int)((DeviceEx)currentDevice).SoftStatus != 2 || cancellationToken.IsCancellationRequested)
			{
				return Result.Unknown;
			}
			try
			{
				ISequence sequence = HostProxy.Sequence;
				List<PropItem> list = null;
				string text = "obtainUserConsent";
				string responseAction = MessageConstant.getResponseAction(text);
				do
				{
					long num = sequence.New();
					MessageReaderAndWriter val = currentDevice.MessageManager.CreateMessageReaderAndWriter(0);
					try
					{
						if (cancellationToken.IsCancellationRequested)
						{
							return Result.Unknown;
						}
						if (val.Send<string>(text, new List<string> { "Backup" }, num) && val.Receive<PropItem>(responseAction, ref list, pollingTimeout) && list != null && list.Count > 0 && !cancellationToken.IsCancellationRequested)
						{
							if (list.Exists((PropItem m) => "1".Equals(m.Value)))
							{
								return Result.Allow;
							}
							if (list.Exists((PropItem m) => "0".Equals(m.Value)))
							{
								LogHelper.LogInstance.Info("User refuses backup authorization", false);
								return Result.Deny;
							}
						}
					}
					finally
					{
						((IDisposable)val)?.Dispose();
					}
				}
				while (!cancellationToken.IsCancellationRequested && currentDevice != null && (int)((DeviceEx)currentDevice).PhysicalStatus == 2);
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("backup authorization error", ex, false);
			}
			return Result.Unknown;
		}

		private void ModifyButtonClickCommandHandler(object parameter)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Invalid comparison between I4 and Unknown
			FolderBrowserDialog val = new FolderBrowserDialog();
			val.SelectedPath = Configurations.BackupPath;
			val.ShowNewFolderButton = true;
			if (1 == (int)((CommonDialog)val).ShowDialog())
			{
				StoragePath = val.SelectedPath;
				Configurations.BackupPath = StoragePath;
			}
		}

		private void ViewButtonClickCommandHandler(object parameter)
		{
			try
			{
				NotesTextBoxVisibility = true;
				if (Directory.Exists(StoragePath))
				{
					Process.Start(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Windows), "explorer.exe"), StoragePath);
				}
			}
			catch (Exception)
			{
			}
		}
	}
	public class BackupRestoreMainViewModel : ViewModelBase, ILoading
	{
		private readonly object loadingLock = new object();

		private List<object> _LoadintCounter;

		private Visibility _TitleBarlVisible;

		private Visibility _btnHelpGuidelVisible;

		private ListViewItemModel _SelectedItem;

		private object _currentView;

		private Visibility _loadingViewVisibility = (Visibility)2;

		protected SdCardViewModel sdCarVm;

		public ObservableCollection<ListViewItemModel> CategoryList { get; set; }

		public Visibility TitleBarlVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _TitleBarlVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_TitleBarlVisible = value;
				((NotifyBase)this).OnPropertyChanged("TitleBarlVisible");
			}
		}

		public Visibility BtnHelpGuidelVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _btnHelpGuidelVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0030: Unknown result type (might be due to invalid IL or missing references)
				_btnHelpGuidelVisible = value;
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				if (((masterDevice != null) ? masterDevice.Property.Category : null) == "tablet")
				{
					_btnHelpGuidelVisible = (Visibility)1;
				}
				((NotifyBase)this).OnPropertyChanged("BtnHelpGuidelVisible");
			}
		}

		public ListViewItemModel SelectedItem
		{
			get
			{
				return _SelectedItem;
			}
			set
			{
				if (_SelectedItem == value)
				{
					return;
				}
				_SelectedItem = value;
				if (_SelectedItem != null && _SelectedItem.Id == 1)
				{
					SdCarVm.StorageSelVisible = (Visibility)1;
					TabChanged(Context.CurrentRestoreViewType);
				}
				else
				{
					DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
					if (((masterDevice != null) ? masterDevice.ConnectedAppType : null) == "Ma")
					{
						SdCarVm.StorageSelIndex = 0;
						SdCarVm.StorageSelVisible = (Visibility)0;
					}
					else
					{
						SdCarVm.StorageSelIndex = -1;
						SdCarVm.StorageSelVisible = (Visibility)1;
					}
					TabChanged(ViewType.BACKUPMAIN);
				}
				((NotifyBase)this).OnPropertyChanged("SelectedItem");
			}
		}

		public object CurrentView
		{
			get
			{
				return _currentView;
			}
			set
			{
				_currentView = value;
				((NotifyBase)this).OnPropertyChanged("CurrentView");
			}
		}

		public Visibility LoadingViewVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _loadingViewVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (_loadingViewVisibility != value)
				{
					_loadingViewVisibility = value;
					((NotifyBase)this).OnPropertyChanged("LoadingViewVisibility");
				}
			}
		}

		public SdCardViewModel SdCarVm
		{
			get
			{
				return sdCarVm;
			}
			set
			{
				sdCarVm = value;
				((NotifyBase)this).OnPropertyChanged("SdCarVm");
			}
		}

		public BackupRestoreMainViewModel()
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Expected O, but got Unknown
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0066: Expected O, but got Unknown
			//IL_007c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Expected O, but got Unknown
			SdCarVm = new SdCardViewModel();
			SdCarVm.StorageSelIndex = -1;
			SdCarVm.StorageSelVisible = (Visibility)1;
			CategoryList = new ObservableCollection<ListViewItemModel>();
			CategoryList.Add(new ListViewItemModel(0, "K0594", "v6_icon_backup", "v6_icon_backup_selected"));
			CategoryList.Add(new ListViewItemModel(1, "K0595", "v6_icon_restore", "v6_icon_restore_selected"));
			_LoadintCounter = new List<object>();
			Context.Level2Frame = this;
		}

		public override void LoadData(object data)
		{
			InitSdCard();
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke<ListViewItemModel>((Func<ListViewItemModel>)(() => SelectedItem = CategoryList.First()));
			}
			((ViewModelBase)this).LoadData(data);
		}

		public void InitSdCard()
		{
			((ViewModelBase)SdCarVm).LoadData((object)Context.CurrentDevice);
		}

		public void Show(object handler)
		{
			lock (loadingLock)
			{
				if (!_LoadintCounter.Contains(handler))
				{
					_LoadintCounter.Add(handler);
					LoadingViewVisibility = (Visibility)0;
				}
			}
		}

		public void Hiden(object handler)
		{
			lock (loadingLock)
			{
				if (_LoadintCounter.Contains(handler))
				{
					_LoadintCounter.Remove(handler);
					LoadingViewVisibility = (Visibility)((_LoadintCounter.Count == 0) ? 2 : 0);
				}
			}
		}

		public void Abort()
		{
			lock (loadingLock)
			{
				_LoadintCounter.Clear();
				LoadingViewVisibility = (Visibility)2;
			}
		}

		private void TabChanged(ViewType viewType)
		{
			bool reload = true;
			if (Convert.ToInt32(viewType) == 31)
			{
				reload = false;
			}
			Context.Switch(viewType, null, reload, level2: true);
		}
	}
	public class CategoriesViewModel : ViewModelBase
	{
		private double _progressBarMinimum;

		private double _progressBarMaximum = 100.0;

		private double _progressBarValue;

		private bool _isTransferring;

		private bool _isEnabled = true;

		private Visibility _LoadingProcessVisibility = (Visibility)2;

		private CategoryViewModel _SelectedItem;

		public ReplayCommand ToggleCilckCommand { get; }

		public double ProgressBarMinimum
		{
			get
			{
				return _progressBarMinimum;
			}
			set
			{
				if (_progressBarMinimum != value)
				{
					_progressBarMinimum = value;
					((NotifyBase)this).OnPropertyChanged("ProgressBarMinimum");
				}
			}
		}

		public double ProgressBarMaximum
		{
			get
			{
				return _progressBarMaximum;
			}
			set
			{
				if (_progressBarMaximum != value)
				{
					_progressBarMaximum = value;
					((NotifyBase)this).OnPropertyChanged("ProgressBarMaximum");
				}
			}
		}

		public double ProgressBarValue
		{
			get
			{
				return _progressBarValue;
			}
			set
			{
				if (_progressBarValue != value)
				{
					_progressBarValue = value;
					((NotifyBase)this).OnPropertyChanged("ProgressBarValue");
				}
			}
		}

		public bool IsTransferring
		{
			get
			{
				return _isTransferring;
			}
			set
			{
				if (_isTransferring != value)
				{
					_isTransferring = value;
					((NotifyBase)this).OnPropertyChanged("IsTransferring");
				}
			}
		}

		public bool IsEnabled
		{
			get
			{
				return _isEnabled;
			}
			set
			{
				if (_isEnabled != value)
				{
					_isEnabled = value;
					((NotifyBase)this).OnPropertyChanged("IsEnabled");
				}
			}
		}

		protected static bool IsMotoHelper
		{
			get
			{
				if (Context.CurrentDevice != null)
				{
					return Context.CurrentDevice.ConnectedAppType == "Moto";
				}
				return false;
			}
		}

		public Visibility LoadingProcessVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _LoadingProcessVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (_LoadingProcessVisibility != value)
				{
					_LoadingProcessVisibility = value;
					((NotifyBase)this).OnPropertyChanged("LoadingProcessVisibility");
				}
			}
		}

		public List<CategoryViewModel> CategoriesList { get; private set; }

		public ObservableCollection<CategoryViewModel> Categories { get; set; }

		public CategoryViewModel SelectedItem
		{
			get
			{
				return _SelectedItem;
			}
			set
			{
				_SelectedItem = value;
				FireCategorySelectionChanged(this, null);
				((NotifyBase)this).OnPropertyChanged("SelectedItem");
			}
		}

		public event EventHandler<CategorySelectionChangedEventArgs> CategorySelectionChanged;

		public CategoriesViewModel(bool isBackup)
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Expected O, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			//IL_0130: Unknown result type (might be due to invalid IL or missing references)
			//IL_013a: Expected O, but got Unknown
			//IL_014a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0154: Expected O, but got Unknown
			//IL_0200: Unknown result type (might be due to invalid IL or missing references)
			//IL_020a: Expected O, but got Unknown
			//IL_021a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0224: Expected O, but got Unknown
			//IL_0296: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a0: Expected O, but got Unknown
			//IL_02b0: Unknown result type (might be due to invalid IL or missing references)
			//IL_02ba: Expected O, but got Unknown
			//IL_0366: Unknown result type (might be due to invalid IL or missing references)
			//IL_0370: Expected O, but got Unknown
			//IL_0380: Unknown result type (might be due to invalid IL or missing references)
			//IL_038a: Expected O, but got Unknown
			//IL_03fc: Unknown result type (might be due to invalid IL or missing references)
			//IL_0406: Expected O, but got Unknown
			//IL_0416: Unknown result type (might be due to invalid IL or missing references)
			//IL_0420: Expected O, but got Unknown
			//IL_0492: Unknown result type (might be due to invalid IL or missing references)
			//IL_049c: Expected O, but got Unknown
			//IL_04ac: Unknown result type (might be due to invalid IL or missing references)
			//IL_04b6: Expected O, but got Unknown
			Categories = new ObservableCollection<CategoryViewModel>();
			ToggleCilckCommand = new ReplayCommand((Action<object>)ToggleCilckCommandHandler);
			List<CategoryViewModel> list = new List<CategoryViewModel>();
			CategoryViewModel obj = new CategoryViewModel
			{
				CenterIconSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Sms"),
				CenterIconUnSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Sms")
			};
			((ComboBoxModel)obj).CountNum = 0;
			obj.Title = "K0479";
			obj.IsSelected = false;
			((ComboBoxModel)obj).IsChecked = false;
			obj.IsEnabled = true;
			obj.Opacity = (IsMotoHelper ? 0.5 : 1.0);
			obj.ResourceType = "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}";
			obj.SubTitle = (isBackup ? "K1516" : "K1402");
			obj.CategoryClickAction = FireAndroid15CategoryClickAction;
			((ComboBoxModel)obj).ToggleButtonVisibility = (Visibility)2;
			((ComboBoxModel)obj).Key = LangTranslation.Translate("K0479");
			list.Add(obj);
			CategoryViewModel obj2 = new CategoryViewModel
			{
				CenterIconSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Calllog"),
				CenterIconUnSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Calllog")
			};
			((ComboBoxModel)obj2).CountNum = 0;
			obj2.Title = "K1628";
			obj2.IsSelected = false;
			((ComboBoxModel)obj2).IsChecked = false;
			obj2.IsEnabled = true;
			obj2.Opacity = (IsMotoHelper ? 0.5 : 1.0);
			obj2.SubTitle = (isBackup ? "K1516" : "K1402");
			obj2.ResourceType = "{89D4DB68-4258-4002-8557-E65959C558B3}";
			((ComboBoxModel)obj2).ToggleButtonVisibility = (Visibility)2;
			obj2.CategoryClickAction = FireCategoryClickAction;
			((ComboBoxModel)obj2).Key = LangTranslation.Translate("K0509");
			list.Add(obj2);
			CategoryViewModel obj3 = new CategoryViewModel
			{
				CenterIconSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Contacts"),
				CenterIconUnSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Contacts")
			};
			((ComboBoxModel)obj3).CountNum = 0;
			obj3.Title = "K0478";
			obj3.IsSelected = false;
			((ComboBoxModel)obj3).IsChecked = false;
			obj3.SubTitle = (isBackup ? "K1516" : "K1402");
			obj3.ResourceType = "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}";
			((ComboBoxModel)obj3).ToggleButtonVisibility = (Visibility)2;
			((ComboBoxModel)obj3).Key = LangTranslation.Translate("K0478");
			list.Add(obj3);
			CategoryViewModel obj4 = new CategoryViewModel
			{
				CenterIconSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Files"),
				CenterIconUnSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Files")
			};
			((ComboBoxModel)obj4).CountNum = 0;
			obj4.Title = "K1517";
			((ComboBoxModel)obj4).IsChecked = false;
			obj4.IsSelected = false;
			obj4.IsEnabled = true;
			obj4.Opacity = (IsMotoHelper ? 0.5 : 1.0);
			obj4.ResourceType = "{580C48C8-6CEF-4BBB-AF37-D880B349D142}";
			obj4.SubTitle = (isBackup ? "K1516" : "K1402");
			((ComboBoxModel)obj4).ToggleButtonVisibility = (Visibility)2;
			obj4.CategoryClickAction = FireCategoryClickAction;
			((ComboBoxModel)obj4).Key = LangTranslation.Translate("K1517");
			list.Add(obj4);
			CategoryViewModel obj5 = new CategoryViewModel
			{
				CenterIconSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Pictures"),
				CenterIconUnSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Pictures")
			};
			((ComboBoxModel)obj5).CountNum = 0;
			obj5.IsSelected = false;
			((ComboBoxModel)obj5).IsChecked = false;
			obj5.Title = "K0475";
			obj5.ResourceType = "{773D71F7-CE8A-42D7-BE58-5F875DF58C16}";
			obj5.SubTitle = (isBackup ? "K1516" : "K1402");
			((ComboBoxModel)obj5).ToggleButtonVisibility = (Visibility)2;
			((ComboBoxModel)obj5).Key = LangTranslation.Translate("K0475");
			list.Add(obj5);
			CategoryViewModel obj6 = new CategoryViewModel
			{
				CenterIconSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Music"),
				CenterIconUnSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Music")
			};
			((ComboBoxModel)obj6).CountNum = 0;
			obj6.IsSelected = false;
			((ComboBoxModel)obj6).IsChecked = false;
			obj6.Title = "K0476";
			obj6.ResourceType = "{242C8F16-6AC7-431B-BBF1-AE24373860F1}";
			obj6.SubTitle = (isBackup ? "K1516" : "K1402");
			((ComboBoxModel)obj6).ToggleButtonVisibility = (Visibility)2;
			((ComboBoxModel)obj6).Key = LangTranslation.Translate("K0476");
			list.Add(obj6);
			CategoryViewModel obj7 = new CategoryViewModel
			{
				CenterIconSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Videos"),
				CenterIconUnSelectedSource = (ImageSource)Application.Current.FindResource((object)"v6_Icon_Videos"),
				Title = "K0477"
			};
			((ComboBoxModel)obj7).CountNum = 0;
			((ComboBoxModel)obj7).IsChecked = false;
			obj7.IsSelected = false;
			obj7.ResourceType = "{8BEBE14B-4E45-4D36-8726-8442E6242C01}";
			obj7.SubTitle = (isBackup ? "K1516" : "K1402");
			((ComboBoxModel)obj7).ToggleButtonVisibility = (Visibility)2;
			((ComboBoxModel)obj7).Key = LangTranslation.Translate("K0477");
			list.Add(obj7);
			List<CategoryViewModel> list2 = list;
			if (!isBackup)
			{
				CategoryViewModel item = list2[0];
				list2.RemoveAt(0);
				list2.Add(item);
			}
			if (Context.CurrentDevice.Property.Category == "tablet" && Context.CurrentDevice.ConnectedAppType == "Ma")
			{
				BackupRestoreProcessor backupRestoreProcessor = new BackupRestoreProcessor();
				DeviceEx currentDevice = Context.CurrentDevice;
				List<PropItem> tabletSmsCalllogPermissions = backupRestoreProcessor.GetTabletSmsCalllogPermissions((TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null));
				foreach (CategoryViewModel item2 in list2)
				{
					if (item2.ResourceType == "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}")
					{
						bool flag = ((tabletSmsCalllogPermissions != null) ? tabletSmsCalllogPermissions.FirstOrDefault((PropItem m) => m.Key == "isSupportSms").Value : null) == "true";
						item2.Opacity = (flag ? 1.0 : 0.51);
					}
					if (item2.ResourceType == "{89D4DB68-4258-4002-8557-E65959C558B3}")
					{
						bool flag2 = ((tabletSmsCalllogPermissions != null) ? tabletSmsCalllogPermissions.FirstOrDefault((PropItem m) => m.Key == "isSupportCallLog").Value : null) == "true";
						item2.Opacity = (flag2 ? 1.0 : 0.51);
					}
				}
			}
			CategoriesList = list2.Where((CategoryViewModel m) => m.Opacity == 1.0).ToList();
		}

		private void ToggleCilckCommandHandler(object data)
		{
			CategoryViewModel obj = data as CategoryViewModel;
			obj.IsOpen = !obj.IsOpen;
		}

		private static async void FireAndroid15CategoryClickAction(CategoryViewModel category)
		{
			await MessageWindowHelper.Instance.Show("K0071", "K1893", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
		}

		private static async void FireCategoryClickAction(CategoryViewModel category)
		{
			if (await MessageWindowHelper.Instance.Show("K0071", "K1598", "K0327", "K0208", false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false) == true)
			{
				Configurations.AppMinVersionCodeOfMoto = 900805000;
				DeviceEx currentDevice = Context.CurrentDevice;
				AdbDeviceEx val = (AdbDeviceEx)(object)((currentDevice is AdbDeviceEx) ? currentDevice : null);
				if (val != null)
				{
					((DeviceEx)val).PhysicalStatus = (DevicePhysicalStateEx)0;
				}
			}
		}

		public void LoadCategories(List<CategoryViewModel> datas)
		{
			Categories.Clear();
			datas?.ForEach(delegate(CategoryViewModel p)
			{
				Categories.Add(p);
			});
		}

		public override void Reset()
		{
			CategoriesList.ForEach(delegate(CategoryViewModel p)
			{
				p.Count = 0;
				((ComboBoxModel)p).CountNum = 0;
				((ComboBoxModel)p).Childs?.Clear();
				((ComboBoxModel)p).Childs = null;
				p.IsSelected = false;
				((ComboBoxModel)p).ToggleButtonVisibility = (Visibility)2;
			});
		}

		private void FireCategorySelectionChanged(object sender, CategorySelectionChangedEventArgs e)
		{
			this.CategorySelectionChanged?.Invoke(sender, e);
		}
	}
	public class CategoryViewModel : ComboBoxModel
	{
		private ImageSource _centerIconSelectedSource;

		private ImageSource _centerIconUnSelectedSource;

		private bool _IsOpen;

		private string _title = string.Empty;

		public int _count;

		private long totalSize;

		private string totalSizeWithUnit;

		private Dictionary<string, long> idAndSizeMapping;

		private int _transferCount;

		private bool _isTransferring;

		private bool _isSelected;

		private bool _isEnabled;

		private double _Opacity = 1.0;

		public bool ShowSubWindow = true;

		private Visibility _SubItemVisible;

		public ImageSource CenterIconSelectedSource
		{
			get
			{
				return _centerIconSelectedSource;
			}
			set
			{
				if (_centerIconSelectedSource != value)
				{
					_centerIconSelectedSource = value;
					((NotifyBase)this).OnPropertyChanged("CenterIconSelectedSource");
				}
			}
		}

		public ImageSource CenterIconUnSelectedSource
		{
			get
			{
				return _centerIconUnSelectedSource;
			}
			set
			{
				if (_centerIconUnSelectedSource != value)
				{
					_centerIconUnSelectedSource = value;
					((NotifyBase)this).OnPropertyChanged("CenterIconUnSelectedSource");
				}
			}
		}

		public bool IsOpen
		{
			get
			{
				return _IsOpen;
			}
			set
			{
				_IsOpen = value;
				((NotifyBase)this).OnPropertyChanged("IsOpen");
			}
		}

		public string Title
		{
			get
			{
				return _title;
			}
			set
			{
				if (!(_title == value))
				{
					_title = value;
					((NotifyBase)this).OnPropertyChanged("Title");
				}
			}
		}

		public int Count
		{
			get
			{
				return _count;
			}
			set
			{
				if (_count != value)
				{
					_count = value;
					IsEnabled = _count > 0;
					((NotifyBase)this).OnPropertyChanged("Count");
				}
			}
		}

		public long TotalSize
		{
			get
			{
				return totalSize;
			}
			set
			{
				if (totalSize != value)
				{
					totalSize = value;
					if (value == 0L)
					{
						TotalSizeWithUnit = string.Empty;
					}
					else
					{
						TotalSizeWithUnit = "(" + GlobalFun.ConvertLong2String(value, "F1", true) + ")";
					}
					((NotifyBase)this).OnPropertyChanged("TotalSize");
				}
			}
		}

		public string TotalSizeWithUnit
		{
			get
			{
				return totalSizeWithUnit;
			}
			set
			{
				if (!(totalSizeWithUnit == value))
				{
					totalSizeWithUnit = value;
					((NotifyBase)this).OnPropertyChanged("TotalSizeWithUnit");
				}
			}
		}

		public Dictionary<string, long> IdAndSizeMapping
		{
			get
			{
				return idAndSizeMapping;
			}
			set
			{
				if (idAndSizeMapping != value)
				{
					idAndSizeMapping = value;
					((NotifyBase)this).OnPropertyChanged("IdAndSizeMapping");
				}
			}
		}

		public int TransferCount
		{
			get
			{
				return _transferCount;
			}
			set
			{
				if (_transferCount != value)
				{
					_transferCount = value;
					((NotifyBase)this).OnPropertyChanged("TransferCount");
				}
			}
		}

		public bool IsTransferring
		{
			get
			{
				return _isTransferring;
			}
			set
			{
				if (_isTransferring != value)
				{
					_isTransferring = value;
					((NotifyBase)this).OnPropertyChanged("IsTransferring");
				}
			}
		}

		public bool IsSelected
		{
			get
			{
				return _isSelected;
			}
			set
			{
				if (_isSelected == value)
				{
					return;
				}
				if (Opacity == 0.5)
				{
					CategoryClickAction?.Invoke(this);
					return;
				}
				if (Opacity == 0.51)
				{
					string text = "K1611";
					if (Context.CurrentViewType == ViewType.RESTORE)
					{
						text = "K1612";
					}
					MessageWindowHelper.Instance.Show(string.Empty, text, "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
					return;
				}
				if (Context.CurrentViewType != ViewType.RESTORE && Context.CurrentViewType != ViewType.RESTOREMAIN)
				{
					if (Context.IsNoNeedRefresh)
					{
						Context.IsNoNeedRefresh = false;
						Context.RefreshTime = DateTime.Now;
					}
					else
					{
						BackupMainViewModel backupMainViewModel = HostProxy.ViewContext.FindViewModel<BackupMainViewModel>(typeof(BackUpMainView), (string)null);
						if (backupMainViewModel != null && (DateTime.Now - Context.RefreshTime).TotalSeconds > 8.0 && Context.Refreshcategory != ResourceType)
						{
							backupMainViewModel.LoadResourceInfo(ResourceType);
							Context.RefreshTime = DateTime.Now;
							Context.Refreshcategory = ResourceType;
						}
					}
				}
				if (ShowSubWindow && ((ComboBoxModel)this).Parent == null && ((ComboBoxModel)this).Childs != null && ((ComboBoxModel)this).Childs.Count > 1)
				{
					List<CategoryViewModel> list = (from p in ((ComboBoxModel)this).Childs.OfType<CategoryViewModel>().ToList()
						where (int)p.SubItemVisible == 0
						select p).ToList();
					if (list.Count == 1)
					{
						_isSelected = value;
						list[0].IsSelected = value;
					}
					else
					{
						SubCategoryWindow subCategoryWindow = new SubCategoryWindow();
						((FrameworkElement)subCategoryWindow).DataContext = new SubCategoryWindowModel(this, ((ComboBoxModel)this).Childs);
						SubCategoryWindow subCategoryWindow2 = subCategoryWindow;
						MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)subCategoryWindow2, (bool?)true);
					}
				}
				else
				{
					_isSelected = value;
					if (((ComboBoxModel)this).Childs != null && ((ComboBoxModel)this).Childs.Count == 1)
					{
						(((ComboBoxModel)this).Childs[0] as CategoryViewModel).IsSelected = value;
					}
				}
				((NotifyBase)this).OnPropertyChanged("IsSelected");
			}
		}

		public bool IsEnabled
		{
			get
			{
				return _isEnabled;
			}
			set
			{
				if (_isEnabled != value)
				{
					_isEnabled = value;
					((NotifyBase)this).OnPropertyChanged("IsEnabled");
				}
			}
		}

		public double Opacity
		{
			get
			{
				return _Opacity;
			}
			set
			{
				if (_Opacity != value)
				{
					_Opacity = value;
					((NotifyBase)this).OnPropertyChanged("Opacity");
				}
			}
		}

		public string ResourceType { get; set; }

		public object Tag { get; set; }

		public bool IsInternalRes { get; set; }

		public Visibility SubItemVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _SubItemVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_SubItemVisible = value;
				((NotifyBase)this).OnPropertyChanged("SubItemVisible");
			}
		}

		public string SubTitle { get; set; }

		public Action<CategoryViewModel> CategoryClickAction { get; set; }

		public List<CategoryViewModel> SubCategoryViewModelList { get; set; }

		public virtual bool DoProcess()
		{
			return true;
		}
	}
	public class CategorySelectionChangedEventArgs : EventArgs
	{
		public int SelectedCount { get; private set; }

		public CategorySelectionChangedEventArgs(int selectedCount)
		{
			SelectedCount = selectedCount;
		}
	}
	public class ConfirmNotSetPasswordViewModel : OKCancelViewModel
	{
		private ReplayCommand closeButtonClickCommand;

		public ReplayCommand CloseButtonClickCommand
		{
			get
			{
				return closeButtonClickCommand;
			}
			set
			{
				if (closeButtonClickCommand != value)
				{
					closeButtonClickCommand = value;
					((NotifyBase)this).OnPropertyChanged("CloseButtonClickCommand");
				}
			}
		}

		public ConfirmNotSetPasswordViewModel()
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			CloseButtonClickCommand = new ReplayCommand((Action<object>)CloseButtonClickCommandHandler);
		}

		private void CloseButtonClickCommandHandler(object args)
		{
			((OKCancelViewModel)this).CancelButtonClickCommandHandler(args);
			object obj = ((args is Window) ? args : null);
			if (obj != null)
			{
				((Window)obj).Close();
			}
		}
	}
	public class ConfirmSetPasswordFormItemViewModel : FormItemViewModel
	{
		private SetPasswordFormItemViewModel PasswordFormItemViewModel;

		public ConfirmSetPasswordFormItemViewModel(SetPasswordFormItemViewModel passwordItemViewModel, IFormVerify verify)
			: base(verify)
		{
			PasswordFormItemViewModel = passwordItemViewModel;
		}

		public override bool Verify()
		{
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Expected O, but got Unknown
			Tuple<IFormVerify, string, string> tuple = new Tuple<IFormVerify, string, string>(((FormItemViewModel)PasswordFormItemViewModel).FormVerify, ((FormItemViewModel)PasswordFormItemViewModel).InputValue, ((FormItemViewModel)this).InputValue);
			VerifyResult val = ((FormItemViewModel)this).FormVerify.Verify((object)tuple);
			((FormItemViewModel)this).Wraning = new FormItemVerifyWraningViewModel
			{
				WraningCode = val.WraningCode,
				WraningContent = val.WraningContent
			};
			return val.IsCorrect;
		}
	}
	public class DeviceTutorialsViewModel : ViewModelBase
	{
		protected List<Uri> UriList;

		private ListViewItemModel _SelectedCategory;

		private ListViewItemModel _SelectedSubCategory;

		private ListViewItemModel _SelectedNote;

		private Visibility _SubCategoryVisibility = (Visibility)2;

		private bool _PrevEnable;

		private bool _NextEnable = true;

		private Uri _TutorialImageUri;

		private int _CurrentCategoryId;

		public ReplayCommand PrevCommand { get; }

		public ReplayCommand NextCommand { get; }

		public ObservableCollection<ListViewItemModel> CategoryList { get; set; }

		public ObservableCollection<ListViewItemModel> SubCategoryList { get; set; }

		public ObservableCollection<ListViewItemModel> NoteList { get; set; }

		public ListViewItemModel SelectedCategory
		{
			get
			{
				return _SelectedCategory;
			}
			set
			{
				_SelectedCategory = value;
				if (_SelectedCategory != null)
				{
					CurrentCategoryId = _SelectedCategory.Id;
					if (_SelectedCategory.Id == 0)
					{
						SelectedSubCategory = SubCategoryList.First();
					}
					else
					{
						SelectedSubCategory = null;
						ChangeNotes("tablet");
					}
				}
				((NotifyBase)this).OnPropertyChanged("SelectedCategory");
			}
		}

		public ListViewItemModel SelectedSubCategory
		{
			get
			{
				return _SelectedSubCategory;
			}
			set
			{
				_SelectedSubCategory = value;
				if (_SelectedSubCategory == null)
				{
					SubCategoryVisibility = (Visibility)2;
				}
				else
				{
					if (_SelectedSubCategory.Id == 0)
					{
						ChangeNotes("phone-normal");
					}
					else
					{
						ChangeNotes("phone-legion");
					}
					SubCategoryVisibility = (Visibility)0;
				}
				((NotifyBase)this).OnPropertyChanged("SelectedSubCategory");
			}
		}

		public ListViewItemModel SelectedNote
		{
			get
			{
				return _SelectedNote;
			}
			set
			{
				_SelectedNote = value;
				if (_SelectedNote != null)
				{
					Task.Run(() => TutorialImageUri = UriList[_SelectedNote.Id]);
					if (_SelectedNote.Id == NoteList.Count - 1)
					{
						NextEnable = false;
						PrevEnable = NoteList.Count > 1;
					}
					else if (_SelectedNote.Id == 0)
					{
						PrevEnable = false;
						NextEnable = NoteList.Count > 1;
					}
					else
					{
						PrevEnable = true;
						NextEnable = true;
					}
				}
				((NotifyBase)this).OnPropertyChanged("SelectedNote");
			}
		}

		public Visibility SubCategoryVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _SubCategoryVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_SubCategoryVisibility = value;
				((NotifyBase)this).OnPropertyChanged("SubCategoryVisibility");
			}
		}

		public bool PrevEnable
		{
			get
			{
				return _PrevEnable;
			}
			set
			{
				_PrevEnable = value;
				((NotifyBase)this).OnPropertyChanged("PrevEnable");
			}
		}

		public bool NextEnable
		{
			get
			{
				return _NextEnable;
			}
			set
			{
				_NextEnable = value;
				((NotifyBase)this).OnPropertyChanged("NextEnable");
			}
		}

		public Uri TutorialImageUri
		{
			get
			{
				return _TutorialImageUri;
			}
			set
			{
				_TutorialImageUri = value;
				((NotifyBase)this).OnPropertyChanged("TutorialImageUri");
			}
		}

		public int CurrentCategoryId
		{
			get
			{
				return _CurrentCategoryId;
			}
			set
			{
				_CurrentCategoryId = value;
				((NotifyBase)this).OnPropertyChanged("CurrentCategoryId");
			}
		}

		public DeviceTutorialsViewModel()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Expected O, but got Unknown
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Expected O, but got Unknown
			//IL_008e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Expected O, but got Unknown
			//IL_00af: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Expected O, but got Unknown
			//IL_00c5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cf: Expected O, but got Unknown
			PrevCommand = new ReplayCommand((Action<object>)PrevCommandHandler);
			NextCommand = new ReplayCommand((Action<object>)NextCommandHandler);
			NoteList = new ObservableCollection<ListViewItemModel>();
			CategoryList = new ObservableCollection<ListViewItemModel>();
			CategoryList.Add(new ListViewItemModel(0, "K0688", "v6_icon_samll_phone", "v6_icon_samll_phone_selected"));
			CategoryList.Add(new ListViewItemModel(1, "K0929", "v6_icon_samll_tablet", "v6_icon_samll_tablet_selected"));
			SubCategoryList = new ObservableCollection<ListViewItemModel>();
			SubCategoryList.Add(new ListViewItemModel(0, "K0688"));
			SubCategoryList.Add(new ListViewItemModel(1, "K1356"));
		}

		public override void LoadData(object data)
		{
			SelectedCategory = CategoryList.First();
			((ViewModelBase)this).LoadData(data);
		}

		private void PrevCommandHandler(object data)
		{
			int id = SelectedNote.Id;
			SelectedNote = NoteList[--id];
		}

		private void NextCommandHandler(object data)
		{
			int id = SelectedNote.Id;
			SelectedNote = NoteList[++id];
		}

		private void ChangeNotes(string type)
		{
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Expected O, but got Unknown
			//IL_0078: Unknown result type (might be due to invalid IL or missing references)
			//IL_0082: Expected O, but got Unknown
			//IL_008e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Expected O, but got Unknown
			//IL_0170: Unknown result type (might be due to invalid IL or missing references)
			//IL_017a: Expected O, but got Unknown
			//IL_0186: Unknown result type (might be due to invalid IL or missing references)
			//IL_0190: Expected O, but got Unknown
			//IL_019c: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a6: Expected O, but got Unknown
			//IL_00f1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fb: Expected O, but got Unknown
			//IL_0107: Unknown result type (might be due to invalid IL or missing references)
			//IL_0111: Expected O, but got Unknown
			//IL_011d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0127: Expected O, but got Unknown
			NoteList.Clear();
			if (type == "phone-normal")
			{
				UriList = new List<Uri>
				{
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone11.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone12.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone13.gif")
				};
				NoteList.Add(new ListViewItemModel(0, "K1097"));
				NoteList.Add(new ListViewItemModel(1, "K1098"));
				NoteList.Add(new ListViewItemModel(2, "K1099"));
			}
			else if (type == "tablet")
			{
				UriList = new List<Uri>
				{
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Tablet/tablet31.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Tablet/tablet32.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Tablet/tablet33.gif")
				};
				NoteList.Add(new ListViewItemModel(0, "K1102"));
				NoteList.Add(new ListViewItemModel(1, "K1103"));
				NoteList.Add(new ListViewItemModel(2, "K1107"));
			}
			else
			{
				UriList = new List<Uri>
				{
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone21.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone22.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone23.gif")
				};
				NoteList.Add(new ListViewItemModel(0, "K1100"));
				NoteList.Add(new ListViewItemModel(1, "K1101"));
				NoteList.Add(new ListViewItemModel(2, "K1108"));
			}
			SelectedNote = NoteList.First();
		}
	}
	public class EnterPasswordViewModel : ViewModelBase
	{
		private long locker;

		public string _PassWord;

		public string _ErrorTips;

		public ReplayCommand CloseCommand { get; }

		public ReplayCommand CancelCommand { get; }

		public ReplayCommand OkCommand { get; }

		public ReplayCommand VerifyCommand { get; }

		public string PassWord
		{
			get
			{
				return _PassWord;
			}
			set
			{
				_PassWord = value;
				((NotifyBase)this).OnPropertyChanged("PassWord");
			}
		}

		public string ErrorTips
		{
			get
			{
				return _ErrorTips;
			}
			set
			{
				_ErrorTips = value;
				((NotifyBase)this).OnPropertyChanged("ErrorTips");
			}
		}

		public Func<string, bool> PasswordCheckDelegate { get; set; }

		public EnterPasswordViewModel(Func<string, bool> passwordCheckDelegate)
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Expected O, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			CloseCommand = new ReplayCommand((Action<object>)CloseCommandHandler);
			CancelCommand = new ReplayCommand((Action<object>)CancelCommandHandler);
			OkCommand = new ReplayCommand((Action<object>)OkCommandHandler);
			VerifyCommand = new ReplayCommand((Action<object>)VerifyCommandHandler);
			PasswordCheckDelegate = passwordCheckDelegate;
		}

		private void CloseCommandHandler(object data)
		{
			((Window)((data is Window) ? data : null)).Close();
		}

		private void CancelCommandHandler(object data)
		{
			((IMessageWindowV6)((data is IMessageWindowV6) ? data : null)).Result = false;
			CloseCommandHandler(data);
		}

		private void OkCommandHandler(object data)
		{
			if (ErrorTips == null && string.IsNullOrEmpty(PassWord))
			{
				ErrorTips = "Required";
			}
			else
			{
				if (Interlocked.Read(in locker) != 0L)
				{
					return;
				}
				Interlocked.Exchange(ref locker, 1L);
				Task.Run(() => PasswordCheckDelegate(PassWord)).ContinueWith(delegate(Task<bool> s)
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						if (s.Result)
						{
							object obj = data;
							((IMessageWindowV6)((obj is IMessageWindowV6) ? obj : null)).Result = true;
							CloseCommandHandler(data);
						}
						else
						{
							ErrorTips = "K0788";
						}
						Interlocked.Exchange(ref locker, 0L);
					});
				});
			}
		}

		private void VerifyCommandHandler(object data)
		{
			if (!string.IsNullOrEmpty(PassWord) && !PasswordCheckDelegate(PassWord))
			{
				ErrorTips = "K0788";
			}
			else
			{
				ErrorTips = null;
			}
		}
	}
	public class MainFrameViewModel : ViewModelBase
	{
		private object _currentView;

		private Visibility _MatchVisibility = (Visibility)1;

		private Visibility _MatchLoadingVisibility;

		private Visibility _BackVisibility = (Visibility)2;

		private Visibility _BottomLineVisibility = (Visibility)2;

		private const string connectFailed = "K0768";

		private const string connecting = "K0738";

		private string _matchText = "K0738";

		protected DeviceEx CurrentDevice
		{
			get
			{
				return Context.CurrentDevice;
			}
			set
			{
				if (value == null && Context.CurrentDevice != null)
				{
					Context.CurrentDevice.SoftStatusChanged -= Current_SoftStatusChanged;
				}
				Context.CurrentDevice = value;
			}
		}

		public ReplayCommand BackCommand { get; }

		public object CurrentView
		{
			get
			{
				return _currentView;
			}
			set
			{
				_currentView = value;
				((NotifyBase)this).OnPropertyChanged("CurrentView");
			}
		}

		public Visibility MatchVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _MatchVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_MatchVisibility = value;
				((NotifyBase)this).OnPropertyChanged("MatchVisibility");
			}
		}

		public Visibility MatchLoadingVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _MatchLoadingVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_MatchLoadingVisibility = value;
				((NotifyBase)this).OnPropertyChanged("MatchLoadingVisibility");
			}
		}

		public Visibility BackVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _BackVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_BackVisibility = value;
				((NotifyBase)this).OnPropertyChanged("BackVisibility");
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

		public string MatchText
		{
			get
			{
				return _matchText;
			}
			set
			{
				_matchText = value;
				if (_matchText == "K0768")
				{
					MatchLoadingVisibility = (Visibility)2;
				}
				else
				{
					MatchLoadingVisibility = (Visibility)0;
				}
				((NotifyBase)this).OnPropertyChanged("MatchText");
			}
		}

		public MainFrameViewModel()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Expected O, but got Unknown
			BackCommand = new ReplayCommand((Action<object>)BackCommandHandler);
		}

		public override void LoadData()
		{
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Invalid comparison between Unknown and I4
			HostProxy.deviceManager.DisConnecte += DeviceWatcher_DisConnecte;
			HostProxy.deviceManager.MasterDeviceChanged += DeviceManager_MasterDeviceChanged;
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			HostProxy.deviceManager.ConnectChange += delegate(bool status)
			{
				UpdateGetStartStatus(status);
			};
			HostProxy.deviceManager.ShowConnectIconStatus += delegate(int status)
			{
				UpdateConnectIconStatus(status);
			};
			if (masterDevice != null && (int)masterDevice.SoftStatus == 2)
			{
				ChangeCurrentDevice(masterDevice, _firstLoad: true);
			}
			else
			{
				Context.Switch(ViewType.START);
			}
			((ViewModelBase)this).LoadData();
		}

		private void UpdateConnectIconStatus(int status)
		{
			Context.RsaMainWindow.SetDeviceConnectIconStatus(status);
		}

		private void DeviceWatcher_DisConnecte(object sender, DeviceEx e)
		{
			if (CurrentDevice != null && (CurrentDevice == null || !CurrentDevice.Identifer.Equals(e.Identifer)))
			{
				return;
			}
			Context.CurrentRestoreViewType = ViewType.RESTOREMAIN;
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					MatchText = "K0738";
					MatchVisibility = (Visibility)1;
					Context.Switch(ViewType.START);
				});
			}
			Context.DisposeWorker();
			CurrentDevice = HostProxy.deviceManager.MasterDevice;
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

		private void UpdateGetStartStatus(bool btnStatus = false)
		{
			StartViewModel _startView = HostProxy.ViewContext.FindViewModel<StartViewModel>(typeof(StartView), (string)null);
			if (_startView != null)
			{
				Task.Run(delegate
				{
					_startView.UpdateGetStartBtnStatus(btnStatus);
				});
			}
		}

		private void Current_SoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			DeviceEx device = (DeviceEx)sender;
			ChangeCurrentDevice(device);
		}

		private void ChangeCurrentDevice(DeviceEx device, bool _firstLoad = false)
		{
			//IL_0004: Unknown result type (might be due to invalid IL or missing references)
			//IL_000a: Invalid comparison between Unknown and I4
			//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Invalid comparison between Unknown and I4
			//IL_00ec: Unknown result type (might be due to invalid IL or missing references)
			bool num = device != null && (int)device.ConnectType != 2;
			if (Context.CurrentRestoreViewType == ViewType.BACKUPMAIN && Context.Level2Frame != null)
			{
				_ = Context.Level2Frame.CurrentView;
			}
			if (Context.CurrentRestoreViewType == ViewType.RESTOREMAIN && Context.Level2Frame != null)
			{
				_ = Context.Level2Frame.CurrentView;
			}
			if (!num)
			{
				CurrentDevice = null;
				Context.CurrentRestoreViewType = ViewType.RESTOREMAIN;
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						MatchVisibility = (Visibility)1;
						Context.Switch(ViewType.START);
					});
				}
				return;
			}
			CurrentDevice = device;
			if (!_firstLoad && device.ConnectedAppType == "Moto")
			{
				Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
				if (currentDispatcher2 != null)
				{
					currentDispatcher2.Invoke((Action)delegate
					{
						Context.Switch(ViewType.START);
					});
				}
			}
			else if ((int)device.SoftStatus == 2)
			{
				Context.CurrentRestoreViewType = ViewType.RESTOREMAIN;
				Dispatcher currentDispatcher3 = HostProxy.CurrentDispatcher;
				if (currentDispatcher3 != null)
				{
					currentDispatcher3.Invoke((Action)delegate
					{
						MatchVisibility = (Visibility)1;
						Context.Switch(ViewType.MAIN, null, reload: true);
					});
				}
			}
			else
			{
				if ((int)device.SoftStatus != 0)
				{
					return;
				}
				Dispatcher currentDispatcher4 = HostProxy.CurrentDispatcher;
				if (currentDispatcher4 != null)
				{
					currentDispatcher4.Invoke((Action)delegate
					{
						Context.Switch(ViewType.START);
						MatchText = "K0768";
					});
				}
			}
		}

		private void BackCommandHandler(object data)
		{
			Context.Switch(ViewType.START);
		}
	}
	public class RestoreMainViewModel : ViewModelBase
	{
		private DeviceBackupMgt _mgt = new DeviceBackupMgt();

		private ObservableCollection<BackupHistoryListItemViewModel> _HistoryItems = new ObservableCollection<BackupHistoryListItemViewModel>();

		public Visibility _EmptyTipsVisibility = (Visibility)2;

		private bool? _isAllSelected = false;

		private bool _RestoreEnabled;

		private bool _ExtractEnabled;

		private bool _DeleteEnabled;

		public ReplayCommand AllClickCommand { get; }

		public ReplayCommand SingleClickCommand { get; }

		public ReplayCommand ClickCommand { get; }

		public ReplayCommand DeleteCommand { get; }

		public ObservableCollection<BackupHistoryListItemViewModel> HistoryItems
		{
			get
			{
				return _HistoryItems;
			}
			set
			{
				_HistoryItems = value;
				if (_HistoryItems != null && _HistoryItems.Count() > 0)
				{
					EmptyTipsVisibility = (Visibility)2;
				}
				else
				{
					EmptyTipsVisibility = (Visibility)0;
				}
				((NotifyBase)this).OnPropertyChanged("HistoryItems");
			}
		}

		public Visibility EmptyTipsVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _EmptyTipsVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_EmptyTipsVisibility = value;
				((NotifyBase)this).OnPropertyChanged("EmptyTipsVisibility");
			}
		}

		public bool? IsAllSelected
		{
			get
			{
				return _isAllSelected;
			}
			set
			{
				_isAllSelected = value;
				SetButtonEnable(HistoryItems.Count((BackupHistoryListItemViewModel n) => n.IsSelected));
				((NotifyBase)this).OnPropertyChanged("IsAllSelected");
			}
		}

		public bool RestoreEnabled
		{
			get
			{
				return _RestoreEnabled;
			}
			set
			{
				_RestoreEnabled = value;
				((NotifyBase)this).OnPropertyChanged("RestoreEnabled");
			}
		}

		public bool ExtractEnabled
		{
			get
			{
				return _ExtractEnabled;
			}
			set
			{
				_ExtractEnabled = value;
				((NotifyBase)this).OnPropertyChanged("ExtractEnabled");
			}
		}

		public bool DeleteEnabled
		{
			get
			{
				return _DeleteEnabled;
			}
			set
			{
				_DeleteEnabled = value;
				((NotifyBase)this).OnPropertyChanged("DeleteEnabled");
			}
		}

		public RestoreMainViewModel()
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Expected O, but got Unknown
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_005d: Expected O, but got Unknown
			//IL_006a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0074: Expected O, but got Unknown
			//IL_0081: Unknown result type (might be due to invalid IL or missing references)
			//IL_008b: Expected O, but got Unknown
			AllClickCommand = new ReplayCommand((Action<object>)AllClickCommandHandler);
			SingleClickCommand = new ReplayCommand((Action<object>)SingleClickCommandHandler);
			ClickCommand = new ReplayCommand((Action<object>)ClickCommandHandler);
			DeleteCommand = new ReplayCommand((Action<object>)DeleteCommandHandler);
		}

		public override void LoadData()
		{
			((ViewModelBase)this).LoadData();
			List<BackupDescription> backupList = _mgt.GetBackupList();
			HistoryItems.Clear();
			IsAllSelected = false;
			if (backupList != null && backupList.Count > 0)
			{
				backupList.OrderByDescending((BackupDescription o) => o.BackupDateTime).ToList().ForEach(delegate(BackupDescription n)
				{
					HistoryItems.Add(ConvertBackupDescription(n));
				});
			}
		}

		private void AllClickCommandHandler(object data)
		{
			if (IsAllSelected.HasValue)
			{
				foreach (BackupHistoryListItemViewModel historyItem in HistoryItems)
				{
					historyItem.IsSelected = IsAllSelected.Value;
				}
			}
			SetButtonEnable(HistoryItems.Count((BackupHistoryListItemViewModel n) => n.IsSelected));
		}

		private void SingleClickCommandHandler(object data)
		{
			if (HistoryItems.Count((BackupHistoryListItemViewModel n) => n.IsSelected) == 0)
			{
				IsAllSelected = false;
			}
			else if (HistoryItems.Any((BackupHistoryListItemViewModel n) => !n.IsSelected))
			{
				IsAllSelected = null;
			}
			else
			{
				IsAllSelected = true;
			}
			SetButtonEnable(HistoryItems.Count((BackupHistoryListItemViewModel n) => n.IsSelected));
		}

		private async void ClickCommandHandler(object data)
		{
			switch (data.ToString())
			{
			case "import":
				await ImportButtonClickCommandHandler(data);
				break;
			case "extract":
				await ExtractButtonClickCommandHandler(data);
				break;
			case "delete":
			{
				List<BackupHistoryListItemViewModel> selectedList = HistoryItems.Where((BackupHistoryListItemViewModel n) => n.IsSelected).ToList();
				await DeleteButtonClickCommandHandler(selectedList);
				break;
			}
			case "restore":
				await RestoreBottonClickCommandHandler(data);
				break;
			}
			RefreshButtonClickCommandHandler(data);
		}

		private async Task ImportButtonClickCommandHandler(object parameter)
		{
			OpenFileDialog val = new OpenFileDialog();
			((FileDialog)val).Title = "K0496";
			if (HostProxy.LanguageService.IsNeedTranslate())
			{
				((FileDialog)val).Title = HostProxy.LanguageService.Translate("K0496");
			}
			((FileDialog)val).Filter = string.Format("{0}|*.mabk;", HostProxy.LanguageService.Translate("K0480"));
			val.Multiselect = false;
			((FileDialog)val).FileName = string.Empty;
			((FileDialog)val).FilterIndex = 1;
			if (((CommonDialog)val).ShowDialog() != true || string.IsNullOrEmpty(((FileDialog)val).FileName))
			{
				return;
			}
			try
			{
				List<BackupDescription> list = await _mgt.ImportBackupFile(((FileDialog)val).FileName);
				if (list != null && list.Count > 0)
				{
					list.ForEach(delegate(BackupDescription n)
					{
						HistoryItems.Insert(0, ConvertBackupDescription(n));
					});
				}
			}
			catch (Exception)
			{
				await MessageWindowHelper.Instance.Show("K0711", "K0669", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
			}
		}

		private async Task ExtractButtonClickCommandHandler(object parameter)
		{
			FolderBrowserDialog fbd = new FolderBrowserDialog();
			fbd.SelectedPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
			if (1 != (int)((CommonDialog)fbd).ShowDialog())
			{
				return;
			}
			await CreateBackupStorage(HistoryItems.First((BackupHistoryListItemViewModel n) => n.IsSelected), delegate(IBackupStorage backupStorage)
			{
				HostProxy.AsyncCommonProgressLoader.Progress(Context.RsaMainWindow, (Action<IAsyncTaskContext, CommonProgressWindowViewModel>)delegate(IAsyncTaskContext context, CommonProgressWindowViewModel viewModel)
				{
					((Action<NotifyTypes, object>)context.ObjectState)?.Invoke((NotifyTypes)6, new List<object>
					{
						ResourcesHelper.StringResources.SingleInstance.BACKUPRESTORE_RELEASE_MESSAGE_NORMAL,
						true
					});
					using IWorker worker = new ReleaseBackupFileWorker(context, backupStorage, fbd.SelectedPath);
					worker.DoProcess(null);
				}, (Action<IAsyncTaskResult, WorkStatus>)delegate(IAsyncTaskResult result, WorkStatus workStatus)
				{
					//IL_000c: Unknown result type (might be due to invalid IL or missing references)
					//IL_000e: Invalid comparison between Unknown and I4
					//IL_0010: Unknown result type (might be due to invalid IL or missing references)
					//IL_0012: Invalid comparison between Unknown and I4
					Action<NotifyTypes, object> action = (Action<NotifyTypes, object>)result.ObjectState;
					if ((int)workStatus != 1)
					{
						if ((int)workStatus == 4)
						{
							action?.Invoke((NotifyTypes)6, new List<object>
							{
								ResourcesHelper.StringResources.SingleInstance.BACKUPRESTORE_RELEASE_MESSAGE_SUCCESS,
								true
							});
						}
					}
					else
					{
						string empty = string.Empty;
						empty = ((result.Exception == null || (result.Exception.HResult != -2147024857 && result.Exception.HResult != -2147024784)) ? ResourcesHelper.StringResources.SingleInstance.BACKUPRESTORE_RELEASE_MESSAGE_FAILED : "K0784");
						action?.Invoke((NotifyTypes)5, new List<object> { empty, true });
					}
				});
			});
		}

		private async void DeleteCommandHandler(object parameter)
		{
			await DeleteButtonClickCommandHandler(new List<BackupHistoryListItemViewModel> { parameter as BackupHistoryListItemViewModel });
			RefreshButtonClickCommandHandler(parameter);
		}

		private async Task DeleteButtonClickCommandHandler(List<BackupHistoryListItemViewModel> selectedList)
		{
			if (await MessageWindowHelper.Instance.Show("K0583", "K0611", "K0583", "K0208", false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false) == true)
			{
				DeleteRestoreFile(selectedList);
			}
		}

		private void DeleteRestoreFile(List<BackupHistoryListItemViewModel> selectedList)
		{
			List<BackupDescription> deletes = selectedList.Select((BackupHistoryListItemViewModel n) => n.BackupDescriptionInfo).ToList();
			_mgt.DeleteBackupFile(deletes);
			selectedList.ForEach(delegate(BackupHistoryListItemViewModel n)
			{
				HistoryItems.Remove(n);
			});
			SetButtonEnable(0);
		}

		private void RefreshButtonClickCommandHandler(object parameter)
		{
			AsyncDataLoader.BeginLoading(delegate
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						((ViewModelBase)this).LoadData();
					});
				}
			}, Context.Level2Frame);
		}

		private async Task RestoreBottonClickCommandHandler(object parameter)
		{
			BackupHistoryListItemViewModel backupHistoryListItemViewModel = HistoryItems.First((BackupHistoryListItemViewModel n) => n.IsSelected);
			_ = backupHistoryListItemViewModel.BackupDescriptionInfo;
			Action<IBackupStorage> task = delegate(IBackupStorage t)
			{
				try
				{
					Context.CurrentRestoreViewType = ViewType.RESTORE;
					Context.Switch(ViewType.RESTORE, t, reload: true, level2: true);
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("Restore failed, exception:" + ex.ToString(), false);
				}
			};
			await CreateBackupStorage(backupHistoryListItemViewModel, delegate(IBackupStorage backupStorage)
			{
				task(backupStorage);
			});
		}

		private async Task CreateBackupStorage(BackupHistoryListItemViewModel data, Action<IBackupStorage> callback)
		{
			string filepath = data.Storagepath;
			_ = data.BackupDescriptionInfo;
			IBackupStorage storage = new BackupStorage(new FileInfo(filepath));
			try
			{
				string version = string.Empty;
				IBackupResourceReader reader = storage.OpenRead(out version);
				if (reader.IsSetPassword())
				{
					EnterPasswordViewModel dataContext = new EnterPasswordViewModel((string p) => reader.CheckPassword(p));
					EnterPasswordWindow enterPasswordWindow = new EnterPasswordWindow();
					((FrameworkElement)enterPasswordWindow).DataContext = dataContext;
					EnterPasswordWindow enterPasswordWindow2 = enterPasswordWindow;
					if (await MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)enterPasswordWindow2, (bool?)true) == true)
					{
						((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
						{
							callback(storage);
						});
					}
				}
				else
				{
					callback(storage);
				}
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Read file[" + filepath + "] failed,throw exception:" + ex, false);
				storage?.Dispose();
				await MessageWindowHelper.Instance.Show("K1892", "K1408", "K0327", (string)null, false, (MessageBoxImage)16, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				DeleteRestoreFile(new List<BackupHistoryListItemViewModel> { data });
			}
		}

		public void SetButtonEnable(int selectedCount)
		{
			if (selectedCount > 1)
			{
				RestoreEnabled = false;
				ExtractEnabled = false;
				DeleteEnabled = true;
			}
			else if (selectedCount == 1)
			{
				RestoreEnabled = true;
				ExtractEnabled = true;
				DeleteEnabled = true;
			}
			else
			{
				RestoreEnabled = false;
				ExtractEnabled = false;
				DeleteEnabled = false;
			}
		}

		private BackupHistoryListItemViewModel ConvertBackupDescription(BackupDescription desc)
		{
			return new BackupHistoryListItemViewModel
			{
				ModelName = desc.ModelName,
				SizeStrFormat = GlobalFun.ConvertLong2String(desc.StorageSize, "F2", true),
				Size = desc.StorageSize,
				BackupDateStrFormat = desc.BackupDateTime,
				Notes = desc.Notes,
				Storagepath = desc.StoragePath,
				BackupDescriptionInfo = desc,
				IsPhone = (string.IsNullOrEmpty(desc.Category) || desc.Category.Equals("phone", StringComparison.CurrentCultureIgnoreCase))
			};
		}
	}
	public class RestoreViewModel : ViewModelBase
	{
		private static Dictionary<string, string> sRestorceProgressResourceTypeTitleMapping = new Dictionary<string, string>
		{
			{
				"{773D71F7-CE8A-42D7-BE58-5F875DF58C16}",
				BackupRestoreStaticResources.SingleInstance.PIC
			},
			{
				"{242C8F16-6AC7-431B-BBF1-AE24373860F1}",
				BackupRestoreStaticResources.SingleInstance.MUSIC
			},
			{
				"{8BEBE14B-4E45-4D36-8726-8442E6242C01}",
				BackupRestoreStaticResources.SingleInstance.VIDEO
			},
			{
				"{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}",
				BackupRestoreStaticResources.SingleInstance.CONTACT
			},
			{
				"{580C48C8-6CEF-4BBB-AF37-D880B349D142}",
				BackupRestoreStaticResources.SingleInstance.FILE
			},
			{
				"{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}",
				BackupRestoreStaticResources.SingleInstance.SMS
			},
			{
				"{89D4DB68-4258-4002-8557-E65959C558B3}",
				BackupRestoreStaticResources.SingleInstance.CALLLOG
			}
		};

		protected List<string> retryselectedTypes;

		protected Dictionary<string, List<string>> retryIdList;

		protected DeviceRestoreWorkerEx restoreWorker;

		protected Stopwatch sw;

		protected ResourceExecuteResult executeResult;

		public volatile bool doRetry;

		private IBackupStorage storage;

		private CategoriesViewModel _CategoriesViewModel = new CategoriesViewModel(isBackup: false);

		public TcpAndroidDevice locConnecRestoreDevice;

		public DateTime startRestoreTime = DateTime.MinValue;

		public int CycleTime;

		public WorkTransferWindowViewModel _VM;

		private bool _isEnabled;

		private int _SelectedCount;

		public CategoriesViewModel CategoriesViewModel
		{
			get
			{
				return _CategoriesViewModel;
			}
			set
			{
				_CategoriesViewModel = value;
				((NotifyBase)this).OnPropertyChanged("CategoriesViewModel");
			}
		}

		public WorkTransferWindowViewModel VM
		{
			get
			{
				return _VM;
			}
			set
			{
				_VM = value;
				((NotifyBase)this).OnPropertyChanged("VM");
			}
		}

		public ReplayCommand RestoreCommand { get; }

		public ReplayCommand CancelCommand { get; }

		public bool IsEnabled
		{
			get
			{
				return _isEnabled;
			}
			set
			{
				_isEnabled = value;
				((NotifyBase)this).OnPropertyChanged("IsEnabled");
			}
		}

		public int SelectedCount
		{
			get
			{
				return _SelectedCount;
			}
			set
			{
				_SelectedCount = value;
				IsEnabled = _SelectedCount > 0;
				((NotifyBase)this).OnPropertyChanged("SelectedCount");
			}
		}

		public RestoreViewModel()
		{
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Expected O, but got Unknown
			CancelCommand = new ReplayCommand((Action<object>)CancelCommandHandler);
			RestoreCommand = new ReplayCommand((Action<object>)RestoreCommandHandler);
		}

		public override void LoadData(object data)
		{
			((ViewModelBase)this).LoadData(data);
			storage = data as IBackupStorage;
			if (storage == null)
			{
				return;
			}
			List<BackupResource> list = new List<BackupResource>();
			string version = string.Empty;
			Dictionary<string, int> dictionary = null;
			Dictionary<string, List<BackupResource>> dictionary2 = null;
			try
			{
				list = storage.OpenRead(out version).GetChildResources(null);
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Read file[" + storage.StoragePath + "] failed,throw exception:" + ex, false);
			}
			if (list == null || list.Count == 0)
			{
				return;
			}
			try
			{
				list = (from m in list.ToLookup((BackupResource m) => m.Tag)
					select m.First()).ToList();
				_ = HostProxy.deviceManager.MasterDevice;
				restoreWorker = new DeviceRestoreWorkerEx(null, null, storage);
				restoreWorker.PrepareWorker(list.Select((BackupResource m) => m.Tag).ToList());
				dictionary = restoreWorker.ResourcesCountMapping;
				dictionary2 = restoreWorker.TypeResourceMapping;
			}
			catch (Exception ex2)
			{
				LogHelper.LogInstance.Error("Read resource file info[" + storage.StoragePath + "] failed,throw exception:" + ex2, false);
			}
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			List<CategoryViewModel> list2 = new List<CategoryViewModel>();
			foreach (CategoryViewModel view in CategoriesViewModel.CategoriesList)
			{
				if (view.ResourceType == "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}" || view.ResourceType == "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}" || view.ResourceType == "{89D4DB68-4258-4002-8557-E65959C558B3}" || ((DeviceEx)val).ConnectedAppType == "Moto")
				{
					if (dictionary?.ContainsKey(view.ResourceType) == true)
					{
						((ComboBoxModel)view).IsChecked = false;
						((ComboBoxModel)view).CountNum = dictionary[view.ResourceType];
						view.Count = dictionary[view.ResourceType];
						((ComboBoxModel)view).ToggleButtonVisibility = (Visibility)2;
						view.Tag = new List<BackupResource>(dictionary2[view.ResourceType]);
						list2.Add(view);
					}
				}
				else if (dictionary2?.ContainsKey(view.ResourceType) == true)
				{
					List<BackupResource> list3 = dictionary2[view.ResourceType];
					((ComboBoxModel)view).CountNum = list3.Count;
					view.Count = list3.Count;
					List<CategoryViewModel> collection = list3.GroupBy(delegate(BackupResource n)
					{
						string[] array = n.Value.Split(new char[1] { '/' });
						return (array == null || array.Length <= 1) ? string.Empty : array[^2];
					}).Select(delegate(IGrouping<string, BackupResource> n)
					{
						CategoryViewModel categoryViewModel = new CategoryViewModel();
						((ComboBoxModel)categoryViewModel).Key = n.Key;
						((ComboBoxModel)categoryViewModel).CountNum = n.Count();
						((ComboBoxModel)categoryViewModel).ExtraData = n.ToList();
						((ComboBoxModel)categoryViewModel).Parent = (ComboBoxModel)(object)view;
						return categoryViewModel;
					}).ToList();
					((ComboBoxModel)view).Childs = new ObservableCollection<ComboBoxModel>((IEnumerable<ComboBoxModel>)collection);
					((ComboBoxModel)view).IsChecked = false;
					list2.Add(view);
					((ComboBoxModel)view).ToggleButtonVisibility = (Visibility)((((ComboBoxModel)view).CountNum <= 0) ? 2 : 0);
				}
			}
			CategoriesViewModel.LoadCategories(list2);
			FireCategorySelectionChanged();
		}

		private void CancelCommandHandler(object parameter)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Invalid comparison between Unknown and I4
			DeviceEx currentDevice = Context.CurrentDevice;
			if (currentDevice != null && (int)currentDevice.SoftStatus == 2)
			{
				Context.CurrentRestoreViewType = ViewType.RESTOREMAIN;
				Context.Switch(ViewType.RESTOREMAIN, level2: true);
			}
			else
			{
				Context.Switch(ViewType.START);
			}
		}

		private void GoRestoreMainView()
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Invalid comparison between Unknown and I4
			DeviceEx currentDevice = Context.CurrentDevice;
			if (currentDevice != null && (int)currentDevice.SoftStatus == 2)
			{
				Context.CurrentRestoreViewType = ViewType.RESTOREMAIN;
				Context.Switch(ViewType.RESTOREMAIN, null, reload: true, level2: true);
			}
			else
			{
				Context.Switch(ViewType.START);
			}
		}

		private void RestoreCommandHandler(object parameter)
		{
			//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			DeviceEx currentDevice = Context.CurrentDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
			if (val == null)
			{
				return;
			}
			doRetry = false;
			restoreWorker._workerList.ForEach(delegate(IWorker p)
			{
				RestoreWorkerAbstractEx obj = p as RestoreWorkerAbstractEx;
				obj.ChildResourceNodes.Clear();
				obj.RetryNodes?.Clear();
			});
			LogHelper.LogInstance.Info("========================restore start===========================", false);
			foreach (CategoryViewModel category in CategoriesViewModel.Categories)
			{
				if (!category.IsSelected)
				{
					continue;
				}
				List<BackupResource> list = null;
				if (category.ResourceType == "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}")
				{
					new AppServiceRequest(val.ExtendDataFileServiceEndPoint, val.RsaSocketEncryptHelper).RequestString(21, "getIdAndSizeMapping", (Header)null);
					list = category.Tag as List<BackupResource>;
				}
				else if (!(category.ResourceType == "{89D4DB68-4258-4002-8557-E65959C558B3}"))
				{
					list = ((!(category.ResourceType == "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}") && !(((DeviceEx)val).ConnectedAppType == "Moto")) ? (from p in ((ComboBoxModel)category).Childs?.OfType<CategoryViewModel>()
						where p.IsSelected
						select p).SelectMany((CategoryViewModel n) => (((ComboBoxModel)n).ExtraData != null) ? (((ComboBoxModel)n).ExtraData as List<BackupResource>) : new List<BackupResource>())?.ToList() : (category.Tag as List<BackupResource>));
				}
				else
				{
					new AppServiceRequest(val.ExtendDataFileServiceEndPoint, val.RsaSocketEncryptHelper).RequestString(22, "getIdAndSizeMapping", (Header)null);
					list = category.Tag as List<BackupResource>;
				}
				if (list != null && list.Count > 0)
				{
					(restoreWorker._workerList.FirstOrDefault((IWorker p) => p.WorkerId == category.ResourceType) as RestoreWorkerAbstractEx).ChildResourceNodes.AddRange(list);
					LogHelper.LogInstance.Debug(string.Format("restore resources type:[{0}], file count:[{1}], file total size:[{2}].", ResourceTypeDefine.ResourceTypeMap[category.ResourceType], list.Count, GlobalFun.ConvertLong2String(list.Sum((BackupResource n) => n.AssociatedStreamSize), "F1", true)), false);
				}
			}
			DoRestoreEx();
		}

		private void DoRestoreEx()
		{
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Expected O, but got Unknown
			//IL_00f0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fa: Expected O, but got Unknown
			//IL_0101: Unknown result type (might be due to invalid IL or missing references)
			//IL_010b: Expected O, but got Unknown
			if (storage == null)
			{
				return;
			}
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice device = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (device == null)
			{
				return;
			}
			retryselectedTypes = new List<string>();
			retryIdList = new Dictionary<string, List<string>>();
			string modelName = Context.CurrentDevice.Property.ModelName;
			WorkTransferWindowWrapper progress = new WorkTransferWindowWrapper(modelName, "K1405", "K1400", true);
			VM = progress.Vm;
			Context.RsaMainWindow.ChangeIsEnabled(false, "13f79fe4cfc98747c78794a943886bcd");
			BackupRestoreMainViewModel mv11 = HostProxy.ViewContext.FindViewModel<BackupRestoreMainViewModel>(typeof(BackupRestoreMainView), (string)null);
			if (mv11 != null)
			{
				mv11.TitleBarlVisible = (Visibility)2;
				mv11.BtnHelpGuidelVisible = (Visibility)2;
			}
			progress.DeviceId = ((DeviceEx)device).Identifer;
			BusinessData businessData = new BusinessData((BusinessType)2020, (DeviceEx)(object)device, (BusinessStatus)0);
			restoreWorker.TaskContext = (IAsyncTaskContext)new AsyncTaskContext((object)null);
			restoreWorker.UpdateDevice(device);
			if (!CheckSpace(restoreWorker).Result)
			{
				return;
			}
			progress.OnRetryCommandFired = delegate
			{
				if (restoreWorker != null && device != null)
				{
					LogHelper.LogInstance.Info("========================restore retry===========================", false);
					int num = retryIdList.Sum((KeyValuePair<string, List<string>> p) => p.Value.Count);
					doRetry = true;
					progress.Init(num);
					Task.Run(delegate
					{
						startRestoreTime = DateTime.Now;
						restoreWorker.PrepareWorker(retryselectedTypes, retryIdList);
						retryIdList.Clear();
						retryselectedTypes.Clear();
						RestoreViewModel restoreViewModel = this;
						DeviceEx currentDevice = Context.CurrentDevice;
						restoreViewModel.locConnecRestoreDevice = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
						restoreWorker.DoProcess(null);
						CycleTime = (DateTime.Now - startRestoreTime).Seconds;
					});
				}
			};
			progress.CompletedCallback = delegate
			{
				progress.UpdateResultTitle("K1407", "#005D7F");
				LogHelper.LogInstance.Info("========================restore end===========================", false);
			};
			progress.BeginProcess((Action<WorkTransferWindowWrapper>)delegate(WorkTransferWindowWrapper self)
			{
				//IL_012d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0137: Expected O, but got Unknown
				bool isCancel = false;
				try
				{
					self.OnCancelCmmandFired = delegate
					{
						isCancel = true;
						LogHelper.LogInstance.Info("========================restore cancel===========================", false);
					};
					self.CloseWindowCallback = delegate(int code)
					{
						if (code == -1)
						{
							CycleTime = (DateTime.Now - startRestoreTime).Seconds;
						}
						Task.Run(delegate
						{
							if (executeResult.HasFailedUndo && HostProxy.GlobalCache.Get("BackupRestoreHasFailed") == null)
							{
								HostProxy.GlobalCache.AddOrUpdate("BackupRestoreHasFailed", (object)true);
							}
							sw.Stop();
							HostProxy.BehaviorService.Collect((BusinessType)2020, businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)((code == -1) ? 30 : ((executeResult.Status == 1) ? 10 : 20)), (object)null));
						});
						SysSleepManager.ResetSleep();
						storage?.Dispose();
						((ICancel)restoreWorker.TaskContext).Cancel();
						GoRestoreMainView();
						if (mv11 != null)
						{
							mv11.TitleBarlVisible = (Visibility)0;
							mv11.BtnHelpGuidelVisible = (Visibility)0;
						}
						UploadRestoreLogToSite();
						Context.RsaMainWindow.ChangeIsEnabled(true, "13f79fe4cfc98747c78794a943886bcd");
					};
					self.ProgressMaxValue = restoreWorker.GetFileCount();
					string resourceType_Ref = string.Empty;
					_ = string.Empty;
					Context.RegisterWorker(restoreWorker);
					restoreWorker.ResourceTypeStartRestoreCallback = delegate(string resourceType, int count)
					{
						HostProxy.CurrentDispatcher.Invoke((Action)delegate
						{
							resourceType_Ref = sRestorceProgressResourceTypeTitleMapping[resourceType];
							LogHelper.LogInstance.Info("start restore resource type:[" + resourceType_Ref + "].", false);
							if (doRetry)
							{
								HostProxy.CurrentDispatcher.Invoke((Action)delegate
								{
									self.ChangeCurrentDeatilsGroupViewMode(resourceType_Ref, count);
								});
							}
							else
							{
								self.SetSubProgressInfo(resourceType_Ref, count);
							}
						});
					};
					restoreWorker.ResourceItemFinishRestoreCallback = delegate(string resType, string id, string path, BackupRestoreResult _result)
					{
						//IL_0012: Unknown result type (might be due to invalid IL or missing references)
						//IL_002b: Unknown result type (might be due to invalid IL or missing references)
						//IL_0112: Unknown result type (might be due to invalid IL or missing references)
						//IL_0100: Unknown result type (might be due to invalid IL or missing references)
						executeResult.Update(resType, 1, _result, doRetry);
						if ((int)_result == 0)
						{
							if (doRetry)
							{
								self.RetrySuccess(id, path);
							}
							else
							{
								self.AddSuccessCount(id, 1);
							}
						}
						else
						{
							if (!retryselectedTypes.Contains(resType))
							{
								retryselectedTypes.Add(resType);
							}
							if (retryIdList.ContainsKey(resType))
							{
								retryIdList[resType].Add(id);
							}
							else
							{
								retryIdList.Add(resType, new List<string> { id });
							}
							if (doRetry)
							{
								self.RetryFailed(1, _result);
							}
							else
							{
								self.AddFailCount(resType, id, path, 1, _result);
							}
						}
					};
					restoreWorker.ResourceItemRestoreProgressCallback = delegate(string resType, string path, int rl, long rt, long len)
					{
						HostProxy.CurrentDispatcher.Invoke((Action)delegate
						{
							self.UpdateRate(path, rt, len);
						});
					};
					startRestoreTime = DateTime.Now;
					executeResult = new ResourceExecuteResult();
					executeResult.SetIsInternal(true);
					sw = new Stopwatch();
					sw.Start();
					SysSleepManager.PreventSleep();
					RestoreViewModel restoreViewModel = this;
					DeviceEx currentDevice = Context.CurrentDevice;
					restoreViewModel.locConnecRestoreDevice = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
					restoreWorker.DoProcess(null);
					CycleTime = (DateTime.Now - startRestoreTime).Seconds;
				}
				catch (Exception ex)
				{
					if (!isCancel)
					{
						LogHelper.LogInstance.Error("DoRestore throw ex:" + ex, false);
						self.Finish();
					}
				}
			});
		}

		public string GetMarktNameByModelName(string modelname)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			dictionary.Add("modelName", modelname);
			DeviceModelInfoModel deviceModelInfoModel = new ApiService().RequestContent<DeviceModelInfoModel>(WebApiUrl.GET_FASTBOOTDATA_RECIPE, (object)dictionary, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
			if (deviceModelInfoModel != null)
			{
				return deviceModelInfoModel.MarketName;
			}
			return modelname;
		}

		private void UploadRestoreLogToSite()
		{
			Task.Run(delegate
			{
				//IL_0258: Unknown result type (might be due to invalid IL or missing references)
				//IL_0115: Unknown result type (might be due to invalid IL or missing references)
				//IL_011a: Unknown result type (might be due to invalid IL or missing references)
				lmsa_record_backup_restore lmsa_record_backup_restore2 = new lmsa_record_backup_restore();
				Dictionary<string, Dictionary<string, int>> resultMap = executeResult.ResultMap;
				KeyValuePair<string, Dictionary<string, int>> keyValuePair = resultMap.FirstOrDefault((KeyValuePair<string, Dictionary<string, int>> x) => x.Key == "Setting");
				int settingIsInternal = ((keyValuePair.Value != null) ? keyValuePair.Value["IsInternal"] : 0);
				TcpAndroidDevice val = locConnecRestoreDevice;
				foreach (KeyValuePair<string, Dictionary<string, int>> item in resultMap)
				{
					if (ResourceTypeDefine.ResourceTypeMap.FirstOrDefault((KeyValuePair<string, string> x) => x.Value == item.Key).Value != null)
					{
						lmsa_record_backup_restore2.backupRestoreComponents.Add(ConvertModelValueToComponent(item));
					}
				}
				if (val != null)
				{
					lmsa_record_backup_restore2.androidVersion = ((DeviceEx)val).Property.AndroidVersion;
					lmsa_record_backup_restore2.appType = ((DeviceEx)val).ConnectedAppType;
					lmsa_record_backup_restore2.batteryQuantityPercentage = (int)((DeviceEx)val).Property.BatteryQuantityPercentage;
					lmsa_record_backup_restore2.brand = ((DeviceEx)val).Property.Brand;
					lmsa_record_backup_restore2.connectType = ((object)((DeviceEx)val).ConnectType/*cast due to .constrained prefix*/).ToString();
					lmsa_record_backup_restore2.externalStoragePath = ((DeviceEx)val).Property.ExternalStoragePath;
					lmsa_record_backup_restore2.freeExternalStorage = ((DeviceEx)val).Property.FreeExternalStorage;
					lmsa_record_backup_restore2.freeInternalStorage = ((DeviceEx)val).Property.FreeInternalStorage;
					lmsa_record_backup_restore2.imei1 = ((DeviceEx)val).Property.IMEI1;
					lmsa_record_backup_restore2.imei2 = ((DeviceEx)val).Property.IMEI2;
					lmsa_record_backup_restore2.internalStoragePath = ((DeviceEx)val).Property.InternalStoragePath;
					lmsa_record_backup_restore2.modelName = ((DeviceEx)val).Property.ModelName;
					lmsa_record_backup_restore2.marketName = GetMarktNameByModelName(((DeviceEx)val).Property.ModelName);
					lmsa_record_backup_restore2.sn = ((DeviceEx)val).Property.SN;
					lmsa_record_backup_restore2.totalExternalStorage = ((DeviceEx)val).Property.TotalExternalStorage;
					lmsa_record_backup_restore2.totalInternalStorage = ((DeviceEx)val).Property.TotalInternalStorage;
					lmsa_record_backup_restore2.usedExternalStorage = ((DeviceEx)val).Property.UsedExternalStorage;
					lmsa_record_backup_restore2.usedInternalStorage = ((DeviceEx)val).Property.UsedInternalStorage;
				}
				lmsa_record_backup_restore2.cycleTime = CycleTime;
				lmsa_record_backup_restore2.clientDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
				lmsa_record_backup_restore2.backupRestoreType = "BACKUPRESTORE_RESTORE";
				lmsa_record_backup_restore2.settingIsInternal = settingIsInternal;
				lmsa_record_backup_restore2.country = GlobalFun.GetRegionInfo().TwoLetterISORegionName;
				ResponseModel<object> val2 = ((ApiBaseService)new ApiService()).RequestBase(WebApiUrl.FEEDBACK_BACKUP_RESTORE, (object)lmsa_record_backup_restore2, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				if (!val2.success)
				{
					LogHelper.LogInstance.Info("UploadRestoreLogToSite failed Message:" + val2.desc, false);
				}
			});
		}

		public backupRestoreComponents ConvertModelValueToComponent(KeyValuePair<string, Dictionary<string, int>> valuePair)
		{
			return new backupRestoreComponents
			{
				componentType = valuePair.Key.ToUpper(),
				success = valuePair.Value["success"],
				failed = valuePair.Value["failed"],
				undo = valuePair.Value["undo"],
				undoDisconnected = valuePair.Value["undo_disconnected"]
			};
		}

		private bool CheckStorageValid(long size)
		{
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			DeviceEx currentDevice = Context.CurrentDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
			if (Context.CurrentDevice == null)
			{
				return false;
			}
			val.LoadProperty();
			return size < ((DeviceEx)val).Property.FreeInternalStorage;
		}

		private async Task<bool> CheckSpace(DeviceRestoreWorkerEx work)
		{
			long size = 0L;
			foreach (IWorker worker in work._workerList)
			{
				if (worker is RestoreWorkerAbstractEx restoreWorkerAbstractEx)
				{
					restoreWorkerAbstractEx.ChildResourceNodes.ForEach(delegate(BackupResource p)
					{
						size += p.AssociatedStreamSize;
					});
				}
			}
			if (size > 0 && !CheckStorageValid(size))
			{
				await MessageWindowHelper.Instance.Show("K0670", "K0615", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				return false;
			}
			return true;
		}

		public void FireCategorySelectionChanged()
		{
			SelectedCount = CategoriesViewModel.Categories.Count((CategoryViewModel n) => n.IsSelected);
		}
	}
	public class SetPasswordFormItemViewModel : FormItemViewModel
	{
		public SetPasswordFormItemViewModel(IFormVerify verify)
			: base(verify)
		{
		}
	}
	public class SetPasswordViewModel : ViewModelBase
	{
		public string _PassWord;

		public string _ConfirmPassWord;

		public string _ErrorTips;

		public ReplayCommand CloseCommand { get; }

		public ReplayCommand CancelCommand { get; }

		public ReplayCommand OkCommand { get; }

		public ReplayCommand VerifyCommand { get; }

		public string PassWord
		{
			get
			{
				return _PassWord;
			}
			set
			{
				_PassWord = value;
				((NotifyBase)this).OnPropertyChanged("PassWord");
			}
		}

		public string ConfirmPassWord
		{
			get
			{
				return _ConfirmPassWord;
			}
			set
			{
				_ConfirmPassWord = value;
				((NotifyBase)this).OnPropertyChanged("ConfirmPassWord");
			}
		}

		public string ErrorTips
		{
			get
			{
				return _ErrorTips;
			}
			set
			{
				_ErrorTips = value;
				((NotifyBase)this).OnPropertyChanged("ErrorTips");
			}
		}

		public SetPasswordViewModel()
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Expected O, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			CloseCommand = new ReplayCommand((Action<object>)CloseCommandHandler);
			CancelCommand = new ReplayCommand((Action<object>)CancelCommandHandler);
			OkCommand = new ReplayCommand((Action<object>)OkCommandHandler);
			VerifyCommand = new ReplayCommand((Action<object>)VerifyCommandHandler);
		}

		private void CloseCommandHandler(object data)
		{
			((IMessageWindowV6)((data is IMessageWindowV6) ? data : null)).Win.Close();
		}

		private void CancelCommandHandler(object data)
		{
			((IMessageWindowV6)((data is IMessageWindowV6) ? data : null)).Result = false;
			CloseCommandHandler(data);
		}

		private void OkCommandHandler(object data)
		{
			if (ErrorTips == null)
			{
				if (string.IsNullOrEmpty(PassWord) || string.IsNullOrEmpty(ConfirmPassWord))
				{
					ErrorTips = "Required";
					return;
				}
				((IMessageWindowV6)((data is IMessageWindowV6) ? data : null)).Result = true;
				CloseCommandHandler(data);
			}
		}

		private void VerifyCommandHandler(object data)
		{
			if (string.IsNullOrEmpty(PassWord) || string.IsNullOrEmpty(ConfirmPassWord) || PassWord.Equals(ConfirmPassWord))
			{
				ErrorTips = null;
			}
			else
			{
				ErrorTips = "K0027";
			}
		}
	}
	public class StartViewModel : ViewModelBase
	{
		private Visibility _IsShowGetStartBtn;

		private WaitTips m_loadingWindow;

		private bool m_ChangingDH2MA;

		public MainFrameViewModel MFrame => Context.MainFrame;

		public Visibility IsShowGetStartBtn
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _IsShowGetStartBtn;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_IsShowGetStartBtn = value;
				((NotifyBase)this).OnPropertyChanged("IsShowGetStartBtn");
			}
		}

		public ReplayCommand LinkCommand { get; }

		public ReplayCommand GetStarted { get; }

		public StartViewModel()
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			LinkCommand = new ReplayCommand((Action<object>)LinkCommandHandler);
			GetStarted = new ReplayCommand((Action<object>)GetStartedHandler);
		}

		private void LinkCommandHandler(object args)
		{
			Context.Switch(ViewType.USBCONNECTHELPER, null, reload: true);
		}

		private void GetStartedHandler(object args)
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Invalid comparison between Unknown and I4
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Invalid comparison between Unknown and I4
			//IL_006c: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Invalid comparison between Unknown and I4
			//IL_0109: Unknown result type (might be due to invalid IL or missing references)
			//IL_010f: Invalid comparison between Unknown and I4
			DeviceEx _currentDevice = Context.CurrentDevice;
			if (_currentDevice == null || (int)_currentDevice.PhysicalStatus == 7)
			{
				MessageWindowHelper.Instance.Show((string)null, "K2147", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, true);
			}
			else if ((int)_currentDevice.PhysicalStatus == 2 && (int)_currentDevice.SoftStatus == 0)
			{
				MessageWindowHelper.Instance.Show((string)null, "K2148", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, true);
			}
			else
			{
				if (_currentDevice == null || (int)_currentDevice.SoftStatus == 1)
				{
					return;
				}
				Context.RsaMainWindow.SetDeviceConnectIconStatus(-1);
				m_ChangingDH2MA = true;
				Configurations.AppMinVersionCodeOfMoto = 900805000;
				_currentDevice.SoftStatus = (DeviceSoftStateEx)0;
				DevicemgtContantClass.IsOtherToBackAndRestoreAndAutoConnection = false;
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						//IL_000b: Unknown result type (might be due to invalid IL or missing references)
						//IL_0010: Unknown result type (might be due to invalid IL or missing references)
						//IL_003a: Expected O, but got Unknown
						m_loadingWindow = new WaitTips("K1854")
						{
							AutoCloseConditionFunc = () => (int)_currentDevice.PhysicalStatus == 0 || (int)_currentDevice.SoftStatus == 2
						};
					});
				}
				if ((int)_currentDevice.ConnectType != 4)
				{
					MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)m_loadingWindow, (bool?)true);
				}
				_currentDevice.PhysicalStatusChanged -= DH2MA_PhysicalStatusChanged;
				_currentDevice.PhysicalStatusChanged += DH2MA_PhysicalStatusChanged;
				DeviceEx obj = _currentDevice;
				TcpAndroidDevice val = (TcpAndroidDevice)(object)((obj is TcpAndroidDevice) ? obj : null);
				if (val != null)
				{
					val.TcpConnectStepChanged -= DH2MA_SoftStatusChanged;
					val.TcpConnectStepChanged += DH2MA_SoftStatusChanged;
				}
			}
		}

		public void UpdateGetStartBtnStatus(bool btnStatus)
		{
			IsShowGetStartBtn = (Visibility)(!btnStatus);
		}

		public void MotoHelperCheck()
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Invalid comparison between Unknown and I4
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Invalid comparison between Unknown and I4
			//IL_0104: Unknown result type (might be due to invalid IL or missing references)
			//IL_010a: Invalid comparison between Unknown and I4
			DeviceEx _currentDevice = Context.CurrentDevice;
			if (_currentDevice == null || (int)_currentDevice.SoftStatus != 2 || !(_currentDevice.ConnectedAppType == "Moto"))
			{
				return;
			}
			bool? flag = null;
			string text = "K1848";
			if ((int)_currentDevice.ConnectType == 4)
			{
				text = "K1849";
			}
			if (MessageWindowHelper.Instance.Show(string.Empty, text, "K0327", "K0208", true, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)(() => (int)_currentDevice.PhysicalStatus == 0), (bool?)false, false).Result != true)
			{
				return;
			}
			Context.RsaMainWindow.SetDeviceConnectIconStatus(-1);
			m_ChangingDH2MA = true;
			Configurations.AppMinVersionCodeOfMoto = 900805000;
			_currentDevice.SoftStatus = (DeviceSoftStateEx)0;
			DevicemgtContantClass.IsOtherToBackAndRestoreAndAutoConnection = false;
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					//IL_000b: Unknown result type (might be due to invalid IL or missing references)
					//IL_0010: Unknown result type (might be due to invalid IL or missing references)
					//IL_003a: Expected O, but got Unknown
					m_loadingWindow = new WaitTips("K1854")
					{
						AutoCloseConditionFunc = () => (int)_currentDevice.PhysicalStatus == 0 || (int)_currentDevice.SoftStatus == 2
					};
				});
			}
			if ((int)_currentDevice.ConnectType != 4)
			{
				MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)m_loadingWindow, (bool?)true);
			}
			_currentDevice.PhysicalStatusChanged -= DH2MA_PhysicalStatusChanged;
			_currentDevice.PhysicalStatusChanged += DH2MA_PhysicalStatusChanged;
			DeviceEx obj = _currentDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((obj is TcpAndroidDevice) ? obj : null);
			if (val != null)
			{
				val.TcpConnectStepChanged -= DH2MA_SoftStatusChanged;
				val.TcpConnectStepChanged += DH2MA_SoftStatusChanged;
			}
		}

		private void DH2MA_PhysicalStatusChanged(object sender, DevicePhysicalStateEx e)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			if ((int)e == 0)
			{
				Context.RsaMainWindow.SetDeviceConnectIconStatus(99);
				m_ChangingDH2MA = false;
			}
		}

		private void DH2MA_SoftStatusChanged(object sender, TcpConnectStepChangedEventArgs e)
		{
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_0074: Expected I4, but got Unknown
			if (!m_ChangingDH2MA)
			{
				return;
			}
			string step = e.Step;
			if (!(step == "TcpConnect"))
			{
				if (!(step == "InstallApp"))
				{
					return;
				}
				ConnectStepStatus result = e.Result;
				switch ((int)result)
				{
				case 1:
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						WaitTips loadingWindow = m_loadingWindow;
						if (loadingWindow != null)
						{
							((Window)loadingWindow).Close();
						}
					});
					m_ChangingDH2MA = false;
					break;
				case 0:
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						WaitTips loadingWindow = m_loadingWindow;
						if (loadingWindow != null)
						{
							((Window)loadingWindow).Close();
						}
					});
					break;
				case 2:
					break;
				}
				return;
			}
			Context.RsaMainWindow.SetDeviceConnectIconStatus(0);
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				WaitTips loadingWindow = m_loadingWindow;
				if (loadingWindow != null)
				{
					((Window)loadingWindow).Close();
				}
			});
			m_ChangingDH2MA = false;
		}
	}
	public class NavgationItemViewModel : ViewModelBase
	{
		private string _title = string.Empty;

		private bool isDialog;

		private bool isSelected;

		private int? _Count;

		public int Index { get; set; }

		public string Title
		{
			get
			{
				return _title;
			}
			set
			{
				if (!(_title == value))
				{
					_title = value;
					((NotifyBase)this).OnPropertyChanged("Title");
				}
			}
		}

		public bool IsDialog
		{
			get
			{
				return isDialog;
			}
			set
			{
				isDialog = value;
			}
		}

		public Control View { get; set; }

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

		public int? Count
		{
			get
			{
				return _Count;
			}
			set
			{
				_Count = value;
				((NotifyBase)this).OnPropertyChanged("Count");
			}
		}
	}
	public class SubCategoryWindowModel : ViewModelBase
	{
		protected bool FireAllChanged = true;

		private bool? _AllSelected = false;

		protected CategoryViewModel Parent { get; }

		public ObservableCollection<ComboBoxModel> Categories { get; set; }

		public ReplayCommand OnCheckCommand { get; }

		public bool? AllSelected
		{
			get
			{
				return _AllSelected;
			}
			set
			{
				_AllSelected = value;
				FireAllCheck(value);
				((NotifyBase)this).OnPropertyChanged("AllSelected");
			}
		}

		public string Title { get; set; }

		public SubCategoryWindowModel(CategoryViewModel parent, ObservableCollection<ComboBoxModel> categories)
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Expected O, but got Unknown
			OnCheckCommand = new ReplayCommand((Action<object>)OnCheckCommandHandler);
			Title = parent.SubTitle ?? "K1516";
			Parent = parent;
			Categories = categories;
			FireAllSelected();
		}

		public void ChangeParentTitle()
		{
			int? num = Categories.Where((ComboBoxModel n) => (n as CategoryViewModel).IsSelected)?.Sum((ComboBoxModel n) => n.CountNum);
			Parent.ShowSubWindow = false;
			Parent.IsSelected = num > 0;
			if (Parent.IsSelected && num < ((ComboBoxModel)Parent).CountNum)
			{
				((ComboBoxModel)Parent).Value = $"{((ComboBoxModel)Parent).Key}({num}/{((ComboBoxModel)Parent).CountNum})";
			}
			else
			{
				((ComboBoxModel)Parent).Value = $"{((ComboBoxModel)Parent).Key}({((ComboBoxModel)Parent).CountNum})";
			}
			Parent.ShowSubWindow = true;
		}

		private void OnCheckCommandHandler(object data)
		{
			CategoryViewModel obj = data as CategoryViewModel;
			obj.IsSelected = !obj.IsSelected;
			FireAllChanged = false;
			FireAllSelected();
			FireAllChanged = true;
		}

		private void FireAllSelected()
		{
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			if (Categories.Count == 0)
			{
				AllSelected = null;
				return;
			}
			bool flag = true;
			bool flag2 = true;
			foreach (CategoryViewModel item in Categories.OfType<CategoryViewModel>().ToList())
			{
				if ((int)item.SubItemVisible == 0)
				{
					if (item.IsSelected)
					{
						flag2 = false;
					}
					else
					{
						flag = false;
					}
				}
			}
			if (flag)
			{
				AllSelected = true;
			}
			else if (flag2)
			{
				AllSelected = false;
			}
			else
			{
				AllSelected = null;
			}
		}

		private void FireAllCheck(bool? selected)
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			if (!FireAllChanged)
			{
				return;
			}
			foreach (CategoryViewModel category in Categories)
			{
				if ((int)category.SubItemVisible == 0)
				{
					category.IsSelected = selected ?? category.IsSelected;
				}
				else
				{
					category.IsSelected = false;
				}
			}
		}
	}
	public class TipsItemViewModel : ViewModelBase
	{
		private string _tips = string.Empty;

		private Brush _foreground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#9b9b9b"));

		private double _fontSize = 15.0;

		public string Tips
		{
			get
			{
				return _tips;
			}
			set
			{
				if (!(_tips == value))
				{
					_tips = value;
					((NotifyBase)this).OnPropertyChanged("Tips");
				}
			}
		}

		public Brush Foreground
		{
			get
			{
				return _foreground;
			}
			set
			{
				if (_foreground != value)
				{
					_foreground = value;
					((NotifyBase)this).OnPropertyChanged("Foreground");
				}
			}
		}

		public double FontSize
		{
			get
			{
				return _fontSize;
			}
			set
			{
				if (_fontSize != value)
				{
					_fontSize = value;
					((NotifyBase)this).OnPropertyChanged("FontSize");
				}
			}
		}
	}
	public class USBConnectHelperModel : ViewModelBase
	{
		private bool isPhone;

		private int _Index;

		private string _Title;

		private string _AndroidVer7;

		private string _AndroidVer8;

		private string _AndroidVer10;

		private bool _IsNormalPhone;

		private string[] _NotArr;

		private Uri _TutorialImageUri;

		private Visibility _IsNoteVisible;

		private bool _IsBackBtnEnable;

		private bool _IsNextBtnEnable;

		public ReplayCommand DevTypeCommand { get; }

		public ReplayCommand PhoneCommand { get; }

		public ReplayCommand BtnCommand { get; }

		public ReplayCommand GifOverCommand { get; }

		public ReplayCommand GoStartCommand { get; }

		public int Index
		{
			get
			{
				return _Index;
			}
			set
			{
				_Index = value;
				((NotifyBase)this).OnPropertyChanged("Index");
			}
		}

		public string Title
		{
			get
			{
				return _Title;
			}
			set
			{
				_Title = value;
				((NotifyBase)this).OnPropertyChanged("Title");
			}
		}

		public string AndroidVer7
		{
			get
			{
				return _AndroidVer7;
			}
			set
			{
				_AndroidVer7 = value;
				((NotifyBase)this).OnPropertyChanged("AndroidVer7");
			}
		}

		public string AndroidVer8
		{
			get
			{
				return _AndroidVer8;
			}
			set
			{
				_AndroidVer8 = value;
				((NotifyBase)this).OnPropertyChanged("AndroidVer8");
			}
		}

		public string AndroidVer10
		{
			get
			{
				return _AndroidVer10;
			}
			set
			{
				_AndroidVer10 = value;
				((NotifyBase)this).OnPropertyChanged("AndroidVer10");
			}
		}

		public bool IsNormalPhone
		{
			get
			{
				return _IsNormalPhone;
			}
			set
			{
				_IsNormalPhone = value;
				((NotifyBase)this).OnPropertyChanged("IsNormalPhone");
			}
		}

		public Uri[] UriArr { get; set; }

		public string[] NoteArr
		{
			get
			{
				return _NotArr;
			}
			set
			{
				_NotArr = value;
				((NotifyBase)this).OnPropertyChanged("NoteArr");
			}
		}

		public Uri TutorialImageUri
		{
			get
			{
				return _TutorialImageUri;
			}
			set
			{
				_TutorialImageUri = value;
				((NotifyBase)this).OnPropertyChanged("TutorialImageUri");
			}
		}

		public Visibility IsNoteVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _IsNoteVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (_IsNoteVisible != value)
				{
					_IsNoteVisible = value;
					((NotifyBase)this).OnPropertyChanged("IsNoteVisible");
				}
			}
		}

		public bool IsBackBtnEnable
		{
			get
			{
				return _IsBackBtnEnable;
			}
			set
			{
				_IsBackBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsBackBtnEnable");
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

		public USBConnectHelperModel()
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Expected O, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			//IL_006f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Expected O, but got Unknown
			DevTypeCommand = new ReplayCommand((Action<object>)DevTypeCommandHandler);
			PhoneCommand = new ReplayCommand((Action<object>)PhoneCommandHandler);
			GifOverCommand = new ReplayCommand((Action<object>)GifOverCommandHandler);
			BtnCommand = new ReplayCommand((Action<object>)BtnCommandHandler);
			GoStartCommand = new ReplayCommand((Action<object>)GoStartCommandHandler);
		}

		public override void LoadData(object data)
		{
			isPhone = true;
			IsNormalPhone = true;
			SetPhoneView();
			((ViewModelBase)this).LoadData(data);
		}

		private void DevTypeCommandHandler(object data)
		{
			isPhone = Convert.ToBoolean(data as string);
			if (isPhone)
			{
				IsNormalPhone = true;
				SetPhoneView();
			}
			else
			{
				SetTabletView();
			}
		}

		private void PhoneCommandHandler(object data)
		{
			IsNormalPhone = Convert.ToBoolean(data as string);
			SetPhoneView();
		}

		private void GifOverCommandHandler(object data)
		{
			if (Index == 1 && !isPhone)
			{
				IsNoteVisible = (Visibility)((!(bool)data) ? 2 : 0);
			}
		}

		private void BtnCommandHandler(object data)
		{
			if (Convert.ToBoolean(data.ToString()))
			{
				TutorialImageUri = UriArr[++Index];
				IsBackBtnEnable = true;
				IsNextBtnEnable = Index < UriArr.Length - 1;
			}
			else
			{
				TutorialImageUri = UriArr[--Index];
				IsNextBtnEnable = true;
				IsBackBtnEnable = Index > 0;
			}
			IsNoteVisible = (Visibility)2;
		}

		private void GoStartCommandHandler(object data)
		{
			Context.Switch(ViewType.START);
		}

		private void SetPhoneView()
		{
			if (IsNormalPhone)
			{
				Title = "K1066";
				UriArr = new Uri[3]
				{
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone11.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone12.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone13.gif")
				};
				NoteArr = new string[3] { "K1097", "K1098", "K1099" };
			}
			else
			{
				Title = "K1066";
				UriArr = new Uri[3]
				{
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone21.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone22.gif"),
					new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Phone/phone23.gif")
				};
				NoteArr = new string[3] { "K1100", "K1101", "K1108" };
			}
			Initialize();
		}

		private void SetTabletView()
		{
			Title = "K1066";
			UriArr = new Uri[3]
			{
				new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Tablet/tablet31.gif"),
				new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Tablet/tablet32.gif"),
				new Uri("pack://application:,,,/lenovo.themes.generic;component/Resource/UsbDebug/Tablet/tablet33.gif")
			};
			NoteArr = new string[3] { "K1102", "K1103", "K1107" };
			Initialize();
		}

		public void Initialize()
		{
			Index = 0;
			IsNoteVisible = (Visibility)2;
			TutorialImageUri = UriArr[Index];
			IsBackBtnEnable = false;
			IsNextBtnEnable = true;
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.ViewContext
{
	public class Context
	{
		public static SortedList<ViewType, ViewDescription> view = new SortedList<ViewType, ViewDescription>
		{
			{
				ViewType.START,
				new ViewDescription(typeof(StartView), typeof(StartViewModel), (string)null)
			},
			{
				ViewType.USBCONNECTHELPER,
				new ViewDescription(typeof(DeviceTutorialsView), typeof(ViewModelBase), (string)null)
			},
			{
				ViewType.MAIN,
				new ViewDescription(typeof(BackupRestoreMainView), typeof(BackupRestoreMainViewModel), (string)null)
			},
			{
				ViewType.BACKUPMAIN,
				new ViewDescription(typeof(BackUpMainView), typeof(BackupMainViewModel), (string)null)
			},
			{
				ViewType.RESTOREMAIN,
				new ViewDescription(typeof(RestoreMainView), typeof(RestoreMainViewModel), (string)null)
			},
			{
				ViewType.RESTORE,
				new ViewDescription(typeof(RestoreView), typeof(RestoreViewModel), (string)null)
			}
		};

		public static DateTime RefreshTime = DateTime.MinValue;

		public static bool IsNoNeedRefresh = false;

		public static string Refreshcategory = string.Empty;

		private static List<IDisposable> resources = new List<IDisposable>();

		private static readonly object SyncRoot = new object();

		private static Action<IDisposable> InternalDisposeAction = delegate(IDisposable res)
		{
			try
			{
				res.Dispose();
			}
			catch (Exception)
			{
			}
		};

		public static ViewType CurrentRestoreViewType = ViewType.RESTOREMAIN;

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

		public static BackupRestoreMainViewModel Level2Frame { get; set; }

		public static DeviceEx CurrentDevice { get; set; }

		public static IMessageBox RsaMainWindow { get; set; }

		public static ViewType CurrentViewType { get; set; }

		public static void Switch(ViewType viewType, bool level2 = false)
		{
			Switch(viewType, null, reload: false, level2);
		}

		public static void Switch(ViewType viewType, object initilizeData, bool reload, bool level2 = false)
		{
			BackupMainViewModel backupMainViewModel = null;
			RestoreViewModel restoreViewModel = null;
			if (Level2Frame != null && Level2Frame.CurrentView != null && Level2Frame.CurrentView is BackUpMainView && ((FrameworkElement)(Level2Frame.CurrentView as BackUpMainView)).DataContext is BackupMainViewModel)
			{
				backupMainViewModel = ((FrameworkElement)(Level2Frame.CurrentView as BackUpMainView)).DataContext as BackupMainViewModel;
			}
			if (Level2Frame != null && Level2Frame.CurrentView != null && Level2Frame.CurrentView is RestoreView && ((FrameworkElement)(Level2Frame.CurrentView as RestoreView)).DataContext is RestoreViewModel)
			{
				restoreViewModel = ((FrameworkElement)(Level2Frame.CurrentView as RestoreView)).DataContext as RestoreViewModel;
			}
			if ((backupMainViewModel != null && backupMainViewModel.VM != null && backupMainViewModel.VM.IsRunning.HasValue) || (restoreViewModel != null && restoreViewModel.VM != null && restoreViewModel.VM.IsRunning.HasValue))
			{
				Level2Frame.TitleBarlVisible = (Visibility)2;
			}
			else if (CurrentViewType != viewType)
			{
				CurrentViewType = viewType;
				HostProxy.CurrentDispatcher.Invoke((Action)delegate
				{
					MainFrame.BackVisibility = (Visibility)((CurrentViewType != ViewType.USBCONNECTHELPER) ? 2 : 0);
					MainFrame.BottomLineVisibility = (Visibility)((CurrentViewType == ViewType.START) ? 2 : 0);
				});
				object currentView = HostProxy.ViewContext.SwitchView(view[viewType], initilizeData, reload, false);
				if (level2)
				{
					Level2Frame.CurrentView = currentView;
				}
				else
				{
					MainFrame.CurrentView = currentView;
				}
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

		public static void RegisterWorker(IDisposable resource)
		{
			lock (SyncRoot)
			{
				if (!resources.Contains(resource))
				{
					resources.Add(resource);
				}
			}
		}

		public static void RemoveWorker(IDisposable resource)
		{
			lock (SyncRoot)
			{
				if (resources.Contains(resource))
				{
					resources.Remove(resource);
				}
			}
		}

		public static void DisposeWorker()
		{
			List<IDisposable> list = null;
			lock (SyncRoot)
			{
				list = resources.ToList();
				resources.Clear();
			}
			foreach (IDisposable item in list)
			{
				InternalDisposeAction.BeginInvoke(item, delegate(IAsyncResult callbackAR)
				{
					InternalDisposeAction.EndInvoke(callbackAR);
				}, null);
			}
		}
	}
	public enum ViewType
	{
		START = 1,
		USBCONNECTHELPER = 2,
		MAIN = 10,
		BACKUPMAIN = 20,
		RESTOREMAIN = 30,
		RESTORE = 31
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.EntityModel
{
	public class backupRestoreComponents
	{
		public int success { get; set; }

		public int failed { get; set; }

		public int undo { get; set; }

		public int undoDisconnected { get; set; }

		public string componentType { get; set; }
	}
	[Serializable]
	public class DeviceModelInfoModel
	{
		[JsonProperty("category")]
		public string Category { get; set; }

		[JsonProperty("marketName")]
		public string MarketName { get; set; }

		[JsonProperty("modelName")]
		public string ModelName { get; set; }

		[JsonProperty("brand")]
		public string Brand { get; set; }

		[JsonProperty("platform")]
		public string PlatForm { get; set; }

		[JsonProperty("readSupport")]
		public bool ReadSupport { get; set; }

		[JsonProperty("readFlow")]
		public string Recipe { get; set; }
	}
	public class lmsa_record_backup_restore
	{
		public string backupRestoreType { get; set; } = "BACKUPRESTORE_BACKUP";

		public string appType { get; set; }

		public string connectType { get; set; }

		public string androidVersion { get; set; }

		public string country { get; set; }

		public string brand { get; set; }

		public string imei1 { get; set; }

		public string imei2 { get; set; }

		public string modelName { get; set; }

		public string marketName { get; set; }

		public string sn { get; set; }

		public int batteryQuantityPercentage { get; set; }

		public string internalStoragePath { get; set; }

		public string externalStoragePath { get; set; }

		public long totalExternalStorage { get; set; }

		public long usedExternalStorage { get; set; }

		public long totalInternalStorage { get; set; }

		public long usedInternalStorage { get; set; }

		public long freeExternalStorage { get; set; }

		public long freeInternalStorage { get; set; }

		public int cycleTime { get; set; }

		public string clientDate { get; set; }

		public int settingIsInternal { get; set; }

		public List<backupRestoreComponents> backupRestoreComponents { get; set; } = new List<backupRestoreComponents>();
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.Converters
{
	public class BackupRestoreChooseImangeConverters : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_000a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Expected O, but got Unknown
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			BitmapImage result = new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.phoneManager;component/Resources/Images/not-choose.png"));
			try
			{
				if ((bool)value)
				{
					result = new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.phoneManager;component/Resources/Images/choose.png"));
				}
			}
			catch (Exception)
			{
			}
			return result;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class BackupImageTitleFormatConvert : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			string result = string.Empty;
			try
			{
				object arg = values[0];
				int num = (int)values[1];
				int num2 = (int)values[2];
				result = ((num2 >= 0) ? $"{arg}({num2}/{num})" : $"{arg}({num})");
			}
			catch (Exception)
			{
			}
			return result;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class BackupNotesTextboxTipsVisbility : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			Visibility val = (Visibility)2;
			if (value == null)
			{
				return val;
			}
			if (value.ToString().Length >= 50)
			{
				val = (Visibility)0;
			}
			return val;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class BackupNotesTextBlockVisbility : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return (object)(Visibility)(((bool)value) ? 2 : 0);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class BackupRestoreButtonEnableConvert : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Invalid comparison between Unknown and I4
			return (int)(Visibility)value == 0;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class BackupRestoreButtonContentConvert : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			string result = "K0481";
			if ((int)(Visibility)value != 0)
			{
				result = "Backup & restore (USB only)";
			}
			return result;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class CategoryImageConvert : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			string[] array = parameter.ToString().Split(new char[1] { ':' });
			if (value == null)
			{
				return array[2];
			}
			int result = 0;
			bool flag = bool.Parse(array[0]);
			int.TryParse(value.ToString(), out result);
			if (result > 0 == flag)
			{
				return array[1];
			}
			return array[2];
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.Common
{
	public interface ILoading
	{
		void Show(object handler);

		void Hiden(object handler);

		void Abort();
	}
	public class AsyncDataLoader
	{
		public static void BeginLoading(Action action, ILoading view)
		{
			object handler = new object();
			if (action == null)
			{
				return;
			}
			action.BeginInvoke(delegate(IAsyncResult ar)
			{
				try
				{
					(ar.AsyncState as Action).EndInvoke(ar);
					Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
					if (currentDispatcher != null)
					{
						currentDispatcher.Invoke((Action)delegate
						{
							view?.Hiden(handler);
						});
					}
				}
				catch (Exception)
				{
				}
			}, action);
			view?.Show(handler);
		}
	}
	public class BackRestoreNagationDataTemplateSelector : DataTemplateSelector
	{
		public override DataTemplate SelectTemplate(object item, DependencyObject container)
		{
			FrameworkElement val = (FrameworkElement)(object)((container is FrameworkElement) ? container : null);
			if ((item as NavgationItemViewModel).Index == 0)
			{
				object obj = val.FindResource((object)"leftRadiusNagativeDataTemplate");
				return (DataTemplate)((obj is DataTemplate) ? obj : null);
			}
			object obj2 = val.FindResource((object)"NormalNagativeDataTemplate");
			return (DataTemplate)((obj2 is DataTemplate) ? obj2 : null);
		}
	}
	public class BackupRestoreStaticResources
	{
		private static BackupRestoreStaticResources _singleInstance;

		public readonly string MUSIC = "Songs";

		public readonly string PIC = "Pictures";

		public readonly string APP = "Apps";

		public readonly string CONTACT = "Contacts";

		public readonly string SMS = "SMS";

		public readonly string VIDEO = "Videos";

		public readonly string CALLLOG = "Call log";

		public readonly string FILE = "Files";

		public static BackupRestoreStaticResources SingleInstance
		{
			get
			{
				if (_singleInstance == null)
				{
					_singleInstance = new BackupRestoreStaticResources();
				}
				return _singleInstance;
			}
		}

		private BackupRestoreStaticResources()
		{
		}
	}
	public class ResourcesHelper
	{
		public class StringResources
		{
			private static StringResources _singleInstance;

			public readonly string PC_SPACE_NOT_ENOUGH = "The target device doesn't have enough space. Release some and try again.";

			public readonly string CONTACT_DELETE_CONTACT_CONTENT = string.Empty;

			public readonly string CONTACT_DELETE_CALLLOG_CONTENT = string.Empty;

			public readonly string CONTACT_DELETE_SMS_CONTENT = string.Empty;

			public readonly string CONTACT_DELETE_TITLE = string.Empty;

			public readonly string MUSIC_PLAY_WARN = string.Empty;

			public readonly string CONTACT_ADD_WARN_CONTENT = string.Empty;

			public readonly string CONTACT_EMPUTY_WARN_CONTENT = string.Empty;

			public readonly string UNINSTALL_CONFIRM_TITLE = string.Empty;

			public readonly string UNINSTALL_APP_CONTENT = string.Empty;

			public readonly string UNINSTALL_SINGAL_APP_CONTENT = string.Empty;

			public readonly string MUSIC_DELETE_CONTENT = string.Empty;

			public readonly string PIC_DELETE_CONTENT = string.Empty;

			public readonly string SMS_DELETE_CONTENT = string.Empty;

			public readonly string VIDEO_DELETE_CONTENT = string.Empty;

			public readonly string APP_INSTALL_TITLE = string.Empty;

			public readonly string APP_UNINSTALL_TITLE = string.Empty;

			public readonly string APP_INSTALL_CONTENT = string.Empty;

			public readonly string APP_UNINSTALL_CONTENT = string.Empty;

			public readonly string PIC_CONTENT = string.Empty;

			public readonly string PIC_IMPORT_MESSAGE = string.Empty;

			public readonly string PIC_EXPORT_MESSAGE = string.Empty;

			public readonly string MUSIC_CONTENT = string.Empty;

			public readonly string MUSIC_IMPORT_MESSAGE = string.Empty;

			public readonly string MUSIC_EXPORT_MESSAGE = string.Empty;

			public readonly string APP_CONTENT = string.Empty;

			public readonly string APP_IMPORT_MESSAGE = string.Empty;

			public readonly string APP_IMPORT_SUCCESS = string.Empty;

			public readonly string APP_IMPORT_FAILED = string.Empty;

			public readonly string APP_EXPORT_MESSAGE = string.Empty;

			public readonly string APP_EXPORT_SUCCESS = string.Empty;

			public readonly string APP_UNINSTALL_MESSAGE = string.Empty;

			public readonly string VIDEO_CONTENT = string.Empty;

			public readonly string VIDEO_IMPORT_MESSAGE = string.Empty;

			public readonly string VIDEO_EXPORT_MESSAGE = string.Empty;

			public readonly string SMS_CONTENT = string.Empty;

			public readonly string SMS_IMPORT_MESSAGE = string.Empty;

			public readonly string SMS_EXPORT_MESSAGE = string.Empty;

			public readonly string SMS_SEND_FINISHED_MESSAGE = string.Empty;

			public readonly string SMS_DELETE_MESSAGE = string.Empty;

			public readonly string SMS_SENDING_MESSAGE = string.Empty;

			public readonly string BACKUPRESTORE_RELEASE_CONTENT = string.Empty;

			public readonly string BACKUPRESTORE_RELEASE_MESSAGE_NORMAL = string.Empty;

			public readonly string BACKUPRESTORE_RELEASE_MESSAGE_SUCCESS = string.Empty;

			public readonly string BACKUPRESTORE_RELEASE_MESSAGE_FAILED = string.Empty;

			public readonly string IMPORT_SUCCESS_MESSAGE = string.Empty;

			public readonly string IMPORT_FAILED_MESSAGE = string.Empty;

			public readonly string EXPORT_SUCCESS_MESSAGE = string.Empty;

			public readonly string EXPORT_FAILED_MESSAGE = string.Empty;

			public readonly string DELETE_SUCCESS_MESSAGE = string.Empty;

			public readonly string UNINSTALL_SUCCESS_MESSAGE = string.Empty;

			public readonly string NOT_ENOUGH_SAPCE = string.Empty;

			public readonly string FILE_NOT_EXISTS = string.Empty;

			public readonly string ProgressButtonContent_Cancel = string.Empty;

			public readonly string ProgressButtonContent_Finish = string.Empty;

			public readonly string ProgressButtonContent_Failed = string.Empty;

			public readonly string ProgressButtonContent_Ok = string.Empty;

			public readonly string ProgressTipsContent_Backup_Normal = string.Empty;

			public readonly string ProgressTipsContent_Backup_Finish_First = string.Empty;

			public readonly string ProgressTipsContent_Backup_Finish_End = string.Empty;

			public readonly string ProgressTipsContent_Backup_Failed = string.Empty;

			public readonly string ProgressTipsContent_Restore_Normal = string.Empty;

			public readonly string ProgressTipsContent_Restore_Finish_First = string.Empty;

			public readonly string ProgressTipsContent_Restore_Finish_End = string.Empty;

			public readonly string ProgressTipsContent_Restore_Failed = string.Empty;

			public readonly string CONFIRMDELETE_TITLE = string.Empty;

			public readonly string CONFIRMDELETE_CONTENT = string.Empty;

			public static StringResources SingleInstance
			{
				get
				{
					if (_singleInstance == null)
					{
						_singleInstance = new StringResources();
					}
					return _singleInstance;
				}
			}

			private StringResources()
			{
				_ = Application.Current;
				CONTACT_DELETE_CONTACT_CONTENT = "K0534";
				CONTACT_DELETE_CALLLOG_CONTENT = "K0540";
				CONTACT_DELETE_SMS_CONTENT = "K0587";
				CONTACT_DELETE_TITLE = "K0585";
				MUSIC_PLAY_WARN = "K0673";
				CONTACT_ADD_WARN_CONTENT = "Input a complete birth date";
				CONTACT_EMPUTY_WARN_CONTENT = "K0523";
				UNINSTALL_CONFIRM_TITLE = "K0490";
				UNINSTALL_APP_CONTENT = "K0492";
				UNINSTALL_SINGAL_APP_CONTENT = "K0491";
				MUSIC_DELETE_CONTENT = "K0556";
				PIC_DELETE_CONTENT = "K0563";
				SMS_DELETE_CONTENT = "Delete selected SMS?";
				VIDEO_DELETE_CONTENT = "K0569";
				APP_INSTALL_TITLE = "K0498";
				APP_UNINSTALL_TITLE = "K0493";
				APP_INSTALL_CONTENT = "K0501";
				APP_UNINSTALL_CONTENT = "K0502";
				PIC_CONTENT = "Pictures";
				PIC_IMPORT_MESSAGE = "K0560";
				PIC_EXPORT_MESSAGE = "K0561";
				MUSIC_CONTENT = "Songs";
				MUSIC_IMPORT_MESSAGE = "K0554";
				MUSIC_EXPORT_MESSAGE = "K0555";
				APP_CONTENT = "Apps";
				APP_IMPORT_MESSAGE = "K0497";
				APP_IMPORT_SUCCESS = "K0499";
				APP_IMPORT_FAILED = "K0709";
				APP_EXPORT_MESSAGE = "K0500";
				APP_EXPORT_SUCCESS = "K0542";
				APP_UNINSTALL_MESSAGE = "K0494";
				VIDEO_CONTENT = "Videos";
				VIDEO_IMPORT_MESSAGE = "K0566";
				VIDEO_EXPORT_MESSAGE = "K0567";
				SMS_CONTENT = "SMS";
				SMS_IMPORT_MESSAGE = "Importing messages...";
				SMS_EXPORT_MESSAGE = "K0588";
				SMS_DELETE_MESSAGE = "K0584";
				SMS_SEND_FINISHED_MESSAGE = "K0589";
				SMS_SENDING_MESSAGE = "K0590";
				BACKUPRESTORE_RELEASE_CONTENT = "K0607";
				BACKUPRESTORE_RELEASE_MESSAGE_NORMAL = "K0606";
				BACKUPRESTORE_RELEASE_MESSAGE_SUCCESS = "K0608";
				BACKUPRESTORE_RELEASE_MESSAGE_FAILED = "K0609";
				IMPORT_SUCCESS_MESSAGE = "K0543";
				IMPORT_FAILED_MESSAGE = "K0679";
				EXPORT_SUCCESS_MESSAGE = "K0542";
				EXPORT_FAILED_MESSAGE = "K0653";
				DELETE_SUCCESS_MESSAGE = "K0682";
				UNINSTALL_SUCCESS_MESSAGE = "K0495";
				NOT_ENOUGH_SAPCE = "K0623";
				FILE_NOT_EXISTS = "The picture doesn't exist in your phone any more";
				ProgressButtonContent_Cancel = "K0208";
				ProgressButtonContent_Finish = "K0386";
				ProgressButtonContent_Failed = "K0337";
				ProgressButtonContent_Ok = "K0327";
				ProgressTipsContent_Backup_Normal = "K0600";
				ProgressTipsContent_Backup_Finish_First = "K0601";
				ProgressTipsContent_Backup_Finish_End = "K0544";
				ProgressTipsContent_Backup_Failed = "K0617";
				ProgressTipsContent_Restore_Normal = "K0613";
				ProgressTipsContent_Restore_Finish_First = "K0614";
				ProgressTipsContent_Restore_Finish_End = "K0602";
				ProgressTipsContent_Restore_Failed = "K0618";
				CONFIRMDELETE_TITLE = "K0208";
				CONFIRMDELETE_CONTENT = "K0541";
			}
		}

		public class SymbolResources
		{
			public static string LeftBrackets => "(";

			public static string RightBrackets => ")";

			public static string ForwardSlash => "/";
		}

		public class ColorString
		{
			public const string COLOR_FF00000 = "#FF0000";

			public const string COLOR_43B5E2 = "#43B5E2";
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.Business
{
	public class BackupDescription
	{
		public string Id { get; set; }

		public string ModelName { get; set; }

		public string AndroidVersion { get; set; }

		public string BuildNumber { get; set; }

		public string BackupDateTime { get; set; }

		public string Notes { get; set; }

		public string StoragePath { get; set; }

		public long StorageSize { get; set; }

		public string Category { get; set; }
	}
	public class BackupRestoreProcessor
	{
		private const int HR_ERROR_HANDLE_DISK_FULL = -2147024857;

		private const int HR_ERROR_DISK_FULL = -2147024784;

		protected Dictionary<string, int> resourceTypeAndServiceCodeMaping = new Dictionary<string, int>
		{
			{ "{773D71F7-CE8A-42D7-BE58-5F875DF58C16}", 17 },
			{ "{242C8F16-6AC7-431B-BBF1-AE24373860F1}", 19 },
			{ "{8BEBE14B-4E45-4D36-8726-8442E6242C01}", 20 },
			{ "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}", 23 },
			{ "{580C48C8-6CEF-4BBB-AF37-D880B349D142}", 25 },
			{ "{89D4DB68-4258-4002-8557-E65959C558B3}", 22 },
			{ "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}", 21 }
		};

		protected Dictionary<string, string> typeActionMapping = new Dictionary<string, string>
		{
			{ "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}", "getIdAndSizeMapping" },
			{ "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}", "getIdAndSizeMapping" },
			{ "{89D4DB68-4258-4002-8557-E65959C558B3}", "getIdAndSizeMapping" },
			{ "{773D71F7-CE8A-42D7-BE58-5F875DF58C16}", "getPictureFolderDirectoryGroups" },
			{ "{242C8F16-6AC7-431B-BBF1-AE24373860F1}", "getMusicFolderDirectoryGroups" },
			{ "{8BEBE14B-4E45-4D36-8726-8442E6242C01}", "getVideoFolderDirectoryGroups" },
			{ "{580C48C8-6CEF-4BBB-AF37-D880B349D142}", "getFileDirectoryGroups" }
		};

		protected Dictionary<string, string> resourceTypeAndFullPathMapping = new Dictionary<string, string>
		{
			{ "{773D71F7-CE8A-42D7-BE58-5F875DF58C16}", "getPicturePathById" },
			{ "{242C8F16-6AC7-431B-BBF1-AE24373860F1}", "getMusicPathById" },
			{ "{8BEBE14B-4E45-4D36-8726-8442E6242C01}", "getVideoPathById" }
		};

		public void LoadDeviceIdAndSizeV2(TcpAndroidDevice device, string resourcesType, bool _isInternal, Action<string, Dictionary<string, long>> callback1, Action<string, List<JObject>> callback2)
		{
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			if (!(((DeviceEx)device).ConnectedAppType == "Moto"))
			{
				switch (resourcesType)
				{
				case "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}":
				case "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}":
				case "{89D4DB68-4258-4002-8557-E65959C558B3}":
					break;
				default:
					try
					{
						IMessageManager messageManager = device.MessageManager;
						MessageReaderAndWriter val = ((messageManager != null) ? messageManager.CreateMessageReaderAndWriter(0) : null);
						try
						{
							if (val != null)
							{
								long num = HostProxy.Sequence.New();
								List<JObject> list = null;
								List<string> list2 = new List<string> { _isInternal ? "0" : "1" };
								val.SendAndReceive<string, JObject>(typeActionMapping[resourcesType], list2, num, ref list);
								if (list != null && list.Count > 0)
								{
									callback2?.Invoke(resourcesType, list);
								}
							}
							return;
						}
						finally
						{
							((IDisposable)val)?.Dispose();
						}
					}
					catch (Exception ex)
					{
						LogHelper.LogInstance.Error("Backup:get resource id list failed, error: " + ex.Message, false);
						return;
					}
				}
			}
			try
			{
				string text = new AppServiceRequest(device.ExtendDataFileServiceEndPoint, device.RsaSocketEncryptHelper).RequestString(resourceTypeAndServiceCodeMaping[resourcesType], typeActionMapping["{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}"], (Header)null);
				if (!string.IsNullOrEmpty(text))
				{
					Dictionary<string, long> dictionary = JsonConvert.DeserializeObject<Dictionary<string, long>>(text);
					if (dictionary != null)
					{
						callback1?.Invoke(resourcesType, dictionary);
					}
				}
			}
			catch (Exception ex2)
			{
				LogHelper.LogInstance.Error("Backup:get resource id list failed, error: " + ex2.Message, false);
			}
		}

		public void LoadDeviceIdAndSizeV2(TcpAndroidDevice device, List<string> resourcesType, bool _isInternal, Action<string, Dictionary<string, long>> callback1, Action<string, List<JObject>> callback2, Action<bool> completedCallbak)
		{
			List<Task> tasks = new List<Task>();
			resourcesType.ForEach(delegate(string n)
			{
				if (((DeviceEx)device).ConnectedAppType == "Moto" || n == "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}" || n == "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}" || n == "{89D4DB68-4258-4002-8557-E65959C558B3}")
				{
					tasks.Add(Task.Run(delegate
					{
						//IL_0020: Unknown result type (might be due to invalid IL or missing references)
						try
						{
							string text = new AppServiceRequest(device.ExtendDataFileServiceEndPoint, device.RsaSocketEncryptHelper).RequestString(resourceTypeAndServiceCodeMaping[n], typeActionMapping["{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}"], (Header)null);
							if (!string.IsNullOrEmpty(text))
							{
								Dictionary<string, long> dictionary = JsonConvert.DeserializeObject<Dictionary<string, long>>(text);
								if (dictionary != null)
								{
									callback1?.Invoke(n, dictionary);
								}
							}
						}
						catch (Exception ex)
						{
							LogHelper.LogInstance.Error("Backup:get resource id list failed, error: " + ex.Message, false);
						}
					}));
				}
				else
				{
					tasks.Add(Task.Run(delegate
					{
						try
						{
							IMessageManager messageManager = device.MessageManager;
							MessageReaderAndWriter val = ((messageManager != null) ? messageManager.CreateMessageReaderAndWriter(0) : null);
							try
							{
								if (val != null)
								{
									long num = HostProxy.Sequence.New();
									List<JObject> list = null;
									List<string> list2 = new List<string> { _isInternal ? "0" : "1" };
									val.SendAndReceive<string, JObject>(typeActionMapping[n], list2, num, ref list);
									if (list != null)
									{
										callback2?.Invoke(n, list);
									}
								}
							}
							finally
							{
								((IDisposable)val)?.Dispose();
							}
						}
						catch (Exception ex)
						{
							LogHelper.LogInstance.Error("Backup:get resource id list failed, error: " + ex.Message, false);
						}
					}));
				}
			});
			Task.WhenAll(tasks).ContinueWith(delegate
			{
				completedCallbak?.Invoke(obj: true);
			});
		}

		public string GetFileFullPathById(TcpAndroidDevice device, string _resType, string _fileId)
		{
			try
			{
				if (!resourceTypeAndFullPathMapping.ContainsKey(_resType))
				{
					return _fileId;
				}
				MessageReaderAndWriter val = device.MessageManager.CreateMessageReaderAndWriter(0);
				try
				{
					if (val == null)
					{
						return _fileId;
					}
					long num = HostProxy.Sequence.New();
					List<string> list = new List<string> { _fileId };
					List<string> source = new List<string>();
					val.SendAndReceive<string, string>(resourceTypeAndFullPathMapping[_resType], list, num, ref source);
					return source.FirstOrDefault();
				}
				finally
				{
					((IDisposable)val)?.Dispose();
				}
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"Backup get resource full path failed, type:[{_resType}], file id:[{_fileId}], error:[{arg}] ", false);
				return _fileId;
			}
		}

		public List<PropItem> GetTabletSmsCalllogPermissions(TcpAndroidDevice device)
		{
			try
			{
				if (((DeviceEx)device).Property.Category == "tablet" && ((DeviceEx)device).ConnectedAppType == "Ma")
				{
					MessageReaderAndWriter val = device.MessageManager.CreateMessageReaderAndWriter(0);
					try
					{
						if (val == null)
						{
							return null;
						}
						long num = HostProxy.Sequence.New();
						List<PropItem> result = new List<PropItem>();
						val.SendAndReceive<string, PropItem>("getIsSupportSmsCallLogContact", new List<string>(), num, ref result);
						return result;
					}
					finally
					{
						((IDisposable)val)?.Dispose();
					}
				}
				return null;
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"get tablet sms calllog permissions exception: device:[{((DeviceEx)device).Identifer}], error:[{arg}] ", false);
				return null;
			}
		}
	}
	public class DeviceBusinessCommon
	{
		public bool GetConcatCount(out int contactCnt, out int callLogCnt)
		{
			bool result = false;
			contactCnt = 0;
			callLogCnt = 0;
			if (Context.CurrentDevice != null)
			{
				DeviceEx currentDevice = Context.CurrentDevice;
				MessageReaderAndWriter val = ((TcpAndroidDevice)((currentDevice is TcpAndroidDevice) ? currentDevice : null)).MessageManager.CreateMessageReaderAndWriter(0);
				try
				{
					if (val == null)
					{
						return false;
					}
					long num = HostProxy.Sequence.New();
					List<PropItem> list = null;
					if (val.SendAndReceiveSync<string, PropItem>("getContactCount", "getContactCountResponse", new List<string>(), num, ref list) && list != null && list.Count == 1)
					{
						result = int.TryParse(list[0].Key, out contactCnt);
					}
					return result;
				}
				finally
				{
					((IDisposable)val)?.Dispose();
				}
			}
			return false;
		}

		public int GetPicCount()
		{
			if (Context.CurrentDevice != null)
			{
				DeviceEx currentDevice = Context.CurrentDevice;
				MessageReaderAndWriter val = ((TcpAndroidDevice)((currentDevice is TcpAndroidDevice) ? currentDevice : null)).MessageManager.CreateMessageReaderAndWriter(0);
				try
				{
					if (val == null)
					{
						return 0;
					}
					long num = HostProxy.Sequence.New();
					List<JObject> list = default(List<JObject>);
					if (val.SendAndReceiveSync<string, JObject>("getPICAlbumsInfo", "getPICAlbumsInfoResponse", new List<string>(), num, ref list) && list != null)
					{
						int total = 0;
						list.ForEach(delegate(JObject n)
						{
							total += ((JToken)n).Value<int>((object)"picsCount");
						});
						return total;
					}
					return 0;
				}
				finally
				{
					((IDisposable)val)?.Dispose();
				}
			}
			return 0;
		}

		public int GetMusicCount()
		{
			if (Context.CurrentDevice != null)
			{
				DeviceEx currentDevice = Context.CurrentDevice;
				TcpAndroidDevice val = (TcpAndroidDevice)(object)((currentDevice is TcpAndroidDevice) ? currentDevice : null);
				try
				{
					MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
					try
					{
						if (val2 == null)
						{
							return 0;
						}
						long num = HostProxy.Sequence.New();
						List<int> list = null;
						if (val2.SendAndReceiveSync<string, int>("getMusicIdList", "getMusicIdListResponse", new List<string>(), num, ref list) && list != null)
						{
							return list.Count;
						}
					}
					finally
					{
						((IDisposable)val2)?.Dispose();
					}
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error(ex.ToString(), false);
				}
			}
			return 0;
		}

		public int GetVideoCount()
		{
			if (Context.CurrentDevice != null)
			{
				DeviceEx currentDevice = Context.CurrentDevice;
				MessageReaderAndWriter val = ((TcpAndroidDevice)((currentDevice is TcpAndroidDevice) ? currentDevice : null)).MessageManager.CreateMessageReaderAndWriter(0);
				try
				{
					int num = 0;
					if (val != null)
					{
						long num2 = HostProxy.Sequence.New();
						List<PropItem> list = default(List<PropItem>);
						if (val.SendAndReceiveSync<string, PropItem>("getAlbums", "getAlbumsResponse", new List<string>(), num2, ref list) && list != null)
						{
							foreach (PropItem item in list)
							{
								int.TryParse(item.Value, out var result);
								num += result;
							}
						}
					}
					return num;
				}
				finally
				{
					((IDisposable)val)?.Dispose();
				}
			}
			return 0;
		}

		public int GetSmsCount(string address = null)
		{
			int result = -1;
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null)
			{
				return 0;
			}
			MessageReaderAndWriter val2 = val.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				long num = HostProxy.Sequence.New();
				try
				{
					List<PropItem> list = default(List<PropItem>);
					if (val2.SendAndReceiveSync<string, PropItem>("getSmsCount", "getSmsCountResponse", new List<string> { address }, num, ref list) && list != null)
					{
						string text = (from m in list
							where "count".Equals(m.Key)
							select m.Value).FirstOrDefault();
						if (!string.IsNullOrEmpty(text))
						{
							int.TryParse(text, out result);
						}
					}
				}
				catch
				{
				}
				return result;
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}
	}
	public class DeviceSmsManagement
	{
		public bool IsNeedSetSMSApplet()
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null || ((DeviceEx)val).Property == null)
			{
				return false;
			}
			return ((DeviceEx)val).Property.ApiLevel > 19;
		}

		public bool SmsAppletIsReady(TcpAndroidDevice device)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Invalid comparison between Unknown and I4
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			if (device == null)
			{
				return false;
			}
			if ((int)((DeviceEx)device).ConnectType == 1 && ((DeviceEx)device).Property.ApiLevel >= 29 && device != null)
			{
				((TcpAndroidDevice)(AdbDeviceEx)device).FocuseApp();
			}
			MessageReaderAndWriter val = device.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (val == null)
				{
					return false;
				}
				try
				{
					List<PropItem> list = null;
					long num = HostProxy.Sequence.New();
					if (val.SendAndReceiveSync<object, PropItem>("smsAppletIsReady", "smsAppletIsReadyResponse", (List<object>)null, num, ref list) && list != null)
					{
						return list.Exists((PropItem m) => "true".Equals(m.Value));
					}
					return false;
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("get sms contact info failed", ex, false);
					return false;
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		public bool ResetSmsAppletToDefault(TcpAndroidDevice device)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Invalid comparison between Unknown and I4
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0065: Invalid comparison between Unknown and I4
			if (device == null)
			{
				return false;
			}
			if ((int)((DeviceEx)device).ConnectType == 1 && ((DeviceEx)device).Property.ApiLevel >= 29)
			{
				((TcpAndroidDevice)(AdbDeviceEx)device).FocuseApp();
			}
			else
			{
				Thread.Sleep(1000);
			}
			MessageReaderAndWriter val = device.MessageManager.CreateMessageReaderAndWriter(0);
			try
			{
				if (val == null)
				{
					return false;
				}
				try
				{
					List<PropItem> list = null;
					if (((DeviceEx)device).Property.ApiLevel >= 29 && (int)((DeviceEx)device).ConnectType == 1)
					{
						((DeviceEx)device).LockSoftStatus(true, (DeviceSoftStateEx)2);
					}
					long num = HostProxy.Sequence.New();
					if (val.SendAndReceiveSync<object, PropItem>("resetSmsAppSetting", "resetSmsAppSettingResponse", (List<object>)null, num, ref list) && list != null)
					{
						return list.Exists((PropItem m) => "true".Equals(m.Value));
					}
					return false;
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("Reset sms applet to default failed", ex, false);
					return false;
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		private bool? SetReadyAppletWnd(TcpAndroidDevice device, int level)
		{
			return ((DispatcherObject)Application.Current).Dispatcher.Invoke<Task<bool?>>((Func<Task<bool?>>)async delegate
			{
				DefaultSmsAppAuthorizeWindow val = new DefaultSmsAppAuthorizeWindow((level >= 29) ? 1 : 3);
				val.OnCheckSMSAuthorize = delegate
				{
					//IL_000d: Unknown result type (might be due to invalid IL or missing references)
					//IL_0013: Invalid comparison between Unknown and I4
					TcpAndroidDevice obj = device;
					return (obj == null || (int)((DeviceEx)obj).SoftStatus != 2) ? ((bool?)null) : new bool?(SmsAppletIsReady(device));
				};
				return await MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)val, (bool?)true);
			}).Result;
		}

		private void ResetReadyAppletWnd(TcpAndroidDevice device, int level)
		{
			MessageRightGifStepsViewV7 checkSmsPermissionView = null;
			DefaultSmsAppAuthorizeWindow checkSmsPermissionViewLess11 = null;
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					//IL_006f: Unknown result type (might be due to invalid IL or missing references)
					//IL_0079: Expected O, but got Unknown
					//IL_0038: Unknown result type (might be due to invalid IL or missing references)
					//IL_0042: Expected O, but got Unknown
					if (level >= 29)
					{
						checkSmsPermissionView = new MessageRightGifStepsViewV7(LangTranslation.Translate("K1886"), LangTranslation.Translate("K1891"), LangTranslation.Translate("K1604"), "app_permissions_sms.gif", LangTranslation.Translate("K1601"));
						checkSmsPermissionView.ConfirmCallback = delegate
						{
							checkSmsPermissionView.Result = true;
							((Window)checkSmsPermissionView).Close();
						};
					}
					else
					{
						checkSmsPermissionViewLess11 = new DefaultSmsAppAuthorizeWindow(2);
					}
				});
			}
			if (checkSmsPermissionView != null)
			{
				MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)checkSmsPermissionView, (bool?)true);
			}
			if (checkSmsPermissionViewLess11 != null)
			{
				MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)checkSmsPermissionViewLess11, (bool?)true);
			}
		}

		public void DoProcessWithChangeSMSDefault(TcpAndroidDevice device, Action action)
		{
			bool num = IsNeedSetSMSApplet();
			int apiLevel = ((DeviceEx)device).Property.ApiLevel;
			Action action2 = delegate
			{
				try
				{
					action?.Invoke();
				}
				catch (Exception arg)
				{
					LogHelper.LogInstance.Debug($"SMS restore failed, {arg}", false);
				}
			};
			if (num)
			{
				if (!SmsAppletIsReady(device) && !SetReadyAppletWnd(device, apiLevel).HasValue)
				{
					action2();
					return;
				}
				action2();
				if (ResetSmsAppletToDefault(device))
				{
					Task.Factory.StartNew(delegate
					{
						ResetReadyAppletWnd(device, apiLevel);
					});
				}
			}
			else
			{
				action2();
			}
		}
	}
	public interface IWorker : IDisposable
	{
		int WorkerSequence { get; }

		IAsyncTaskContext TaskContext { get; }

		string WorkerId { get; }

		void DoProcess(object state);

		void Cancel();

		void Abort();
	}
	public class ReleaseBackupFileWorker : IWorker, IDisposable
	{
		private IBackupStorage _backupStorage;

		private string _releaseFolderPath;

		public string WorkerId => string.Empty;

		public int WorkerSequence => 0;

		public IAsyncTaskContext TaskContext { get; set; }

		protected Action<NotifyTypes, object> _exectingNotifyHandler { get; }

		protected Action<string, object> NotifyHandler { get; private set; }

		protected CancellationTokenSource CancelSource { get; set; }

		protected CancellationTokenSource AbortSource { get; set; }

		public ReleaseBackupFileWorker(IAsyncTaskContext context, IBackupStorage backupStorage, string releaseFolderPath)
		{
			_backupStorage = backupStorage;
			_releaseFolderPath = releaseFolderPath;
			TaskContext = context;
			_exectingNotifyHandler = (Action<NotifyTypes, object>)context.ObjectState;
		}

		public void Abort()
		{
			AbortSource?.Cancel();
		}

		public void Cancel()
		{
			CancelSource?.Cancel();
		}

		public void Dispose()
		{
			if (CancelSource != null)
			{
				CancelSource.Dispose();
				CancelSource = null;
			}
			if (AbortSource != null)
			{
				AbortSource.Dispose();
				AbortSource = null;
			}
		}

		public void DoProcess(object state)
		{
			//IL_01c5: Unknown result type (might be due to invalid IL or missing references)
			string version = string.Empty;
			IBackupStorage storage = _backupStorage;
			try
			{
				TaskContext.AddCancelSource((Action)delegate
				{
					storage?.Dispose();
				});
				IBackupResourceReader resourceReader = _backupStorage.OpenRead(out version);
				if (resourceReader == null)
				{
					return;
				}
				List<BackupResource> obj = resourceReader.GetChildResources(null) ?? throw new BackupRestoreException("Storage root resource is null");
				int bufferSize = 1024;
				byte[] buffer = new byte[bufferSize];
				int readedLength = 0;
				Dictionary<string, string> dirMapping = new Dictionary<string, string>
				{
					{ "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}", "Contacts" },
					{ "{89D4DB68-4258-4002-8557-E65959C558B3}", "Call log" },
					{ "{773D71F7-CE8A-42D7-BE58-5F875DF58C16}", "Pictures" },
					{ "{242C8F16-6AC7-431B-BBF1-AE24373860F1}", "Songs" },
					{ "{8BEBE14B-4E45-4D36-8726-8442E6242C01}", "Videos" },
					{ "{580C48C8-6CEF-4BBB-AF37-D880B349D142}", "Files" },
					{ "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}", "SMS" }
				};
				int num = (from m in obj
					select m.Tag into n
					where Enumerable.Contains(dirMapping.Keys, n)
					select n).Count();
				_exectingNotifyHandler?.Invoke((NotifyTypes)3, new List<object>
				{
					ResourcesHelper.StringResources.SingleInstance.BACKUPRESTORE_RELEASE_CONTENT,
					num
				});
				foreach (BackupResource item in obj)
				{
					if (TaskContext.IsCancelCommandRequested)
					{
						throw new CacnelException("cancel release backup file");
					}
					if (!Enumerable.Contains(dirMapping.Keys, item.Tag))
					{
						continue;
					}
					string rootDir = Path.Combine(_releaseFolderPath, dirMapping[item.Tag]);
					string currentDir = rootDir;
					if (!Directory.Exists(rootDir))
					{
						Directory.CreateDirectory(rootDir);
					}
					HostProxy.ResourcesLoggingService.RegisterDir(currentDir);
					if ("{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}".Equals(item.Tag))
					{
						string text = "contacts.vcf";
						string path = Path.Combine(rootDir, text);
						if (File.Exists(path))
						{
							int num2 = text.LastIndexOf('.');
							string empty = string.Empty;
							string arg = string.Empty;
							if (num2 < 0)
							{
								empty = text;
							}
							else
							{
								empty = text.Remove(num2);
								arg = text.Substring(num2);
							}
							int num3 = 1;
							do
							{
								path = Path.Combine(currentDir, $"{empty}({num3}){arg}");
								num3++;
							}
							while (File.Exists(path));
						}
						FileStream fs = new FileStream(path, FileMode.Create, FileAccess.Write);
						try
						{
							resourceReader.Foreach(item, delegate(BackupResource rs)
							{
								//IL_0026: Unknown result type (might be due to invalid IL or missing references)
								if (TaskContext.IsCancelCommandRequested)
								{
									throw new CacnelException("cancel release backup file");
								}
								IBackupResourceStreamReader backupResourceStreamReader = resourceReader.Seek(rs);
								do
								{
									readedLength = backupResourceStreamReader.Read(buffer, 0, bufferSize);
									fs.Write(buffer, 0, readedLength);
								}
								while (readedLength != 0);
							});
						}
						finally
						{
							if (fs != null)
							{
								((IDisposable)fs).Dispose();
							}
						}
					}
					else
					{
						resourceReader.Foreach(item, delegate(BackupResource rs)
						{
							//IL_0021: Unknown result type (might be due to invalid IL or missing references)
							if (TaskContext.IsCancelCommandRequested)
							{
								throw new CacnelException("cancel release backup file");
							}
							if ("dir".Equals(rs.Tag))
							{
								string fileName = Path.GetFileName(rs.Value);
								currentDir = Path.Combine(rootDir, fileName);
								Directory.CreateDirectory(currentDir);
								return;
							}
							string fileName2 = Path.GetFileName(rs.Value);
							string text2 = Path.Combine(currentDir, Path.GetFileName(rs.Value));
							if (File.Exists(text2))
							{
								int num4 = fileName2.LastIndexOf('.');
								string empty2 = string.Empty;
								string arg2 = string.Empty;
								if (num4 < 0)
								{
									empty2 = fileName2;
								}
								else
								{
									empty2 = fileName2.Remove(num4);
									arg2 = fileName2.Substring(num4);
								}
								int num5 = 1;
								do
								{
									text2 = Path.Combine(currentDir, $"{empty2}({num5}){arg2}");
									num5++;
								}
								while (File.Exists(text2));
							}
							IBackupResourceStreamReader backupResourceStreamReader = resourceReader.Seek(rs);
							try
							{
								using (FileStream fileStream = new FileStream(text2, FileMode.Create, FileAccess.Write))
								{
									fileStream.SetLength(rs.AssociatedStreamSize);
									do
									{
										readedLength = backupResourceStreamReader.Read(buffer, 0, bufferSize);
										fileStream.Write(buffer, 0, readedLength);
									}
									while (readedLength != 0);
								}
								if (rs.Attributes != null)
								{
									FileInfo fileInfo = new FileInfo(text2);
									string value = null;
									DateTime result = DateTime.Now;
									rs.Attributes.TryGetValue("CreateDateTime", out value);
									if (!string.IsNullOrEmpty(value) && DateTime.TryParse(value, out result))
									{
										fileInfo.CreationTime = result;
									}
									rs.Attributes.TryGetValue("LastModifyDateTime", out value);
									if (!string.IsNullOrEmpty(value) && DateTime.TryParse(value, out result))
									{
										fileInfo.LastWriteTime = result;
									}
								}
							}
							catch (Exception)
							{
								try
								{
									File.Delete(text2);
								}
								catch (Exception)
								{
								}
								throw;
							}
						});
					}
					_exectingNotifyHandler?.Invoke((NotifyTypes)1, 1);
				}
			}
			finally
			{
				if (storage != null)
				{
					storage.Dispose();
				}
			}
		}

		public void SetNotifyHandler(Action<string, object> notifyHandler)
		{
			NotifyHandler = notifyHandler;
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.Business.Storage
{
	public class AES : IDisposable
	{
		public const int EncryptionStateSize = 16;

		public const int PlaintextByteBlockSize = 1600;

		public const int PlainTextByteBlockHeadSize = 4;

		private readonly byte[] _key = Constants.Encoding.GetBytes(ConfigurationManager.AppSettings["AESKey"]);

		public readonly byte[] _iv = Constants.Encoding.GetBytes(ConfigurationManager.AppSettings["AESIV"]);

		private Rijndael rijndael;

		public AES()
		{
			Aes.Create();
			rijndael = Rijndael.Create();
			rijndael.BlockSize = 128;
			rijndael.Mode = CipherMode.CBC;
			rijndael.Padding = PaddingMode.PKCS7;
			rijndael.Key = _key;
			rijndael.IV = _iv;
		}

		public AES(byte[] key, byte[] iv)
			: this()
		{
			_key = key;
			_iv = iv;
		}

		public static long GetEncryptByteLength(long plaintextByteLength, bool partBlockForPlaintext)
		{
			if (plaintextByteLength == 0L)
			{
				return 0L;
			}
			if (partBlockForPlaintext)
			{
				int num = 1596;
				long num2 = plaintextByteLength / num;
				int num3 = ((plaintextByteLength > num2 * num) ? 1 : 0);
				return (num2 + num3) * 1616;
			}
			return plaintextByteLength / 16 * 16 + 16;
		}

		public byte[] Encrypt(byte[] data)
		{
			using ICryptoTransform transform = rijndael.CreateEncryptor(rijndael.Key, rijndael.IV);
			using MemoryStream memoryStream = new MemoryStream();
			using (CryptoStream cryptoStream = new CryptoStream(memoryStream, transform, CryptoStreamMode.Write))
			{
				cryptoStream.Write(data, 0, data.Length);
			}
			return memoryStream.ToArray();
		}

		public byte[] Decrypt(byte[] data)
		{
			using ICryptoTransform transform = rijndael.CreateDecryptor(rijndael.Key, rijndael.IV);
			int num = data.Length;
			byte[] array = new byte[num];
			int num2 = 1024;
			int num3 = 0;
			int num4 = 0;
			using (MemoryStream stream = new MemoryStream(data))
			{
				using CryptoStream cryptoStream = new CryptoStream(stream, transform, CryptoStreamMode.Read);
				do
				{
					num2 = ((num - num3 >= num2) ? num2 : (num - num3));
					num4 = cryptoStream.Read(array, num3, num2);
					num3 += num4;
				}
				while (num4 != 0);
			}
			byte[] array2 = new byte[num3];
			Array.Copy(array, array2, num3);
			return array2;
		}

		public void EncryptFile()
		{
		}

		public void Dispose()
		{
			rijndael?.Dispose();
		}
	}
	public class BackupInfo
	{
		public string ModelName { get; set; }

		public string AndroidVersion { get; set; }

		public string BuildNumber { get; set; }

		public string DateTime { get; set; }

		public string Notes { get; set; }
	}
	public class BackupResource
	{
		[JsonIgnore]
		public const int ByteLength = 6036;

		[JsonProperty("id")]
		public int Id { get; set; }

		[JsonProperty("pd")]
		public int ParentId { get; set; }

		[JsonProperty("n")]
		public string Name { get; set; }

		[JsonProperty("v")]
		public string Value { get; set; }

		[JsonProperty("t")]
		public string Tag { get; set; }

		[JsonProperty("ass")]
		public long AssociatedStreamSize { get; set; }

		[JsonProperty("attr")]
		public Dictionary<string, string> Attributes { get; set; }

		public void AddAttribute(string key, string val)
		{
			if (Attributes == null)
			{
				Attributes = new Dictionary<string, string>();
			}
			Attributes[key] = val;
		}
	}
	[SupportedFormatVersion("{9A7CEC3B-8DE0-439D-B3CF-5DAD3691C605}")]
	public class BackupResourceAESReader : IBackupResourceReader, IDisposable
	{
		private string _path = string.Empty;

		protected long _storageSize;

		protected long _resourceInfoStorageOffset;

		protected IBackupStorage _storage;

		internal List<BackupStorageIndex> _indexs;

		protected bool _canRead;

		protected AES _aes;

		public BackupResourceAESReader(IBackupStorage storage)
		{
			_storage = storage;
			_storageSize = storage.Size;
			_aes = new AES();
			Prepare();
		}

		internal virtual List<BackupStorageIndex> LoadIndexs()
		{
			try
			{
				int num = 1616;
				if (_storageSize < num)
				{
					throw new BackupRestoreException("File format error!");
				}
				byte[] array = new byte[num];
				int num2 = 0;
				_storage.Seek(-num, SeekOrigin.End);
				if (_storage.Read(array, 0, num) != num)
				{
					throw new BackupRestoreException("File format error!");
				}
				byte[] array2 = _aes.Decrypt(array);
				num2 = JsonUtils.Parse<BackupStorageHead>(Constants.Encoding.GetString(array2, 4, BitConverter.ToInt32(array2, 0))).IndexByteLength;
				if (num2 + num > _storageSize)
				{
					throw new BackupRestoreException("File format error!");
				}
				byte[] array3 = new byte[num2];
				int num3 = 1024;
				int num4 = 0;
				int num5 = 0;
				long num6 = 0L;
				long num7 = num2;
				_storage.Seek(-(num2 + num), SeekOrigin.End);
				do
				{
					num6 = num7 - num4;
					num3 = (int)((num6 > num3) ? num3 : num6);
					num5 = _storage.Read(array3, num4, num3);
					num4 += num5;
				}
				while (num4 < num7);
				byte[] array4 = _aes.Decrypt(array3);
				List<BackupStorageIndex> list = JsonUtils.Parse<List<BackupStorageIndex>>(Constants.Encoding.GetString(array4, 0, array4.Length));
				if (list == null)
				{
					_resourceInfoStorageOffset = -1L;
				}
				else
				{
					_resourceInfoStorageOffset = 48 + list.Sum((BackupStorageIndex m) => AES.GetEncryptByteLength(m.ResourceStreamLength, partBlockForPlaintext: true));
				}
				_storage.Seek(0L, SeekOrigin.Begin);
				return list;
			}
			catch (Exception innerException)
			{
				throw new Exception("Load storage head info failed! file format is error", innerException);
			}
		}

		protected virtual void Prepare()
		{
			_indexs = LoadIndexs();
			_canRead = true;
		}

		public bool CanRead()
		{
			return _canRead;
		}

		public IBackupResourceStreamReader Seek(BackupResource resource)
		{
			if (!_canRead)
			{
				throw new CanNotReadException("Can not read");
			}
			BackupStorageIndex backupStorageIndex = _indexs.FirstOrDefault((BackupStorageIndex m) => m.Id == resource.Id);
			if (backupStorageIndex == null)
			{
				return null;
			}
			return new BackupResourceStreamAESReader(_storage, _aes, backupStorageIndex.ResourceStreamOffset, backupStorageIndex.ResourceStreamLength);
		}

		public List<BackupResource> GetChildResources(BackupResource parent)
		{
			if (!_canRead)
			{
				throw new CanNotReadException("Can not read");
			}
			if (_indexs == null)
			{
				return null;
			}
			int parentId = 0;
			if (parent != null)
			{
				parentId = parent.Id;
			}
			IEnumerable<BackupStorageIndex> enumerable = _indexs.Where((BackupStorageIndex m) => m.ParentId == parentId);
			List<BackupResource> list = new List<BackupResource>();
			int num = 1024;
			int num2 = 0;
			int num3 = 0;
			long num4 = 0L;
			foreach (BackupStorageIndex item in enumerable)
			{
				num2 = 0;
				num3 = 0;
				num4 = 0L;
				_storage.Seek(_resourceInfoStorageOffset + item.ResourceOffset, SeekOrigin.Begin);
				long encryptByteLength = AES.GetEncryptByteLength(item.ResourceLength, partBlockForPlaintext: false);
				byte[] array = new byte[encryptByteLength];
				do
				{
					num4 = encryptByteLength - num2;
					num = (int)((num4 > num) ? num : num4);
					num3 = _storage.Read(array, num2, num);
					num2 += num3;
				}
				while (num2 < encryptByteLength);
				if (num3 > 0)
				{
					byte[] array2 = _aes.Decrypt(array);
					BackupResource backupResource = JsonUtils.Parse<BackupResource>(Constants.Encoding.GetString(array2, 0, array2.Length));
					if (backupResource == null)
					{
						throw new BackupRestoreException("Parse json to object failed");
					}
					list.Add(backupResource);
				}
			}
			return list;
		}

		public void Foreach(BackupResource resource, Action<BackupResource> callback)
		{
			if (!_canRead)
			{
				throw new CanNotReadException("Can not read");
			}
			List<BackupResource> childResources = GetChildResources(resource);
			if (childResources == null || childResources.Count == 0)
			{
				return;
			}
			foreach (BackupResource item in childResources)
			{
				callback(item);
				Foreach(item, callback);
			}
		}

		public virtual bool CheckPassword(string password)
		{
			return true;
		}

		public virtual bool IsSetPassword()
		{
			return false;
		}

		public void Dispose()
		{
		}
	}
	[SupportedFormatVersion("{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}")]
	public class BackupResourceAESReaderV3(IBackupStorage storage) : BackupResourceAESReader(storage)
	{
		private PW pw = new PW();

		private PW.PWInfo pWInfo;

		protected override void Prepare()
		{
			pWInfo = LoadPwInfo();
			if (_canRead = !pWInfo.IsSetPassword)
			{
				_indexs = LoadIndexs();
			}
		}

		private PW.PWInfo LoadPwInfo()
		{
			int num = 1;
			byte[] array = new byte[num];
			_storage.Seek(-num, SeekOrigin.End);
			if (_storage.Read(array, 0, num) != num)
			{
				throw new BackupRestoreException("File format error!");
			}
			PW.PWInfo pWInfo = new PW.PWInfo();
			if (array[0] == 1)
			{
				pWInfo.IsSetPassword = true;
				_storage.Seek(-97L, SeekOrigin.End);
				byte[] array2 = new byte[97];
				if (_storage.Read(array2, 0, 97) != 97)
				{
					throw new BackupRestoreException("File format error!");
				}
				pWInfo = pw.ConvertToPwInfo(array2);
			}
			return pWInfo;
		}

		internal override List<BackupStorageIndex> LoadIndexs()
		{
			try
			{
				int num = 1616;
				int pWBlockSize = pWInfo.PWBlockSize;
				if (_storageSize < num + pWBlockSize)
				{
					throw new BackupRestoreException("File format error!");
				}
				byte[] array = new byte[num];
				int num2 = 0;
				_storage.Seek(-(num + pWBlockSize), SeekOrigin.End);
				if (_storage.Read(array, 0, num) != num)
				{
					throw new BackupRestoreException("File format error!");
				}
				byte[] array2 = _aes.Decrypt(array);
				num2 = JsonUtils.Parse<BackupStorageHead>(Constants.Encoding.GetString(array2, 4, BitConverter.ToInt32(array2, 0))).IndexByteLength;
				if (num2 + num + pWBlockSize > _storageSize)
				{
					throw new BackupRestoreException("File format error!");
				}
				byte[] array3 = new byte[num2];
				int num3 = 1024;
				int num4 = 0;
				int num5 = 0;
				long num6 = 0L;
				long num7 = num2;
				_storage.Seek(-(num2 + num + pWBlockSize), SeekOrigin.End);
				do
				{
					num6 = num7 - num4;
					num3 = (int)((num6 > num3) ? num3 : num6);
					num5 = _storage.Read(array3, num4, num3);
					num4 += num5;
				}
				while (num4 < num7);
				byte[] array4 = _aes.Decrypt(array3);
				List<BackupStorageIndex> list = JsonUtils.Parse<List<BackupStorageIndex>>(Constants.Encoding.GetString(array4, 0, array4.Length));
				if (list == null)
				{
					_resourceInfoStorageOffset = -1L;
				}
				else
				{
					_resourceInfoStorageOffset = 48 + list.Sum((BackupStorageIndex m) => AES.GetEncryptByteLength(m.ResourceStreamLength, partBlockForPlaintext: true));
				}
				_storage.Seek(0L, SeekOrigin.Begin);
				return list;
			}
			catch (Exception innerException)
			{
				throw new Exception("Load storage head info failed! file format is error", innerException);
			}
		}

		public override bool CheckPassword(string password)
		{
			PW.EncryptionInfo encryptionInfo = pw.GetEncryptionInfo(pWInfo, password);
			if (encryptionInfo != null)
			{
				_aes = new AES(encryptionInfo.AesKey, encryptionInfo.AesVector);
				if (!_canRead)
				{
					_indexs = LoadIndexs();
					_canRead = true;
				}
				return true;
			}
			_canRead = false;
			return false;
		}

		public override bool IsSetPassword()
		{
			return pWInfo.IsSetPassword;
		}
	}
	[SupportedFormatVersion("{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}")]
	public class BackupResourceAESWriter : IBackupResourceWriter, IDisposable
	{
		private PW pw = new PW();

		private PW.EncryptionInfo encryptionInfo;

		private IBackupStorage _storage;

		private AES _aes;

		private List<BackupStorageIndex> _newIndexsInfo;

		private FileInfo _indexsFileInfo;

		private FileStream _indexsFs;

		protected bool _canWrite;

		private int _idBase;

		public void SetPassword(string password)
		{
			if (!string.IsNullOrEmpty(password))
			{
				encryptionInfo = pw.CreateAesEncryptionInfo(password);
				_aes = new AES(encryptionInfo.AesKey, encryptionInfo.AesVector);
			}
		}

		public BackupResourceAESWriter(IBackupStorage storage)
		{
			_storage = storage;
			_aes = new AES();
			Prepare();
		}

		public bool CanWrite()
		{
			return _canWrite;
		}

		private void Prepare()
		{
			if (_indexsFs == null)
			{
				string phoneBackupCacheDir = Configurations.PhoneBackupCacheDir;
				_indexsFileInfo = new FileInfo(Path.Combine(phoneBackupCacheDir, Guid.NewGuid().ToString() + ".mabk.temp"));
				_indexsFs = _indexsFileInfo.Open(FileMode.CreateNew, FileAccess.ReadWrite);
				_newIndexsInfo = new List<BackupStorageIndex>();
				_canWrite = true;
			}
		}

		public void ReserveDiskSpace(int resourceItemsCount, long reservereSourceStreamGross)
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			long length = (long)(40 * resourceItemsCount * 2 / 1596 + 1) * 1616L;
			_indexsFs.SetLength(length);
			_storage.SetLength(reservereSourceStreamGross);
		}

		public void BeginWrite()
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
		}

		private int GetNewId()
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			return ++_idBase;
		}

		public void Write(BackupResource resource)
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			if (_indexsFs == null)
			{
				throw new BackupRestoreException("Show call BeginWrite method begin write");
			}
			resource.Id = GetNewId();
			string s = JsonUtils.Stringify((object)resource);
			byte[] bytes = Constants.Encoding.GetBytes(s);
			int num = bytes.Length;
			byte[] array = _aes.Encrypt(bytes);
			BackupStorageIndex item = new BackupStorageIndex
			{
				Id = resource.Id,
				ParentId = resource.ParentId,
				ResourceLength = num,
				ResourceOffset = _indexsFs.Position,
				ResourceStreamOffset = _storage.Position,
				ResourceStreamLength = resource.AssociatedStreamSize
			};
			_newIndexsInfo.Add(item);
			int count = array.Length;
			_indexsFs.Write(array, 0, count);
		}

		public IBackupResourceStreamWriter Seek(BackupResource resource)
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			BackupStorageIndex backupStorageIndex = _newIndexsInfo.FirstOrDefault((BackupStorageIndex m) => m.Id == resource.Id);
			if (backupStorageIndex == null)
			{
				return null;
			}
			return new BackupResourceStreamAESWriter(_storage, _aes, backupStorageIndex.ResourceStreamOffset, backupStorageIndex.ResourceStreamLength);
		}

		public void EndWrite()
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			try
			{
				_indexsFs.SetLength(_indexsFs.Position);
				_storage.SetLength(_storage.Position);
				_indexsFs.Seek(0L, SeekOrigin.Begin);
				byte[] buffer = new byte[1024];
				int num = 0;
				do
				{
					num = _indexsFs.Read(buffer, 0, 1024);
					_storage.Write(buffer, 0, num);
				}
				while (num != 0);
				string s = JsonUtils.Stringify((object)_newIndexsInfo);
				byte[] bytes = Constants.Encoding.GetBytes(s);
				byte[] array = _aes.Encrypt(bytes);
				_storage.Write(array, 0, array.Length);
				byte[] array2 = new byte[1600];
				BackupStorageHead backupStorageHead = new BackupStorageHead
				{
					IndexByteLength = array.Length
				};
				byte[] bytes2 = Constants.Encoding.GetBytes(JsonUtils.Stringify((object)backupStorageHead));
				Array.Copy(BitConverter.GetBytes(bytes2.Length), 0, array2, 0, 4);
				Array.Copy(bytes2, 0, array2, 4, bytes2.Length);
				byte[] array3 = _aes.Encrypt(array2);
				_storage.Write(array3, 0, array3.Length);
				if (encryptionInfo != null)
				{
					byte[] array4 = pw.CreatePWBytes(encryptionInfo);
					_storage.Write(array4, 0, array4.Length);
				}
				else
				{
					_storage.Write(new byte[1], 0, 1);
				}
				_storage.Flush();
			}
			finally
			{
				DisposeIndexFileHandler();
			}
		}

		private void DisposeIndexFileHandler()
		{
			try
			{
				if (_indexsFs != null)
				{
					_indexsFs.Close();
					_indexsFs.Dispose();
					_indexsFs = null;
				}
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Close index fs throw exception:" + ex.ToString(), false);
			}
			try
			{
				if (_indexsFileInfo != null)
				{
					_indexsFileInfo.Delete();
					_indexsFileInfo = null;
				}
			}
			catch (Exception ex2)
			{
				LogHelper.LogInstance.Error("Delete index file info throw exception:" + ex2.ToString(), false);
			}
		}

		public void RemoveEnd()
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			if (_newIndexsInfo != null && _newIndexsInfo.Count != 0)
			{
				BackupStorageIndex backupStorageIndex = _newIndexsInfo.Last();
				if (backupStorageIndex != null)
				{
					_newIndexsInfo.Remove(backupStorageIndex);
					_indexsFs?.Seek(backupStorageIndex.ResourceOffset, SeekOrigin.Begin);
					_indexsFs?.SetLength(backupStorageIndex.ResourceOffset);
					_storage?.Seek(backupStorageIndex.ResourceStreamOffset, SeekOrigin.Begin);
					_storage?.SetLength(backupStorageIndex.ResourceStreamOffset);
				}
			}
		}

		public void Dispose()
		{
			DisposeIndexFileHandler();
		}
	}
	[SupportedFormatVersion("{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}")]
	public class BackupResourceAESWriterV3 : IBackupResourceWriter, IDisposable
	{
		private PW pw = new PW();

		private PW.EncryptionInfo encryptionInfo;

		private IBackupStorage _storage;

		private AES _aes;

		private List<BackupStorageIndex> _newIndexsInfo;

		private FileInfo _indexsFileInfo;

		private FileStream _indexsFs;

		protected bool _canWrite;

		private int _idBase;

		public void SetPassword(string password)
		{
			if (!string.IsNullOrEmpty(password))
			{
				encryptionInfo = pw.CreateAesEncryptionInfo(password);
				_aes = new AES(encryptionInfo.AesKey, encryptionInfo.AesVector);
			}
		}

		public BackupResourceAESWriterV3(IBackupStorage storage)
		{
			_storage = storage;
			_aes = new AES();
			Prepare();
		}

		public bool CanWrite()
		{
			return _canWrite;
		}

		private void Prepare()
		{
			if (_indexsFs == null)
			{
				string phoneBackupCacheDir = Configurations.PhoneBackupCacheDir;
				_indexsFileInfo = new FileInfo(Path.Combine(phoneBackupCacheDir, Guid.NewGuid().ToString() + ".mabk.temp"));
				_indexsFs = _indexsFileInfo.Open(FileMode.CreateNew, FileAccess.ReadWrite);
				_newIndexsInfo = new List<BackupStorageIndex>();
				_canWrite = true;
			}
		}

		public void ReserveDiskSpace(int resourceItemsCount, long reservereSourceStreamGross)
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			long encryptByteLength = AES.GetEncryptByteLength(40 * resourceItemsCount, partBlockForPlaintext: true);
			_indexsFs.SetLength(encryptByteLength);
			_storage.SetLength(reservereSourceStreamGross);
		}

		public void BeginWrite()
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
		}

		private int GetNewId()
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			return ++_idBase;
		}

		public void Write(BackupResource resource)
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			if (_indexsFs == null)
			{
				throw new BackupRestoreException("Show call BeginWrite method begin write");
			}
			resource.Id = GetNewId();
			string s = JsonUtils.Stringify((object)resource);
			byte[] bytes = Constants.Encoding.GetBytes(s);
			int num = bytes.Length;
			byte[] array = _aes.Encrypt(bytes);
			BackupStorageIndex item = new BackupStorageIndex
			{
				Id = resource.Id,
				ParentId = resource.ParentId,
				ResourceLength = num,
				ResourceOffset = _indexsFs.Position,
				ResourceStreamOffset = _storage.Position,
				ResourceStreamLength = resource.AssociatedStreamSize
			};
			_newIndexsInfo.Add(item);
			int count = array.Length;
			_indexsFs.Write(array, 0, count);
		}

		public IBackupResourceStreamWriter Seek(BackupResource resource)
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			BackupStorageIndex backupStorageIndex = _newIndexsInfo.FirstOrDefault((BackupStorageIndex m) => m.Id == resource.Id);
			if (backupStorageIndex == null)
			{
				return null;
			}
			return new BackupResourceStreamAESWriter(_storage, _aes, backupStorageIndex.ResourceStreamOffset, backupStorageIndex.ResourceStreamLength);
		}

		public void EndWrite()
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			try
			{
				_indexsFs.SetLength(_indexsFs.Position);
				_storage.SetLength(_storage.Position);
				_indexsFs.Seek(0L, SeekOrigin.Begin);
				byte[] buffer = new byte[1024];
				int num = 0;
				do
				{
					num = _indexsFs.Read(buffer, 0, 1024);
					_storage.Write(buffer, 0, num);
				}
				while (num != 0);
				string s = JsonUtils.Stringify((object)_newIndexsInfo);
				byte[] bytes = Constants.Encoding.GetBytes(s);
				byte[] array = _aes.Encrypt(bytes);
				_storage.Write(array, 0, array.Length);
				byte[] array2 = new byte[1600];
				BackupStorageHead backupStorageHead = new BackupStorageHead
				{
					IndexByteLength = array.Length
				};
				byte[] bytes2 = Constants.Encoding.GetBytes(JsonUtils.Stringify((object)backupStorageHead));
				Array.Copy(BitConverter.GetBytes(bytes2.Length), 0, array2, 0, 4);
				Array.Copy(bytes2, 0, array2, 4, bytes2.Length);
				byte[] array3 = _aes.Encrypt(array2);
				_storage.Write(array3, 0, array3.Length);
				if (encryptionInfo != null)
				{
					byte[] array4 = pw.CreatePWBytes(encryptionInfo);
					_storage.Write(array4, 0, array4.Length);
				}
				else
				{
					_storage.Write(new byte[1], 0, 1);
				}
				_storage.Flush();
			}
			finally
			{
				DisposeIndexFileHandler();
			}
		}

		private void DisposeIndexFileHandler()
		{
			try
			{
				if (_indexsFs != null)
				{
					_indexsFs.Close();
					_indexsFs.Dispose();
					_indexsFs = null;
				}
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Close index fs throw exception:" + ex.ToString(), false);
			}
			try
			{
				if (_indexsFileInfo != null)
				{
					_indexsFileInfo.Delete();
					_indexsFileInfo = null;
				}
			}
			catch (Exception ex2)
			{
				LogHelper.LogInstance.Error("Delete index file info throw exception:" + ex2.ToString(), false);
			}
		}

		public void RemoveEnd()
		{
			if (!_canWrite)
			{
				throw new CanNotWriteException("Can not write");
			}
			if (_newIndexsInfo != null && _newIndexsInfo.Count != 0)
			{
				BackupStorageIndex backupStorageIndex = _newIndexsInfo.Last();
				if (backupStorageIndex != null)
				{
					_newIndexsInfo.Remove(backupStorageIndex);
					_indexsFs?.Seek(backupStorageIndex.ResourceOffset, SeekOrigin.Begin);
					_indexsFs?.SetLength(backupStorageIndex.ResourceOffset);
					_storage?.Seek(backupStorageIndex.ResourceStreamOffset, SeekOrigin.Begin);
					_storage?.SetLength(backupStorageIndex.ResourceStreamOffset);
				}
			}
		}

		public void Dispose()
		{
			DisposeIndexFileHandler();
		}
	}
	public class BackupResourceStreamAESReader : Stream, IBackupResourceStreamReader
	{
		private IBackupStorage _storage;

		private readonly long _baseOffset;

		private readonly long _plaintextLength;

		private long _notReadedLength;

		private readonly long _endPosition;

		private readonly long _encryptLength;

		private long _currentPosition;

		private byte[] _plaintextBuffer;

		private readonly int _plaintextBufferSize = 1600;

		private int _plaintextBufferOffset = 4;

		private int _plaintextBufferEndPosition;

		private AES _aes;

		private byte[] _encryptBlock;

		private readonly int _encryptBlockSize;

		private int _encryptReadedLength;

		private int _encryptBufferOffset;

		public override bool CanRead => true;

		public override bool CanSeek => false;

		public override bool CanWrite => false;

		public override long Length => _plaintextLength;

		public override long Position
		{
			get
			{
				throw new NotImplementedException();
			}
			set
			{
				throw new NotImplementedException();
			}
		}

		public BackupResourceStreamAESReader(IBackupStorage storage, AES aes, long offset, long length)
		{
			_storage = storage;
			_baseOffset = offset;
			_plaintextLength = length;
			_storage.Seek(_baseOffset, SeekOrigin.Begin);
			_aes = aes;
			_encryptBlock = new byte[1616];
			_encryptBlockSize = _encryptBlock.Length;
			_encryptLength = AES.GetEncryptByteLength(length, partBlockForPlaintext: true);
			_currentPosition = _baseOffset;
			_endPosition = _baseOffset + _encryptLength;
			_notReadedLength = _encryptLength;
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			if (_plaintextBufferOffset == 4 || _plaintextBufferOffset == _plaintextBufferSize)
			{
				_plaintextBuffer = null;
				_plaintextBufferOffset = 4;
				_plaintextBufferEndPosition = 0;
				int num = EncyptDataRead();
				if (num != _encryptBlockSize)
				{
					if (num == 0)
					{
						return 0;
					}
					throw new BackupRestoreException("Read encyption resource stream error");
				}
				_plaintextBuffer = _aes.Decrypt(_encryptBlock);
				if (_plaintextBuffer == null || _plaintextBuffer.Length != _plaintextBufferSize)
				{
					throw new BackupRestoreException("Decrypt resource stream error");
				}
				int num2 = BitConverter.ToInt32(_plaintextBuffer, 0);
				_plaintextBufferEndPosition = _plaintextBufferOffset + num2;
			}
			count = ((_plaintextBufferEndPosition - _plaintextBufferOffset > count) ? count : (_plaintextBufferEndPosition - _plaintextBufferOffset));
			Array.Copy(_plaintextBuffer, _plaintextBufferOffset, buffer, offset, count);
			_plaintextBufferOffset += count;
			return count;
		}

		private int EncyptDataRead()
		{
			if (_currentPosition == _endPosition)
			{
				return 0;
			}
			if (_currentPosition < _baseOffset || _currentPosition > _endPosition)
			{
				throw new BackupRestoreException("Read pointer error!");
			}
			_encryptReadedLength = 0;
			_encryptBufferOffset = 0;
			do
			{
				_encryptReadedLength = _storage.Read(_encryptBlock, _encryptBufferOffset, _encryptBlockSize - _encryptBufferOffset);
				_currentPosition = _storage.Position;
				_encryptBufferOffset += _encryptReadedLength;
			}
			while (_encryptBufferOffset != _encryptBlockSize);
			return _encryptBlockSize;
		}

		public void Seek(long offset)
		{
		}

		public override void Flush()
		{
			throw new NotImplementedException();
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			throw new NotImplementedException();
		}

		public override void SetLength(long value)
		{
			throw new NotImplementedException();
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
			throw new NotImplementedException();
		}
	}
	public class BackupResourceStreamAESWriter : IBackupResourceStreamWriter
	{
		private IBackupStorage _storage;

		private long _storageOffset;

		private long _plaintextLength;

		private AES _aes;

		private byte[] _plaintextBuffer;

		private int _plaintextBufferOffset = 4;

		public BackupResourceStreamAESWriter(IBackupStorage storage, AES aes, long storageOffset, long plaintextLength)
		{
			if (plaintextLength != 0L)
			{
				_storage = storage;
				_storageOffset = storageOffset;
				_plaintextLength = plaintextLength;
				storage.Seek(storageOffset, SeekOrigin.Begin);
				_plaintextBuffer = new byte[1600];
				_aes = aes;
			}
		}

		public void BeginWrite()
		{
		}

		public void Write(byte[] buffer, int offset, int count, long sourceCount)
		{
			if (_plaintextLength == 0L || count == 0)
			{
				return;
			}
			int num = count;
			int num2 = 1600 - _plaintextBufferOffset;
			int num3 = ((num2 > num) ? num : num2);
			do
			{
				Array.Copy(buffer, offset, _plaintextBuffer, _plaintextBufferOffset, num3);
				offset += num3;
				_plaintextBufferOffset += num3;
				num -= num3;
				num2 = 1600 - _plaintextBufferOffset;
				if (num2 == 0)
				{
					InternalWrite(_plaintextBuffer);
					_plaintextBufferOffset = 4;
					num2 = 1600 - _plaintextBufferOffset;
				}
				num3 = ((num2 > num) ? num : num2);
			}
			while (num != 0);
		}

		private void InternalWrite(byte[] buffer)
		{
			Array.Copy(BitConverter.GetBytes(_plaintextBufferOffset - 4), 0, _plaintextBuffer, 0, 4);
			byte[] array = _aes.Encrypt(_plaintextBuffer);
			_storage.Write(array, 0, array.Length);
		}

		public void EndWrite()
		{
			if (_plaintextLength != 0L && _plaintextBufferOffset > 4)
			{
				InternalWrite(_plaintextBuffer);
			}
		}

		public void Seek(long offset)
		{
		}
	}
	public class BackupResourceStreamAESWriterV3 : IBackupResourceStreamWriter
	{
		private IBackupStorage _storage;

		private long _storageOffset;

		private long _plaintextLength;

		private AES _aes;

		private byte[] _plaintextBuffer;

		private int _plaintextBufferOffset = 4;

		public BackupResourceStreamAESWriterV3(IBackupStorage storage, AES aes, long storageOffset, long plaintextLength)
		{
			if (plaintextLength != 0L)
			{
				_storage = storage;
				_storageOffset = storageOffset;
				_plaintextLength = plaintextLength;
				storage.Seek(storageOffset, SeekOrigin.Begin);
				_plaintextBuffer = new byte[1600];
				_aes = aes;
			}
		}

		public void BeginWrite()
		{
		}

		public void Write(byte[] buffer, int offset, int count, long sourceCount)
		{
			if (_plaintextLength == 0L || count == 0)
			{
				return;
			}
			int num = count;
			int num2 = 1600 - _plaintextBufferOffset;
			int num3 = ((num2 > num) ? num : num2);
			do
			{
				Array.Copy(buffer, offset, _plaintextBuffer, _plaintextBufferOffset, num3);
				offset += num3;
				_plaintextBufferOffset += num3;
				num -= num3;
				num2 = 1600 - _plaintextBufferOffset;
				if (num2 == 0)
				{
					InternalWrite(_plaintextBuffer);
					_plaintextBufferOffset = 4;
					num2 = 1600 - _plaintextBufferOffset;
				}
				num3 = ((num2 > num) ? num : num2);
			}
			while (num != 0);
		}

		private void InternalWrite(byte[] buffer)
		{
			Array.Copy(BitConverter.GetBytes(_plaintextBufferOffset - 4), 0, _plaintextBuffer, 0, 4);
			byte[] array = _aes.Encrypt(_plaintextBuffer);
			_storage.Write(array, 0, array.Length);
		}

		public void EndWrite()
		{
			if (_plaintextLength != 0L && _plaintextBufferOffset > 4)
			{
				InternalWrite(_plaintextBuffer);
			}
		}

		public void Seek(long offset)
		{
		}
	}
	public class BackupStorage : IBackupStorage, IDisposable
	{
		private class BRWriterReaderFactory
		{
			private BackupStorage _outer;

			public IBackupResourceReader BackupResourceReader { get; private set; }

			public IBackupResourceWriter BackupResourceWriter { get; private set; }

			public BRWriterReaderFactory(BackupStorage outer)
			{
				_outer = outer;
			}

			public void Load()
			{
			}
		}

		private FileInfo _fileInfo;

		private FileStream _fs;

		private bool m_isDisposed;

		private IBackupResourceWriter _backupResourceWriter;

		private IBackupResourceReader _backupResourceReader;

		private string _version = string.Empty;

		public long Position
		{
			get
			{
				if (_fs != null)
				{
					return _fs.Position;
				}
				return 0L;
			}
		}

		public string StoragePath => _fileInfo.FullName;

		public long Size
		{
			get
			{
				if (_fs == null)
				{
					return 0L;
				}
				return _fs.Length;
			}
		}

		public BackupStorage(FileInfo fileInfo)
		{
			_fileInfo = fileInfo;
		}

		public int Read(byte[] buffer, int offset, int count)
		{
			if (m_isDisposed && _fs == null)
			{
				return 0;
			}
			if (_fs == null)
			{
				throw new BackupRestoreException("Read stream is null,should open write");
			}
			return _fs.Read(buffer, offset, count);
		}

		public void Seek(long offset, SeekOrigin seekOrigin)
		{
			if (!m_isDisposed || _fs != null)
			{
				if (_fs == null)
				{
					throw new BackupRestoreException("Seek, Write/read stream is null,should open write/read");
				}
				_fs.Seek(offset, seekOrigin);
			}
		}

		public void Write(byte[] buffer, int offset, int count)
		{
			if (!m_isDisposed || _fs != null)
			{
				if (_fs == null)
				{
					throw new BackupRestoreException("Write stream is null,should open write");
				}
				_fs.Write(buffer, offset, count);
			}
		}

		public IBackupResourceWriter OpenWrite(string version)
		{
			if (_fs == null)
			{
				if (!_fileInfo.Directory.Exists)
				{
					_fileInfo.Directory.Create();
				}
				_fs = _fileInfo.OpenWrite();
				m_isDisposed = false;
				if (_fs.Length == 0L)
				{
					byte[] buffer = new BackupStorageVersion().EncryptVersion(version);
					_fs.Write(buffer, 0, 48);
				}
				_backupResourceWriter = LoadBRWriterReaderVersionType<IBackupResourceWriter>(version);
			}
			return _backupResourceWriter;
		}

		public IBackupResourceReader OpenRead(out string version)
		{
			version = _version;
			if (_fs == null)
			{
				_fs = _fileInfo.OpenRead();
				m_isDisposed = false;
				byte[] array = new byte[48];
				if (_fs.Read(array, 0, 48) != 48)
				{
					throw new BackupRestoreException("Get storage version failed");
				}
				BackupStorageVersion backupStorageVersion = new BackupStorageVersion();
				_version = (version = backupStorageVersion.DecryptVersion(array));
				_backupResourceReader = LoadBRWriterReaderVersionType<IBackupResourceReader>(version);
			}
			return _backupResourceReader;
		}

		private T LoadBRWriterReaderVersionType<T>(string version)
		{
			Type typeFromHandle = typeof(T);
			Type[] types = Assembly.GetAssembly(typeFromHandle).GetTypes();
			foreach (Type type in types)
			{
				if (!type.IsClass || !typeFromHandle.IsAssignableFrom(type))
				{
					continue;
				}
				object[] customAttributes = type.GetCustomAttributes(typeof(SupportedFormatVersionAttribute), inherit: false);
				if (customAttributes.Count() == 0)
				{
					continue;
				}
				object[] array = customAttributes;
				for (int j = 0; j < array.Length; j++)
				{
					if (((SupportedFormatVersionAttribute)array[j]).Version.Equals(version))
					{
						return (T)Activator.CreateInstance(type, this);
					}
				}
			}
			return default(T);
		}

		public void Flush()
		{
			if (!m_isDisposed || _fs != null)
			{
				if (_fs == null)
				{
					throw new BackupRestoreException("Flush, Write/read stream is null,should open write/read");
				}
				_fs.Flush();
			}
		}

		public void Dispose()
		{
			if (_fs != null)
			{
				try
				{
					_fs.Close();
					_fs.Dispose();
					_fs = null;
					m_isDisposed = true;
				}
				catch (Exception)
				{
				}
			}
			try
			{
				_backupResourceReader?.Dispose();
			}
			catch (Exception)
			{
			}
			try
			{
				_backupResourceWriter?.Dispose();
			}
			catch (Exception)
			{
			}
		}

		public void Delete()
		{
			_fileInfo?.Delete();
		}

		public void SetLength(long length)
		{
			if (!m_isDisposed || _fs != null)
			{
				if (_fs == null)
				{
					throw new BackupRestoreException("SetLength, Write/read stream is null,should open write/read");
				}
				_fs.SetLength(length);
			}
		}
	}
	public class BackupStorageHead
	{
		[JsonIgnore]
		public const int BackupStorageHeadByteLength = 1616;

		[JsonProperty("il")]
		public int IndexByteLength { get; set; }
	}
	internal class BackupStorageIndex
	{
		public const int ByteLength = 40;

		[JsonProperty("id")]
		public int Id { get; set; }

		[JsonProperty("pd")]
		public int ParentId { get; set; }

		[JsonProperty("ro")]
		public long ResourceOffset { get; set; }

		[JsonProperty("rl")]
		public long ResourceLength { get; set; }

		[JsonProperty("rso")]
		public long ResourceStreamOffset { get; set; }

		[JsonProperty("rsl")]
		public long ResourceStreamLength { get; set; }
	}
	public class BackupStorageVersion
	{
		public const int ENCRYPT_BYTES_LNGTH = 48;

		private AES _aes;

		public BackupStorageVersion()
		{
			_aes = new AES();
		}

		public byte[] EncryptVersion(string version)
		{
			if (!Guid.TryParse(version, out var _))
			{
				throw new BackupRestoreException("Storage version format is error");
			}
			byte[] array = _aes.Encrypt(Constants.Encoding.GetBytes(version));
			if (array.Length != 48)
			{
				throw new BackupRestoreException("Version encrypt failed");
			}
			return array;
		}

		public string DecryptVersion(byte[] bytes)
		{
			string text = Constants.Encoding.GetString(_aes.Decrypt(bytes));
			if (!Guid.TryParse(text, out var _))
			{
				throw new BackupRestoreException("Storage version format is error");
			}
			return text;
		}
	}
	public interface IBackupResourceReader : IDisposable
	{
		bool CanRead();

		bool IsSetPassword();

		bool CheckPassword(string password);

		IBackupResourceStreamReader Seek(BackupResource resource);

		List<BackupResource> GetChildResources(BackupResource parent);

		void Foreach(BackupResource resource, Action<BackupResource> callback);
	}
	public interface IBackupResourceStreamReader
	{
		void Seek(long offset);

		int Read(byte[] buffer, int offset, int count);
	}
	public interface IBackupResourceStreamWriter
	{
		void Seek(long offset);

		void BeginWrite();

		void Write(byte[] buffer, int offset, int count, long sourceCount);

		void EndWrite();
	}
	public interface IBackupResourceWriter : IDisposable
	{
		bool CanWrite();

		void SetPassword(string password);

		void BeginWrite();

		void ReserveDiskSpace(int resourceItemsCount, long reservereSourceStreamGross);

		IBackupResourceStreamWriter Seek(BackupResource resource);

		void Write(BackupResource resource);

		void RemoveEnd();

		void EndWrite();
	}
	public interface IBackupStorage : IDisposable
	{
		string StoragePath { get; }

		long Position { get; }

		long Size { get; }

		void Seek(long offset, SeekOrigin seekOrigin);

		void SetLength(long length);

		IBackupResourceWriter OpenWrite(string version);

		void Write(byte[] buffer, int offset, int count);

		IBackupResourceReader OpenRead(out string version);

		int Read(byte[] buffer, int offset, int count);

		void Flush();

		void Delete();
	}
	internal class PW
	{
		internal class EncryptionInfo
		{
			public byte[] AesKey { get; set; }

			public byte[] AesSalt { get; set; }

			public byte[] AesVector { get; set; }
		}

		internal class PWInfo
		{
			public byte[] AesSalt { get; set; }

			public byte[] AesVetcor { get; set; }

			public byte[] PK { get; set; }

			public bool IsSetPassword { get; set; }

			public int PWBlockSize { get; set; }

			public PWInfo()
			{
				PWBlockSize = 1;
				IsSetPassword = false;
			}
		}

		private const int AesKeyBlockSize = 32;

		private const int AesSaltBlockSize = 16;

		private const int AesVectorBlockSize = 16;

		private const int PKBlockSize = 64;

		private const int Iterations = 20000;

		private const int PasswordSetFlag = 1;

		internal const int PWBlockSize = 97;

		internal EncryptionInfo CreateAesEncryptionInfo(string password)
		{
			try
			{
				EncryptionInfo encryptionInfo = new EncryptionInfo();
				using (RNGCryptoServiceProvider rNGCryptoServiceProvider = new RNGCryptoServiceProvider())
				{
					byte[] array = new byte[16];
					rNGCryptoServiceProvider.GetBytes(array);
					encryptionInfo.AesVector = array;
					byte[] array2 = new byte[16];
					rNGCryptoServiceProvider.GetBytes(array2);
					encryptionInfo.AesSalt = array2;
				}
				using (Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(password, encryptionInfo.AesSalt, 20000))
				{
					encryptionInfo.AesKey = rfc2898DeriveBytes.GetBytes(32);
					rfc2898DeriveBytes.Reset();
				}
				return encryptionInfo;
			}
			catch (Exception)
			{
				return null;
			}
		}

		internal byte[] CreatePWBytes(EncryptionInfo encryptionInfo)
		{
			try
			{
				byte[] array = new byte[97];
				int num = 0;
				Array.Copy(encryptionInfo.AesSalt, array, 16);
				num += 16;
				Array.Copy(encryptionInfo.AesVector, 0, array, num, 16);
				num += 16;
				byte[] array2 = new byte[32];
				Array.Copy(encryptionInfo.AesSalt, array2, 16);
				Array.Copy(encryptionInfo.AesVector, 0, array2, 16, 16);
				using (HMACSHA512 hMACSHA = new HMACSHA512(encryptionInfo.AesKey))
				{
					Array.Copy(hMACSHA.ComputeHash(array2), 0, array, num, 64);
					num += 64;
					array[num] = 1;
					hMACSHA.Clear();
				}
				return array;
			}
			catch (Exception)
			{
				return null;
			}
		}

		internal EncryptionInfo GetEncryptionInfo(PWInfo pwInfo, string password)
		{
			if (pwInfo == null || string.IsNullOrEmpty(password))
			{
				return null;
			}
			try
			{
				byte[] aesSalt = pwInfo.AesSalt;
				byte[] aesVetcor = pwInfo.AesVetcor;
				byte[] pK = pwInfo.PK;
				byte[] array = null;
				using (Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(password, aesSalt, 20000))
				{
					array = rfc2898DeriveBytes.GetBytes(32);
					rfc2898DeriveBytes.Reset();
				}
				byte[] array2 = new byte[32];
				Array.Copy(aesSalt, array2, 16);
				Array.Copy(aesVetcor, 0, array2, 16, 16);
				byte[] array3 = null;
				using (HMACSHA512 hMACSHA = new HMACSHA512(array))
				{
					array3 = hMACSHA.ComputeHash(array2);
					hMACSHA.Clear();
				}
				if (pK != null && array3 != null && pK.Length != 0 && pK.Length == array3.Length)
				{
					bool flag = true;
					for (int i = 0; i < pK.Length; i++)
					{
						flag &= pK[i] == array3[i];
						if (!flag)
						{
							break;
						}
					}
					if (flag)
					{
						return new EncryptionInfo
						{
							AesKey = array,
							AesVector = aesVetcor,
							AesSalt = aesSalt
						};
					}
				}
			}
			catch (Exception)
			{
			}
			return null;
		}

		internal PWInfo ConvertToPwInfo(byte[] pwInfoBytes)
		{
			if (pwInfoBytes.Length != 97)
			{
				return null;
			}
			try
			{
				PWInfo pWInfo = new PWInfo();
				byte[] array = new byte[16];
				Array.Copy(pwInfoBytes, array, 16);
				int num = 16;
				pWInfo.AesSalt = array;
				byte[] array2 = new byte[16];
				Array.Copy(pwInfoBytes, num, array2, 0, 16);
				num += 16;
				pWInfo.AesVetcor = array2;
				byte[] array3 = new byte[64];
				Array.Copy(pwInfoBytes, num, array3, 0, 64);
				num += 64;
				pWInfo.PK = array3;
				int num2 = pwInfoBytes[num];
				pWInfo.IsSetPassword = num2 == 1;
				pWInfo.PWBlockSize = 97;
				return pWInfo;
			}
			catch (Exception)
			{
				return null;
			}
		}
	}
	public class BackupStorageVersionDefine
	{
		public const string VERSION1 = "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}";

		public const string VERSION2 = "{9A7CEC3B-8DE0-439D-B3CF-5DAD3691C605}";

		public const string VERSION3 = "{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}";
	}
	[AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = true)]
	public class SupportedFormatVersionAttribute : Attribute
	{
		public string Version { get; set; }

		public SupportedFormatVersionAttribute(string version)
		{
			Version = version;
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.Business.Restore
{
	[RestoreStorageInfo("{89D4DB68-4258-4002-8557-E65959C558B3}", "{9A7CEC3B-8DE0-439D-B3CF-5DAD3691C605}")]
	public class CallLogRestoreWorkerExV2 : RestoreWorkerAbstractEx
	{
		public CallLogRestoreWorkerExV2(TcpAndroidDevice device, IBackupResourceReader backupResourceReader, string resourceType, int requestServiceCode, string requestMethodName)
			: base(device, backupResourceReader, resourceType, requestServiceCode, requestMethodName)
		{
		}

		public override void DoProcess(object state)
		{
			//IL_0179: Unknown result type (might be due to invalid IL or missing references)
			//IL_018d: Expected O, but got Unknown
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a6: Invalid comparison between Unknown and I4
			if (base.Device == null)
			{
				return;
			}
			CheckCancel();
			List<CallLog> list = new List<CallLog>();
			TcpAndroidDevice device = base.Device;
			int num = 10240;
			byte[] array = new byte[num];
			int num2 = 0;
			foreach (BackupResource childResourceNode in base.ChildResourceNodes)
			{
				if (childResourceNode.AssociatedStreamSize == 0L)
				{
					continue;
				}
				if (num < childResourceNode.AssociatedStreamSize)
				{
					array = new byte[childResourceNode.AssociatedStreamSize];
				}
				IBackupResourceStreamReader backupResourceStreamReader = base.BackupResourceReader.Seek(childResourceNode);
				int num3 = 0;
				do
				{
					num2 = backupResourceStreamReader.Read(array, num3, num);
					num3 += num2;
					if ((int)((DeviceEx)device).PhysicalStatus != 2 && base.TaskContext.IsCancelCommandRequested)
					{
						return;
					}
				}
				while (num2 != 0);
				string text = Encoding.UTF8.GetString(array, 0, num3);
				list.AddRange(JsonConvert.DeserializeObject<List<CallLog>>(text));
			}
			AppDataInporter<CallLog> obj = new AppDataInporter<CallLog>(base.RequestServiceCode, list)
			{
				CloseStreamAfterSend = false,
				TaskContext = base.TaskContext,
				ResourceItemStartImportCallback = delegate(CallLog rs)
				{
					base.ItemStartRestoreCallback?.Invoke(rs.Id);
				},
				ResourceItemFinishImportCallback = delegate(CallLog rs, BackupRestoreResult isSuccess)
				{
					//IL_001b: Unknown result type (might be due to invalid IL or missing references)
					base.ItemFinishRestoreCallback?.Invoke(rs.Id, string.Empty, isSuccess);
				},
				ItemProgressCallback = delegate(CallLog rs, int rl, long rt, long tl)
				{
					base.ItemRestoreProgressCallback?.Invoke(string.Empty, rl, rt, tl);
				}
			};
			MemoryStream memoryStream = new MemoryStream();
			obj.CreateDataReadStream = delegate(CallLog rs, string convertedPath)
			{
				string s = JsonConvert.SerializeObject((object)rs);
				byte[] bytes = Encoding.UTF8.GetBytes(s);
				int num4 = bytes.Length;
				memoryStream.Seek(0L, SeekOrigin.Begin);
				memoryStream.Write(bytes, 0, num4);
				memoryStream.SetLength(num4);
				memoryStream.Seek(0L, SeekOrigin.Begin);
				return memoryStream;
			};
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			obj.Import((TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null), new Header(), base.RequestServiceCode == 23);
		}
	}
	public enum ContactType
	{
		PHONE,
		SIM1,
		SIM2
	}
	public enum CallType
	{
		INCOMING = 1,
		OUTGOING,
		MISSED,
		VOICEMAIL,
		REJECTED,
		BLOCKED
	}
	public class CallLog : NotifyBase
	{
		private bool _isSelected;

		[JsonIgnore]
		private DateTime _callDate = DateTime.MinValue;

		[JsonIgnore]
		public bool isSelected
		{
			get
			{
				return _isSelected;
			}
			set
			{
				_isSelected = value;
				((NotifyBase)this).OnPropertyChanged("isSelected");
			}
		}

		[JsonProperty("id")]
		public string Id { get; set; }

		[JsonProperty("contact")]
		public string Contact { get; set; }

		[JsonProperty("callType")]
		public CallType CallType { get; set; }

		[JsonIgnore]
		public ContactType SimUsed { get; set; }

		[JsonProperty("duration")]
		public long Duration { get; set; }

		[JsonProperty("date")]
		public string ROWCallDate { get; set; }

		[JsonIgnore]
		public DateTime CallDate
		{
			get
			{
				if (_callDate != DateTime.MinValue)
				{
					return _callDate;
				}
				if (!string.IsNullOrEmpty(ROWCallDate))
				{
					DateTime.TryParse(ROWCallDate, out _callDate);
				}
				return _callDate;
			}
		}
	}
	[RestoreStorageInfo("{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}", "{9A7CEC3B-8DE0-439D-B3CF-5DAD3691C605}")]
	public class ContactRestoreWorkerExV2 : RestoreWorkerAbstractEx
	{
		public ContactRestoreWorkerExV2(TcpAndroidDevice device, IBackupResourceReader backupResourceReader, string resourceType, int requestServiceCode, string requestMethodName)
			: base(device, backupResourceReader, resourceType, requestServiceCode, requestMethodName)
		{
		}

		public override void DoProcess(object state)
		{
			//IL_01c7: Unknown result type (might be due to invalid IL or missing references)
			//IL_01db: Expected O, but got Unknown
			//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b7: Invalid comparison between Unknown and I4
			if (base.Device == null)
			{
				return;
			}
			CheckCancel();
			List<string> list = new List<string>();
			TcpAndroidDevice currentDevice = base.Device;
			int num = 10240;
			byte[] array = new byte[num];
			int num2 = 0;
			StringBuilder stringBuilder = new StringBuilder();
			foreach (BackupResource childResourceNode in base.ChildResourceNodes)
			{
				if (childResourceNode.AssociatedStreamSize == 0L)
				{
					continue;
				}
				if (num < childResourceNode.AssociatedStreamSize)
				{
					array = new byte[childResourceNode.AssociatedStreamSize];
				}
				IBackupResourceStreamReader backupResourceStreamReader = base.BackupResourceReader.Seek(childResourceNode);
				int num3 = 0;
				do
				{
					num2 = backupResourceStreamReader.Read(array, num3, num);
					num3 += num2;
					if ((int)((DeviceEx)currentDevice).PhysicalStatus != 2 && base.TaskContext.IsCancelCommandRequested)
					{
						return;
					}
				}
				while (num2 != 0);
				string s = Encoding.UTF8.GetString(array, 0, num3);
				string empty = string.Empty;
				using StringReader stringReader = new StringReader(s);
				while ((empty = stringReader.ReadLine()) != null)
				{
					if ("END:VCARD".Equals(empty))
					{
						stringBuilder.AppendLine(empty);
						list.Add(stringBuilder.ToString());
						stringBuilder.Clear();
					}
					stringBuilder.AppendLine(empty);
				}
			}
			AppDataInporter<string> obj = new AppDataInporter<string>(base.RequestServiceCode, list);
			obj.CloseStreamAfterSend = true;
			obj.TaskContext = base.TaskContext;
			obj.ResourceItemStartImportCallback = delegate(string rs)
			{
				base.ItemStartRestoreCallback?.Invoke(rs);
			};
			obj.ResourceItemFinishImportCallback = delegate(string rs, BackupRestoreResult isSuccess)
			{
				//IL_0016: Unknown result type (might be due to invalid IL or missing references)
				base.ItemFinishRestoreCallback?.Invoke(rs, string.Empty, isSuccess);
			};
			obj.ItemProgressCallback = delegate(string rs, int rl, long rt, long tl)
			{
				base.ItemRestoreProgressCallback?.Invoke(string.Empty, rl, rt, tl);
			};
			obj.CreateDataReadStream = delegate(string rs, string convertedPath)
			{
				string s2 = JsonConvert.SerializeObject((object)rs);
				return new MemoryStream(currentDevice.RsaSocketEncryptHelper.EncryptBase64(Encoding.UTF8.GetBytes(s2)));
			};
			obj.Import(currentDevice, new Header(), base.RequestServiceCode == 23);
		}
	}
	[RestoreStorageInfo("{89D4DB68-4258-4002-8557-E65959C558B3}", "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}")]
	[RestoreStorageInfo("{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}", "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}")]
	[RestoreStorageInfo("{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}", "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}")]
	public class DBDataRestoreWorker : RestoreWorkerAbstractEx
	{
		public DBDataRestoreWorker(TcpAndroidDevice device, IBackupResourceReader backupResourceReader, string resourceType, int requestServiceCode, string requestMethodName)
			: base(device, backupResourceReader, resourceType, requestServiceCode, requestMethodName)
		{
		}

		public override void DoProcess(object state)
		{
			//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cf: Expected O, but got Unknown
			if (base.Device == null)
			{
				return;
			}
			CheckCancel();
			List<BackupResource> retryNodes = base.RetryNodes;
			List<BackupResource> list = ((retryNodes != null && retryNodes.Count > 0) ? base.RetryNodes : base.ChildResourceNodes);
			AppDataInporter<BackupResource> obj = new AppDataInporter<BackupResource>(base.RequestServiceCode, list);
			obj.CloseStreamAfterSend = true;
			obj.TaskContext = base.TaskContext;
			obj.ResourceItemStartImportCallback = delegate(BackupResource rs)
			{
				base.ItemStartRestoreCallback?.Invoke(rs.Value);
			};
			obj.ResourceItemFinishImportCallback = delegate(BackupResource rs, BackupRestoreResult isSuccess)
			{
				//IL_001e: Unknown result type (might be due to invalid IL or missing references)
				base.ItemFinishRestoreCallback?.Invoke(rs.Id.ToString(), string.Empty, isSuccess);
			};
			obj.ItemProgressCallback = delegate(BackupResource rs, int rl, long rt, long tl)
			{
				base.ItemRestoreProgressCallback?.Invoke(string.Empty, rl, rt, tl);
			};
			obj.CreateDataReadStream = delegate(BackupResource rs, string convertedPath)
			{
				IBackupResourceStreamReader backupResourceStreamReader = base.BackupResourceReader.Seek(rs);
				int num = 0;
				byte[] buffer = new byte[1024];
				MemoryStream memoryStream = new MemoryStream();
				do
				{
					num = backupResourceStreamReader.Read(buffer, 0, 1024);
					memoryStream.Write(buffer, 0, num);
				}
				while (num > 0);
				backupResourceStreamReader = null;
				memoryStream.Position = 0L;
				return memoryStream;
			};
			bool flag = base.RequestServiceCode == 23 || base.RequestServiceCode == 21 || base.RequestServiceCode == 22;
			obj.Import(base.Device, new Header(), flag);
		}
	}
	public class DeviceRestoreWorkerEx : IDisposable
	{
		private IBackupStorage _storage;

		private IBackupResourceReader _backupResourceReader;

		private string storageVersion = string.Empty;

		protected IAsyncTaskContext _Context;

		private TcpAndroidDevice device;

		private volatile bool _cancel;

		public List<IWorker> _workerList;

		private IWorker _currentWorker;

		private List<string> BigFileList = new List<string> { "{773D71F7-CE8A-42D7-BE58-5F875DF58C16}", "{242C8F16-6AC7-431B-BBF1-AE24373860F1}", "{8BEBE14B-4E45-4D36-8726-8442E6242C01}", "{958781C8-0788-4F87-A4C3-CBD793AAB1A0}" };

		private Dictionary<string, int> resourcesCountMapping;

		private Action<string, string, object> _notifyHandler;

		private Action<IWorker> _currentWorkerHanler;

		public string StorageFileVersion => storageVersion;

		public IAsyncTaskContext TaskContext
		{
			get
			{
				return _Context;
			}
			set
			{
				_Context = value;
			}
		}

		public Dictionary<string, List<BackupResource>> TypeResourceMapping { get; private set; }

		public Action<string, string> ResourceItemStartRestoreCallback { get; set; }

		public Action<string, int> ResourceTypeStartRestoreCallback { get; set; }

		public Action<string, int, int> ResourceTypeFinishRestoreCallback { get; set; }

		public Action<string, string, string, BackupRestoreResult> ResourceItemFinishRestoreCallback { get; set; }

		public Action<string, string, int, long, long> ResourceItemRestoreProgressCallback { get; set; }

		public Action<List<string>, Dictionary<string, List<string>>> RetryCallback { get; set; }

		public Dictionary<string, int> ResourcesCountMapping => resourcesCountMapping;

		public static bool CloseModeWin { get; set; }

		public DeviceRestoreWorkerEx(IAsyncTaskContext context, TcpAndroidDevice device, IBackupStorage storage)
		{
			this.device = device;
			_Context = context;
			_storage = storage;
			_backupResourceReader = _storage.OpenRead(out storageVersion);
			_workerList = new List<IWorker>();
			RetryCallback = FireRetryCallback;
		}

		public void Cancel()
		{
			_cancel = true;
			_currentWorker?.Cancel();
		}

		public void Abort()
		{
			_cancel = true;
			_currentWorker?.Abort();
		}

		public void Dispose()
		{
			_currentWorker = null;
			foreach (IWorker item in _workerList.ToList())
			{
				item.Dispose();
			}
			CloseModeWin = true;
			_storage?.Dispose();
			_backupResourceReader?.Dispose();
			_backupResourceReader = null;
		}

		protected void FireRetryCallback(List<string> selectedType, Dictionary<string, List<string>> retryIds)
		{
			PrepareWorker(selectedType, retryIds);
			DoProcess(null);
		}

		public void UpdateDevice(TcpAndroidDevice dev)
		{
			device = dev;
			foreach (IWorker worker in _workerList)
			{
				RestoreWorkerAbstractEx obj = worker as RestoreWorkerAbstractEx;
				obj.UpdateDevice(dev);
				obj.TaskContext = TaskContext;
			}
		}

		public void PrepareWorker(List<string> resourcesType, Dictionary<string, List<string>> retryIds = null)
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null || ((DeviceEx)val).Property == null)
			{
				return;
			}
			TypeResourceMapping = new Dictionary<string, List<BackupResource>>();
			string internalStoragePath = ((DeviceEx)val).Property.InternalStoragePath;
			int num = 0;
			resourcesCountMapping = new Dictionary<string, int>();
			_workerList.Clear();
			foreach (string item in resourcesType)
			{
				RestoreWorkerAbstractEx restoreWorkerAbstractEx = null;
				switch (item)
				{
				case "{773D71F7-CE8A-42D7-BE58-5F875DF58C16}":
					restoreWorkerAbstractEx = new RestoreWorkerAbstractEx(device, _backupResourceReader, item, 17, internalStoragePath);
					break;
				case "{242C8F16-6AC7-431B-BBF1-AE24373860F1}":
					restoreWorkerAbstractEx = new RestoreWorkerAbstractEx(device, _backupResourceReader, item, 19, internalStoragePath);
					break;
				case "{8BEBE14B-4E45-4D36-8726-8442E6242C01}":
					restoreWorkerAbstractEx = new RestoreWorkerAbstractEx(device, _backupResourceReader, item, 20, internalStoragePath);
					break;
				case "{580C48C8-6CEF-4BBB-AF37-D880B349D142}":
					restoreWorkerAbstractEx = new RestoreWorkerAbstractEx(device, _backupResourceReader, item, 25, internalStoragePath);
					break;
				case "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}":
					switch (storageVersion)
					{
					case "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}":
						restoreWorkerAbstractEx = new ContactRestoreWorkerExV2(device, _backupResourceReader, item, 22, string.Empty);
						break;
					case "{9A7CEC3B-8DE0-439D-B3CF-5DAD3691C605}":
					case "{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}":
						restoreWorkerAbstractEx = new DBDataRestoreWorker(device, _backupResourceReader, item, 23, string.Empty);
						break;
					}
					break;
				case "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}":
					switch (storageVersion)
					{
					case "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}":
						restoreWorkerAbstractEx = new SmsRestoreWorkerExV2(device, _backupResourceReader, item, 21, string.Empty);
						break;
					case "{9A7CEC3B-8DE0-439D-B3CF-5DAD3691C605}":
					case "{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}":
						restoreWorkerAbstractEx = new SmsRestoreWorkerEx(device, _backupResourceReader, item, 21, string.Empty);
						break;
					}
					break;
				case "{89D4DB68-4258-4002-8557-E65959C558B3}":
					switch (storageVersion)
					{
					case "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}":
						restoreWorkerAbstractEx = new CallLogRestoreWorkerExV2(device, _backupResourceReader, item, 22, string.Empty);
						break;
					case "{9A7CEC3B-8DE0-439D-B3CF-5DAD3691C605}":
					case "{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}":
						restoreWorkerAbstractEx = new DBDataRestoreWorker(device, _backupResourceReader, item, 22, string.Empty);
						break;
					}
					break;
				}
				if (restoreWorkerAbstractEx == null)
				{
					continue;
				}
				TypeResourceMapping.Add(item, restoreWorkerAbstractEx.ChildResourceNodes);
				resourcesCountMapping[restoreWorkerAbstractEx.ResourceType] = restoreWorkerAbstractEx.ChildResourceNodes.Count;
				restoreWorkerAbstractEx.WorkerSequence = num++;
				restoreWorkerAbstractEx.TaskContext = _Context;
				if (retryIds != null && retryIds.Count > 0)
				{
					LogHelper.LogInstance.Debug("Restore all ids: " + JsonHelper.SerializeObject2Json((object)retryIds), false);
					List<BackupResource> all = GetAll();
					if (all != null && all.Count > 0)
					{
						restoreWorkerAbstractEx.RetryNodes = all.Where((BackupResource n) => retryIds[item].Exists((string m) => m == n.Id.ToString())).ToList();
					}
				}
				_workerList.Add(restoreWorkerAbstractEx);
			}
			int num2 = _workerList.FindIndex((IWorker n) => n.WorkerId == "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}");
			if (num2 != -1 && num2 != _workerList.Count - 1)
			{
				IWorker item2 = _workerList[num2];
				_workerList.RemoveAt(num2);
				_workerList.Add(item2);
			}
		}

		public List<BackupResource> GetAll()
		{
			List<BackupResource> result = new List<BackupResource>();
			_backupResourceReader.Foreach(null, delegate(BackupResource n)
			{
				result.Add(n);
			});
			return result;
		}

		public long CalculateSize(List<string> resourcesType)
		{
			long size = 0L;
			List<BackupResource> childResources = _backupResourceReader.GetChildResources(null);
			List<string> type = resourcesType.Intersect(BigFileList).ToList();
			List<BackupResource> list = childResources.Where((BackupResource n) => type.Contains(n.Tag)).ToList();
			if (list != null && list.Count > 0)
			{
				list.ForEach(delegate(BackupResource n)
				{
					_backupResourceReader.Foreach(n, delegate(BackupResource o)
					{
						size += o.AssociatedStreamSize;
					});
				});
			}
			return size;
		}

		public int GetFileCount()
		{
			int num = 0;
			foreach (IWorker worker in _workerList)
			{
				if (worker is RestoreWorkerAbstractEx restoreWorkerAbstractEx)
				{
					num += restoreWorkerAbstractEx.ChildResourceNodes.Count;
				}
			}
			return num;
		}

		public void DoProcess(object state)
		{
			foreach (IWorker worker in _workerList)
			{
				_currentWorker = worker;
				RestoreWorkerAbstractEx w = (RestoreWorkerAbstractEx)worker;
				int restoreCount = w.GetRestoreCount();
				if (restoreCount == 0)
				{
					continue;
				}
				ResourceTypeStartRestoreCallback?.Invoke(w.ResourceType, restoreCount);
				if (ResourceItemStartRestoreCallback != null)
				{
					w.ItemStartRestoreCallback = delegate(string path)
					{
						ResourceItemStartRestoreCallback(w.ResourceType, path);
					};
				}
				if (ResourceItemFinishRestoreCallback != null)
				{
					w.ItemFinishRestoreCallback = delegate(string id, string path, BackupRestoreResult isSuccess)
					{
						//IL_0018: Unknown result type (might be due to invalid IL or missing references)
						ResourceItemFinishRestoreCallback(w.ResourceType, id, path, isSuccess);
					};
				}
				if (ResourceItemRestoreProgressCallback != null)
				{
					w.ItemRestoreProgressCallback = delegate(string path, int rl, long rt, long len)
					{
						ResourceItemRestoreProgressCallback(w.ResourceType, path, rl, rt, len);
					};
				}
				_currentWorkerHanler?.Invoke(_currentWorker);
				if (_cancel)
				{
					LogHelper.LogInstance.Info("restore resource canceled", false);
					break;
				}
				try
				{
					if (resourcesCountMapping.ContainsKey(w.ResourceType))
					{
						worker.DoProcess(resourcesCountMapping[w.ResourceType]);
					}
					else
					{
						worker.DoProcess(null);
					}
				}
				catch (CacnelException ex)
				{
					throw ex;
				}
				catch (Exception ex2)
				{
					LogHelper.LogInstance.Info(ex2.ToString(), false);
				}
			}
		}

		public void SetNotifyHandler(Action<string, string, object> notifyHandler)
		{
			_notifyHandler = notifyHandler;
		}

		public void SetCurrentWorkerHandler(Action<IWorker> handler)
		{
			_currentWorkerHanler = handler;
		}
	}
	[AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = false)]
	public class RestoreStorageInfoAttribute : Attribute
	{
		public string ResourceType { get; private set; }

		public string StorageFileVersion { get; private set; }

		public RestoreStorageInfoAttribute(string resourceType, string storageFileVersion)
		{
			ResourceType = resourceType;
			StorageFileVersion = storageFileVersion;
		}
	}
	[RestoreStorageInfo("{773D71F7-CE8A-42D7-BE58-5F875DF58C16}", "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}")]
	[RestoreStorageInfo("{242C8F16-6AC7-431B-BBF1-AE24373860F1}", "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}")]
	[RestoreStorageInfo("{8BEBE14B-4E45-4D36-8726-8442E6242C01}", "{F6DC6725-E73D-41B6-9DB0-B964C48BCEAF}")]
	public class RestoreWorkerAbstractEx : IWorker, IDisposable
	{
		private int mRequestServiceCode;

		private string mRemoteDir;

		protected IBackupResourceReader BackupResourceReader { get; set; }

		public string ResourceType { get; set; }

		protected TcpAndroidDevice Device { get; set; }

		public virtual string WorkerId { get; set; }

		public int WorkerSequence { get; set; }

		public IAsyncTaskContext TaskContext { get; set; }

		protected BackupResource RootResource { get; set; }

		protected int RequestServiceCode => mRequestServiceCode;

		protected string RemoteDir => mRemoteDir;

		public List<BackupResource> RetryNodes { get; set; }

		public List<BackupResource> ChildResourceNodes { get; set; }

		public Action<string, int, long, long> ItemRestoreProgressCallback { get; set; }

		public Action<string> ItemStartRestoreCallback { get; set; }

		public Action<string, string, BackupRestoreResult> ItemFinishRestoreCallback { get; set; }

		protected CancellationTokenSource CancelSource { get; set; }

		protected CancellationTokenSource AbortSource { get; set; }

		public RestoreWorkerAbstractEx(TcpAndroidDevice device, IBackupResourceReader backupResourceReader, string resourceType, int requestServiceCode, string remoteDir)
		{
			RestoreWorkerAbstractEx restoreWorkerAbstractEx = this;
			Device = device;
			mRemoteDir = remoteDir;
			WorkerId = resourceType;
			ResourceType = resourceType;
			mRequestServiceCode = requestServiceCode;
			BackupResourceReader = backupResourceReader;
			ChildResourceNodes = new List<BackupResource>();
			CancelSource = new CancellationTokenSource();
			AbortSource = new CancellationTokenSource();
			(from n in backupResourceReader.GetChildResources(null)
				where n.Tag.Equals(resourceType)
				select n).ToList().ForEach(delegate(BackupResource n)
			{
				List<BackupResource> childResources = restoreWorkerAbstractEx.BackupResourceReader.GetChildResources(n);
				if (childResources != null && childResources.Count > 0)
				{
					restoreWorkerAbstractEx.ChildResourceNodes.AddRange(childResources);
				}
			});
		}

		public void UpdateDevice(TcpAndroidDevice dev)
		{
			Device = dev;
		}

		public int GetRestoreCount()
		{
			List<BackupResource> retryNodes = RetryNodes;
			return ((retryNodes != null && retryNodes.Count > 0) ? RetryNodes : ChildResourceNodes).Count;
		}

		public virtual void DoProcess(object state)
		{
			//IL_00f5: Unknown result type (might be due to invalid IL or missing references)
			//IL_0100: Expected O, but got Unknown
			if (Device == null)
			{
				return;
			}
			List<BackupResource> retryNodes = RetryNodes;
			List<BackupResource> list = ((retryNodes != null && retryNodes.Count > 0) ? RetryNodes : ChildResourceNodes);
			AppDataInporter<BackupResource> obj = new AppDataInporter<BackupResource>(mRequestServiceCode, list);
			obj.CloseStreamAfterSend = true;
			obj.TaskContext = TaskContext;
			obj.ItemProgressCallback = delegate(BackupResource rs, int rl, long rt, long tl)
			{
				ItemRestoreProgressCallback?.Invoke(CreateResourceName(rs.Value), rl, rt, tl);
			};
			obj.ResourceItemStartImportCallback = delegate(BackupResource rs)
			{
				ItemStartRestoreCallback?.Invoke(rs.Value);
			};
			obj.ResourceItemFinishImportCallback = delegate(BackupResource rs, BackupRestoreResult isSuccess)
			{
				//IL_0020: Unknown result type (might be due to invalid IL or missing references)
				//IL_0026: Unknown result type (might be due to invalid IL or missing references)
				//IL_0029: Unknown result type (might be due to invalid IL or missing references)
				//IL_002b: Invalid comparison between Unknown and I4
				//IL_002d: Unknown result type (might be due to invalid IL or missing references)
				//IL_002f: Invalid comparison between Unknown and I4
				//IL_0042: Unknown result type (might be due to invalid IL or missing references)
				ItemFinishRestoreCallback?.Invoke(rs.Id.ToString(), rs.Value, isSuccess);
				if ((int)isSuccess != 0 && (int)isSuccess != 2 && (int)isSuccess != 3)
				{
					LogHelper.LogInstance.Info($"restore file {rs.Value} {isSuccess}!", false);
				}
			};
			obj.DataPathConverter = (BackupResource rs) => Path.Combine(RemoteDir, rs.Value);
			obj.CreateDataReadStream = (BackupResource rs, string convertedPath) => (Stream)BackupResourceReader.Seek(rs);
			obj.HeaderOperate = delegate(BackupResource res, Header header)
			{
				if (res.Attributes == null || res.Attributes.Count == 0)
				{
					return;
				}
				foreach (KeyValuePair<string, string> attribute in res.Attributes)
				{
					header.AddOrReplace(attribute.Key, attribute.Value);
				}
			};
			bool flag = mRequestServiceCode == 23 || mRequestServiceCode == 21 || mRequestServiceCode == 22;
			obj.Import(Device, new Header(), flag);
		}

		protected virtual string CreateResourceName(string path)
		{
			return Path.GetFileName(path);
		}

		public virtual void Cancel()
		{
			CancelSource?.Cancel();
		}

		public void Abort()
		{
			AbortSource?.Cancel();
		}

		protected virtual void CheckCancel()
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			if (TaskContext != null && !TaskContext.IsCancelCommandRequested)
			{
				return;
			}
			throw new CacnelException("operator canceled");
		}

		public void Dispose()
		{
			if (CancelSource != null)
			{
				CancelSource.Dispose();
				CancelSource = null;
			}
			if (AbortSource != null)
			{
				AbortSource.Dispose();
				AbortSource = null;
			}
		}
	}
	public class SmsRestoreWorkerEx(TcpAndroidDevice device, IBackupResourceReader backupResourceReader, string resourceType, int requestServiceCode, string requestMethodName) : RestoreWorkerAbstractEx(device, backupResourceReader, resourceType, requestServiceCode, requestMethodName)
	{
		private DeviceSmsManagement _mgt = new DeviceSmsManagement();

		public override void DoProcess(object state)
		{
			if (base.Device != null)
			{
				CheckCancel();
				_mgt.DoProcessWithChangeSMSDefault(base.Device, delegate
				{
					base.DoProcess(state);
				});
			}
		}

		protected override string CreateResourceName(string path)
		{
			return string.Empty;
		}
	}
	[Serializable]
	public class SMS : NotifyBase
	{
		public const int SMS_TYPE_RECEIVE = 0;

		public const int SMS_TYPE_SEND = 1;

		[JsonIgnore]
		private bool _isSelected;

		private ReplayCommand _deleteSmsCommand;

		private string __id = string.Empty;

		private string _address;

		private string _body;

		private string _date = string.Empty;

		[JsonIgnore]
		private long _timestamp;

		private string _persion = string.Empty;

		private string _type = string.Empty;

		private string _sim = string.Empty;

		[JsonIgnore]
		public bool isSelected
		{
			get
			{
				return _isSelected;
			}
			set
			{
				_isSelected = value;
				((NotifyBase)this).OnPropertyChanged("isSelected");
			}
		}

		[JsonIgnore]
		public ReplayCommand ForwardSmsCommand { get; set; }

		[JsonIgnore]
		public ReplayCommand DeleteSmsCommand
		{
			get
			{
				return _deleteSmsCommand;
			}
			set
			{
				if (_deleteSmsCommand != value)
				{
					_deleteSmsCommand = value;
					((NotifyBase)this).OnPropertyChanged("DeleteSmsCommand");
				}
			}
		}

		[JsonIgnore]
		public ReplayCommand CopySmsCommand { get; set; }

		public string _id
		{
			get
			{
				return __id;
			}
			set
			{
				__id = value;
			}
		}

		public string address
		{
			get
			{
				return _address;
			}
			set
			{
				_address = value;
				((NotifyBase)this).OnPropertyChanged("address");
			}
		}

		public string body
		{
			get
			{
				return _body;
			}
			set
			{
				_body = value;
				((NotifyBase)this).OnPropertyChanged("body");
			}
		}

		public string date
		{
			get
			{
				return _date;
			}
			set
			{
				_date = value;
				((NotifyBase)this).OnPropertyChanged("date");
			}
		}

		[JsonIgnore]
		public long timestamp
		{
			get
			{
				if (_timestamp != 0L)
				{
					return _timestamp;
				}
				long.TryParse(date, out _timestamp);
				return _timestamp;
			}
		}

		public string person
		{
			get
			{
				return _persion;
			}
			set
			{
				_persion = value;
			}
		}

		public string type
		{
			get
			{
				return _type;
			}
			set
			{
				_type = value;
			}
		}

		public string sim
		{
			get
			{
				return _sim;
			}
			set
			{
				_sim = value;
			}
		}

		[JsonIgnore]
		public int OrderBySequence { get; set; }

		public SMS()
		{
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Expected O, but got Unknown
			CopySmsCommand = new ReplayCommand((Action<object>)CopySmsCommandHandler);
		}

		private void CopySmsCommandHandler(object parameter)
		{
			try
			{
				Clipboard.SetDataObject((object)body);
			}
			catch
			{
			}
		}
	}
	[RestoreStorageInfo("{89D4DB68-4258-4002-8557-E65959C558B3}", "{9A7CEC3B-8DE0-439D-B3CF-5DAD3691C605}")]
	public class SmsRestoreWorkerExV2(TcpAndroidDevice device, IBackupResourceReader backupResourceReader, string resourceType, int requestServiceCode, string requestMethodName) : RestoreWorkerAbstractEx(device, backupResourceReader, resourceType, requestServiceCode, requestMethodName)
	{
		private DeviceSmsManagement _mgt = new DeviceSmsManagement();

		public override void DoProcess(object state)
		{
			if (base.Device != null)
			{
				CheckCancel();
				_mgt.DoProcessWithChangeSMSDefault(base.Device, delegate
				{
					PrivateDoProcess(state);
				});
			}
		}

		private void PrivateDoProcess(object state)
		{
			//IL_0161: Unknown result type (might be due to invalid IL or missing references)
			//IL_016c: Expected O, but got Unknown
			//IL_0091: Unknown result type (might be due to invalid IL or missing references)
			//IL_0097: Invalid comparison between Unknown and I4
			List<SMS> list = new List<SMS>();
			TcpAndroidDevice device = base.Device;
			int num = 10240;
			byte[] array = new byte[num];
			int num2 = 0;
			foreach (BackupResource childResourceNode in base.ChildResourceNodes)
			{
				if (childResourceNode.AssociatedStreamSize == 0L)
				{
					continue;
				}
				if (num < childResourceNode.AssociatedStreamSize)
				{
					array = new byte[childResourceNode.AssociatedStreamSize];
				}
				IBackupResourceStreamReader backupResourceStreamReader = base.BackupResourceReader.Seek(childResourceNode);
				int num3 = 0;
				do
				{
					num2 = backupResourceStreamReader.Read(array, num3, num);
					num3 += num2;
					if ((int)((DeviceEx)device).PhysicalStatus != 2 && base.TaskContext.IsCancelCommandRequested)
					{
						return;
					}
				}
				while (num2 != 0);
				string text = Encoding.UTF8.GetString(array, 0, num3);
				list.AddRange(JsonConvert.DeserializeObject<List<SMS>>(text));
			}
			AppDataInporter<SMS> obj = new AppDataInporter<SMS>(base.RequestServiceCode, list)
			{
				CloseStreamAfterSend = false,
				TaskContext = base.TaskContext,
				ResourceItemStartImportCallback = delegate(SMS rs)
				{
					base.ItemStartRestoreCallback?.Invoke(rs._id);
				},
				ResourceItemFinishImportCallback = delegate(SMS rs, BackupRestoreResult isSuccess)
				{
					//IL_001b: Unknown result type (might be due to invalid IL or missing references)
					base.ItemFinishRestoreCallback?.Invoke(rs._id, string.Empty, isSuccess);
				},
				ItemProgressCallback = delegate(SMS rs, int rl, long rt, long tl)
				{
					base.ItemRestoreProgressCallback?.Invoke(string.Empty, rl, rt, tl);
				}
			};
			MemoryStream memoryStream = new MemoryStream();
			obj.CreateDataReadStream = delegate(SMS rs, string convertedPath)
			{
				string s = JsonConvert.SerializeObject((object)rs);
				byte[] bytes = Encoding.UTF8.GetBytes(s);
				int num4 = bytes.Length;
				memoryStream.Seek(0L, SeekOrigin.Begin);
				memoryStream.Write(bytes, 0, num4);
				memoryStream.SetLength(num4);
				memoryStream.Seek(0L, SeekOrigin.Begin);
				return memoryStream;
			};
			obj.Import(base.Device, new Header(), false);
		}

		protected override string CreateResourceName(string path)
		{
			return string.Empty;
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.Business.ExceptionDefine
{
	public class AbortException : BackupRestoreException
	{
		public AbortException(string message)
			: base(message)
		{
		}

		public AbortException(string message, Exception innerException)
			: base(message, innerException)
		{
		}
	}
	public class BackupRestoreException : Exception
	{
		public BackupRestoreException(string message)
			: base(message)
		{
		}

		public BackupRestoreException(string message, Exception innerException)
			: base(message, innerException)
		{
		}
	}
	public class CanNotReadException : Exception
	{
		public CanNotReadException(string message)
			: base(message)
		{
		}

		public CanNotReadException(string message, Exception innerException)
			: base(message, innerException)
		{
		}
	}
	public class CanNotWriteException : Exception
	{
		public CanNotWriteException(string message)
			: base(message)
		{
		}

		public CanNotWriteException(string message, Exception innerException)
			: base(message, innerException)
		{
		}
	}
	public class TimeoutException : Exception
	{
		public TimeoutException(string exception)
			: base(exception)
		{
		}
	}
}
namespace lenovo.mbg.service.lmsa.backuprestore.Business.Backup
{
	public class BackupWorkerAbstractEx : IWorker, IDisposable
	{
		protected IBackupResourceWriter BackupResourceWriter { get; set; }

		public IAsyncTaskContext TaskContext { get; set; }

		public string ResourceType { get; private set; }

		protected TcpAndroidDevice Device { get; set; }

		public bool GetPathByIdWhenPathIsEmpty { get; protected set; }

		public virtual string WorkerId { get; set; }

		public virtual int WorkerSequence { get; set; }

		public int ResourcesCount { get; protected set; }

		public int RemoteServiceCode { get; protected set; }

		public List<int> FailedIdList { get; private set; }

		public Dictionary<string, long> IdAndSizeList { get; protected set; }

		public Action<string> ItemStartBackupCallback { get; set; }

		public Action<string, string, BackupRestoreResult> ItemFinishBackupCallback { get; set; }

		public Action<string, int, long, long> ItemBackupProgressCallback { get; set; }

		public BackupWorkerAbstractEx(TcpAndroidDevice device, IBackupResourceWriter backupResourceWriter, string resourceType, Dictionary<string, long> idAndSizeMapping, int remoteServiceCode)
		{
			Device = device;
			BackupResourceWriter = backupResourceWriter;
			ResourceType = resourceType;
			IdAndSizeList = idAndSizeMapping;
			ResourcesCount = idAndSizeMapping.Count;
			RemoteServiceCode = remoteServiceCode;
			FailedIdList = new List<int>();
		}

		public virtual void DoProcess(object state)
		{
			//IL_018b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0195: Expected O, but got Unknown
			//IL_01ae: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b8: Expected O, but got Unknown
			//IL_00e1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e7: Invalid comparison between Unknown and I4
			//IL_00fb: Unknown result type (might be due to invalid IL or missing references)
			//IL_0101: Invalid comparison between Unknown and I4
			//IL_02a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a9: Invalid comparison between Unknown and I4
			//IL_0351: Unknown result type (might be due to invalid IL or missing references)
			//IL_0357: Invalid comparison between Unknown and I4
			//IL_036b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0371: Invalid comparison between Unknown and I4
			GetPathByIdWhenPathIsEmpty = true;
			if (Device == null)
			{
				LogHelper.LogInstance.Info("The device has been disconnected during backup", false);
				return;
			}
			BackupResource rootResource = new BackupResource();
			rootResource.Tag = ResourceType;
			rootResource.Value = ResourcesCount.ToString();
			rootResource.ParentId = 0;
			rootResource.AssociatedStreamSize = 0L;
			try
			{
				BackupResourceWriter.Write(rootResource);
			}
			catch
			{
				foreach (KeyValuePair<string, long> idAndSize in IdAndSizeList)
				{
					Action<string, string, BackupRestoreResult> itemFinishBackupCallback = ItemFinishBackupCallback;
					if (itemFinishBackupCallback == null)
					{
						continue;
					}
					string key = idAndSize.Key;
					string arg = $"{idAndSize.Value}";
					TcpAndroidDevice device = Device;
					int num;
					if (device == null || (int)((DeviceEx)device).ConnectType != 4)
					{
						TcpAndroidDevice device2 = Device;
						if (device2 == null || (int)((DeviceEx)device2).PhysicalStatus != 2)
						{
							num = 3;
							goto IL_010c;
						}
					}
					num = 2;
					goto IL_010c;
					IL_010c:
					itemFinishBackupCallback(key, arg, (BackupRestoreResult)num);
				}
				return;
			}
			List<string> value = IdAndSizeList.Keys.Select((string n) => n).ToList();
			if (state != null && state is Dictionary<string, List<string>>)
			{
				(state as Dictionary<string, List<string>>).TryGetValue(ResourceType, out value);
			}
			AppDataExporter exporter = new AppDataExporter(RemoteServiceCode, value);
			exporter.TaskContext = TaskContext;
			IBackupResourceStreamWriter currentWriter = null;
			HugeMemoryStream encryptMs = new HugeMemoryStream();
			BackupResource currentResource = null;
			string currentResourcePath = string.Empty;
			string currentResourceName = string.Empty;
			bool canRemoveEndResources = false;
			exporter.OnNotifyUnExportRes = ItemFinishBackupCallback;
			exporter.ResourceItemStartExportCallback = delegate(string id)
			{
				canRemoveEndResources = false;
				currentResourcePath = string.Empty;
				ItemStartBackupCallback?.Invoke(id);
			};
			exporter.ResourceItemReceivePrepare = delegate(string id, Header header)
			{
				BackupResource backupResource = (currentResource = CreateResourceHeader(rootResource, id, header));
				currentResourcePath = backupResource.Value;
				BackupResourceWriter.Write(backupResource);
				canRemoveEndResources = true;
				currentWriter = BackupResourceWriter.Seek(backupResource);
				currentWriter.BeginWrite();
				currentResourceName = CreateResourceName(id, currentResourcePath);
				return true;
			};
			exporter.ReadStreamCallback = delegate(byte[] bytes, int rl, long rt, long tl)
			{
				if (rl > 0)
				{
					((Stream)(object)encryptMs).Write(bytes, 0, rl);
				}
				ItemBackupProgressCallback?.Invoke(currentResourceName, rl, rt, tl);
			};
			exporter.ResourceItemFinishExportCallback = delegate(string id, bool isSuccess, ErrorCode errorCode)
			{
				//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
				//IL_00f7: Expected O, but got Unknown
				if (!isSuccess)
				{
					if (GetPathByIdWhenPathIsEmpty && string.IsNullOrEmpty(currentResourcePath))
					{
						AppDataExporter obj2 = exporter;
						DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
						currentResourcePath = obj2.GetPathById((TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null), id);
					}
					if (canRemoveEndResources)
					{
						BackupResourceWriter.RemoveEnd();
					}
					if (int.TryParse(id, out var result))
					{
						FailedIdList.Add(result);
					}
					LogHelper.LogInstance.Info("backup id was not in a correct format: " + id + "\t" + currentResourcePath, false);
				}
				else
				{
					((Stream)(object)encryptMs).Position = 0L;
					int num6 = 0;
					byte[] buffer = new byte[1024];
					do
					{
						num6 = ((Stream)(object)encryptMs).Read(buffer, 0, 1024);
						currentWriter.Write(buffer, 0, num6, ((Stream)(object)encryptMs).Length);
					}
					while (num6 > 0);
					currentWriter.EndWrite();
				}
				encryptMs = new HugeMemoryStream();
				if (isSuccess)
				{
					ItemFinishBackupCallback?.Invoke(id, currentResourcePath, (BackupRestoreResult)0);
				}
				else
				{
					ItemFinishBackupCallback?.Invoke(id, currentResourcePath, (BackupRestoreResult)1);
				}
				currentResourcePath = string.Empty;
			};
			if (HostProxy.deviceManager.MasterDevice == null)
			{
				foreach (KeyValuePair<string, long> idAndSize2 in IdAndSizeList)
				{
					Action<string, string, BackupRestoreResult> itemFinishBackupCallback2 = ItemFinishBackupCallback;
					if (itemFinishBackupCallback2 != null)
					{
						string key2 = idAndSize2.Key;
						string arg2 = $"{idAndSize2.Value}";
						TcpAndroidDevice device3 = Device;
						itemFinishBackupCallback2(key2, arg2, (BackupRestoreResult)((device3 == null || (int)((DeviceEx)device3).ConnectType != 4) ? 3 : 2));
					}
				}
				return;
			}
			bool flag = RemoteServiceCode == 23 || RemoteServiceCode == 21 || RemoteServiceCode == 22;
			int num2 = exporter.Export(Device, (Header)null, flag);
			int num3 = ResourcesCount - num2;
			for (int num4 = 0; num4 < num3; num4++)
			{
				ItemStartBackupCallback?.Invoke(string.Empty);
				Action<string, string, BackupRestoreResult> itemFinishBackupCallback3 = ItemFinishBackupCallback;
				if (itemFinishBackupCallback3 == null)
				{
					continue;
				}
				string empty = string.Empty;
				TcpAndroidDevice device4 = Device;
				int num5;
				if (device4 == null || (int)((DeviceEx)device4).ConnectType != 4)
				{
					TcpAndroidDevice device5 = Device;
					if (device5 == null || (int)((DeviceEx)device5).PhysicalStatus != 2)
					{
						num5 = 3;
						goto IL_037c;
					}
				}
				num5 = 2;
				goto IL_037c;
				IL_037c:
				itemFinishBackupCallback3(empty, "Missing", (BackupRestoreResult)num5);
			}
		}

		protected virtual string CreateResourceName(string id, string path)
		{
			return Path.GetFileName(path);
		}

		protected virtual BackupResource CreateResourceHeader(BackupResource parent, string id, Header header)
		{
			BackupResource backupResource = new BackupResource();
			backupResource.ParentId = parent.Id;
			backupResource.Value = header.GetString("FileFullName", (string)null);
			backupResource.Tag = "file";
			backupResource.AssociatedStreamSize = header.GetInt64("StreamLength", 0L);
			if (header.ContainsKey("CreateDateTime"))
			{
				backupResource.AddAttribute("CreateDateTime", header.GetString("CreateDateTime", (string)null));
			}
			if (header.ContainsKey("LastModifyDateTime"))
			{
				backupResource.AddAttribute("LastModifyDateTime", header.GetString("LastModifyDateTime", (string)null));
			}
			return backupResource;
		}

		public void Dispose()
		{
		}

		public void Cancel()
		{
		}

		public void Abort()
		{
		}
	}
	public class DBDataBackupWorker : BackupWorkerAbstractEx
	{
		public DBDataBackupWorker(TcpAndroidDevice device, IBackupResourceWriter backupResourceWriter, string resourceType, Dictionary<string, long> idAndSizeMapping, int remoteServiceCode)
			: base(device, backupResourceWriter, resourceType, idAndSizeMapping, remoteServiceCode)
		{
			base.GetPathByIdWhenPathIsEmpty = false;
		}

		protected override BackupResource CreateResourceHeader(BackupResource parent, string id, Header header)
		{
			return new BackupResource
			{
				ParentId = parent.Id,
				Value = "1",
				Tag = "file",
				AssociatedStreamSize = header.GetInt64("StreamLength", 0L)
			};
		}

		protected override string CreateResourceName(string id, string path)
		{
			return string.Empty;
		}
	}
	public class DeviceBackupMgt
	{
		private static ConcurrentDictionary<string, int> resourceCountMapping = new ConcurrentDictionary<string, int>();

		private DeviceBusinessCommon deviceBusinessCommon = new DeviceBusinessCommon();

		public ConcurrentDictionary<string, int> GetResourceCountMapping()
		{
			deviceBusinessCommon.GetConcatCount(out var contactCnt, out var callLogCnt);
			resourceCountMapping["{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}"] = contactCnt + callLogCnt;
			resourceCountMapping["{89D4DB68-4258-4002-8557-E65959C558B3}"] = callLogCnt;
			resourceCountMapping["{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}"] = deviceBusinessCommon.GetSmsCount();
			resourceCountMapping["{773D71F7-CE8A-42D7-BE58-5F875DF58C16}"] = deviceBusinessCommon.GetPicCount();
			resourceCountMapping["{242C8F16-6AC7-431B-BBF1-AE24373860F1}"] = deviceBusinessCommon.GetMusicCount();
			resourceCountMapping["{8BEBE14B-4E45-4D36-8726-8442E6242C01}"] = deviceBusinessCommon.GetVideoCount();
			return resourceCountMapping;
		}

		public async Task AddOrUpdateBackup(BackupDescription desc)
		{
			await AddOrUpdateBackup(new List<BackupDescription> { desc });
		}

		public async Task<List<BackupDescription>> AddOrUpdateBackup(List<BackupDescription> descriptions)
		{
			string phoneBackupCacheDir = Configurations.PhoneBackupCacheDir;
			FileInfo fileInfo = new FileInfo(Path.Combine(phoneBackupCacheDir, "backupStorage.db.temp"));
			bool flag = true;
			try
			{
				List<BackupDescription> backupList = GetBackupList();
				foreach (BackupDescription item in descriptions)
				{
					if (backupList.Exists((BackupDescription n) => n.Id == item.Id))
					{
						MessageWindowHelper.Instance.Show("K0711", "K0610", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
						descriptions.Clear();
						flag = false;
						return descriptions;
					}
					backupList.Add(item);
				}
				using (IBackupStorage backupStorage = new BackupStorage(fileInfo))
				{
					backupStorage.Delete();
					IBackupResourceWriter backupResourceWriter = backupStorage.OpenWrite("{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}");
					backupResourceWriter.BeginWrite();
					foreach (BackupDescription item2 in backupList)
					{
						BackupResource backupResource = new BackupResource();
						backupResource.ParentId = 0;
						backupResource.Value = JsonUtils.Stringify((object)item2);
						backupResourceWriter.Write(backupResource);
					}
					backupResourceWriter.EndWrite();
				}
				return descriptions;
			}
			finally
			{
				if (flag)
				{
					string text = Path.Combine(phoneBackupCacheDir, "backupStorage.db");
					new FileInfo(text).Delete();
					fileInfo.MoveTo(text);
				}
			}
		}

		public List<BackupDescription> GetBackupList()
		{
			List<BackupDescription> list = new List<BackupDescription>();
			FileInfo fileInfo = new FileInfo(Path.Combine(Configurations.PhoneBackupCacheDir, "backupStorage.db"));
			if (!fileInfo.Exists)
			{
				return list;
			}
			List<BackupDescription> list2 = new List<BackupDescription>();
			List<BackupDescription> list3 = new List<BackupDescription>();
			string version = string.Empty;
			try
			{
				using IBackupStorage backupStorage = new BackupStorage(fileInfo);
				IBackupResourceReader backupResourceReader = backupStorage.OpenRead(out version);
				backupResourceReader.IsSetPassword();
				List<BackupResource> childResources = backupResourceReader.GetChildResources(null);
				JsonHelper.SerializeObject2Json((object)childResources);
				if (childResources == null)
				{
					return list;
				}
				foreach (BackupResource item in childResources)
				{
					BackupDescription backupDescription = JsonUtils.Parse<BackupDescription>(item.Value);
					list2.Add(backupDescription);
					if (CheckValidity(backupDescription))
					{
						list.Add(backupDescription);
					}
					else
					{
						list3.Add(backupDescription);
					}
				}
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Read file[" + fileInfo.FullName + "] throw exception:" + ex, false);
			}
			if (list3.Count > 0)
			{
				DeleteBackupFile(list3, list2);
			}
			return list;
		}

		public async Task<List<BackupDescription>> ImportBackupFile(string stroagePath)
		{
			List<BackupDescription> importStorageList = new List<BackupDescription>();
			string version = string.Empty;
			FileInfo fileInfo = new FileInfo(stroagePath);
			IBackupStorage storage = new BackupStorage(fileInfo);
			IBackupResourceReader reader = storage.OpenRead(out version);
			if (reader.IsSetPassword())
			{
				EnterPasswordViewModel dataContext = new EnterPasswordViewModel((string p) => reader.CheckPassword(p));
				EnterPasswordWindow enterPasswordWindow = new EnterPasswordWindow();
				((FrameworkElement)enterPasswordWindow).DataContext = dataContext;
				EnterPasswordWindow enterPasswordWindow2 = enterPasswordWindow;
				if (await MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)enterPasswordWindow2, (bool?)true) == false)
				{
					reader.Dispose();
					storage.Dispose();
					return importStorageList;
				}
			}
			BackupDescription backupDescription = JsonUtils.Parse<BackupDescription>(((reader.GetChildResources(null) ?? throw new BackupRestoreException("Storage root resource is null")).FirstOrDefault((BackupResource m) => m.Tag.Equals("{AF7750C4-A38C-400F-9A9C-5C3DAC0CA829}")) ?? throw new BackupRestoreException("Can not found description resource int storage:" + stroagePath)).Value);
			backupDescription.StorageSize = fileInfo.Length;
			backupDescription.StoragePath = stroagePath;
			importStorageList.Add(backupDescription);
			reader.Dispose();
			storage.Dispose();
			return AddOrUpdateBackup(importStorageList).Result;
		}

		public void DeleteBackupFile(BackupDescription delete)
		{
			DeleteBackupFile(new List<BackupDescription> { delete });
		}

		public void DeleteBackupFile(List<BackupDescription> deletes, List<BackupDescription> storedBackupList = null)
		{
			string phoneBackupCacheDir = Configurations.PhoneBackupCacheDir;
			FileInfo fileInfo = null;
			string fileName = Path.Combine(phoneBackupCacheDir, "backupStorage.db.temp");
			try
			{
				fileInfo = new FileInfo(fileName);
				if (storedBackupList == null)
				{
					storedBackupList = GetBackupList();
				}
				for (int num = deletes.Count - 1; num >= 0; num--)
				{
					string id = deletes[num].Id;
					for (int num2 = storedBackupList.Count - 1; num2 >= 0; num2--)
					{
						if (id.Equals(storedBackupList[num2].Id))
						{
							storedBackupList.RemoveAt(num2);
						}
					}
				}
				using (IBackupStorage backupStorage = new BackupStorage(fileInfo))
				{
					backupStorage.Delete();
					IBackupResourceWriter backupResourceWriter = backupStorage.OpenWrite("{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}");
					backupResourceWriter.BeginWrite();
					foreach (BackupDescription storedBackup in storedBackupList)
					{
						BackupResource backupResource = new BackupResource();
						backupResource.ParentId = 0;
						backupResource.Value = JsonUtils.Stringify((object)storedBackup);
						backupResourceWriter.Write(backupResource);
					}
					backupResourceWriter.EndWrite();
				}
				string text = Path.Combine(phoneBackupCacheDir, "backupStorage.db");
				File.Delete(text);
				if (fileInfo.Exists)
				{
					fileInfo.MoveTo(text);
				}
				deletes.ForEach(delegate(BackupDescription n)
				{
					if (!string.IsNullOrEmpty(n.StoragePath) && File.Exists(n.StoragePath))
					{
						try
						{
							File.Delete(n.StoragePath);
						}
						catch
						{
						}
					}
				});
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Delete backup file and record failed, ex:" + ex, false);
				try
				{
					fileInfo.Delete();
				}
				catch (Exception)
				{
				}
			}
		}

		private bool CheckValidity(BackupDescription source)
		{
			try
			{
				if (!File.Exists(source.StoragePath))
				{
					return false;
				}
				FileInfo fileInfo = new FileInfo(source.StoragePath);
				if (source.StorageSize != fileInfo.Length)
				{
					return false;
				}
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}
	}
	public static class Equality<T>
	{
		private class CommonEqualityComparer<V> : IEqualityComparer<T>
		{
			private Func<T, V> keySelector;

			private IEqualityComparer<V> comparer;

			public CommonEqualityComparer(Func<T, V> keySelector, IEqualityComparer<V> comparer)
			{
				this.keySelector = keySelector;
				this.comparer = comparer;
			}

			public CommonEqualityComparer(Func<T, V> keySelector)
				: this(keySelector, (IEqualityComparer<V>)EqualityComparer<V>.Default)
			{
			}

			public bool Equals(T x, T y)
			{
				return comparer.Equals(keySelector(x), keySelector(y));
			}

			public int GetHashCode(T obj)
			{
				return comparer.GetHashCode(keySelector(obj));
			}
		}

		public static IEqualityComparer<T> CreateComparer<V>(Func<T, V> keySelector)
		{
			return new CommonEqualityComparer<V>(keySelector);
		}

		public static IEqualityComparer<T> CreateComparer<V>(Func<T, V> keySelector, IEqualityComparer<V> comparer)
		{
			return new CommonEqualityComparer<V>(keySelector, comparer);
		}
	}
	public class DeviceBackupWorkerEx : IDisposable
	{
		private IBackupStorage _storage;

		private IBackupResourceWriter _backupResourceWriter;

		protected IAsyncTaskContext _Context;

		private TcpAndroidDevice device;

		private List<IWorker> _workerList;

		private IWorker _currentWorker;

		private long locker;

		protected volatile bool isReserveDiskSpace;

		private Action<IWorker> _currentWorkerHanler;

		private IBackupResourceWriter backupResourceWriter
		{
			get
			{
				return _backupResourceWriter;
			}
			set
			{
				if (_backupResourceWriter == null)
				{
					_backupResourceWriter = value;
				}
			}
		}

		public Action<string, string> ResourceItemStartBackupCallback { get; set; }

		public Action<string, int> ResourceTypeStartBackupCallback { get; set; }

		public Action<string, int, int> ResourceTypeFinishBackupCallback { get; set; }

		public Action<string, string, string, BackupRestoreResult> ResourceItemFinishBackupCallback { get; set; }

		public Action<string, string, int, long, long> ResourceItemBackupProgressCallback { get; set; }

		public Action<Dictionary<string, List<string>>> RetryCallback { get; set; }

		private BackupResource BackupDescription { get; set; }

		private bool writerIsOpen { get; set; }

		public DeviceBackupWorkerEx(TcpAndroidDevice device, IAsyncTaskContext context, FileInfo storageFile, BackupDescription description)
		{
			this.device = device;
			_Context = context;
			_storage = new BackupStorage(storageFile);
			SetDescription(description);
			_workerList = new List<IWorker>();
			RetryCallback = FireRetryCallback;
		}

		public void Cancel()
		{
			_currentWorker?.Cancel();
		}

		public void Abort()
		{
			_currentWorker?.Abort();
		}

		public void Dispose()
		{
			_currentWorker = null;
			if (writerIsOpen)
			{
				writerIsOpen = false;
				backupResourceWriter.EndWrite();
			}
			foreach (IWorker item in _workerList.ToList())
			{
				item.Dispose();
			}
			if (_storage != null)
			{
				_storage.Dispose();
			}
			_backupResourceWriter?.Dispose();
			_backupResourceWriter = null;
		}

		protected void FireRetryCallback(Dictionary<string, List<string>> retryResources)
		{
			try
			{
				if (Interlocked.Read(in locker) != 0L)
				{
					return;
				}
				Interlocked.Exchange(ref locker, 1L);
				Dictionary<string, Dictionary<string, long>> dictionary = new Dictionary<string, Dictionary<string, long>>();
				if (retryResources == null || _workerList == null)
				{
					return;
				}
				foreach (KeyValuePair<string, List<string>> item in retryResources)
				{
					if (_workerList.FirstOrDefault((IWorker p) => (p as BackupWorkerAbstractEx).ResourceType == item.Key) is BackupWorkerAbstractEx backupWorkerAbstractEx)
					{
						dictionary[item.Key] = backupWorkerAbstractEx.IdAndSizeList.Where((KeyValuePair<string, long> m) => item.Value.Contains(m.Key)).ToDictionary((KeyValuePair<string, long> m) => m.Key, (KeyValuePair<string, long> v) => v.Value);
					}
				}
				PrepareWorker(dictionary, null);
				retryResources.Clear();
				DoProcess(null);
			}
			finally
			{
				Interlocked.Exchange(ref locker, 0L);
			}
		}

		public void PrepareWorker(Dictionary<string, Dictionary<string, long>> resourcesResource, string password)
		{
			_workerList.Clear();
			if (backupResourceWriter == null)
			{
				backupResourceWriter = _storage.OpenWrite("{71E53A7C-495F-447A-B3DD-E70AC2FBA48F}");
			}
			if (!isReserveDiskSpace)
			{
				try
				{
					ReserveDiskSpace(resourcesResource);
					isReserveDiskSpace = true;
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("Reserve disk space failed:" + ex, false);
					try
					{
						_storage?.Dispose();
						_storage?.Delete();
					}
					catch (Exception)
					{
					}
					throw;
				}
			}
			if (!string.IsNullOrWhiteSpace(password))
			{
				backupResourceWriter.SetPassword(password);
			}
			int num = 0;
			foreach (KeyValuePair<string, Dictionary<string, long>> item in resourcesResource)
			{
				BackupWorkerAbstractEx backupWorkerAbstractEx = null;
				switch (item.Key)
				{
				case "{773D71F7-CE8A-42D7-BE58-5F875DF58C16}":
					backupWorkerAbstractEx = new BackupWorkerAbstractEx(device, backupResourceWriter, item.Key, item.Value, 17);
					break;
				case "{242C8F16-6AC7-431B-BBF1-AE24373860F1}":
					backupWorkerAbstractEx = new BackupWorkerAbstractEx(device, backupResourceWriter, item.Key, item.Value, 19);
					break;
				case "{8BEBE14B-4E45-4D36-8726-8442E6242C01}":
					backupWorkerAbstractEx = new BackupWorkerAbstractEx(device, backupResourceWriter, item.Key, item.Value, 20);
					break;
				case "{580C48C8-6CEF-4BBB-AF37-D880B349D142}":
					backupWorkerAbstractEx = new BackupWorkerAbstractEx(device, backupResourceWriter, item.Key, item.Value, 25);
					break;
				case "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}":
					backupWorkerAbstractEx = new DBDataBackupWorker(device, backupResourceWriter, item.Key, item.Value, 23);
					break;
				case "{C6E1253A-3ED6-41EF-B37B-454EA43CF0A4}":
					backupWorkerAbstractEx = new DBDataBackupWorker(device, backupResourceWriter, item.Key, item.Value, 21);
					break;
				case "{89D4DB68-4258-4002-8557-E65959C558B3}":
					backupWorkerAbstractEx = new DBDataBackupWorker(device, backupResourceWriter, item.Key, item.Value, 22);
					break;
				}
				backupWorkerAbstractEx.WorkerSequence = num++;
				backupWorkerAbstractEx.TaskContext = _Context;
				_workerList.Add(backupWorkerAbstractEx);
			}
		}

		private void ReserveDiskSpace(Dictionary<string, Dictionary<string, long>> resourcesResource)
		{
			long plaintextByteLength = resourcesResource.Sum((KeyValuePair<string, Dictionary<string, long>> m) => m.Value.Sum((KeyValuePair<string, long> n) => n.Value));
			int num = resourcesResource.Sum((KeyValuePair<string, Dictionary<string, long>> m) => m.Value.Count);
			_ = resourcesResource.FirstOrDefault((KeyValuePair<string, Dictionary<string, long>> m) => "{5A60E6A0-35DE-4EA5-926E-96C15B54DDF6}".Equals(m.Key)).Value;
			long encryptByteLength = AES.GetEncryptByteLength(plaintextByteLength, partBlockForPlaintext: true);
			long encryptByteLength2 = AES.GetEncryptByteLength(6036 * num, partBlockForPlaintext: true);
			int num2 = 104857600;
			long num3 = encryptByteLength + encryptByteLength2 + 97 + num2;
			LogHelper.LogInstance.Info("Reserve disk space:" + GlobalFun.ConvertLong2String(num3, "F1", true), false);
			backupResourceWriter.ReserveDiskSpace(num, num3);
		}

		public void DoProcess(object state)
		{
			if (!writerIsOpen)
			{
				_workerList.Sum((IWorker m) => ((BackupWorkerAbstractEx)m).IdAndSizeList.Count);
				backupResourceWriter.BeginWrite();
				writerIsOpen = true;
			}
			backupResourceWriter.Write(BackupDescription);
			foreach (IWorker worker in _workerList)
			{
				BackupWorkerAbstractEx w = (BackupWorkerAbstractEx)worker;
				ResourceTypeStartBackupCallback?.Invoke(w.ResourceType, w.ResourcesCount);
				_currentWorker = worker;
				if (ResourceItemStartBackupCallback != null)
				{
					w.ItemStartBackupCallback = delegate(string path)
					{
						ResourceItemStartBackupCallback(w.ResourceType, path);
					};
				}
				if (ResourceItemFinishBackupCallback != null)
				{
					w.ItemFinishBackupCallback = delegate(string id, string path, BackupRestoreResult isSuccess)
					{
						//IL_0018: Unknown result type (might be due to invalid IL or missing references)
						ResourceItemFinishBackupCallback(w.ResourceType, id, path, isSuccess);
					};
				}
				if (ResourceItemBackupProgressCallback != null)
				{
					w.ItemBackupProgressCallback = delegate(string path, int rl, long rt, long len)
					{
						ResourceItemBackupProgressCallback(w.ResourceType, path, rl, rt, len);
					};
				}
				_currentWorkerHanler?.Invoke(_currentWorker);
				if (_Context.IsCancelCommandRequested)
				{
					LogHelper.LogInstance.Info("backup resource canceled", false);
					break;
				}
				worker.DoProcess(state);
			}
			_currentWorker = null;
		}

		private void SetDescription(BackupDescription description)
		{
			string value = JsonUtils.Stringify((object)description);
			BackupResource backupResource = new BackupResource();
			backupResource.ParentId = 0;
			backupResource.Value = value;
			backupResource.Tag = "{AF7750C4-A38C-400F-9A9C-5C3DAC0CA829}";
			backupResource.AssociatedStreamSize = 0L;
			BackupDescription = backupResource;
		}

		public void SetCurrentWorkerHandler(Action<IWorker> handler)
		{
			_currentWorkerHanler = handler;
		}
	}
}
