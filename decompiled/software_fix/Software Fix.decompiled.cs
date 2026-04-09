using System;
using System.CodeDom.Compiler;
using System.Collections;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Dynamic;
using System.Globalization;
using System.IO;
using System.IO.Pipes;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Sockets;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.ExceptionServices;
using System.Runtime.InteropServices;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Ipc;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Versioning;
using System.Security;
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
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Resources;
using System.Windows.Shapes;
using System.Windows.Threading;
using System.Xml;
using System.Xml.Serialization;
using GoogleAnalytics;
using GoogleAnalytics.WPF.Managed;
using Microsoft.Web.WebView2.Wpf;
using Microsoft.Win32;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SharpVectors;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.common.utilities;
using lenovo.mbg.service.common.webservices;
using lenovo.mbg.service.common.webservices.WebApiModel;
using lenovo.mbg.service.common.webservices.WebApiServices;
using lenovo.mbg.service.framework.devicemgt;
using lenovo.mbg.service.framework.download.DownloadControllerImpl;
using lenovo.mbg.service.framework.download.DownloadMode;
using lenovo.mbg.service.framework.download.DownloadUnity;
using lenovo.mbg.service.framework.hostcontroller;
using lenovo.mbg.service.framework.lang;
using lenovo.mbg.service.framework.pipes;
using lenovo.mbg.service.framework.services;
using lenovo.mbg.service.framework.services.Device;
using lenovo.mbg.service.framework.services.Download;
using lenovo.mbg.service.framework.services.Model;
using lenovo.mbg.service.framework.smartbase;
using lenovo.mbg.service.framework.socket;
using lenovo.mbg.service.framework.updateversion;
using lenovo.mbg.service.lmsa.Business;
using lenovo.mbg.service.lmsa.Business.Notice;
using lenovo.mbg.service.lmsa.Feedback.Business;
using lenovo.mbg.service.lmsa.Feedback.Converter;
using lenovo.mbg.service.lmsa.Feedback.Model;
using lenovo.mbg.service.lmsa.Feedback.View;
using lenovo.mbg.service.lmsa.Feedback.ViewModel;
using lenovo.mbg.service.lmsa.Language;
using lenovo.mbg.service.lmsa.LenovoId;
using lenovo.mbg.service.lmsa.Login.Business;
using lenovo.mbg.service.lmsa.Login.Model;
using lenovo.mbg.service.lmsa.Login.Protocol;
using lenovo.mbg.service.lmsa.Login.View;
using lenovo.mbg.service.lmsa.Login.ViewModel;
using lenovo.mbg.service.lmsa.Login.ViewModel.UserOperation;
using lenovo.mbg.service.lmsa.ModelV6;
using lenovo.mbg.service.lmsa.OperationGuide.DeletePersionData;
using lenovo.mbg.service.lmsa.OrderView;
using lenovo.mbg.service.lmsa.Permissions;
using lenovo.mbg.service.lmsa.Properties;
using lenovo.mbg.service.lmsa.ResourcesCleanUp;
using lenovo.mbg.service.lmsa.ResourcesCleanUp.Model;
using lenovo.mbg.service.lmsa.ResourcesCleanUp.View;
using lenovo.mbg.service.lmsa.ResourcesCleanUp.ViewModel;
using lenovo.mbg.service.lmsa.Services;
using lenovo.mbg.service.lmsa.UpdateVersion;
using lenovo.mbg.service.lmsa.UpdateVersion.Core;
using lenovo.mbg.service.lmsa.UpdateVersion.Model;
using lenovo.mbg.service.lmsa.UpdateVersion.Proxy;
using lenovo.mbg.service.lmsa.UpdateVersion.Tool;
using lenovo.mbg.service.lmsa.UserControls;
using lenovo.mbg.service.lmsa.ViewModel.SystemOperation;
using lenovo.mbg.service.lmsa.ViewModels;
using lenovo.mbg.service.lmsa.ViewModels.SystemOperation;
using lenovo.mbg.service.lmsa.ViewV6;
using lenovo.mbg.service.lmsa.common.Form.FormVerify;
using lenovo.mbg.service.lmsa.common.Form.ViewModel;
using lenovo.mbg.service.lmsa.hostproxy;
using lenovo.themes.generic;
using lenovo.themes.generic.AttachedProperty;
using lenovo.themes.generic.Controls;
using lenovo.themes.generic.Controls.Windows;
using lenovo.themes.generic.ControlsV6;
using lenovo.themes.generic.Dialog.Permissions;
using lenovo.themes.generic.ModelV6;
using lenovo.themes.generic.ViewModelV6;
using lenovo.themes.generic.ViewModels;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.DisableOptimizations | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints | DebuggableAttribute.DebuggingModes.EnableEditAndContinue)]
[assembly: DisableDpiAwareness]
[assembly: AssemblyTitle("lenovo.mbg.service.lmsa")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("Software Fix")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: InternalsVisibleTo("lenovo.mbg.service.common.utilities")]
[assembly: ComVisible(false)]
[assembly: ThemeInfo(/*Could not decode attribute arguments.*/)]
[assembly: AssemblyFileVersion("7.5.5.19")]
[assembly: AssemblyInformationalVersion("7.5.5.19 build-20260401.1539")]
[assembly: AssemblyAssociatedContentFile("webview2loader.dll")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("7.5.5.19")]
internal class Smart
{
	protected static IBase bases = Base.instance;

	public static IBase SmartBase => Base.instance;

	public static IFileDownload FileDownloadV6 => SmartBase.Load<IFileDownload>("lenovo.mbg.service.framework.resources.FileDownloadManagerV6");

	public static IDeviceOperator DeviceOperator => bases.LoadNew<IDeviceOperator>("lenovo.mbg.service.framework.devicemgt.AdbOperator");

	public static IDeviceOperator FastBootOperator => bases.LoadNew<IDeviceOperator>("lenovo.mbg.service.framework.devicemgt.FastbootOperator");

	public static IRsd Rsd => bases.Load<IRsd>("lenovo.mbg.service.framework.resources.Rsd");

	public static AbstractDeviceConnectionManagerEx DeviceManagerEx => bases.Load<AbstractDeviceConnectionManagerEx>("lenovo.mbg.service.framework.devicemgt.DeviceConnectionManagerEx");

	public static IHost Host => bases.Load<IHost>("lenovo.mbg.service.framework.hostcontroller.PluginViewOfHost");

	public static IHostNavigation HostNavigation => bases.Load<IHostNavigation>("Software Fix.hostnavgationservice");

	public static IResourcesLoggingService ResourcesLoggingService => bases.Load<IResourcesLoggingService>("Software Fix.ResourcesLoggingService");

	public static IConfigService ConfigService => bases.Load<IConfigService>("Software Fix.ConfigService");

	public static IHostOperationService HostOperationService => bases.Load<IHostOperationService>("Software Fix.HostOperationService");

	public static ILanguage LanguageService => bases.Load<ILanguage>("Software Fix.LanguageHelper");

	public static lenovo.mbg.service.framework.services.IPermission PermissionService => bases.Load<lenovo.mbg.service.framework.services.IPermission>("software fix.permissionservice");

	public static IGoogleAnalyticsTracker GoogleAnalyticsTracker => bases.Load<IGoogleAnalyticsTracker>("Software Fix.GoogleAnalyticsTracker");

	public static IViewContext ViewContext => bases.Load<IViewContext>("Software Fix.ViewContext");

	public static IUser User => bases.Load<IUser>("Software Fix.User");

	public static IGlobalCache GlobalCache => bases.Load<IGlobalCache>("software fix.globalcacheservice");

	public static IUserBehaviorService BehaviorService => bases.Load<IUserBehaviorService>("Software Fix.UserBehaviorService");
}
namespace XamlGeneratedNamespace
{
	[DebuggerNonUserCode]
	[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
	[EditorBrowsable(EditorBrowsableState.Never)]
	public sealed class GeneratedInternalTypeHelper : InternalTypeHelper
	{
		protected override object CreateInstance(Type type, CultureInfo culture)
		{
			return Activator.CreateInstance(type, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.CreateInstance, null, null, culture);
		}

		protected override object GetPropertyValue(PropertyInfo propertyInfo, object target, CultureInfo culture)
		{
			return propertyInfo.GetValue(target, BindingFlags.Default, null, null, culture);
		}

		protected override void SetPropertyValue(PropertyInfo propertyInfo, object target, object value, CultureInfo culture)
		{
			propertyInfo.SetValue(target, value, BindingFlags.Default, null, null, culture);
		}

		protected override Delegate CreateDelegate(Type delegateType, object target, string handler)
		{
			return (Delegate)target.GetType().InvokeMember("_CreateDelegate", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.InvokeMethod, null, target, new object[2] { delegateType, handler }, null);
		}

		protected override void AddEventHandler(EventInfo eventInfo, object target, Delegate handler)
		{
			eventInfo.AddEventHandler(target, handler);
		}
	}
}
namespace lenovo.mbg.service.lmsa
{
	public class ViewContext : IViewContext
	{
		protected static SortedList<string, ViewDescription> viewCache = new SortedList<string, ViewDescription>();

		public FrameworkElement SwitchView(ViewDescription view)
		{
			return SwitchView(view, null, reload: false);
		}

		public FrameworkElement SwitchView(ViewDescription view, object initilizeData)
		{
			return SwitchView(view, initilizeData, reload: false);
		}

		public FrameworkElement SwitchView(ViewDescription view, object initilizeData, bool reload, bool reloadData = false)
		{
			//IL_0068: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Expected O, but got Unknown
			string uIID = view.UIID;
			if (reload || !viewCache.ContainsKey(uIID))
			{
				if (reload && viewCache.ContainsKey(uIID))
				{
					lenovo.themes.generic.ViewModelV6.ViewModelBase viewModelBase = viewCache[uIID].ViewModel as lenovo.themes.generic.ViewModelV6.ViewModelBase;
					viewModelBase.Dispose();
				}
				view.View = (FrameworkElement)Activator.CreateInstance(view.ViewType);
				viewCache[uIID] = view;
				view.ViewModel = (IViewModelBase)Activator.CreateInstance(view.ViewModelType);
				view.View.DataContext = view.ViewModel;
			}
			ViewDescription viewDescription = viewCache[uIID];
			lenovo.themes.generic.ViewModelV6.ViewModelBase viewModelBase2 = viewDescription.ViewModel as lenovo.themes.generic.ViewModelV6.ViewModelBase;
			if (!viewModelBase2.DataIsLoaded || reloadData)
			{
				viewModelBase2.LoadData(initilizeData);
			}
			return viewDescription.View;
		}

		public TViewModel FindViewModel<TViewModel>(Type viewType, string uiid = null) where TViewModel : IViewModelBase
		{
			string key = viewType.FullName + uiid;
			if (viewCache.ContainsKey(key))
			{
				return (TViewModel)viewCache[key].ViewModel;
			}
			return default(TViewModel);
		}

		public FrameworkElement FindView(Type viewType, string uiid = null)
		{
			string key = viewType.FullName + uiid;
			if (viewCache.ContainsKey(key))
			{
				return viewCache[key].View;
			}
			return null;
		}

		public void UnActivateAsync(string viewKey)
		{
			Task.Factory.StartNew(delegate
			{
				foreach (KeyValuePair<string, ViewDescription> item in viewCache)
				{
					lenovo.themes.generic.ViewModelV6.ViewModelBase viewModelBase = item.Value.ViewModel as lenovo.themes.generic.ViewModelV6.ViewModelBase;
					if (item.Key == viewKey)
					{
						viewModelBase.Active(actived: true);
					}
					else
					{
						viewModelBase.UnActivate();
					}
				}
			});
		}

		public static void Reset()
		{
			viewCache.Clear();
		}
	}
	public class WindowWrapper : IWin32Window
	{
		public IntPtr Handle { get; }

		public WindowWrapper(IntPtr handle)
		{
			Handle = handle;
		}

		public WindowWrapper(Window window)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			Handle = new WindowInteropHelper(window).Handle;
		}
	}
	internal enum WM
	{
		NULL = 0,
		CREATE = 1,
		DESTROY = 2,
		MOVE = 3,
		SIZE = 5,
		ACTIVATE = 6,
		SETFOCUS = 7,
		KILLFOCUS = 8,
		ENABLE = 10,
		SETREDRAW = 11,
		SETTEXT = 12,
		GETTEXT = 13,
		GETTEXTLENGTH = 14,
		PAINT = 15,
		CLOSE = 16,
		QUERYENDSESSION = 17,
		QUIT = 18,
		QUERYOPEN = 19,
		ERASEBKGND = 20,
		SYSCOLORCHANGE = 21,
		SHOWWINDOW = 24,
		ACTIVATEAPP = 28,
		SETCURSOR = 32,
		MOUSEACTIVATE = 33,
		CHILDACTIVATE = 34,
		QUEUESYNC = 35,
		GETMINMAXINFO = 36,
		WINDOWPOSCHANGING = 70,
		WINDOWPOSCHANGED = 71,
		CONTEXTMENU = 123,
		STYLECHANGING = 124,
		STYLECHANGED = 125,
		DISPLAYCHANGE = 126,
		GETICON = 127,
		SETICON = 128,
		NCCREATE = 129,
		NCDESTROY = 130,
		NCCALCSIZE = 131,
		NCHITTEST = 132,
		NCPAINT = 133,
		NCACTIVATE = 134,
		GETDLGCODE = 135,
		SYNCPAINT = 136,
		NCMOUSEMOVE = 160,
		NCLBUTTONDOWN = 161,
		NCLBUTTONUP = 162,
		NCLBUTTONDBLCLK = 163,
		NCRBUTTONDOWN = 164,
		NCRBUTTONUP = 165,
		NCRBUTTONDBLCLK = 166,
		NCMBUTTONDOWN = 167,
		NCMBUTTONUP = 168,
		NCMBUTTONDBLCLK = 169,
		SYSKEYDOWN = 260,
		SYSKEYUP = 261,
		SYSCHAR = 262,
		SYSDEADCHAR = 263,
		COMMAND = 273,
		SYSCOMMAND = 274,
		MOUSEMOVE = 512,
		LBUTTONDOWN = 513,
		LBUTTONUP = 514,
		LBUTTONDBLCLK = 515,
		RBUTTONDOWN = 516,
		RBUTTONUP = 517,
		RBUTTONDBLCLK = 518,
		MBUTTONDOWN = 519,
		MBUTTONUP = 520,
		MBUTTONDBLCLK = 521,
		MOUSEWHEEL = 522,
		XBUTTONDOWN = 523,
		XBUTTONUP = 524,
		XBUTTONDBLCLK = 525,
		MOUSEHWHEEL = 526,
		CAPTURECHANGED = 533,
		ENTERSIZEMOVE = 561,
		EXITSIZEMOVE = 562,
		IME_SETCONTEXT = 641,
		IME_NOTIFY = 642,
		IME_CONTROL = 643,
		IME_COMPOSITIONFULL = 644,
		IME_SELECT = 645,
		IME_CHAR = 646,
		IME_REQUEST = 648,
		IME_KEYDOWN = 656,
		IME_KEYUP = 657,
		NCMOUSELEAVE = 674,
		DWMCOMPOSITIONCHANGED = 798,
		DWMNCRENDERINGCHANGED = 799,
		DWMCOLORIZATIONCOLORCHANGED = 800,
		DWMWINDOWMAXIMIZEDCHANGE = 801,
		DWMSENDICONICTHUMBNAIL = 803,
		DWMSENDICONICLIVEPREVIEWBITMAP = 806,
		USER = 1024,
		TRAYMOUSEMESSAGE = 2048,
		APP = 32768
	}
	[SuppressUnmanagedCodeSecurity]
	internal static class NativeMethods
	{
		public delegate IntPtr MessageHandler(WM uMsg, IntPtr wParam, IntPtr lParam, out bool handled);

		[DllImport("shell32.dll", CharSet = CharSet.Unicode, EntryPoint = "CommandLineToArgvW")]
		private static extern IntPtr _CommandLineToArgvW([MarshalAs(UnmanagedType.LPWStr)] string cmdLine, out int numArgs);

		[DllImport("kernel32.dll", EntryPoint = "LocalFree", SetLastError = true)]
		private static extern IntPtr _LocalFree(IntPtr hMem);

		public static string[] CommandLineToArgvW(string cmdLine)
		{
			IntPtr intPtr = IntPtr.Zero;
			try
			{
				int numArgs = 0;
				intPtr = _CommandLineToArgvW(cmdLine, out numArgs);
				if (intPtr == IntPtr.Zero)
				{
					throw new Win32Exception();
				}
				string[] array = new string[numArgs];
				for (int i = 0; i < numArgs; i++)
				{
					IntPtr ptr = Marshal.ReadIntPtr(intPtr, i * Marshal.SizeOf(typeof(IntPtr)));
					array[i] = Marshal.PtrToStringUni(ptr);
				}
				return array;
			}
			finally
			{
				IntPtr intPtr2 = _LocalFree(intPtr);
			}
		}
	}
	public interface ISingleInstanceApp
	{
		bool SignalExternalCommandLineArgs(IList<string> args);
	}
	public static class SingleInstance<TApplication> where TApplication : Application, ISingleInstanceApp
	{
		private class IPCRemoteService : MarshalByRefObject
		{
			public void InvokeFirstInstance(IList<string> args)
			{
				//IL_0021: Unknown result type (might be due to invalid IL or missing references)
				//IL_002c: Expected O, but got Unknown
				if (Application.Current != null)
				{
					((DispatcherObject)Application.Current).Dispatcher.BeginInvoke((DispatcherPriority)9, (Delegate)new DispatcherOperationCallback(SingleInstance<TApplication>.ActivateFirstInstanceCallback), (object)args);
				}
			}

			public override object InitializeLifetimeService()
			{
				return null;
			}
		}

		private const string Delimiter = ":";

		private const string ChannelNameSuffix = "SingeInstanceIPCChannel";

		private const string RemoteServiceName = "SingleInstanceApplicationService";

		private const string IpcProtocol = "ipc://";

		private static Mutex singleInstanceMutex;

		private static IpcServerChannel channel;

		private static IList<string> commandLineArgs;

		public static IList<string> CommandLineArgs => commandLineArgs;

		public static bool InitializeAsFirstInstance(string uniqueName)
		{
			try
			{
				commandLineArgs = GetCommandLineArgs(uniqueName);
				string text = uniqueName + Environment.UserName;
				string channelName = text + ":" + "SingeInstanceIPCChannel";
				RestartCheck(commandLineArgs);
				singleInstanceMutex = new Mutex(initiallyOwned: true, text, out var createdNew);
				if (createdNew)
				{
					CreateRemoteService(channelName);
				}
				else
				{
					SignalFirstInstance(channelName, commandLineArgs);
				}
				return createdNew;
			}
			catch (Exception)
			{
				return true;
			}
		}

		public static void Cleanup()
		{
			if (singleInstanceMutex != null)
			{
				singleInstanceMutex.Close();
				singleInstanceMutex = null;
			}
			if (channel != null)
			{
				ChannelServices.UnregisterChannel((IChannel)(object)channel);
				channel = null;
			}
		}

		private static IList<string> GetCommandLineArgs(string uniqueApplicationName)
		{
			string[] array = null;
			if (AppDomain.CurrentDomain.ActivationContext == null)
			{
				array = Environment.GetCommandLineArgs();
			}
			else
			{
				string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), uniqueApplicationName);
				string path2 = Path.Combine(path, "cmdline.txt");
				if (File.Exists(path2))
				{
					try
					{
						using (TextReader textReader = new StreamReader(path2, Encoding.Unicode))
						{
							array = NativeMethods.CommandLineToArgvW(textReader.ReadToEnd());
						}
						File.Delete(path2);
					}
					catch (IOException)
					{
					}
				}
			}
			if (array == null)
			{
				array = new string[0];
			}
			return new List<string>(array);
		}

		private static void RestartCheck(IList<string> commandLineArgs)
		{
			if (!commandLineArgs.Contains("restart") || commandLineArgs.Count != 3)
			{
				return;
			}
			int oldProcessId = -1;
			if (!int.TryParse(commandLineArgs[2], out oldProcessId))
			{
				return;
			}
			SpinWait.SpinUntil(delegate
			{
				try
				{
					Process processById = Process.GetProcessById(oldProcessId);
					return processById == null;
				}
				catch (Exception)
				{
					return true;
				}
			}, -1);
		}

		private static void CreateRemoteService(string channelName)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_004c: Expected O, but got Unknown
			BinaryServerFormatterSinkProvider val = new BinaryServerFormatterSinkProvider();
			val.TypeFilterLevel = TypeFilterLevel.Full;
			IDictionary dictionary = new Dictionary<string, string>();
			dictionary["name"] = channelName;
			dictionary["portName"] = channelName;
			dictionary["exclusiveAddressUse"] = "false";
			channel = new IpcServerChannel(dictionary, (IServerChannelSinkProvider)(object)val);
			ChannelServices.RegisterChannel((IChannel)(object)channel, true);
			IPCRemoteService iPCRemoteService = new IPCRemoteService();
			RemotingServices.Marshal((MarshalByRefObject)iPCRemoteService, "SingleInstanceApplicationService");
		}

		private static void SignalFirstInstance(string channelName, IList<string> args)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			IpcClientChannel val = new IpcClientChannel();
			ChannelServices.RegisterChannel((IChannel)(object)val, true);
			string text = "ipc://" + channelName + "/SingleInstanceApplicationService";
			((IPCRemoteService)RemotingServices.Connect(typeof(IPCRemoteService), text))?.InvokeFirstInstance(args);
		}

		private static object ActivateFirstInstanceCallback(object arg)
		{
			IList<string> args = arg as IList<string>;
			ActivateFirstInstance(args);
			return null;
		}

		private static void ActivateFirstInstance(IList<string> args)
		{
			if (Application.Current != null)
			{
				((TApplication)(object)Application.Current).SignalExternalCommandLineArgs(args);
			}
		}
	}
	public class AppContext
	{
		public static bool IsLogIn;

		private volatile bool isDisposing = false;

		public static AppContext Single { get; private set; }

		public static ApiService WebApi { get; private set; }

		public Dispatcher CurrentDispatcher { get; set; }

		public bool IsDisposing => isDisposing;

		private AppContext()
		{
			CurrentDispatcher = Dispatcher.CurrentDispatcher;
		}

		public static void Init()
		{
			Single = new AppContext();
			WebApi = new ApiService();
			LangTranslation.SetService(global::Smart.LanguageService);
			global::Smart.LanguageService.LoadCommLanguagePackage();
			Task.Run(delegate
			{
				Single.CheckMAVersion();
			});
		}

		private void CheckMAVersion()
		{
			try
			{
				var parameter = new
				{
					versionCode = 0
				};
				MAPackageVersion mAPackageVersion = WebApi.RequestContent<MAPackageVersion>(WebApiUrl.CHECK_MA_VERSION, parameter);
				if (string.IsNullOrEmpty(mAPackageVersion?.apkUrl))
				{
					return;
				}
				Configurations.QrCodeDownloadMaUrl = mAPackageVersion.apkUrl;
				if (Configurations.AppVersionCode >= mAPackageVersion?.versionCode)
				{
					return;
				}
				string _downloadFileName = Path.Combine(ApplcationClass.DownloadPath, "MaAppNew");
				LogHelper.LogInstance.Info("Begin download new MA url:[" + mAPackageVersion.apkUrl + "].");
				GlobalFun.TryDeleteFile(_downloadFileName);
				if (GlobalFun.GetStreamFormServer(mAPackageVersion.apkUrl, delegate(Stream stream)
				{
					using FileStream fileStream = new FileStream(_downloadFileName, FileMode.Create);
					stream.CopyTo(fileStream);
					fileStream.Flush();
				}))
				{
					LogHelper.LogInstance.Info("Begin check new MA Md5.");
					string md5Hash = GlobalFun.GetMd5Hash(_downloadFileName);
					if (mAPackageVersion.md5.ToUpper().Equals(md5Hash.ToUpper()))
					{
						LogHelper.LogInstance.Info($"Replace the new MA and record the new version code:[{mAPackageVersion.versionCode}].");
						string destFileName = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "apk", "lmsa.apk");
						for (int num = 0; num < 3; num++)
						{
							try
							{
								File.Copy(_downloadFileName, destFileName, overwrite: true);
								Configurations.AppVersionCode = mAPackageVersion.versionCode;
								break;
							}
							catch (Exception)
							{
								Thread.Sleep(3000);
							}
						}
					}
					else
					{
						LogHelper.LogInstance.Warn(string.Format("Check new MA Md5 failed! Local md5:[{0}], size:[{1}], server md5:[{2}], size:[{3}].", new object[4]
						{
							md5Hash,
							new FileInfo(_downloadFileName).Length,
							mAPackageVersion.md5,
							mAPackageVersion.size
						}));
					}
				}
				else
				{
					LogHelper.LogInstance.Warn("Download the new MA url:[" + mAPackageVersion.apkUrl + "] failed.");
				}
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"Download the new MA error. Exception:[{arg}].");
			}
		}

		public void Close()
		{
		}

		public void Dispose()
		{
		}

		public void Clear()
		{
			Dispose();
		}
	}
	public class MAPackageVersion
	{
		public string apkName { get; set; }

		public string apkVersion { get; set; }

		public string apkUrl { get; set; }

		public string md5 { get; set; }

		public long size { get; set; }

		public int versionCode { get; set; }
	}
	public class ClosingWindow : Window, IMessageWindowV6, IComponentConnector
	{
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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public ClosingWindow()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/closingwindow.xaml", UriKind.Relative);
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
	public class DownloadStatus2ImageConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && (lenovo.mbg.service.framework.services.Download.DownloadStatus)value == lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING)
			{
				return Application.Current.FindResource((object)"suspendDrawingImage");
			}
			return Application.Current.FindResource((object)"startDrawingImage");
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class DownloadStartButtonVisibilityControler : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return (object)(Visibility)1;
			}
			lenovo.mbg.service.framework.services.Download.DownloadStatus downloadStatus = (lenovo.mbg.service.framework.services.Download.DownloadStatus)value;
			if (lenovo.mbg.service.framework.services.Download.DownloadStatus.SUCCESS != downloadStatus && lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING != downloadStatus)
			{
				return (object)(Visibility)0;
			}
			return (object)(Visibility)1;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return value;
		}
	}
	public class DownloadPauseButtonVisibilityControler : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return (object)(Visibility)1;
			}
			lenovo.mbg.service.framework.services.Download.DownloadStatus downloadStatus = (lenovo.mbg.service.framework.services.Download.DownloadStatus)value;
			if (lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING == downloadStatus)
			{
				return (object)(Visibility)0;
			}
			return (object)(Visibility)1;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return value;
		}
	}
	public class DownloadDeleteButtonVisibilityControler : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return (object)(Visibility)1;
			}
			lenovo.mbg.service.framework.services.Download.DownloadStatus downloadStatus = (lenovo.mbg.service.framework.services.Download.DownloadStatus)value;
			if (lenovo.mbg.service.framework.services.Download.DownloadStatus.SUCCESS == downloadStatus)
			{
				return (object)(Visibility)0;
			}
			return (object)(Visibility)1;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return value;
		}
	}
	public class DownloadInfoNormalVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			Visibility val = (Visibility)0;
			if (value == null)
			{
				return val;
			}
			string value2 = value.ToString();
			if (!string.IsNullOrEmpty(value2))
			{
				val = (Visibility)2;
			}
			return val;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class DownloadInfoErrorVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			Visibility val = (Visibility)2;
			if (value == null)
			{
				return val;
			}
			string value2 = value.ToString();
			if (!string.IsNullOrEmpty(value2))
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
	public class RescueUnzipTextVisibleConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return (object)(Visibility)2;
			}
			if (lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPPING == (lenovo.mbg.service.framework.services.Download.DownloadStatus)value)
			{
				return (object)(Visibility)((!(parameter.ToString() == "1")) ? 2 : 0);
			}
			return (object)(Visibility)((parameter.ToString() == "1") ? 2 : 0);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class DownloadProgressValueConvert : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			double num = 0.0;
			if (values == null)
			{
				return num;
			}
			try
			{
				double result = 0.0;
				double result2 = 0.0;
				double.TryParse(values[0].ToString(), out result);
				double.TryParse(values[1].ToString(), out result2);
				num = result2 * 100.0 / result;
			}
			catch (Exception)
			{
			}
			return num;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class DownloadProgressForegroundConvert : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Expected O, but got Unknown
			return (object)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2"));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class DownloadNeedTimeContentConvert : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			string result = "--";
			if (values == null)
			{
				return result;
			}
			try
			{
				lenovo.mbg.service.framework.services.Download.DownloadStatus downloadStatus = (lenovo.mbg.service.framework.services.Download.DownloadStatus)values[0];
				if (downloadStatus == lenovo.mbg.service.framework.services.Download.DownloadStatus.MANUAL_PAUSE || downloadStatus == lenovo.mbg.service.framework.services.Download.DownloadStatus.AUTO_PAUSE)
				{
					return LangTranslation.Translate(values[2].ToString());
				}
				if (downloadStatus == lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPPING)
				{
					return null;
				}
				if (values[1] == null || string.IsNullOrEmpty(values[1].ToString()))
				{
					return result;
				}
				return values[1].ToString();
			}
			catch (Exception)
			{
				return result;
			}
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public enum DownloadItemStatus
	{
		NoStart,
		Pause,
		Downloading,
		Completed
	}
	public class DownloadControlViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private bool m_isDownloadedClick = false;

		private Visibility m_downloadPannelVisibility = (Visibility)2;

		private Visibility mDownloadingTaskPanelVisibility = (Visibility)0;

		private Visibility mDownloadedTaskPanelVisibility = (Visibility)2;

		private static DownloadControlViewModel _singleInstance;

		private DownloadButtonViewModel _downloadButtonViewModel = null;

		private Brush mDownloadingTabForegroundBrush = null;

		private Brush mDownloadingTabBackgroundBrush = null;

		private Brush mDownloadCompletedTabForegroundBrush = null;

		private Brush mDownloadCompletedTabBackgroundBrush = null;

		public ObservableCollection<DownloadInfo> _DownloadingTasks = new ObservableCollection<DownloadInfo>();

		public ObservableCollection<DownloadedInfo> _DownloadedTasks = new ObservableCollection<DownloadedInfo>();

		private object downloadInfoLock = new object();

		private string _DownloadSavePath = Configurations.DownloadPath;

		public bool isDownloadedClick
		{
			get
			{
				return m_isDownloadedClick;
			}
			set
			{
				m_isDownloadedClick = value;
				OnPropertyChanged("isDownloadedClick");
			}
		}

		public Visibility downloadPannelVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return m_downloadPannelVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				m_downloadPannelVisibility = value;
				OnPropertyChanged("downloadPannelVisibility");
			}
		}

		public Visibility DownloadingTaskPanelVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return mDownloadingTaskPanelVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (mDownloadingTaskPanelVisibility != value)
				{
					mDownloadingTaskPanelVisibility = value;
					OnPropertyChanged("DownloadingTaskPanelVisibility");
				}
			}
		}

		public Visibility DownloadedTaskPanelVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return mDownloadedTaskPanelVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (mDownloadedTaskPanelVisibility != value)
				{
					mDownloadedTaskPanelVisibility = value;
					OnPropertyChanged("DownloadedTaskPanelVisibility");
				}
			}
		}

		public ReplayCommand DownloadedItemClick { get; private set; }

		public ReplayCommand ViewButtonClickCommand { get; set; }

		public static DownloadControlViewModel SingleInstance
		{
			get
			{
				if (_singleInstance == null)
				{
					_singleInstance = new DownloadControlViewModel();
				}
				return _singleInstance;
			}
		}

		public DownloadButtonViewModel DownloadButtonViewModel
		{
			get
			{
				return _downloadButtonViewModel;
			}
			set
			{
				if (_downloadButtonViewModel != value)
				{
					_downloadButtonViewModel = value;
					OnPropertyChanged("DownloadButtonViewModel");
				}
			}
		}

		public ButtonViewModel CloseButtonViewModel { get; set; }

		public string DownloadLoationDirectory { get; set; }

		public ReplayCommand DownloadLoationClick { get; set; }

		public Brush DownloadingTabForegroundBrush
		{
			get
			{
				return mDownloadingTabForegroundBrush;
			}
			set
			{
				if (mDownloadingTabForegroundBrush != value)
				{
					mDownloadingTabForegroundBrush = value;
					OnPropertyChanged("DownloadingTabForegroundBrush");
				}
			}
		}

		public Brush DownloadingTabBackgroundBrush
		{
			get
			{
				return mDownloadingTabBackgroundBrush;
			}
			set
			{
				if (mDownloadingTabBackgroundBrush != value)
				{
					mDownloadingTabBackgroundBrush = value;
					OnPropertyChanged("DownloadingTabBackgroundBrush");
				}
			}
		}

		public Brush DownloadCompletedTabForegroundBrush
		{
			get
			{
				return mDownloadCompletedTabForegroundBrush;
			}
			set
			{
				if (mDownloadCompletedTabForegroundBrush != value)
				{
					mDownloadCompletedTabForegroundBrush = value;
					OnPropertyChanged("DownloadCompletedTabForegroundBrush");
				}
			}
		}

		public Brush DownloadCompletedTabBackgroundBrush
		{
			get
			{
				return mDownloadCompletedTabBackgroundBrush;
			}
			set
			{
				if (mDownloadCompletedTabBackgroundBrush != value)
				{
					mDownloadCompletedTabBackgroundBrush = value;
					OnPropertyChanged("DownloadCompletedTabBackgroundBrush");
				}
			}
		}

		public DownloadedTaskModel SelectedDownloadedItem { get; set; }

		public ReplayCommand DownloadClick { get; set; }

		public ReplayCommand DeleteDownloadingTask { get; set; }

		public ButtonViewModel ModifyStoragePathButtonViewModel { get; set; }

		public ButtonViewModel OpenStoragePathViewModel { get; set; }

		public ObservableCollection<DownloadInfo> DownloadingTasks
		{
			get
			{
				return _DownloadingTasks;
			}
			set
			{
				_DownloadingTasks = value;
				OnPropertyChanged("DownloadingTasks");
			}
		}

		public ObservableCollection<DownloadedInfo> DownloadedTasks
		{
			get
			{
				return _DownloadedTasks;
			}
			set
			{
				_DownloadedTasks = value;
				OnPropertyChanged("DownloadedTasks");
			}
		}

		public string DownloadSavePath
		{
			get
			{
				return Configurations.DownloadPath;
			}
			set
			{
				Configurations.DownloadPath = value;
				OnPropertyChanged("DownloadSavePath");
			}
		}

		private DownloadControlViewModel()
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			DownloadedItemClick = new ReplayCommand(DownloadedItemClickHandler);
			ViewButtonClickCommand = new ReplayCommand(ViewButtonClickCommandHandler);
			DownloadClick = new ReplayCommand(DownloadClickHandler);
			DeleteDownloadingTask = new ReplayCommand(DeleteDownloadingClickHandler);
			GlobalCmdHelper.Instance.OnDelRomAfterRescue = delegate(string fileName)
			{
				GlobalDeletedCallback(new List<string> { fileName });
			};
			GlobalCmdHelper.Instance.OnDelRomAfterRescueRetry = delegate(List<string> fileArr)
			{
				GlobalDeletedCallback(fileArr);
			};
		}

		public void Show()
		{
			downloadPannelVisibility = (Visibility)0;
			isDownloadedClick = false;
		}

		private void DownloadedItemClickHandler(object aparams)
		{
			DownloadedInfo data = aparams as DownloadedInfo;
			List<Dictionary<string, string>> list = JsonHelper.DeserializeJson2ListFromFile<Dictionary<string, string>>(Configurations.DownloadedMatchPath);
			if (list != null && list.Count > 0)
			{
				Dictionary<string, string> dictionary = list.FirstOrDefault((Dictionary<string, string> n) => n["FileUrl"] == data.FileUrl);
				if (dictionary != null)
				{
					ApplcationClass.ApplcationStartWindow.ShowDownloadCenter(isShow: false);
					MainWindowViewModel.SingleInstance.GotoPluginById("8ab04aa975e34f1ca4f9dc3a81374e2c", dictionary);
				}
			}
		}

		private void CloseButtonClickCommandHandler(object parameter)
		{
			if (UserService.Single.CurrentLoggedInUser == null)
			{
				((Popup)ApplcationClass.NonTopmostPopup).IsOpen = true;
			}
			else if (UserService.Single.CurrentLoggedInUser != null && !string.IsNullOrEmpty(UserService.Single.CurrentLoggedInUser.UserId))
			{
				((Popup)ApplcationClass.NonTopmostPopup).IsOpen = true;
			}
		}

		private void HeadLineInitialize()
		{
			DownloadLoationClick = new ReplayCommand(DownloadLoationClickHandler);
		}

		private void DownloadLoationClickHandler(object parameter)
		{
			GlobalFun.OpenFileExplorer(Configurations.DownloadPath);
		}

		public void DeleteInvalidDownloaded()
		{
			Task.Run(delegate
			{
				if (DownloadedTasks != null && DownloadedTasks.Count > 0)
				{
					List<DownloadedInfo> list = new List<DownloadedInfo>();
					foreach (DownloadedInfo downloadedTask in DownloadedTasks)
					{
						if (!GlobalFun.Exists(Path.Combine(downloadedTask.downloadInfo.LocalPath, Path.GetFileNameWithoutExtension(downloadedTask.downloadInfo.FileName))) && !GlobalFun.Exists(Path.Combine(downloadedTask.downloadInfo.LocalPath, downloadedTask.downloadInfo.FileName)))
						{
							list.Add(downloadedTask);
						}
					}
					if (list.Count > 0)
					{
						FireDeleteDownloaded(list, needDelete: false);
					}
				}
			});
		}

		public void Load(DownloadInfo downloadInfo)
		{
			if (downloadInfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.WAITTING || downloadInfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.MANUAL_PAUSE || downloadInfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING)
			{
				AddDownloadingTask(downloadInfo);
			}
			else if (downloadInfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.SUCCESS || downloadInfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPSUCCESS || downloadInfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.ALREADYEXISTS)
			{
				RemoveDownloadingTask(downloadInfo);
				AddDownloadedTask(downloadInfo, insertFirst: true);
			}
		}

		public void AddDownloadingTask(DownloadInfo downloadInfo)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				lock (downloadInfoLock)
				{
					DownloadInfo downloadInfo2 = DownloadingTasks.FirstOrDefault((DownloadInfo n) => n.FileUrl == downloadInfo.FileUrl);
					if (downloadInfo2 == null)
					{
						DownloadingTasks.Insert(0, downloadInfo);
					}
				}
			});
		}

		public void RemoveDownloadingTask(DownloadInfo downloadInfo)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				lock (downloadInfoLock)
				{
					DownloadInfo downloadInfo2 = DownloadingTasks.FirstOrDefault((DownloadInfo n) => n.FileUrl == downloadInfo.FileUrl);
					if (downloadInfo2 != null)
					{
						DownloadingTasks.RemoveAt(DownloadingTasks.IndexOf(downloadInfo2));
					}
				}
			});
		}

		public void AddDownloadedTask(DownloadInfo downloadInfo, bool insertFirst)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				lock (downloadInfoLock)
				{
					DownloadedInfo downloadedInfo = DownloadedTasks.FirstOrDefault((DownloadedInfo n) => n.FileUrl == downloadInfo.FileUrl);
					if (downloadedInfo == null)
					{
						if (insertFirst)
						{
							DownloadedTasks.Add(Convert(downloadInfo));
						}
						else
						{
							DownloadedTasks.Insert(0, Convert(downloadInfo));
						}
					}
				}
			});
		}

		public void RemoveDownloadedTask(DownloadedInfo data)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				lock (downloadInfoLock)
				{
					DownloadedInfo downloadedInfo = DownloadedTasks.FirstOrDefault((DownloadedInfo n) => n.FileUrl == data.FileUrl);
					if (downloadedInfo != null)
					{
						DownloadedTasks.Remove(downloadedInfo);
					}
				}
			});
		}

		private DownloadedInfo Convert(DownloadInfo data)
		{
			DownloadedInfo downloadedInfo = null;
			try
			{
				downloadedInfo = new DownloadedInfo(data)
				{
					FileUrl = data.FileUrl
				};
				List<DownloadedInfo> list = JsonHelper.DeserializeJson2ListFromFile<DownloadedInfo>(Configurations.DownloadedMatchPath);
				if (list != null && list.Count > 0)
				{
					DownloadedInfo downloadedInfo2 = list.FirstOrDefault((DownloadedInfo n) => n.FileUrl == data.FileUrl);
					if (downloadedInfo2 != null)
					{
						downloadedInfo.marketName = downloadedInfo2.marketName;
						downloadedInfo.modelName = downloadedInfo2.modelName;
						downloadedInfo.hwCode = downloadedInfo2.hwCode;
						downloadedInfo.simCount = downloadedInfo2.simCount;
						downloadedInfo.country = downloadedInfo2.country;
						downloadedInfo.downloadInfo.IsManualMatch = !HostProxy.User.user.IsB2BSupportMultDev;
					}
					else
					{
						downloadedInfo.downloadInfo.IsManualMatch = false;
					}
				}
				else
				{
					downloadedInfo.downloadInfo.IsManualMatch = false;
				}
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Info("AddDownloadedTask Convert Error :" + ex.Message);
			}
			return downloadedInfo;
		}

		private void DownloadClickHandler(object parameter)
		{
			DownloadInfo downloadInfo = parameter as DownloadInfo;
			if (downloadInfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING)
			{
				LogHelper.LogInstance.Info("====>>Click try to stop downloading!");
				DownloadInfo downloadInfo2 = parameter as DownloadInfo;
				global::Smart.FileDownloadV6.Stop(downloadInfo2.FileUrl);
				return;
			}
			LogHelper.LogInstance.Info("====>>Click try to restart downloading!");
			if (global::Smart.FileDownloadV6.DownloadingCount >= 5)
			{
				MessageWindowHelper.Instance.Show("K0071", "K0321", "K0327", null, showClose: false, (MessageBoxImage)48, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
			}
			else
			{
				global::Smart.FileDownloadV6.ReStart(downloadInfo.FileUrl);
			}
		}

		private void DeleteDownloadingClickHandler(object parameter)
		{
			Task.Run(delegate
			{
				if (MessageWindowHelper.Instance.Show(null, "K0319", "K0571", "K0570", showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true).Result == true)
				{
					if (parameter is DownloadInfo downloadInfo)
					{
						RemoveDownloadingTask(downloadInfo);
						global::Smart.FileDownloadV6.Delete(downloadInfo.FileUrl);
					}
					else
					{
						DownloadedInfo item = parameter as DownloadedInfo;
						FireDeleteDownloaded(new List<DownloadedInfo> { item });
					}
				}
			});
		}

		private void GlobalDeletedCallback(List<string> files)
		{
			List<DownloadedInfo> list = DownloadedTasks.Where((DownloadedInfo p) => files.Contains(p.downloadInfo.OriginalFileName)).ToList();
			FireDeleteDownloaded(list);
		}

		private void FireDeleteDownloaded(List<DownloadedInfo> list, bool needDelete = true)
		{
			List<string> list2 = new List<string>();
			foreach (DownloadedInfo item in list)
			{
				RemoveDownloadedTask(item);
				if (needDelete)
				{
					global::Smart.FileDownloadV6.Delete(item.downloadInfo.FileUrl);
				}
				list2.Add(item.downloadInfo.FileUrl);
			}
			if (list2.Count > 0)
			{
				UpdateDownloadedMatch(list2);
			}
		}

		private void UpdateDownloadedMatch(List<string> urls)
		{
			List<Dictionary<string, string>> list = JsonHelper.DeserializeJson2ListFromFile<Dictionary<string, string>>(Configurations.DownloadedMatchPath);
			if (list == null || list.Count <= 0)
			{
				return;
			}
			foreach (string url in urls)
			{
				Dictionary<string, string> dictionary = list.FirstOrDefault((Dictionary<string, string> n) => n["FileUrl"] == url);
				if (dictionary != null)
				{
					list.Remove(dictionary);
				}
			}
			JsonHelper.SerializeObject2File(Configurations.DownloadedMatchPath, list);
		}

		public async void ModifyButtonDownloadPath()
		{
			WindowWrapper _onwerWindow = new WindowWrapper(Application.Current.MainWindow);
			FolderBrowserDialog fbd = new FolderBrowserDialog();
			while (true)
			{
				fbd.SelectedPath = DownloadSavePath;
				fbd.RootFolder = Environment.SpecialFolder.MyComputer;
				if ((int)((CommonDialog)fbd).ShowDialog((IWin32Window)(object)_onwerWindow) != 1)
				{
					break;
				}
				if (fbd.SelectedPath.Length > 50)
				{
					await MessageWindowHelper.Instance.Show(null, "K1856", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
					continue;
				}
				if (!Regex.IsMatch(fbd.SelectedPath, "\\s+"))
				{
					DownloadSavePath = fbd.SelectedPath;
					break;
				}
				await MessageWindowHelper.Instance.Show(null, "K2038", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
			}
		}

		private void ViewButtonClickCommandHandler(object parameter)
		{
			GlobalFun.OpenFileExplorer(DownloadSavePath);
		}
	}
	public class DownloadedInfo : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private const string initData = "-";

		private string m_marketName = "-";

		private string m_modelName = "-";

		private string m_hwCode = "-";

		private string m_country = "-";

		private string m_simCount = "-";

		private string m_Memory = "-";

		private DownloadInfo m_downloadInfo;

		public string marketName
		{
			get
			{
				return m_marketName;
			}
			set
			{
				if (!string.IsNullOrEmpty(value))
				{
					m_marketName = value;
				}
			}
		}

		public string modelName
		{
			get
			{
				return m_modelName;
			}
			set
			{
				if (!string.IsNullOrEmpty(value))
				{
					m_modelName = value;
				}
			}
		}

		public string hwCode
		{
			get
			{
				return m_hwCode;
			}
			set
			{
				if (!string.IsNullOrEmpty(value))
				{
					m_hwCode = value;
				}
			}
		}

		public string country
		{
			get
			{
				return m_country;
			}
			set
			{
				if (!string.IsNullOrEmpty(value))
				{
					m_country = value;
				}
			}
		}

		public string simCount
		{
			get
			{
				return m_simCount;
			}
			set
			{
				if (!string.IsNullOrEmpty(value))
				{
					m_simCount = value;
				}
			}
		}

		public string Memory
		{
			get
			{
				return m_Memory;
			}
			set
			{
				if (!string.IsNullOrEmpty(value))
				{
					m_Memory = value;
				}
			}
		}

		public string FileUrl { get; set; }

		public string DevDetailInfo
		{
			get
			{
				string text = string.Empty;
				if (!string.IsNullOrEmpty(marketName) && marketName != "-")
				{
					text = text + HostProxy.LanguageService.Translate("K0723") + " " + marketName + "\n";
				}
				if (!string.IsNullOrEmpty(modelName) && modelName != "-")
				{
					text = text + HostProxy.LanguageService.Translate("K0455") + " " + modelName + "\n";
				}
				if (!string.IsNullOrEmpty(hwCode) && hwCode != "-")
				{
					text = text + HostProxy.LanguageService.Translate("K1125") + " " + hwCode + "\n";
				}
				if (!string.IsNullOrEmpty(simCount) && simCount != "-")
				{
					text = text + HostProxy.LanguageService.Translate("K1127") + " " + simCount + "\n";
				}
				if (!string.IsNullOrEmpty(country) && country != "-")
				{
					text = text + HostProxy.LanguageService.Translate("K1126") + " " + country + "\n";
				}
				if (!string.IsNullOrEmpty(Memory) && Memory != "-")
				{
					text = text + HostProxy.LanguageService.Translate("K1128") + " " + Memory + "\n";
				}
				return text.Trim(new char[1] { '\n' });
			}
		}

		[JsonIgnore]
		public DownloadInfo downloadInfo
		{
			get
			{
				return m_downloadInfo;
			}
			set
			{
				m_downloadInfo = value;
				OnPropertyChanged("downloadInfo");
			}
		}

		public DownloadedInfo(DownloadInfo downloadInfo)
		{
			this.downloadInfo = downloadInfo;
		}
	}
	public class DownloadedTaskModel
	{
		public string FileName { get; set; }

		public long TotalSize { get; set; }

		public DownloadItemStatus DownloadItemStatus { get; set; }

		public DownloadedTaskModel Self => this;
	}
	public class HostBindingProxy : Freezable
	{
		public static readonly DependencyProperty DataProperty = DependencyProperty.Register("Data", typeof(object), typeof(HostBindingProxy), (PropertyMetadata)new UIPropertyMetadata((PropertyChangedCallback)null));

		public object Data
		{
			get
			{
				return ((DependencyObject)this).GetValue(DataProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(DataProperty, value);
			}
		}

		protected override Freezable CreateInstanceCore()
		{
			return (Freezable)(object)new HostBindingProxy();
		}
	}
	public class HostNavgationService : IHostNavigation
	{
		public string CurrentPluginID { get; set; }

		public object CurrentPage { get; set; }

		public void SwitchTo(string pluginID)
		{
			MainWindowViewModel.SingleInstance.GotoPluginById(pluginID);
		}

		public void SwitchTo(string pluginID, object data)
		{
			MainWindowViewModel.SingleInstance.GotoPluginById(pluginID, data);
		}

		public void SwithStyle(string styleId)
		{
		}
	}
	public class DeviceConnectionControlPanelDataModel : ModelBase
	{
		private bool mIsConnected = false;

		private string mConnectingDeviceDiplayName = string.Empty;

		private ConnectingWays mConnectingWay = ConnectingWays.USB;

		public bool IsConnected
		{
			get
			{
				return mIsConnected;
			}
			set
			{
				if (mIsConnected != value)
				{
					mIsConnected = value;
					FirePropertyChangedEvent("IsConnected");
				}
			}
		}

		public string ConnectingDeviceDiplayName
		{
			get
			{
				return mConnectingDeviceDiplayName;
			}
			set
			{
				if (!(mConnectingDeviceDiplayName == value))
				{
					mConnectingDeviceDiplayName = value;
					FirePropertyChangedEvent("ConnectingDeviceDiplayName");
				}
			}
		}

		public ConnectingWays ConnectingWay
		{
			get
			{
				return mConnectingWay;
			}
			set
			{
				if (mConnectingWay != value)
				{
					mConnectingWay = value;
					FirePropertyChangedEvent("ConnectingWay");
				}
			}
		}
	}
	public enum ConnectingWays
	{
		USB,
		WIFI
	}
	public class MainViewDataModel
	{
		public ObservableCollection<NavigationItemDataModel> NagivationItems { get; set; }

		public string CurrentVersion { get; set; }
	}
	public class ModelBase : INotifyPropertyChanged
	{
		public event PropertyChangedEventHandler PropertyChanged;

		protected void FirePropertyChangedEvent(string propertyName)
		{
			if (this.PropertyChanged != null)
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	public class NavigationItemCollection
	{
		private ObservableCollection<NavigationItemDataModel> nagivationItems = new ObservableCollection<NavigationItemDataModel>();

		public ObservableCollection<NavigationItemDataModel> NagivationItems => nagivationItems;
	}
	public class NavigationItemDataModel
	{
		public string UseCase { get; set; }

		public string ItemText { get; set; }

		public string ItemImageSource { get; set; }

		public bool Tag { get; set; }
	}
	public class HostOperationService : IHostOperationService
	{
		private ConcurrentDictionary<string, Window> _Cache = new ConcurrentDictionary<string, Window>();

		public void CloseMaskLayer(string uid)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				Window value = null;
				_Cache.TryRemove(uid, out value);
				if (value != null)
				{
					value.Hide();
					value.Close();
					value = null;
				}
			});
		}

		public IntPtr ShowMaskLayer(string uid, WindowState state = (WindowState)0)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			IntPtr handler = IntPtr.Zero;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				//IL_001a: Unknown result type (might be due to invalid IL or missing references)
				//IL_001f: Unknown result type (might be due to invalid IL or missing references)
				//IL_0038: Unknown result type (might be due to invalid IL or missing references)
				//IL_0040: Unknown result type (might be due to invalid IL or missing references)
				//IL_0051: Unknown result type (might be due to invalid IL or missing references)
				//IL_0059: Unknown result type (might be due to invalid IL or missing references)
				//IL_0061: Unknown result type (might be due to invalid IL or missing references)
				//IL_0069: Unknown result type (might be due to invalid IL or missing references)
				//IL_0074: Unknown result type (might be due to invalid IL or missing references)
				//IL_0079: Unknown result type (might be due to invalid IL or missing references)
				//IL_0083: Expected O, but got Unknown
				//IL_0084: Unknown result type (might be due to invalid IL or missing references)
				//IL_0094: Unknown result type (might be due to invalid IL or missing references)
				//IL_009c: Unknown result type (might be due to invalid IL or missing references)
				//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
				//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
				//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
				//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
				//IL_00c6: Unknown result type (might be due to invalid IL or missing references)
				//IL_00d5: Unknown result type (might be due to invalid IL or missing references)
				//IL_00e4: Unknown result type (might be due to invalid IL or missing references)
				//IL_00f3: Unknown result type (might be due to invalid IL or missing references)
				//IL_0107: Expected O, but got Unknown
				//IL_0191: Unknown result type (might be due to invalid IL or missing references)
				Window mainWindow = Application.Current.MainWindow;
				Rectangle position = HardwareHelper.GetPosition(mainWindow);
				Window mask = new Window
				{
					Uid = Guid.NewGuid().ToString("N"),
					ResizeMode = (ResizeMode)2,
					Owner = Application.Current.MainWindow,
					WindowStyle = (WindowStyle)0,
					ShowInTaskbar = false,
					AllowsTransparency = true,
					Background = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FC000000")),
					Opacity = 0.3,
					Focusable = false,
					IsEnabled = false,
					WindowState = state,
					BorderThickness = new Thickness(0.0),
					Left = position.Left,
					Top = position.Top,
					Width = position.Width,
					Height = position.Height
				};
				((UIElement)mask).Focusable = false;
				((UIElement)mask).IsHitTestVisible = false;
				((UIElement)mask).IsEnabled = false;
				if (_Cache.Count == 0)
				{
					mask.Closing += delegate
					{
						Window owner = mask.Owner;
						if (owner != null)
						{
							owner.Activate();
						}
					};
				}
				_Cache.TryAdd(uid, mask);
				mask.Show();
				handler = new WindowInteropHelper(mask).Handle;
			});
			return handler;
		}

		public string GetAppVersion()
		{
			return LMSAContext.MainProcessVersion;
		}

		public void ShowGuideTips()
		{
			if (UserService.Single.IsOnline && UserService.Single.CurrentLoggedInUser != null && lenovo.mbg.service.lmsa.Login.Business.PermissionService.Single.CheckPermission(UserService.Single.CurrentLoggedInUser.UserId, "8", "1"))
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					MainWindowViewModel.SingleInstance.DeletePersonalDataViewModel.IsShowDeletePersonalDataGuide = true;
					MainWindowViewModel.SingleInstance.DeletePersonalDataViewModel.IsShowDeletePersonalDataGuidePopup = true;
				});
			}
		}

		public void ShowFeedBack()
		{
			if (AppContext.IsLogIn)
			{
				MessageWindowHelper.Instance.Show(((DispatcherObject)Application.Current).Dispatcher.Invoke<FeedbackMainView>((Func<FeedbackMainView>)(() => new FeedbackMainView())), true);
			}
			else
			{
				MessageWindowHelper.Instance.Show(((DispatcherObject)Application.Current).Dispatcher.Invoke<FeedbackMainViewOnLogin>((Func<FeedbackMainViewOnLogin>)(() => new FeedbackMainViewOnLogin())), true);
			}
		}

		public void ShowBannerAsync(object data)
		{
			MainWindowViewModel.SingleInstance.ShowBanner(data);
		}
	}
	public class SplashScreenWindow : Window, IComponentConnector
	{
		private bool _isButtonClickable = true;

		private const int clickInterval = 3000;

		private readonly object _stateLock = new object();

		private LoginFlowState _state = LoginFlowState.Idle;

		private bool _forceReauthentication = false;

		internal Border broadcast_border;

		internal BroadcastText broadcast_text;

		internal TextBlock versionTextblock;

		internal CheckBox cbxAgreePolicy;

		internal Button continue_button;

		internal LangTextBlock errorText;

		internal Popup popupUser;

		private bool _contentLoaded;

		public LoginFlowState State
		{
			get
			{
				lock (_stateLock)
				{
					return _state;
				}
			}
			set
			{
				lock (_stateLock)
				{
					_state = value;
				}
			}
		}

		public SplashScreenWindow()
		{
			InitializeComponent();
			CheckClientVersion.Instance.CheckToolVersion(delegate
			{
			});
			versionTextblock.Text = HostProxy.LanguageService.Translate("K1794") + ": " + LMSAContext.MainProcessVersion;
			bool value = "TRUE".Equals(UserService.Single.GetLoginSetting("AgreePolicy"));
			((ToggleButton)cbxAgreePolicy).IsChecked = value;
			DeviceReadConfig.Instance.LoadTask();
			LoadBroadcastAsync();
			LoadPluginAsync();
			_forceReauthentication = "FALSE".Equals(UserService.Single.GetLoginSetting("AutoLogin"));
		}

		private Task LoadBroadcastAsync()
		{
			return Task.Run(() => WebServiceProxy.SingleInstance.GetNotice()).ContinueWith(delegate(Task<List<NoticeInfo>> ar)
			{
				if (ar.Result != null && ar.Result.Count > 0)
				{
					List<string> contents = (from n in ar.Result
						where !string.IsNullOrEmpty(n.noticeContent)
						select n.noticeContent).ToList();
					if (contents != null && contents.Count > 0)
					{
						((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
						{
							((UIElement)broadcast_border).Visibility = (Visibility)0;
							string input = string.Join("\t\t\t\t\t", contents);
							input = Regex.Replace(input, "[\\r\\n]", " ");
							broadcast_text.Text = string.Join("\t\t\t\t\t", new string[1] { input });
						});
					}
				}
			});
		}

		private Task LoadPluginAsync()
		{
			return Task.Run(delegate
			{
				List<PluginModel> list = new List<PluginModel>();
				List<PluginInfo> list2 = MainWindowControl.Instance.LoadPlguinInfo();
				foreach (PluginInfo item2 in list2)
				{
					if (!string.IsNullOrEmpty(item2.PluginID))
					{
						PluginModel item = new PluginModel
						{
							Info = item2,
							PluginName = item2.DisplayName,
							NormalIcon = "pack://application:,,,/Software Fix;component/ResourceV6/" + item2.Description + ".png",
							HoverIcon = "pack://application:,,,/Software Fix;component/ResourceV6/" + item2.Description + "Hover.png",
							Icon4B2B = "pack://application:,,,/lenovo.themes.generic;component/ResourceV6/p" + item2.Description + ".png"
						};
						list.Add(item);
					}
				}
				PluginContainer.Instance.LoadPuginDir(list.Select((PluginModel n) => n.Info.PluginDir).ToList());
				ApplcationClass.AvailablePlugins = list;
			});
		}

		private async void OnBtnLogin(object sender, RoutedEventArgs e)
		{
			if (!_isButtonClickable)
			{
				return;
			}
			_isButtonClickable = false;
			try
			{
				ResponseModel<string> res;
				string lang;
				int num;
				if (!UserService.Single.IsOnline)
				{
					_ = string.Empty;
					res = await GetLoginUrlAsync();
					if (res != null && string.Compare("0000", res.code) == 0 && !string.IsNullOrEmpty(res?.content))
					{
						lang = LMSAContext.CurrentLanguage;
						if (string.IsNullOrEmpty(lang))
						{
							goto IL_01a0;
						}
						switch (lang)
						{
						case "sk-SK":
						case "ro-RO":
						case "bg-BG":
							goto IL_01a0;
						}
						num = ((lang == "sr-RS") ? 1 : 0);
						goto IL_01a1;
					}
					if (!string.IsNullOrEmpty(res?.code) && res.code == "407")
					{
						ShowErrorText("K2201");
						LogHelper.LogInstance.Error("login failed: 407 ProxyAuthenticationRequired  ");
					}
					else
					{
						ShowErrorText("K2193");
						LogHelper.LogInstance.Error("login failed response:" + res.desc);
					}
				}
				else
				{
					ShowErrorText("K2193");
					ShowHostWindow();
				}
				goto end_IL_005b;
				IL_01a0:
				num = 1;
				goto IL_01a1;
				IL_01a1:
				if (num != 0)
				{
					lang = "en-US";
				}
				string url = res.content + "&lenovoid.lang=" + lang.Replace('-', '_');
				if (_forceReauthentication)
				{
					url += "&prompt=login";
				}
				Uri loginUri = new Uri(url);
				if (url != null && loginUri.Scheme == Uri.UriSchemeHttps && loginUri.Host.EndsWith("lenovo.com", StringComparison.CurrentCultureIgnoreCase))
				{
					State = LoginFlowState.WaitingForCallback;
					Process.Start(loginUri.ToString());
					errorText.LangKey = string.Empty;
				}
				else
				{
					ShowErrorText("K2193");
					LogHelper.LogInstance.Error("GetLoginUrlAsync URL[" + url + "] verification failed");
				}
				end_IL_005b:;
			}
			catch (Exception ex)
			{
				Exception ex2 = ex;
				ShowErrorText("K2193");
				LogHelper.LogInstance.Error($"LenovoID login failed by error: {ex2}");
			}
			finally
			{
				await Task.Delay(3000);
				_isButtonClickable = true;
			}
		}

		private void ShowHostWindow()
		{
			if (UserService.Single.IsOnline)
			{
				Application.Current.MainWindow = (Window)(object)new MainWindow();
				Application.Current.MainWindow.Show();
				((Window)this).Close();
			}
		}

		private async Task ClearResoucesAysnc()
		{
			await Task.Run(delegate
			{
				GlobalFun.KillProcess("adb");
			});
			await Task.Run(delegate
			{
				GlobalFun.KillProcess("qcomdloader");
			});
		}

		private void InitDeviceListener()
		{
			ClearResoucesAysnc().ContinueWith(delegate
			{
				Thread.Sleep(50);
				global::Smart.DeviceManagerEx.Start();
			});
		}

		private void GoToPrivacyPage_Click(object sender, RoutedEventArgs e)
		{
			GlobalFun.OpenUrlByBrowser("www.lenovo.com/privacy/");
		}

		private void MouseLeftButtonDownDrag(object sender, MouseButtonEventArgs e)
		{
			((Window)this).DragMove();
		}

		private void OnCbxAgreePolicy(object sender, RoutedEventArgs e)
		{
			bool value = ((ToggleButton)cbxAgreePolicy).IsChecked.Value;
			UserService.Single.AddOrUpdateAgreePolicySetting("AgreePolicy", value.ToString().ToUpper());
		}

		private void CloseClick(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
		}

		private void OnBtnClick(object sender, RoutedEventArgs e)
		{
			if (UserService.Single.IsOnline)
			{
				popupUser.IsOpen = true;
				return;
			}
			LenovoIdWindow.ShowDialogEx(isRegister: false, delegate(Window win)
			{
				((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
				{
					Window obj = win;
					if (obj != null)
					{
						obj.Close();
					}
				});
			});
		}

		private void OnBtnLogout(object sender, RoutedEventArgs e)
		{
			popupUser.IsOpen = false;
			UserService.Single.Logout(delegate
			{
			});
		}

		private void OnMouseLeave(object sender, MouseEventArgs e)
		{
			popupUser.IsOpen = false;
		}

		private async Task<ResponseModel<string>> GetLoginUrlAsync()
		{
			return await Task<ResponseModel<string>>.Factory.StartNew(() => AppContext.WebApi.Request(WebApiUrl.CALL_API_URL, new
			{
				key = "TIP_URL"
			}));
		}

		public void LenovoIDOauthCallBack(string url)
		{
			LogHelper.LogInstance.Info("Verify login callback ...");
			if (!url.StartsWith("SoftwareFix://callback", StringComparison.CurrentCultureIgnoreCase))
			{
				return;
			}
			switch (State)
			{
			case LoginFlowState.WaitingForCallback:
			case LoginFlowState.Failed:
			{
				string queryParamValue = GetQueryParamValue(new Uri(url)?.Query, "error");
				if (!string.IsNullOrEmpty(queryParamValue))
				{
					LogHelper.LogInstance.Error("Parameter [" + url + "] validation failed");
					ShowErrorText("K2193");
					break;
				}
				string queryParamValue2 = GetQueryParamValue(new Uri(url)?.Query, "Authorization");
				string queryParamValue3 = GetQueryParamValue(new Uri(url)?.Query, "fullName");
				if (string.IsNullOrEmpty(queryParamValue2) || string.IsNullOrEmpty(queryParamValue3))
				{
					ShowErrorText("K2193");
					LogHelper.LogInstance.Error("Parameter [" + url + "] validation failed,Authorization or Fullname is empty");
				}
				else
				{
					LoginByLenovoID(queryParamValue2, queryParamValue3);
				}
				break;
			}
			case LoginFlowState.Idle:
				LogHelper.LogInstance.Warn($"current login state is {State},need to click the login button again to log in ");
				ShowErrorText("K2193");
				break;
			case LoginFlowState.UserVerifying:
			case LoginFlowState.TimedOut:
			case LoginFlowState.Success:
				break;
			}
		}

		private void LoginByLenovoID(string code, string name)
		{
			try
			{
				State = LoginFlowState.UserVerifying;
				WebApiUrl.LOGIN_TOKEN = code;
				UserLoginFormData userLoginFormData = new UserLoginFormData();
				userLoginFormData.UserSource = "lenovoId";
				WebApiContext.JWT_TOKEN = code;
				userLoginFormData.UserData = name;
				ResponseData<LoggingInResponseData> responseData = UserService.Single.Login(userLoginFormData, (Window)(object)this);
				if (responseData != null && string.Compare("0000", responseData.Code) == 0)
				{
					State = LoginFlowState.Success;
					FileHelper.WriteJsonWithAesEncrypt(Configurations.DefaultOptionsFileName, "AutoLogin", true);
					ShowHostWindow();
				}
				else if (responseData.Code == "407")
				{
					ShowErrorText("K2201");
					LogHelper.LogInstance.Error("login failed: 407 ProxyAuthenticationRequired  ");
				}
				else
				{
					ShowErrorText("K2193");
					LogHelper.LogInstance.Error("login failed");
				}
			}
			catch (Exception arg)
			{
				ShowErrorText("K2193");
				LogHelper.LogInstance.Error($"LoginByLenovoID exception: {arg}");
			}
		}

		private string GetQueryParamValue(string query, string paramName)
		{
			string[] array = query.TrimStart(new char[1] { '?' }).Split(new char[1] { '&' });
			string[] array2 = array;
			foreach (string text in array2)
			{
				string[] array3 = text.Split(new char[1] { '=' });
				if (array3[0] == paramName && array3.Length > 1)
				{
					return array3[1];
				}
			}
			return null;
		}

		private void ShowErrorText(string key = null)
		{
			State = LoginFlowState.Failed;
			((UIElement)errorText).Visibility = (Visibility)0;
			errorText.LangKey = key;
		}

		private void FeedBackButton_Click(object sender, RoutedEventArgs e)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuFeedbackButtonClick", "menu-feedback button click", 0L).Build());
			Window val = (Window)(object)new FeedbackMainViewOnLogin((Window)(object)this, isMainWindowLoad: false);
			val.ShowDialog();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/splashscreenwindow.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Expected O, but got Unknown
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0076: Expected O, but got Unknown
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0089: Unknown result type (might be due to invalid IL or missing references)
			//IL_0093: Expected O, but got Unknown
			//IL_009b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Expected O, but got Unknown
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Expected O, but got Unknown
			//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d8: Expected O, but got Unknown
			//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ef: Expected O, but got Unknown
			//IL_00f6: Unknown result type (might be due to invalid IL or missing references)
			//IL_0102: Unknown result type (might be due to invalid IL or missing references)
			//IL_010c: Expected O, but got Unknown
			//IL_0111: Unknown result type (might be due to invalid IL or missing references)
			//IL_011b: Expected O, but got Unknown
			//IL_0128: Unknown result type (might be due to invalid IL or missing references)
			//IL_0132: Expected O, but got Unknown
			//IL_0145: Unknown result type (might be due to invalid IL or missing references)
			//IL_014f: Expected O, but got Unknown
			//IL_015c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0166: Expected O, but got Unknown
			//IL_016a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0176: Unknown result type (might be due to invalid IL or missing references)
			//IL_0180: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(Border)target).MouseLeftButtonDown += new MouseButtonEventHandler(MouseLeftButtonDownDrag);
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(FeedBackButton_Click);
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(CloseClick);
				break;
			case 4:
				broadcast_border = (Border)target;
				break;
			case 5:
				broadcast_text = (BroadcastText)target;
				break;
			case 6:
				versionTextblock = (TextBlock)target;
				break;
			case 7:
				cbxAgreePolicy = (CheckBox)target;
				((ButtonBase)cbxAgreePolicy).Click += new RoutedEventHandler(OnCbxAgreePolicy);
				break;
			case 8:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(GoToPrivacyPage_Click);
				break;
			case 9:
				continue_button = (Button)target;
				((ButtonBase)continue_button).Click += new RoutedEventHandler(OnBtnLogin);
				break;
			case 10:
				errorText = (LangTextBlock)target;
				break;
			case 11:
				popupUser = (Popup)target;
				((UIElement)popupUser).MouseLeave += new MouseEventHandler(OnMouseLeave);
				break;
			case 12:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnLogout);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public enum LoginFlowState
	{
		Idle,
		WaitingForCallback,
		UserVerifying,
		TimedOut,
		Failed,
		Success
	}
	public class ImageButton : Button
	{
		public static readonly DependencyProperty ButtonImageSourceProperty = DependencyProperty.Register("ButtonImageSource", typeof(ImageSource), typeof(ImageButton), new PropertyMetadata((PropertyChangedCallback)null));

		public static readonly DependencyProperty ButtonTextProperty = DependencyProperty.Register("ButtonText", typeof(string), typeof(ImageButton), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty NormalBackgroundBrushProperty = DependencyProperty.Register("NormalBackgroundBrush", typeof(Brush), typeof(ImageButton), new PropertyMetadata((PropertyChangedCallback)null));

		public static readonly DependencyProperty MousePressDownBackgroundBrushProperty = DependencyProperty.Register("MousePressDownBackgroundBrush", typeof(Brush), typeof(ImageButton), new PropertyMetadata((PropertyChangedCallback)null));

		public static readonly DependencyProperty MouseOverBackgroundBrushProperty = DependencyProperty.Register("MouseOverBackgroundBrush", typeof(Brush), typeof(ImageButton), new PropertyMetadata((PropertyChangedCallback)null));

		public static readonly DependencyProperty DisabledBackgroundBrushProperty = DependencyProperty.Register("DisabledBackgroundBrush", typeof(Brush), typeof(ImageButton), new PropertyMetadata((PropertyChangedCallback)null));

		public ImageSource ButtonImageSource
		{
			get
			{
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Expected O, but got Unknown
				return (ImageSource)((DependencyObject)this).GetValue(ButtonImageSourceProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonImageSourceProperty, (object)value);
			}
		}

		public string ButtonText
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(ButtonTextProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonTextProperty, (object)value);
			}
		}

		public Brush NormalBackgroundBrush
		{
			get
			{
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Expected O, but got Unknown
				return (Brush)((DependencyObject)this).GetValue(NormalBackgroundBrushProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(NormalBackgroundBrushProperty, (object)value);
			}
		}

		public Brush MousePressDownBackgroundBrush
		{
			get
			{
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Expected O, but got Unknown
				return (Brush)((DependencyObject)this).GetValue(MousePressDownBackgroundBrushProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(MousePressDownBackgroundBrushProperty, (object)value);
			}
		}

		public Brush MouseOverBackgroundBrush
		{
			get
			{
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Expected O, but got Unknown
				return (Brush)((DependencyObject)this).GetValue(MouseOverBackgroundBrushProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(MouseOverBackgroundBrushProperty, (object)value);
			}
		}

		public Brush DisabledBackgroundBrush
		{
			get
			{
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Expected O, but got Unknown
				return (Brush)((DependencyObject)this).GetValue(DisabledBackgroundBrushProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(DisabledBackgroundBrushProperty, (object)value);
			}
		}
	}
	public class ProgressBar_Window : Window, IComponentConnector
	{
		public static readonly DependencyProperty StrProgressTitleProperty = DependencyProperty.Register("StrProgressTitle", typeof(string), typeof(ProgressBar_Window), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty PercentNumProperty = DependencyProperty.Register("PercentNum", typeof(double), typeof(ProgressBar_Window), new PropertyMetadata((object)0.0));

		public static readonly DependencyProperty StrPercentProperty = DependencyProperty.Register("StrPercent", typeof(string), typeof(ProgressBar_Window), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty StrDownloadSpeedProperty = DependencyProperty.Register("StrDownloadSpeed", typeof(string), typeof(ProgressBar_Window), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty StrButtonTitle_CancelProperty = DependencyProperty.Register("StrButtonTitle_Cancel", typeof(string), typeof(ProgressBar_Window), new PropertyMetadata((object)string.Empty));

		internal ProgressBar_Window progressBar_Window;

		internal TextBlock TxbPercent;

		internal TextBlock TxbCancel;

		private bool _contentLoaded;

		private bool IsShowPercent
		{
			set
			{
				((UIElement)TxbPercent).Visibility = (Visibility)((!value) ? 2 : 0);
			}
		}

		public string StrProgressTitle
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrProgressTitleProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrProgressTitleProperty, (object)value);
			}
		}

		public double PercentNum
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(PercentNumProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(PercentNumProperty, (object)value);
				StrPercent = Math.Round(value, 0) + "%";
			}
		}

		public string StrPercent
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrPercentProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrPercentProperty, (object)value);
			}
		}

		public string StrDownloadSpeed
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrDownloadSpeedProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrDownloadSpeedProperty, (object)value);
			}
		}

		public string StrButtonTitle_Cancel
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrButtonTitle_CancelProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrButtonTitle_CancelProperty, (object)value);
			}
		}

		public object ContentTag { get; set; }

		public ProgressBar_Window(Window windowOwner, bool isShowPercent, string strProgressTitle, bool isShowCancel = false)
		{
			InitializeComponent();
			((Window)this).Owner = windowOwner;
			((Window)this).WindowStartupLocation = (WindowStartupLocation)2;
			IsShowPercent = isShowPercent;
			StrProgressTitle = strProgressTitle;
			StrButtonTitle_Cancel = "K0208";
			((UIElement)TxbCancel).Visibility = (Visibility)((!isShowCancel) ? 2 : 0);
		}

		private void TxbCancel_MouseDown(object sender, MouseButtonEventArgs e)
		{
			if (ContentTag == null)
			{
				return;
			}
			try
			{
				VersionModel NewVersionModel = ContentTag as VersionModel;
				ThreadPool.QueueUserWorkItem(delegate
				{
					UpdateManager.Instance.ToolUpdateWorker.CancelDownloadVersion(NewVersionModel);
				});
				ApplcationClass.IsUpdatingPlug = false;
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.lmsa.ProgressBar_Window.TxbCancel_MouseDown event error. ex:" + ex.ToString());
			}
			((Window)this).Close();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/progressbar_window.xaml", UriKind.Relative);
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
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Expected O, but got Unknown
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				progressBar_Window = (ProgressBar_Window)target;
				break;
			case 2:
				TxbPercent = (TextBlock)target;
				break;
			case 3:
				TxbCancel = (TextBlock)target;
				((UIElement)TxbCancel).MouseDown += new MouseButtonEventHandler(TxbCancel_MouseDown);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class MessageBox_Common : Window, IComponentConnector
	{
		private Storyboard sbCarch = new Storyboard();

		private MessageBoxResult messageBoxChooseResult = (MessageBoxResult)0;

		public static readonly DependencyProperty StrTitleTipProperty = DependencyProperty.Register("StrTitleTip", typeof(string), typeof(MessageBox_Common), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty StrButtonTitle_OKProperty = DependencyProperty.Register("StrButtonTitle_OK", typeof(string), typeof(MessageBox_Common), new PropertyMetadata((object)"K0327"));

		public static readonly DependencyProperty StrButtonTitle_CancelProperty = DependencyProperty.Register("StrButtonTitle_Cancel", typeof(string), typeof(MessageBox_Common), new PropertyMetadata((object)"K0208"));

		public static readonly DependencyProperty StrCashTipProperty = DependencyProperty.Register("StrCashTip", typeof(string), typeof(MessageBox_Common), new PropertyMetadata((object)string.Empty));

		internal MessageBox_Common messageBox_Common;

		internal MouseOverButton TxbOk;

		internal MouseOverButton TxbCancel;

		internal Grid gridCash;

		internal Image imgCash;

		internal RotateTransform rotate;

		private bool _contentLoaded;

		public TypeItems.MessageBoxType MsgTypes
		{
			set
			{
				//IL_0086: Unknown result type (might be due to invalid IL or missing references)
				//IL_0101: Unknown result type (might be due to invalid IL or missing references)
				switch (value)
				{
				case TypeItems.MessageBoxType.OK:
					((UIElement)gridCash).Visibility = (Visibility)2;
					((UIElement)TxbCancel).Visibility = (Visibility)1;
					((UIElement)TxbOk).Visibility = (Visibility)0;
					((FrameworkElement)TxbOk).HorizontalAlignment = (HorizontalAlignment)1;
					((FrameworkElement)TxbOk).Margin = new Thickness(0.0, 0.0, 0.0, 0.0);
					break;
				case TypeItems.MessageBoxType.OKCancel:
				case TypeItems.MessageBoxType.YesNo:
					((UIElement)gridCash).Visibility = (Visibility)2;
					((UIElement)TxbCancel).Visibility = (Visibility)0;
					((FrameworkElement)TxbCancel).HorizontalAlignment = (HorizontalAlignment)2;
					((UIElement)TxbOk).Visibility = (Visibility)0;
					((FrameworkElement)TxbOk).HorizontalAlignment = (HorizontalAlignment)0;
					((FrameworkElement)TxbOk).Margin = new Thickness(50.0, 0.0, 0.0, 0.0);
					break;
				case TypeItems.MessageBoxType.YesNoCancel:
					break;
				case TypeItems.MessageBoxType.Cash_Load:
				case TypeItems.MessageBoxType.Cash_Wait:
					((UIElement)gridCash).Visibility = (Visibility)0;
					((UIElement)TxbOk).Visibility = (Visibility)2;
					((UIElement)TxbCancel).Visibility = (Visibility)2;
					StrCashTip = "K0348";
					ExecuteAnimation();
					break;
				}
			}
		}

		public MessageBoxResult MessageBoxChooseResult
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return messageBoxChooseResult;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				messageBoxChooseResult = value;
			}
		}

		public string StrTitleTip
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrTitleTipProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrTitleTipProperty, (object)value);
			}
		}

		public string StrButtonTitle_OK
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrButtonTitle_OKProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrButtonTitle_OKProperty, (object)value);
			}
		}

		public string StrButtonTitle_Cancel
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrButtonTitle_CancelProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrButtonTitle_CancelProperty, (object)value);
			}
		}

		public string StrCashTip
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrCashTipProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrCashTipProperty, (object)value);
			}
		}

		public MessageBox_Common(Window ShowOwner, TypeItems.MessageBoxType MsgType, string strTitleTip, string strButtonTitle_OK, string strButtonTitle_Cancel)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Expected O, but got Unknown
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0068: Expected O, but got Unknown
			InitializeComponent();
			MsgTypes = MsgType;
			StrTitleTip = strTitleTip;
			StrButtonTitle_OK = strButtonTitle_OK;
			StrButtonTitle_Cancel = strButtonTitle_Cancel;
			((Window)this).Closed += MessageBox_Common_Closed;
			((FrameworkElement)this).Loaded += new RoutedEventHandler(MessageBox_Common_Loaded);
		}

		private void MessageBox_Common_Loaded(object sender, RoutedEventArgs e)
		{
			((Window)this).Left = ((Window)this).Left + 56.0;
		}

		private void MessageBox_Common_Closed(object sender, EventArgs e)
		{
			sbCarch.Stop();
		}

		private void TxbCancel_MouseDown(object sender, MouseButtonEventArgs e)
		{
		}

		private void ExecuteAnimation()
		{
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Expected O, but got Unknown
			//IL_008e: Unknown result type (might be due to invalid IL or missing references)
			((UIElement)imgCash).RenderTransform = (Transform)(object)rotate;
			DoubleAnimation val = new DoubleAnimation(0.0, 360.0, new Duration(TimeSpan.FromSeconds(1.0)));
			Storyboard.SetTarget((DependencyObject)(object)val, (DependencyObject)(object)imgCash);
			DependencyProperty[] array = (DependencyProperty[])(object)new DependencyProperty[2]
			{
				UIElement.RenderTransformProperty,
				RotateTransform.AngleProperty
			};
			object[] array2 = array;
			Storyboard.SetTargetProperty((DependencyObject)(object)val, new PropertyPath("(0).(1)", array2));
			((TimelineGroup)sbCarch).Children.Add((Timeline)(object)val);
			((Timeline)sbCarch).RepeatBehavior = RepeatBehavior.Forever;
			sbCarch.Begin();
		}

		private void TxbOk_Click(object sender, RoutedEventArgs e)
		{
			//IL_0003: Unknown result type (might be due to invalid IL or missing references)
			messageBoxChooseResult = (MessageBoxResult)1;
			((Window)this).Close();
		}

		private void TxbCancel_Click(object sender, RoutedEventArgs e)
		{
			//IL_0003: Unknown result type (might be due to invalid IL or missing references)
			messageBoxChooseResult = (MessageBoxResult)2;
			((Window)this).Close();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/messagebox_common.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_0077: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Expected O, but got Unknown
			//IL_0094: Unknown result type (might be due to invalid IL or missing references)
			//IL_009e: Expected O, but got Unknown
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				messageBox_Common = (MessageBox_Common)target;
				break;
			case 2:
				TxbOk = (MouseOverButton)target;
				((ButtonBase)TxbOk).Click += new RoutedEventHandler(TxbOk_Click);
				break;
			case 3:
				TxbCancel = (MouseOverButton)target;
				((ButtonBase)TxbCancel).Click += new RoutedEventHandler(TxbCancel_Click);
				break;
			case 4:
				gridCash = (Grid)target;
				break;
			case 5:
				imgCash = (Image)target;
				break;
			case 6:
				rotate = (RotateTransform)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class ReadDotTipImageButton : ImageButton
	{
		public static readonly DependencyProperty RedDotImageSourceProperty = DependencyProperty.Register("RedDotImageSource", typeof(ImageSource), typeof(ReadDotTipImageButton), new PropertyMetadata((PropertyChangedCallback)null));

		public static readonly DependencyProperty IsShowRedDotProperty = DependencyProperty.Register("IsShowRedDot", typeof(bool), typeof(ReadDotTipImageButton), new PropertyMetadata((object)false));

		public ImageSource RedDotImageSource
		{
			get
			{
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Expected O, but got Unknown
				return (ImageSource)((DependencyObject)this).GetValue(RedDotImageSourceProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(RedDotImageSourceProperty, (object)value);
			}
		}

		public bool IsShowRedDot
		{
			get
			{
				return (bool)((DependencyObject)this).GetValue(IsShowRedDotProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(IsShowRedDotProperty, (object)value);
			}
		}
	}
	public class HostUpdateWindow : Window, IComponentConnector
	{
		public enum ViewStatus
		{
			DetectedVersion,
			DowloadVersion,
			InstallVersion
		}

		private VersionModel mVersionModel;

		private ViewStatus mCurrentViewStatus = ViewStatus.DetectedVersion;

		private MessageBoxResult messageBoxChooseResult = (MessageBoxResult)0;

		public static readonly DependencyProperty StrPercentProperty = DependencyProperty.Register("StrPercent", typeof(string), typeof(HostUpdateWindow), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty PercentNumProperty = DependencyProperty.Register("PercentNum", typeof(double), typeof(HostUpdateWindow), new PropertyMetadata((object)0.0));

		public static readonly DependencyProperty StrDownloadSpeedProperty = DependencyProperty.Register("StrDownloadSpeed", typeof(string), typeof(HostUpdateWindow), new PropertyMetadata((object)string.Empty));

		private Action updateProgressAction;

		private volatile bool mRefreshUpgradeProgress = false;

		protected VersionModel currentDownloadModel = null;

		internal HostUpdateWindow hostUpdateWindow;

		internal Button btnCloseWin;

		internal LangTextBlock TxbTips;

		internal TextBlock fileVersion;

		internal TextBlock fileSize;

		internal ScrollViewer scrViewerVersionList;

		internal TextBlock updatContent;

		internal LangTextBlock updateWarn;

		internal StackPanel panelDetected;

		internal CheckBox checkboxNotRemindMeForThisVersion;

		internal LangTextBlock checkboxNotRemindMeForThisVersionContent;

		internal LangButton btnCancelUpgrade;

		internal LangButton btnUpgradeNow;

		internal StackPanel panelDownload;

		internal TextBlock TxbPercent;

		internal StackPanel panelInstall;

		internal LangButton btnCalcelInstall;

		internal LangButton btnInstallNow;

		private bool _contentLoaded;

		public MessageBoxResult MessageBoxChooseResult
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return messageBoxChooseResult;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				messageBoxChooseResult = value;
			}
		}

		public string StrPercent
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrPercentProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrPercentProperty, (object)value);
			}
		}

		public double PercentNum
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(PercentNumProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(PercentNumProperty, (object)value);
				StrPercent = string.Format(LangTranslation.Translate("K0294"), Math.Round(value, 0) + "%");
			}
		}

		public string StrDownloadSpeed
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrDownloadSpeedProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrDownloadSpeedProperty, (object)value);
			}
		}

		public HostUpdateWindow(ViewStatus viewStatus, bool isForceUpgrade, VersionModel viewmodel)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_00de: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e8: Expected O, but got Unknown
			InitializeComponent();
			if (isForceUpgrade)
			{
				((UIElement)checkboxNotRemindMeForThisVersionContent).Visibility = (Visibility)2;
				((UIElement)checkboxNotRemindMeForThisVersion).Visibility = (Visibility)2;
				((UIElement)btnCancelUpgrade).Visibility = (Visibility)2;
				((UIElement)btnCalcelInstall).Visibility = (Visibility)2;
			}
			else
			{
				((UIElement)checkboxNotRemindMeForThisVersionContent).Visibility = (Visibility)0;
				((UIElement)checkboxNotRemindMeForThisVersion).Visibility = (Visibility)0;
				((UIElement)btnCancelUpgrade).Visibility = (Visibility)0;
				((UIElement)btnCalcelInstall).Visibility = (Visibility)0;
			}
			ApplcationClass.ForceUpdate = viewmodel.ForceType;
			UpdateManager.Instance.ToolUpdateWorker.OnDownloadStatusChanged += ToolUpdateWorker_OnDownloadStatusChanged;
			mVersionModel = viewmodel;
			((FrameworkElement)this).DataContext = viewmodel;
			((FrameworkElement)this).Loaded += new RoutedEventHandler(MessageBox_Common_Loaded);
			SwitchViewStatus(viewStatus);
			((Window)this).Closed += delegate
			{
				StopRefreshUpgradeProgress();
			};
		}

		private void SwitchViewStatus(ViewStatus viewStatus)
		{
			mCurrentViewStatus = viewStatus;
			switch (viewStatus)
			{
			case ViewStatus.DetectedVersion:
				TxbTips.LangKey = "K0286";
				((UIElement)panelDetected).Visibility = (Visibility)0;
				((UIElement)panelDownload).Visibility = (Visibility)2;
				((UIElement)panelInstall).Visibility = (Visibility)2;
				break;
			case ViewStatus.DowloadVersion:
				((UIElement)panelDetected).Visibility = (Visibility)2;
				((UIElement)panelDownload).Visibility = (Visibility)0;
				((UIElement)panelInstall).Visibility = (Visibility)2;
				TxbTips.LangKey = "K0293";
				break;
			case ViewStatus.InstallVersion:
				((UIElement)panelDetected).Visibility = (Visibility)2;
				((UIElement)panelDownload).Visibility = (Visibility)2;
				((UIElement)panelInstall).Visibility = (Visibility)0;
				TxbTips.LangKey = "K0356";
				break;
			}
		}

		private void MessageBox_Common_Loaded(object sender, RoutedEventArgs e)
		{
			UpgradeUserOptionManager upgradeUserOptionManager = new UpgradeUserOptionManager();
			VersionModel versionModel = ((FrameworkElement)this).DataContext as VersionModel;
			((ToggleButton)checkboxNotRemindMeForThisVersion).IsChecked = UpgradeRemindType.NotRemindForTheCurrentVersion.Equals(upgradeUserOptionManager.GetRemindType(versionModel.Version));
			StrPercent = string.Format(LangTranslation.Translate("K0294"), "0%");
		}

		private void btnUpgradeNow_Click(object sender, RoutedEventArgs e)
		{
			((UIElement)updateWarn).Visibility = (Visibility)2;
			SwitchViewStatus(ViewStatus.DowloadVersion);
			BeginDownlad();
		}

		private void btnCancelUpgrade_Click(object sender, RoutedEventArgs e)
		{
			UpgradeRemindType type = ((!((ToggleButton)checkboxNotRemindMeForThisVersion).IsChecked.HasValue || !((ToggleButton)checkboxNotRemindMeForThisVersion).IsChecked.Value) ? UpgradeRemindType.RemindTomorrow : UpgradeRemindType.NotRemindForTheCurrentVersion);
			SaveRemindType(type);
			ApplcationClass.manualTrigger = true;
			ApplcationClass.FrameHasNewVersion = true;
			ApplcationClass.IsUpdatingPlug = false;
			VersionModel versionModel = ((FrameworkElement)this).DataContext as VersionModel;
			((Window)this).Close();
			ForceStopProcessIfNeed();
		}

		private void btnInstallNow_Click(object sender, RoutedEventArgs e)
		{
			btnInstallNow.LangKey = "K0365";
			((UIElement)btnInstallNow).IsEnabled = false;
			Task.Run(delegate
			{
				UpdateManager.Instance.ToolUpdateWorker.InstallVersion(mVersionModel);
			});
		}

		private void btnCalcelInstall_Click(object sender, RoutedEventArgs e)
		{
			SaveRemindType(UpgradeRemindType.RemindTomorrow);
			((Window)this).Close();
			ForceStopProcessIfNeed();
		}

		private void btnCloseWin_Click(object sender, RoutedEventArgs e)
		{
			if (mCurrentViewStatus == ViewStatus.DetectedVersion)
			{
				btnCancelUpgrade_Click(null, null);
			}
			else
			{
				btnCalcelInstall_Click(null, null);
			}
		}

		private void scrViewerVersionList_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Expected O, but got Unknown
			ScrollViewer val = (ScrollViewer)sender;
			val.ScrollToVerticalOffset(val.VerticalOffset - (double)e.Delta);
			((RoutedEventArgs)e).Handled = true;
		}

		private void SaveRemindType(UpgradeRemindType type)
		{
			VersionModel versionModel = ((FrameworkElement)this).DataContext as VersionModel;
			UpgradeUserOptionManager upgradeUserOptionManager = new UpgradeUserOptionManager();
			upgradeUserOptionManager.SaveUpgradeRemindType(new UpgradeRemindTypeInfo
			{
				CurrentVersion = LMSAContext.MainProcessVersion,
				NewVersion = versionModel.Version,
				RemindType = type,
				SetDate = DateTime.Now
			});
		}

		private async void ForceStopProcessIfNeed()
		{
			if (((FrameworkElement)this).DataContext is VersionModel versionModel && versionModel.ForceType && Application.Current.MainWindow is MainWindow && await MainWindowViewModel.SingleInstance.CheckCanCloseWindow())
			{
				MainWindowViewModel.SingleInstance.Exit(0);
			}
		}

		private void BeginDownlad()
		{
			ApplcationClass.IsUpdatingPlug = true;
			Task.Factory.StartNew(delegate
			{
				UpdateManager.Instance.ToolUpdateWorker.DownloadVersion(mVersionModel);
			});
		}

		private void BeginRefreshDonwloadProgress()
		{
			if (mRefreshUpgradeProgress)
			{
				return;
			}
			mRefreshUpgradeProgress = true;
			double percent = 0.0;
			if (updateProgressAction == null)
			{
				updateProgressAction = delegate
				{
					PercentNum = percent * 100.0;
					StrDownloadSpeed = currentDownloadModel?.downloadSpeed;
				};
			}
			Task.Factory.StartNew(delegate
			{
				while (mRefreshUpgradeProgress)
				{
					if (currentDownloadModel != null && currentDownloadModel.downloadFileSize > 0)
					{
						percent = double.Parse(currentDownloadModel.downloadedSize.ToString()) / double.Parse(currentDownloadModel.downloadFileSize.ToString());
					}
					((DispatcherObject)this).Dispatcher.Invoke(updateProgressAction);
				}
			});
		}

		private void StopRefreshUpgradeProgress()
		{
			UpdateManager.Instance.ToolUpdateWorker.OnDownloadStatusChanged -= ToolUpdateWorker_OnDownloadStatusChanged;
			updateProgressAction = null;
			mRefreshUpgradeProgress = false;
			currentDownloadModel = null;
			UpdateManager.Instance.ToolUpdateWorker.CancelDownloadVersion(mVersionModel);
		}

		private void ToolUpdateWorker_OnDownloadStatusChanged(object sender, DownloadStatusChangedArgs e)
		{
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				if (e.Data != null)
				{
					currentDownloadModel = e.Data as VersionModel;
					switch (currentDownloadModel.downloadStatus)
					{
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.DOWNLOADING:
						BeginRefreshDonwloadProgress();
						break;
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.FAILED:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.MD5CHECKFAILED:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.GETFILESIZEFAILED:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.UNENOUGHDISKSPACE:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.CREATEDIRECTORYFAILED:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.DOWNLOADFILENOTFOUND:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.UNDEFINEERROR:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.NETWORKCONNECTIONERROR:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.FILERENAMEFAILED:
						StopRefreshUpgradeProgress();
						SwitchViewStatus(ViewStatus.DetectedVersion);
						((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
						{
							((UIElement)updateWarn).Visibility = (Visibility)0;
							updateWarn.LangKey = "K0357";
						});
						break;
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.PAUSE:
						StopRefreshUpgradeProgress();
						break;
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.SUCCESS:
						StopRefreshUpgradeProgress();
						((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
						{
							SwitchViewStatus(ViewStatus.InstallVersion);
							ApplcationClass.IsUpdatingPlug = false;
						});
						break;
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.WAITTING:
						StopRefreshUpgradeProgress();
						break;
					default:
						ApplcationClass.IsUpdatingPlug = false;
						break;
					}
				}
			});
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/versionupdatecontrols/frameupdate/hostupdatewindow.xaml", UriKind.Relative);
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
			//IL_006d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0077: Expected O, but got Unknown
			//IL_0084: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Expected O, but got Unknown
			//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b1: Expected O, but got Unknown
			//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c2: Expected O, but got Unknown
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d3: Expected O, but got Unknown
			//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ea: Expected O, but got Unknown
			//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fc: Expected O, but got Unknown
			//IL_0114: Unknown result type (might be due to invalid IL or missing references)
			//IL_011e: Expected O, but got Unknown
			//IL_0125: Unknown result type (might be due to invalid IL or missing references)
			//IL_012f: Expected O, but got Unknown
			//IL_015e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0168: Expected O, but got Unknown
			//IL_0187: Unknown result type (might be due to invalid IL or missing references)
			//IL_0191: Expected O, but got Unknown
			//IL_0196: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a0: Expected O, but got Unknown
			//IL_01a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ae: Expected O, but got Unknown
			//IL_01b2: Unknown result type (might be due to invalid IL or missing references)
			//IL_01bc: Expected O, but got Unknown
			//IL_01d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_01e1: Expected O, but got Unknown
			//IL_01fd: Unknown result type (might be due to invalid IL or missing references)
			//IL_0207: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				hostUpdateWindow = (HostUpdateWindow)target;
				break;
			case 2:
				btnCloseWin = (Button)target;
				((ButtonBase)btnCloseWin).Click += new RoutedEventHandler(btnCloseWin_Click);
				break;
			case 3:
				TxbTips = (LangTextBlock)target;
				break;
			case 4:
				fileVersion = (TextBlock)target;
				break;
			case 5:
				fileSize = (TextBlock)target;
				break;
			case 6:
				scrViewerVersionList = (ScrollViewer)target;
				((UIElement)scrViewerVersionList).PreviewMouseWheel += new MouseWheelEventHandler(scrViewerVersionList_PreviewMouseWheel);
				break;
			case 7:
				updatContent = (TextBlock)target;
				break;
			case 8:
				updateWarn = (LangTextBlock)target;
				break;
			case 9:
				panelDetected = (StackPanel)target;
				break;
			case 10:
				checkboxNotRemindMeForThisVersion = (CheckBox)target;
				break;
			case 11:
				checkboxNotRemindMeForThisVersionContent = (LangTextBlock)target;
				break;
			case 12:
				btnCancelUpgrade = (LangButton)target;
				((ButtonBase)btnCancelUpgrade).Click += new RoutedEventHandler(btnCancelUpgrade_Click);
				break;
			case 13:
				btnUpgradeNow = (LangButton)target;
				((ButtonBase)btnUpgradeNow).Click += new RoutedEventHandler(btnUpgradeNow_Click);
				break;
			case 14:
				panelDownload = (StackPanel)target;
				break;
			case 15:
				TxbPercent = (TextBlock)target;
				break;
			case 16:
				panelInstall = (StackPanel)target;
				break;
			case 17:
				btnCalcelInstall = (LangButton)target;
				((ButtonBase)btnCalcelInstall).Click += new RoutedEventHandler(btnCalcelInstall_Click);
				break;
			case 18:
				btnInstallNow = (LangButton)target;
				((ButtonBase)btnInstallNow).Click += new RoutedEventHandler(btnInstallNow_Click);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class ProgressBar_Common : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty ProgressBarValueProperty = DependencyProperty.Register("ProgressBarValue", typeof(double), typeof(ProgressBar_Common), new PropertyMetadata((object)0.0));

		internal ProgressBar_Common progressBar_Common;

		private bool _contentLoaded;

		public double ProgressBarValue
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(ProgressBarValueProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ProgressBarValueProperty, (object)value);
			}
		}

		public ProgressBar_Common()
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
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/progressbar_common.xaml", UriKind.Relative);
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
				progressBar_Common = (ProgressBar_Common)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class ButtonExBack_Common : UserControl, IComponentConnector
	{
		private SolidColorBrush BgEnable = new SolidColorBrush(Colors.White);

		private SolidColorBrush BgUnEnable = new SolidColorBrush(Color.FromRgb((byte)127, (byte)127, (byte)127));

		public static readonly DependencyProperty ButtonEnableProperty = DependencyProperty.Register("ButtonEnable", typeof(bool), typeof(ButtonExBack_Common), new PropertyMetadata((object)true));

		public static readonly DependencyProperty ButtonHeightProperty = DependencyProperty.Register("ButtonHeight", typeof(double), typeof(ButtonExBack_Common), new PropertyMetadata((object)60.0));

		public static readonly DependencyProperty ButtonWidthProperty = DependencyProperty.Register("ButtonWidth", typeof(double), typeof(ButtonExBack_Common), new PropertyMetadata((object)200.0));

		public static readonly DependencyProperty CronRadioProperty = DependencyProperty.Register("CronRadio", typeof(double), typeof(ButtonExBack_Common), new PropertyMetadata((object)30.0));

		public static readonly DependencyProperty StrButtonTitleProperty = DependencyProperty.Register("StrButtonTitle", typeof(string), typeof(ButtonExBack_Common), new PropertyMetadata((object)string.Empty));

		internal ButtonExBack_Common buttonExBack_Common;

		internal Border ShandowBorder;

		internal Border MainBorder;

		internal DropShadowEffect EffectShadow;

		private bool _contentLoaded;

		public bool ButtonEnable
		{
			get
			{
				return (bool)((DependencyObject)this).GetValue(ButtonEnableProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonEnableProperty, (object)value);
				if (value)
				{
					MainBorder.Background = (Brush)(object)BgEnable;
				}
				else
				{
					MainBorder.Background = (Brush)(object)BgUnEnable;
				}
			}
		}

		public double ButtonHeight
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(ButtonHeightProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonHeightProperty, (object)value);
				CronRadio = ButtonWidth / 2.0;
			}
		}

		public double ButtonWidth
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(ButtonWidthProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonWidthProperty, (object)value);
			}
		}

		public double CronRadio
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(CronRadioProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(CronRadioProperty, (object)value);
			}
		}

		public string StrButtonTitle
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrButtonTitleProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrButtonTitleProperty, (object)value);
			}
		}

		public event EventHandler ButtonClick;

		public ButtonExBack_Common()
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Expected O, but got Unknown
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			InitializeComponent();
			InitializeResource();
		}

		private void InitializeResource()
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Expected O, but got Unknown
			((UIElement)MainBorder).MouseDown += new MouseButtonEventHandler(MainBorder_MouseDown);
			((UIElement)MainBorder).MouseUp += new MouseButtonEventHandler(MainBorder_MouseUp);
		}

		private void MainBorder_MouseUp(object sender, MouseButtonEventArgs e)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			if (ButtonEnable)
			{
				MainBorder.BorderThickness = new Thickness(3.0);
				((UIElement)ShandowBorder).Visibility = (Visibility)0;
			}
		}

		private void MainBorder_MouseDown(object sender, MouseButtonEventArgs e)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			if (ButtonEnable)
			{
				MainBorder.BorderThickness = new Thickness(0.0);
				((UIElement)ShandowBorder).Visibility = (Visibility)2;
				if (this.ButtonClick != null)
				{
					this.ButtonClick(this, (EventArgs)(object)e);
				}
				((UIElement)ShandowBorder).Visibility = (Visibility)0;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/buttonexback_common.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_0050: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				buttonExBack_Common = (ButtonExBack_Common)target;
				break;
			case 2:
				ShandowBorder = (Border)target;
				((UIElement)ShandowBorder).MouseDown += new MouseButtonEventHandler(MainBorder_MouseDown);
				break;
			case 3:
				MainBorder = (Border)target;
				break;
			case 4:
				EffectShadow = (DropShadowEffect)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class TypeItems
	{
		public enum PlugInsUpdateType
		{
			Force,
			Recommend,
			InstallFirst,
			Other
		}

		public enum MessageBoxType
		{
			OK,
			OKCancel,
			YesNo,
			YesNoCancel,
			Cash_Load,
			Cash_Wait,
			Other
		}

		public enum UpdateType
		{
			Success,
			Downloaded,
			Install,
			Other
		}
	}
	public class ButtonEx_Common : UserControl, IComponentConnector
	{
		private SolidColorBrush BgEnable = new SolidColorBrush(Color.FromRgb((byte)57, (byte)156, (byte)237));

		private SolidColorBrush BgUnEnable = new SolidColorBrush(Color.FromRgb((byte)127, (byte)127, (byte)127));

		private SolidColorBrush BgColor = new SolidColorBrush(Color.FromRgb((byte)57, (byte)156, (byte)237));

		private SolidColorBrush BgColorMouseDown = new SolidColorBrush(Color.FromRgb((byte)45, (byte)127, (byte)193));

		public static readonly DependencyProperty ButtonEnableProperty = DependencyProperty.Register("ButtonEnable", typeof(bool), typeof(ButtonEx_Common), new PropertyMetadata((object)true));

		public static readonly DependencyProperty StrButtonTitleProperty = DependencyProperty.Register("StrButtonTitle", typeof(string), typeof(ButtonEx_Common), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty ButtonHeightProperty = DependencyProperty.Register("ButtonHeight", typeof(double), typeof(ButtonEx_Common), new PropertyMetadata((object)60.0));

		public static readonly DependencyProperty ButtonWidthProperty = DependencyProperty.Register("ButtonWidth", typeof(double), typeof(ButtonEx_Common), new PropertyMetadata((object)200.0));

		public static readonly DependencyProperty CronRadioProperty = DependencyProperty.Register("CronRadio", typeof(double), typeof(ButtonEx_Common), new PropertyMetadata((object)30.0));

		internal ButtonEx_Common buttonEx_Common;

		internal Border ShandowBorder;

		internal Border MainBorder;

		private bool _contentLoaded;

		public bool ButtonEnable
		{
			get
			{
				return (bool)((DependencyObject)this).GetValue(ButtonEnableProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonEnableProperty, (object)value);
				if (value)
				{
					MainBorder.Background = (Brush)(object)BgEnable;
				}
				else
				{
					MainBorder.Background = (Brush)(object)BgUnEnable;
				}
			}
		}

		public string StrButtonTitle
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrButtonTitleProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrButtonTitleProperty, (object)value);
			}
		}

		public double ButtonHeight
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(ButtonHeightProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonHeightProperty, (object)value);
				CronRadio = ButtonWidth / 2.0;
			}
		}

		public double ButtonWidth
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(ButtonWidthProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonWidthProperty, (object)value);
			}
		}

		public double CronRadio
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(CronRadioProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(CronRadioProperty, (object)value);
			}
		}

		public event EventHandler ButtonClick;

		public ButtonEx_Common()
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Expected O, but got Unknown
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Expected O, but got Unknown
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0067: Expected O, but got Unknown
			InitializeComponent();
			InitializeResource();
		}

		private void InitializeResource()
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Expected O, but got Unknown
			((UIElement)MainBorder).MouseDown += new MouseButtonEventHandler(MainBorder_MouseDown);
			((UIElement)MainBorder).MouseUp += new MouseButtonEventHandler(MainBorder_MouseUp);
		}

		private void MainBorder_MouseUp(object sender, MouseButtonEventArgs e)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			if (ButtonEnable)
			{
				MainBorder.BorderThickness = new Thickness(0.0);
				MainBorder.Background = (Brush)(object)BgColor;
				((UIElement)ShandowBorder).Visibility = (Visibility)0;
			}
		}

		private void MainBorder_MouseDown(object sender, MouseButtonEventArgs e)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			if (ButtonEnable)
			{
				MainBorder.BorderThickness = new Thickness(3.0);
				MainBorder.Background = (Brush)(object)BgColorMouseDown;
				((UIElement)ShandowBorder).Visibility = (Visibility)2;
				if (this.ButtonClick != null)
				{
					this.ButtonClick(this, (EventArgs)(object)e);
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
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/buttonex_common.xaml", UriKind.Relative);
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
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				buttonEx_Common = (ButtonEx_Common)target;
				break;
			case 2:
				ShandowBorder = (Border)target;
				break;
			case 3:
				MainBorder = (Border)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class WindowUpdateTip : Window, IComponentConnector
	{
		private bool _contentLoaded;

		public WindowUpdateTip()
		{
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected O, but got Unknown
			InitializeComponent();
			((FrameworkElement)this).Loaded += new RoutedEventHandler(WindowUpdateTip_Loaded);
		}

		private void WindowUpdateTip_Loaded(object sender, RoutedEventArgs e)
		{
			InitialResource();
		}

		private void InitialResource()
		{
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Expected O, but got Unknown
			DependencyObject templateChild = ((FrameworkElement)this).GetTemplateChild("MainGrid");
			Grid val = (Grid)(object)((templateChild is Grid) ? templateChild : null);
			if (val != null)
			{
				((UIElement)val).MouseDown += new MouseButtonEventHandler(gridMain_MouseDown);
			}
		}

		private void gridMain_MouseDown(object sender, MouseButtonEventArgs e)
		{
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/windowupdatetip.xaml", UriKind.Relative);
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
	public class ViewModelBase : INotifyPropertyChanged
	{
		public event PropertyChangedEventHandler PropertyChanged;

		protected void OnPropertyChanged(string propertyName)
		{
			if (this.PropertyChanged != null)
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	public class App : Application, ISingleInstanceApp, IComponentConnector
	{
		private const string UniqueEventName = "rescue_and_smart_assistant_unique_event_name";

		private const string UniqueMutexName = "rescue_and_smart_assistant_unique_mutext_name";

		private static EventWaitHandle eventWaitHandle;

		private static Mutex mutex;

		public static readonly string Category = "lmsa-host";

		private static object shutdownSelfLock = new object();

		private static volatile bool isShutdownSelf = false;

		private bool _contentLoaded;

		[STAThread]
		[HandleProcessCorruptedStateExceptions]
		public static void Main(string[] args)
		{
			mutex = new Mutex(initiallyOwned: true, "rescue_and_smart_assistant_unique_mutext_name", out var createdNew);
			GC.KeepAlive(mutex);
			eventWaitHandle = new EventWaitHandle(initialState: false, EventResetMode.AutoReset, "rescue_and_smart_assistant_unique_event_name");
			if (args.Length != 0 && args[0].Contains("restart"))
			{
				createdNew = true;
			}
			string pipeName = "softwarerescue_and_smart_assistant_unique_event_name";
			if (createdNew)
			{
				Thread thread = new Thread((ThreadStart)delegate
				{
					while (eventWaitHandle.WaitOne())
					{
						((DispatcherObject)Application.Current).Dispatcher.BeginInvoke((Delegate)(Action)delegate
						{
							//IL_001d: Unknown result type (might be due to invalid IL or missing references)
							//IL_0023: Invalid comparison between Unknown and I4
							if (Application.Current.MainWindow != null)
							{
								if ((int)Application.Current.MainWindow.WindowState == 1)
								{
									Application.Current.MainWindow.WindowState = (WindowState)0;
								}
								Application.Current.MainWindow.Activate();
								Application.Current.MainWindow.Topmost = true;
								Application.Current.MainWindow.Topmost = false;
								((UIElement)Application.Current.MainWindow).Focus();
							}
						}, Array.Empty<object>());
					}
				})
				{
					IsBackground = true
				};
				thread.Start();
				Thread thread2 = new Thread((ThreadStart)delegate
				{
					while (true)
					{
						int num = 0;
						try
						{
							using NamedPipeServerStream namedPipeServerStream = new NamedPipeServerStream(pipeName, PipeDirection.In);
							LogHelper.LogInstance.Info("Pipeline create Success!");
							namedPipeServerStream.WaitForConnection();
							using StreamReader streamReader = new StreamReader(namedPipeServerStream);
							string message = streamReader.ReadToEnd();
							((DispatcherObject)Application.Current).Dispatcher.BeginInvoke((Delegate)(Action)delegate
							{
								Application current = Application.Current;
								if (((current != null) ? current.MainWindow : null) is SplashScreenWindow splashScreenWindow)
								{
									LogHelper.LogInstance.Debug("recieve message : " + message + " successfully!");
									splashScreenWindow.LenovoIDOauthCallBack(message);
								}
							}, Array.Empty<object>());
						}
						catch (IOException ex) when (num < 3)
						{
							num++;
							int num2 = 200 * num;
							LogHelper.LogInstance.Warn($"Pipeline creation failed [{ex.Message}], {num2}ms retry later");
							Thread.Sleep(num2);
						}
						catch (Exception arg2)
						{
							LogHelper.LogInstance.Error($"Failed to receive LenovoId verification message,ex:{arg2}");
							break;
						}
					}
				})
				{
					IsBackground = true
				};
				thread2.Start();
				App app = new App();
				((Application)app).ShutdownMode = (ShutdownMode)1;
				App app2 = app;
				app2.InitializeComponent();
				((Application)app2).Run();
				return;
			}
			string text = ((args.Length != 0) ? string.Join(" ", args) : string.Empty);
			if (!string.IsNullOrEmpty(text) && text.StartsWith("SoftwareFix://callback", StringComparison.CurrentCultureIgnoreCase))
			{
				try
				{
					using NamedPipeClientStream namedPipeClientStream = new NamedPipeClientStream(".", pipeName, PipeDirection.Out);
					namedPipeClientStream.Connect(1000);
					using StreamWriter streamWriter = new StreamWriter(namedPipeClientStream);
					streamWriter.Write(text);
					streamWriter.Flush();
					LogHelper.LogInstance.Info("Sending LenovoId verification message...");
				}
				catch (Exception arg)
				{
					LogHelper.LogInstance.Error($"Failed to send LenovoId verification message,ex:{arg}");
				}
			}
			eventWaitHandle.Set();
		}

		public bool SignalExternalCommandLineArgs(IList<string> args)
		{
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Invalid comparison between Unknown and I4
			if (args != null && !args.Contains("restart"))
			{
				if (((Application)this).MainWindow != null)
				{
					if ((int)((Application)this).MainWindow.WindowState == 1)
					{
						((Application)this).MainWindow.WindowState = (WindowState)0;
					}
					((Application)this).MainWindow.Activate();
				}
				return true;
			}
			return false;
		}

		protected override void OnExit(ExitEventArgs e)
		{
			RsaServiceHelper.PostUserBehavior();
			List<string> list = (from n in Dns.GetHostAddresses(Dns.GetHostName())
				where n.AddressFamily == AddressFamily.InterNetwork
				select n.ToString()).ToList();
			LogHelper.LogInstance.Info("========================== LMSA client application is closing: Dispose Resource And Exit The Application ===================== ");
			((Application)this).OnExit(e);
			Environment.Exit(0);
		}

		protected override void OnStartup(StartupEventArgs e)
		{
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Expected O, but got Unknown
			LogHelper.LogInstance.Info("========================== LMSA client application is starting(v" + LMSAContext.MainProcessVersion + ") ==========================");
			ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
			Environment.CurrentDirectory = AppDomain.CurrentDomain.BaseDirectory;
			Application.Current.DispatcherUnhandledException += new DispatcherUnhandledExceptionEventHandler(Application_DispatcherUnhandledException);
			AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException;
			TaskScheduler.UnobservedTaskException += TaskScheduler_UnobservedTaskException;
			((Application)this).OnStartup(e);
			SetRegister();
			AppContext.Init();
			long hardDiskFreeSpace = HardDisk.GetHardDiskFreeSpace(Environment.GetEnvironmentVariable("systemdrive"));
			if (hardDiskFreeSpace < 1073741824)
			{
				MessageBoxV6 messageBoxV = new MessageBoxV6();
				messageBoxV.Init("K0071", "K0985", "K0327", null, isCloseBtn: false, (MessageBoxImage)48);
				((Window)messageBoxV).WindowStartupLocation = (WindowStartupLocation)1;
				((Window)messageBoxV).ShowDialog();
				return;
			}
			TryStartNtserviceMonitorTask();
			DealOldVersionData();
			string text = Path.Combine(Environment.SystemDirectory, "netsh.exe");
			string command = "\"" + text + "\" advfirewall firewall delete rule name=\"lenovo.mbg.service.lmsa\"";
			Task.Run(() => ProcessRunner.Shell(command, Path.Combine(Environment.SystemDirectory, "cmd.exe")));
			SplashScreenWindow splashScreenWindow = (SplashScreenWindow)(object)(((Application)this).MainWindow = (Window)(object)new SplashScreenWindow());
			((Window)splashScreenWindow).ShowDialog();
		}

		private static void TaskScheduler_UnobservedTaskException(object sender, UnobservedTaskExceptionEventArgs e)
		{
			try
			{
				LogHelper.LogInstance.Error($"TaskScheduler unhandled exception:e instance info{e}, exception:{e.Exception}");
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Save taskScheduler unhandled exception failed:" + ex);
			}
			finally
			{
				e.SetObserved();
			}
		}

		private static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
		{
			try
			{
				LogHelper.LogInstance.Error($"appdomain unhandled exception:e instance info:{e}, exceptionObj:{e.ExceptionObject}");
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Save appdomain unhandled exception failed:" + ex);
			}
			finally
			{
			}
		}

		private static void Application_DispatcherUnhandledException(object sender, DispatcherUnhandledExceptionEventArgs e)
		{
			try
			{
				LogHelper.LogInstance.Error($"Application dispatcher unhandled e instance info:{e}, exception:{e.Exception}");
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Save application dispatcher unhandled exception:" + ex);
			}
			finally
			{
				e.Handled = true;
			}
		}

		private static void ShutdownSelfWhithUnhandledException()
		{
			if (isShutdownSelf)
			{
				return;
			}
			lock (shutdownSelfLock)
			{
				if (isShutdownSelf)
				{
					return;
				}
				LogHelper.LogInstance.Info("Unhandle exception occur, will shutdown self");
				isShutdownSelf = true;
				Application current = Application.Current;
				if (current != null && ((DispatcherObject)current).Dispatcher != null)
				{
					((DispatcherObject)current).Dispatcher.Invoke((Action)delegate
					{
						current.ShutdownMode = (ShutdownMode)2;
						Window mainWindow = current.MainWindow;
						if (mainWindow != null)
						{
							mainWindow.Close();
						}
						current.Shutdown(101);
					});
				}
				Environment.Exit(101);
			}
		}

		private static void SetRegister()
		{
			Task.Factory.StartNew(delegate
			{
				string moduleName = Process.GetCurrentProcess().MainModule.ModuleName;
				if (Environment.Is64BitOperatingSystem)
				{
					Registry.SetValue("HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Internet Explorer\\MAIN\\FeatureControl\\FEATURE_BROWSER_EMULATION", moduleName, 11001, RegistryValueKind.DWord);
				}
				else
				{
					Registry.SetValue("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Internet Explorer\\MAIN\\FeatureControl\\FEATURE_BROWSER_EMULATION", moduleName, 11001, RegistryValueKind.DWord);
				}
			});
		}

		private void TryStartNtserviceMonitorTask()
		{
			Task.Run(delegate
			{
				using PipeClientService pipeClientService = new PipeClientService();
				try
				{
					while (!GlobalFun.CheckServerIsRunning("LmsaWindowsService"))
					{
						Thread.Sleep(500);
					}
					pipeClientService.Create(5000);
					pipeClientService.Send(PipeMessage.LMSA_RUNNING, true);
				}
				catch (Exception exception)
				{
					LogHelper.LogInstance.Error("Start NT Service failed", exception);
				}
			});
		}

		private void DealOldVersionData()
		{
			UserConfigHleper.Instance.MigrateDataToOptions();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/app.xaml", UriKind.Relative);
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
	public class ApplcationClass
	{
		private static volatile ApplcationClass _instance = null;

		private static readonly object lockHelper = new object();

		private static XmlPluginData m_xmlPluginData = null;

		private static readonly string s_PluginFlashScreenName = "lmsa-plugin-Flash";

		private static readonly string s_PluginDeviceScreenName = "lmsa-plugin-Device-main";

		private static readonly string s_PluginSupportScreenName = "lmsa-plugin-Support-main";

		private static readonly string s_PluginForumScreenName = "lmsa-plugin-Forum";

		private static readonly string s_PluginMessengerScreenName = "lmsa-plugin-Messenger";

		private static readonly string s_PluginTipsScreenName = "lmsa-plugin-Tips";

		private static readonly string s_PluginToolboxScreenName = "lmsa-plugin-Toolbox-main";

		private static readonly string s_PluginDefaultScreenName = "lmsa-host";

		public static bool ForceUpdate = false;

		public static bool isAddPlugIning = false;

		private static bool frameHasNewVersion = false;

		private static Plugin lastSelectedPlugin = null;

		private static bool isUpdatingPlug;

		public static MainWindow ApplcationStartWindow { get; set; }

		public static ContentPresenter ContentPresenterPlugin { get; set; }

		public static PopupEx NonTopmostPopup { get; set; }

		public static IPlugin CurrentPlugin { get; private set; }

		public static bool manualTrigger { get; set; }

		public static List<PluginModel> AvailablePlugins { get; set; }

		public static DownloadControlViewModel DownloadViewModel { get; set; }

		public static bool IsExecuteWork
		{
			get
			{
				if (AvailablePlugins == null)
				{
					return false;
				}
				return AvailablePlugins.Count((PluginModel n) => n.Plugin != null && n.Plugin.IsExecuteWork()) > 0;
			}
		}

		public static string PluginsConfig => Path.Combine(AppDomain.CurrentDomain.BaseDirectory, ConfigurationManager.AppSettings["PluginsConfig"].ToString());

		public static string PluginsPath => Path.Combine(AppDomain.CurrentDomain.BaseDirectory, ConfigurationManager.AppSettings["PluginsPath"].ToString());

		public static string PluginsIconFolderPath => Path.Combine(AppDomain.CurrentDomain.BaseDirectory, ConfigurationManager.AppSettings["PluginsIconFolderPath"].ToString());

		public static string AplicationDocPath => Path.Combine(AppDomain.CurrentDomain.BaseDirectory, ConfigurationManager.AppSettings["ApplicationDoc"].ToString());

		public static AbstractDataBase PluginDataBase
		{
			get
			{
				if (m_xmlPluginData == null)
				{
					m_xmlPluginData = new XmlPluginData(PluginsConfig, PluginsPath);
				}
				return m_xmlPluginData;
			}
		}

		public static string DownloadPath
		{
			get
			{
				string text = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, ConfigurationManager.AppSettings["DownloadPath"].ToString());
				if (!Directory.Exists(text))
				{
					Directory.CreateDirectory(text);
				}
				return text;
			}
		}

		public static string ToolNewVersionConfig => ConfigurationManager.AppSettings["ToolNewVersionConfig"].ToString();

		public static string PluginNewVersionConfig => ConfigurationManager.AppSettings["PluginNewVersionConfig"].ToString();

		public static string VersionDownloadUrlHeader => ConfigurationManager.AppSettings["DownloadUrlHeader"].ToString();

		public static Ellipse NewVersionTip { get; set; }

		public static bool FrameHasNewVersion
		{
			get
			{
				return frameHasNewVersion;
			}
			set
			{
				frameHasNewVersion = value;
				if (NewVersionTip != null)
				{
					((UIElement)NewVersionTip).Visibility = (Visibility)((!frameHasNewVersion) ? 2 : 0);
				}
			}
		}

		public static Plugin LastSelectedPlugin
		{
			get
			{
				return lastSelectedPlugin;
			}
			set
			{
				lastSelectedPlugin = value;
			}
		}

		public static bool IsUpdatingPlug
		{
			get
			{
				return isUpdatingPlug;
			}
			set
			{
				isUpdatingPlug = value;
			}
		}

		public static PluginVersionModel NewPluginModel { get; set; }

		public static List<PluginVersionModel> m_haveNewVesrionList { get; set; }

		private ApplcationClass()
		{
		}

		private static void CreateScreenView(string pluginName, string pluginVersion)
		{
			string empty = string.Empty;
			empty = pluginName.ToLower() switch
			{
				"rescue" => s_PluginFlashScreenName, 
				"my device" => s_PluginDeviceScreenName, 
				"support" => s_PluginSupportScreenName, 
				"toolbox" => s_PluginToolboxScreenName, 
				"forum" => s_PluginForumScreenName, 
				"tips" => s_PluginTipsScreenName, 
				"chat" => s_PluginMessengerScreenName, 
				_ => s_PluginDefaultScreenName, 
			};
			if (!string.IsNullOrEmpty(empty))
			{
				global::Smart.GoogleAnalyticsTracker.Tracker.ScreenName = empty;
				global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateScreenView().Set("av", pluginVersion).Build());
			}
		}

		public static ApplcationClass CreateInstance()
		{
			if (_instance == null)
			{
				lock (lockHelper)
				{
					if (_instance == null)
					{
						_instance = new ApplcationClass();
					}
				}
			}
			return _instance;
		}

		public static void ShowCrashPanel(UIElement ui)
		{
		}

		public static void HideCrashPanel()
		{
		}

		public static void SetContentPresenterPlugin(UIElement uielement)
		{
			if (ContentPresenterPlugin != null)
			{
				ContentPresenterPlugin.Content = null;
				ContentPresenterPlugin.Content = uielement;
			}
		}
	}
	public class MainWindow : Window, IMessageBox, IComponentConnector, IStyleConnector
	{
		private const int WM_CLOSE = 16;

		private const int WM_SYSCOMMAND = 274;

		private const int SC_CLOSE = 61536;

		private const int SC_MINIMIZE = 61472;

		private Storyboard PinStoryboard;

		private DevConnectView devConnWnd = null;

		private object asynic_loc = new object();

		protected static List<ComboboxViewModel> MultiFlashTutorialQuestions = new List<ComboboxViewModel>();

		protected static bool TutorialLock = false;

		private static SurveyWindowV6 SurveyUI;

		public bool IsBackupOrRestory = false;

		internal MainWindow mainWindow;

		internal LangButton btnBuy;

		internal Button btnIconDriver;

		internal UserOperationMenuV6 help;

		internal NoticeManagementViewV6 notice;

		internal Button btnDownload;

		internal UserOperationMenuV6 setting;

		internal UserOperationMenuV6 user;

		internal Button minbtn;

		internal Button closebtn;

		internal Popup popup;

		internal DeviceConnectView devicelist;

		internal Border mutilicons;

		internal ListBox Plugin;

		internal Image validcode;

		internal ContentControl mainWindowContent;

		internal Image Logo;

		internal Button feedback;

		internal Grid DownLoadCenterHere;

		internal Image imgLoading;

		internal RotateTransform imgLoadingAnimatedRotateTrans;

		internal Border MaskGrid;

		internal Border banner;

		internal Button couponborder;

		internal Border mutiltutorials;

		internal ListView tutorialsList;

		internal Grid downloadGrid;

		internal RadioButton rbtn;

		internal ListBox DownLoadListBox;

		private bool _contentLoaded;

		public MainWindow()
		{
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Expected O, but got Unknown
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0067: Expected O, but got Unknown
			ApplcationClass.ApplcationStartWindow = this;
			InitializeComponent();
			InitPinAnimation();
			((FrameworkElement)this).DataContext = MainWindowViewModel.SingleInstance;
			((FrameworkElement)this).Loaded += new RoutedEventHandler(MainWindow_Loaded);
			((FrameworkElement)this).Unloaded += new RoutedEventHandler(MainWindow_Unloaded);
			((Window)this).WindowStartupLocation = (WindowStartupLocation)1;
			OnRbtnChecked(rbtn, null);
			devConnWnd = new DevConnectView();
			global::Smart.DeviceManagerEx.ValidateCodeFunc = delegate(Task task, string id)
			{
				LogHelper.LogInstance.Info("====>>" + id + " show validate code window!");
				Task.Run(delegate
				{
					((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
					{
						//IL_0007: Unknown result type (might be due to invalid IL or missing references)
						//IL_000d: Invalid comparison between Unknown and I4
						if ((int)((Window)this).WindowState == 1)
						{
							((Window)this).WindowState = (WindowState)0;
						}
						devConnWnd.ShowWnd(id);
					});
				});
				bool result = task.Wait(50000);
				((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
				{
					devConnWnd.HideWnd(id);
				});
				LogHelper.LogInstance.Info("====>>" + id + " close validate code window!");
				return result;
			};
		}

		private void InitPinAnimation()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Expected O, but got Unknown
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Expected O, but got Unknown
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			//IL_003f: Expected O, but got Unknown
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Expected O, but got Unknown
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0089: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c3: Expected O, but got Unknown
			PinStoryboard = new Storyboard();
			ObjectAnimationUsingKeyFrames val = new ObjectAnimationUsingKeyFrames();
			val.KeyFrames.Add((ObjectKeyFrame)new DiscreteObjectKeyFrame((object)GlobalFun.LoadBitmap("pack://application:,,,/Software Fix;component/ResourceV6/main_security.png"), KeyTime.FromTimeSpan(TimeSpan.FromSeconds(0.0))));
			val.KeyFrames.Add((ObjectKeyFrame)new DiscreteObjectKeyFrame((object)GlobalFun.LoadBitmap("pack://application:,,,/Software Fix;component/ResourceV6/main_pin.png"), KeyTime.FromTimeSpan(TimeSpan.FromSeconds(3.0))));
			((Timeline)val).Duration = new Duration(TimeSpan.FromSeconds(6.0));
			((Timeline)val).RepeatBehavior = RepeatBehavior.Forever;
			((TimelineGroup)PinStoryboard).Children.Add((Timeline)(object)val);
			Storyboard.SetTarget((DependencyObject)(object)val, (DependencyObject)(object)validcode);
			Storyboard.SetTargetProperty((DependencyObject)(object)val, new PropertyPath((object)Image.SourceProperty));
			PinStoryboard.Begin((FrameworkElement)(object)validcode, true);
		}

		private void MainWindow_Unloaded(object sender, RoutedEventArgs e)
		{
			global::Smart.DeviceManagerEx.ValidateCodeFunc = null;
		}

		protected override void OnSourceInitialized(EventArgs e)
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Expected O, but got Unknown
			((Window)this).OnSourceInitialized(e);
			PresentationSource obj = PresentationSource.FromVisual((Visual)(object)this);
			HwndSource val = (HwndSource)(object)((obj is HwndSource) ? obj : null);
			if (val != null)
			{
				val.AddHook(new HwndSourceHook(WndProc));
			}
		}

		private IntPtr WndProc(IntPtr hwnd, int msg, IntPtr wParam, IntPtr lParam, ref bool handled)
		{
			if (274 == msg)
			{
				if (wParam.ToInt32() == 61536 && lParam.ToInt32() == 0 && (ApplcationClass.IsUpdatingPlug || ApplcationClass.ForceUpdate))
				{
					MainWindowViewModel.SingleInstance.Exit(0);
				}
				if (61472 != wParam.ToInt32())
				{
				}
			}
			if (537 == msg)
			{
				switch (wParam.ToInt32())
				{
				case 32768:
					try
					{
						string comPortName = HardwareHelper.Com.GetComPortName(wParam, lParam);
						string hardwareInfo = HardwareHelper.GetHardwareInfo(HardwareEnum.Win32_PnPEntity, "K0487", comPortName);
					}
					catch (Exception ex)
					{
						LogHelper.LogInstance.Error("Get Hardware info error:" + ex);
					}
					break;
				}
			}
			return IntPtr.Zero;
		}

		private void PreLoadSurveyUI()
		{
			string userId = ((UserService.Single.CurrentLoggedInUser == null) ? string.Empty : UserService.Single.CurrentLoggedInUser.UserId);
			SurveyWindowV6 surveyWindowV = new SurveyWindowV6();
			((FrameworkElement)surveyWindowV).DataContext = new SurveyWindowV2ViewModel(userId);
			SurveyUI = surveyWindowV;
		}

		private void MainWindow_Loaded(object sender, RoutedEventArgs e)
		{
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			Matrix transformToDevice = PresentationSource.FromVisual((Visual)(object)Application.Current.MainWindow).CompositionTarget.TransformToDevice;
			((FrameworkElement)this).MaxWidth = (double)Screen.PrimaryScreen.WorkingArea.Width / ((Matrix)(ref transformToDevice)).M11;
			((FrameworkElement)this).MaxHeight = (double)Screen.PrimaryScreen.WorkingArea.Height / ((Matrix)(ref transformToDevice)).M22;
			((Window)this).WindowState = (WindowState)0;
			((Window)devConnWnd).Owner = (Window)(object)this;
			MainWindowViewModel.SingleInstance.Initialize();
			((DispatcherObject)Application.Current).Dispatcher.BeginInvoke((Delegate)new Action(PreLoadSurveyUI), (DispatcherPriority)4, Array.Empty<object>());
			Task.Run(delegate
			{
				string qFeedbackRespStr = AppContext.WebApi.RequestBase(WebApiUrl.FEEDBACK_GET_ISSUE_INFO, null, 0).content?.ToString();
				FeedbackMainViewModelV6.QFeedbackRespStr = qFeedbackRespStr;
			});
			((UIElement)btnBuy).Visibility = (Visibility)((!UserService.Single.CurrentLoggedInUser.B2BBuyNowDisplay) ? 2 : 0);
			MainWindowViewModel.SingleInstance.UserOperation.MenuItems[1].ItemVisibility = (Visibility)((!UserService.Single.CurrentLoggedInUser.B2BEntranceEnable) ? 2 : 0);
			((FrameworkElement)downloadGrid).DataContext = DownloadControlViewModel.SingleInstance;
			((Window)this).Closing += MainWindow_Closing;
		}

		private void MainWindow_Closing(object sender, CancelEventArgs e)
		{
			if (ApplcationClass.IsExecuteWork)
			{
				MessageWindowHelper.Instance.Show(null, "K0852", "K0327", null, showClose: false, (MessageBoxImage)48, null, isPrivacy: false, showNow: false, isAsynnc: true, null, null, null, null, true);
				e.Cancel = true;
			}
		}

		protected override void OnStateChanged(EventArgs e)
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Invalid comparison between Unknown and I4
			((Window)this).OnStateChanged(e);
			if (MainWindowViewModel.SingleInstance.DeletePersonalDataViewModel.IsShowDeletePersonalDataGuidePopup)
			{
				if ((int)((Window)this).WindowState == 1)
				{
					MainWindowViewModel.SingleInstance.DeletePersonalDataViewModel.IsShowDeletePersonalDataGuide = false;
				}
				else
				{
					MainWindowViewModel.SingleInstance.DeletePersonalDataViewModel.IsShowDeletePersonalDataGuide = true;
				}
			}
		}

		protected override void OnActivated(EventArgs e)
		{
		}

		private void downloadTipsPopupClick(object sender, RoutedEventArgs e)
		{
			((Popup)ApplcationClass.NonTopmostPopup).IsOpen = false;
		}

		private void OnBtnHelp(object sender, RoutedEventArgs e)
		{
			string clientHelpUrl = new MenuPopupWindowBusiness().GetClientHelpUrl();
			GlobalFun.OpenUrlByBrowser(clientHelpUrl);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			WebView2Helper.Instance.DisposeAll();
			MainWindowViewModel.SingleInstance.CloseWindow();
		}

		private void OnLeftBtnDown(object sender, MouseButtonEventArgs e)
		{
			((Window)this).DragMove();
		}

		private void OnBtnMax(object sender, RoutedEventArgs e)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Invalid comparison between Unknown and I4
			if ((int)((Window)this).WindowState == 0)
			{
				((Window)this).WindowState = (WindowState)2;
			}
			else
			{
				((Window)this).WindowState = (WindowState)0;
			}
		}

		private void OnBtnMin(object sender, RoutedEventArgs e)
		{
			((Window)this).WindowState = (WindowState)1;
		}

		private void OnBtnFeedback(object sender, RoutedEventArgs e)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuFeedbackButtonClick", "menu-feedback button click", 0L).Build());
			HostProxy.HostOperationService.ShowFeedBack();
		}

		private void OnBtnBuyNow(object sender, RoutedEventArgs e)
		{
			OrderBuyView orderBuyView = new OrderBuyView();
			((Window)orderBuyView).ShowDialog();
		}

		private void OnBtnDownLoadCenter(object sender, RoutedEventArgs e)
		{
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000e: Invalid comparison between Unknown and I4
			ShowDownloadCenter((int)((UIElement)downloadGrid).Visibility == 2);
		}

		private void OnValidateCode(object sender, MouseButtonEventArgs e)
		{
			devConnWnd.Display();
		}

		private void LoadBrandAnimation()
		{
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Expected O, but got Unknown
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Expected O, but got Unknown
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Expected O, but got Unknown
			//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e1: Expected O, but got Unknown
			Storyboard storyboard = new Storyboard();
			ObjectAnimationUsingKeyFrames val = new ObjectAnimationUsingKeyFrames();
			val.KeyFrames.Add((ObjectKeyFrame)new DiscreteObjectKeyFrame((object)GlobalFun.LoadBitmap("pack://application:,,,/Software Fix;component/ResourceV6/LLogo.png"), KeyTime.FromTimeSpan(TimeSpan.FromSeconds(0.0))));
			val.KeyFrames.Add((ObjectKeyFrame)new DiscreteObjectKeyFrame((object)GlobalFun.LoadBitmap("pack://application:,,,/Software Fix;component/ResourceV6/MLogo.png"), KeyTime.FromTimeSpan(TimeSpan.FromSeconds(3.0))));
			((Timeline)val).Duration = new Duration(TimeSpan.FromSeconds(6.0));
			((Timeline)val).RepeatBehavior = RepeatBehavior.Forever;
			((TimelineGroup)storyboard).Children.Add((Timeline)(object)val);
			Storyboard.SetTarget((DependencyObject)(object)val, (DependencyObject)(object)Logo);
			Storyboard.SetTargetProperty((DependencyObject)(object)val, new PropertyPath((object)Image.SourceProperty));
			((UIElement)Logo).IsVisibleChanged += (DependencyPropertyChangedEventHandler)delegate(object sender, DependencyPropertyChangedEventArgs e)
			{
				if ((bool)((DependencyPropertyChangedEventArgs)(ref e)).NewValue)
				{
					storyboard.Begin();
				}
				else
				{
					storyboard.Pause();
				}
			};
		}

		public void ShowDownloadCenter(bool isShow = true)
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			((DispatcherObject)this).Dispatcher.Invoke<Visibility>((Func<Visibility>)delegate
			{
				//IL_0018: Unknown result type (might be due to invalid IL or missing references)
				//IL_001f: Unknown result type (might be due to invalid IL or missing references)
				Grid obj = downloadGrid;
				int num = ((!isShow) ? 2 : 0);
				Visibility result = (Visibility)num;
				((UIElement)obj).Visibility = (Visibility)num;
				return result;
			});
		}

		public void SelRegistedDevIfExist(string category, Action<string> callBack = null)
		{
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				RegisterDevView wnd = new RegisterDevView("K0067");
				if (wnd.IsExistRegistedDev(category))
				{
					Task.Run(delegate
					{
						if (MessageWindowHelper.Instance.Show(wnd, true).Result == true)
						{
							RegistedDevModel selRegistedDev = wnd.GetSelRegistedDev();
							if (selRegistedDev.Brand.Equals("Motorola", StringComparison.CurrentCultureIgnoreCase))
							{
								callBack?.Invoke(selRegistedDev.MotoModelName);
							}
							else
							{
								callBack?.Invoke(selRegistedDev.ModelName);
							}
						}
					});
				}
			});
		}

		public void CallMotoCare(string imei, object wModel)
		{
			if (!string.IsNullOrEmpty(imei) && wModel is WarrantyInfoBaseModel warrantyInfoBaseModel)
			{
				warrantyInfoBaseModel.imei = imei;
				MainWindowViewModel.SingleInstance.ShowBanner(warrantyInfoBaseModel);
			}
		}

		public async Task ShowB2BExpired(int _modeType)
		{
			((UIElement)btnBuy).Visibility = (Visibility)0;
			await MessageWindowHelper.Instance.Show(new OrderExpiredView(_modeType), true).ContinueWith(delegate
			{
				UserService.Single.SaveB2BBuyNowButtonDisplay();
			});
		}

		public async Task ShowB2BRemind(int used, int total)
		{
			((UIElement)btnBuy).Visibility = (Visibility)0;
			await MessageWindowHelper.Instance.Show(new OrderRemindView(used, total), true).ContinueWith(delegate
			{
				UserService.Single.SaveB2BBuyNowButtonDisplay();
			});
		}

		public void SetDeviceConnectIconStatus(int _status)
		{
			if (_status == 99)
			{
				DeviceConnectViewModel.Instance.ShowConnectedDeviceIcon();
			}
			else
			{
				DeviceConnectViewModel.Instance.Status = _status;
			}
		}

		public void ShowMutilIcon(bool showIcon, bool showList)
		{
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				((UIElement)mutilicons).Visibility = (Visibility)((!showIcon) ? 2 : 0);
				((UIElement)devicelist).Visibility = (Visibility)((!showList) ? 2 : 0);
			});
		}

		public void ChangeIsEnabled(bool isEnabled, string pluginId)
		{
			if (HostProxy.HostNavigation.CurrentPluginID != pluginId)
			{
				return;
			}
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				help.ChangeIsEnabled(isEnabled);
				notice.ChangeIsEnabled(isEnabled);
				setting.ChangeIsEnabled(isEnabled);
				user.ChangeIsEnabled(isEnabled);
				((UIElement)btnDownload).IsEnabled = isEnabled;
				((UIElement)btnDownload).Opacity = (isEnabled ? 1.0 : 0.3);
				((UIElement)minbtn).IsEnabled = isEnabled;
				((UIElement)minbtn).Opacity = (isEnabled ? 1.0 : 0.3);
				((UIElement)closebtn).IsEnabled = isEnabled;
				((UIElement)closebtn).Opacity = (isEnabled ? 1.0 : 0.3);
				((UIElement)validcode).IsEnabled = isEnabled;
				((UIElement)validcode).Opacity = (isEnabled ? 1.0 : 0.3);
				((UIElement)feedback).IsEnabled = isEnabled;
				((UIElement)feedback).Opacity = (isEnabled ? 1.0 : 0.3);
				((UIElement)btnBuy).IsEnabled = isEnabled;
				((UIElement)btnBuy).Opacity = (isEnabled ? 1.0 : 0.3);
				foreach (PluginModel item in MainWindowViewModel.SingleInstance.PluginArr)
				{
					if (!isEnabled)
					{
						if (item.Info.PluginID != HostProxy.HostNavigation.CurrentPluginID)
						{
							item.IsEnabled = isEnabled;
						}
					}
					else
					{
						item.IsEnabled = isEnabled;
					}
				}
			});
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			DownloadControlViewModel.SingleInstance.ModifyButtonDownloadPath();
		}

		private void OnRbtnChecked(object sender, RoutedEventArgs e)
		{
			if (DownLoadListBox != null)
			{
				RadioButton val = (RadioButton)((sender is RadioButton) ? sender : null);
				((FrameworkElement)DownLoadListBox).DataContext = DownloadControlViewModel.SingleInstance;
				if (Convert.ToBoolean(((FrameworkElement)val).Tag))
				{
					ListBox downLoadListBox = DownLoadListBox;
					object obj = ((FrameworkElement)this).TryFindResource((object)"V6_DownLoadingListBoxItemStyle");
					((ItemsControl)downLoadListBox).ItemContainerStyle = (Style)((obj is Style) ? obj : null);
					((ItemsControl)DownLoadListBox).ItemsSource = DownloadControlViewModel.SingleInstance.DownloadingTasks;
				}
				else
				{
					ListBox downLoadListBox2 = DownLoadListBox;
					object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_DownLoadedListBoxItemStyle");
					((ItemsControl)downLoadListBox2).ItemContainerStyle = (Style)((obj2 is Style) ? obj2 : null);
					((ItemsControl)DownLoadListBox).ItemsSource = DownloadControlViewModel.SingleInstance.DownloadedTasks;
					DownloadControlViewModel.SingleInstance.DeleteInvalidDownloaded();
				}
			}
		}

		public void ShowDownloadCenterHere(bool isShow)
		{
			if (isShow)
			{
				ShowDownloadCenterHere(isShow: false);
			}
			((UIElement)DownLoadCenterHere).Visibility = (Visibility)((!isShow) ? 2 : 0);
		}

		private void OnCloseDownLoadCenter(object sender, RoutedEventArgs e)
		{
			((UIElement)downloadGrid).Visibility = (Visibility)2;
			ShowDownloadCenterHere(isShow: true);
		}

		private void OnBtnDownLoadHere(object sender, RoutedEventArgs e)
		{
			ShowDownloadCenterHere(isShow: false);
		}

		public void SetDriverButtonStatus(string _code)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Invalid comparison between Unknown and I4
			if ((int)((UIElement)btnIconDriver).Visibility == 0)
			{
				((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
				{
					((FrameworkElement)btnIconDriver).Tag = _code;
				});
			}
		}

		public async Task ShowQuitSurvey()
		{
			if (UserService.Single.CurrentLoggedInUser == null)
			{
				return;
			}
			ResponseModel<object> isNeedRespose = AppContext.WebApi.RequestBase(WebApiUrl.GET_IS_NEED_TRIGGER_SURVER, null, 3, null, HttpMethod.GET);
			if (isNeedRespose.success && Convert.ToBoolean(isNeedRespose.content))
			{
				if (SurveyUI != null)
				{
					await MessageWindowHelper.Instance.Show(SurveyUI, true);
					return;
				}
				string userId = ((UserService.Single.CurrentLoggedInUser == null) ? string.Empty : UserService.Single.CurrentLoggedInUser.UserId);
				SurveyWindowV6 win = new SurveyWindowV6();
				((FrameworkElement)win).DataContext = new SurveyWindowV2ViewModel(userId);
				await MessageWindowHelper.Instance.Show(win, true);
			}
		}

		public void ShowB2BPurchaseOverview()
		{
			Plugin.UnselectAll();
			ShowMutilIcon(showIcon: false, showList: true);
			mainWindowContent.Content = new B2BPurchaseOverviewV6();
			((UIElement)mainWindowContent).Visibility = (Visibility)0;
		}

		private void Plugin_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			((UIElement)mainWindowContent).Visibility = (Visibility)2;
		}

		public void ShowMutilTutorials(bool show)
		{
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Invalid comparison between Unknown and I4
			//IL_01c3: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d4: Unknown result type (might be due to invalid IL or missing references)
			Thread.Sleep(new Random().Next(100));
			if (TutorialLock)
			{
				return;
			}
			try
			{
				TutorialLock = true;
				if (show)
				{
					if ((int)((UIElement)mutiltutorials).Visibility == 0)
					{
						return;
					}
					if (MultiFlashTutorialQuestions.Count == 0)
					{
						JObject jObject = AppContext.WebApi.RequestContent<JObject>(WebApiUrl.GET_MUTIL_TUTORIALS_QUESTIONS, new Dictionary<string, string> { 
						{
							"language",
							LMSAContext.CurrentLanguage
						} });
						if (jObject == null)
						{
							return;
						}
						JArray jArray = jObject.Value<JArray>("questions");
						if (jArray != null && jArray.HasValues)
						{
							IEnumerator<JToken> enumerator = jArray.OrderBy((JToken n) => n.Value<int>("order")).GetEnumerator();
							while (enumerator.MoveNext())
							{
								MultiFlashTutorialQuestions.Add(new ComboboxViewModel
								{
									Key = enumerator.Current.Value<int>("order"),
									Content = enumerator.Current.Value<string>("question"),
									ExtendData = enumerator.Current.Value<string>("questionUrl")
								});
							}
						}
					}
					((FrameworkElement)this).Width = 1470.0;
					((UIElement)mutiltutorials).Visibility = (Visibility)0;
					((ItemsControl)tutorialsList).ItemsSource = MultiFlashTutorialQuestions;
				}
				else
				{
					((FrameworkElement)this).Width = 1012.0;
					((UIElement)mutiltutorials).Visibility = (Visibility)2;
				}
				Screen val = Screen.FromHandle(new WindowInteropHelper((Window)(object)this).Handle);
				Graphics val2 = Graphics.FromHwnd(new WindowInteropHelper((Window)(object)this).Handle);
				double num = val2.DpiX / 96f;
				double num2 = val2.DpiY / 96f;
				((Window)this).Left = (double)val.Bounds.Left / num + ((double)val.Bounds.Width / num - ((FrameworkElement)this).ActualWidth) / 2.0;
				((Window)this).Top = (double)val.Bounds.Top / num2 + ((double)val.Bounds.Height / num2 - ((FrameworkElement)this).ActualHeight) / 2.0;
			}
			finally
			{
				TutorialLock = false;
			}
		}

		private void MutilTutorialsCloseClick(object sender, RoutedEventArgs e)
		{
			ShowMutilTutorials(show: false);
		}

		private void MutilTutorialsItemClick(object sender, MouseButtonEventArgs e)
		{
			ComboboxViewModel comboboxViewModel = null;
			if (((RoutedEventArgs)e).Source is LangTextBlock langTextBlock)
			{
				comboboxViewModel = ((FrameworkElement)langTextBlock).DataContext as ComboboxViewModel;
			}
			else if (((RoutedEventArgs)e).Source is LangRun langRun)
			{
				comboboxViewModel = ((FrameworkContentElement)langRun).DataContext as ComboboxViewModel;
			}
			if (comboboxViewModel != null && comboboxViewModel.ExtendData != null)
			{
				GlobalFun.OpenUrlByBrowser(comboboxViewModel.ExtendData.ToString());
			}
		}

		public void ChangePinStoryboard(bool start)
		{
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				if (start)
				{
					InitPinAnimation();
				}
				else
				{
					PinStoryboard.Remove((FrameworkElement)(object)validcode);
					validcode.Source = (ImageSource)(object)GlobalFun.LoadBitmap("pack://application:,,,/Software Fix;component/ResourceV6/main_security.png");
				}
			});
		}

		public void LogOut()
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				LogoutMenuItemViewModel.LogOut(force: true);
			});
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/mainwindow.xaml", UriKind.Relative);
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
			//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ce: Expected O, but got Unknown
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f7: Expected O, but got Unknown
			//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
			//IL_0109: Expected O, but got Unknown
			//IL_0132: Unknown result type (might be due to invalid IL or missing references)
			//IL_013c: Expected O, but got Unknown
			//IL_0149: Unknown result type (might be due to invalid IL or missing references)
			//IL_0153: Expected O, but got Unknown
			//IL_017d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0187: Expected O, but got Unknown
			//IL_0194: Unknown result type (might be due to invalid IL or missing references)
			//IL_019e: Expected O, but got Unknown
			//IL_01a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b1: Unknown result type (might be due to invalid IL or missing references)
			//IL_01bb: Expected O, but got Unknown
			//IL_01c3: Unknown result type (might be due to invalid IL or missing references)
			//IL_01cd: Expected O, but got Unknown
			//IL_01da: Unknown result type (might be due to invalid IL or missing references)
			//IL_01e4: Expected O, but got Unknown
			//IL_01ec: Unknown result type (might be due to invalid IL or missing references)
			//IL_01f6: Expected O, but got Unknown
			//IL_020e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0218: Expected O, but got Unknown
			//IL_021f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0229: Expected O, but got Unknown
			//IL_0236: Unknown result type (might be due to invalid IL or missing references)
			//IL_0240: Expected O, but got Unknown
			//IL_0248: Unknown result type (might be due to invalid IL or missing references)
			//IL_0252: Expected O, but got Unknown
			//IL_025f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0269: Expected O, but got Unknown
			//IL_0271: Unknown result type (might be due to invalid IL or missing references)
			//IL_027b: Expected O, but got Unknown
			//IL_0282: Unknown result type (might be due to invalid IL or missing references)
			//IL_028c: Expected O, but got Unknown
			//IL_0293: Unknown result type (might be due to invalid IL or missing references)
			//IL_029d: Expected O, but got Unknown
			//IL_02aa: Unknown result type (might be due to invalid IL or missing references)
			//IL_02b4: Expected O, but got Unknown
			//IL_02bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_02c6: Expected O, but got Unknown
			//IL_02cc: Unknown result type (might be due to invalid IL or missing references)
			//IL_02dd: Unknown result type (might be due to invalid IL or missing references)
			//IL_02e7: Expected O, but got Unknown
			//IL_02ef: Unknown result type (might be due to invalid IL or missing references)
			//IL_02f9: Expected O, but got Unknown
			//IL_0300: Unknown result type (might be due to invalid IL or missing references)
			//IL_030a: Expected O, but got Unknown
			//IL_0311: Unknown result type (might be due to invalid IL or missing references)
			//IL_031b: Expected O, but got Unknown
			//IL_0322: Unknown result type (might be due to invalid IL or missing references)
			//IL_032c: Expected O, but got Unknown
			//IL_0333: Unknown result type (might be due to invalid IL or missing references)
			//IL_033d: Expected O, but got Unknown
			//IL_0344: Unknown result type (might be due to invalid IL or missing references)
			//IL_034e: Expected O, but got Unknown
			//IL_0354: Unknown result type (might be due to invalid IL or missing references)
			//IL_0360: Unknown result type (might be due to invalid IL or missing references)
			//IL_036a: Expected O, but got Unknown
			//IL_0372: Unknown result type (might be due to invalid IL or missing references)
			//IL_037c: Expected O, but got Unknown
			//IL_0383: Unknown result type (might be due to invalid IL or missing references)
			//IL_038d: Expected O, but got Unknown
			//IL_0394: Unknown result type (might be due to invalid IL or missing references)
			//IL_039e: Expected O, but got Unknown
			//IL_03ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_03b5: Expected O, but got Unknown
			//IL_03b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_03c5: Unknown result type (might be due to invalid IL or missing references)
			//IL_03cf: Expected O, but got Unknown
			//IL_03d4: Unknown result type (might be due to invalid IL or missing references)
			//IL_03de: Expected O, but got Unknown
			//IL_03ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_03f7: Expected O, but got Unknown
			//IL_03fb: Unknown result type (might be due to invalid IL or missing references)
			//IL_0407: Unknown result type (might be due to invalid IL or missing references)
			//IL_0411: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				mainWindow = (MainWindow)target;
				break;
			case 2:
				((UIElement)(DockPanel)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLeftBtnDown);
				break;
			case 3:
				btnBuy = (LangButton)target;
				((ButtonBase)btnBuy).Click += new RoutedEventHandler(OnBtnBuyNow);
				break;
			case 4:
				btnIconDriver = (Button)target;
				break;
			case 5:
				help = (UserOperationMenuV6)target;
				break;
			case 6:
				notice = (NoticeManagementViewV6)target;
				break;
			case 7:
				btnDownload = (Button)target;
				((ButtonBase)btnDownload).Click += new RoutedEventHandler(OnBtnDownLoadCenter);
				break;
			case 8:
				setting = (UserOperationMenuV6)target;
				break;
			case 9:
				user = (UserOperationMenuV6)target;
				break;
			case 10:
				minbtn = (Button)target;
				((ButtonBase)minbtn).Click += new RoutedEventHandler(OnBtnMin);
				break;
			case 11:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnMax);
				break;
			case 12:
				closebtn = (Button)target;
				((ButtonBase)closebtn).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 13:
				popup = (Popup)target;
				break;
			case 14:
				devicelist = (DeviceConnectView)target;
				break;
			case 15:
				mutilicons = (Border)target;
				break;
			case 16:
				Plugin = (ListBox)target;
				((Selector)Plugin).SelectionChanged += new SelectionChangedEventHandler(Plugin_SelectionChanged);
				break;
			case 17:
				validcode = (Image)target;
				((UIElement)validcode).MouseLeftButtonDown += new MouseButtonEventHandler(OnValidateCode);
				break;
			case 18:
				mainWindowContent = (ContentControl)target;
				break;
			case 19:
				Logo = (Image)target;
				break;
			case 20:
				feedback = (Button)target;
				((ButtonBase)feedback).Click += new RoutedEventHandler(OnBtnFeedback);
				break;
			case 21:
				DownLoadCenterHere = (Grid)target;
				break;
			case 22:
				((UIElement)(ContentControl)target).AddHandler(ButtonBase.ClickEvent, (Delegate)new RoutedEventHandler(OnBtnDownLoadHere));
				break;
			case 23:
				imgLoading = (Image)target;
				break;
			case 24:
				imgLoadingAnimatedRotateTrans = (RotateTransform)target;
				break;
			case 25:
				MaskGrid = (Border)target;
				break;
			case 26:
				banner = (Border)target;
				break;
			case 27:
				couponborder = (Button)target;
				break;
			case 28:
				mutiltutorials = (Border)target;
				break;
			case 29:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(MutilTutorialsCloseClick);
				break;
			case 30:
				tutorialsList = (ListView)target;
				break;
			case 32:
				downloadGrid = (Grid)target;
				break;
			case 33:
				rbtn = (RadioButton)target;
				((ToggleButton)rbtn).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			case 34:
				((ToggleButton)(RadioButton)target).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			case 35:
				DownLoadListBox = (ListBox)target;
				break;
			case 36:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 37:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnCloseDownLoadCenter);
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
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Expected O, but got Unknown
			if (connectionId == 31)
			{
				((UIElement)(Border)target).MouseLeftButtonDown += new MouseButtonEventHandler(MutilTutorialsItemClick);
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.UpdateVersion
{
	public class UpdateManager
	{
		private static object locker = new object();

		private static UpdateManager m_instance;

		private UpdateWoker m_toolWorker;

		private UpdateWoker m_pluginWorker = null;

		private UpdateVersionAutoPush m_toolAutoPush;

		public UpdateVersionAutoPush toolAutoPush
		{
			get
			{
				if (m_toolAutoPush == null)
				{
					m_toolAutoPush = new UpdateVersionAutoPush(m_toolWorker);
					return m_toolAutoPush;
				}
				return m_toolAutoPush;
			}
		}

		public static UpdateManager Instance
		{
			get
			{
				if (m_instance == null)
				{
					lock (locker)
					{
						if (m_instance == null)
						{
							m_instance = new UpdateManager();
						}
					}
				}
				return m_instance;
			}
		}

		public UpdateWoker ToolUpdateWorker => m_toolWorker;

		public UpdateWoker PluginUpdateWorker => m_pluginWorker;

		private UpdateManager()
		{
		}

		public void InitializeToolVersionUpdate()
		{
			IVersionData verionData = new ToolVersionDataFromDb();
			IVersionCheck checkVersion = new ToolCheckVersion(verionData);
			IVersionDownload versionDownload = new VersionDownload();
			IVersionInstall versionInstall = new ToolInstall();
			m_toolWorker = new UpdateWoker(checkVersion, versionDownload, versionInstall);
		}
	}
	public class VersionDownload : IVersionDownload
	{
		private GeneralDownloadController controller;

		private long cancelInterlocked = 0L;

		private AbstractDownloadInfo DownloadInfo;

		private bool Canceling => Interlocked.Read(in cancelInterlocked) != 0;

		public event EventHandler<DownloadStatusChangedArgs> OnDownloadStatusChanged;

		public VersionDownload()
		{
			controller = new GeneralDownloadController();
			controller.DownloadStatusChanged = FireDownloadStatusChanged;
		}

		public void Cancel()
		{
			if (Canceling)
			{
				return;
			}
			try
			{
				Interlocked.Exchange(ref cancelInterlocked, 1L);
				controller.Stop(DownloadInfo);
			}
			catch (Exception)
			{
			}
			finally
			{
				Interlocked.Exchange(ref cancelInterlocked, 0L);
			}
		}

		public void DownloadVersion(object data)
		{
			if (data == null)
			{
				return;
			}
			DownloadInfo = data as AbstractDownloadInfo;
			long num = 0L;
			string text = Path.Combine(DownloadInfo.saveLocalPath, DownloadInfo.downloadFileName);
			if (File.Exists(text))
			{
				LogHelper.LogInstance.Info($"lenovo.mbg.service.lmsa.UpdateVersion.VersionDownload: '{text}' Already Exists");
				FileInfo fileInfo = new FileInfo(text);
				num = fileInfo.Length;
				if (num == DownloadInfo.downloadFileSize)
				{
					LogHelper.LogInstance.Info($"lenovo.mbg.service.lmsa.UpdateVersion.VersionDownload: '{text}' Size Equals DownloadFileSize");
					LogHelper.LogInstance.Info("lenovo.mbg.service.lmsa.UpdateVersion.VersionDownload: MD5 Check");
					if (DownloadInfo.downloadMD5.Equals(GlobalFun.GetMd5Hash(text), StringComparison.CurrentCultureIgnoreCase))
					{
						DownloadInfo.downloadStatus = lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.SUCCESS;
						FireDownloadStatusChanged(DownloadInfo);
						return;
					}
				}
				try
				{
					File.Delete(text);
				}
				catch (Exception exception)
				{
					ApplcationClass.IsUpdatingPlug = false;
					LogHelper.LogInstance.Error($"lenovo.mbg.service.lmsa.UpdateVersion.VersionDownload: '{text}' Delete Failed", exception);
					return;
				}
			}
			string text2 = Path.Combine(DownloadInfo.saveLocalPath, DownloadInfo.tempFileName);
			if (File.Exists(text2))
			{
				LogHelper.LogInstance.Info($"'{DownloadInfo.tempFileName}' Already Exists");
				FileInfo fileInfo2 = new FileInfo(text2);
				if (fileInfo2.Length == DownloadInfo.downloadFileSize && DownloadInfo.downloadMD5.Equals(GlobalFun.GetMd5Hash(text2), StringComparison.CurrentCultureIgnoreCase))
				{
					try
					{
						fileInfo2.MoveTo(text);
						DownloadInfo.downloadStatus = lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.SUCCESS;
						FireDownloadStatusChanged(DownloadInfo);
						return;
					}
					catch (Exception exception2)
					{
						ApplcationClass.IsUpdatingPlug = false;
						LogHelper.LogInstance.Error($"'{DownloadInfo.tempFileName}' Rename Failed", exception2);
						return;
					}
				}
			}
			try
			{
				controller.Start(DownloadInfo);
			}
			catch (Exception exception3)
			{
				ApplcationClass.IsUpdatingPlug = false;
				LogHelper.LogInstance.Error("lenovo.mbg.service.lmsa.UpdateVersion.VersionDownload: Download Exception", exception3);
			}
		}

		private void FireDownloadStatusChanged(AbstractDownloadInfo downloadInfo)
		{
			if (this.OnDownloadStatusChanged != null)
			{
				this.OnDownloadStatusChanged(this, new DownloadStatusChangedArgs(downloadInfo));
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.UpdateVersion.Model
{
	public class PluginVersionModel : VersionModel
	{
		public string PluginID { get; set; }

		public string PluginAssemblyName { get; set; }

		public string Description { get; set; }

		public int Bits { get; set; }

		public bool Install { get; set; }

		public int Order { get; set; }

		public bool Valid { get; set; }

		public string PluginIconPath { get; set; }
	}
	public class VersionModel : AbstractDownloadInfo
	{
		public string VersionName { get; set; }

		public string DisplayName { get; set; }

		public string Version { get; set; }

		public bool ForceType { get; set; }

		public bool haveNewVersion { get; set; }

		public override string downloadFileName { get; set; }

		public override long downloadFileSize { get; set; }

		public override int downloadLevel { get; set; }

		public override string downloadMD5 { get; set; }

		public override string downloadUrl { get; set; }

		public override string saveLocalPath { get; set; }

		public DateTime? ReleaseDate { get; set; }

		public string ReleaseNotes { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.UpdateVersion.Tool
{
	public class ToolVersionDataFromDb : ToolVersionDataFromJson
	{
		private UpdateVersionService m_updateVersionProxy;

		private UpdateVersionService updateVersionProxy
		{
			get
			{
				if (m_updateVersionProxy == null)
				{
					m_updateVersionProxy = new UpdateVersionService();
				}
				return m_updateVersionProxy;
			}
		}

		public override object GetData()
		{
			try
			{
				Dictionary<string, string> dictionary = new Dictionary<string, string>();
				dictionary.Add("country", GlobalFun.GetRegionInfo().TwoLetterISORegionName);
				ToolVersionModel clientVersion = updateVersionProxy.GetClientVersion(dictionary);
				if (clientVersion != null)
				{
					return new VersionModel
					{
						Version = clientVersion.VersionNumber,
						downloadUrl = clientVersion.FilePath,
						downloadMD5 = clientVersion.MD5,
						ForceType = clientVersion.IsForce,
						downloadFileSize = clientVersion.FileSize,
						downloadFileName = FileNameAnalysis(clientVersion.FilePath),
						saveLocalPath = ApplcationClass.DownloadPath,
						ReleaseNotes = clientVersion.ReleaseNotes,
						ReleaseDate = QrCodeUtility.ConvertDateTime(clientVersion.ReleaseDate)
					};
				}
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.lmsa.UpdateVersion.Tool.ToolVersionDataFromDb.GetData: Get Tool Version Data Failed", exception);
			}
			return null;
		}

		private string FileNameAnalysis(string data)
		{
			if (!string.IsNullOrEmpty(data))
			{
				string[] array = Regex.Split(data.Split(new char[1] { '?' })[0], "\\\\|/");
				if (array != null && array.Length != 0)
				{
					return array[^1];
				}
			}
			return string.Empty;
		}
	}
	public class ToolInstall : IVersionInstall
	{
		public event EventHandler<VersionInstallEventArgs> OnInstallStatusChanged;

		public void Cancel()
		{
		}

		public void InstallVersion(object data)
		{
			try
			{
				if (data == null)
				{
					return;
				}
				this.OnInstallStatusChanged?.Invoke(null, null);
				if (!(data is VersionModel versionModel))
				{
					ApplcationClass.IsUpdatingPlug = false;
					return;
				}
				string text = Path.Combine(ApplcationClass.DownloadPath, versionModel.downloadFileName);
				if (!File.Exists(text))
				{
					ApplcationClass.IsUpdatingPlug = false;
					return;
				}
				ProcessStartInfo processStartInfo = new ProcessStartInfo();
				processStartInfo.FileName = text;
				processStartInfo.UseShellExecute = false;
				processStartInfo.CreateNoWindow = true;
				processStartInfo.Verb = "runas";
				Process.Start(processStartInfo);
				Environment.Exit(0);
			}
			catch (Exception)
			{
				ApplcationClass.IsUpdatingPlug = false;
			}
		}
	}
	public class ToolCheckVersion : IVersionCheck
	{
		private long m_CheckToolVersionLocker = 0L;

		private IVersionData m_versionData;

		public bool CheckToolVersionIsRunning => Interlocked.Read(in m_CheckToolVersionLocker) != 0;

		public int CurrentVersionCode
		{
			get
			{
				int result = 0;
				try
				{
					string s = ConfigurationManager.AppSettings["VersionCode"];
					int.TryParse(s, out result);
				}
				catch (Exception)
				{
				}
				return result;
			}
		}

		public string CurrentVersion
		{
			get
			{
				try
				{
					return LMSAContext.MainProcessVersion;
				}
				catch (Exception)
				{
				}
				return "0.0.0.0";
			}
		}

		public IVersionData VersionData => m_versionData;

		public event EventHandler<CheckVersionEventArgs> OnCheckVersionStatusChanged;

		public ToolCheckVersion(IVersionData VerionData)
		{
			m_versionData = VerionData;
		}

		public void Check(bool isAutoMode)
		{
			if (CheckToolVersionIsRunning)
			{
				return;
			}
			Interlocked.Exchange(ref m_CheckToolVersionLocker, 1L);
			Task.Factory.StartNew(delegate
			{
				try
				{
					FireCheckVersionStatusChangedEvent(this, new CheckVersionEventArgs(isAutoMode, CheckVersionStatus.CHECK_VERSION_START));
					VersionModel versionModel = new VersionModel();
					object data = VersionData.GetData();
					if (data != null)
					{
						versionModel = (VersionModel)data;
						if (string.IsNullOrEmpty(versionModel.downloadUrl) || string.IsNullOrEmpty(versionModel.downloadMD5))
						{
							FireCheckVersionStatusChangedEvent(this, new CheckVersionEventArgs(isAutoMode, CheckVersionStatus.CHECK_VERSION_DATA_INVALID));
						}
						else
						{
							FireCheckVersionStatusChangedEvent(this, new CheckVersionEventArgs(isAutoMode, CheckVersionStatus.CHECK_VERSION_HAVE_NEW_VERSION, versionModel));
						}
					}
					else
					{
						FireCheckVersionStatusChangedEvent(this, new CheckVersionEventArgs(isAutoMode, CheckVersionStatus.CHECK_VERSION_NOT_NEW_VERSION));
					}
				}
				catch (Exception exception)
				{
					FireCheckVersionStatusChangedEvent(this, new CheckVersionEventArgs(isAutoMode, CheckVersionStatus.CHECK_VERSION_FAILED));
					LogHelper.LogInstance.Error("lenovo.mbg.service.lmsa.UpdateVersion.VersionCheck.CheckToolVersion.Check: Check Version Failed", exception);
				}
				finally
				{
					Interlocked.Exchange(ref m_CheckToolVersionLocker, 0L);
				}
			});
		}

		private void FireCheckVersionStatusChangedEvent(object sender, CheckVersionEventArgs e)
		{
			if (this.OnCheckVersionStatusChanged != null)
			{
				this.OnCheckVersionStatusChanged(sender, e);
			}
		}

		public bool CompareVersionCode(string serverVersionCode)
		{
			if (!string.IsNullOrEmpty(serverVersionCode))
			{
				string[] array = serverVersionCode.Split(new char[1] { '.' });
				string[] array2 = CurrentVersion.Split(new char[1] { '.' });
				int num = array.Length;
				int num2 = array2.Length;
				int[] array3 = Array.ConvertAll(array, delegate(string s)
				{
					int result = 0;
					int.TryParse(s, out result);
					return result;
				});
				int[] array4 = Array.ConvertAll(array2, delegate(string s)
				{
					int result = 0;
					int.TryParse(s, out result);
					return result;
				});
				int num3 = ((num > num2) ? num2 : num);
				for (int num4 = 0; num4 < num3; num4++)
				{
					if (array3[num4] > array4[num4])
					{
						return true;
					}
					if (array3[num4] < array4[num4])
					{
						return false;
					}
				}
				if (num > num2)
				{
					int num5 = 0;
					for (int num6 = num2; num6 < num; num6++)
					{
						num5 += array3[num6];
					}
					if (num5 > 0)
					{
						return true;
					}
				}
			}
			return false;
		}

		private int ConvertString2Int(string str)
		{
			int result = 0;
			int.TryParse(str, out result);
			return result;
		}
	}
	public class ToolVersionDataFromJson : IVersionData
	{
		public virtual object GetData()
		{
			VersionModel versionModel = new VersionModel();
			try
			{
				string stringFromUrl = GlobalFun.GetStringFromUrl(ApplcationClass.ToolNewVersionConfig);
				JObject jObject = JsonHelper.DeserializeJson2Jobjcet(stringFromUrl);
				if (jObject != null && jObject.HasValues)
				{
					foreach (JProperty item in jObject.Properties())
					{
						versionModel.saveLocalPath = ApplcationClass.DownloadPath;
						switch (item.Name.ToUpper())
						{
						case "VERSIONNAME":
							versionModel.VersionName = item.Value.ToString();
							break;
						case "VERSION":
							versionModel.Version = item.Value.ToString();
							break;
						case "VERSIONURL":
							versionModel.downloadUrl = item.Value.ToString();
							break;
						case "MD5":
							versionModel.downloadMD5 = item.Value.ToString();
							break;
						case "FORCETYPE":
						{
							bool result2 = false;
							bool.TryParse(item.Value.ToString(), out result2);
							versionModel.ForceType = result2;
							break;
						}
						case "SIZE":
						{
							long result = 0L;
							long.TryParse(item.Value.ToString(), out result);
							versionModel.downloadFileSize = result;
							break;
						}
						case "FILENAME":
							versionModel.downloadFileName = item.Value.ToString();
							break;
						}
					}
				}
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.lmsa.UpdateVersion.Tool.ToolVersionDataFromJson.GetData: Get Tool Version Data Failed", exception);
				return null;
			}
			return versionModel;
		}

		public void UpdateData(object data)
		{
		}
	}
}
namespace lenovo.mbg.service.lmsa.UpdateVersion.Proxy
{
	public class UpdateVersionService : ApiService
	{
		public ToolVersionModel GetClientVersion(object aparams)
		{
			return RequestContent<ToolVersionModel>(WebApiUrl.CLIENT_VERSION, aparams);
		}
	}
}
namespace lenovo.mbg.service.lmsa.UpdateVersion.Core
{
	public enum UpgradeRemindType
	{
		None,
		RemindTomorrow,
		NotRemindForTheCurrentVersion
	}
	public class UpgradeRemindTypeInfo
	{
		[JsonProperty("currentVersion")]
		public string CurrentVersion { get; set; }

		[JsonProperty("newVersion")]
		public string NewVersion { get; set; }

		[JsonProperty("setDate")]
		public DateTime SetDate { get; set; }

		[JsonProperty("remindType")]
		public UpgradeRemindType RemindType { get; set; }
	}
	public class UpgradeUserOptionManager
	{
		public const string REMIND_TYPE_DATA_STORE_KEY = "{CF3ED816-2454-41C8-B5B5-633570481663}";

		public UpgradeRemindType GetRemindType(string newVersion)
		{
			string mainProcessVersion = LMSAContext.MainProcessVersion;
			UpgradeRemindTypeInfo upgradeRemindTypeInfo = JsonHelper.DeserializeJson2Object<UpgradeRemindTypeInfo>(FileHelper.ReadWithAesDecrypt(Configurations.DefaultOptionsFileName, "{CF3ED816-2454-41C8-B5B5-633570481663}"));
			if (upgradeRemindTypeInfo != null && upgradeRemindTypeInfo.NewVersion.Equals(newVersion))
			{
				return upgradeRemindTypeInfo.RemindType;
			}
			return UpgradeRemindType.None;
		}

		public bool IsRemindToday(string newVersion)
		{
			string mainProcessVersion = LMSAContext.MainProcessVersion;
			UpgradeRemindTypeInfo upgradeRemindTypeInfo = JsonHelper.DeserializeJson2Object<UpgradeRemindTypeInfo>(FileHelper.ReadWithAesDecrypt(Configurations.DefaultOptionsFileName, "{CF3ED816-2454-41C8-B5B5-633570481663}"));
			if (upgradeRemindTypeInfo != null)
			{
				switch (upgradeRemindTypeInfo.RemindType)
				{
				case UpgradeRemindType.None:
					return true;
				case UpgradeRemindType.RemindTomorrow:
				{
					DateTime now = DateTime.Now;
					DateTime setDate = upgradeRemindTypeInfo.SetDate;
					return now.Year > setDate.Year || now.Month > setDate.Month || now.Day > setDate.Day;
				}
				case UpgradeRemindType.NotRemindForTheCurrentVersion:
					return !newVersion.Equals(upgradeRemindTypeInfo.NewVersion);
				}
			}
			return true;
		}

		public void SaveUpgradeRemindType(UpgradeRemindTypeInfo upgradeRemindTypeInfo)
		{
			if (upgradeRemindTypeInfo != null)
			{
				string data = JsonHelper.SerializeObject2FormatJson(upgradeRemindTypeInfo);
				FileHelper.WriteJsonWithAesEncrypt(Configurations.DefaultOptionsFileName, "{CF3ED816-2454-41C8-B5B5-633570481663}", data);
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.Language
{
	public class LanguageHelper : ILanguage
	{
		private Action notifyChange;

		private ResourceDictionary enLang;

		private ResourceDictionary curLang;

		private ResourceDictionary updateLang;

		private Regex _regex = new Regex("^[\0-\u007f‘’]*$");

		private Regex _regexOnlyNum = new Regex("^[0-9 /,.+!@#$%^&*()]+$");

		public NotifyEventProxy LanguageChangedAction { get; set; }

		public Action OnNotifyLanguageChangeAction
		{
			get
			{
				return notifyChange;
			}
			set
			{
				notifyChange = value;
			}
		}

		public bool IsNeedTranslate()
		{
			return true;
		}

		public string GetLanguageRootDir()
		{
			return Path.Combine(LMSAContext.LanguagePackageRootPath, LMSAContext.CurrentLanguage);
		}

		public string GetCurrentLanguage()
		{
			return LMSAContext.CurrentLanguage;
		}

		public void SetCurrentLanguage(string selectLanguage)
		{
			LMSAContext.SetCurrentLanguage(selectLanguage);
		}

		public string Translate(string srcLanguage)
		{
			if (string.IsNullOrEmpty(srcLanguage) || !IsNeedTranslate() || curLang == null || !_regex.IsMatch(srcLanguage))
			{
				return srcLanguage;
			}
			if (_regexOnlyNum.IsMatch(srcLanguage))
			{
				return srcLanguage;
			}
			if (updateLang != null)
			{
				foreach (object key in updateLang.Keys)
				{
					if (srcLanguage.Equals(key.ToString()))
					{
						srcLanguage = updateLang[key].ToString();
					}
				}
			}
			if (Regex.IsMatch(srcLanguage, "^K\\d{4}"))
			{
				if (curLang.Contains((object)srcLanguage))
				{
					return curLang[(object)srcLanguage].ToString();
				}
			}
			else
			{
				foreach (object key2 in enLang.Keys)
				{
					if (enLang[key2].Equals(srcLanguage) && curLang.Contains(key2))
					{
						return curLang[key2].ToString();
					}
				}
			}
			return srcLanguage;
		}

		public void LoadCommLanguagePackage()
		{
			enLang = LoadLanguagePackage(LMSAContext.DEF_LANGUAGE);
			if (LMSAContext.CurrentLanguage == LMSAContext.DEF_LANGUAGE)
			{
				curLang = enLang;
			}
			else
			{
				curLang = LoadLanguagePackage(LMSAContext.CurrentLanguage);
			}
		}

		private ResourceDictionary LoadLanguagePackage(string langCode)
		{
			string text = Path.Combine(LMSAContext.LanguagePackageRootPath, langCode);
			if (!Directory.Exists(text))
			{
				LogHelper.LogInstance.Error("Call LoadLanguagePackage() occur error! language pack directory is not exist.");
				return enLang;
			}
			string text2 = Path.Combine(LMSAContext.LanguagePackageRootPath, LMSAContext.DEF_LANGUAGE, LMSAContext.UPDATE_XML_FILE);
			if (File.Exists(text2))
			{
				updateLang = ReadLanguagePackage(text2);
			}
			try
			{
				string langFile = Path.Combine(text, langCode);
				return ReadLanguagePackage(langFile);
			}
			catch (Exception ex)
			{
				string text3 = ((ex.InnerException == null) ? ex.Message : ex.InnerException.Message);
				LogHelper.LogInstance.Error("Call LoadLanguagePackage() occur error! error info: " + text3);
				return enLang;
			}
		}

		private ResourceDictionary ReadLanguagePackage(string langFile)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected O, but got Unknown
			if (File.Exists(langFile))
			{
				using (FileStream fileStream = File.Open(langFile, FileMode.Open))
				{
					return (ResourceDictionary)XamlReader.Load((Stream)fileStream);
				}
			}
			LogHelper.LogInstance.Error("Call ReadLanguagePackage() occur error! Language File not exists: [" + langFile + "]");
			return null;
		}

		public RegionInfo GetCurrentRegionInfo()
		{
			return GlobalFun.GetRegionInfo();
		}

		public bool IsChinaRegionAndLanguage()
		{
			RegionInfo currentRegionInfo = HostProxy.LanguageService.GetCurrentRegionInfo();
			string currentLanguage = HostProxy.LanguageService.GetCurrentLanguage();
			return "CHN".Equals(currentRegionInfo.ThreeLetterISORegionName) && "zh-CN".Equals(currentLanguage, StringComparison.OrdinalIgnoreCase);
		}
	}
	public class LanguageUpdateHelper
	{
		private readonly string LANG_PACKAGE_INFO = Configurations.ServiceInterfaceUrl + "/client/languagePack.jhtml";

		private static LanguageUpdateHelper instance;

		public static LanguageUpdateHelper Instance => instance ?? (instance = new LanguageUpdateHelper());

		private LanguageUpdateHelper()
		{
		}

		public void CheckNewLanguagePackage()
		{
			LanguagePackageVersion languagePackageVersion = AppContext.WebApi.RequestContent<LanguagePackageVersion>(LANG_PACKAGE_INFO, null);
			if (languagePackageVersion == null || languagePackageVersion.languagePackVersion <= Configurations.LanguagePackageVersion)
			{
				if (languagePackageVersion != null)
				{
					LogHelper.LogInstance.Info($"UpdateLanguagePackage:No update needed;languagepackVersion:{languagePackageVersion.languagePackVersion};clientLanguagePackageVersion:{Configurations.LanguagePackageVersion} ");
				}
				return;
			}
			try
			{
				string text = LMSAContext.LanguagePackageRootPath + "_bak";
				if (Directory.Exists(LMSAContext.LanguagePackageRootPath))
				{
					GlobalFun.DeleteDirectory(text);
					Directory.Move(LMSAContext.LanguagePackageRootPath, text);
				}
				LogHelper.LogInstance.Info("UpdateLanguagePackage: Backup old language files,dir:" + text);
				if (DownloadLatestVersion(languagePackageVersion.languageFile, LMSAContext.LanguagePackageRootPath))
				{
					Configurations.LanguagePackageVersion = languagePackageVersion.languagePackVersion;
					GlobalFun.DeleteDirectory(text);
				}
				else
				{
					Directory.Move(text, LMSAContext.LanguagePackageRootPath);
				}
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Call CheckNewLanguagePackage() occur error, info: " + ex.ToString());
			}
		}

		private bool DownloadLatestVersion(string _url, string saveDir)
		{
			try
			{
				long filesize = 0L;
				GlobalFun.GetFileSize(_url, out filesize);
				if (filesize == 0)
				{
					return false;
				}
				string _languageZipPath = Path.Combine(Configurations.TempDir, "language_package.zip");
				bool streamFormServer = GlobalFun.GetStreamFormServer(_url, delegate(Stream stream)
				{
					using FileStream fileStream = new FileStream(_languageZipPath, FileMode.Create);
					stream.CopyTo(fileStream);
					fileStream.Flush();
				});
				LogHelper.LogInstance.Info("UpdateLanguagePackage Download completed : " + streamFormServer);
				if (streamFormServer)
				{
					SevenZipHelper.Instance.Extractor(_languageZipPath, saveDir);
				}
				LogHelper.LogInstance.Info("UpdateLanguagePackage Extract and Replace completed! languageZipPath :" + _languageZipPath + ", saveDir:" + saveDir);
				return streamFormServer;
			}
			catch (Exception ex)
			{
				string text = ((ex.InnerException != null) ? ex.InnerException.Message : ex.Message);
				LogHelper.LogInstance.Error("UpdateLanguagePackage Error:" + text);
				return false;
			}
		}
	}
	public class LanguagePackageVersion
	{
		public string languageFile { get; set; }

		public int languagePackVersion { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.ResourcesCleanUp
{
	public class DeleteResourceFailedTipsView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public DeleteResourceFailedTipsView()
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
				Uri uri = new Uri("/Software Fix;component/resourcescleanup/view/deleteresourcefailedtipsview.xaml", UriKind.Relative);
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
	public class DeleteResourceFailedTipsViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private string m_deleteFailedResources;

		private ReplayCommand m_okCommand;

		public string DeleteFailedResources
		{
			get
			{
				return m_deleteFailedResources;
			}
			set
			{
				if (!(m_deleteFailedResources == value))
				{
					m_deleteFailedResources = value;
					OnPropertyChanged("DeleteFailedResources");
				}
			}
		}

		public ReplayCommand OkCommand
		{
			get
			{
				return m_okCommand;
			}
			set
			{
				if (m_okCommand != value)
				{
					m_okCommand = value;
					OnPropertyChanged("OkCommand");
				}
			}
		}

		public DeleteResourceFailedTipsViewModel(List<ResourceAbstract> deleteFailedResources)
		{
			OkCommand = new ReplayCommand(OkCommandHandler);
			StringBuilder stringBuilder = new StringBuilder();
			foreach (ResourceAbstract deleteFailedResource in deleteFailedResources)
			{
				stringBuilder.Append(deleteFailedResource.Path).Append(Environment.NewLine).Append(Environment.NewLine);
			}
			DeleteFailedResources = stringBuilder.ToString();
		}

		private void OkCommandHandler(object e)
		{
			Window val = (Window)((e is Window) ? e : null);
			val.Close();
		}
	}
	public class ResourcesLog
	{
		private static ResourcesLog mSingle = null;

		private static readonly object mSingleInstanceLock = new object();

		private string mResourcesLogFile = string.Empty;

		private readonly XmlDocument mDoc = null;

		private static readonly object fileReadWriteLock = new object();

		private static readonly List<string> m_defaultResource = new List<string>
		{
			"Contact", "Music", "PicAlbum", "PicOriginal", "Screencap", "Temp", "Video", "Pic", "Backup", "AppIcon",
			"MusicCache"
		};

		public static ResourcesLog Single
		{
			get
			{
				if (mSingle == null)
				{
					lock (mSingleInstanceLock)
					{
						if (mSingle == null)
						{
							mSingle = new ResourcesLog();
						}
					}
				}
				return mSingle;
			}
		}

		private ResourcesLog()
		{
			//IL_008b: Expected O, but got Unknown
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Expected O, but got Unknown
			lock (fileReadWriteLock)
			{
				mDoc = new XmlDocument();
				mResourcesLogFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "LMSA", "lmsaresources.log");
				if (!File.Exists(mResourcesLogFile))
				{
					CreateNewLogFile();
					return;
				}
				try
				{
					mDoc.Load(mResourcesLogFile);
				}
				catch (XmlException ex)
				{
					XmlException ex2 = ex;
					LogHelper.LogInstance.Error("Load exist resource log file throw xml exception:" + ((object)ex2).ToString());
					try
					{
						File.Delete(mResourcesLogFile);
						CreateNewLogFile();
					}
					catch (Exception ex3)
					{
						LogHelper.LogInstance.Error("Delete the error resource file and create new throw exception:" + ex3.ToString());
					}
				}
				catch (Exception ex4)
				{
					LogHelper.LogInstance.Error("Load exist resource log file throw exception:" + ex4.ToString());
				}
			}
		}

		private void CreateNewLogFile()
		{
			Assembly executingAssembly = Assembly.GetExecutingAssembly();
			string name = "lenovo.mbg.service.lmsa.ResourcesCleanUp.Storage.LmsaDeviceResources.xml";
			using (Stream stream = executingAssembly.GetManifestResourceStream(name))
			{
				using StreamReader streamReader = new StreamReader(stream);
				string text = streamReader.ReadToEnd();
				LogHelper.LogInstance.Debug("Read log xml tempate:" + text);
				mDoc.LoadXml(text);
			}
			TrySaveDocument();
		}

		public void AddFileRecord(string path)
		{
			LogHelper.LogInstance.Debug($"Add new file resource[{path}]");
			lock (fileReadWriteLock)
			{
				XmlElement elementById = mDoc.GetElementById("files");
				if (elementById != null)
				{
					XmlNode val = mDoc.CreateNode((XmlNodeType)1, "file", string.Empty);
					val.InnerText = path;
					((XmlNode)elementById).AppendChild(val);
					TrySaveDocument();
				}
			}
		}

		public void AddDirRecord(string path)
		{
			LogHelper.LogInstance.Debug($"Add new dir resurce[{path}]");
			lock (fileReadWriteLock)
			{
				XmlElement elementById = mDoc.GetElementById("dirs");
				if (elementById != null)
				{
					XmlNode val = mDoc.CreateNode((XmlNodeType)1, "dir", string.Empty);
					val.InnerText = path;
					((XmlNode)elementById).AppendChild(val);
					TrySaveDocument();
				}
			}
		}

		public List<ResourceAbstract> GetResources()
		{
			//IL_00f3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fa: Expected O, but got Unknown
			List<ResourceAbstract> resources = new List<ResourceAbstract>();
			lock (fileReadWriteLock)
			{
				foreach (string item in m_defaultResource)
				{
					DirectoryInfo directoryInfo = new DirectoryInfo(Path.Combine(Configurations.ProgramDataPath, item));
					if (directoryInfo.Exists && !resources.Exists((ResourceAbstract m) => m.Path.Equals(item)))
					{
						GetDirFiles(directoryInfo, ref resources);
					}
				}
				if (mDoc == null)
				{
					return resources;
				}
				XmlElement elementById = mDoc.GetElementById("dirs");
				if (elementById != null)
				{
					foreach (XmlNode childNode in ((XmlNode)elementById).ChildNodes)
					{
						XmlNode val = childNode;
						DirectoryInfo dir = new DirectoryInfo(val.InnerText);
						if (dir.Exists && !resources.Exists((ResourceAbstract m) => m.Path.Equals(dir.FullName)))
						{
							GetDirFiles(dir, ref resources);
						}
						else
						{
							val.ParentNode.RemoveChild(val);
						}
					}
				}
				XmlElement elementById2 = mDoc.GetElementById("files");
				if (elementById2 != null)
				{
					foreach (XmlNode node in ((IEnumerable)((XmlNode)elementById2).ChildNodes).Cast<XmlNode>().ToList())
					{
						if (!resources.Exists((ResourceAbstract m) => string.Compare(m.Path, node.InnerText) == 0) && File.Exists(node.InnerText))
						{
							resources.Add(new FileResource(node.InnerText));
						}
						else
						{
							node.ParentNode.RemoveChild(node);
						}
					}
				}
				TrySaveDocument();
			}
			return resources;
		}

		private void GetDirFiles(DirectoryInfo dir, ref List<ResourceAbstract> resources)
		{
			if (dir == null)
			{
				return;
			}
			DirectoryInfo[] directories = dir.GetDirectories();
			if (directories != null)
			{
				DirectoryInfo[] array = directories;
				foreach (DirectoryInfo dir2 in array)
				{
					GetDirFiles(dir2, ref resources);
				}
			}
			FileInfo[] files = dir.GetFiles();
			if (files != null)
			{
				FileInfo[] array2 = files;
				foreach (FileInfo item in array2)
				{
					if (!resources.Exists((ResourceAbstract m) => m.Path.Equals(item.FullName)))
					{
						resources.Add(new FileResource(item.FullName));
					}
				}
			}
			if (!resources.Exists((ResourceAbstract m) => m.Path.Equals(dir.FullName)))
			{
				resources.Add(new DirResource(dir.FullName));
			}
		}

		public void RemoveFileRecordExcept(List<ResourceAbstract> resources)
		{
			lock (fileReadWriteLock)
			{
				if (mDoc == null)
				{
					return;
				}
				XmlElement elementById = mDoc.GetElementById("files");
				if (elementById != null)
				{
					foreach (XmlNode node in ((IEnumerable)((XmlNode)elementById).ChildNodes).Cast<XmlNode>().ToList())
					{
						if (!resources.Exists((ResourceAbstract m) => string.Compare(node.InnerText, m.Path) == 0))
						{
							node.ParentNode.RemoveChild(node);
						}
					}
				}
				TrySaveDocument();
			}
		}

		public void RemoveResourceRecord(List<ResourceAbstract> resources)
		{
			lock (fileReadWriteLock)
			{
				if (mDoc == null)
				{
					return;
				}
				foreach (string itype in resources.Select((ResourceAbstract m) => m.RootId).Distinct())
				{
					XmlElement elementById = mDoc.GetElementById(itype);
					if (elementById == null)
					{
						continue;
					}
					IEnumerable<ResourceAbstract> enumerable = resources.Where((ResourceAbstract m) => string.Compare(itype, m.RootId) == 0);
					foreach (XmlNode item in ((IEnumerable)((XmlNode)elementById).ChildNodes).Cast<XmlNode>().ToList())
					{
						foreach (ResourceAbstract item2 in enumerable)
						{
							if (string.Compare(item.InnerText, item2.Path) == 0)
							{
								item.ParentNode.RemoveChild(item);
							}
						}
					}
				}
				TrySaveDocument();
			}
		}

		private void TrySaveDocument()
		{
			try
			{
				mDoc.Save(mResourcesLogFile);
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Save resource log throw exception:" + ex.ToString());
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.ResourcesCleanUp.View
{
	public class ClearupMainView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public ClearupMainView()
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
				Uri uri = new Uri("/Software Fix;component/resourcescleanup/view/clearupmainview.xaml", UriKind.Relative);
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
	public class DeleteResourceView : UserControl, IComponentConnector
	{
		private Rectangle m_rect = null;

		private TextBlock m_text = null;

		internal ProgressBar progress;

		private bool _contentLoaded;

		public DeleteResourceView()
		{
			InitializeComponent();
		}

		public override void OnApplyTemplate()
		{
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			((FrameworkElement)this).OnApplyTemplate();
			((FrameworkElement)progress).ApplyTemplate();
			object obj = ((FrameworkTemplate)((Control)progress).Template).FindName("Animation", (FrameworkElement)(object)progress);
			m_rect = (Rectangle)((obj is Rectangle) ? obj : null);
			((FrameworkElement)m_rect).SizeChanged += new SizeChangedEventHandler(M_rect_SizeChanged);
			object obj2 = ((FrameworkTemplate)((Control)progress).Template).FindName("perecetage", (FrameworkElement)(object)progress);
			m_text = (TextBlock)((obj2 is TextBlock) ? obj2 : null);
		}

		private void M_rect_SizeChanged(object sender, SizeChangedEventArgs e)
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			if (e.WidthChanged)
			{
				Size newSize = e.NewSize;
				if (((Size)(ref newSize)).Width > ((FrameworkElement)m_text).ActualWidth)
				{
					TextBlock text = m_text;
					newSize = e.NewSize;
					((FrameworkElement)text).Width = ((Size)(ref newSize)).Width;
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
				Uri uri = new Uri("/Software Fix;component/resourcescleanup/view/deleteresourceview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Expected O, but got Unknown
			if (connectionId == 1)
			{
				progress = (ProgressBar)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class DeleteResourceProgressBarPercentageTextBlockWidthConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class ScanningView : UserControl, IComponentConnector
	{
		internal LangTextBlock txtInfo;

		internal Border finishborder;

		internal Border border;

		private bool _contentLoaded;

		public ScanningView()
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
				Uri uri = new Uri("/Software Fix;component/resourcescleanup/view/scanningview.xaml", UriKind.Relative);
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
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				txtInfo = (LangTextBlock)target;
				break;
			case 2:
				finishborder = (Border)target;
				break;
			case 3:
				border = (Border)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class TipsView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public TipsView()
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
				Uri uri = new Uri("/Software Fix;component/resourcescleanup/view/tipsview.xaml", UriKind.Relative);
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
namespace lenovo.mbg.service.lmsa.ResourcesCleanUp.ViewModel
{
	public class ClearupMainViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private object m_content;

		private ReplayCommand m_loaded;

		public object Content
		{
			get
			{
				return m_content;
			}
			set
			{
				if (m_content != value)
				{
					m_content = value;
					OnPropertyChanged("Content");
				}
			}
		}

		public ReplayCommand LoadedCommand
		{
			get
			{
				return m_loaded;
			}
			set
			{
				if (m_loaded != value)
				{
					m_loaded = value;
					OnPropertyChanged("LoadedCommand");
				}
			}
		}

		public ClearupMainViewModel()
		{
			LoadedCommand = new ReplayCommand(LoadedCommandHandler);
		}

		private void LoadedCommandHandler(object e)
		{
			ScanningViewModel scanningViewModel = new ScanningViewModel();
			ScanningView scanningView = new ScanningView();
			((FrameworkElement)scanningView).DataContext = scanningViewModel;
			Content = scanningView;
			scanningViewModel.StartingScan(delegate(List<ResourceAbstract> rsources)
			{
				if (rsources.Sum((ResourceAbstract m) => m.CountFlag) == 0)
				{
					AppContext.Single.CurrentDispatcher.Invoke((Action)delegate
					{
						TipsView tipsView = new TipsView();
						((FrameworkElement)tipsView).DataContext = new TipsViewModel
						{
							Tips = "K0695"
						};
						Content = tipsView;
					});
				}
				else
				{
					AppContext.Single.CurrentDispatcher.Invoke((Action)delegate
					{
						ClearupMainViewModel clearupMainViewModel = this;
						DeleteResourceView deleteResourceView = new DeleteResourceView();
						((FrameworkElement)deleteResourceView).VerticalAlignment = (VerticalAlignment)1;
						((FrameworkElement)deleteResourceView).DataContext = new DeleteResourceViewModel(rsources);
						clearupMainViewModel.Content = deleteResourceView;
					});
				}
			});
		}
	}
	public class DeleteResourceViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private List<ResourceAbstract> m_resources;

		private double m_progressBarMaxValue;

		private double m_progressBarValue = 0.0;

		private string m_percentage = "0%";

		private ReplayCommand m_operationCommand;

		private string m_operationButtonText = "K0583";

		private string m_operationType;

		private string m_title;

		private volatile bool isStop = false;

		public double ProgressBarMaxValue
		{
			get
			{
				return m_progressBarMaxValue;
			}
			set
			{
				if (m_progressBarMaxValue != value)
				{
					m_progressBarMaxValue = value;
					OnPropertyChanged("ProgressBarMaxValue");
				}
			}
		}

		public double ProgressBarValue
		{
			get
			{
				return m_progressBarValue;
			}
			set
			{
				if (m_progressBarValue != value)
				{
					m_progressBarValue = value;
					Percentage = ConvertPercentage(ProgressBarMaxValue, value);
					OnPropertyChanged("ProgressBarValue");
				}
			}
		}

		public string Percentage
		{
			get
			{
				return m_percentage;
			}
			set
			{
				if (!(m_percentage == value))
				{
					m_percentage = value;
					OnPropertyChanged("Percentage");
				}
			}
		}

		public ReplayCommand OperationCommand
		{
			get
			{
				return m_operationCommand;
			}
			set
			{
				if (m_operationCommand != value)
				{
					m_operationCommand = value;
					OnPropertyChanged("OperationCommand");
				}
			}
		}

		public string OperationButtonText
		{
			get
			{
				return m_operationButtonText;
			}
			set
			{
				if (!(m_operationButtonText == value))
				{
					m_operationButtonText = value;
					OnPropertyChanged("OperationButtonText");
				}
			}
		}

		private string OperationType
		{
			get
			{
				return m_operationType;
			}
			set
			{
				if (!(m_operationType == value))
				{
					OperationButtonText = value;
					m_operationType = value;
				}
			}
		}

		public string Title
		{
			get
			{
				return m_title;
			}
			set
			{
				if (!(m_title == value))
				{
					m_title = value;
					OnPropertyChanged("Title");
				}
			}
		}

		public DeleteResourceViewModel(List<ResourceAbstract> resources)
		{
			OperationCommand = new ReplayCommand(OperationCommandHandler);
			m_resources = resources;
			ProgressBarValue = 0.0;
			ProgressBarMaxValue = m_resources.Sum((ResourceAbstract m) => m.CountFlag);
			OperationType = "K0583";
			Title = "K0696";
		}

		private string ConvertPercentage(double maxiValue, double value)
		{
			if (maxiValue == 0.0)
			{
				return "0%";
			}
			return $"{Math.Round(value / maxiValue * 100.0, 0).ToString()}%";
		}

		private void OperationCommandHandler(object e)
		{
			switch (OperationType)
			{
			case "K0583":
			{
				OperationType = "K0694";
				isStop = false;
				Title = "K0693";
				Window val2 = (Window)((e is Window) ? e : null);
				val2.Closed += delegate
				{
					isStop = true;
				};
				Delete();
				break;
			}
			case "K0694":
				OperationType = "K0386";
				Title = "K0682";
				isStop = true;
				break;
			case "K0386":
			{
				Window val = (Window)((e is Window) ? e : null);
				val.Close();
				break;
			}
			}
		}

		private void Delete()
		{
			Task.Factory.StartNew(delegate
			{
				List<ResourceAbstract> list = new List<ResourceAbstract>();
				try
				{
					string text = m_resources.Count.ToString();
					int num = 0;
					LogHelper.LogInstance.Debug($"Starting delete resources[{text}]");
					foreach (ResourceAbstract resource in m_resources)
					{
						if (isStop)
						{
							break;
						}
						try
						{
							resource.Delete();
							LogHelper.LogInstance.Debug($"Delete success[{num++.ToString()}/{text}]:{resource.Path}");
						}
						catch (Exception ex)
						{
							list.Add(resource);
							LogHelper.LogInstance.Error(string.Format("Delete failed[{0}/{1}]:{2}[exception:{3}]", new object[4]
							{
								num++.ToString(),
								text,
								resource.Path,
								ex.ToString()
							}));
						}
						ProgressBarValue += resource.CountFlag;
					}
					LogHelper.LogInstance.Debug($"Finished delete resources[failed count:{list.Count.ToString()},total:{text}]");
				}
				finally
				{
					AppContext.Single.CurrentDispatcher.Invoke((Action)delegate
					{
						OperationType = "K0386";
						Title = "K0682";
					});
				}
				List<ResourceAbstract> failedFiles = list.Where((ResourceAbstract m) => string.Compare("files", m.RootId) == 0).ToList();
				foreach (ResourceAbstract item in failedFiles.ToList())
				{
					if (!item.Exists)
					{
						failedFiles.RemoveAll((ResourceAbstract m) => m.Path.Equals(item));
					}
				}
				if (failedFiles.Count > 0)
				{
					AppContext.Single.CurrentDispatcher.Invoke((Action)delegate
					{
						LenovoWindow lenovoWindow = new LenovoWindow();
						((Window)lenovoWindow).SizeToContent = (SizeToContent)3;
						DeleteResourceFailedTipsViewModel dataContext = new DeleteResourceFailedTipsViewModel(failedFiles);
						DeleteResourceFailedTipsView deleteResourceFailedTipsView = new DeleteResourceFailedTipsView();
						((FrameworkElement)deleteResourceFailedTipsView).DataContext = dataContext;
						((ContentControl)lenovoWindow).Content = deleteResourceFailedTipsView;
						lenovoWindow.ShowNow = true;
						MessageWindowHelper.Instance.Show(lenovoWindow, true);
					});
				}
			});
		}
	}
	public class ScanningViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		public void StartingScan(Action<List<ResourceAbstract>> callback)
		{
			Task.Factory.StartNew(delegate
			{
				List<ResourceAbstract> obj;
				try
				{
					obj = ResourcesLog.Single.GetResources();
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("Scan resource throw exception:" + ex.ToString());
					obj = new List<ResourceAbstract>();
				}
				callback?.Invoke(obj);
			});
		}
	}
	public class TipsViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private string m_tips;

		private ReplayCommand m_ok;

		public string Tips
		{
			get
			{
				return m_tips;
			}
			set
			{
				if (!(m_tips == value))
				{
					m_tips = value;
					OnPropertyChanged("Tips");
				}
			}
		}

		public ReplayCommand OkCommand
		{
			get
			{
				return m_ok;
			}
			set
			{
				if (m_ok != value)
				{
					m_ok = value;
					OnPropertyChanged("OkCommand");
				}
			}
		}

		public TipsViewModel()
		{
			OkCommand = new ReplayCommand(OkCommandHandler);
		}

		private void OkCommandHandler(object e)
		{
			Window val = (Window)((e is Window) ? e : null);
			val.Close();
		}
	}
}
namespace lenovo.mbg.service.lmsa.ResourcesCleanUp.Model
{
	public class DirResource : ResourceAbstract
	{
		public override bool Exists => Directory.Exists(base.Path);

		public DirResource(string path)
		{
			base.RootId = "dirs";
			base.CountFlag = 0;
			base.Path = path;
		}

		public override void Delete()
		{
			if (Directory.Exists(base.Path))
			{
				Directory.Delete(base.Path);
			}
		}
	}
	public class FileResource : ResourceAbstract
	{
		public override bool Exists => File.Exists(base.Path);

		public FileResource(string path)
		{
			base.RootId = "files";
			base.CountFlag = 1;
			base.Path = path;
		}

		public override void Delete()
		{
			if (File.Exists(base.Path))
			{
				File.Delete(base.Path);
			}
		}
	}
	public abstract class ResourceAbstract
	{
		public string RootId { get; protected set; }

		public string Path { get; set; }

		public int CountFlag { get; protected set; }

		public abstract bool Exists { get; }

		public abstract void Delete();
	}
}
namespace lenovo.mbg.service.lmsa.OperationGuide.DeletePersionData
{
	public class DeletePersonalDataOperationGuideViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private bool m_isShowDeletePersonalDataGuide;

		private string m_tipContent;

		private string bOkContent;

		private ReplayCommand m_iKnowCommand;

		public bool IsShowDeletePersonalDataGuidePopup { get; set; }

		public bool IsShowDeletePersonalDataGuide
		{
			get
			{
				return m_isShowDeletePersonalDataGuide;
			}
			set
			{
				if (m_isShowDeletePersonalDataGuide != value)
				{
					m_isShowDeletePersonalDataGuide = value;
					OnPropertyChanged("IsShowDeletePersonalDataGuide");
				}
			}
		}

		public string TipContent
		{
			get
			{
				return m_tipContent;
			}
			set
			{
				if (!(m_tipContent == value))
				{
					m_tipContent = value;
					OnPropertyChanged("TipContent");
				}
			}
		}

		public string OkContent
		{
			get
			{
				return bOkContent;
			}
			set
			{
				if (!(bOkContent == value))
				{
					bOkContent = value;
					OnPropertyChanged("OkContent");
				}
			}
		}

		public ReplayCommand IKnowCommand
		{
			get
			{
				return m_iKnowCommand;
			}
			set
			{
				if (m_iKnowCommand != value)
				{
					m_iKnowCommand = value;
					OnPropertyChanged("IKnowCommand");
				}
			}
		}

		public DeletePersonalDataOperationGuideViewModel()
		{
			IKnowCommand = new ReplayCommand(IKnowCommandHandler);
			TipContent = "K0704";
			OkContent = "K0698";
		}

		private void IKnowCommandHandler(object e)
		{
			IsShowDeletePersonalDataGuide = false;
			IsShowDeletePersonalDataGuidePopup = false;
		}
	}
}
namespace lenovo.mbg.service.lmsa.LenovoId
{
	public class LenovoIdWindow : Window, IMessageWindowV6, IComponentConnector
	{
		private bool isWebBrowser;

		private bool isManualLogin;

		private LenovoIdWindowViewModel _vm;

		protected static List<string> TracertList = new List<string>();

		protected static Process process;

		internal WebBrowser _webbrowser;

		internal WebView2 webView2Control;

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

		public string LoadUrlStr { get; set; }

		public Action<Window> OnLoginEvent { get; set; }

		public bool CanExecute(object parameter)
		{
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public LenovoIdWindow(bool isRegister)
		{
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Expected O, but got Unknown
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			isManualLogin = false;
			_vm = new LenovoIdWindowViewModel(this);
			((FrameworkElement)this).DataContext = _vm;
			((Window)this).Closed += Closedhandler;
			((FrameworkElement)this).Loaded += new RoutedEventHandler(LenovoIdWindow_Loaded);
		}

		private async void LenovoIdWindow_Loaded(object sender, RoutedEventArgs e)
		{
			await Task.Factory.StartNew(delegate
			{
				//IL_0191: Unknown result type (might be due to invalid IL or missing references)
				//IL_019b: Expected O, but got Unknown
				//IL_01a9: Unknown result type (might be due to invalid IL or missing references)
				//IL_01b3: Expected O, but got Unknown
				string text = LMSAContext.CurrentLanguage;
				if (!string.IsNullOrEmpty(text))
				{
					switch (text)
					{
					case "sk-SK":
					case "ro-RO":
					case "bg-BG":
						goto IL_0048;
					}
					if (!(text == "sr-RS"))
					{
						goto IL_004e;
					}
				}
				goto IL_0048;
				IL_0048:
				text = "en-US";
				goto IL_004e;
				IL_004e:
				object obj = AppContext.WebApi.RequestContent(WebApiUrl.CALL_API_URL, new
				{
					key = "TIP_URL"
				});
				loginResModel loginResModel2 = JsonConvert.DeserializeObject<loginResModel>(obj.ToString());
				WebApiUrl.TOKEN_URL = loginResModel2.token_url;
				LoadUrlStr = loginResModel2.login_url + "&lenovoid.lang=" + text.Replace('-', '_');
				try
				{
					Tracert(new Uri(LoadUrlStr));
					Task<LoadResult> task = WebView2Helper.Instance.LoadUrl(webView2Control, LoadUrlStr, delegate(NavigationFinishedEventArgsAdapter ee)
					{
						if (ee != null && ee.Browser != null)
						{
							LoginCallback(new Uri(ee.Browser.Source.ToString()));
						}
					});
				}
				catch (Exception ex)
				{
					isWebBrowser = true;
					LogHelper.LogInstance.Info("webview2 load failed,Msg:" + ex.Message);
					HtmlDocument document = _webbrowser.Document;
					if (!string.IsNullOrEmpty((document != null) ? document.Cookie : null))
					{
						int length = _webbrowser.Document.Cookie.Length;
						_webbrowser.Document.Cookie.Remove(0, length);
					}
					_webbrowser.ScriptErrorsSuppressed = true;
					_webbrowser.IsWebBrowserContextMenuEnabled = false;
					_webbrowser.Navigated -= new WebBrowserNavigatedEventHandler(_webbrowser_Navigated);
					_webbrowser.Navigated += new WebBrowserNavigatedEventHandler(_webbrowser_Navigated);
					_webbrowser.Navigate(LoadUrlStr);
				}
			});
		}

		private void Tracert(Uri uri)
		{
			Task.Run(delegate
			{
				process = new Process();
				process.StartInfo.FileName = Path.Combine(Environment.SystemDirectory, "cmd.exe");
				process.StartInfo.RedirectStandardInput = true;
				process.StartInfo.RedirectStandardOutput = true;
				process.StartInfo.RedirectStandardError = true;
				process.StartInfo.UseShellExecute = false;
				process.EnableRaisingEvents = true;
				process.StartInfo.CreateNoWindow = true;
				process.OutputDataReceived += delegate(object sender, DataReceivedEventArgs e)
				{
					if (!string.IsNullOrEmpty(e.Data))
					{
						TracertList.Add(e.Data);
					}
				};
				process.ErrorDataReceived += delegate(object sender, DataReceivedEventArgs e)
				{
					if (!string.IsNullOrEmpty(e.Data))
					{
						TracertList.Add(e.Data);
					}
				};
				process.Start();
				process.StandardInput.WriteLine("tracert " + uri.DnsSafeHost + " &exit");
				process.StandardInput.AutoFlush = true;
				process.BeginOutputReadLine();
				process.BeginErrorReadLine();
				process.WaitForExit();
			});
		}

		public static List<string> GetTracertDatas()
		{
			if (process != null && !process.SafeHandle.IsClosed)
			{
				try
				{
					process.Dispose();
				}
				catch
				{
				}
			}
			return TracertList;
		}

		private void _webbrowser_Navigated(object sender, WebBrowserNavigatedEventArgs e)
		{
			LoginCallback(e.Url);
		}

		private void LoginCallback(Uri uri)
		{
			if (uri.AbsoluteUri == "https://passport.lenovo.com/glbwebauthnv6/preLogin")
			{
				isManualLogin = true;
			}
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					_vm.Init(isWebBrowser);
				});
			}
			if (uri.LocalPath != "/Tips/lenovoIdSuccess.html")
			{
				return;
			}
			Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
			if (currentDispatcher2 != null)
			{
				currentDispatcher2.Invoke((Action)delegate
				{
					_vm.DoNetBrowserVisibility = (Visibility)2;
					_vm.WinformBrowserVisibility = (Visibility)2;
				});
			}
			LogHelper.LogInstance.Info("lenovoid login successfully, goto successfully ui");
			NameValueCollection nameValueCollection = HttpUtility.ParseQueryString(uri.Query);
			string pattern = "lenovoid\\.wust=(.*?)(?=&lenovoid\\.|$)";
			Match match = Regex.Match(uri.Query, pattern);
			if (match.Success)
			{
				WebApiUrl.LOGIN_TOKEN = match.Groups[1].Value;
			}
			_vm.LoginGetUserInfo((Window)(object)this, delegate
			{
				if (isManualLogin)
				{
					FileHelper.WriteJsonWithAesEncrypt(Configurations.DefaultOptionsFileName, "AutoLogin", true);
				}
				OnLoginEvent?.Invoke((Window)(object)this);
			});
		}

		private void Closedhandler(object sender, EventArgs e)
		{
			WebView2Helper.Instance.DisposeWebView(webView2Control);
		}

		public void Reload()
		{
			WebView2Helper.Instance.InitWebView2(webView2Control);
		}

		private void MouseLeftButtonDownHandler(object sender, MouseButtonEventArgs e)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Invalid comparison between Unknown and I4
			if ((int)((MouseEventArgs)e).LeftButton == 1)
			{
				((Window)this).DragMove();
			}
		}

		public static void ShowDialogEx(bool isRegister = false, Action<Window> callBack = null)
		{
			MessageWindowHelper.Instance.Show(new LenovoIdWindow(isRegister)
			{
				ShowNow = true,
				OnLoginEvent = callBack
			}, true);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/lenovoid/lenovoidwindow.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				_webbrowser = (WebBrowser)target;
				break;
			case 2:
				webView2Control = (WebView2)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class loginResModel
	{
		public string login_url { get; set; }

		public string token_url { get; set; }
	}
	public class LenovoIdWindowViewModel : ViewModelBase
	{
		public Window LenovoIdWindow;

		private Visibility m_doNetBrowserVisibility = (Visibility)2;

		private Visibility m_winformBrowserVisibility = (Visibility)2;

		private Visibility m_refreshVisibility = (Visibility)0;

		public ReplayCommand CloseCommand { get; private set; }

		public ReplayCommand RefreshCommand { get; private set; }

		public ReplayCommand FeedBackCommand { get; }

		public string Token { get; private set; }

		public Visibility DoNetBrowserVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return m_doNetBrowserVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (m_doNetBrowserVisibility != value)
				{
					m_doNetBrowserVisibility = value;
					OnPropertyChanged("DoNetBrowserVisibility");
				}
			}
		}

		public Visibility WinformBrowserVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return m_winformBrowserVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (m_winformBrowserVisibility != value)
				{
					m_winformBrowserVisibility = value;
					OnPropertyChanged("WinformBrowserVisibility");
				}
			}
		}

		public Visibility RefreshVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return m_refreshVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				m_refreshVisibility = value;
				OnPropertyChanged("RefreshVisibility");
			}
		}

		public LenovoIdWindowViewModel(LenovoIdWindow lenovoIdWindow)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			CloseCommand = new ReplayCommand(CloseCommandHandler);
			RefreshCommand = new ReplayCommand(RefreshCommandHandler);
			FeedBackCommand = new ReplayCommand(FeedBackCommandHandler);
			LenovoIdWindow = (Window)(object)lenovoIdWindow;
		}

		public void Init(bool isUseWebBrowser)
		{
			if (isUseWebBrowser)
			{
				WinformBrowserVisibility = (Visibility)0;
				DoNetBrowserVisibility = (Visibility)2;
			}
			else
			{
				DoNetBrowserVisibility = (Visibility)0;
				WinformBrowserVisibility = (Visibility)2;
			}
		}

		public void TokenAnalysis(string url, Window win, Action action)
		{
			Match match = Regex.Match(url, "lenovoid.wust=(?<token>[^&]+)");
			Token = match.Groups["token"]?.Value;
			UserLoginFormData userLoginFormData = new UserLoginFormData();
			userLoginFormData.UserSource = "lenovoId";
			LenovoIdUserLoginFormData lenovoIdUserLoginFormData = new LenovoIdUserLoginFormData();
			lenovoIdUserLoginFormData.UserName = null;
			lenovoIdUserLoginFormData.WUST = Token;
			userLoginFormData.UserData = JsonConvert.SerializeObject(lenovoIdUserLoginFormData);
			UserService.Single.Login(userLoginFormData, win);
			action?.Invoke();
		}

		public async Task<ResponseModel<string>> GetTokenStr(string url)
		{
			HttpClient client = new HttpClient();
			try
			{
				NameValueCollection ff = HttpUtility.ParseQueryString(url);
				FormUrlEncodedContent content = new FormUrlEncodedContent((IEnumerable<KeyValuePair<string, string>>)new KeyValuePair<string, string>[5]
				{
					new KeyValuePair<string, string>("grant_type", "authorization_code"),
					new KeyValuePair<string, string>("redirect_uri", ff["redirect_uri"]),
					new KeyValuePair<string, string>("code", ff["code"]),
					new KeyValuePair<string, string>("client_id", ff["client_id"]),
					new KeyValuePair<string, string>("code_verifier", ff["code_verifier"])
				});
				string result = await (await client.PostAsync(new Uri(url).GetLeftPart(UriPartial.Path), (HttpContent)(object)content)).Content.ReadAsStringAsync();
				JObject jobj = JsonHelper.DeserializeJson2Jobjcet(result);
				string accessToken = jobj.Value<string>("access_token");
				return new ResponseModel<string>
				{
					success = !string.IsNullOrEmpty(accessToken),
					content = accessToken,
					desc = result
				};
			}
			finally
			{
				((IDisposable)client)?.Dispose();
			}
		}

		public async Task TokenGet(string url)
		{
			int retryIndex = 3;
			do
			{
				ResponseModel<string> tokenMol = await GetTokenStr(url);
				if (tokenMol.success)
				{
					WebApiUrl.LOGIN_TOKEN = tokenMol.content;
					retryIndex = 0;
					continue;
				}
				LogHelper.LogInstance.Info("lenovoid login failed,Msg" + tokenMol.desc);
				int num2;
				if (!tokenMol.desc.Contains("errorCode"))
				{
					int num = retryIndex - 1;
					num2 = num;
				}
				else
				{
					num2 = 0;
				}
				retryIndex = num2;
			}
			while (retryIndex > 0);
		}

		public void LoginGetUserInfo(Window win, Action action)
		{
			UserLoginFormData userLoginFormData = new UserLoginFormData();
			userLoginFormData.UserSource = "lenovoId";
			LenovoIdUserLoginFormData lenovoIdUserLoginFormData = new LenovoIdUserLoginFormData();
			lenovoIdUserLoginFormData.UserName = null;
			lenovoIdUserLoginFormData.WUST = WebApiUrl.LOGIN_TOKEN;
			userLoginFormData.UserData = JsonConvert.SerializeObject(lenovoIdUserLoginFormData);
			UserService.Single.Login(userLoginFormData, win);
			action?.Invoke();
		}

		private void CloseCommandHandler(object parameter)
		{
			WebView2Helper.Instance.DisposeAll();
			LenovoIdWindow obj = parameter as LenovoIdWindow;
			if (obj != null)
			{
				((Window)obj).Close();
			}
		}

		private void RefreshCommandHandler(object parameter)
		{
			(parameter as LenovoIdWindow)?.Reload();
		}

		private void FeedBackCommandHandler(object data)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuFeedbackButtonClick", "menu-feedback button click", 0L).Build());
			Window val = (Window)(object)new FeedbackMainViewOnLogin(LenovoIdWindow, isMainWindowLoad: false);
			val.ShowDialog();
		}
	}
}
namespace lenovo.mbg.service.lmsa.Common
{
	public class CommonHelper
	{
		public static string GetCurrentVersion()
		{
			return Assembly.GetEntryAssembly().GetName().Name + " V" + Assembly.GetExecutingAssembly().GetName().Version.ToString();
		}

		public static string VersionDownloadUrlAnalysis(string path)
		{
			return ApplcationClass.VersionDownloadUrlHeader + path;
		}
	}
	public static class FullScreenManager
	{
		internal struct MINMAXINFO
		{
			public POINT ptReserved;

			public POINT ptMaxSize;

			public POINT ptMaxPosition;

			public POINT ptMinTrackSize;

			public POINT ptMaxTrackSize;
		}

		[StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
		internal class MONITORINFO
		{
			public int cbSize = Marshal.SizeOf(typeof(MONITORINFO));

			public RECT rcMonitor;

			public RECT rcWork;

			public int dwFlags;
		}

		internal struct POINT(int x, int y)
		{
			public int x = x;

			public int y = y;
		}

		internal struct RECT
		{
			public int left;

			public int top;

			public int right;

			public int bottom;

			public static readonly RECT Empty;

			public int Width => Math.Abs(right - left);

			public int Height => bottom - top;

			public bool IsEmpty => left >= right || top >= bottom;

			public RECT(int left, int top, int right, int bottom)
			{
				this.left = left;
				this.top = top;
				this.right = right;
				this.bottom = bottom;
			}

			public RECT(RECT rcSrc)
			{
				left = rcSrc.left;
				top = rcSrc.top;
				right = rcSrc.right;
				bottom = rcSrc.bottom;
			}

			public override string ToString()
			{
				if (this == Empty)
				{
					return "RECT {Empty}";
				}
				return "RECT { left : " + left + " / top : " + top + " / right : " + right + " / bottom : " + bottom + " }";
			}

			public override bool Equals(object obj)
			{
				if (!(obj is Rect))
				{
					return false;
				}
				return this == (RECT)obj;
			}

			public override int GetHashCode()
			{
				return left.GetHashCode() + top.GetHashCode() + right.GetHashCode() + bottom.GetHashCode();
			}

			public static bool operator ==(RECT rect1, RECT rect2)
			{
				return rect1.left == rect2.left && rect1.top == rect2.top && rect1.right == rect2.right && rect1.bottom == rect2.bottom;
			}

			public static bool operator !=(RECT rect1, RECT rect2)
			{
				return !(rect1 == rect2);
			}
		}

		public static void RepairWpfWindowFullScreenBehavior(Window wpfWindow)
		{
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Invalid comparison between Unknown and I4
			//IL_004b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Expected O, but got Unknown
			if (wpfWindow == null)
			{
				return;
			}
			if ((int)wpfWindow.WindowState == 2)
			{
				wpfWindow.WindowState = (WindowState)0;
				((FrameworkElement)wpfWindow).Loaded += (RoutedEventHandler)delegate
				{
					wpfWindow.WindowState = (WindowState)2;
				};
			}
			wpfWindow.SourceInitialized += delegate
			{
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_002a: Unknown result type (might be due to invalid IL or missing references)
				//IL_0034: Expected O, but got Unknown
				IntPtr handle = new WindowInteropHelper(wpfWindow).Handle;
				HwndSource val = HwndSource.FromHwnd(handle);
				if (val != null)
				{
					val.AddHook(new HwndSourceHook(WindowProc));
				}
			};
		}

		private static IntPtr WindowProc(IntPtr hwnd, int msg, IntPtr wParam, IntPtr lParam, ref bool handled)
		{
			if (msg == 36)
			{
				WmGetMinMaxInfo(hwnd, lParam);
				handled = true;
			}
			return (IntPtr)0;
		}

		private static void WmGetMinMaxInfo(IntPtr hwnd, IntPtr lParam)
		{
			MINMAXINFO structure = (MINMAXINFO)Marshal.PtrToStructure(lParam, typeof(MINMAXINFO));
			int flags = 2;
			IntPtr intPtr = MonitorFromWindow(hwnd, flags);
			if (intPtr != IntPtr.Zero)
			{
				MONITORINFO mONITORINFO = new MONITORINFO();
				GetMonitorInfo(intPtr, mONITORINFO);
				RECT rcWork = mONITORINFO.rcWork;
				RECT rcMonitor = mONITORINFO.rcMonitor;
				structure.ptMaxPosition.x = Math.Abs(rcWork.left - rcMonitor.left);
				structure.ptMaxPosition.y = Math.Abs(rcWork.top - rcMonitor.top);
				structure.ptMaxSize.x = Math.Abs(rcWork.right - rcWork.left);
				structure.ptMaxSize.y = Math.Abs(rcWork.bottom - rcWork.top);
			}
			Marshal.StructureToPtr(structure, lParam, fDeleteOld: true);
		}

		[DllImport("user32")]
		internal static extern bool GetMonitorInfo(IntPtr hMonitor, MONITORINFO lpmi);

		[DllImport("User32")]
		internal static extern IntPtr MonitorFromWindow(IntPtr handle, int flags);
	}
}
namespace lenovo.mbg.service.lmsa.Properties
{
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "18.0.0.0")]
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
					ResourceManager resourceManager = new ResourceManager("lenovo.mbg.service.lmsa.Properties.Resources", typeof(Resources).Assembly);
					resourceMan = resourceManager;
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

		internal static string AddPlugInBusyTip => ResourceManager.GetString("AddPlugInBusyTip", resourceCulture);

		internal static string AddPlugInNullTip => ResourceManager.GetString("AddPlugInNullTip", resourceCulture);

		internal static string CarchTip_Loading => ResourceManager.GetString("CarchTip_Loading", resourceCulture);

		internal static string CheckToolVersionFailed => ResourceManager.GetString("CheckToolVersionFailed", resourceCulture);

		internal static string ClientUpdateTip_UpdateTip => ResourceManager.GetString("ClientUpdateTip_UpdateTip", resourceCulture);

		internal static string DELETE_RESOURCE_CONFIRM => ResourceManager.GetString("DELETE_RESOURCE_CONFIRM", resourceCulture);

		internal static string FrameUpdateTip_DownloadFailed => ResourceManager.GetString("FrameUpdateTip_DownloadFailed", resourceCulture);

		internal static string FrameUpdateTip_DownloadFailed_MD5CheckFailed => ResourceManager.GetString("FrameUpdateTip_DownloadFailed_MD5CheckFailed", resourceCulture);

		internal static string FrameUpdateTip_DownloadFailed_NoEnoughSpace => ResourceManager.GetString("FrameUpdateTip_DownloadFailed_NoEnoughSpace", resourceCulture);

		internal static string FrameUpdateTip_HasNoNewVersion => ResourceManager.GetString("FrameUpdateTip_HasNoNewVersion", resourceCulture);

		internal static string FrameUpdateTip_InstallTip => ResourceManager.GetString("FrameUpdateTip_InstallTip", resourceCulture);

		internal static string FrameUpdateTip_UpdateTip => ResourceManager.GetString("FrameUpdateTip_UpdateTip", resourceCulture);

		internal static string HostUpdateTip_DownloadTip => ResourceManager.GetString("HostUpdateTip_DownloadTip", resourceCulture);

		internal static string HostUpdateTip_ReDownloadTip => ResourceManager.GetString("HostUpdateTip_ReDownloadTip", resourceCulture);

		internal static string HostUpdateTip_UpdateTip => ResourceManager.GetString("HostUpdateTip_UpdateTip", resourceCulture);

		internal static string MessageBoxCommonCancelTitle => ResourceManager.GetString("MessageBoxCommonCancelTitle", resourceCulture);

		internal static string NoNetworkTips => ResourceManager.GetString("NoNetworkTips", resourceCulture);

		internal static string NoNetworkTitleTip => ResourceManager.GetString("NoNetworkTitleTip", resourceCulture);

		internal static string Plugin_Fatal_Error_Message => ResourceManager.GetString("Plugin_Fatal_Error_Message", resourceCulture);

		internal static string Plugin_UpdateTip_Version => ResourceManager.GetString("Plugin_UpdateTip_Version", resourceCulture);

		internal static string Plugin_Updating_Watting => ResourceManager.GetString("Plugin_Updating_Watting", resourceCulture);

		internal static string PluginAddError_FileUncorrect => ResourceManager.GetString("PluginAddError_FileUncorrect", resourceCulture);

		internal static string PluginAddErrorTip_FileUncorrect => ResourceManager.GetString("PluginAddErrorTip_FileUncorrect", resourceCulture);

		internal static string PlugInsUpdate_InstallingTip => ResourceManager.GetString("PlugInsUpdate_InstallingTip", resourceCulture);

		internal static string PlugInsUpdateTip_Button_Cancel => ResourceManager.GetString("PlugInsUpdateTip_Button_Cancel", resourceCulture);

		internal static string PlugInsUpdateTip_Button_OK => ResourceManager.GetString("PlugInsUpdateTip_Button_OK", resourceCulture);

		internal static string PlugInsUpdateTip_DownloadFailed => ResourceManager.GetString("PlugInsUpdateTip_DownloadFailed", resourceCulture);

		internal static string PlugInsUpdateTip_DownloadFailed_MD5CheckFailed => ResourceManager.GetString("PlugInsUpdateTip_DownloadFailed_MD5CheckFailed", resourceCulture);

		internal static string PlugInsUpdateTip_DownloadFailed_NoEnoughSpace => ResourceManager.GetString("PlugInsUpdateTip_DownloadFailed_NoEnoughSpace", resourceCulture);

		internal static string PlugInsUpdateTip_DownloadTip => ResourceManager.GetString("PlugInsUpdateTip_DownloadTip", resourceCulture);

		internal static string PlugInsUpdateTip_InstallButtonTip => ResourceManager.GetString("PlugInsUpdateTip_InstallButtonTip", resourceCulture);

		internal static string PlugInsUpdateTip_InstallCancelButtonTip => ResourceManager.GetString("PlugInsUpdateTip_InstallCancelButtonTip", resourceCulture);

		internal static string PlugInsUpdateTip_InstallTip => ResourceManager.GetString("PlugInsUpdateTip_InstallTip", resourceCulture);

		internal static string PlugInsUpdateTip_RecommendUpdateTip1 => ResourceManager.GetString("PlugInsUpdateTip_RecommendUpdateTip1", resourceCulture);

		internal static string PlugInsUpdateTip_RecommendUpdateTip2 => ResourceManager.GetString("PlugInsUpdateTip_RecommendUpdateTip2", resourceCulture);

		internal static string PlugInsUpdateTip_UpdateResult_ButtonTitle => ResourceManager.GetString("PlugInsUpdateTip_UpdateResult_ButtonTitle", resourceCulture);

		internal static string PlugInsUpdateTip_UpdateResult_Fail => ResourceManager.GetString("PlugInsUpdateTip_UpdateResult_Fail", resourceCulture);

		internal static string PlugInsUpdateTip_UpdateResult_NotEnoughDisk => ResourceManager.GetString("PlugInsUpdateTip_UpdateResult_NotEnoughDisk", resourceCulture);

		internal static string PlugInsUpdateTip_UpdateResult_Suc => ResourceManager.GetString("PlugInsUpdateTip_UpdateResult_Suc", resourceCulture);

		internal static string PlugInsUpdateTip_UpdateTip => ResourceManager.GetString("PlugInsUpdateTip_UpdateTip", resourceCulture);

		internal static string PlugInsUpdateTip_UpdateTip_InstallFirst => ResourceManager.GetString("PlugInsUpdateTip_UpdateTip_InstallFirst", resourceCulture);

		internal static string QFeedbackStr => ResourceManager.GetString("QFeedbackStr", resourceCulture);

		internal static string QFeedbackStrTest => ResourceManager.GetString("QFeedbackStrTest", resourceCulture);

		internal static string ServerNorespond => ResourceManager.GetString("ServerNorespond", resourceCulture);

		internal static string ServerNorespondTip => ResourceManager.GetString("ServerNorespondTip", resourceCulture);

		internal static string Warning_Close_Flashing => ResourceManager.GetString("Warning_Close_Flashing", resourceCulture);

		internal static string Warning_Close_Updating => ResourceManager.GetString("Warning_Close_Updating", resourceCulture);

		internal static string Working_Update_Version => ResourceManager.GetString("Working_Update_Version", resourceCulture);

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
namespace lenovo.mbg.service.lmsa.ViewV6
{
	public class ExistsSpacePathView : UserControl, IMessageViewV6, IComponentConnector, IStyleConnector
	{
		internal RowDefinition mm;

		internal Border IconBd;

		internal Path IconPath;

		internal TextBlockEx txtInfo;

		internal ListView listview;

		internal Button btnClose;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public ExistsSpacePathView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		public void Init(List<string> list, string msg)
		{
			((ItemsControl)listview).ItemsSource = list;
			txtInfo.LangKey = msg;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			FireClose(null);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		private void TextMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
		{
			TextBlock val = (TextBlock)((sender is TextBlock) ? sender : null);
			string text = val.Text;
			GlobalFun.OpenFileExplorer(text);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/existsspacepathview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Expected O, but got Unknown
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			//IL_0073: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Expected O, but got Unknown
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0094: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				mm = (RowDefinition)target;
				break;
			case 2:
				IconBd = (Border)target;
				break;
			case 3:
				IconPath = (Path)target;
				break;
			case 4:
				txtInfo = (TextBlockEx)target;
				break;
			case 5:
				listview = (ListView)target;
				break;
			case 7:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
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
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			if (connectionId == 6)
			{
				((UIElement)(TextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(TextMouseLeftButtonDown);
			}
		}
	}
	public class InstallMADialogV6 : Window, IMessageWindowV6, IComponentConnector
	{
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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public InstallMADialogV6()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void BtnSaveClick(object sender, RoutedEventArgs e)
		{
			Result = true;
			((Window)this).Close();
		}

		private void BtnCloseClick(object sender, RoutedEventArgs e)
		{
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
				Uri uri = new Uri("/Software Fix;component/viewv6/installmadialogv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Expected O, but got Unknown
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_004c: Expected O, but got Unknown
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0066: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(BtnCloseClick);
				break;
			case 2:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(BtnCloseClick);
				break;
			case 3:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(BtnSaveClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class B2BPurchaseOverviewV6 : UserControl, IComponentConnector, IStyleConnector
	{
		internal TextBlock txtUser;

		internal ListBox PurchaseBtnList;

		internal Grid panel1;

		internal LangTextBlock txtBuyPanelTitle;

		internal B2BPricePanel BuyPanel;

		internal Border panel2;

		internal Border panel3;

		private bool _contentLoaded;

		public ObservableCollection<OrderModel> ActiveOrderArr { get; set; }

		public ObservableCollection<OrderModel> OrderArr { get; set; }

		public B2BPurchaseOverviewV6()
		{
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			InitializeComponent();
			OrderArr = new ObservableCollection<OrderModel>();
			ActiveOrderArr = new ObservableCollection<OrderModel>();
			((FrameworkElement)this).Loaded += (RoutedEventHandler)delegate
			{
				List<PurchaseBtnModel> list = new List<PurchaseBtnModel>();
				PurchaseBtnModel purchaseBtnModel = new PurchaseBtnModel
				{
					IsSelected = true,
					NameLangKey = "Current Purchases"
				};
				PurchaseBtnModel purchaseBtnModel2 = purchaseBtnModel;
				object obj = ((FrameworkElement)this).FindResource((object)"v6_CurrentPurchasesIcon");
				purchaseBtnModel2.NormalIcon = (ImageSource)((obj is ImageSource) ? obj : null);
				PurchaseBtnModel purchaseBtnModel3 = purchaseBtnModel;
				object obj2 = ((FrameworkElement)this).FindResource((object)"v6_CurrentPurchasesIconSelected");
				purchaseBtnModel3.SelectedIcon = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
				list.Add(purchaseBtnModel);
				purchaseBtnModel = new PurchaseBtnModel
				{
					NameLangKey = "Purchase History"
				};
				PurchaseBtnModel purchaseBtnModel4 = purchaseBtnModel;
				object obj3 = ((FrameworkElement)this).FindResource((object)"v6_PurchaseHistoryIcon");
				purchaseBtnModel4.NormalIcon = (ImageSource)((obj3 is ImageSource) ? obj3 : null);
				PurchaseBtnModel purchaseBtnModel5 = purchaseBtnModel;
				object obj4 = ((FrameworkElement)this).FindResource((object)"v6_PurchaseHistoryIconSelected");
				purchaseBtnModel5.SelectedIcon = (ImageSource)((obj4 is ImageSource) ? obj4 : null);
				list.Add(purchaseBtnModel);
				purchaseBtnModel = new PurchaseBtnModel
				{
					NameLangKey = "Support"
				};
				PurchaseBtnModel purchaseBtnModel6 = purchaseBtnModel;
				object obj5 = ((FrameworkElement)this).FindResource((object)"v6_SupportIcon");
				purchaseBtnModel6.NormalIcon = (ImageSource)((obj5 is ImageSource) ? obj5 : null);
				PurchaseBtnModel purchaseBtnModel7 = purchaseBtnModel;
				object obj6 = ((FrameworkElement)this).FindResource((object)"v6_SupportIconSelected");
				purchaseBtnModel7.SelectedIcon = (ImageSource)((obj6 is ImageSource) ? obj6 : null);
				list.Add(purchaseBtnModel);
				((ItemsControl)PurchaseBtnList).ItemsSource = list;
				txtUser.Text = UserService.Single.CurrentLoggedInUser.FullName;
				MessageWindowHelper.Instance.Loading("K1714", () => AppContext.WebApi.RequestContent<RespOrders>(WebApiUrl.CALL_B2B_ACTIVE_ORDERS_URL, new
				{
					macAddressRsa = RsaHelper.RSAEncrypt(WebApiContext.RSA_PUBLIC_KEY, GlobalFun.GetMacAddr())
				})).ContinueWith(delegate(Task<object> ar)
				{
					RespOrders data = ar.Result as RespOrders;
					((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
					{
						ActiveOrderArr.Clear();
						if (data?.enableOrderDtos != null)
						{
							foreach (OrderItem enableOrderDto in data.enableOrderDtos)
							{
								if (!(enableOrderDto.type == "FREE") && enableOrderDto.display)
								{
									DateTime dateTime = GlobalFun.ConvertDateTime(enableOrderDto.expiredDate);
									OrderModel orderModel = new OrderModel
									{
										Id = enableOrderDto.orderId.ToString(),
										Package = enableOrderDto.orderLevelDesc,
										EnableRefund = enableOrderDto.refund
									};
									if (enableOrderDto.effectiveDate.HasValue)
									{
										orderModel.Purchase = GlobalFun.ConvertDateTime(enableOrderDto.effectiveDate);
									}
									else
									{
										orderModel.Purchase = new DateTime(1970, 1, 1);
									}
									orderModel.Expired = dateTime;
									orderModel.MacAddr = RsaHelper.RSADecryptByPublicKey(WebApiContext.RSA_PUBLIC_KEY, enableOrderDto.macAddressRsa);
									orderModel.Status = enableOrderDto.orderStatus;
									orderModel.ServerStatus = enableOrderDto.serverOrderStatus;
									orderModel.ImeiUsedCount = enableOrderDto.imeiUsedCount;
									orderModel.IsMonthly = !enableOrderDto.imeiCount.HasValue;
									orderModel.RemainImei = enableOrderDto.imeiCount.GetValueOrDefault() - enableOrderDto.imeiUsedCount;
									orderModel.RemainDays = (dateTime - DateTime.Now).Days;
									orderModel.FlashedDevArr = enableOrderDto.imeiDtos;
									orderModel.DevInUse = enableOrderDto.imeiUsedCount.ToString();
									if (enableOrderDto.imeiCount > 0)
									{
										orderModel.DevInUse += $" / {enableOrderDto.imeiCount}";
									}
									if (enableOrderDto.usingDate.HasValue)
									{
										orderModel.StartUseDate = GlobalFun.ConvertDateTime(enableOrderDto.usingDate);
									}
									ActiveOrderArr.Add(orderModel);
								}
							}
							if (ActiveOrderArr.Count > 0)
							{
								ActiveOrderArr[ActiveOrderArr.Count - 1].SpliterVisible = (Visibility)2;
							}
						}
					});
					RespOrders orders = AppContext.WebApi.RequestContent<RespOrders>(WebApiUrl.CALL_B2B_ORDERS_URL, new
					{
						macAddressRsa = RsaHelper.RSAEncrypt(WebApiContext.RSA_PUBLIC_KEY, GlobalFun.GetMacAddr())
					});
					((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
					{
						OrderArr.Clear();
						RespOrders respOrders = orders;
						if (respOrders != null && respOrders.enableOrderDtos?.Count > 0)
						{
							foreach (OrderItem enableOrderDto2 in orders.enableOrderDtos)
							{
								if (!(enableOrderDto2.type == "FREE") && enableOrderDto2.display)
								{
									DateTime dateTime = GlobalFun.ConvertDateTime(enableOrderDto2.expiredDate);
									OrderModel orderModel = new OrderModel
									{
										Id = enableOrderDto2.orderId.ToString(),
										Package = enableOrderDto2.orderLevelDesc,
										EnableRefund = enableOrderDto2.refund,
										Purchase = GlobalFun.ConvertDateTime(enableOrderDto2.effectiveDate),
										Expired = dateTime,
										MacAddr = RsaHelper.RSADecryptByPublicKey(WebApiContext.RSA_PUBLIC_KEY, enableOrderDto2.macAddressRsa),
										Status = enableOrderDto2.orderStatus,
										ServerStatus = enableOrderDto2.serverOrderStatus,
										ImeiUsedCount = enableOrderDto2.imeiUsedCount,
										IsMonthly = !enableOrderDto2.imeiCount.HasValue,
										RemainImei = enableOrderDto2.imeiCount.GetValueOrDefault() - enableOrderDto2.imeiUsedCount,
										RemainDays = (dateTime - DateTime.Now).Days,
										FlashedDevArr = enableOrderDto2.imeiDtos
									};
									orderModel.DevInUse = enableOrderDto2.imeiUsedCount.ToString();
									if (enableOrderDto2.imeiCount > 0)
									{
										orderModel.DevInUse += $" / {enableOrderDto2.imeiCount}";
									}
									if (enableOrderDto2.usingDate.HasValue)
									{
										orderModel.StartUseDate = GlobalFun.ConvertDateTime(enableOrderDto2.usingDate);
									}
									OrderArr.Add(orderModel);
								}
							}
						}
						if (orders?.unableOrderDtos == null)
						{
							return;
						}
						foreach (OrderItem unableOrderDto in orders.unableOrderDtos)
						{
							if (!(unableOrderDto.type == "FREE") && unableOrderDto.display)
							{
								OrderModel orderModel2 = new OrderModel
								{
									Id = unableOrderDto.orderId.ToString(),
									Package = unableOrderDto.orderLevelDesc,
									EnableRefund = unableOrderDto.refund,
									Purchase = GlobalFun.ConvertDateTime(unableOrderDto.effectiveDate),
									Expired = GlobalFun.ConvertDateTime(unableOrderDto.expiredDate),
									MacAddr = RsaHelper.RSADecryptByPublicKey(WebApiContext.RSA_PUBLIC_KEY, unableOrderDto.macAddressRsa),
									Status = unableOrderDto.orderStatus,
									IsMonthly = !unableOrderDto.imeiCount.HasValue,
									ServerStatus = unableOrderDto.serverOrderStatus,
									ImeiUsedCount = unableOrderDto.imeiUsedCount,
									RemainImei = unableOrderDto.imeiCount.GetValueOrDefault() - unableOrderDto.imeiUsedCount,
									RemainDays = 0,
									FlashedDevArr = unableOrderDto.imeiDtos
								};
								orderModel2.DevInUse = unableOrderDto.imeiUsedCount.ToString();
								if (unableOrderDto.imeiCount > 0)
								{
									orderModel2.DevInUse += $" / {unableOrderDto.imeiCount}";
								}
								if (unableOrderDto.usingDate.HasValue)
								{
									orderModel2.StartUseDate = GlobalFun.ConvertDateTime(unableOrderDto.usingDate);
								}
								OrderArr.Add(orderModel2);
							}
						}
					});
				});
			};
			((FrameworkElement)this).DataContext = this;
			BuyPanel.OnBuyAction = null;
			if (UserService.Single.CurrentLoggedInUser.B2BBuyNowDisplay)
			{
				((UIElement)txtBuyPanelTitle).Visibility = (Visibility)0;
				((UIElement)BuyPanel).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)txtBuyPanelTitle).Visibility = (Visibility)1;
				((UIElement)BuyPanel).Visibility = (Visibility)1;
			}
		}

		private void PurchaseBtnList_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			ListBox val = (ListBox)((sender is ListBox) ? sender : null);
			if (((Selector)val).SelectedIndex != -1)
			{
				if (((Selector)val).SelectedIndex == 0)
				{
					((UIElement)panel1).Visibility = (Visibility)0;
					((UIElement)panel2).Visibility = (Visibility)2;
					((UIElement)panel3).Visibility = (Visibility)2;
				}
				else if (((Selector)val).SelectedIndex == 1)
				{
					((UIElement)panel1).Visibility = (Visibility)2;
					((UIElement)panel2).Visibility = (Visibility)0;
					((UIElement)panel3).Visibility = (Visibility)2;
				}
				else
				{
					((UIElement)panel1).Visibility = (Visibility)2;
					((UIElement)panel2).Visibility = (Visibility)2;
					((UIElement)panel3).Visibility = (Visibility)0;
				}
			}
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
		}

		private void OnLBtnDetail(object sender, MouseButtonEventArgs e)
		{
			OrderModel order = ((FrameworkElement)((sender is TextBlock) ? sender : null)).Tag as OrderModel;
			OrderDetailView orderDetailView = new OrderDetailView(order);
			((Window)orderDetailView).ShowDialog();
		}

		private void OnLBtnViewOrderId(object sender, MouseButtonEventArgs e)
		{
			OrderModel orderModel = ((FrameworkElement)((sender is TextBlock) ? sender : null)).Tag as OrderModel;
			string id = AppContext.WebApi.RequestBase(WebApiUrl.CALL_B2B_GET_ORDERID_URL, new
			{
				macAddressRsa = RsaHelper.RSAEncrypt(WebApiContext.RSA_PUBLIC_KEY, GlobalFun.GetMacAddr()),
				orderId = orderModel.Id
			}).content?.ToString();
			OrderRefundIDView orderRefundIDView = new OrderRefundIDView(id);
			((Window)orderRefundIDView).ShowDialog();
		}

		private void OnLBtnRefund(object sender, MouseButtonEventArgs e)
		{
			OrderModel orderModel = ((FrameworkElement)((sender is TextBlock) ? sender : null)).Tag as OrderModel;
			OrderRefundView orderRefundView = new OrderRefundView(orderModel.Id);
			((Window)orderRefundView).ShowDialog();
		}

		private void OnLBtnCancel(object sender, MouseButtonEventArgs e)
		{
			OrderCancelView orderCancelView = new OrderCancelView();
			((Window)orderCancelView).ShowDialog();
		}

		private void OnLBtnUrl(object sender, MouseButtonEventArgs e)
		{
			string text = ((TextBlock)((sender is TextBlock) ? sender : null)).Text;
			GlobalFun.OpenUrlByBrowser(text);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/b2bpurchaseoverviewv6.xaml", UriKind.Relative);
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
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Expected O, but got Unknown
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Expected O, but got Unknown
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Expected O, but got Unknown
			//IL_009c: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a6: Expected O, but got Unknown
			//IL_00aa: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Expected O, but got Unknown
			//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cd: Expected O, but got Unknown
			//IL_00d1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e7: Expected O, but got Unknown
			switch (connectionId)
			{
			case 8:
				txtUser = (TextBlock)target;
				break;
			case 9:
				PurchaseBtnList = (ListBox)target;
				((Selector)PurchaseBtnList).SelectionChanged += new SelectionChangedEventHandler(PurchaseBtnList_SelectionChanged);
				break;
			case 10:
				panel1 = (Grid)target;
				break;
			case 11:
				txtBuyPanelTitle = (LangTextBlock)target;
				break;
			case 12:
				BuyPanel = (B2BPricePanel)target;
				break;
			case 13:
				panel2 = (Border)target;
				break;
			case 14:
				panel3 = (Border)target;
				break;
			case 15:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 16:
				((UIElement)(TextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnUrl);
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
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			//IL_0075: Unknown result type (might be due to invalid IL or missing references)
			//IL_007f: Expected O, but got Unknown
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0099: Expected O, but got Unknown
			//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b3: Expected O, but got Unknown
			//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cd: Expected O, but got Unknown
			//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e7: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnDetail);
				break;
			case 2:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnRefund);
				break;
			case 3:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnDetail);
				break;
			case 4:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnDetail);
				break;
			case 5:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnDetail);
				break;
			case 6:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnViewOrderId);
				break;
			case 7:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnCancel);
				break;
			}
		}
	}
	public class PurchaseBtnModel
	{
		public bool IsSelected { get; set; }

		public string NameLangKey { get; set; }

		public ImageSource NormalIcon { get; set; }

		public ImageSource SelectedIcon { get; set; }
	}
	public class OrderModel : NotifyBase
	{
		private string _Status;

		private string _ServerStatus;

		public string Id { get; set; }

		public string Package { get; set; }

		public DateTime Purchase { get; set; }

		public DateTime Expired { get; set; }

		public DateTime? StartUseDate { get; set; }

		public int ImeiUsedCount { get; set; }

		public string MacAddr { get; set; }

		public string DevInUse { get; set; }

		public int RemainDays { get; set; }

		public int RemainImei { get; set; }

		public bool EnableRefund { get; set; }

		public bool IsMonthly { get; set; }

		public Visibility SpliterVisible { get; set; }

		public string Status
		{
			get
			{
				return _Status;
			}
			set
			{
				_Status = value;
				OnPropertyChanged("Status");
			}
		}

		public string ServerStatus
		{
			get
			{
				return _ServerStatus;
			}
			set
			{
				_ServerStatus = value;
				OnPropertyChanged("ServerStatus");
			}
		}

		public List<FlashedDevModel> FlashedDevArr { get; set; }
	}
	public enum OrderStatus
	{
		Active,
		Using,
		Invalid,
		Refunding
	}
	public class OrderStatusItemStyleSelector : StyleSelector
	{
		public Style ActiveItemStyle { get; set; }

		public Style UsingItemStyle { get; set; }

		public Style InvalidItemStyle { get; set; }

		public Style RefundingItemStyle { get; set; }

		public Style ProcessItemStyle { get; set; }

		public override Style SelectStyle(object item, DependencyObject container)
		{
			OrderModel orderModel = item as OrderModel;
			if (orderModel?.ServerStatus == "ACTIVE")
			{
				if (orderModel.EnableRefund)
				{
					return ActiveItemStyle;
				}
				return UsingItemStyle;
			}
			if (orderModel?.ServerStatus == "USING")
			{
				return UsingItemStyle;
			}
			if (orderModel?.ServerStatus == "PROCESSING")
			{
				return ProcessItemStyle;
			}
			if (orderModel?.ServerStatus == "INVALID")
			{
				return InvalidItemStyle;
			}
			return RefundingItemStyle;
		}
	}
	public class ContentMessageBox : Window, IUserMsgControl, IComponentConnector
	{
		internal Border IconBd;

		internal Path IconPath;

		internal LangTextBlock tbkTitle;

		internal ContentControl content;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		internal Button btnClose;

		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Action<bool?> CloseAction { get; set; }

		public Action<bool?> CallBackAction { get; set; }

		public ContentMessageBox(FrameworkElement ui, string title, string btnOkTitle, string btnCancelTitle = null, bool isCloseBtn = false, MessageBoxImage icon = (MessageBoxImage)64)
		{
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Invalid comparison between Unknown and I4
			//IL_00e7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00eb: Invalid comparison between Unknown and I4
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
			content.Content = ui;
			ui.Tag = this;
			if (!string.IsNullOrEmpty(title) && Regex.IsMatch(title, "^K\\d{4}"))
			{
				tbkTitle.LangKey = title;
			}
			else
			{
				((TextBlock)tbkTitle).Text = title;
			}
			if (!string.IsNullOrEmpty(btnOkTitle) && Regex.IsMatch(btnOkTitle, "^K\\d{4}"))
			{
				btnOk.LangKey = btnOkTitle;
			}
			else
			{
				((ContentControl)btnOk).Content = btnOkTitle;
			}
			if ((int)icon == 48)
			{
				Path iconPath = IconPath;
				object obj = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBrushKey");
				((Shape)iconPath).Fill = (Brush)((obj is SolidColorBrush) ? obj : null);
				Border iconBd = IconBd;
				object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBkgBrushKey");
				iconBd.Background = (Brush)((obj2 is SolidColorBrush) ? obj2 : null);
			}
			else if ((int)icon == 16)
			{
				Path iconPath2 = IconPath;
				object obj3 = ((FrameworkElement)this).TryFindResource((object)"V6_ErrorBrushKey");
				((Shape)iconPath2).Fill = (Brush)((obj3 is SolidColorBrush) ? obj3 : null);
				Border iconBd2 = IconBd;
				object obj4 = ((FrameworkElement)this).TryFindResource((object)"V6_ErrorBkgBrushKey");
				iconBd2.Background = (Brush)((obj4 is SolidColorBrush) ? obj4 : null);
			}
			if (!string.IsNullOrEmpty(btnCancelTitle))
			{
				if (Regex.IsMatch(btnCancelTitle, "^K\\d{4}"))
				{
					btnCancel.LangKey = btnCancelTitle;
				}
				else
				{
					((ContentControl)btnCancel).Content = btnCancelTitle;
				}
				((UIElement)btnCancel).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)btnCancel).Visibility = (Visibility)2;
			}
			((UIElement)btnClose).Visibility = (Visibility)((!isCloseBtn) ? 2 : 0);
		}

		public Window GetMsgUi()
		{
			return (Window)(object)this;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			Result = null;
			CloseAction?.Invoke(null);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			Result = true;
			CloseAction?.Invoke(true);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			Result = false;
			CloseAction?.Invoke(false);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/contentmessagebox.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Expected O, but got Unknown
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Expected O, but got Unknown
			//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b8: Expected O, but got Unknown
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Expected O, but got Unknown
			//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00de: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				IconBd = (Border)target;
				break;
			case 2:
				IconPath = (Path)target;
				break;
			case 3:
				tbkTitle = (LangTextBlock)target;
				break;
			case 4:
				content = (ContentControl)target;
				break;
			case 5:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 6:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 7:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class CouponWindow : Window, IMessageWindowV6, IComponentConnector
	{
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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public CouponWindow()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Owner = Application.Current.MainWindow;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/couponwindow.xaml", UriKind.Relative);
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
	public class DebugPermissionWindow : Window, IMessageWindowV6, IComponentConnector
	{
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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public DebugPermissionWindow()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Owner = Application.Current.MainWindow;
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
		}

		private void Run_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
		{
			GlobalFun.OpenUrlByBrowser("www.lenovo.com/privacy/");
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/debugpermissionwindow.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Expected O, but got Unknown
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_004c: Expected O, but got Unknown
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0066: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(Button_Click);
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(Button_Click);
				break;
			case 3:
				((ContentElement)(Run)target).MouseLeftButtonDown += new MouseButtonEventHandler(Run_MouseLeftButtonDown);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class DevConnectView : Window, IMessageWindowV6, IComponentConnector
	{
		private static readonly List<string> DevNotifyArr = new List<string>();

		protected static object locker = new object();

		public static DevConnectView Current;

		internal TextBlock txtRandomCode;

		private bool _contentLoaded;

		public Window Win => (Window)(object)this;

		public long StartTimestamp { get; }

		public Action<IMessageWindowV6> CloseAction { get; set; }

		public Func<bool> AutoCloseConditionFunc { get; set; }

		public Predicate<object> ExecutePredicate { get; set; }

		public Predicate<object> CanClosePredicate { get; set; }

		public bool? Result { get; set; }

		public bool IsAsynnc { get; set; }

		public bool ShowNow { get; set; }

		public bool IsClosed { get; set; }

		public AutoResetEvent WaitHandler { get; set; }

		private static bool IsShow { get; set; }

		public DevConnectView()
		{
			InitializeComponent();
			txtRandomCode.Text = RandomAesKeyHelper.Instance.EncryptCode;
			WaitHandler = new AutoResetEvent(initialState: false);
			ShowNow = true;
			((Window)this).Owner = Application.Current.MainWindow;
			((Window)this).WindowStartupLocation = (WindowStartupLocation)2;
			CloseAction = delegate
			{
				IsShow = false;
			};
		}

		public void ShowWnd(string id)
		{
			if (!DevNotifyArr.Contains(id))
			{
				DevNotifyArr.Add(id);
			}
			Display();
		}

		public void HideWnd(string id)
		{
			DevNotifyArr.Remove(id);
			if (DevNotifyArr.Count == 0)
			{
				DisVisible();
			}
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			DisVisible();
		}

		public void Display()
		{
			lock (locker)
			{
				if (!IsShow)
				{
					IsShow = true;
					Current = new DevConnectView
					{
						ExecutePredicate = (object w) => MainWindowViewModel.CheckRescueFlash(),
						ShowNow = true
					};
					MessageWindowHelper.Instance.Show(Current, true);
				}
			}
		}

		private void DisVisible()
		{
			lock (locker)
			{
				WaitHandler.Set();
				DevConnectView current = Current;
				if (current != null)
				{
					((Window)current).Close();
				}
				IsShow = false;
			}
		}

		public bool CanExecute(object parameter)
		{
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/devconnectview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				txtRandomCode = (TextBlock)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class DeviceConnectView : UserControl, IComponentConnector, IStyleConnector
	{
		private bool _contentLoaded;

		public DeviceConnectView()
		{
			InitializeComponent();
			((FrameworkElement)this).DataContext = DeviceConnectViewModel.Instance;
		}

		private void OnMouseLeave(object sender, MouseEventArgs e)
		{
			object obj = ((FrameworkTemplate)((Control)this).Template).FindName("popup", (FrameworkElement)(object)this);
			Popup val = (Popup)((obj is Popup) ? obj : null);
			val.IsOpen = false;
		}

		private void StackPanel_LostFocus(object sender, RoutedEventArgs e)
		{
			object obj = ((FrameworkTemplate)((Control)this).Template).FindName("popup", (FrameworkElement)(object)this);
			Popup val = (Popup)((obj is Popup) ? obj : null);
			val.IsOpen = false;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/deviceconnectview.xaml", UriKind.Relative);
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

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IStyleConnector.Connect(int connectionId, object target)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(Grid)target).MouseLeave += new MouseEventHandler(OnMouseLeave);
				break;
			case 2:
				((UIElement)(Popup)target).MouseLeave += new MouseEventHandler(OnMouseLeave);
				((UIElement)(Popup)target).LostFocus += new RoutedEventHandler(StackPanel_LostFocus);
				break;
			}
		}
	}
	public class HostUpdateWindowV6 : Window, IMessageWindowV6, IComponentConnector
	{
		public enum ViewStatus
		{
			DetectedVersion,
			DowloadVersion,
			InstallVersion
		}

		private VersionModel mVersionModel;

		private ViewStatus mCurrentViewStatus = ViewStatus.DetectedVersion;

		private MessageBoxResult messageBoxChooseResult = (MessageBoxResult)0;

		public static readonly DependencyProperty StrPercentProperty = DependencyProperty.Register("StrPercent", typeof(string), typeof(HostUpdateWindowV6), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty PercentNumProperty = DependencyProperty.Register("PercentNum", typeof(double), typeof(HostUpdateWindowV6), new PropertyMetadata((object)0.0));

		public static readonly DependencyProperty StrDownloadSpeedProperty = DependencyProperty.Register("StrDownloadSpeed", typeof(string), typeof(HostUpdateWindowV6), new PropertyMetadata((object)string.Empty));

		private Action updateProgressAction;

		private volatile bool mRefreshUpgradeProgress = false;

		protected VersionModel currentDownloadModel = null;

		internal HostUpdateWindowV6 hostUpdateWindow;

		internal LangTextBlock TxbTips;

		internal Run txtVersion;

		internal TextBlock updatContent;

		internal TextBlock fileSize;

		internal LangTextBlock updateWarn;

		internal StackPanel panelDetected;

		internal CheckBox checkboxNotRemindMeForThisVersion;

		internal LangButton btnCancelUpgrade;

		internal LangButton btnUpgradeNow;

		internal StackPanel panelDownload;

		internal TextBlock TxbPercent;

		internal StackPanel panelInstall;

		internal LangButton btnCalcelInstall;

		internal LangButton btnInstallNow;

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

		public MessageBoxResult MessageBoxChooseResult
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return messageBoxChooseResult;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				messageBoxChooseResult = value;
			}
		}

		public string StrPercent
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrPercentProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrPercentProperty, (object)value);
			}
		}

		public double PercentNum
		{
			get
			{
				return (double)((DependencyObject)this).GetValue(PercentNumProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(PercentNumProperty, (object)value);
				StrPercent = Math.Round(value, 0).ToString();
			}
		}

		public string StrDownloadSpeed
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrDownloadSpeedProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrDownloadSpeedProperty, (object)value);
			}
		}

		public bool CanExecute(object parameter)
		{
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public HostUpdateWindowV6(ViewStatus viewStatus, bool isForceUpgrade, VersionModel viewmodel)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00be: Expected O, but got Unknown
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			if (isForceUpgrade)
			{
				((UIElement)checkboxNotRemindMeForThisVersion).Visibility = (Visibility)2;
				((UIElement)btnCancelUpgrade).Visibility = (Visibility)2;
				((UIElement)btnCalcelInstall).Visibility = (Visibility)2;
			}
			else
			{
				((UIElement)checkboxNotRemindMeForThisVersion).Visibility = (Visibility)0;
				((UIElement)btnCancelUpgrade).Visibility = (Visibility)0;
				((UIElement)btnCalcelInstall).Visibility = (Visibility)0;
			}
			ApplcationClass.ForceUpdate = viewmodel.ForceType;
			mVersionModel = viewmodel;
			((FrameworkElement)this).DataContext = viewmodel;
			((FrameworkElement)this).Loaded += new RoutedEventHandler(MessageBox_Common_Loaded);
			SwitchViewStatus(viewStatus);
			((Window)this).Closed += delegate
			{
				StopRefreshUpgradeProgress();
			};
		}

		private void SwitchViewStatus(ViewStatus viewStatus)
		{
			mCurrentViewStatus = viewStatus;
			switch (viewStatus)
			{
			case ViewStatus.DetectedVersion:
				TxbTips.LangKey = "K0286";
				((UIElement)panelDetected).Visibility = (Visibility)0;
				((UIElement)panelDownload).Visibility = (Visibility)2;
				((UIElement)panelInstall).Visibility = (Visibility)2;
				break;
			case ViewStatus.DowloadVersion:
				((UIElement)panelDetected).Visibility = (Visibility)2;
				((UIElement)panelDownload).Visibility = (Visibility)0;
				((UIElement)panelInstall).Visibility = (Visibility)2;
				TxbTips.LangKey = "K0293";
				break;
			case ViewStatus.InstallVersion:
				((UIElement)panelDetected).Visibility = (Visibility)2;
				((UIElement)panelDownload).Visibility = (Visibility)2;
				((UIElement)panelInstall).Visibility = (Visibility)0;
				TxbTips.LangKey = "K0356";
				break;
			}
		}

		private void MessageBox_Common_Loaded(object sender, RoutedEventArgs e)
		{
			UpgradeUserOptionManager upgradeUserOptionManager = new UpgradeUserOptionManager();
			VersionModel versionModel = ((FrameworkElement)this).DataContext as VersionModel;
			((ToggleButton)checkboxNotRemindMeForThisVersion).IsChecked = UpgradeRemindType.NotRemindForTheCurrentVersion.Equals(upgradeUserOptionManager.GetRemindType(versionModel.Version));
			StrPercent = "0";
			txtVersion.Text = mVersionModel.Version;
		}

		private void btnUpgradeNow_Click(object sender, RoutedEventArgs e)
		{
			((UIElement)updateWarn).Visibility = (Visibility)2;
			SwitchViewStatus(ViewStatus.DowloadVersion);
			BeginDownlad();
		}

		private void btnCancelUpgrade_Click(object sender, RoutedEventArgs e)
		{
			UpgradeRemindType type = ((!((ToggleButton)checkboxNotRemindMeForThisVersion).IsChecked.HasValue || !((ToggleButton)checkboxNotRemindMeForThisVersion).IsChecked.Value) ? UpgradeRemindType.RemindTomorrow : UpgradeRemindType.NotRemindForTheCurrentVersion);
			SaveRemindType(type);
			ApplcationClass.manualTrigger = true;
			ApplcationClass.FrameHasNewVersion = true;
			ApplcationClass.IsUpdatingPlug = false;
			VersionModel versionModel = ((FrameworkElement)this).DataContext as VersionModel;
			((Window)this).Close();
			ForceStopProcessIfNeed();
		}

		private void btnInstallNow_Click(object sender, RoutedEventArgs e)
		{
			btnInstallNow.LangKey = "K0365";
			((UIElement)btnInstallNow).IsEnabled = false;
			((UIElement)btnCalcelInstall).IsEnabled = false;
			Task.Run(delegate
			{
				UpdateManager.Instance.ToolUpdateWorker.InstallVersion(mVersionModel);
			});
		}

		private void btnCalcelInstall_Click(object sender, RoutedEventArgs e)
		{
			SaveRemindType(UpgradeRemindType.RemindTomorrow);
			((Window)this).Close();
			ForceStopProcessIfNeed();
		}

		private void btnCloseWin_Click(object sender, RoutedEventArgs e)
		{
			if (mCurrentViewStatus == ViewStatus.DetectedVersion)
			{
				btnCancelUpgrade_Click(null, null);
			}
			else
			{
				btnCalcelInstall_Click(null, null);
			}
		}

		private void SaveRemindType(UpgradeRemindType type)
		{
			VersionModel versionModel = ((FrameworkElement)this).DataContext as VersionModel;
			UpgradeUserOptionManager upgradeUserOptionManager = new UpgradeUserOptionManager();
			upgradeUserOptionManager.SaveUpgradeRemindType(new UpgradeRemindTypeInfo
			{
				CurrentVersion = LMSAContext.MainProcessVersion,
				NewVersion = versionModel.Version,
				RemindType = type,
				SetDate = DateTime.Now
			});
		}

		private async void ForceStopProcessIfNeed()
		{
			if (((FrameworkElement)this).DataContext is VersionModel versionModel && versionModel.ForceType)
			{
				if (Application.Current.MainWindow is SplashScreenWindow)
				{
					LogHelper.LogInstance.Info("========================== Software Fix client force upgrade, user cancel upgrade ==========================");
					Environment.Exit(0);
				}
				else if (Application.Current.MainWindow is MainWindow && await MainWindowViewModel.SingleInstance.CheckCanCloseWindow())
				{
					MainWindowViewModel.SingleInstance.Exit(0);
				}
			}
		}

		private void BeginDownlad()
		{
			PercentNum = 0.0;
			UpdateManager.Instance.ToolUpdateWorker.OnDownloadStatusChanged += ToolUpdateWorker_OnDownloadStatusChanged;
			ApplcationClass.IsUpdatingPlug = true;
			Task.Factory.StartNew(delegate
			{
				UpdateManager.Instance.ToolUpdateWorker.DownloadVersion(mVersionModel);
			});
		}

		private void BeginRefreshDonwloadProgress()
		{
			if (mRefreshUpgradeProgress)
			{
				return;
			}
			mRefreshUpgradeProgress = true;
			double percent = 0.0;
			if (updateProgressAction == null)
			{
				updateProgressAction = delegate
				{
					PercentNum = percent * 100.0;
					StrDownloadSpeed = currentDownloadModel?.downloadSpeed;
				};
			}
			Task.Factory.StartNew(delegate
			{
				while (mRefreshUpgradeProgress)
				{
					if (currentDownloadModel != null && currentDownloadModel.downloadFileSize > 0)
					{
						percent = double.Parse(currentDownloadModel.downloadedSize.ToString()) / double.Parse(currentDownloadModel.downloadFileSize.ToString());
					}
					((DispatcherObject)this).Dispatcher.Invoke(updateProgressAction);
				}
			});
		}

		private void StopRefreshUpgradeProgress()
		{
			UpdateManager.Instance.ToolUpdateWorker.OnDownloadStatusChanged -= ToolUpdateWorker_OnDownloadStatusChanged;
			updateProgressAction = null;
			mRefreshUpgradeProgress = false;
			currentDownloadModel = null;
			UpdateManager.Instance.ToolUpdateWorker.CancelDownloadVersion(mVersionModel);
		}

		private void ToolUpdateWorker_OnDownloadStatusChanged(object sender, DownloadStatusChangedArgs e)
		{
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				if (e.Data != null)
				{
					currentDownloadModel = e.Data as VersionModel;
					switch (currentDownloadModel.downloadStatus)
					{
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.DOWNLOADING:
						BeginRefreshDonwloadProgress();
						break;
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.FAILED:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.MD5CHECKFAILED:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.GETFILESIZEFAILED:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.UNENOUGHDISKSPACE:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.CREATEDIRECTORYFAILED:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.DOWNLOADFILENOTFOUND:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.UNDEFINEERROR:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.NETWORKCONNECTIONERROR:
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.FILERENAMEFAILED:
						StopRefreshUpgradeProgress();
						SwitchViewStatus(ViewStatus.DetectedVersion);
						((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
						{
							((UIElement)updateWarn).Visibility = (Visibility)0;
							updateWarn.LangKey = "K0357";
						});
						break;
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.PAUSE:
						StopRefreshUpgradeProgress();
						break;
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.SUCCESS:
						StopRefreshUpgradeProgress();
						((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
						{
							SwitchViewStatus(ViewStatus.InstallVersion);
							ApplcationClass.IsUpdatingPlug = false;
						});
						break;
					case lenovo.mbg.service.framework.download.DownloadUnity.DownloadStatus.WAITTING:
						StopRefreshUpgradeProgress();
						break;
					default:
						ApplcationClass.IsUpdatingPlug = false;
						break;
					}
				}
			});
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/hostupdatewindowv6.xaml", UriKind.Relative);
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
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Expected O, but got Unknown
			//IL_0093: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Expected O, but got Unknown
			//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ae: Expected O, but got Unknown
			//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bf: Expected O, but got Unknown
			//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e1: Expected O, but got Unknown
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f2: Expected O, but got Unknown
			//IL_0110: Unknown result type (might be due to invalid IL or missing references)
			//IL_011a: Expected O, but got Unknown
			//IL_0139: Unknown result type (might be due to invalid IL or missing references)
			//IL_0143: Expected O, but got Unknown
			//IL_0148: Unknown result type (might be due to invalid IL or missing references)
			//IL_0152: Expected O, but got Unknown
			//IL_0156: Unknown result type (might be due to invalid IL or missing references)
			//IL_0160: Expected O, but got Unknown
			//IL_0164: Unknown result type (might be due to invalid IL or missing references)
			//IL_016e: Expected O, but got Unknown
			//IL_0189: Unknown result type (might be due to invalid IL or missing references)
			//IL_0193: Expected O, but got Unknown
			//IL_01af: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b9: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				hostUpdateWindow = (HostUpdateWindowV6)target;
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(btnCalcelInstall_Click);
				break;
			case 3:
				TxbTips = (LangTextBlock)target;
				break;
			case 4:
				txtVersion = (Run)target;
				break;
			case 5:
				updatContent = (TextBlock)target;
				break;
			case 6:
				fileSize = (TextBlock)target;
				break;
			case 7:
				updateWarn = (LangTextBlock)target;
				break;
			case 8:
				panelDetected = (StackPanel)target;
				break;
			case 9:
				checkboxNotRemindMeForThisVersion = (CheckBox)target;
				break;
			case 10:
				btnCancelUpgrade = (LangButton)target;
				((ButtonBase)btnCancelUpgrade).Click += new RoutedEventHandler(btnCancelUpgrade_Click);
				break;
			case 11:
				btnUpgradeNow = (LangButton)target;
				((ButtonBase)btnUpgradeNow).Click += new RoutedEventHandler(btnUpgradeNow_Click);
				break;
			case 12:
				panelDownload = (StackPanel)target;
				break;
			case 13:
				TxbPercent = (TextBlock)target;
				break;
			case 14:
				panelInstall = (StackPanel)target;
				break;
			case 15:
				btnCalcelInstall = (LangButton)target;
				((ButtonBase)btnCalcelInstall).Click += new RoutedEventHandler(btnCalcelInstall_Click);
				break;
			case 16:
				btnInstallNow = (LangButton)target;
				((ButtonBase)btnInstallNow).Click += new RoutedEventHandler(btnInstallNow_Click);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class LanguageSelectViewV6 : Window, IMessageWindowV6, IComponentConnector
	{
		internal Grid gridLanguageList;

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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public LanguageSelectViewV6()
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((FrameworkElement)this).Loaded += (RoutedEventHandler)delegate
			{
				string _current = LMSAContext.CurrentLanguage;
				IEnumerable<RadioButton> source = LogicalTreeHelper.GetChildren((FrameworkElement)(object)gridLanguageList).OfType<RadioButton>();
				RadioButton val = source.FirstOrDefault((RadioButton x) => ((FrameworkElement)x).Tag.ToString() == _current);
				if (val != null)
				{
					((ToggleButton)val).IsChecked = true;
				}
			};
		}

		private async void BtnSaveClick(object sender, RoutedEventArgs e)
		{
			IEnumerable<RadioButton> radioButtons = LogicalTreeHelper.GetChildren((FrameworkElement)(object)gridLanguageList).OfType<RadioButton>();
			RadioButton selected = radioButtons.FirstOrDefault((RadioButton x) => ((ToggleButton)x).IsChecked.Value);
			string langSelect = ((FrameworkElement)selected).Tag.ToString();
			if (LMSAContext.CurrentLanguage == langSelect)
			{
				BtnCloseClick(null, null);
			}
			else if (await MessageWindowHelper.Instance.Show("K0071", "K0299", "K0301", "K0300", showClose: true, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true) == true)
			{
				global::Smart.LanguageService.SetCurrentLanguage(langSelect);
				if (await MainWindowViewModel.SingleInstance.CheckCanCloseWindow())
				{
					LogHelper.LogInstance.Info("Language select page Save button, run new Software Fix Client.");
					WebView2Helper.Instance.DisposeAll();
					Process p = new Process();
					p.StartInfo.FileName = AppDomain.CurrentDomain.BaseDirectory + "Software Fix.exe";
					p.StartInfo.Verb = "RunAs";
					p.StartInfo.Arguments = string.Format("restart " + Process.GetCurrentProcess().Id, Array.Empty<object>());
					p.StartInfo.UseShellExecute = false;
					p.Start();
					MainWindowViewModel.SingleInstance.Exit(0);
				}
			}
			else
			{
				LogHelper.LogInstance.Info("Language select page Save button canceled.");
				BtnCloseClick(null, null);
			}
		}

		private void BtnCloseClick(object sender, RoutedEventArgs e)
		{
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
				Uri uri = new Uri("/Software Fix;component/viewv6/languageselectviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(BtnCloseClick);
				break;
			case 2:
				gridLanguageList = (Grid)target;
				break;
			case 3:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(BtnCloseClick);
				break;
			case 4:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(BtnSaveClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class NoticeManagementViewV6 : UserControl, IComponentConnector, IStyleConnector
	{
		private System.Threading.Timer mTimer;

		private volatile bool _IsLoading = false;

		private int _TickCount = 0;

		internal Grid grid;

		internal Button btnNotification;

		internal Rectangle redDot10;

		internal NonTopmostPopup popupNotification;

		internal Grid menuContent;

		internal ListBox NotifyListBox;

		private bool _contentLoaded;

		public ObservableCollection<NoticeInfo> NoticeLists { get; set; }

		public NoticeManagementViewV6()
		{
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			//IL_0068: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Expected O, but got Unknown
			InitializeComponent();
			NoticeLists = new ObservableCollection<NoticeInfo>();
			mTimer = new System.Threading.Timer(delegate
			{
				bool isExecuteWork = false;
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke<bool>((Func<bool>)(() => ((UIElement)btnNotification).IsEnabled = !isExecuteWork));
				}
				_TickCount++;
				OnlineUserInfo currentLoggedInUser = UserService.Single.CurrentLoggedInUser;
				if (currentLoggedInUser != null && currentLoggedInUser.IsRtNotify && _TickCount >= 1800)
				{
					_TickCount = 0;
					LoadNotice();
				}
			}, null, 1000, 1000);
			((FrameworkElement)this).Loaded += (RoutedEventHandler)delegate
			{
				UserService.Single.OnlineUserChanged += Single_OnlineUserChanged;
			};
			((FrameworkElement)this).Unloaded += (RoutedEventHandler)delegate
			{
				UserService.Single.OnlineUserChanged -= Single_OnlineUserChanged;
			};
		}

		public void ChangeIsEnabled(bool isEnabled)
		{
			((UIElement)grid).IsEnabled = isEnabled;
			((UIElement)grid).Opacity = (isEnabled ? 1.0 : 0.3);
		}

		private void Single_OnlineUserChanged(object sender, OnlineUserChangedEventArgs e)
		{
			LoadNotice();
		}

		private void LoadNotice()
		{
			if (_IsLoading)
			{
				return;
			}
			_IsLoading = true;
			Task.Factory.StartNew((Func<Task>)async delegate
			{
				List<NoticeInfo> notices = await Notices.Single.SyncAsync();
				NoticeInfo latestNotice = Notices.Single.LatestNotice;
				if (notices != null)
				{
					notices = notices.OrderByDescending((NoticeInfo m) => m.modifyDate).ToList();
				}
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						((UIElement)redDot10).Visibility = (Visibility)((latestNotice == null) ? 2 : 0);
						NoticeLists.Clear();
						if (notices != null)
						{
							foreach (NoticeInfo item in notices)
							{
								NoticeLists.Add(item);
							}
						}
						((ItemsControl)NotifyListBox).ItemsSource = NoticeLists;
						if (latestNotice?.type != "Feedback")
						{
							ShowNotice(latestNotice);
						}
						_IsLoading = false;
					});
				}
			});
		}

		private void btnDeleteClick(object sender, RoutedEventArgs e)
		{
			NoticeInfo notice = ((ButtonBase)((sender is Button) ? sender : null)).CommandParameter as NoticeInfo;
			RemoveNotice(notice);
		}

		private void OnNotifySelected(object sender, SelectionChangedEventArgs e)
		{
			if (((Selector)NotifyListBox).SelectedIndex != -1)
			{
				((Popup)popupNotification).IsOpen = false;
				NoticeInfo notice = ((Selector)NotifyListBox).SelectedValue as NoticeInfo;
				ShowNotice(notice);
				((Selector)NotifyListBox).SelectedIndex = -1;
			}
		}

		private void OnBtnNotification(object sender, RoutedEventArgs e)
		{
			if (NoticeLists.Count == 0)
			{
				MessageWindowHelper.Instance.Show(null, "K1296", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
			}
			else if (!((Popup)popupNotification).IsOpen)
			{
				((Popup)popupNotification).IsOpen = true;
			}
		}

		private async void OnBtnDelte(object sender, RoutedEventArgs e)
		{
			if (await MessageWindowHelper.Instance.Show(null, "K0712", "K0327", "K0208", showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true) == true)
			{
				object originalSource = e.OriginalSource;
				NoticeInfo model = ((FrameworkElement)((originalSource is Button) ? originalSource : null)).Tag as NoticeInfo;
				RemoveNotice(model);
			}
		}

		private void ShowNotice(NoticeInfo notice)
		{
			if (notice != null)
			{
				Notices.Single.Show(notice);
				NoticeInfo noticeInfo = NoticeLists.First((NoticeInfo n) => n.id == notice.id && n.noticeType == notice.noticeType);
				noticeInfo.isChecked = true;
				UpdateNotifyRedDot();
			}
		}

		private void RemoveNotice(NoticeInfo notice)
		{
			if (notice != null)
			{
				Notices.Single.RemoveLocalNotice(notice);
				NoticeLists.Remove(notice);
				UpdateNotifyRedDot();
			}
		}

		private void UpdateNotifyRedDot()
		{
			if (NoticeLists.FirstOrDefault((NoticeInfo p) => !p.isChecked) == null)
			{
				((UIElement)redDot10).Visibility = (Visibility)2;
			}
			else
			{
				((UIElement)redDot10).Visibility = (Visibility)0;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/noticemanagementviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Expected O, but got Unknown
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Expected O, but got Unknown
			//IL_007c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Expected O, but got Unknown
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0094: Expected O, but got Unknown
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Expected O, but got Unknown
			switch (connectionId)
			{
			case 2:
				grid = (Grid)target;
				break;
			case 3:
				btnNotification = (Button)target;
				((ButtonBase)btnNotification).Click += new RoutedEventHandler(OnBtnNotification);
				break;
			case 4:
				redDot10 = (Rectangle)target;
				break;
			case 5:
				popupNotification = (NonTopmostPopup)target;
				break;
			case 6:
				menuContent = (Grid)target;
				break;
			case 7:
				NotifyListBox = (ListBox)target;
				((Selector)NotifyListBox).SelectionChanged += new SelectionChangedEventHandler(OnNotifySelected);
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
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			if (connectionId == 1)
			{
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnDelte);
			}
		}
	}
	public class PicMessageBox : Window, IUserMsgControl, IComponentConnector
	{
		internal Image img;

		internal LangTextBlock tbkTitle;

		internal LangTextBlock txtInfo;

		internal DockPanel panelNotify;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		internal Button btnClose;

		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Action<bool?> CloseAction { get; set; }

		public Action<bool?> CallBackAction { get; set; }

		public PicMessageBox()
		{
			InitializeComponent();
		}

		public void Init(string title, string message, string imagePath, string btnOkTitle, string btnCancelTitle, bool isCloseBtn, bool isNotifyText)
		{
			//IL_016c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0176: Expected O, but got Unknown
			if (!string.IsNullOrEmpty(title) && Regex.IsMatch(title, "^K\\d{4}"))
			{
				tbkTitle.LangKey = title;
			}
			else
			{
				((TextBlock)tbkTitle).Text = title;
			}
			if (!string.IsNullOrEmpty(message) && Regex.IsMatch(message, "^K\\d{4}"))
			{
				txtInfo.LangKey = message;
			}
			else
			{
				((TextBlock)txtInfo).Text = message;
			}
			if (!string.IsNullOrEmpty(btnOkTitle))
			{
				if (Regex.IsMatch(btnOkTitle, "^K\\d{4}"))
				{
					btnOk.LangKey = btnOkTitle;
				}
				else
				{
					((ContentControl)btnOk).Content = btnOkTitle;
				}
				((UIElement)btnOk).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)btnOk).Visibility = (Visibility)2;
			}
			if (!string.IsNullOrEmpty(btnCancelTitle))
			{
				if (Regex.IsMatch(btnCancelTitle, "^K\\d{4}"))
				{
					btnCancel.LangKey = btnCancelTitle;
				}
				else
				{
					((ContentControl)btnCancel).Content = btnCancelTitle;
				}
				((UIElement)btnCancel).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)btnCancel).Visibility = (Visibility)2;
			}
			((UIElement)panelNotify).Visibility = (Visibility)((!isNotifyText) ? 2 : 0);
			((UIElement)btnClose).Visibility = (Visibility)((!isCloseBtn) ? 2 : 0);
			if (!string.IsNullOrEmpty(imagePath))
			{
				img.Source = (ImageSource)new BitmapImage(new Uri(imagePath, UriKind.RelativeOrAbsolute));
			}
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			CloseAction?.Invoke(false);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			CloseAction?.Invoke(true);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			CloseAction?.Invoke(null);
		}

		public Window GetMsgUi()
		{
			return (Window)(object)this;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/picmessagebox.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Expected O, but got Unknown
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Expected O, but got Unknown
			//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b8: Expected O, but got Unknown
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Expected O, but got Unknown
			//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00de: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				img = (Image)target;
				break;
			case 2:
				tbkTitle = (LangTextBlock)target;
				break;
			case 3:
				txtInfo = (LangTextBlock)target;
				break;
			case 4:
				panelNotify = (DockPanel)target;
				break;
			case 5:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 6:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 7:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class MessageBoxV6 : Window, IUserMsgControl, IComponentConnector
	{
		internal Border IconBd;

		internal Path IconPath;

		internal LangTextBlock tbkTitle;

		internal TextBlockEx txtInfo;

		internal TextBlock txtPrivacy;

		internal DockPanel panelNotify;

		internal LangTextBlock txtNotify;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		internal Button btnClose;

		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Action<bool?> CloseAction { get; set; }

		public Action<bool?> CallBackAction { get; set; }

		public MessageBoxV6()
		{
			InitializeComponent();
		}

		public void Init(string title, string message, string btnOkTitle, string btnCancelTitle, bool isCloseBtn, MessageBoxImage icon, bool isPrivacy = false)
		{
			//IL_0082: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Invalid comparison between Unknown and I4
			//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cc: Invalid comparison between Unknown and I4
			tbkTitle.LangKey = title;
			txtInfo.LangKey = message;
			if (!string.IsNullOrEmpty(btnOkTitle))
			{
				btnOk.LangKey = btnOkTitle;
			}
			else
			{
				((UIElement)btnOk).Visibility = (Visibility)2;
			}
			if (!string.IsNullOrEmpty(btnCancelTitle))
			{
				btnCancel.LangKey = btnCancelTitle;
				((UIElement)btnCancel).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)btnCancel).Visibility = (Visibility)2;
			}
			if ((int)icon == 48)
			{
				Path iconPath = IconPath;
				object obj = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBrushKey");
				((Shape)iconPath).Fill = (Brush)((obj is SolidColorBrush) ? obj : null);
				Border iconBd = IconBd;
				object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBkgBrushKey");
				iconBd.Background = (Brush)((obj2 is SolidColorBrush) ? obj2 : null);
			}
			else if ((int)icon == 16)
			{
				Path iconPath2 = IconPath;
				object obj3 = ((FrameworkElement)this).TryFindResource((object)"V6_ErrorBrushKey");
				((Shape)iconPath2).Fill = (Brush)((obj3 is SolidColorBrush) ? obj3 : null);
				Border iconBd2 = IconBd;
				object obj4 = ((FrameworkElement)this).TryFindResource((object)"V6_ErrorBkgBrushKey");
				iconBd2.Background = (Brush)((obj4 is SolidColorBrush) ? obj4 : null);
			}
			((UIElement)btnClose).Visibility = (Visibility)((!isCloseBtn) ? 2 : 0);
			((UIElement)txtPrivacy).Visibility = (Visibility)((!isPrivacy) ? 2 : 0);
		}

		public void Init(string title, string message, string okBtnText, string cancelBtnText, MessageBoxImage icon, string notifyText)
		{
			//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bd: Invalid comparison between Unknown and I4
			//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
			//IL_0103: Invalid comparison between Unknown and I4
			tbkTitle.LangKey = title;
			txtInfo.LangKey = message;
			if (!string.IsNullOrEmpty(okBtnText))
			{
				btnOk.LangKey = okBtnText;
			}
			else
			{
				((UIElement)btnOk).Visibility = (Visibility)2;
			}
			if (!string.IsNullOrEmpty(cancelBtnText))
			{
				btnCancel.LangKey = cancelBtnText;
				((UIElement)btnCancel).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)btnCancel).Visibility = (Visibility)2;
			}
			if (string.IsNullOrEmpty(notifyText))
			{
				((UIElement)panelNotify).Visibility = (Visibility)2;
			}
			else
			{
				((UIElement)panelNotify).Visibility = (Visibility)0;
				txtNotify.LangKey = notifyText;
			}
			if ((int)icon == 48)
			{
				Path iconPath = IconPath;
				object obj = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBrushKey");
				((Shape)iconPath).Fill = (Brush)((obj is SolidColorBrush) ? obj : null);
				Border iconBd = IconBd;
				object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBkgBrushKey");
				iconBd.Background = (Brush)((obj2 is SolidColorBrush) ? obj2 : null);
			}
			else if ((int)icon == 16)
			{
				Path iconPath2 = IconPath;
				object obj3 = ((FrameworkElement)this).TryFindResource((object)"V6_ErrorBrushKey");
				((Shape)iconPath2).Fill = (Brush)((obj3 is SolidColorBrush) ? obj3 : null);
				Border iconBd2 = IconBd;
				object obj4 = ((FrameworkElement)this).TryFindResource((object)"V6_ErrorBkgBrushKey");
				iconBd2.Background = (Brush)((obj4 is SolidColorBrush) ? obj4 : null);
			}
			((UIElement)btnClose).Visibility = (Visibility)2;
			((UIElement)txtPrivacy).Visibility = (Visibility)2;
		}

		public void Init(string message, MessageBoxButton btn, MessageBoxImage icon, bool isCloseBtn, bool isPrivacy = false)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Invalid comparison between Unknown and I4
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Invalid comparison between Unknown and I4
			//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a7: Invalid comparison between Unknown and I4
			//IL_0146: Unknown result type (might be due to invalid IL or missing references)
			//IL_0149: Invalid comparison between Unknown and I4
			txtInfo.LangKey = message;
			if ((int)btn == 1)
			{
				btnOk.LangKey = "K0327";
				btnCancel.LangKey = "K0208";
				((UIElement)btnCancel).Visibility = (Visibility)0;
			}
			else if ((int)btn == 4)
			{
				btnOk.LangKey = "K0571";
				btnCancel.LangKey = "K0570";
				((UIElement)btnCancel).Visibility = (Visibility)0;
			}
			else
			{
				btnOk.LangKey = "K0327";
				((UIElement)btnCancel).Visibility = (Visibility)2;
			}
			if ((int)icon == 16)
			{
				((TextBlock)tbkTitle).Text = "Error";
				((FrameworkElement)IconPath).Width = 27.0;
				((FrameworkElement)IconPath).Height = 24.0;
				Path iconPath = IconPath;
				object obj = ((FrameworkElement)this).TryFindResource((object)"V6_IconWarning");
				iconPath.Data = (Geometry)((obj is PathGeometry) ? obj : null);
				Path iconPath2 = IconPath;
				object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBrushKey");
				((Shape)iconPath2).Fill = (Brush)((obj2 is SolidColorBrush) ? obj2 : null);
				Border iconBd = IconBd;
				object obj3 = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBkgBrushKey");
				iconBd.Background = (Brush)((obj3 is SolidColorBrush) ? obj3 : null);
			}
			else if ((int)icon == 48)
			{
				tbkTitle.LangKey = "K0071";
				((FrameworkElement)IconPath).Width = 27.0;
				((FrameworkElement)IconPath).Height = 24.0;
				Path iconPath3 = IconPath;
				object obj4 = ((FrameworkElement)this).TryFindResource((object)"V6_IconWarning");
				iconPath3.Data = (Geometry)((obj4 is PathGeometry) ? obj4 : null);
				Path iconPath4 = IconPath;
				object obj5 = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBrushKey");
				((Shape)iconPath4).Fill = (Brush)((obj5 is SolidColorBrush) ? obj5 : null);
				Border iconBd2 = IconBd;
				object obj6 = ((FrameworkElement)this).TryFindResource((object)"V6_WarningBkgBrushKey");
				iconBd2.Background = (Brush)((obj6 is SolidColorBrush) ? obj6 : null);
			}
			else
			{
				tbkTitle.LangKey = "K0711";
			}
			((UIElement)btnClose).Visibility = (Visibility)((!isCloseBtn) ? 2 : 0);
			((UIElement)txtPrivacy).Visibility = (Visibility)((!isPrivacy) ? 2 : 0);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			CloseAction?.Invoke(false);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			CloseAction?.Invoke(true);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			CloseAction?.Invoke(null);
		}

		public Window GetMsgUi()
		{
			return (Window)(object)this;
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Process.Start("www.lenovo.com/privacy/");
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/messageboxv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_0084: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Expected O, but got Unknown
			//IL_0094: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00aa: Expected O, but got Unknown
			//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bc: Expected O, but got Unknown
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f2: Expected O, but got Unknown
			//IL_010e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0118: Expected O, but got Unknown
			//IL_011d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0127: Expected O, but got Unknown
			//IL_0134: Unknown result type (might be due to invalid IL or missing references)
			//IL_013e: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				IconBd = (Border)target;
				break;
			case 2:
				IconPath = (Path)target;
				break;
			case 3:
				tbkTitle = (LangTextBlock)target;
				break;
			case 4:
				txtInfo = (TextBlockEx)target;
				break;
			case 5:
				txtPrivacy = (TextBlock)target;
				break;
			case 6:
				((ContentElement)(Run)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 7:
				panelNotify = (DockPanel)target;
				break;
			case 8:
				txtNotify = (LangTextBlock)target;
				break;
			case 9:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 10:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 11:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RegisterDevView : Window, IMessageWindowV6, IComponentConnector, IStyleConnector
	{
		private RegisterDevicesViewModel _VM;

		internal ListBox listbox;

		internal LangTextBlock txtEmptyWarn;

		internal Button btnViewOK;

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

		public AutoResetEvent WaitHandler { get; }

		public RegisterDevView(string title, bool IsOnlySel = true)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Owner = Application.Current.MainWindow;
			if (IsOnlySel)
			{
				ListBox obj = listbox;
				object obj2 = ((FrameworkElement)this).TryFindResource((object)"RegisterDevListBoxItemStyle");
				((ItemsControl)obj).ItemContainerStyle = (Style)((obj2 is Style) ? obj2 : null);
			}
			else
			{
				((UIElement)btnViewOK).Visibility = (Visibility)2;
				ListBox obj3 = listbox;
				object obj4 = ((FrameworkElement)this).TryFindResource((object)"RegisterDevListBoxItemStyle2");
				((ItemsControl)obj3).ItemContainerStyle = (Style)((obj4 is Style) ? obj4 : null);
			}
			_VM = new RegisterDevicesViewModel(this);
			_VM.Title = title;
			((FrameworkElement)this).DataContext = _VM;
		}

		public bool IsExistRegistedDev(string category = null)
		{
			bool flag = _VM.LoadLocalRegistedDev(category);
			if (category == null && !flag)
			{
				((UIElement)txtEmptyWarn).Visibility = (Visibility)0;
				((UIElement)listbox).Visibility = (Visibility)2;
			}
			return flag;
		}

		public RegistedDevModel GetSelRegistedDev()
		{
			return _VM.RegDevArr.FirstOrDefault((RegistedDevModel p) => p.IsSelected);
		}

		private async void OnDetailClicked(object sender, RoutedEventArgs e)
		{
			if (!(e.OriginalSource is RadioButton))
			{
				object originalSource = e.OriginalSource;
				Button btn = (Button)((originalSource is Button) ? originalSource : null);
				RegistedDevModel model = ((FrameworkElement)btn).Tag as RegistedDevModel;
				StringBuilder builder = new StringBuilder();
				if (!string.IsNullOrEmpty(model.IMEI2))
				{
					builder.Append(HostProxy.LanguageService.Translate("K0460") + " " + model.IMEI + "\n\n" + HostProxy.LanguageService.Translate("K0461") + " " + model.IMEI2 + "\n\n");
				}
				else if (!string.IsNullOrEmpty(model.IMEI))
				{
					builder.Append(HostProxy.LanguageService.Translate("K0459") + " " + model.IMEI + "\n\n");
				}
				else
				{
					builder.Append(HostProxy.LanguageService.Translate("K0459") + " " + HostProxy.LanguageService.Translate("K0470") + "\n\n");
				}
				if (!string.IsNullOrEmpty(model.SN))
				{
					builder.Append(HostProxy.LanguageService.Translate("K0462") + " " + model.SN + "\n\n");
				}
				else
				{
					builder.Append(HostProxy.LanguageService.Translate("K0462") + " " + HostProxy.LanguageService.Translate("K0470") + "\n\n");
				}
				if (!string.IsNullOrEmpty(model.PN))
				{
					builder.Append(HostProxy.LanguageService.Translate("K1118") + " " + model.PN + "\n\n");
				}
				else
				{
					builder.Append(HostProxy.LanguageService.Translate("K1118") + " " + HostProxy.LanguageService.Translate("K0470") + "\n\n");
				}
				await MessageWindowHelper.Instance.Show("K0519", builder.ToString().Trim(new char[1] { '\n' }), "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true);
			}
		}

		private async void OnDeleteClicked(object sender, RoutedEventArgs e)
		{
			if (await MessageWindowHelper.Instance.Show("K0071", "K0708", "K0571", "K0570", showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true) == true)
			{
				object originalSource = e.OriginalSource;
				Button btn = (Button)((originalSource is Button) ? originalSource : null);
				RegistedDevModel model = ((FrameworkElement)btn).Tag as RegistedDevModel;
				_VM.RemoveDevice(model);
				DeviceDataCollection.Instance.GetLocalDevices();
			}
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			Result = false;
			((Window)this).Close();
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			Result = true;
			((Window)this).Close();
		}

		public bool CanExecute(object parameter)
		{
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/registerdevview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Expected O, but got Unknown
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Expected O, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			switch (connectionId)
			{
			case 4:
				listbox = (ListBox)target;
				break;
			case 5:
				txtEmptyWarn = (LangTextBlock)target;
				break;
			case 6:
				btnViewOK = (Button)target;
				((ButtonBase)btnViewOK).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 7:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
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
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Expected O, but got Unknown
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_004c: Expected O, but got Unknown
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0066: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnDetailClicked);
				break;
			case 2:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(OnDetailClicked);
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnDeleteClicked);
				break;
			}
		}
	}
	public class RegisterDevicesViewModel : NotifyBase
	{
		public string Title { get; set; }

		public ObservableCollection<RegistedDevModel> RegDevArr { get; set; }

		public RegisterDevicesViewModel(RegisterDevView ui)
		{
			RegDevArr = new ObservableCollection<RegistedDevModel>();
		}

		public bool LoadLocalRegistedDev(string category)
		{
			JArray jArray = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.DefaultOptionsFileName, "$.devices[?(@.userId =='" + HostProxy.User.user.UserId + "')].registeredModels");
			if (jArray == null || !jArray.HasValues)
			{
				return false;
			}
			List<JToken> list = null;
			list = ((!string.IsNullOrEmpty(category)) ? jArray.Where(delegate(JToken n)
			{
				string text = n.Value<string>("category");
				return !string.IsNullOrEmpty(text) && Regex.IsMatch(text, "^" + category + "$", RegexOptions.IgnoreCase);
			}).ToList() : jArray.ToList());
			string json = "[" + string.Join(",", list) + "]";
			List<RegistedDevModel> list2 = JsonHelper.DeserializeJson2List<RegistedDevModel>(json);
			if (list2.Count == 0)
			{
				return false;
			}
			list2.ForEach(delegate(RegistedDevModel p)
			{
				RegDevArr.Add(p);
			});
			return true;
		}

		public void RemoveDevice(RegistedDevModel device)
		{
			if (!RegDevArr.Remove(device))
			{
				return;
			}
			try
			{
				JObject jObject = FileHelper.ReadJtokenWithAesDecrypt<JObject>(Configurations.DefaultOptionsFileName, "$");
				JToken jToken = jObject.SelectToken("$.devices[?(@.userId =='" + HostProxy.User.user.UserId + "')]");
				jToken["registeredModels"] = JToken.FromObject(RegDevArr);
				FileHelper.WriteFileWithAesEncrypt(Configurations.DefaultOptionsFileName, jObject.ToString());
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Write Software Fix options.json error. Exception:" + ex);
			}
			if (!string.IsNullOrEmpty(device.id))
			{
				Task.Factory.StartNew(() => AppContext.WebApi.RequestContent(WebApiUrl.DELETE_USER_DEVICE, new Dictionary<string, List<int>> { 
				{
					"ids",
					new List<int> { int.Parse(device.id) }
				} }));
			}
		}
	}
	public class RightPicMessageBox : Window, IUserMsgControl, IComponentConnector
	{
		private bool _IsPopup;

		internal LangTextBlock tbkTitle;

		internal LangTextBlock txtInfo;

		internal Image img;

		internal LangTextBlock txtTips;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		internal Button btnClose;

		internal PopupEx pop;

		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Action<bool?> CloseAction { get; set; }

		public Action<bool?> CallBackAction { get; set; }

		public RightPicMessageBox()
		{
			InitializeComponent();
		}

		public Window GetMsgUi()
		{
			return (Window)(object)this;
		}

		public void Init(ImageSource picture, string title, string message, string btnOkTitle, string btnCancelTitle, string tips = null, bool isCloseBtn = false, bool isPopup = false)
		{
			_IsPopup = isPopup;
			if (!string.IsNullOrEmpty(title) && Regex.IsMatch(title, "^K\\d{4}"))
			{
				tbkTitle.LangKey = title;
			}
			else
			{
				((TextBlock)tbkTitle).Text = title;
			}
			if (!string.IsNullOrEmpty(message) && Regex.IsMatch(message, "^K\\d{4}"))
			{
				txtInfo.LangKey = message;
			}
			else
			{
				((TextBlock)txtInfo).Text = message;
			}
			if (!string.IsNullOrEmpty(btnOkTitle))
			{
				if (Regex.IsMatch(btnOkTitle, "^K\\d{4}"))
				{
					btnOk.LangKey = btnOkTitle;
				}
				else
				{
					((ContentControl)btnOk).Content = btnOkTitle;
				}
				((UIElement)btnOk).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)btnOk).Visibility = (Visibility)2;
			}
			if (!string.IsNullOrEmpty(btnCancelTitle))
			{
				if (Regex.IsMatch(btnCancelTitle, "^K\\d{4}"))
				{
					btnCancel.LangKey = btnCancelTitle;
				}
				else
				{
					((ContentControl)btnCancel).Content = btnCancelTitle;
				}
				((UIElement)btnCancel).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)btnCancel).Visibility = (Visibility)2;
			}
			if (!string.IsNullOrEmpty(tips))
			{
				if (Regex.IsMatch(tips, "^K\\d{4}"))
				{
					txtTips.LangKey = tips;
				}
				else
				{
					((TextBlock)txtTips).Text = tips;
				}
				((UIElement)txtTips).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)txtTips).Visibility = (Visibility)2;
			}
			if (!isPopup)
			{
				((UIElement)pop).Visibility = (Visibility)2;
			}
			((UIElement)btnClose).Visibility = (Visibility)((!isCloseBtn) ? 2 : 0);
			img.Source = picture;
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			CloseAction?.Invoke(false);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			CloseAction?.Invoke(true);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			if (_IsPopup)
			{
				((Popup)pop).IsOpen = true;
				return;
			}
			((Window)this).Close();
			CloseAction?.Invoke(null);
		}

		private void OnBtnForce(object sender, RoutedEventArgs e)
		{
			((Popup)pop).IsOpen = false;
			((Window)this).Close();
			CloseAction?.Invoke(null);
		}

		private void OnBtnConitue(object sender, RoutedEventArgs e)
		{
			((Popup)pop).IsOpen = false;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/viewv6/rightpicmessagebox.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0068: Expected O, but got Unknown
			//IL_0097: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a1: Expected O, but got Unknown
			//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ca: Expected O, but got Unknown
			//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d9: Expected O, but got Unknown
			//IL_00e6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f0: Expected O, but got Unknown
			//IL_0102: Unknown result type (might be due to invalid IL or missing references)
			//IL_010e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0118: Expected O, but got Unknown
			//IL_011c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0128: Unknown result type (might be due to invalid IL or missing references)
			//IL_0132: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				tbkTitle = (LangTextBlock)target;
				break;
			case 2:
				txtInfo = (LangTextBlock)target;
				break;
			case 3:
				img = (Image)target;
				break;
			case 4:
				txtTips = (LangTextBlock)target;
				break;
			case 5:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 6:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 7:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 8:
				pop = (PopupEx)target;
				break;
			case 9:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnForce);
				break;
			case 10:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnConitue);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.ViewModel.SystemOperation
{
	public class SystemOperationViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private List<MouseOverMenuItemViewModel> mRestrictedByPluginItems = new List<MouseOverMenuItemViewModel>();

		private volatile bool mIsEnabled = true;

		private System.Threading.Timer mTimer;

		private ObservableCollection<MouseOverMenuItemViewModel> menuItems;

		public ObservableCollection<MouseOverMenuItemViewModel> MenuItems
		{
			get
			{
				return menuItems;
			}
			set
			{
				if (menuItems != value)
				{
					menuItems = value;
					OnPropertyChanged("MenuItems");
				}
			}
		}

		public SystemOperationViewModel()
		{
			MenuItems = new ObservableCollection<MouseOverMenuItemViewModel>();
			MenuItems.Add(new PrivacyPolicyOperationItemViewModel
			{
				ItemVisibility = (Visibility)0
			});
			UpdateOperationItemViewModel item = new UpdateOperationItemViewModel
			{
				ItemVisibility = (Visibility)0
			};
			MenuItems.Add(item);
			LanguageOperationItemViewModelV6 item2 = new LanguageOperationItemViewModelV6
			{
				ItemVisibility = (Visibility)0
			};
			MenuItems.Add(item2);
			MenuItems.Add(new AboutOperationItemViewModel
			{
				ItemVisibility = (Visibility)0
			});
			mRestrictedByPluginItems.Add(item);
			mRestrictedByPluginItems.Add(item2);
			mTimer = new System.Threading.Timer(delegate
			{
				bool flag = false;
				if (flag && mIsEnabled)
				{
					mIsEnabled = false;
					Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
					if (currentDispatcher != null)
					{
						currentDispatcher.Invoke((Action)delegate
						{
							foreach (MouseOverMenuItemViewModel mRestrictedByPluginItem in mRestrictedByPluginItems)
							{
								mRestrictedByPluginItem.IsEnabled = false;
							}
						});
					}
				}
				else if (!flag && !mIsEnabled)
				{
					mIsEnabled = true;
					Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
					if (currentDispatcher2 != null)
					{
						currentDispatcher2.Invoke((Action)delegate
						{
							foreach (MouseOverMenuItemViewModel mRestrictedByPluginItem2 in mRestrictedByPluginItems)
							{
								mRestrictedByPluginItem2.IsEnabled = true;
							}
						});
					}
				}
			}, null, 1000, 1000);
		}
	}
}
namespace lenovo.mbg.service.lmsa.ViewModels
{
	public class CouponWindowModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		public string subText1 = "AS a thank you, please use this coupon code for an additional {0} off any of our new phones at checkout.";

		protected const string UrlFormat = "https://www.motorola.com/us/vtex-rnt-esp/?pid=5PS8C04083&deviceSerialNumber={0}&SN={1}&warrantyStartDate={2}&warrantyEndDate={3}&qty=1&orderSource=RSA&promoCode={4}";

		private bool _IsCopied;

		public ReplayCommand CloseCommand { get; }

		public ReplayCommand CopyCommand { get; }

		public ReplayCommand BuyCommand { get; }

		public string Discount { get; set; }

		public string Code { get; set; }

		public string Url { get; set; }

		public string SubText { get; set; }

		public int PositionStart { get; set; }

		public int PositionCount { get; set; }

		public Visibility TextVisibility { get; set; }

		public bool IsCopied
		{
			get
			{
				return _IsCopied;
			}
			set
			{
				_IsCopied = value;
				OnPropertyChanged("IsCopied");
			}
		}

		public CouponWindowModel(MotoCareInfo data, CouponInfo coupon)
		{
			Discount = coupon.discountInfo;
			Code = coupon.discountCode;
			Url = (data.InWarranty ? string.Format("https://www.motorola.com/us/vtex-rnt-esp/?pid=5PS8C04083&deviceSerialNumber={0}&SN={1}&warrantyStartDate={2}&warrantyEndDate={3}&qty=1&orderSource=RSA&promoCode={4}", new object[5] { data.imei, data.sn, data.WarrantyStartDate, data.WarrantyEndDate, coupon.discountCode }) : data.url);
			TextVisibility = (Visibility)(data.type != 2);
			string text = LangTranslation.Translate("K1391");
			text = text + " " + Discount;
			SubText = string.Format(LangTranslation.Translate("K1390"), text);
			PositionStart = SubText.IndexOf(text);
			PositionCount = text.Length;
			CloseCommand = new ReplayCommand(CloseCommandHandler);
			CopyCommand = new ReplayCommand(CopyCommandHandler);
			BuyCommand = new ReplayCommand(BuyCommandHandler);
		}

		private void CloseCommandHandler(object data)
		{
			CouponWindow couponWindow = data as CouponWindow;
			couponWindow.Result = true;
			((Window)couponWindow).Close();
			MainWindowViewModel.SingleInstance.MiddleBannerVisibility = (Visibility)0;
		}

		private void CopyCommandHandler(object data)
		{
			Clipboard.SetDataObject((object)Code);
			IsCopied = true;
			Task.Run(delegate
			{
				Thread.Sleep(800);
			}).ContinueWith((Task s) => HostProxy.CurrentDispatcher.Invoke<bool>((Func<bool>)(() => IsCopied = false)));
		}

		private void BuyCommandHandler(object data)
		{
			CouponWindow couponWindow = data as CouponWindow;
			couponWindow.Result = true;
			((Window)couponWindow).Close();
			GlobalFun.OpenUrlByBrowser(Url);
		}
	}
	public class DeviceViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private ConnectType _ConnectTy;

		private bool _IsMotorola = true;

		private ImageSource _Image;

		private ImageSource _SelectedImage;

		private bool _IsEnabled = true;

		private bool _IsSelected = false;

		public string Id { get; set; }

		public string Text { get; set; }

		public DeviceEx Device { get; set; }

		public ConnectType ConnectTy
		{
			get
			{
				return _ConnectTy;
			}
			set
			{
				_ConnectTy = value;
				OnPropertyChanged("ConnectTy");
			}
		}

		public bool IsMotorola
		{
			get
			{
				return _IsMotorola;
			}
			set
			{
				_IsMotorola = value;
				OnPropertyChanged("IsMotorola");
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
				OnPropertyChanged("Image");
			}
		}

		public ImageSource SelectedImage
		{
			get
			{
				return _SelectedImage;
			}
			set
			{
				_SelectedImage = value;
				OnPropertyChanged("SelectedImage");
			}
		}

		public bool IsEnabled
		{
			get
			{
				return _IsEnabled;
			}
			set
			{
				_IsEnabled = value;
				OnPropertyChanged("IsEnabled");
			}
		}

		public bool IsSelected
		{
			get
			{
				return _IsSelected;
			}
			set
			{
				_IsSelected = value;
				OnPropertyChanged("IsSelected");
			}
		}

		public DeviceViewModel(string id, string text, ConnectType connectTy, DeviceEx device, bool isMotorola)
		{
			Id = id;
			Text = text;
			Device = device;
			IsMotorola = isMotorola;
			ConnectTy = connectTy;
			Init();
		}

		public void Update(DeviceViewModel deviceViewModel)
		{
			Device = deviceViewModel.Device;
			IsMotorola = deviceViewModel.IsMotorola;
			ConnectTy = deviceViewModel.ConnectTy;
			Init();
		}

		public void Init()
		{
			if (HostProxy.HostNavigation.CurrentPluginID == "02928af025384c75ae055aa2d4f256c8")
			{
				IsEnabled = ConnectTy != ConnectType.Fastboot;
			}
			if (ConnectTy == ConnectType.Wifi)
			{
				object obj = Application.Current.Resources[(object)"v6_icon_wifi"];
				Image = (ImageSource)((obj is ImageSource) ? obj : null);
				object obj2 = Application.Current.Resources[(object)"v6_icon_wifi_selected"];
				SelectedImage = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
			}
			else
			{
				object obj3 = Application.Current.Resources[(object)"v6_icon_usb"];
				Image = (ImageSource)((obj3 is ImageSource) ? obj3 : null);
				object obj4 = Application.Current.Resources[(object)"v6_icon_usb_selected"];
				SelectedImage = (ImageSource)((obj4 is ImageSource) ? obj4 : null);
			}
		}
	}
	public class DeviceConnectViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		protected string PluginId;

		private Visibility _PopIconVisible = (Visibility)2;

		private bool _IsOpen = false;

		private DeviceViewModel _SelectedItem;

		private int _Status = -1;

		private bool _IsEnabled = true;

		protected static object locker = new object();

		private static DeviceConnectViewModel _Instance;

		public ObservableCollection<DeviceViewModel> ConnectedDevices { get; set; }

		public ReplayCommand CurDeviceClick { get; }

		protected string MasterDeviceId => global::Smart.DeviceManagerEx.MasterDevice?.Identifer;

		public Visibility PopIconVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _PopIconVisible;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				_PopIconVisible = value;
				OnPropertyChanged("PopIconVisible");
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
				OnPropertyChanged("IsOpen");
			}
		}

		public DeviceViewModel SelectedItem
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
				if (InMyDevice && _SelectedItem != null && _SelectedItem.Device.SoftStatus == DeviceSoftStateEx.Online && value != null && value.ConnectTy == ConnectType.Fastboot)
				{
					value.IsSelected = false;
					_SelectedItem.IsSelected = true;
					MessageWindowHelper.Instance.Show(null, "K2135", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
					OnPropertyChanged("SelectedItem");
					return;
				}
				if (_SelectedItem != null)
				{
					_SelectedItem.IsSelected = false;
				}
				_SelectedItem = value;
				IsOpen = false;
				if (_SelectedItem != null)
				{
					_SelectedItem.IsSelected = true;
					Status = ((!_SelectedItem.IsMotorola) ? 1 : 2);
					if (MasterDeviceId != _SelectedItem.Id && (_SelectedItem.Device.ConnectType == ConnectType.Adb || _SelectedItem.Device.ConnectType == ConnectType.Wifi))
					{
						global::Smart.DeviceManagerEx.SwitchDevice(_SelectedItem.Id);
					}
				}
				else
				{
					DeviceViewModel deviceViewModel = ConnectedDevices.FirstOrDefault((DeviceViewModel n) => n.Id == MasterDeviceId);
					if (deviceViewModel == null)
					{
						deviceViewModel = ConnectedDevices.FirstOrDefault();
					}
					if (deviceViewModel != null)
					{
						_SelectedItem = deviceViewModel;
						_SelectedItem.IsSelected = true;
						if (MasterDeviceId == deviceViewModel.Id)
						{
							Status = ((!deviceViewModel.IsMotorola) ? 1 : 2);
						}
					}
					else
					{
						Status = -1;
					}
				}
				OnPropertyChanged("SelectedItem");
			}
		}

		public bool InMyDevice => "02928af025384c75ae055aa2d4f256c8" == PluginId;

		public int Status
		{
			get
			{
				return _Status;
			}
			set
			{
				_Status = value;
				OnPropertyChanged("Status");
			}
		}

		public bool IsEnabled
		{
			get
			{
				return _IsEnabled;
			}
			set
			{
				_IsEnabled = value;
				OnPropertyChanged("IsEnabled");
			}
		}

		public static DeviceConnectViewModel Instance
		{
			get
			{
				if (_Instance == null)
				{
					lock (locker)
					{
						if (_Instance == null)
						{
							_Instance = new DeviceConnectViewModel();
						}
					}
				}
				return _Instance;
			}
		}

		private DeviceConnectViewModel()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			ConnectedDevices = new ObservableCollection<DeviceViewModel>();
			ConnectedDevices.CollectionChanged += ConnectedDevices_CollectionChanged;
			CurDeviceClick = new ReplayCommand(CurDeviceClickHandler);
			global::Smart.DeviceManagerEx.Connecte += FireConnect;
			global::Smart.DeviceManagerEx.DisConnecte += FireDisConnect;
		}

		private void ConnectedDevices_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
		{
			PopIconVisible = (Visibility)((ConnectedDevices.Count <= 1) ? 2 : 0);
		}

		public void ChangeEnadbled(string plubinId)
		{
			PluginId = plubinId;
			if (plubinId == "02928af025384c75ae055aa2d4f256c8")
			{
				IsEnabled = true;
			}
			else
			{
				IsEnabled = false;
			}
		}

		public override void Reset()
		{
			Status = -1;
			ConnectedDevices.Clear();
			_Instance = null;
		}

		private void CurDeviceClickHandler(object data)
		{
			IsOpen = !IsOpen;
		}

		private void FireConnect(object sender, DeviceEx e)
		{
			e.SoftStatusChanged += FireSoftStatusChanged;
			e.InstallAppCallback = delegate(int _matchCode)
			{
				if (e.PhysicalStatus == DevicePhysicalStateEx.Online)
				{
					switch (_matchCode)
					{
					case 4:
						MessageWindowHelper.Instance.Show("K0071", "K2089", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true).Wait();
						break;
					case 9:
						MessageWindowHelper.Instance.Show("K0071", "K2090", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true).Wait();
						break;
					}
					IMessageWindowV6 _installView = null;
					((DispatcherObject)Application.Current).Dispatcher.Invoke<IMessageWindowV6>((Func<IMessageWindowV6>)delegate
					{
						InstallMADialogV6 obj = new InstallMADialogV6
						{
							AutoCloseConditionFunc = () => e.PhysicalStatus == DevicePhysicalStateEx.Offline,
							ExecutePredicate = (object w) => MainWindowViewModel.CheckRescueFlash(),
							ShowNow = true
						};
						IMessageWindowV6 result2 = obj;
						_installView = obj;
						return result2;
					});
					bool? result = MessageWindowHelper.Instance.Show(_installView, true).Result;
					if (result == false)
					{
						if (_matchCode == 9)
						{
							MessageWindowHelper.Instance.Show("K1449", "K1450", "K1448", null, showClose: false, (MessageBoxImage)48, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true).Wait();
						}
						return false;
					}
					if (result == true)
					{
						MessageWindowHelper.Instance.Loading("K1840", delegate
						{
							while (!e.AppInstallFinished && e.SoftStatus != DeviceSoftStateEx.Offline && e.SoftStatus != DeviceSoftStateEx.ManualDisconnect)
							{
								Thread.Sleep(100);
								bool flag = true;
							}
							return true;
						});
						return true;
					}
				}
				return false;
			};
			e.RetryConnectCallback = delegate
			{
			};
		}

		protected string GenerateKey(DeviceEx device)
		{
			return device.Identifer;
		}

		private void RemoveDevice(DeviceEx device)
		{
			DeviceViewModel found = ConnectedDevices.FirstOrDefault((DeviceViewModel n) => n.Id == GenerateKey(device));
			LogHelper.LogInstance.Debug($"*************RemoveDevice: {found == null}");
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				LogHelper.LogInstance.Debug($"*************RemoveDevice removed before: {ConnectedDevices.Count}");
				if (found != null)
				{
					ConnectedDevices.Remove(found);
				}
				if (ConnectedDevices.Count == 0)
				{
					Status = -1;
				}
				LogHelper.LogInstance.Debug($"*************RemoveDevice removed after: {ConnectedDevices.Count}");
			});
		}

		private void AddOrUpdateDevice(DeviceEx device, string modelName, bool ismotorola)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				string key = GenerateKey(device);
				DeviceViewModel deviceViewModel = new DeviceViewModel(key, modelName, device.ConnectType, device, ismotorola);
				DeviceViewModel deviceViewModel2 = ConnectedDevices.FirstOrDefault((DeviceViewModel n) => n.Id == key);
				if (deviceViewModel2 == null)
				{
					ConnectedDevices.Add(deviceViewModel);
				}
				if (SelectedItem == null || (InMyDevice && SelectedItem.Device.ConnectType == ConnectType.Fastboot))
				{
					SelectedItem = deviceViewModel;
				}
			});
		}

		private void FireDisConnect(object sender, DeviceEx e)
		{
			e.SoftStatusChanged -= FireSoftStatusChanged;
			e.InstallAppCallback = null;
			LogHelper.LogInstance.Debug($"*************FireDisConnect: {e}");
			RemoveDevice(e);
		}

		private void FireSoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			DeviceEx arg = sender as DeviceEx;
			LogHelper.LogInstance.Debug($"*************FireSoftStatusChanged: {arg}, {e}");
			switch (e)
			{
			case DeviceSoftStateEx.Connecting:
			case DeviceSoftStateEx.Reconncting:
				if (SelectedItem == null)
				{
					Status = 0;
				}
				break;
			case DeviceSoftStateEx.Online:
			{
				DeviceEx deviceEx = sender as DeviceEx;
				string text = deviceEx.Property.ModelName;
				bool ismotorola = true;
				if (deviceEx.ConnectType == ConnectType.Fastboot)
				{
					string fingerPrint = deviceEx.Property.FingerPrint;
					if (!string.IsNullOrEmpty(fingerPrint) && fingerPrint.StartsWith("lenovo", StringComparison.CurrentCultureIgnoreCase))
					{
						ismotorola = false;
					}
				}
				else
				{
					ismotorola = deviceEx.Property.Brand?.Equals("motorola", StringComparison.CurrentCultureIgnoreCase) ?? false;
				}
				if (text != null)
				{
					text = ((!text.StartsWith("lenovo", StringComparison.CurrentCultureIgnoreCase)) ? Regex.Replace(text, "^motorola", "", RegexOptions.IgnoreCase).Trim() : Regex.Replace(text, "^lenovo", "", RegexOptions.IgnoreCase).Trim());
				}
				AddOrUpdateDevice(deviceEx, text, ismotorola);
				break;
			}
			case DeviceSoftStateEx.Offline:
			case DeviceSoftStateEx.ManualDisconnect:
				RemoveDevice(sender as DeviceEx);
				break;
			default:
				if (ConnectedDevices.Count == 0)
				{
					Status = -1;
				}
				break;
			}
		}

		public void ShowConnectedDeviceIcon()
		{
			if (ConnectedDevices.Count > 0)
			{
				DeviceViewModel deviceViewModel = ConnectedDevices.FirstOrDefault((DeviceViewModel m) => m.Id == MasterDeviceId) ?? ConnectedDevices.FirstOrDefault();
				if (deviceViewModel != null)
				{
					Status = ((!deviceViewModel.IsMotorola) ? 1 : 2);
				}
			}
		}
	}
	public class DonotEnableDebugWindowViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private List<object> m_usbDebugList;

		private int m_usbDebugSelectedIndex = -1;

		private Visibility m_android10Visibility = (Visibility)2;

		private Visibility m_android8Visibility = (Visibility)2;

		private Visibility m_android7Visibility = (Visibility)2;

		public List<object> UsbDebugList
		{
			get
			{
				return m_usbDebugList;
			}
			set
			{
				m_usbDebugList = value;
				OnPropertyChanged("UsbDebugList");
			}
		}

		public int UsbDebugSelectedIndex
		{
			get
			{
				return m_usbDebugSelectedIndex;
			}
			set
			{
				m_usbDebugSelectedIndex = value;
				android7Visibility = (Visibility)((value != 0) ? 2 : 0);
				android8Visibility = (Visibility)((value != 1) ? 2 : 0);
				android10Visibility = (Visibility)((value != 2) ? 2 : 0);
				OnPropertyChanged("UsbDebugSelectedIndex");
			}
		}

		public Visibility android10Visibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return m_android10Visibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				m_android10Visibility = value;
				OnPropertyChanged("android10Visibility");
			}
		}

		public Visibility android8Visibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return m_android8Visibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				m_android8Visibility = value;
				OnPropertyChanged("android8Visibility");
			}
		}

		public Visibility android7Visibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return m_android7Visibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				m_android7Visibility = value;
				OnPropertyChanged("android7Visibility");
			}
		}

		public DonotEnableDebugWindowViewModel()
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			List<object> usbDebugList = new List<object> { "K0439", "K0440", "K0438" };
			UsbDebugList = usbDebugList;
			UsbDebugSelectedIndex = 0;
		}
	}
	public class SurveyResponseModel
	{
		public SurveyLables lables { get; set; }

		public List<SurveyMsg> msg { get; set; }
	}
	public class SurveyLables
	{
		public string thankStr { get; set; }

		public string pleaseStr { get; set; }

		public string rate { get; set; }

		public string helpfull { get; set; }
	}
	public class SurveyMsg
	{
		public string id { get; set; }

		public string type { get; set; }

		public string content { get; set; }

		public string contentDe { get; set; }

		public string question { get; set; }

		public string questionDe { get; set; }

		public string sequenceName { get; set; }

		public List<SurveyNewOptions> options { get; set; }

		public bool required { get; set; }

		[JsonProperty("remark")]
		public object RemarkRaw { get; set; }

		[JsonIgnore]
		public List<SurveyQuestionRemark> remarkList
		{
			get
			{
				if (RemarkRaw is JArray jArray)
				{
					return jArray.ToObject<List<SurveyQuestionRemark>>();
				}
				if (RemarkRaw is string value)
				{
					return JsonConvert.DeserializeObject<List<SurveyQuestionRemark>>(value);
				}
				return new List<SurveyQuestionRemark>();
			}
		}

		[JsonProperty("parentAnswerCondition")]
		public object parentAnswerCondition { get; set; }

		[JsonIgnore]
		public List<ParentAnswerCondition> parentAnswerConditionValue
		{
			get
			{
				if (string.IsNullOrWhiteSpace(parentAnswerCondition.ToString()))
				{
					return new List<ParentAnswerCondition>();
				}
				JToken jToken = JToken.Parse(parentAnswerCondition.ToString());
				if (jToken.Type == JTokenType.Array)
				{
					return jToken.ToObject<List<ParentAnswerCondition>>();
				}
				if (jToken.Type == JTokenType.Object)
				{
					ParentAnswerCondition item = jToken.ToObject<ParentAnswerCondition>();
					return new List<ParentAnswerCondition> { item };
				}
				return new List<ParentAnswerCondition>();
			}
		}

		public List<SurveyMsg> children { get; set; }
	}
	public class SurveyNewOptions
	{
		public string id { get; set; }

		public string option { get; set; }
	}
	public class SurveyQuestionRemark
	{
		public string name { get; set; }

		public List<int> value { get; set; }

		public string description { get; set; }
	}
	public class ParentAnswerCondition
	{
		public List<string> value { get; set; }

		public string @operator { get; set; }
	}
	public class SurveySubmitModel
	{
		public string type => "Quit";

		public string clientUuid { get; set; }

		public List<SubmitItem> records { get; set; }
	}
	public class SubmitItem
	{
		public string qId { get; set; }

		public string result { get; set; }

		public SubmitItem(string _qid, string _result)
		{
			qId = _qid;
			result = _result;
		}
	}
	public class SurveyV2TemplateSelector : DataTemplateSelector
	{
		public DataTemplate SroceTemplate { get; set; }

		public DataTemplate SingleChoiceTemplate { get; set; }

		public DataTemplate MultipleChoiceTemplate { get; set; }

		public DataTemplate TextTemplate { get; set; }

		public DataTemplate SingleChoiceDescriptionUpwardTemplate { get; set; }

		public override DataTemplate SelectTemplate(object item, DependencyObject container)
		{
			QuestionItem questionItem = (QuestionItem)item;
			if (questionItem == null)
			{
				return null;
			}
			return (DataTemplate)(questionItem.QuestionType switch
			{
				"Sroce" => SroceTemplate, 
				"SingleChoice" => SingleChoiceTemplate, 
				"MultipleChoice" => MultipleChoiceTemplate, 
				"Text" => TextTemplate, 
				"SingleChoiceDescriptionUpward" => SingleChoiceDescriptionUpwardTemplate, 
				_ => null, 
			});
		}
	}
	public class SurveyDataModel : NotifyBase
	{
		private Visibility isVisible = (Visibility)0;

		private Visibility isRequired = (Visibility)2;

		private string _chooseImg = "../ResourceV6/Survey/Icon-Dissatisfied@2x.png";

		private string _chooseDesc = string.Empty;

		public string Id { get; private set; }

		public Visibility IsVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return isVisible;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				isVisible = value;
				OnPropertyChanged("IsVisible");
			}
		}

		public Visibility IsRequired
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return isRequired;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				isRequired = value;
				OnPropertyChanged("IsRequired");
			}
		}

		public string VerifyErrorText { get; set; }

		public string QuestionTitle { get; set; }

		public Visibility IsSatisfied { get; set; }

		public ObservableCollection<QuestionItem> QuestionItems { get; set; }

		public string ChooseImg
		{
			get
			{
				return _chooseImg;
			}
			set
			{
				_chooseImg = value;
				OnPropertyChanged("ChooseImg");
			}
		}

		public string ChooseDesc
		{
			get
			{
				return _chooseDesc;
			}
			set
			{
				if (!(_chooseDesc == value))
				{
					_chooseDesc = value;
					OnPropertyChanged("ChooseDesc");
				}
			}
		}

		public SurveyDataModel(string _id, string _questionTitle, ObservableCollection<QuestionItem> _questionContent, bool _required = false, bool _isVisible = true, string _errorText = "", string _chooseImg = "", string _chooseDesc = "")
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			Id = _id;
			IsSatisfied = (Visibility)2;
			IsRequired = (Visibility)((!_required) ? 2 : 0);
			isVisible = (Visibility)((!_isVisible) ? 2 : 0);
			VerifyErrorText = _errorText;
			QuestionTitle = _questionTitle;
			QuestionItems = _questionContent;
			ChooseDesc = _chooseDesc;
			ChooseImg = _chooseImg;
		}
	}
	public class QuestionItem : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		public bool _IsSelected;

		public Visibility _Visibile = (Visibility)2;

		public string _Data;

		public string Id { get; private set; }

		public string QuestionType { get; set; }

		public string GroupName { get; set; }

		public string ItemText { get; set; }

		public bool IsSelected
		{
			get
			{
				return _IsSelected;
			}
			set
			{
				_IsSelected = value;
				if (_IsSelected)
				{
					OnSelectionChanged();
				}
			}
		}

		public double Width { get; set; }

		public int ScoreStyleFlag { get; set; }

		public Visibility Visibile
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _Visibile;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				_Visibile = value;
				OnPropertyChanged("Visibile");
			}
		}

		public string Data
		{
			get
			{
				return _Data;
			}
			set
			{
				_Data = value;
				OnPropertyChanged("Data");
			}
		}

		public event EventHandler SelectionChanged;

		public QuestionItem(double width, QuestionType _type, string _text, string _textDe = null)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			QuestionType = Enum.GetName(typeof(QuestionType), _type);
			Id = _textDe ?? _text;
			ItemText = _text;
			IsSelected = false;
			Width = width;
		}

		public QuestionItem(QuestionType _type, string _text, int _scoreStyleFlag, string _textDe = null)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			QuestionType = Enum.GetName(typeof(QuestionType), _type);
			Id = _textDe ?? _text;
			ItemText = _text;
			IsSelected = false;
			Width = 330.0;
			ScoreStyleFlag = _scoreStyleFlag;
		}

		public QuestionItem(QuestionType _type, string _id, string _text)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			QuestionType = Enum.GetName(typeof(QuestionType), _type);
			Id = _id;
			ItemText = _text;
			IsSelected = false;
		}

		private void OnSelectionChanged()
		{
			this.SelectionChanged?.Invoke(this, EventArgs.Empty);
		}
	}
	public enum QuestionType
	{
		Sroce = 1,
		MultipleChoice,
		SingleChoice,
		Text,
		SingleChoiceDescriptionUpward
	}
	public class SurveyWindowV2ViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		protected Stopwatch sw;

		protected volatile bool LoadSuccess = false;

		protected Dictionary<int, List<string>> ScoreList = new Dictionary<int, List<string>>();

		private ObservableCollection<SurveyDataModel> _bindData;

		private string m_userId = string.Empty;

		private long locker = 0L;

		private string _SurveyTitle = string.Empty;

		private string _SurveySubTitle = string.Empty;

		private string _SelectedScore = "10";

		private string _VerifyErrorText;

		private Visibility _VerifyErrorVisibility = (Visibility)1;

		private ObservableCollection<SurveyDataModel> _QuestionList;

		private string _SubmitThanksText;

		private bool _QuestionVisibility;

		private bool _SubmitBtnEnable;

		public ReplayCommand SubmitClickCommand { get; set; }

		public ReplayCommand CloseWinCommand { get; set; }

		public ReplayCommand RadioBtnScoreCommand { get; set; }

		public string SurveyTitle
		{
			get
			{
				return _SurveyTitle;
			}
			set
			{
				if (!(_SurveyTitle == value))
				{
					_SurveyTitle = value;
					OnPropertyChanged("SurveyTitle");
				}
			}
		}

		public string SurveySubTitle
		{
			get
			{
				return _SurveySubTitle;
			}
			set
			{
				if (!(_SurveySubTitle == value))
				{
					_SurveySubTitle = value;
					OnPropertyChanged("SurveySubTitle");
				}
			}
		}

		public string SelectedScore
		{
			get
			{
				return _SelectedScore;
			}
			set
			{
				if (!(_SelectedScore == value))
				{
					_SelectedScore = value;
					RefreshData();
					OnPropertyChanged("SelectedScore");
				}
			}
		}

		public string VerifyErrorText
		{
			get
			{
				return _VerifyErrorText;
			}
			set
			{
				if (!(_VerifyErrorText == value))
				{
					_VerifyErrorText = value;
					OnPropertyChanged("VerifyErrorText");
				}
			}
		}

		public Visibility VerifyErrorVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return _VerifyErrorVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (_VerifyErrorVisibility != value)
				{
					_VerifyErrorVisibility = value;
					OnPropertyChanged("VerifyErrorVisibility");
				}
			}
		}

		public ObservableCollection<SurveyDataModel> QuestionList
		{
			get
			{
				return _QuestionList;
			}
			set
			{
				if (_QuestionList != value)
				{
					_QuestionList = value;
					OnPropertyChanged("QuestionList");
				}
			}
		}

		public string SubmitThanksText
		{
			get
			{
				return _SubmitThanksText;
			}
			set
			{
				if (!(_SubmitThanksText == value))
				{
					_SubmitThanksText = value;
					OnPropertyChanged("SubmitThanksText");
				}
			}
		}

		public bool QuestionVisibility
		{
			get
			{
				return _QuestionVisibility;
			}
			set
			{
				if (_QuestionVisibility != value)
				{
					_QuestionVisibility = value;
					OnPropertyChanged("QuestionVisibility");
				}
			}
		}

		public bool SubmitBtnEnable
		{
			get
			{
				return _SubmitBtnEnable;
			}
			set
			{
				if (_SubmitBtnEnable != value)
				{
					_SubmitBtnEnable = value;
					OnPropertyChanged("SubmitBtnEnable");
				}
			}
		}

		public SurveyWindowV2ViewModel(string _userId)
		{
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			m_userId = _userId;
			sw = new Stopwatch();
			sw.Start();
			SubmitClickCommand = new ReplayCommand(_SubmitClickCommandCommandHandler);
			CloseWinCommand = new ReplayCommand(_CloseWinCommandCommandHandler);
			RadioBtnScoreCommand = new ReplayCommand(_RadioBtnScoreCommand);
			SurveyTitle = "K1019";
			SurveySubTitle = "K1020";
			QuestionVisibility = true;
			DefaultData();
			GetQuestionFromWebsite();
			SubmitBtnEnable = true;
		}

		private void DefaultData()
		{
			SelectedScore = "10";
			_bindData = new ObservableCollection<SurveyDataModel>();
			ObservableCollection<QuestionItem> observableCollection = new ObservableCollection<QuestionItem>();
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "0", 0));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "1", 0));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "2", 0));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "3", 0));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "4", 0));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "5", 1));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "6", 1));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "7", 1));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "8", 2));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "9", 2));
			observableCollection.Add(new QuestionItem(QuestionType.Sroce, "10", 2));
			_bindData.Add(new SurveyDataModel("10", "K1021", observableCollection, _required: true, _isVisible: true, "K1023")
			{
				IsSatisfied = (Visibility)0
			});
			QuestionList = _bindData;
		}

		private Task<SurveyResponseModel> GetQuestionFromWebsiteAsync()
		{
			return Task.Run(delegate
			{
				if (!LoadSuccess && Interlocked.Read(in locker) == 0)
				{
					try
					{
						Interlocked.Exchange(ref locker, 1L);
						var parameter = new
						{
							type = "Quit"
						};
						ResponseModel<SurveyResponseModel> responseModel = AppContext.WebApi.Request<SurveyResponseModel>(WebApiUrl.SURVEY_GET_QUESTIONS, parameter);
						if (responseModel.code != "0000")
						{
							return (SurveyResponseModel)null;
						}
						LoadSuccess = true;
						return responseModel.content;
					}
					finally
					{
						Interlocked.Exchange(ref locker, 0L);
					}
				}
				return (SurveyResponseModel)null;
			});
		}

		private void GetQuestionFromWebsite()
		{
			GetQuestionFromWebsiteAsync().ContinueWith(delegate(Task<SurveyResponseModel> ar)
			{
				if (ar.Result != null)
				{
					SurveyResponseModel data = ar.Result;
					SelectedScore = "10";
					SurveyTitle = data.lables.thankStr;
					SurveySubTitle = data.lables.pleaseStr;
					int num = -1;
					for (int i = 0; i < _bindData[0].QuestionItems.Count; i++)
					{
						if (_bindData[0].QuestionItems[i].IsSelected)
						{
							SelectedScore = _bindData[0].QuestionItems[i].ItemText;
							num = i;
							break;
						}
					}
					SurveyMsg surveyMsg = data.msg[0];
					ObservableCollection<SurveyDataModel> observableCollection = new ObservableCollection<SurveyDataModel>();
					ObservableCollection<QuestionItem> observableCollection2 = LoadSrocesSetting(surveyMsg);
					if (num > -1)
					{
						observableCollection2[num].IsSelected = true;
					}
					observableCollection.Add(new SurveyDataModel(surveyMsg.id, surveyMsg.sequenceName + " " + surveyMsg.question, observableCollection2, _required: true, _isVisible: true, data.lables.rate)
					{
						IsSatisfied = (Visibility)0
					});
					QuestionList = observableCollection;
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						if (data.msg[0].children != null && data.msg[0].children.Count > 0)
						{
							LoadQuestionUI(data.msg[0].children, data.lables.rate, isChildren: true);
						}
						LoadOthers(ar.Result);
					});
				}
			});
		}

		private ObservableCollection<QuestionItem> LoadSrocesSetting(SurveyMsg _question)
		{
			List<SurveyQuestionRemark> remarkList = _question.remarkList;
			ObservableCollection<QuestionItem> sroces = new ObservableCollection<QuestionItem>();
			if (remarkList != null && remarkList.Count > 0)
			{
				Dictionary<string, int> dictionary = new Dictionary<string, int>
				{
					["bottom"] = 0,
					["between"] = 1,
					["top"] = 2
				};
				ScoreList.Clear();
				foreach (SurveyQuestionRemark item in remarkList)
				{
					if (dictionary.TryGetValue(item.name, out var index))
					{
						item.value.ForEach(delegate(int p)
						{
							sroces.Add(new QuestionItem(QuestionType.Sroce, p.ToString(), index, p.ToString()));
						});
						ScoreList.Add(index, item.value.ConvertAll((int x) => x.ToString()));
					}
				}
			}
			else
			{
				sroces.Add(new QuestionItem(QuestionType.Sroce, "0", 0));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "1", 0));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "2", 0));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "3", 0));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "4", 0));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "5", 1));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "6", 1));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "7", 1));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "8", 2));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "9", 2));
				sroces.Add(new QuestionItem(QuestionType.Sroce, "10", 2));
				ScoreList = new Dictionary<int, List<string>>
				{
					{
						0,
						new List<string> { "0", "1", "2", "3", "4" }
					},
					{
						1,
						new List<string> { "5", "6", "7" }
					},
					{
						2,
						new List<string> { "8", "9", "10" }
					}
				};
			}
			sroces.ToList().ForEach(delegate(QuestionItem x)
			{
				x.SelectionChanged += delegate(object s, EventArgs e)
				{
					QuestionSelectedChanged(_question, s as QuestionItem);
				};
			});
			return sroces;
		}

		private bool CheckAnswerCondition(List<ParentAnswerCondition> rules, object data)
		{
			if (rules == null || rules.Count == 0)
			{
				return false;
			}
			return rules.Any((ParentAnswerCondition item) => CheckAnswerConditionItem(item, data));
		}

		private bool CheckAnswerConditionItem(ParentAnswerCondition rule, object data)
		{
			switch (rule.@operator)
			{
			case "eq":
				return rule.value.Count == 1 && rule.value[0] == data.ToString();
			case "in":
				return rule.value.Count > 0 && rule.value.Contains(data.ToString());
			case "lt":
			{
				if (rule.value.Count == 1 && int.TryParse(rule.value[0], out var result5) && int.TryParse(data.ToString(), out var result6))
				{
					return result6 < result5;
				}
				return false;
			}
			case "gt":
			{
				if (rule.value.Count == 1 && int.TryParse(rule.value[0], out var result3) && int.TryParse(data.ToString(), out var result4))
				{
					return result4 > result3;
				}
				return false;
			}
			case "le":
			{
				if (rule.value.Count == 1 && int.TryParse(rule.value[0], out var result7) && int.TryParse(data.ToString(), out var result8))
				{
					return result8 <= result7;
				}
				return false;
			}
			case "ge":
			{
				if (rule.value.Count == 1 && int.TryParse(rule.value[0], out var result) && int.TryParse(data.ToString(), out var result2))
				{
					return result2 >= result;
				}
				return false;
			}
			default:
				return false;
			}
		}

		private void QuestionSelectedChanged(SurveyMsg question, QuestionItem data)
		{
			if (question.children == null || question.children.Count == 0)
			{
				return;
			}
			foreach (SurveyMsg item in question.children)
			{
				bool IsVisble = data != null && CheckAnswerCondition(item.parentAnswerConditionValue, data.Id);
				QuestionList.Where((SurveyDataModel x) => x.Id == item.id).ToList().ForEach(delegate(SurveyDataModel x)
				{
					x.IsVisible = (Visibility)((!IsVisble) ? 2 : 0);
				});
				if (IsVisble)
				{
					QuestionSelectedChanged(item, QuestionList.Where((SurveyDataModel x) => x.Id == item.id).ToList().FirstOrDefault()
						.QuestionItems.FirstOrDefault((QuestionItem p) => p.IsSelected));
				}
				else
				{
					SetQuestionIsVisible(item, IsVisible: false);
				}
			}
		}

		private void SetQuestionIsVisible(SurveyMsg question, bool IsVisible)
		{
			QuestionList.Where((SurveyDataModel x) => x.Id == question.id).ToList().ForEach(delegate(SurveyDataModel x)
			{
				x.IsVisible = (Visibility)((!IsVisible) ? 2 : 0);
			});
			if (question.children == null || question.children.Count == 0)
			{
				return;
			}
			foreach (SurveyMsg child in question.children)
			{
				SetQuestionIsVisible(child, IsVisible);
			}
		}

		private void LoadQuestionUI(List<SurveyMsg> question, string rate, bool isChildren = false)
		{
			SurveyMsg _question;
			for (int i = 0; i < question.Count; i++)
			{
				_question = question[i];
				if (QuestionList.Count((SurveyDataModel p) => p.Id == _question.id) > 0)
				{
					continue;
				}
				QuestionType questionType = ConvertToQuestionType(_question.type);
				ObservableCollection<QuestionItem> observableCollection = new ObservableCollection<QuestionItem>();
				switch (questionType)
				{
				case QuestionType.MultipleChoice:
				{
					SurveyMsg currentQuestion2 = question[i];
					foreach (SurveyNewOptions option in _question.options)
					{
						QuestionItem questionItem2 = new QuestionItem(questionType, option.id, option.option);
						questionItem2.SelectionChanged += delegate(object s, EventArgs e)
						{
							QuestionSelectedChanged(currentQuestion2, s as QuestionItem);
						};
						observableCollection.Add(questionItem2);
					}
					break;
				}
				case QuestionType.SingleChoice:
				{
					SurveyMsg currentQuestion3 = question[i];
					string[] array3 = _question.content.Split(new char[1] { ';' });
					string[] array4 = _question.contentDe.Split(new char[1] { ';' });
					List<SurveyNewOptions> options2 = _question.options;
					int ix2;
					for (ix2 = 0; ix2 < array3.Length; ix2++)
					{
						QuestionItem questionItem3 = new QuestionItem(280.0, questionType, array3[ix2], array4[ix2])
						{
							GroupName = "Question" + _question.id
						};
						if (options2 != null && options2.Count > 0 && options2.Exists((SurveyNewOptions n) => int.Parse(n.id) == ix2))
						{
							questionItem3.Width = 660.0;
							questionItem3.Visibile = (Visibility)0;
						}
						questionItem3.SelectionChanged += delegate(object s, EventArgs e)
						{
							QuestionSelectedChanged(currentQuestion3, s as QuestionItem);
						};
						observableCollection.Add(questionItem3);
					}
					break;
				}
				case QuestionType.SingleChoiceDescriptionUpward:
				{
					SurveyMsg currentQuestion = question[i];
					string[] array = _question.content.Split(new char[1] { ';' });
					string[] array2 = _question.contentDe.Split(new char[1] { ';' });
					List<SurveyNewOptions> options = _question.options;
					int ix;
					for (ix = 0; ix < array.Length; ix++)
					{
						QuestionItem questionItem = new QuestionItem(160.0, questionType, array[ix], array2[ix])
						{
							GroupName = "Question" + _question.id
						};
						if (options != null && options.Count > 0 && options.Exists((SurveyNewOptions n) => int.Parse(n.id) == ix))
						{
							questionItem.Width = 660.0;
							questionItem.Visibile = (Visibility)0;
						}
						questionItem.SelectionChanged += delegate(object s, EventArgs e)
						{
							QuestionSelectedChanged(currentQuestion, s as QuestionItem);
						};
						observableCollection.Add(questionItem);
					}
					break;
				}
				case QuestionType.Text:
					observableCollection.Add(new QuestionItem(questionType, _question.id, string.Empty));
					break;
				}
				QuestionList.Add(new SurveyDataModel(_question.id, _question.sequenceName + " " + _question.question, observableCollection, _question.required, !isChildren, rate));
				if (_question.children != null && _question.children.Count > 0)
				{
					LoadQuestionUI(_question.children, rate, isChildren: true);
				}
			}
		}

		private void LoadOthers(SurveyResponseModel data)
		{
			try
			{
				LoadQuestionUI(data.msg, data.lables.rate);
				if (int.TryParse(SelectedScore, out var selectScoreValue))
				{
					QuestionList.Where((SurveyDataModel x) => x.Id == "14").ToList().ForEach(delegate(SurveyDataModel x)
					{
						x.IsRequired = (Visibility)(selectScoreValue > 5);
					});
				}
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"show more survey question exception:[{arg}]");
			}
		}

		private void RefreshData()
		{
			GetQuestionFromWebsiteAsync().ContinueWith(delegate(Task<SurveyResponseModel> ar)
			{
				if (ar.Result != null)
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						LoadOthers(ar.Result);
					});
				}
			});
		}

		private bool VerifyData()
		{
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Invalid comparison between Unknown and I4
			VerifyErrorVisibility = (Visibility)1;
			foreach (SurveyDataModel question in QuestionList)
			{
				if ((int)question.IsRequired != 0 || (int)question.IsVisible != 0)
				{
					continue;
				}
				bool flag = false;
				foreach (QuestionItem questionItem in question.QuestionItems)
				{
					if (questionItem.QuestionType == "Text")
					{
						if (!string.IsNullOrWhiteSpace(questionItem.ItemText))
						{
							flag = true;
							break;
						}
					}
					else if (questionItem.IsSelected)
					{
						flag = true;
						break;
					}
				}
				if (!flag)
				{
					VerifyErrorText = question.VerifyErrorText;
					VerifyErrorVisibility = (Visibility)0;
					return flag;
				}
			}
			return true;
		}

		private void _SubmitClickCommandCommandHandler(object parameter)
		{
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a7: Invalid comparison between Unknown and I4
			try
			{
				if (!VerifyData())
				{
					return;
				}
				SurveySubmitModel _model = new SurveySubmitModel();
				_model.clientUuid = GlobalFun.GetClientUUID();
				_model.records = new List<SubmitItem>();
				foreach (SurveyDataModel question in QuestionList)
				{
					string text = string.Empty;
					foreach (QuestionItem questionItem in question.QuestionItems)
					{
						if ((int)question.IsVisible == 0)
						{
							if (questionItem.QuestionType == "Text")
							{
								text = questionItem.ItemText;
							}
							else if (questionItem.IsSelected)
							{
								text = ((!string.IsNullOrEmpty(questionItem.Data)) ? (text + questionItem.Id + "(" + questionItem.Data + "),") : (text + questionItem.Id + ","));
							}
						}
					}
					if (!string.IsNullOrEmpty(text))
					{
						text = text.TrimEnd(new char[1] { ',' });
						_model.records.Add(new SubmitItem(question.Id, text));
					}
				}
				SubmitBtnEnable = false;
				Task.Factory.StartNew(delegate
				{
					ResponseModel<object> responseModel = AppContext.WebApi.RequestBase(WebApiUrl.SURVEY_RECORD, _model);
					sw.Stop();
					HostProxy.BehaviorService.Collect(BusinessType.SURVEY_QUIT, new BusinessData(BusinessType.SURVEY_QUIT, null).Update(sw.ElapsedMilliseconds, BusinessStatus.SUCCESS, _model.records));
					QuestionVisibility = false;
					if (responseModel.code == "0000")
					{
						SubmitThanksText = responseModel.desc;
					}
					else
					{
						SubmitThanksText = "K1025";
					}
					Thread.Sleep(3000);
					AppContext.Single.CurrentDispatcher.Invoke((Action)delegate
					{
						object obj = parameter;
						Window val = (Window)((obj is Window) ? obj : null);
						if (val != null)
						{
							val.Close();
						}
					});
				});
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"post survey result data. url:[{WebApiUrl.SURVEY_RECORD}] exception:[{arg}]");
			}
		}

		private void _CloseWinCommandCommandHandler(object parameter)
		{
			Window val = (Window)((parameter is Window) ? parameter : null);
			if (val != null)
			{
				val.Close();
			}
		}

		private void _RadioBtnScoreCommand(object parameter)
		{
			SelectedScore = parameter.ToString();
			KeyValuePair<int, List<string>> keyValuePair = ScoreList.FirstOrDefault((KeyValuePair<int, List<string>> x) => x.Value.Contains(SelectedScore));
			if (keyValuePair.Value != null)
			{
				switch (keyValuePair.Key)
				{
				case 0:
					QuestionList[0].ChooseImg = "../ResourceV6/Survey/Icon-Very dissatisfied@2x.png";
					QuestionList[0].ChooseDesc = "K2126";
					break;
				case 1:
					QuestionList[0].ChooseImg = "../ResourceV6/Survey/Icon-Dissatisfied@2x.png";
					QuestionList[0].ChooseDesc = "K2127";
					break;
				default:
					QuestionList[0].ChooseImg = "../ResourceV6/Survey/Icon-Satisfied@2x.png";
					QuestionList[0].ChooseDesc = "K2128";
					break;
				}
			}
			if (int.TryParse(SelectedScore, out var selectScoreValue))
			{
				QuestionList.Where((SurveyDataModel x) => x.Id == "14").ToList().ForEach(delegate(SurveyDataModel x)
				{
					x.IsRequired = (Visibility)(selectScoreValue > 5);
				});
			}
			else
			{
				QuestionList.Where((SurveyDataModel x) => x.Id == "14").ToList().ForEach(delegate(SurveyDataModel x)
				{
					x.IsRequired = (Visibility)0;
				});
			}
		}

		private QuestionType ConvertToQuestionType(string _type)
		{
			return _type switch
			{
				"rate" => QuestionType.Sroce, 
				"mt-select" => QuestionType.MultipleChoice, 
				"choose" => QuestionType.SingleChoice, 
				"text" => QuestionType.Text, 
				"choose-description-upward" => QuestionType.SingleChoiceDescriptionUpward, 
				_ => QuestionType.SingleChoice, 
			};
		}
	}
	public class MainWindowOperationPanelStyleViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private Brush controlPanelBackground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#ffffff"));

		private Brush controlPanelFreground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2"));

		private Brush controlPanelMouseOverFreground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#ffffff"));

		private Visibility navigationSpliteEffectVisibility = (Visibility)2;

		public Brush ControlPanelBackground
		{
			get
			{
				return controlPanelBackground;
			}
			set
			{
				if (value != controlPanelBackground)
				{
					controlPanelBackground = value;
					OnPropertyChanged("ControlPanelBackground");
				}
			}
		}

		public Brush ControlPanelFreground
		{
			get
			{
				return controlPanelFreground;
			}
			set
			{
				if (controlPanelFreground != value)
				{
					controlPanelFreground = value;
					OnPropertyChanged("ControlPanelFreground");
				}
			}
		}

		public Brush ControlPanelMouseOverFreground
		{
			get
			{
				return controlPanelMouseOverFreground;
			}
			set
			{
				if (controlPanelMouseOverFreground != value)
				{
					controlPanelMouseOverFreground = value;
					OnPropertyChanged("ControlPanelMouseOverFreground");
				}
			}
		}

		public Visibility NavigationSpliteEffectVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return navigationSpliteEffectVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (navigationSpliteEffectVisibility != value)
				{
					navigationSpliteEffectVisibility = value;
					OnPropertyChanged("NavigationSpliteEffectVisibility");
				}
			}
		}
	}
	internal class MainWindowViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private enum DeviceCap
		{
			VERTRES = 10,
			PHYSICALWIDTH = 110,
			SCALINGFACTORX = 114,
			DESKTOPVERTRES = 117
		}

		private class PermissionsCheckTipViewManager
		{
			private Dictionary<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> tasks = new Dictionary<TcpAndroidDevice, PermissionsCheckConfirmEventArgs>();

			protected object locker = new object();

			private ConfirmAppPermissionWindow6 ConfirmPermissionWin = null;

			private MessageRightGifStepsViewV7 checkFilePermissionView = null;

			private KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> currentDevice { get; set; }

			private void Add(TcpAndroidDevice d, PermissionsCheckConfirmEventArgs e)
			{
				lock (locker)
				{
					tasks[d] = e;
				}
			}

			public void Remove(TcpAndroidDevice d)
			{
				lock (locker)
				{
					tasks.Remove(d);
					if (currentDevice.Key == d)
					{
						currentDevice = new KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs>(null, null);
					}
				}
			}

			private KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> Pop()
			{
				lock (locker)
				{
					int num = tasks.Count - 1;
					while (num >= 0)
					{
						KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> result = tasks.ElementAt(num);
						if (result.Key.SoftStatus != DeviceSoftStateEx.Connecting)
						{
							tasks.Remove(result.Key);
							num--;
							continue;
						}
						return result;
					}
				}
				return new KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs>(null, null);
			}

			private void ShowTipView(TcpAndroidDevice device, int _checkPermissionsFailedType)
			{
				lock (locker)
				{
					if (ConfirmPermissionWin != null || checkFilePermissionView != null)
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
						if (ConfirmPermissionWin == null && checkFilePermissionView == null)
						{
							string value = currentDevice.Key?.ConnectedAppType;
							string empty = string.Empty;
							if (!string.IsNullOrEmpty(value))
							{
								if ("Ma".Equals(value))
								{
									empty = "K0750";
								}
								else if ("Moto".Equals(value))
								{
									empty = "K0797";
								}
							}
							checkFilePermissionView = new MessageRightGifStepsViewV7(LangTranslation.Translate("K1886"), LangTranslation.Translate("K1887"), LangTranslation.Translate("K1888"), "app_permissions_all_files.gif")
							{
								ShowNow = true,
								ExecutePredicate = (object w) => CheckRescueFlash(),
								AutoCloseConditionFunc = delegate
								{
									TcpAndroidDevice tcpAndroidDevice = device;
									return tcpAndroidDevice != null && tcpAndroidDevice.PhysicalStatus == DevicePhysicalStateEx.Offline;
								}
							};
							checkFilePermissionView.ConfirmCallback = delegate
							{
								checkFilePermissionView.SetConfirmBtnStatus(_enabled: false);
								Task.Run(delegate
								{
									KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> keyValuePair = currentDevice;
									bool? haveGranted = device?.CheckPermissions(new List<string> { "ACCESS_ALL_FILES" });
									Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
									if (currentDispatcher2 != null)
									{
										currentDispatcher2.Invoke((Action)delegate
										{
											if (haveGranted.HasValue && haveGranted.Value)
											{
												checkFilePermissionView.Result = true;
												((Window)checkFilePermissionView).Close();
											}
											checkFilePermissionView.SetConfirmBtnStatus(_enabled: true);
										});
									}
								});
							};
							checkFilePermissionView.CancelCallback = delegate
							{
								Task.Run(delegate
								{
									CancelAllTask();
								});
							};
							ConfirmAppPermissionViewModel checkBackupPermissionViewModel = new ConfirmAppPermissionViewModel();
							PermissionsCheckTipViewManager permissionsCheckTipViewManager = this;
							ConfirmAppPermissionWindow6 confirmAppPermissionWindow = new ConfirmAppPermissionWindow6();
							((FrameworkElement)confirmAppPermissionWindow).DataContext = checkBackupPermissionViewModel;
							confirmAppPermissionWindow.AutoCloseConditionFunc = delegate
							{
								TcpAndroidDevice tcpAndroidDevice = device;
								return tcpAndroidDevice != null && tcpAndroidDevice.PhysicalStatus == DevicePhysicalStateEx.Offline;
							};
							confirmAppPermissionWindow.ShowNow = true;
							confirmAppPermissionWindow.ExecutePredicate = (object w) => CheckRescueFlash();
							permissionsCheckTipViewManager.ConfirmPermissionWin = confirmAppPermissionWindow;
							checkBackupPermissionViewModel.CloseCallback = delegate
							{
								Task.Run(delegate
								{
									ConfirmPermissionWin.Result = false;
									CancelAllTask();
									CloseTipView();
								});
							};
							checkBackupPermissionViewModel.ConfirmCallback = delegate
							{
								checkBackupPermissionViewModel.ConfirmButtonEnabled = false;
								Task.Run(delegate
								{
									KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> keyValuePair = currentDevice;
									bool? haveGranted = device?.CheckPermissions(new List<string> { "Backup" });
									Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
									if (currentDispatcher2 != null)
									{
										currentDispatcher2.Invoke((Action)delegate
										{
											if (haveGranted.HasValue && haveGranted.Value)
											{
												ConfirmPermissionWin.Result = true;
												((Window)ConfirmPermissionWin).Close();
											}
											checkBackupPermissionViewModel.ConfirmButtonEnabled = true;
										});
									}
								});
							};
							Task.Run(delegate
							{
								bool? flag = true;
								bool? flag2 = null;
								if (_checkPermissionsFailedType == 1)
								{
									int result = (device?.Property?.ApiLevel).GetValueOrDefault();
									if (result == 0)
									{
										string s = device?.DeviceOperator?.Command("shell getprop ro.build.version.sdk", -1, device.Identifer);
										int.TryParse(s, out result);
									}
									if (result > 29)
									{
										flag = MessageWindowHelper.Instance.Show(checkFilePermissionView, true).Result;
									}
									if (flag == true)
									{
										flag2 = device?.CheckPermissions(new List<string> { "Backup" });
										if (flag2 != true)
										{
											flag2 = MessageWindowHelper.Instance.Show(ConfirmPermissionWin, true).Result;
										}
									}
								}
								if (_checkPermissionsFailedType == 2)
								{
									flag2 = MessageWindowHelper.Instance.Show(ConfirmPermissionWin, true).Result;
								}
								if (flag2 == true && currentDevice.Key != null && currentDevice.Value.RequestPermissionsAction(arg: true))
								{
									PrivateAutoProcess(currentDevice.Key, currentDevice.Value, forceRemoveSelf: true);
								}
								checkFilePermissionView = null;
								ConfirmPermissionWin = null;
							});
						}
					});
				}
			}

			private void CloseTipView()
			{
				lock (locker)
				{
					if (ConfirmPermissionWin != null)
					{
						LogHelper.LogInstance.Debug("enter CloseTipView.");
						Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
						if (currentDispatcher != null)
						{
							currentDispatcher.Invoke((Action)delegate
							{
								ConfirmAppPermissionWindow6 confirmPermissionWin = ConfirmPermissionWin;
								if (confirmPermissionWin != null)
								{
									confirmPermissionWin.Win.Close();
								}
								ConfirmPermissionWin = null;
							});
						}
					}
					LogHelper.LogInstance.Debug("quit CloseTipView.");
				}
			}

			public void AutoProcess(TcpAndroidDevice device, PermissionsCheckConfirmEventArgs e)
			{
				PrivateAutoProcess(device, e, forceRemoveSelf: false);
			}

			private void PrivateAutoProcess(TcpAndroidDevice device, PermissionsCheckConfirmEventArgs e, bool forceRemoveSelf)
			{
				LogHelper.LogInstance.Info($"PrivateAutoProcess entered, device:[{device}],forceRemoveSelf:[{forceRemoveSelf}]");
				lock (locker)
				{
					if (forceRemoveSelf)
					{
						Remove(device);
						currentDevice = new KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs>(null, null);
						KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> keyValuePair = Pop();
						device = keyValuePair.Key;
						e = keyValuePair.Value;
					}
					if (device == null)
					{
						KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> keyValuePair2 = Pop();
						device = keyValuePair2.Key;
						e = keyValuePair2.Value;
					}
					if (device == null)
					{
						LogHelper.LogInstance.Info($"PrivateAutoProcess exited, currentDeviceKV[{currentDevice.Key}], device:[device is null]");
						CloseTipView();
						return;
					}
					if (device.SoftStatus == DeviceSoftStateEx.Connecting)
					{
						if (currentDevice.Key == null)
						{
							LogHelper.LogInstance.Debug("PrivateAutoProcess 01 SoftStatus Connecting ShowTipView.");
							currentDevice = new KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs>(device, e);
							ShowTipView(device, e.CheckPermissionsFailedResult);
						}
						else
						{
							LogHelper.LogInstance.Debug("PrivateAutoProcess 02 SoftStatus Connecting Add.");
							Add(device, e);
						}
					}
					else if (currentDevice.Key == device)
					{
						KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> keyValuePair3 = Pop();
						LogHelper.LogInstance.Debug($"PrivateAutoProcess 03 kv:[{keyValuePair3}].");
						if (keyValuePair3.Key == null)
						{
							currentDevice = new KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs>(null, null);
							CloseTipView();
						}
						else
						{
							currentDevice = keyValuePair3;
						}
					}
					else
					{
						Remove(device);
					}
					if (tasks.Count == 0 && currentDevice.Key == null)
					{
						CloseTipView();
					}
					LogHelper.LogInstance.Info(string.Format("PrivateAutoProcess exited, task count[{0}] currentDeviceKV[{1}], device:[{2}],forceRemoveSelf:[{3}]", new object[4]
					{
						tasks?.Count,
						currentDevice.Key,
						device,
						forceRemoveSelf
					}));
				}
			}

			private void CancelAllTask()
			{
				lock (locker)
				{
					foreach (KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs> task in tasks)
					{
						task.Value.RequestPermissionsAction(arg: false);
					}
					if (currentDevice.Key != null && currentDevice.Value != null)
					{
						currentDevice.Value.RequestPermissionsAction(arg: false);
					}
					currentDevice = new KeyValuePair<TcpAndroidDevice, PermissionsCheckConfirmEventArgs>(null, null);
				}
			}
		}

		private ObservableCollection<PluginModel> _PluginArr = new ObservableCollection<PluginModel>();

		private volatile bool isDisposing = false;

		private DeviceDataCollection _DeviceDataCollection = new DeviceDataCollection();

		private static MainWindowViewModel singleInstance;

		private ConcurrentDictionary<int, CouponInfo> CacheCouponDic = new ConcurrentDictionary<int, CouponInfo>();

		protected AutoResetEvent couponlocker = new AutoResetEvent(initialState: false);

		private PermissionsCheckTipViewManager permissionsCheckTipViewManager = new PermissionsCheckTipViewManager();

		private long runninglocker = 0L;

		private Visibility m_deletePersonalButtonVisibility = (Visibility)2;

		private MainWindowOperationPanelStyleViewModel mainWindowOperationPanelStyle = null;

		private Visibility maskLayerVisibility = (Visibility)2;

		private UserOperationMenuViewModel mUserOperation;

		private SystemOperationViewModel mSystemOperation;

		private bool mDeletePersonalDataEnabled = true;

		private ReplayCommand mDeletePersonalDataCommand;

		private string mAssemblyVersion;

		private string _downloadcentertip = "K0322";

		private string _downloadcenterbutton = "K0698";

		private DeletePersonalDataOperationGuideViewModel m_deletePersonalDataViewModel;

		private ReplayCommand goMyDeviceCommandClick;

		private ReplayCommand goRescueCommandClick;

		private ReplayCommand goBackupRestoreCommandClick;

		private ReplayCommand goToolboxCommandClick;

		private FeedbackOperationItemViewModel feedback = new FeedbackOperationItemViewModel();

		private ImageSource _BannerImage = null;

		private Visibility _SmallBannerVisibility = (Visibility)2;

		private Visibility _BannerVisibility = (Visibility)2;

		private Visibility _MiddleBannerVisibility = (Visibility)2;

		private bool _IsUiWorkEnabe = true;

		private string _Discount;

		private string _MotoCare;

		private string _SubText;

		private int _PositionStart;

		private int _PositionCount;

		private Visibility _iconDriverVisibility = (Visibility)2;

		private Stopwatch sw = new Stopwatch();

		public ObservableCollection<PluginModel> PluginArr
		{
			get
			{
				return _PluginArr;
			}
			set
			{
				_PluginArr = value;
				OnPropertyChanged("PluginArr");
			}
		}

		public ReplayCommand BannerClickCommand { get; }

		protected static MotoCareInfo motoCareInfo { get; set; }

		protected static string thumbnailImg => motoCareInfo?.thumbnailImg;

		protected static string picture => motoCareInfo?.picture;

		protected static CouponInfo coupon { get; set; }

		protected static bool MiddleBannerManualClose { get; set; }

		public static MainWindowViewModel SingleInstance => singleInstance ?? (singleInstance = new MainWindowViewModel());

		public Visibility DeletePersonalButtonVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return m_deletePersonalButtonVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (m_deletePersonalButtonVisibility != value)
				{
					m_deletePersonalButtonVisibility = value;
					OnPropertyChanged("DeletePersonalButtonVisibility");
				}
			}
		}

		public MainWindowOperationPanelStyleViewModel MainWindowOperationPanelStyle
		{
			get
			{
				return mainWindowOperationPanelStyle;
			}
			set
			{
				if (mainWindowOperationPanelStyle != value)
				{
					mainWindowOperationPanelStyle = value;
					OnPropertyChanged("MainWindowOperationPanelStyle");
				}
			}
		}

		public Visibility MaskLayerVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return maskLayerVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				maskLayerVisibility = value;
				OnPropertyChanged("MaskLayerVisibility");
			}
		}

		public UserOperationMenuViewModel UserOperation
		{
			get
			{
				return mUserOperation;
			}
			set
			{
				if (mUserOperation != value)
				{
					mUserOperation = value;
					OnPropertyChanged("UserOperation");
				}
			}
		}

		public SystemOperationViewModel SystemOperation
		{
			get
			{
				return mSystemOperation;
			}
			set
			{
				if (mSystemOperation != value)
				{
					mSystemOperation = value;
					OnPropertyChanged("SystemOperation");
				}
			}
		}

		public HelpOperationViewModel HelpOperation { get; set; }

		public bool DeletePersonalDataEnabled
		{
			get
			{
				return mDeletePersonalDataEnabled;
			}
			set
			{
				if (mDeletePersonalDataEnabled != value)
				{
					mDeletePersonalDataEnabled = value;
					OnPropertyChanged("DeletePersonalDataEnabled");
				}
			}
		}

		public ReplayCommand DeletePersonalDataCommand
		{
			get
			{
				return mDeletePersonalDataCommand;
			}
			set
			{
				if (mDeletePersonalDataCommand != value)
				{
					mDeletePersonalDataCommand = value;
					OnPropertyChanged("DeletePersonalDataCommand");
				}
			}
		}

		public string AssemblyVersion
		{
			get
			{
				return mAssemblyVersion;
			}
			set
			{
				if (!(mAssemblyVersion == value))
				{
					mAssemblyVersion = value;
					OnPropertyChanged("AssemblyVersion");
				}
			}
		}

		public string downloadcentertip
		{
			get
			{
				return _downloadcentertip;
			}
			set
			{
				_downloadcentertip = value;
				OnPropertyChanged("downloadcentertip");
			}
		}

		public string downloadcenterbutton
		{
			get
			{
				return _downloadcenterbutton;
			}
			set
			{
				_downloadcenterbutton = value;
				OnPropertyChanged("downloadcenterbutton");
			}
		}

		public DeletePersonalDataOperationGuideViewModel DeletePersonalDataViewModel
		{
			get
			{
				return m_deletePersonalDataViewModel;
			}
			set
			{
				if (m_deletePersonalDataViewModel != value)
				{
					m_deletePersonalDataViewModel = value;
					OnPropertyChanged("DeletePersonalDataViewModel");
				}
			}
		}

		public ReplayCommand GoMyDeviceCommandClick
		{
			get
			{
				return goMyDeviceCommandClick;
			}
			set
			{
				if (goMyDeviceCommandClick != value)
				{
					goMyDeviceCommandClick = value;
					OnPropertyChanged("GoMyDeviceCommandClick");
				}
			}
		}

		public ReplayCommand GoRescueCommandClick
		{
			get
			{
				return goRescueCommandClick;
			}
			set
			{
				if (goRescueCommandClick != value)
				{
					goRescueCommandClick = value;
					OnPropertyChanged("GoRescueCommandClick");
				}
			}
		}

		public ReplayCommand GoBackupRestoreCommandClick
		{
			get
			{
				return goBackupRestoreCommandClick;
			}
			set
			{
				if (goBackupRestoreCommandClick != value)
				{
					goBackupRestoreCommandClick = value;
					OnPropertyChanged("GoBackupRestoreCommandClick");
				}
			}
		}

		public ReplayCommand GoToolboxCommandClick
		{
			get
			{
				return goToolboxCommandClick;
			}
			set
			{
				if (goToolboxCommandClick != value)
				{
					goToolboxCommandClick = value;
					OnPropertyChanged("GoToolboxCommandClick");
				}
			}
		}

		public FeedbackOperationItemViewModel FeedBack
		{
			get
			{
				return feedback;
			}
			set
			{
				if (feedback != value)
				{
					feedback = value;
					OnPropertyChanged("FeedBack");
				}
			}
		}

		public ImageSource BannerImage
		{
			get
			{
				return _BannerImage;
			}
			set
			{
				_BannerImage = value;
				OnPropertyChanged("BannerImage");
			}
		}

		public Visibility SmallBannerVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _SmallBannerVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				_SmallBannerVisibility = value;
				OnPropertyChanged("SmallBannerVisibility");
			}
		}

		public Visibility BannerVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _BannerVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				_BannerVisibility = value;
				OnPropertyChanged("BannerVisibility");
			}
		}

		public Visibility MiddleBannerVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _MiddleBannerVisibility;
			}
			set
			{
				//IL_0048: Unknown result type (might be due to invalid IL or missing references)
				//IL_0031: Unknown result type (might be due to invalid IL or missing references)
				//IL_0033: Invalid comparison between Unknown and I4
				//IL_003c: Unknown result type (might be due to invalid IL or missing references)
				//IL_003d: Unknown result type (might be due to invalid IL or missing references)
				if (HostProxy.HostNavigation.CurrentPluginID == "8ab04aa975e34f1ca4f9dc3a81374e2c" && !HostProxy.User.user.IsB2BSupportMultDev)
				{
					MiddleBannerManualClose = (int)value > 0;
					_MiddleBannerVisibility = value;
				}
				else
				{
					_MiddleBannerVisibility = (Visibility)2;
				}
				OnPropertyChanged("MiddleBannerVisibility");
			}
		}

		public bool IsUiWorkEnabe
		{
			get
			{
				return _IsUiWorkEnabe;
			}
			set
			{
				_IsUiWorkEnabe = value;
				OnPropertyChanged("IsUiWorkEnabe");
			}
		}

		public string Discount
		{
			get
			{
				return _Discount;
			}
			set
			{
				_Discount = value;
				OnPropertyChanged("Discount");
			}
		}

		public string MotoCare
		{
			get
			{
				return _MotoCare;
			}
			set
			{
				_MotoCare = value;
				OnPropertyChanged("MotoCare");
			}
		}

		public string SubText
		{
			get
			{
				return _SubText;
			}
			set
			{
				_SubText = value;
				OnPropertyChanged("SubText");
			}
		}

		public int PositionStart
		{
			get
			{
				return _PositionStart;
			}
			set
			{
				_PositionStart = value;
				OnPropertyChanged("PositionStart");
			}
		}

		public int PositionCount
		{
			get
			{
				return _PositionCount;
			}
			set
			{
				_PositionCount = value;
				OnPropertyChanged("PositionCount");
			}
		}

		public Visibility IconDriverVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return _iconDriverVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				_iconDriverVisibility = value;
				OnPropertyChanged("IconDriverVisibility");
			}
		}

		public void LoadPlugin()
		{
			if (ApplcationClass.AvailablePlugins == null)
			{
				return;
			}
			foreach (PluginModel availablePlugin in ApplcationClass.AvailablePlugins)
			{
				if (Configurations.BackupLastDateTime == DateTime.MinValue && availablePlugin.Info.PluginID == "13f79fe4cfc98747c78794a943886bcd")
				{
					PluginContainer.Instance.GetPlugin(availablePlugin.Info.PluginID).Init();
				}
				availablePlugin.PropertyChanged += delegate(object sender, PropertyChangedEventArgs e)
				{
					if (e.PropertyName == "IsSelected")
					{
						PluginModel plugin = sender as PluginModel;
						if (plugin.IsSelected)
						{
							((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
							{
								OnPluginChecked(plugin);
							});
						}
					}
				};
			}
			PluginArr = new ObservableCollection<PluginModel>(ApplcationClass.AvailablePlugins);
			if (PluginArr.Count != 0)
			{
				PluginArr[0].IsSelected = true;
			}
		}

		private void OnPluginChecked(PluginModel pModel)
		{
			LogHelper.LogInstance.Info("start plugin:" + pModel.Info.PluginName);
			HostProxy.HostNavigation.CurrentPluginID = pModel.Info.PluginID;
			DeviceConnectViewModel.Instance.ChangeEnadbled(pModel.Info.PluginID);
			MiddleBannerVisibility = (Visibility)((coupon == null || MiddleBannerManualClose) ? 2 : 0);
			if (pModel.IsLoaded)
			{
				pModel.Plugin.OnInit(null);
			}
			else
			{
				pModel.IsLoaded = true;
				IPlugin plugin = PluginContainer.Instance.GetPlugin(pModel.Info.PluginID);
				if (plugin == null)
				{
					return;
				}
				plugin.Init();
				pModel.Plugin = plugin;
				pModel.UiElement = plugin.CreateControl(ApplcationClass.ApplcationStartWindow);
			}
			DeviceViewModel selectedItem = DeviceConnectViewModel.Instance.SelectedItem;
			if (selectedItem != null && selectedItem.ConnectTy == ConnectType.Fastboot && (pModel.Info.PluginID == "13f79fe4cfc98747c78794a943886bcd" || pModel.Info.PluginID == "02928af025384c75ae055aa2d4f256c8"))
			{
				MessageWindowHelper.Instance.Show(null, "K2135", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
			}
			if (pModel.Info.PluginID != "8ab04aa975e34f1ca4f9dc3a81374e2c")
			{
				ApplcationClass.ApplcationStartWindow.ShowMutilIcon(showIcon: false, showList: true);
			}
			if (HostProxy.HostNavigation.CurrentPluginID == "13f79fe4cfc98747c78794a943886bcd")
			{
				DevicemgtContantClass.IsBackAndRestoreFrm = true;
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				if (masterDevice != null && masterDevice.SoftStatus == DeviceSoftStateEx.Connecting)
				{
					Task.Run(async delegate
					{
						await Task.Delay(300);
						HostProxy.deviceManager.RaiseConnectChange(status: false);
						DevicemgtContantClass.IsOtherToBackAndRestoreAndAutoConnection = false;
					});
				}
				else
				{
					HostProxy.deviceManager.RaiseConnectChange(status: true);
				}
			}
			else
			{
				DevicemgtContantClass.IsBackAndRestoreFrm = false;
			}
			if (HostProxy.HostNavigation.CurrentPluginID == "8ab04aa975e34f1ca4f9dc3a81374e2c" && !HostProxy.User.user.IsB2BSupportMultDev)
			{
				IconDriverVisibility = (Visibility)0;
			}
			else
			{
				IconDriverVisibility = (Visibility)2;
			}
		}

		public void GotoPluginById(string pluginId, object data = null)
		{
			try
			{
				PluginModel pluginModel = PluginArr.FirstOrDefault((PluginModel p) => p.Info.PluginID == pluginId);
				pluginModel.IsSelected = true;
				IPlugin plugin = PluginContainer.Instance.GetPlugin(pluginModel.Info.PluginID);
				plugin.OnInit(data);
			}
			catch (Exception)
			{
			}
		}

		[DllImport("gdi32.dll", SetLastError = true)]
		public static extern int GetDeviceCaps(IntPtr hdc, int nIndex);

		private MainWindowViewModel()
		{
			//IL_004b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0096: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c1: Unknown result type (might be due to invalid IL or missing references)
			//IL_01cb: Expected O, but got Unknown
			AssemblyVersion = Assembly.GetExecutingAssembly().GetName().Version.ToString() + (Configurations.IsReleaseVersion ? string.Empty : " (Test)");
			UserOperation = new UserOperationMenuViewModel();
			SystemOperation = new SystemOperationViewModel();
			HelpOperation = new HelpOperationViewModel();
			DeletePersonalDataCommand = new ReplayCommand(DeletePersonalDataCommandHandler);
			DeletePersonalDataViewModel = new DeletePersonalDataOperationGuideViewModel();
			GoMyDeviceCommandClick = new ReplayCommand(GoMyDeviceCommandClickHandler);
			GoRescueCommandClick = new ReplayCommand(GoRescueCommandClickHandler);
			GoBackupRestoreCommandClick = new ReplayCommand(GoBackupRestoreCommandClickHandler);
			GoToolboxCommandClick = new ReplayCommand(GoToolboxCommandClickHandler);
			BannerClickCommand = new ReplayCommand(BannerClickCommandHandler);
			Application.Current.DispatcherUnhandledException += new DispatcherUnhandledExceptionEventHandler(Current_DispatcherUnhandledException);
			AnalyticsManager.Current.DispatchPeriod = TimeSpan.Zero;
			AnalyticsManager.Current.ReportUncaughtExceptions = true;
			AnalyticsManager.Current.AutoAppLifetimeMonitoring = true;
			AnalyticsManager.Current.HitSent += AnalyticsManager_HitSent;
			AnalyticsManager.Current.HitMalformed += AnalyticsManager_HitMalformed;
			AnalyticsManager.Current.HitFailed += AnalyticsManager_HitFailed;
			AnalyticsManager.Current.PlatformTrackingInfo.OnTracking();
			Task.Run(delegate
			{
				InitDevicDataCollection();
				LanguageUpdateHelper.Instance.CheckNewLanguagePackage();
				InitUserRecordUploadAsync();
				InitializeDownloadResources();
				InitializeEvents();
				InitCheckScreen();
			});
		}

		public void Initialize()
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.ScreenName = "rsa-startPage";
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateScreenView().Build());
			HiddenBanner();
			UserService.Single.OnlineUserChanged += Single_OnlineUserChanged;
			LoadPlugin();
			CheckAndShowBootPage();
		}

		private void CheckAndShowBootPage()
		{
			string subKeyPath = "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Rescue and Smart Assistant";
			GlobalFun.TryGetRegistryKey(RegistryHive.LocalMachine, subKeyPath, "BootPage", out var value);
			if (value == null)
			{
				GlobalFun.WriteRegistryKey(subKeyPath, "BootPage", true);
				HelpOperation.MenuItems.Last().ClickCommandHandler(null);
			}
			else
			{
				StartDeviceListener();
			}
		}

		public void ShowBanner(object data)
		{
			WarrantyInfoBaseModel model = data as WarrantyInfoBaseModel;
			if (HostProxy.User.user.IsB2BSupportMultDev || model == null || string.IsNullOrEmpty(model.imei) || model.imei.Length <= 10)
			{
				return;
			}
			Task.Run(delegate
			{
				string twoLetterISORegionName = GlobalFun.GetRegionInfo().TwoLetterISORegionName;
				Dictionary<string, object> parameter = new Dictionary<string, object>
				{
					{ "country", twoLetterISORegionName },
					{
						"warrantyStatus",
						model.InWarranty ? 1 : 0
					},
					{
						"imei",
						model.InWarranty ? model.imei : null
					},
					{
						"clientUuid",
						GlobalFun.GetClientUUID()
					}
				};
				motoCareInfo = AppContext.WebApi.RequestContent<MotoCareInfo>(WebApiUrl.LOAD_WARRANTY_BANNER, parameter);
				if (motoCareInfo != null)
				{
					motoCareInfo.imei = model.imei;
					motoCareInfo.sn = model.msn ?? motoCareInfo.sn;
					motoCareInfo.WarrantyStartDate = model.WarrantyStartDate;
					motoCareInfo.WarrantyEndDate = model.WarrantyEndDate;
					motoCareInfo.InWarranty = model.InWarranty;
				}
				return motoCareInfo;
			}).ContinueWith(delegate
			{
				LoadCoupon(inWarranty: true).ContinueWith(delegate
				{
					if (coupon != null)
					{
						((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
						{
							Discount = coupon.discountInfo;
							MotoCare = (motoCareInfo.InWarranty ? "K1610" : "K1613");
							string text = LangTranslation.Translate("K1391");
							text = text + " " + Discount;
							SubText = string.Format(LangTranslation.Translate("K1390"), text);
							PositionStart = SubText.IndexOf(text);
							PositionCount = text.Length;
							MiddleBannerVisibility = (Visibility)0;
						});
					}
				});
				if (motoCareInfo == null)
				{
					HiddenBanner();
				}
				else
				{
					ChangeBannerPopup(show: true);
				}
			});
		}

		public void ChangeBannerPopup(bool show)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				if (motoCareInfo != null)
				{
					if (show)
					{
						((FrameworkElement)Application.Current.MainWindow).Height = 772.0;
						SmallBannerVisibility = (Visibility)2;
						BannerVisibility = (Visibility)0;
						BannerImage = Convert2ImageSource(picture);
					}
					else
					{
						couponlocker.Set();
						((FrameworkElement)Application.Current.MainWindow).Height = 700.0;
						SmallBannerVisibility = (Visibility)0;
						BannerVisibility = (Visibility)2;
						BannerImage = Convert2ImageSource(thumbnailImg);
					}
				}
			});
		}

		private void BannerClickCommandHandler(object data)
		{
			switch (data.ToString())
			{
			case "banner_click":
				couponlocker.WaitOne();
				if (coupon != null)
				{
					ShowCouponWindow();
				}
				else if (!string.IsNullOrEmpty(motoCareInfo?.url))
				{
					GlobalFun.OpenUrlByBrowser(motoCareInfo.url);
				}
				ChangeBannerPopup(show: false);
				break;
			case "small_banner_click":
				ChangeBannerPopup(show: true);
				break;
			case "banner_close":
				ChangeBannerPopup(show: false);
				break;
			case "middle_banner_close":
				MiddleBannerManualClose = true;
				MiddleBannerVisibility = (Visibility)2;
				break;
			case "middle_banner_click":
				ShowCouponWindow();
				break;
			}
		}

		private async Task<CouponInfo> LoadCoupon(bool inWarranty)
		{
			couponlocker.Reset();
			coupon = await Task.Run(delegate
			{
				if (motoCareInfo == null || !inWarranty)
				{
					return (CouponInfo)null;
				}
				if (CacheCouponDic.ContainsKey(motoCareInfo.id))
				{
					return CacheCouponDic[motoCareInfo.id];
				}
				Dictionary<string, object> parameter = new Dictionary<string, object>
				{
					{ "motoCareId", motoCareInfo.id },
					{
						"clientUuid",
						GlobalFun.GetClientUUID()
					}
				};
				CouponInfo data = AppContext.WebApi.RequestContent<CouponInfo>(WebApiUrl.LOAD_COUPON, parameter);
				if (data != null)
				{
					CacheCouponDic.AddOrUpdate(motoCareInfo.id, data, (int k, CouponInfo v) => data);
				}
				return data;
			});
			couponlocker.Set();
			return coupon;
		}

		private void ShowCouponWindow()
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				MiddleBannerVisibility = (Visibility)2;
				CouponWindow couponWindow = new CouponWindow();
				((FrameworkElement)couponWindow).DataContext = new CouponWindowModel(motoCareInfo, coupon);
				IMessageWindowV6 win = couponWindow;
				MessageWindowHelper.Instance.Show(win, true);
			});
		}

		private void HiddenBanner()
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				((FrameworkElement)Application.Current.MainWindow).Height = 700.0;
				SmallBannerVisibility = (Visibility)2;
				BannerVisibility = (Visibility)2;
				MiddleBannerVisibility = (Visibility)2;
			});
		}

		private ImageSource Convert2ImageSource(string url)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0015: Expected O, but got Unknown
			if (!string.IsNullOrEmpty(url))
			{
				BitmapImage val = new BitmapImage();
				val.BeginInit();
				val.UriSource = new Uri(url, UriKind.Absolute);
				val.EndInit();
				return (ImageSource)(object)val;
			}
			return null;
		}

		private void Current_DispatcherUnhandledException(object sender, DispatcherUnhandledExceptionEventArgs e)
		{
			LogHelper.LogInstance.Error("lenovo.mbg.service.lmsa.App.Current_DispatcherUnhandledException: Exception", e.Exception);
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateException(e.Exception.Message, isFatal: true).Build());
		}

		private void InitializeEvents()
		{
			WebApiHttpRequest.WebApiCallback = delegate(string t, object v)
			{
				if (AppContext.IsLogIn)
				{
					if (t == "NONETWORK")
					{
						MessageWindowHelper.Instance.Show(null, ((bool)v) ? "K0983" : "K1179", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true).Wait();
					}
					else if (t == "TOKEN_EXPRIED")
					{
						bool? result = MessageWindowHelper.Instance.Show(null, "K1863", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true).Result;
						((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
						{
							LogoutMenuItemViewModel.LogOut(force: true);
						});
					}
				}
				return (object)null;
			};
		}

		private async Task ClearResoucesAysnc()
		{
			await Task.Run(delegate
			{
				GlobalFun.KillProcess("adb");
			});
			await Task.Run(delegate
			{
				GlobalFun.KillProcess("qcomdloader");
			});
		}

		public void StopDeviceListener()
		{
			global::Smart.DeviceManagerEx.Stop();
			global::Smart.DeviceManagerEx.MasterDeviceChanged -= DeviceManagerEx_MasterDeviceChanged;
			global::Smart.DeviceManagerEx.Connecte -= DeviceManagerEx_Connecte;
			global::Smart.DeviceManagerEx.DisConnecte -= DeviceManagerEx_DisConnecte;
		}

		public void StartDeviceListener()
		{
			ClearResoucesAysnc().ContinueWith(delegate
			{
				Thread.Sleep(50);
				global::Smart.DeviceManagerEx.Start();
				global::Smart.DeviceManagerEx.MasterDeviceChanged += DeviceManagerEx_MasterDeviceChanged;
				global::Smart.DeviceManagerEx.Connecte += DeviceManagerEx_Connecte;
				global::Smart.DeviceManagerEx.DisConnecte += DeviceManagerEx_DisConnecte;
			});
		}

		private void DeviceManagerEx_MasterDeviceChanged(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				if (e.Current is TcpAndroidDevice tcpAndroidDevice)
				{
					tcpAndroidDevice.TcpConnectStepChanged += D_TcpConnectStepChanged;
				}
				e.Current.SoftStatusChanged += Current_SoftStatusChanged;
			}
			else
			{
				ApplcationClass.ApplcationStartWindow.ChangePinStoryboard(start: true);
			}
			if (e.Previous != null)
			{
				if (e.Previous is TcpAndroidDevice tcpAndroidDevice2)
				{
					tcpAndroidDevice2.TcpConnectStepChanged -= D_TcpConnectStepChanged;
				}
				e.Previous.SoftStatusChanged -= Current_SoftStatusChanged;
			}
		}

		private void DeviceManagerEx_DisConnecte(object sender, DeviceEx e)
		{
			if ((e.ConnectType == ConnectType.Adb || e.ConnectType == ConnectType.Wifi) && e is TcpAndroidDevice tcpAndroidDevice)
			{
				tcpAndroidDevice.PermissionsCheckConfirmEvent -= D_PermissionsCheckConfirmEvent;
				tcpAndroidDevice.PhysicalStatusChanged -= Current_PhysicalStatusChanged;
				permissionsCheckTipViewManager.Remove(tcpAndroidDevice);
			}
		}

		private void DeviceManagerEx_Connecte(object sender, DeviceEx e)
		{
			if ((e.ConnectType == ConnectType.Adb || e.ConnectType == ConnectType.Wifi) && e is TcpAndroidDevice tcpAndroidDevice)
			{
				tcpAndroidDevice.PermissionsCheckConfirmEvent += D_PermissionsCheckConfirmEvent;
				tcpAndroidDevice.PhysicalStatusChanged += Current_PhysicalStatusChanged;
			}
		}

		private void Current_SoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			if (e != DeviceSoftStateEx.Online)
			{
				return;
			}
			TcpAndroidDevice d = sender as TcpAndroidDevice;
			if (d != null)
			{
				ApplcationClass.ApplcationStartWindow.ChangePinStoryboard(start: false);
				Task.Run(delegate
				{
					WebServiceProxy.SingleInstance.reportConnectedAppType(d.ConnectedAppType);
				});
			}
		}

		private void D_PermissionsCheckConfirmEvent(object sender, PermissionsCheckConfirmEventArgs e)
		{
			if (e == null)
			{
				LogHelper.LogInstance.Debug("D_PermissionsCheckConfirmEvent args is null!");
			}
			else
			{
				permissionsCheckTipViewManager.AutoProcess((TcpAndroidDevice)sender, e);
			}
		}

		private void D_TcpConnectStepChanged(object sender, TcpConnectStepChangedEventArgs e)
		{
			if ("InstallApp".Equals(e.Step) && e.Result == ConnectStepStatus.Fail && e.ErrorCode == ConnectErrorCode.ApkInstallFailWithHaveNoSpace)
			{
				MessageWindowHelper.Instance.Show(null, "K1240", "K0327", null, showClose: false, (MessageBoxImage)48, null, isPrivacy: false, showNow: false, isAsynnc: false, null, (object win) => CheckRescueFlash(), null, null, true);
			}
		}

		public static bool CheckRescueFlash()
		{
			object obj = HostProxy.GlobalCache.Get("RESUCE_FLASH");
			if (obj == null)
			{
				return true;
			}
			bool.TryParse(obj.ToString(), out var result);
			return !(HostProxy.HostNavigation.CurrentPluginID == "8ab04aa975e34f1ca4f9dc3a81374e2c" && result);
		}

		public void InitUserRecordUploadAsync()
		{
			UserRequestRecordService userRequestRecordService = new UserRequestRecordService();
			userRequestRecordService.UploadAsync();
		}

		public void InitCheckScreen()
		{
			Graphics val = Graphics.FromHwnd(IntPtr.Zero);
			IntPtr hdc = val.GetHdc();
			int deviceCaps = GetDeviceCaps(hdc, 117);
			double num = (double)deviceCaps / SystemParameters.PrimaryScreenHeight;
			Rectangle bounds = Screen.GetBounds(Point.Empty);
			if (bounds.Width <= 1920 && bounds.Height <= 1080 && num >= 1.5)
			{
				MessageWindowHelper.Instance.Show(null, "K1518", "K0327", null, showClose: true, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
			}
		}

		private void InitDevicDataCollection()
		{
			Task.Run(delegate
			{
				_DeviceDataCollection.Initialize();
				_DeviceDataCollection.OnNewDeviceFound += _DeviceDataCollection_OnNewDeviceFound;
			});
		}

		private bool _DeviceDataCollection_OnNewDeviceFound(DeviceModel arg)
		{
			try
			{
				if (Interlocked.Read(in runninglocker) != 0)
				{
					return false;
				}
				Interlocked.Exchange(ref runninglocker, 1L);
				bool result = false;
				if (string.IsNullOrEmpty(arg.ModelName))
				{
					return result;
				}
				return MessageWindowHelper.Instance.Show("K0711", "K0707", "K0571", "K0570", showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true).Result == true;
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error(ex.ToString());
				return false;
			}
			finally
			{
				Interlocked.Exchange(ref runninglocker, 0L);
			}
		}

		private void Current_PhysicalStatusChanged(object sender, DevicePhysicalStateEx e)
		{
			switch (e)
			{
			case DevicePhysicalStateEx.Unauthorized:
				ShowGrantDebugPermissionTips(sender as DeviceEx);
				break;
			case DevicePhysicalStateEx.UsbDebugSwitchClosed:
				ShowUsbDebugSwitchClosedTips(sender as DeviceEx);
				break;
			}
		}

		private void ShowGrantDebugPermissionTips(DeviceEx device)
		{
			if (device == null)
			{
				return;
			}
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				IMessageWindowV6 win = new DebugPermissionWindow
				{
					ShowNow = true,
					ExecutePredicate = (object w) => CheckRescueFlash(),
					AutoCloseConditionFunc = () => device.PhysicalStatus != DevicePhysicalStateEx.Unauthorized
				};
				MessageWindowHelper.Instance.Show(win, true);
			});
		}

		private void ShowUsbDebugSwitchClosedTips(DeviceEx device)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				DeviceTutorialsDialogViewV6 win = new DeviceTutorialsDialogViewV6
				{
					ShowNow = true,
					ExecutePredicate = (object w) => CheckRescueFlash(),
					AutoCloseConditionFunc = () => device.PhysicalStatus != DevicePhysicalStateEx.UsbDebugSwitchClosed,
					CloseAction = delegate
					{
						GlobalCmdHelper.Instance.Execute(new
						{
							type = GlobalCmdType.TABLET_OPEN_USBDEBUG
						});
					}
				};
				MessageWindowHelper.Instance.Show(win, true);
			});
		}

		private void InitializeDownloadResources()
		{
			LoadDownloadResources loadDownloadResource = new LoadDownloadResources();
			Task.Factory.StartNew(delegate
			{
				loadDownloadResource.Load();
			});
		}

		private string Parse(Hit hit)
		{
			StringBuilder stringBuilder = new StringBuilder();
			if (hit != null)
			{
				foreach (string key in hit.Data.Keys)
				{
					stringBuilder.Append(key + ":" + hit.Data[key] + "  ");
				}
			}
			return stringBuilder.ToString();
		}

		private string GADebugLog(Hit hit, string message)
		{
			return "Request: " + Parse(hit) + Environment.NewLine + " Results: " + message;
		}

		private void AnalyticsManager_HitSent(object sender, HitSentEventArgs e)
		{
			if (AnalyticsManager.Current.IsDebug)
			{
				LogHelper.LogInstance.Debug(GADebugLog(e.Hit, e.Response));
			}
		}

		private void AnalyticsManager_HitFailed(object sender, HitFailedEventArgs e)
		{
			if (AnalyticsManager.Current.IsDebug)
			{
				LogHelper.LogInstance.Debug(GADebugLog(e.Hit, "**Hit Failed** " + Environment.NewLine + " " + e.Error.Message));
			}
		}

		private void AnalyticsManager_HitMalformed(object sender, HitMalformedEventArgs e)
		{
			if (AnalyticsManager.Current.IsDebug)
			{
				LogHelper.LogInstance.Debug(GADebugLog(e.Hit, "**Hit Malformed ** " + Environment.NewLine + " " + e.HttpStatusCode));
			}
		}

		private void Single_OnlineUserChanged(object sender, OnlineUserChangedEventArgs e)
		{
			if (e.IsOnline)
			{
				UserOperation.OnlineUserChangedHandler(sender, e);
				if (lenovo.mbg.service.lmsa.Login.Business.PermissionService.Single.CheckPermission(UserService.Single.CurrentLoggedInUser.UserId, "8", "1"))
				{
					DeletePersonalButtonVisibility = (Visibility)0;
				}
			}
			else
			{
				DeletePersonalButtonVisibility = (Visibility)2;
			}
		}

		private void DeletePersonalDataCommandHandler(object e)
		{
			LenovoWindow lenovoWindow = new LenovoWindow();
			((Window)lenovoWindow).SizeToContent = (SizeToContent)3;
			ClearupMainViewModel dataContext = new ClearupMainViewModel();
			ClearupMainView clearupMainView = new ClearupMainView();
			((FrameworkElement)clearupMainView).DataContext = dataContext;
			((ContentControl)lenovoWindow).Content = clearupMainView;
			MessageWindowHelper.Instance.Show(lenovoWindow, true);
		}

		private void GoMyDeviceCommandClickHandler(object args)
		{
			GoToPluginAndCheckUserOnline("02928af025384c75ae055aa2d4f256c8", showAgain: true);
		}

		private void GoRescueCommandClickHandler(object args)
		{
			GoToPluginAndCheckUserOnline("8ab04aa975e34f1ca4f9dc3a81374e2c", showAgain: true);
		}

		private void GoBackupRestoreCommandClickHandler(object args)
		{
			GoToPluginAndCheckUserOnline("02928af025384c75ae055aa2d4f256c8", showAgain: true, "lmsa-plugin-Device-backuprestore");
		}

		private void GoToolboxCommandClickHandler(object args)
		{
			GoToPluginAndCheckUserOnline("dd537b5c6c074ae49cc8b0b2965ce54a", showAgain: true);
		}

		private void GoToPluginAndCheckUserOnline(string pluginId, bool showAgain, object initdata = null)
		{
			if (!UserService.Single.IsOnline)
			{
				if (!showAgain)
				{
					return;
				}
				LenovoIdWindow.ShowDialogEx(isRegister: false, delegate(Window win)
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						Window obj = win;
						if (obj != null)
						{
							obj.Close();
						}
					});
					HostProxy.HostNavigation.SwitchTo(pluginId, initdata);
				});
			}
			else
			{
				HostProxy.HostNavigation.SwitchTo(pluginId, initdata);
			}
		}

		public async void CloseWindow()
		{
			if (await CheckCanCloseWindow())
			{
				await ApplcationClass.ApplcationStartWindow.ShowQuitSurvey();
				Dispose();
			}
		}

		public new void Dispose()
		{
			if (!isDisposing)
			{
				isDisposing = true;
				Exit(0);
			}
		}

		public void Exit(int code)
		{
			MessageWindowHelper.Instance.Show(((DispatcherObject)Application.Current).Dispatcher.Invoke<ClosingWindow>((Func<ClosingWindow>)(() => new ClosingWindow
			{
				IsAsynnc = true
			})), true);
			MainWindow applcationStartWindow = ApplcationClass.ApplcationStartWindow;
			if (applcationStartWindow != null)
			{
				((Window)applcationStartWindow).Close();
			}
		}

		public async Task<bool> IsExecuteWork()
		{
			if (ApplcationClass.IsExecuteWork)
			{
				await MessageWindowHelper.Instance.Show(null, "K0852", "K0327", null, showClose: false, (MessageBoxImage)48, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
				return true;
			}
			return false;
		}

		public async Task<bool> CheckCanCloseWindow()
		{
			if (await IsExecuteWork())
			{
				return false;
			}
			if (ApplcationClass.IsUpdatingPlug && !CheckClientVersion.Instance.NewVersionModel.ForceType)
			{
				return await MessageWindowHelper.Instance.Show(null, "K0296", "K0327", "K0208", showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true) == true;
			}
			return true;
		}
	}
	public class PrivacyPopViewModel : OKCancelViewModel
	{
		private string _privacyTipsText = "K0836";

		private string _privacyUrlText = "www.lenovo.com/privacy/";

		public ReplayCommand ShowPrivacyPageClickCommand { get; set; }

		public string PrivacyTipsText
		{
			get
			{
				return _privacyTipsText;
			}
			set
			{
				_privacyTipsText = value;
				OnPropertyChanged("PrivacyTipsText");
			}
		}

		public string PrivacyUrlText
		{
			get
			{
				return _privacyUrlText;
			}
			set
			{
				_privacyUrlText = value;
				OnPropertyChanged("PrivacyUrlText");
			}
		}

		public PrivacyPopViewModel()
		{
			ShowPrivacyPageClickCommand = new ReplayCommand(ShowPrivacyPageClickCommandHandler);
		}

		private void ShowPrivacyPageClickCommandHandler(object parameter)
		{
			GlobalFun.OpenUrlByBrowser("www.lenovo.com/privacy/");
		}
	}
	public class NewVersionViewModel
	{
		public string VersionID { get; set; }

		public string VersionName { get; set; }

		public string ReleaseDate { get; set; }

		public string FileSize { get; set; }

		public long Size { get; set; }

		public bool IsSelected { get; set; }

		public string CountSize(long Size)
		{
			string result = "";
			long num = 0L;
			num = Size;
			if ((double)num < 1024.0)
			{
				result = num.ToString("F2") + " Byte";
			}
			else if ((double)num >= 1024.0 && num < 1048576)
			{
				result = ((double)num / 1024.0).ToString("F2") + " K";
			}
			else if (num >= 1048576 && num < 1073741824)
			{
				result = ((double)num / 1024.0 / 1024.0).ToString("F2") + " M";
			}
			else if (num >= 1073741824)
			{
				result = ((double)num / 1024.0 / 1024.0 / 1024.0).ToString("F2") + " G";
			}
			return result;
		}
	}
	public class LanguageSelectViewModel : OKCancelViewModel
	{
		public enum CommandResult
		{
			Cancel,
			RestartNow,
			RestartLater
		}

		private string _readyLangTipContent = string.Empty;

		private double _readyLangTipContentFontSize = 6.0;

		private Brush _readyLangTipContentForeground = null;

		private bool _language1Checked = false;

		private bool _language2Checked = false;

		private bool _language3Checked = false;

		private bool _language4Checked = false;

		private bool _language5Checked = false;

		private bool _language6Checked = false;

		private bool _language7Checked = false;

		private bool _language8Checked = false;

		private bool _language9Checked = false;

		private bool _language10Checked = false;

		private bool _language11Checked = false;

		private bool _language12Checked = false;

		private bool _language13Checked = false;

		private bool _language14Checked = false;

		private bool _language15Checked = false;

		private string _languageSelected = string.Empty;

		private string _restartNowButtonText = string.Empty;

		private double _restartNowButtonTextFontSize = 6.0;

		private Brush _restartNowButtonBackground;

		private Brush _restartNowButtonForeground;

		private Brush _restartNowButtonMouseOverBackground;

		private Brush _restartNowButtonDisabledBackground;

		private string _restartLaterButtonText = string.Empty;

		private double _restartLaterButtonTextFontSize = 6.0;

		private Brush _restartLaterButtonBackground;

		private Brush _restartLaterButtonForeground;

		private Brush _restartLaterButtonMouseOverBackground;

		private Brush _restartLaterButtonDisabledBackground;

		public string ReadyLangTipContent
		{
			get
			{
				return _readyLangTipContent;
			}
			set
			{
				_readyLangTipContent = value;
				OnPropertyChanged("ReadyLangTipContent");
			}
		}

		public double ReadyLangTipContentFontSize
		{
			get
			{
				return _readyLangTipContentFontSize;
			}
			set
			{
				_readyLangTipContentFontSize = value;
				OnPropertyChanged("ReadyLangTipContentFontSize");
			}
		}

		public Brush ReadyLangTipContentForeground
		{
			get
			{
				return _readyLangTipContentForeground;
			}
			set
			{
				_readyLangTipContentForeground = value;
				OnPropertyChanged("ReadyLangTipContentForeground");
			}
		}

		public bool Language1Checked
		{
			get
			{
				return _language1Checked;
			}
			set
			{
				_language1Checked = value;
				if (_language1Checked)
				{
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language1Checked");
			}
		}

		public bool Language2Checked
		{
			get
			{
				return _language2Checked;
			}
			set
			{
				_language2Checked = value;
				if (_language2Checked)
				{
					Language1Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language2Checked");
			}
		}

		public bool Language3Checked
		{
			get
			{
				return _language3Checked;
			}
			set
			{
				_language3Checked = value;
				if (_language3Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language3Checked");
			}
		}

		public bool Language4Checked
		{
			get
			{
				return _language4Checked;
			}
			set
			{
				_language4Checked = value;
				if (_language4Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language4Checked");
			}
		}

		public bool Language5Checked
		{
			get
			{
				return _language5Checked;
			}
			set
			{
				_language5Checked = value;
				if (_language5Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language5Checked");
			}
		}

		public bool Language6Checked
		{
			get
			{
				return _language6Checked;
			}
			set
			{
				_language6Checked = value;
				if (_language6Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language6Checked");
			}
		}

		public bool Language7Checked
		{
			get
			{
				return _language7Checked;
			}
			set
			{
				_language7Checked = value;
				if (_language7Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language7Checked");
			}
		}

		public bool Language8Checked
		{
			get
			{
				return _language8Checked;
			}
			set
			{
				_language8Checked = value;
				if (_language8Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language8Checked");
			}
		}

		public bool Language9Checked
		{
			get
			{
				return _language9Checked;
			}
			set
			{
				_language9Checked = value;
				if (_language9Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language9Checked");
			}
		}

		public bool Language10Checked
		{
			get
			{
				return _language10Checked;
			}
			set
			{
				_language10Checked = value;
				if (_language10Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language10Checked");
			}
		}

		public bool Language11Checked
		{
			get
			{
				return _language11Checked;
			}
			set
			{
				_language11Checked = value;
				if (_language11Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language11Checked");
			}
		}

		public bool Language12Checked
		{
			get
			{
				return _language12Checked;
			}
			set
			{
				_language12Checked = value;
				if (_language12Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language13Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language12Checked");
			}
		}

		public bool Language13Checked
		{
			get
			{
				return _language13Checked;
			}
			set
			{
				_language13Checked = value;
				if (_language13Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language14Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language13Checked");
			}
		}

		public bool Language14Checked
		{
			get
			{
				return _language14Checked;
			}
			set
			{
				_language14Checked = value;
				if (_language14Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language15Checked = false;
				}
				OnPropertyChanged("Language14Checked");
			}
		}

		public bool Language15Checked
		{
			get
			{
				return _language15Checked;
			}
			set
			{
				_language15Checked = value;
				if (_language15Checked)
				{
					Language1Checked = false;
					Language2Checked = false;
					Language3Checked = false;
					Language4Checked = false;
					Language5Checked = false;
					Language6Checked = false;
					Language7Checked = false;
					Language8Checked = false;
					Language9Checked = false;
					Language10Checked = false;
					Language11Checked = false;
					Language12Checked = false;
					Language13Checked = false;
					Language14Checked = false;
				}
				OnPropertyChanged("Language15Checked");
			}
		}

		public string LanguageSelected
		{
			get
			{
				return _languageSelected;
			}
			set
			{
				_languageSelected = value;
				OnPropertyChanged("LanguageSelected");
			}
		}

		public CommandResult ButtonCommandResult { get; set; }

		public ReplayCommand SelectLanguageClickCommand { get; set; }

		public string RestartNowButtonText
		{
			get
			{
				return _restartNowButtonText;
			}
			set
			{
				_restartNowButtonText = value;
				OnPropertyChanged("RestartNowButtonText");
			}
		}

		public double RestartNowButtonTextFontSize
		{
			get
			{
				return _restartNowButtonTextFontSize;
			}
			set
			{
				_restartNowButtonTextFontSize = value;
				OnPropertyChanged("RestartNowButtonTextFontSize");
			}
		}

		public Brush RestartNowButtonBackground
		{
			get
			{
				return _restartNowButtonBackground;
			}
			set
			{
				_restartNowButtonBackground = value;
				OnPropertyChanged("RestartNowButtonBackground");
			}
		}

		public Brush RestartNowButtonForeground
		{
			get
			{
				return _restartNowButtonForeground;
			}
			set
			{
				_restartNowButtonForeground = value;
				OnPropertyChanged("RestartNowButtonForeground");
			}
		}

		public Brush RestartNowButtonMouseOverBackground
		{
			get
			{
				return _restartNowButtonMouseOverBackground;
			}
			set
			{
				if (_restartNowButtonMouseOverBackground != value)
				{
					_restartNowButtonMouseOverBackground = value;
					OnPropertyChanged("RestartNowButtonMouseOverBackground");
				}
			}
		}

		public Brush RestartNowButtonDisabledBackground
		{
			get
			{
				return _restartNowButtonDisabledBackground;
			}
			set
			{
				if (_restartNowButtonDisabledBackground != value)
				{
					_restartNowButtonDisabledBackground = value;
					OnPropertyChanged("RestartNowButtonDisabledBackground");
				}
			}
		}

		public ReplayCommand RestartNowButtonClickCommand { get; set; }

		public string RestartLaterButtonText
		{
			get
			{
				return _restartLaterButtonText;
			}
			set
			{
				_restartLaterButtonText = value;
				OnPropertyChanged("RestartLaterButtonText");
			}
		}

		public double RestartLaterButtonTextFontSize
		{
			get
			{
				return _restartLaterButtonTextFontSize;
			}
			set
			{
				_restartLaterButtonTextFontSize = value;
				OnPropertyChanged("RestartLaterButtonTextFontSize");
			}
		}

		public Brush RestartLaterButtonBackground
		{
			get
			{
				return _restartLaterButtonBackground;
			}
			set
			{
				_restartLaterButtonBackground = value;
				OnPropertyChanged("RestartLaterButtonBackground");
			}
		}

		public Brush RestartLaterButtonForeground
		{
			get
			{
				return _restartLaterButtonForeground;
			}
			set
			{
				_restartLaterButtonForeground = value;
				OnPropertyChanged("RestartLaterButtonForeground");
			}
		}

		public Brush RestartLaterButtonMouseOverBackground
		{
			get
			{
				return _restartLaterButtonMouseOverBackground;
			}
			set
			{
				if (_restartLaterButtonMouseOverBackground != value)
				{
					_restartLaterButtonMouseOverBackground = value;
					OnPropertyChanged("RestartLaterButtonMouseOverBackground");
				}
			}
		}

		public Brush RestartLaterButtonDisabledBackground
		{
			get
			{
				return _restartLaterButtonDisabledBackground;
			}
			set
			{
				if (_restartLaterButtonDisabledBackground != value)
				{
					_restartLaterButtonDisabledBackground = value;
					OnPropertyChanged("RestartLaterButtonDisabledBackground");
				}
			}
		}

		public ReplayCommand RestartLaterButtonClickCommand { get; set; }

		public LanguageSelectViewModel()
		{
			SelectLanguageClickCommand = new ReplayCommand(SelectLanguageClickCommandHandler);
			RestartNowButtonClickCommand = new ReplayCommand(RestartNowClickCommandHandler);
			RestartLaterButtonClickCommand = new ReplayCommand(RestartLaterClickCommandHandler);
		}

		protected virtual void SelectLanguageClickCommandHandler(object parameter)
		{
			LanguageSelected = parameter as string;
		}

		private void RestartNowClickCommandHandler(object parameter)
		{
			Window val = (Window)((parameter is Window) ? parameter : null);
			if (val != null)
			{
				val.Close();
			}
			ButtonCommandResult = CommandResult.RestartNow;
		}

		private void RestartLaterClickCommandHandler(object parameter)
		{
			Window val = (Window)((parameter is Window) ? parameter : null);
			if (val != null)
			{
				val.Close();
			}
			ButtonCommandResult = CommandResult.RestartLater;
		}

		public new static LanguageSelectViewModel DefaultValues()
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			//IL_0052: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Expected O, but got Unknown
			//IL_0080: Unknown result type (might be due to invalid IL or missing references)
			//IL_0085: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Expected O, but got Unknown
			//IL_00a8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b7: Expected O, but got Unknown
			//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d7: Expected O, but got Unknown
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f7: Expected O, but got Unknown
			//IL_011a: Unknown result type (might be due to invalid IL or missing references)
			//IL_011f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0129: Expected O, but got Unknown
			//IL_013a: Unknown result type (might be due to invalid IL or missing references)
			//IL_013f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0149: Expected O, but got Unknown
			//IL_016c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0171: Unknown result type (might be due to invalid IL or missing references)
			//IL_017b: Expected O, but got Unknown
			//IL_018c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0191: Unknown result type (might be due to invalid IL or missing references)
			//IL_019b: Expected O, but got Unknown
			//IL_01be: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c3: Unknown result type (might be due to invalid IL or missing references)
			//IL_01cd: Expected O, but got Unknown
			//IL_01de: Unknown result type (might be due to invalid IL or missing references)
			//IL_01e3: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ed: Expected O, but got Unknown
			FontSizeConverter val = new FontSizeConverter();
			LanguageSelectViewModel languageSelectViewModel = new LanguageSelectViewModel();
			object resource = ComponentResources.SingleInstance.GetResource("drawingImage_warning");
			languageSelectViewModel.TitleIconImageSource = (ImageSource)((resource is ImageSource) ? resource : null);
			languageSelectViewModel.LanguageSelected = LMSAContext.CurrentLanguage;
			languageSelectViewModel.TitleFontSize = Convert.ToDouble(((TypeConverter)(object)val).ConvertFromString("12pt"));
			languageSelectViewModel.TitleForeground = (Brush)new SolidColorBrush(Color.FromRgb((byte)119, (byte)119, (byte)118));
			languageSelectViewModel.ContentFontSize = Convert.ToDouble(((TypeConverter)(object)val).ConvertFromString("9pt"));
			languageSelectViewModel.ContentForeground = (Brush)new SolidColorBrush(Color.FromRgb((byte)119, (byte)119, (byte)118));
			languageSelectViewModel.ReadyLangTipContentFontSize = Convert.ToDouble(((TypeConverter)(object)val).ConvertFromString("9pt"));
			languageSelectViewModel.ReadyLangTipContentForeground = (Brush)new SolidColorBrush(Colors.Red);
			languageSelectViewModel.CancelButtonBackground = (Brush)new SolidColorBrush(Color.FromRgb((byte)229, (byte)229, (byte)229));
			languageSelectViewModel.CancelButtonForeground = (Brush)new SolidColorBrush(Color.FromRgb((byte)143, (byte)143, (byte)143));
			languageSelectViewModel.CancelButtonTextFontSize = Convert.ToDouble(((TypeConverter)(object)val).ConvertFromString("10pt"));
			languageSelectViewModel.RestartLaterButtonBackground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2"));
			languageSelectViewModel.RestartLaterButtonForeground = (Brush)new SolidColorBrush(Color.FromRgb(byte.MaxValue, byte.MaxValue, byte.MaxValue));
			languageSelectViewModel.RestartLaterButtonTextFontSize = Convert.ToDouble(((TypeConverter)(object)val).ConvertFromString("10pt"));
			languageSelectViewModel.RestartNowButtonBackground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2"));
			languageSelectViewModel.RestartNowButtonForeground = (Brush)new SolidColorBrush(Color.FromRgb(byte.MaxValue, byte.MaxValue, byte.MaxValue));
			languageSelectViewModel.RestartNowButtonTextFontSize = Convert.ToDouble(((TypeConverter)(object)val).ConvertFromString("10pt"));
			languageSelectViewModel.OKButtonBackground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2"));
			languageSelectViewModel.OKButtonForeground = (Brush)new SolidColorBrush(Color.FromRgb(byte.MaxValue, byte.MaxValue, byte.MaxValue));
			languageSelectViewModel.OKButtonTextFontSize = Convert.ToDouble(((TypeConverter)(object)val).ConvertFromString("10pt"));
			return languageSelectViewModel;
		}
	}
	public class ViewModelBase
	{
		public event PropertyChangedEventHandler PropertyChanged;

		protected void OnPropertyChanged(string propertyName)
		{
			if (this.PropertyChanged != null)
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.ViewModels.SystemOperation
{
	public class AboutOperationItemViewModel : MouseOverMenuItemViewModel
	{
		private Dictionary<string, string> LanguageURLMap = new Dictionary<string, string>
		{
			{ "en-US", "r-en" },
			{ "es-ES", "es" },
			{ "ja-JP", "ja" },
			{ "pl-PL", "pl" },
			{ "pt-BR", "pt-br" },
			{ "ru-RU", "ru" },
			{ "it-IT", "it" },
			{ "zh-CN", "zh-cn" },
			{ "de-DE", "de" },
			{ "sk-SK", "sk" },
			{ "sr-RS", "sr" },
			{ "ro-RO", "ro" },
			{ "bg-BG", "bg" },
			{ "cs-CZ", "cz" },
			{ "fr-FR", "fr" },
			{ "hi-IN", "r-en" },
			{ "id-ID", "r-en" }
		};

		public AboutOperationItemViewModel()
		{
			object obj = Application.Current.FindResource((object)"aboutDrawingImage");
			base.Icon = ((obj is ImageSource) ? obj : null);
			object obj2 = Application.Current.FindResource((object)"about_clickDrawingImage");
			base.MouseOverIcon = ((obj2 is ImageSource) ? obj2 : null);
			base.Header = "K0283";
		}

		public override void ClickCommandHandler(object args)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuAboutButtonClick", "menu-about button click", 0L).Build());
			string format = "https://download.lenovo.com/lenovo/lla/l505-0009-06-{0}.pdf";
			string currentLanguage = HostProxy.LanguageService.GetCurrentLanguage();
			GlobalFun.OpenUrlByBrowser(string.Format(format, LanguageURLMap[currentLanguage]));
		}
	}
	public class BootPageOperationItemViewModel : MouseOverMenuItemViewModel
	{
		protected long locker = 0L;

		public BootPageOperationItemViewModel()
		{
			base.Header = "K2063";
		}

		public override void ClickCommandHandler(object e)
		{
			if (Interlocked.Read(in locker) != 0)
			{
				return;
			}
			Interlocked.Exchange(ref locker, 1L);
			if (HostProxy.deviceManager.ConntectedDevices.Count > 0 || MainWindowViewModel.SingleInstance.PluginArr.Count((PluginModel n) => n.Plugin != null && !n.Plugin.IsNonBusinessPage()) > 0)
			{
				MessageWindowHelper.Instance.ShowTip("K2106").ContinueWith((Task ar) => Interlocked.Exchange(ref locker, 0L));
				return;
			}
			string currentPluginID = HostProxy.HostNavigation.CurrentPluginID;
			object currentPage = HostProxy.HostNavigation.CurrentPage;
			MainWindowViewModel.SingleInstance.StopDeviceListener();
			global::Smart.DeviceManagerEx.Stop();
			MessageWindowHelper.Instance.Show(new BootPageWindow(), true).ContinueWith(delegate
			{
				MainWindowViewModel.SingleInstance.StartDeviceListener();
				global::Smart.HostNavigation.SwitchTo("8ab04aa975e34f1ca4f9dc3a81374e2c", "RESCUE_HOME");
				Interlocked.Exchange(ref locker, 0L);
			});
		}
	}
	public class FaqOperationItemViewModel : MouseOverMenuItemViewModel
	{
		private readonly List<string> Las_Countrys = new List<string>
		{
			"AR", "BO", "CL", "CO", "CR", "DO", "EC", "SV", "GT", "HN",
			"MX", "NI", "PA", "PY", "PE", "BZ", "UY", "VE"
		};

		private readonly Dictionary<string, string> UrlMap = new Dictionary<string, string>
		{
			{ "US", "https://en-us.support.motorola.com/app/product_page/faqs/p/11395" },
			{ "GB", "https://en-gb.support.motorola.com/app/product_page/faqs/p/1449" },
			{ "BR", "https://pt-br.support.motorola.com/app/product_page/faqs/p/11395" },
			{ "IN", "https://en-in.support.motorola.com/app/product_page/faqs/p/11395" },
			{ "AU", "https://en-au.support.motorola.com/app/product_page/faqs/p/11395" },
			{ "NZ", "https://en-au.support.motorola.com/app/product_page/faqs/p/11395" },
			{ "LAS", "https://es-latam.support.motorola.com/app/product_page/faqs/p/11395" }
		};

		public FaqOperationItemViewModel()
		{
			base.Header = "K1599";
		}

		public override void ClickCommandHandler(object e)
		{
			string twoLetterISORegionName = GlobalFun.GetRegionInfo().TwoLetterISORegionName;
			if (UrlMap.ContainsKey(twoLetterISORegionName))
			{
				GlobalFun.OpenUrlByBrowser(UrlMap[twoLetterISORegionName]);
			}
			else if (Las_Countrys.Contains(twoLetterISORegionName))
			{
				GlobalFun.OpenUrlByBrowser(UrlMap["LAS"]);
			}
		}
	}
	public class HelpOperationViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private ObservableCollection<MouseOverMenuItemViewModel> menuItems;

		public ObservableCollection<MouseOverMenuItemViewModel> MenuItems
		{
			get
			{
				return menuItems;
			}
			set
			{
				if (menuItems != value)
				{
					menuItems = value;
					OnPropertyChanged("MenuItems");
				}
			}
		}

		public HelpOperationViewModel()
		{
			MenuItems = new ObservableCollection<MouseOverMenuItemViewModel>
			{
				new FaqOperationItemViewModel
				{
					ItemVisibility = (Visibility)0
				},
				new UserGuidOperationItemViewModel
				{
					ItemVisibility = (Visibility)0
				},
				new BootPageOperationItemViewModel
				{
					ItemVisibility = (Visibility)0
				}
			};
		}
	}
	public class LanguageOperationItemViewModelV6 : MouseOverMenuItemViewModel
	{
		public LanguageOperationItemViewModelV6()
		{
			object obj = Application.Current.FindResource((object)"option_defaultDrawingImage");
			base.Icon = ((obj is ImageSource) ? obj : null);
			object obj2 = Application.Current.FindResource((object)"option_clickDrawingImage");
			base.MouseOverIcon = ((obj2 is ImageSource) ? obj2 : null);
			base.Header = "K0281";
		}

		public override void ClickCommandHandler(object e)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuOptionButtonClick", "menu-option button click", 0L).Build());
			MessageWindowHelper.Instance.Show(new LanguageSelectViewV6(), true);
		}
	}
	public class PrivacyPolicyOperationItemViewModel : MouseOverMenuItemViewModel
	{
		public PrivacyPolicyOperationItemViewModel()
		{
			base.Header = "K0836";
		}

		public override void ClickCommandHandler(object e)
		{
			GlobalFun.OpenUrlByBrowser("www.lenovo.com/privacy/");
		}
	}
	public class UpdateOperationItemViewModel : MouseOverMenuItemViewModel
	{
		public UpdateOperationItemViewModel()
		{
			object obj = Application.Current.FindResource((object)"updateDrawingImage");
			base.Icon = ((obj is ImageSource) ? obj : null);
			object obj2 = Application.Current.FindResource((object)"update_clickDrawingImage");
			base.MouseOverIcon = ((obj2 is ImageSource) ? obj2 : null);
			base.Header = "K0280";
		}

		public override void ClickCommandHandler(object e)
		{
			ApplcationClass.manualTrigger = true;
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuCheckUpdateButtonClick", "menu-check update button click", 0L).Build());
			Task.Factory.StartNew(delegate
			{
				UpdateManager.Instance.ToolUpdateWorker.CheckVersion(isAutoMode: false);
			});
		}
	}
	public class FeedbackOperationItemViewModel : MouseOverMenuItemViewModel
	{
		public override void ClickCommandHandler(object e)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuFeedbackButtonClick", "menu-feedback button click", 0L).Build());
			HostProxy.HostOperationService.ShowFeedBack();
		}
	}
	public class UserGuidOperationItemViewModel : MouseOverMenuItemViewModel
	{
		public UserGuidOperationItemViewModel()
		{
			object obj = Application.Current.FindResource((object)"guidanceDrawingImage");
			base.Icon = ((obj is ImageSource) ? obj : null);
			object obj2 = Application.Current.FindResource((object)"guidance_clickDrawingImage");
			base.MouseOverIcon = ((obj2 is ImageSource) ? obj2 : null);
			base.Header = "K0279";
		}

		public override void ClickCommandHandler(object e)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuUserGuideButtonClick", "menu-user guide button click", 0L).Build());
			GlobalFun.OpenUrlByBrowser(new MenuPopupWindowBusiness().GetUserGuideUrl());
		}
	}
}
namespace lenovo.mbg.service.lmsa.UserControls
{
	public class StartPage : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public StartPage()
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
				Uri uri = new Uri("/Software Fix;component/usercontrols/startpage.xaml", UriKind.Relative);
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
	public class SurveyWindowV6 : Window, IMessageWindowV6, IComponentConnector
	{
		internal SurveyWindowV6 frmWorkstation;

		internal TextBlock txtSelectedScore;

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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public SurveyWindowV6()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void Border_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Invalid comparison between Unknown and I4
			if ((int)((MouseEventArgs)e).LeftButton == 1)
			{
				((Window)this).DragMove();
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/surveywindowv6.xaml", UriKind.Relative);
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
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Expected O, but got Unknown
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				frmWorkstation = (SurveyWindowV6)target;
				break;
			case 2:
				((UIElement)(Grid)target).MouseLeftButtonDown += new MouseButtonEventHandler(Border_MouseLeftButtonDown);
				break;
			case 3:
				txtSelectedScore = (TextBlock)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class SurveyWindowV2 : Window, IComponentConnector
	{
		internal SurveyWindowV2 frmWorkstation;

		internal TextBlock txtSelectedScore;

		private bool _contentLoaded;

		public SurveyWindowV2()
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
				Uri uri = new Uri("/Software Fix;component/usercontrols/surveywindowv2.xaml", UriKind.Relative);
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
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				frmWorkstation = (SurveyWindowV2)target;
				break;
			case 2:
				txtSelectedScore = (TextBlock)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class PluginWelcomeView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public PluginWelcomeView()
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
				Uri uri = new Uri("/Software Fix;component/usercontrols/pluginwelcomeview.xaml", UriKind.Relative);
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
namespace lenovo.mbg.service.lmsa.UserControls.VersionUpdateControls.PlugInsUpdate
{
	public class PluginAddFailed : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty strErrorTipProperty = DependencyProperty.Register("strErrorTip", typeof(string), typeof(PluginAddFailed), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty StrErrorTipConentProperty = DependencyProperty.Register("StrErrorTipConent", typeof(string), typeof(PluginAddFailed), new PropertyMetadata((object)string.Empty));

		internal PluginAddFailed pluginAddFailed;

		private bool _contentLoaded;

		public string strErrorTip
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(strErrorTipProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(strErrorTipProperty, (object)value);
			}
		}

		public string StrErrorTipConent
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrErrorTipConentProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrErrorTipConentProperty, (object)value);
			}
		}

		public PluginAddFailed()
		{
			InitializeComponent();
			strErrorTip = "K0363";
			StrErrorTipConent = "K0364";
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/versionupdatecontrols/pluginsupdate/pluginaddfailed.xaml", UriKind.Relative);
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
				pluginAddFailed = (PluginAddFailed)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.UserControls.MessageBoxWindow
{
	public class CommonWindowModel : OkCancelWindowModel
	{
		public CommonWindowModel(int type)
		{
			if (type == 2)
			{
				object resource = ComponentResources.SingleInstance.GetResource("defaultOKCancelWindowTemplate");
				base.ContentControlTemplate = (ControlTemplate)((resource is ControlTemplate) ? resource : null);
			}
			else
			{
				object resource2 = ComponentResources.SingleInstance.GetResource("defaultOKWindowTemplate");
				base.ContentControlTemplate = (ControlTemplate)((resource2 is ControlTemplate) ? resource2 : null);
			}
		}

		protected override lenovo.themes.generic.ViewModelV6.ViewModelBase GetDefaultViewModel()
		{
			return OKCancelViewModel.DefaultValues();
		}
	}
	public class LanguageSelectWindowModel : OkCancelWindowModel
	{
		public LanguageSelectWindowModel(int button)
		{
			base.ViewModel = LanguageSelectViewModel.DefaultValues();
			ControlTemplate contentControlTemplate;
			switch (button)
			{
			case 1:
			{
				object resource3 = ComponentResources.SingleInstance.GetResource("restartNowOrLaterWindowTemplate");
				contentControlTemplate = (ControlTemplate)((resource3 is ControlTemplate) ? resource3 : null);
				break;
			}
			case 2:
			{
				object resource2 = ComponentResources.SingleInstance.GetResource("defaultOKCancelWindowTemplate");
				contentControlTemplate = (ControlTemplate)((resource2 is ControlTemplate) ? resource2 : null);
				break;
			}
			default:
			{
				object resource = ComponentResources.SingleInstance.GetResource("languageSelectWindowTemplate");
				contentControlTemplate = (ControlTemplate)((resource is ControlTemplate) ? resource : null);
				break;
			}
			}
			base.ContentControlTemplate = contentControlTemplate;
		}

		public LenovoPopupWindow CreateWindow(string title, string content, ImageSource image)
		{
			LanguageSelectViewModel languageSelectViewModel = base.ViewModel as LanguageSelectViewModel;
			languageSelectViewModel.Title = LangTranslation.Translate(title);
			languageSelectViewModel.Content = LangTranslation.Translate(content);
			languageSelectViewModel.CancelButtonText = "K0208";
			languageSelectViewModel.OKButtonText = "K0327";
			languageSelectViewModel.RestartNowButtonText = "K0301";
			languageSelectViewModel.RestartLaterButtonText = "K0300";
			languageSelectViewModel.Language1Checked = languageSelectViewModel.LanguageSelected == "en-US";
			languageSelectViewModel.Language8Checked = languageSelectViewModel.LanguageSelected == "zh-CN";
			languageSelectViewModel.Language2Checked = languageSelectViewModel.LanguageSelected == "pt-BR";
			languageSelectViewModel.Language3Checked = languageSelectViewModel.LanguageSelected == "es-ES";
			languageSelectViewModel.Language4Checked = languageSelectViewModel.LanguageSelected == "pl-PL";
			languageSelectViewModel.Language5Checked = languageSelectViewModel.LanguageSelected == "ru-RU";
			languageSelectViewModel.Language6Checked = languageSelectViewModel.LanguageSelected == "ja-JP";
			languageSelectViewModel.Language7Checked = languageSelectViewModel.LanguageSelected == "it-IT";
			languageSelectViewModel.Language9Checked = languageSelectViewModel.LanguageSelected == "de-DE";
			languageSelectViewModel.Language10Checked = languageSelectViewModel.LanguageSelected == "sk-SK";
			languageSelectViewModel.Language11Checked = languageSelectViewModel.LanguageSelected == "sr-RS";
			languageSelectViewModel.Language12Checked = languageSelectViewModel.LanguageSelected == "ro-RO";
			languageSelectViewModel.Language13Checked = languageSelectViewModel.LanguageSelected == "bg-BG";
			languageSelectViewModel.Language14Checked = languageSelectViewModel.LanguageSelected == "cs-CZ";
			languageSelectViewModel.Language15Checked = languageSelectViewModel.LanguageSelected == "fr-FR";
			languageSelectViewModel.ContentIconImageSource = image;
			return CreateWindow();
		}
	}
}
namespace lenovo.mbg.service.lmsa.UserControls.CustomControls
{
	public class Loading : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public Loading()
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
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/loading.xaml", UriKind.Relative);
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
	public class NoNetwork : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty StrTitleTipProperty = DependencyProperty.Register("StrTitleTip", typeof(string), typeof(NoNetwork), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty StrTipsProperty = DependencyProperty.Register("StrTips", typeof(string), typeof(NoNetwork), new PropertyMetadata((object)string.Empty));

		internal NoNetwork noNetwork;

		private bool _contentLoaded;

		public string StrTitleTip
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrTitleTipProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrTitleTipProperty, (object)value);
			}
		}

		public string StrTips
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrTipsProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrTipsProperty, (object)value);
			}
		}

		public NoNetwork()
		{
			InitializeComponent();
			StrTitleTip = "K0359";
			StrTips = "K0358";
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/nonetwork.xaml", UriKind.Relative);
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
				noNetwork = (NoNetwork)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class ServerNorespond : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty StrTitleTipProperty = DependencyProperty.Register("StrTitleTip", typeof(string), typeof(ServerNorespond), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty StrTipsProperty = DependencyProperty.Register("StrTips", typeof(string), typeof(ServerNorespond), new PropertyMetadata((object)string.Empty));

		internal ServerNorespond serverNorespond;

		private bool _contentLoaded;

		public string StrTitleTip
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrTitleTipProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrTitleTipProperty, (object)value);
			}
		}

		public string StrTips
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(StrTipsProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(StrTipsProperty, (object)value);
			}
		}

		public ServerNorespond()
		{
			InitializeComponent();
			StrTitleTip = "K0375";
			StrTips = "K0376";
		}

		private void ReConnectServer(object sender, EventArgs e)
		{
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/servernorespond.xaml", UriKind.Relative);
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
			if (connectionId == 1)
			{
				serverNorespond = (ServerNorespond)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class UCDeviceConnectionControlPanel : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty ButtonTextProperty = DependencyProperty.Register("ButtonText", typeof(string), typeof(UCDeviceConnectionControlPanel), new PropertyMetadata((object)string.Empty));

		public static readonly DependencyProperty DeviceConnectingWayProperty = DependencyProperty.Register("DeviceConnectingWay", typeof(ConnectingWays), typeof(UCDeviceConnectionControlPanel), new PropertyMetadata((object)ConnectingWays.USB));

		public static readonly DependencyProperty IsConnectedProperty = DependencyProperty.Register("IsConnected", typeof(bool), typeof(UCDeviceConnectionControlPanel), new PropertyMetadata((object)false));

		internal UCDeviceConnectionControlPanel rootView;

		private bool _contentLoaded;

		public string ButtonText
		{
			get
			{
				return (string)((DependencyObject)this).GetValue(ButtonTextProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(ButtonTextProperty, (object)value);
			}
		}

		public ConnectingWays DeviceConnectingWay
		{
			get
			{
				return (ConnectingWays)((DependencyObject)this).GetValue(DeviceConnectingWayProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(DeviceConnectingWayProperty, (object)value);
			}
		}

		public bool IsConnected
		{
			get
			{
				return (bool)((DependencyObject)this).GetValue(IsConnectedProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(IsConnectedProperty, (object)value);
			}
		}

		public UCDeviceConnectionControlPanel()
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
				Uri uri = new Uri("/Software Fix;component/usercontrols/customcontrols/ucdeviceconnectioncontrolpanel.xaml", UriKind.Relative);
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
				rootView = (UCDeviceConnectionControlPanel)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.UserControls.Tips
{
	public class DonotEnableDebugWindow : Window, IComponentConnector
	{
		private bool _contentLoaded;

		public bool CanClose { get; set; }

		public DonotEnableDebugWindow()
		{
			CanClose = false;
			InitializeComponent();
		}

		private void CloseClick(object sender, RoutedEventArgs e)
		{
			CanClose = true;
			((Window)this).Close();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/tips/donotenabledebugwindow.xaml", UriKind.Relative);
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
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			if (connectionId == 1)
			{
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(CloseClick);
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class USBHelperListBoxItemContent
	{
		public Visibility CircleVisibility { get; set; }

		public Visibility LeftLineVisibility { get; set; }

		public Visibility RightLineVisibility { get; set; }

		public int Sequence { get; set; }

		public object MaskLayer { get; set; }

		public ImageSource ImgSource { get; set; }
	}
	public class DoNotEnableDebugTips : UserControl, IComponentConnector
	{
		private ReplayCommand closeCommand;

		private bool canClose = false;

		internal Button btnClose;

		private bool _contentLoaded;

		public ReplayCommand CloseCommand
		{
			get
			{
				return closeCommand;
			}
			set
			{
				if (closeCommand != value)
				{
					closeCommand = value;
				}
			}
		}

		public bool CanClose
		{
			get
			{
				return canClose;
			}
			set
			{
				canClose = value;
			}
		}

		public DoNotEnableDebugTips()
		{
			InitializeComponent();
			CloseCommand = new ReplayCommand(CloseCommandHandler);
			((FrameworkElement)this).DataContext = this;
		}

		private void btnClose_Click(object sender, RoutedEventArgs e)
		{
			CanClose = true;
			Window window = Window.GetWindow((DependencyObject)((sender is Button) ? sender : null));
			if (window != null)
			{
				window.Close();
			}
		}

		private void CloseCommandHandler(object args)
		{
			CanClose = true;
			Window val = (Window)((args is Window) ? args : null);
			if (val != null)
			{
				val.Close();
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/tips/donotenabledebugtips.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(btnClose_Click);
				break;
			case 2:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(btnClose_Click);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class ReconnectTips : UserControl, IComponentConnector
	{
		internal Button btnClose;

		internal Button btnOk;

		private bool _contentLoaded;

		public ReconnectTips()
		{
			InitializeComponent();
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			CloseWindow((DependencyObject)((sender is Button) ? sender : null));
		}

		private void btnClose_Click(object sender, RoutedEventArgs e)
		{
			CloseWindow((DependencyObject)((sender is Button) ? sender : null));
		}

		private void CloseWindow(DependencyObject obj)
		{
			Window window = Window.GetWindow(obj);
			if (window != null)
			{
				window.Close();
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/usercontrols/tips/reconnecttips.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected O, but got Unknown
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(btnClose_Click);
				break;
			case 2:
				btnOk = (Button)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(btnOk_Click);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.Services
{
	public class PermissionService : lenovo.mbg.service.framework.services.IPermission
	{
		private Permission permission = new Permission();

		public bool? AppModuleIsReady(DeviceEx device, List<string> permissionModuleNames)
		{
			return permission.AppModuleIsReady(device, permissionModuleNames);
		}

		public Task BeginCheckAppIsReady(DeviceEx device, List<string> permissionModuleNames, Action<bool?> finalResultRepoter)
		{
			return permission.BeginCheckAppIsReady(device, permissionModuleNames, finalResultRepoter);
		}

		public Task BeginConfirmAppIsReady(DeviceEx device, string permissionModule, CancellationTokenSource cancelToken, Action<bool?> finalResultRepoter)
		{
			return permission.BeginConfirmAppIsReady(device, permissionModule, cancelToken, finalResultRepoter);
		}

		public void BeginRollPollingAppModuleIsReady(DeviceEx device, List<string> permissionModuleNames, CancellationTokenSource cancelToken, Action<bool?> finalResultRepoter, int periodTime = 1000)
		{
			permission.BeginRollPollingAppModuleIsReady(device, permissionModuleNames, cancelToken, finalResultRepoter, periodTime);
		}
	}
	public class UserBehaviorService : IUserBehaviorService
	{
		private object lockobj = new object();

		protected string user;

		private Dictionary<BusinessType, BehaviorModel> Cache { get; set; }

		protected DeviceEx Device
		{
			get
			{
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				if (masterDevice == null)
				{
					IList<DeviceEx> conntectedDevices = HostProxy.deviceManager.ConntectedDevices;
					if (conntectedDevices != null && conntectedDevices.Count > 0)
					{
						return conntectedDevices.FirstOrDefault((DeviceEx n) => n.SoftStatus == DeviceSoftStateEx.Online);
					}
				}
				return masterDevice;
			}
		}

		public void Collect(BusinessType business, BusinessData data)
		{
			lock (lockobj)
			{
				if (data == null)
				{
					data = new BusinessData(business, Device);
				}
				if (Cache == null)
				{
					Cache = new Dictionary<BusinessType, BehaviorModel>();
				}
				if (Cache.ContainsKey(business))
				{
					Cache[business].count++;
					if (data != null)
					{
						Cache[business].data.Add(data);
					}
					return;
				}
				Cache.Add(business, new BehaviorModel
				{
					user = user,
					business = business,
					businessName = business.ToString(),
					count = 1,
					dateTime = DateTime.Now.ToString("yyyyMMdd"),
					data = new List<BusinessData> { data }
				});
			}
		}

		public List<BehaviorModel> GetAll()
		{
			lock (lockobj)
			{
				if (Cache == null || Cache.Count == 0)
				{
					return null;
				}
				List<BehaviorModel> list = new List<BehaviorModel>();
				foreach (BehaviorModel value in Cache.Values)
				{
					list.Add(value);
				}
				return list;
			}
		}

		public void InitUser(string user)
		{
			this.user = user;
		}
	}
	public class User : IUser
	{
		public UserInfo user { get; private set; }

		public bool onLine { get; private set; }

		public event EventHandler<UserInfoArgs> OnUserChanged;

		public void FireUserChanged(UserInfoArgs user)
		{
			this.user = user.User;
			onLine = user.online;
			EventHandler<UserInfoArgs> eventHandler = this.OnUserChanged;
			if (eventHandler != null)
			{
				Delegate[] invocationList = eventHandler.GetInvocationList();
				for (int i = 0; i < invocationList.Length; i++)
				{
					EventHandler<UserInfoArgs> eventHandler2 = (EventHandler<UserInfoArgs>)invocationList[i];
					eventHandler2(this, user);
				}
			}
		}
	}
	public class GoogleAnalyticsTracker : IGoogleAnalyticsTracker
	{
		protected static readonly string GAPropertyId = "UA-100938782-1";

		public Tracker Tracker { get; }

		public GoogleAnalyticsTracker()
		{
			Tracker = AnalyticsManager.Current.CreateTracker(GAPropertyId);
		}

		public void Send(IDictionary<string, string> data)
		{
			try
			{
				Tracker.Send(data);
			}
			catch
			{
			}
		}
	}
	public class ConfigService : IConfigService
	{
		public string getConfig(string type, string key)
		{
			if (type == "AppConfig")
			{
				return ConfigurationManager.AppSettings[key];
			}
			return string.Empty;
		}

		public Dictionary<string, string> getConfigs(string type, List<string> keys)
		{
			if (type == "AppConfig")
			{
				Dictionary<string, string> dictionary = new Dictionary<string, string>();
				NameValueCollection appSettings = ConfigurationManager.AppSettings;
				foreach (string key in keys)
				{
					dictionary.Add(key, appSettings[key]);
				}
				return dictionary;
			}
			return null;
		}
	}
	public delegate void PipeDataRecived(PipeMessage message, object data);
	public class PipeClientService : IDisposable
	{
		protected ClientPipe _clientPipe;

		public event PipeDataRecived OnPipeDataRecived;

		public void Create(int timeout)
		{
			if (_clientPipe == null)
			{
				_clientPipe = new ClientPipe(".", delegate(BasicPipe bp)
				{
					bp.StartStringReaderAsync();
				});
				_clientPipe.DataReceived += ClientPipeDataReceviedHandler;
			}
			try
			{
				_clientPipe.Connect(timeout);
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}
		}

		public void Send(PipeMessage message, object data)
		{
			_clientPipe.WriteStringAsync(message, data);
		}

		public void Close()
		{
			_clientPipe.Close();
			_clientPipe = null;
		}

		private void ClientPipeDataReceviedHandler(object sender, PipeEventArgs e)
		{
			this.OnPipeDataRecived?.Invoke(e.message, e.data);
		}

		public void Dispose()
		{
			Close();
		}
	}
	public class ResourcesLoggingService : IResourcesLoggingService
	{
		public void RegisterDir(string path)
		{
			ResourcesLog.Single.AddDirRecord(path);
		}

		public void RegisterFile(string path)
		{
			ResourcesLog.Single.AddFileRecord(path);
		}
	}
	public class UserRequestRecordService
	{
		public void UploadAsync()
		{
			Task.Factory.StartNew(delegate
			{
				JArray jArray = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.UserRequestRecordsFile, "$.content", isDateAsStr: true);
				if (jArray != null && jArray.Count != 0)
				{
					int num = jArray.Count;
					JToken jToken = null;
					do
					{
						jToken = jArray.Skip(--num).FirstOrDefault();
						if (jToken != null)
						{
							string text = jToken.Value<string>("url");
							if (string.IsNullOrEmpty(text))
							{
								jToken.Remove();
								FileHelper.WriteJsonWithAesEncrypt(Configurations.UserRequestRecordsFile, "content", jArray, async: true);
							}
							else
							{
								JArray jArray2 = jToken.Value<JArray>("datas");
								if (jArray2 != null && jArray2.Count > 0)
								{
									int num2 = jArray2.Count;
									do
									{
										JToken jToken2 = jArray2.First();
										ResponseModel<object> responseModel = AppContext.WebApi.RequestBase(text, jToken2);
										if (responseModel.code == "0000")
										{
											jToken2.Remove();
											FileHelper.WriteJsonWithAesEncrypt(Configurations.UserRequestRecordsFile, "content", jArray, async: true);
										}
									}
									while (--num2 > 0);
								}
								if (jArray2 == null || jArray2.Count == 0)
								{
									jToken.Remove();
									FileHelper.WriteJsonWithAesEncrypt(Configurations.UserRequestRecordsFile, "content", jArray, async: true);
								}
							}
						}
					}
					while (num > 0);
				}
			});
		}
	}
}
namespace lenovo.mbg.service.lmsa.Permissions
{
	public class Permission : lenovo.mbg.service.framework.services.IPermission
	{
		public bool? AppModuleIsReady(DeviceEx device, List<string> permissionModuleNames)
		{
			if (device == null || device.SoftStatus != DeviceSoftStateEx.Online)
			{
				return null;
			}
			if (!(device is TcpAndroidDevice tcpAndroidDevice))
			{
				return null;
			}
			MessageReaderAndWriter messageReaderAndWriter = null;
			try
			{
				return tcpAndroidDevice.CheckPermissions(permissionModuleNames);
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Check app module is ready failed:" + ex);
			}
			finally
			{
				if (messageReaderAndWriter != null)
				{
					try
					{
						messageReaderAndWriter.Dispose();
						messageReaderAndWriter = null;
					}
					catch
					{
					}
				}
			}
			return null;
		}

		public async Task BeginCheckAppIsReady(DeviceEx device, List<string> permissionModuleNames, Action<bool?> finalResultRepoter)
		{
			if (device == null || device.SoftStatus != DeviceSoftStateEx.Online || permissionModuleNames == null || permissionModuleNames.Count == 0)
			{
				finalResultRepoter?.Invoke(null);
				return;
			}
			await Task.Run(delegate
			{
				bool? obj = AppModuleIsReady(device, permissionModuleNames);
				finalResultRepoter?.Invoke(obj);
			});
		}

		public void BeginRollPollingAppModuleIsReady(DeviceEx device, List<string> permissionModuleNames, CancellationTokenSource cancelToken, Action<bool?> finalResultRepoter, int periodTime)
		{
			if (device == null || device.SoftStatus != DeviceSoftStateEx.Online || permissionModuleNames == null || permissionModuleNames.Count == 0)
			{
				finalResultRepoter?.Invoke(null);
				return;
			}
			Task.Run(delegate
			{
				bool? flag = null;
				do
				{
					flag = AppModuleIsReady(device, permissionModuleNames);
					if (flag.HasValue && !flag.Value)
					{
						Thread.Sleep(periodTime);
					}
				}
				while ((cancelToken == null || !cancelToken.IsCancellationRequested) && flag.HasValue && !flag.Value);
				finalResultRepoter?.Invoke(flag);
			});
		}

		private async Task BeginConfirmAppIsReady(DeviceEx device, List<string> permissionModuleNames, FrameworkElement tipView, CancellationTokenSource cancelToken, Action<bool?> finalResultRepoter)
		{
			LogHelper.LogInstance.Info($"Permission.BeginConfirmAppIsReady called, {finalResultRepoter.Target}");
			if (device == null || device.SoftStatus != DeviceSoftStateEx.Online || permissionModuleNames == null || permissionModuleNames.Count == 0)
			{
				finalResultRepoter?.Invoke(null);
				return;
			}
			await HostProxy.PermissionService.BeginCheckAppIsReady(HostProxy.deviceManager.MasterDevice, permissionModuleNames, async delegate(bool? isReady)
			{
				if (!isReady.HasValue)
				{
					finalResultRepoter?.Invoke(isReady);
				}
				else if (!isReady.Value)
				{
					ConfirmAppPermissionIsReadyV6 confirmView = null;
					bool autoClose = false;
					Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
					if (currentDispatcher != null)
					{
						currentDispatcher.Invoke((Action)delegate
						{
							if (tipView == null)
							{
								tipView = (FrameworkElement)(object)new NormalPermissionsTipView();
							}
							confirmView = new ConfirmAppPermissionIsReadyV6();
							ConfirmAppPermissionIsReadyViewModelV6 confirmVM = new ConfirmAppPermissionIsReadyViewModelV6(confirmView)
							{
								LenovoPrivacyVisibility = (Visibility)0,
								ViewContent = tipView
							};
							((FrameworkElement)confirmView).DataContext = confirmVM;
							if (permissionModuleNames.Contains("ScreenRecord"))
							{
								confirmVM.HeaderVisibility = (Visibility)2;
							}
							if (permissionModuleNames.Contains("Apps"))
							{
								confirmVM.ManualColseNotifyEvent = finalResultRepoter;
							}
							confirmVM.ConfirmCommand = new ReplayCommand(delegate
							{
								confirmVM.ConfirmButtonEnabled = false;
								Task task = BeginCheckAppIsReady(device, permissionModuleNames, delegate(bool? currentIsReady)
								{
									if (!currentIsReady.HasValue)
									{
										autoClose = true;
										finalResultRepoter?.Invoke(null);
									}
									else
									{
										if (currentIsReady.Value)
										{
											autoClose = true;
											finalResultRepoter?.Invoke(true);
										}
										confirmVM.ConfirmButtonEnabled = true;
									}
								});
							});
						});
					}
					if (cancelToken != null && cancelToken.IsCancellationRequested)
					{
						finalResultRepoter?.Invoke(null);
					}
					else
					{
						await MessageWindowHelper.Instance.Show(confirmView, showNow: false, isAsynnc: false, null, null, null, () => device == null || autoClose || device.SoftStatus != DeviceSoftStateEx.Online || device?.Identifer != HostProxy.deviceManager.MasterDevice?.Identifer, true);
					}
				}
				else
				{
					finalResultRepoter?.Invoke(true);
				}
			});
		}

		public async Task BeginConfirmAppIsReady(DeviceEx device, string permissionModule, CancellationTokenSource cancelToken, Action<bool?> finalResultRepoter)
		{
			LogHelper.LogInstance.Info($"BeginConfirmAppIsReady entered; Device:[{device}], moduleName:[{permissionModule}]");
			FrameworkElement view = null;
			if (Thread.CurrentThread.IsBackground)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.Invoke((Action)delegate
					{
						view = GetDefaultTipView(device, permissionModule);
					});
				}
			}
			else
			{
				view = GetDefaultTipView(device, permissionModule);
			}
			await BeginConfirmAppIsReady(device, new List<string> { permissionModule }, view, cancelToken, finalResultRepoter);
			LogHelper.LogInstance.Info($"BeginConfirmAppIsReady existed; Device:[{device}], moduleName:[{permissionModule}]");
		}

		private FrameworkElement GetDefaultTipView(DeviceEx device, string moduleName)
		{
			LogHelper.LogInstance.Info($"Permission.GetDefaultTipView entered; Device:[{device}], moduleName:[{moduleName}]");
			FrameworkElement val = null;
			switch (moduleName)
			{
			case "Apps":
			{
				string appIdendity = ((device is TcpAndroidDevice { SoftStatus: DeviceSoftStateEx.Online } tcpAndroidDevice) ? tcpAndroidDevice.ConnectedAppType : "Ma");
				val = (FrameworkElement)(object)new AppPermissionsTipViewV6(appIdendity);
				break;
			}
			case "BasicInfo":
			case "Pictures":
			case "Songs":
			case "Videos":
			case "CallLogs":
			case "Contacts":
			case "SMS":
			case "Backup":
			case "Restore":
			case "File":
			{
				NormalPermissionsTipView normalPermissionsTipView = new NormalPermissionsTipView();
				normalPermissionsTipView.ConnectedAppType = (device as TcpAndroidDevice)?.ConnectedAppType;
				normalPermissionsTipView.TipContent = "K0834";
				val = (FrameworkElement)(object)normalPermissionsTipView;
				break;
			}
			case "ScreenRecord":
				val = (FrameworkElement)(object)new ScreenRecoderPermissionsTipViewV6();
				break;
			case "SetRingTone":
				val = (FrameworkElement)(object)new SetAsRingTongPermissionsTipViewV6();
				break;
			default:
			{
				NormalPermissionsTipView normalPermissionsTipView = new NormalPermissionsTipView();
				normalPermissionsTipView.ConnectedAppType = (device as TcpAndroidDevice)?.ConnectedAppType;
				normalPermissionsTipView.TipContent = "K0834";
				val = (FrameworkElement)(object)normalPermissionsTipView;
				break;
			}
			}
			LogHelper.LogInstance.Info("Permission.GetDefaultTipView returned, viewName:[" + ((object)val)?.GetType()?.Name + "]");
			return val;
		}
	}
}
namespace lenovo.mbg.service.lmsa.OrderView
{
	public class B2BPricePanel : UserControl, IComponentConnector
	{
		private float SINGLE_DEVICE_PRICE = 1.99f;

		internal TextBlock txtPrice1;

		internal Run txtUnit;

		internal Run txtSinglePriceTotal2;

		internal Image imgSubstract;

		internal TextBlock txtDeviceCount;

		internal LangButton btnSingleDevice;

		internal TextBlock txtPrice2;

		internal Run txtSave;

		internal LangButton btnTenDevices;

		internal TextBlock txtPrice3;

		internal LangButton btnMonthlyFee;

		private bool _contentLoaded;

		public Action OnBuyAction { get; set; }

		public int SingleDeviceCount { get; private set; }

		public B2BPricePanel()
		{
			InitializeComponent();
			SingleDeviceCount = 1;
			txtUnit.Text = UserService.Single.CurrentLoggedInUser.PriceUnit;
			txtPrice1.Text = $"{UserService.Single.CurrentLoggedInUser.PriceUnit}{UserService.Single.CurrentLoggedInUser.Price1}";
			txtPrice2.Text = $"{UserService.Single.CurrentLoggedInUser.PriceUnit}{UserService.Single.CurrentLoggedInUser.Price2}";
			txtPrice3.Text = $"{UserService.Single.CurrentLoggedInUser.PriceUnit}{UserService.Single.CurrentLoggedInUser.Price3}";
			txtSave.Text = $"{UserService.Single.CurrentLoggedInUser.PriceUnit} {10f * UserService.Single.CurrentLoggedInUser.Price1 - UserService.Single.CurrentLoggedInUser.Price2:F2}";
			SINGLE_DEVICE_PRICE = UserService.Single.CurrentLoggedInUser.Price1;
			txtSinglePriceTotal2.Text = UserService.Single.CurrentLoggedInUser.Price1.ToString("F2") ?? "";
			((FrameworkElement)btnSingleDevice).Tag = UserService.Single.CurrentLoggedInUser.SkuName1;
			((FrameworkElement)btnTenDevices).Tag = UserService.Single.CurrentLoggedInUser.SkuName2;
			((FrameworkElement)btnMonthlyFee).Tag = UserService.Single.CurrentLoggedInUser.SkuName3;
		}

		private void ImageSubstract_PreviewMouseDown(object sender, MouseButtonEventArgs e)
		{
			SingleDeviceCount--;
			CalculateTotalPrice();
			if (SingleDeviceCount == 1)
			{
				((UIElement)imgSubstract).IsEnabled = false;
			}
		}

		private void ImageAdd_PreviewMouseDown(object sender, MouseButtonEventArgs e)
		{
			SingleDeviceCount++;
			CalculateTotalPrice();
			((UIElement)imgSubstract).IsEnabled = true;
		}

		private void CalculateTotalPrice()
		{
			txtDeviceCount.Text = SingleDeviceCount.ToString();
			float num = SINGLE_DEVICE_PRICE * (float)SingleDeviceCount;
			txtSinglePriceTotal2.Text = num.ToString("F2");
		}

		private void OnBtnBuy(object sender, RoutedEventArgs e)
		{
			Button val = (Button)((sender is Button) ? sender : null);
			object tag = ((FrameworkElement)val).Tag;
			int quantity = ((!(((FrameworkElement)val).Name == ((FrameworkElement)btnSingleDevice).Name)) ? 1 : SingleDeviceCount);
			object obj = AppContext.WebApi.RequestContent(WebApiUrl.CALL_B2B_ORDER_BUY_URL, new
			{
				macAddressRsa = RsaHelper.RSAEncrypt(WebApiContext.RSA_PUBLIC_KEY, GlobalFun.GetMacAddr()),
				sku = tag,
				quantity = quantity
			});
			if (obj != null)
			{
				GlobalFun.OpenUrlByBrowser(obj.ToString());
				OnBuyAction?.Invoke();
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/orderview/b2bpricepanel.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			//IL_0066: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Expected O, but got Unknown
			//IL_0077: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Expected O, but got Unknown
			//IL_008e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0098: Expected O, but got Unknown
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00aa: Expected O, but got Unknown
			//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Expected O, but got Unknown
			//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ef: Expected O, but got Unknown
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fe: Expected O, but got Unknown
			//IL_0102: Unknown result type (might be due to invalid IL or missing references)
			//IL_010c: Expected O, but got Unknown
			//IL_0127: Unknown result type (might be due to invalid IL or missing references)
			//IL_0131: Expected O, but got Unknown
			//IL_0136: Unknown result type (might be due to invalid IL or missing references)
			//IL_0140: Expected O, but got Unknown
			//IL_015b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0165: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				txtPrice1 = (TextBlock)target;
				break;
			case 2:
				txtUnit = (Run)target;
				break;
			case 3:
				txtSinglePriceTotal2 = (Run)target;
				break;
			case 4:
				imgSubstract = (Image)target;
				((UIElement)imgSubstract).PreviewMouseDown += new MouseButtonEventHandler(ImageSubstract_PreviewMouseDown);
				break;
			case 5:
				txtDeviceCount = (TextBlock)target;
				break;
			case 6:
				((UIElement)(Image)target).PreviewMouseDown += new MouseButtonEventHandler(ImageAdd_PreviewMouseDown);
				break;
			case 7:
				btnSingleDevice = (LangButton)target;
				((ButtonBase)btnSingleDevice).Click += new RoutedEventHandler(OnBtnBuy);
				break;
			case 8:
				txtPrice2 = (TextBlock)target;
				break;
			case 9:
				txtSave = (Run)target;
				break;
			case 10:
				btnTenDevices = (LangButton)target;
				((ButtonBase)btnTenDevices).Click += new RoutedEventHandler(OnBtnBuy);
				break;
			case 11:
				txtPrice3 = (TextBlock)target;
				break;
			case 12:
				btnMonthlyFee = (LangButton)target;
				((ButtonBase)btnMonthlyFee).Click += new RoutedEventHandler(OnBtnBuy);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class OrderBuyView : Window, IComponentConnector
	{
		internal Button btnClose;

		internal B2BPricePanel BuyPanel;

		internal Button Bd;

		private bool _contentLoaded;

		public OrderBuyView()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
			((Window)this).WindowStartupLocation = (WindowStartupLocation)2;
			BuyPanel.OnBuyAction = delegate
			{
				((Window)this).Close();
			};
			((UIElement)Bd).Visibility = (Visibility)(!UserService.Single.CurrentLoggedInUser.B2BEntranceEnable);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
		}

		private void OnBtnQuestion(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
			ApplcationClass.ApplcationStartWindow.ShowB2BPurchaseOverview();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/orderview/orderbuyview.xaml", UriKind.Relative);
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
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Expected O, but got Unknown
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_0068: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				BuyPanel = (B2BPricePanel)target;
				break;
			case 3:
				Bd = (Button)target;
				((ButtonBase)Bd).Click += new RoutedEventHandler(OnBtnQuestion);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class OrderCancelView : Window, IComponentConnector
	{
		private bool _contentLoaded;

		public OrderCancelView()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
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
				Uri uri = new Uri("/Software Fix;component/orderview/ordercancelview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class OrderRefundIDView : Window, IComponentConnector
	{
		internal Run txtID;

		private bool _contentLoaded;

		public OrderRefundIDView(string id)
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
			txtID.Text = id ?? string.Empty;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
		}

		private void OnLeftClickUrl(object sender, MouseButtonEventArgs e)
		{
			string text = ((TextBlock)((sender is TextBlock) ? sender : null)).Text;
			GlobalFun.OpenUrlByBrowser(text);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/orderview/orderrefundidview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Expected O, but got Unknown
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Expected O, but got Unknown
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				txtID = (Run)target;
				break;
			case 2:
				((UIElement)(TextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLeftClickUrl);
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class OrderRefundView : Window, IComponentConnector
	{
		private string _Id;

		private bool _contentLoaded;

		public OrderRefundView(string orderId)
		{
			_Id = orderId;
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			((Window)this).Close();
		}

		private void OnBtnRefund(object sender, RoutedEventArgs e)
		{
			string id = AppContext.WebApi.RequestBase(WebApiUrl.CALL_B2B_GET_ORDERID_URL, new
			{
				macAddressRsa = RsaHelper.RSAEncrypt(WebApiContext.RSA_PUBLIC_KEY, GlobalFun.GetMacAddr()),
				orderId = _Id
			}).content?.ToString();
			((Window)this).Close();
			if (!string.IsNullOrEmpty(id))
			{
				((DispatcherObject)Application.Current).Dispatcher.BeginInvoke((Delegate)(Action)delegate
				{
					OrderRefundIDView orderRefundIDView = new OrderRefundIDView(id);
					((Window)orderRefundIDView).ShowDialog();
				}, Array.Empty<object>());
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/orderview/orderrefundview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Expected O, but got Unknown
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_004c: Expected O, but got Unknown
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0066: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(OnBtnRefund);
				break;
			case 2:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class OrderDetailView : Window, IComponentConnector
	{
		internal CircleProgress prog;

		private bool _contentLoaded;

		public string RowItem1 { get; set; }

		public string RowItem2 { get; set; }

		public string RowItem3 { get; set; }

		public double TotalDays { get; set; }

		public double RemainDays { get; set; }

		public ObservableCollection<FlashedDevModel> FlashDevArr { get; set; }

		public OrderDetailView(OrderModel order)
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
			if (order.IsMonthly)
			{
				if (!string.IsNullOrEmpty(order.Package) && order.Package.Contains("B2B"))
				{
					((Window)this).Title = "K1738";
				}
				else
				{
					((Window)this).Title = "K1723";
				}
				RowItem1 = string.Format("{0}:   {1}", LangTranslation.Translate("K1725"), order?.ImeiUsedCount);
				RowItem2 = string.Format("{0}:  {1:MM-dd-yyyy}", LangTranslation.Translate("K1706"), order?.Expired);
				RowItem3 = string.Format("{0}: {1}", LangTranslation.Translate("K1716"), order?.RemainDays);
			}
			else
			{
				((Window)this).Title = "K1724";
				RowItem1 = string.Format("{0}:   {1}", LangTranslation.Translate("K1725"), order?.ImeiUsedCount);
				RowItem2 = string.Format("{0}:  {1}", LangTranslation.Translate("K1726"), order?.RemainImei);
				if (order != null && order.StartUseDate.HasValue)
				{
					RowItem3 = string.Format("IMEI {0}:   {1:MM-dd-yyyy}", LangTranslation.Translate("K0276"), order.StartUseDate);
				}
				else
				{
					RowItem3 = "IMEI " + LangTranslation.Translate("K0276") + ":   " + LangTranslation.Translate("K0307");
				}
			}
			TotalDays = 30.0;
			if (order != null)
			{
				RemainDays = order.RemainDays;
			}
			if (order.FlashedDevArr != null)
			{
				FlashDevArr = new ObservableCollection<FlashedDevModel>(order.FlashedDevArr);
			}
			((FrameworkElement)this).DataContext = this;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
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
				Uri uri = new Uri("/Software Fix;component/orderview/orderdetailview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				prog = (CircleProgress)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class OrderExpiredView : Window, IMessageWindowV6, IComponentConnector
	{
		internal LangTextBlock txtSubTitle;

		internal B2BPricePanel BuyPanel;

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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public OrderExpiredView(int _modeType)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			BuyPanel.OnBuyAction = delegate
			{
				BtnClose_Click(null, null);
				MessageWindowHelper.Instance.Show(null, "Rescue the phone only at the current Mac address after successful purchase.", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true);
			};
			if (_modeType == 2)
			{
				((TextBlock)txtSubTitle).Text = LangTranslation.Translate("K1659");
			}
			else
			{
				((TextBlock)txtSubTitle).Text = LangTranslation.Translate("K1658");
			}
		}

		private void BtnClose_Click(object sender, RoutedEventArgs e)
		{
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
				Uri uri = new Uri("/Software Fix;component/orderview/orderexpiredview.xaml", UriKind.Relative);
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
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(BtnClose_Click);
				break;
			case 2:
				txtSubTitle = (LangTextBlock)target;
				break;
			case 3:
				BuyPanel = (B2BPricePanel)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class OrderRemindView : Window, IMessageWindowV6, IComponentConnector
	{
		internal LangTextBlock txtSubTitle;

		internal LangTextBlock txtInfo;

		internal B2BPricePanel BuyPanel;

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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public OrderRemindView(int used, int total)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			if (used >= total)
			{
				((TextBlock)txtSubTitle).Text = LangTranslation.Translate("K1853");
			}
			else
			{
				((TextBlock)txtSubTitle).Text = LangTranslation.Translate("K1852");
			}
			((TextBlock)txtInfo).Text = string.Format(LangTranslation.Translate("K1686"), used, total);
			BuyPanel.OnBuyAction = delegate
			{
				BtnClose_Click(null, null);
				MessageWindowHelper.Instance.Show(null, "K1730", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true);
			};
		}

		private void BtnClose_Click(object sender, RoutedEventArgs e)
		{
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
				Uri uri = new Uri("/Software Fix;component/orderview/orderremindview.xaml", UriKind.Relative);
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
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(BtnClose_Click);
				break;
			case 2:
				txtSubTitle = (LangTextBlock)target;
				break;
			case 3:
				txtInfo = (LangTextBlock)target;
				break;
			case 4:
				BuyPanel = (B2BPricePanel)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.ModelV6
{
	public class MotoCareInfo
	{
		public string country { get; set; }

		public string url { get; set; }

		public string thumbnailImg { get; set; }

		public string picture { get; set; }

		public int type { get; set; }

		public int id { get; set; }

		public string sn { get; set; }

		[JsonIgnore]
		public string imei { get; set; }

		[JsonIgnore]
		public string WarrantyStartDate { get; set; }

		[JsonIgnore]
		public string WarrantyEndDate { get; set; }

		[JsonIgnore]
		public bool InWarranty { get; set; }
	}
	public class CouponInfo
	{
		public string discountCode { get; set; }

		public string discountInfo { get; set; }

		public string couponStartTime { get; set; }

		public string couponEndTime { get; set; }
	}
	public class PluginModel : NotifyBase
	{
		private bool _IsSelected;

		private FrameworkElement _UiElement;

		private bool isEnabled = true;

		public string PluginName { get; set; }

		public string NormalIcon { get; set; }

		public string HoverIcon { get; set; }

		public string Icon4B2B { get; set; }

		public bool IsLoaded { get; set; }

		public bool IsSelected
		{
			get
			{
				return _IsSelected;
			}
			set
			{
				_IsSelected = value;
				OnPropertyChanged("IsSelected");
			}
		}

		public FrameworkElement UiElement
		{
			get
			{
				return _UiElement;
			}
			set
			{
				_UiElement = value;
				OnPropertyChanged("UiElement");
			}
		}

		public bool IsEnabled
		{
			get
			{
				return isEnabled;
			}
			set
			{
				isEnabled = value;
				OnPropertyChanged("IsEnabled");
			}
		}

		public PluginInfo Info { get; set; }

		public IPlugin Plugin { get; set; }
	}
	public class RegistedDevModel
	{
		public string id { get; set; }

		public bool IsUpload { get; set; }

		public bool IsSelected { get; set; }

		[JsonProperty("modelName")]
		public string ModelName { get; set; }

		[JsonProperty("imei")]
		public string IMEI { get; set; }

		[JsonProperty("imei2")]
		public string IMEI2 { get; set; }

		[JsonProperty("sn")]
		public string SN { get; set; }

		[JsonProperty("pn")]
		public string PN { get; set; }

		[JsonProperty("brand")]
		public string Brand { get; set; }

		[JsonProperty("category")]
		public string Category { get; set; }

		[JsonProperty("motoModelName")]
		public string MotoModelName { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.Login.Model
{
	public class OnlineUserInfo
	{
		public string UserId { get; set; }

		public string UserName { get; set; }

		public string EmailAddress { get; set; }

		public string Country { get; set; }

		public string FullName { get; set; }

		public string PhoneNumber { get; set; }

		public string UserSource { get; set; }

		public int quitSurvey { get; set; }

		public int failureNum { get; set; }

		public bool IsB2BSupportMultDev { get; set; }

		public bool IsRtNotify { get; set; }

		public bool B2BBuyNowDisplay { get; set; }

		public bool B2BEntranceEnable { get; set; }

		public string PriceUnit { get; set; }

		public float Price1 { get; set; }

		public float Price2 { get; set; }

		public float Price3 { get; set; }

		public string SkuName1 { get; set; }

		public string SkuName2 { get; set; }

		public string SkuName3 { get; set; }

		public Dictionary<string, object> config { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.Login.Protocol
{
	public class ChangePasswordResponseData
	{
	}
	public sealed class Constant
	{
		public sealed class UserSourceConstant
		{
			public const string LMSA = "lmsa";

			public const string LENOVO_ID = "lenovoId";

			public const string GUEST = "guest";
		}
	}
	public class LatestLoginUserInfo
	{
		public static string TAG => "LatestLoginUserInfo";

		public string UserName { get; set; }

		public string Password { get; set; }

		public string UserID { get; set; }

		public string email { get; set; }

		public string phone { get; set; }

		public Dictionary<string, object> config { get; set; }

		public UserLoginFormData LoginFormData { get; set; }
	}
	public class UserLoginFormData
	{
		public static string TAG => "Storage_UserLoginFormData";

		[JsonProperty("userSource")]
		public string UserSource { get; set; }

		[JsonProperty("userData")]
		public string UserData { get; set; }
	}
	public class LenovoIdUserLoginFormData
	{
		[JsonProperty("useName")]
		public string UserName { get; set; }

		[JsonProperty("wust")]
		public string WUST { get; set; }

		public string lenovoId { get; set; }
	}
	public class LogoutReportFormData
	{
		[JsonProperty("userId")]
		public string UserId { get; set; }
	}
	public class LogoutReportResponseData
	{
	}
	public class RegisterResponseData
	{
	}
	public class ForgotPasswordFormData
	{
		[JsonProperty("name")]
		public string UserName { get; set; }

		[JsonProperty("email")]
		public string EmailAddress { get; set; }
	}
	public class ForgotPasswordResponseData
	{
	}
	public class LoggingInResponseData
	{
		[JsonProperty("userId")]
		public string UserId { get; set; }

		[JsonProperty("name")]
		public string Name { get; set; }

		[JsonProperty("email")]
		public string EmailAddress { get; set; }

		[JsonProperty("country")]
		public string Country { get; set; }

		[JsonProperty("fullName")]
		public string FullName { get; set; }

		[JsonProperty("phone")]
		public string PhoneNumber { get; set; }

		[JsonProperty("isLenovoId")]
		public bool IsLenovoId { get; set; }

		[JsonProperty("notification")]
		public string RSANotification { get; set; }

		public Dictionary<string, object> dictionary { get; set; }

		[JsonProperty("b2bCountry")]
		public bool B2bCountry { get; set; }

		[JsonProperty("b2BUserInfo")]
		public B2BUserInfo B2bUsrInfo { get; set; }

		public int quitSurvey { get; set; }

		public int failureNum { get; set; }
	}
	public class B2BUserInfo
	{
		[JsonProperty("vipName")]
		public string B2bMode { get; set; }

		[JsonProperty("multiDevice")]
		public bool IsMultiDev { get; set; }

		[JsonProperty("display")]
		public bool B2bButtonDisplay { get; set; }
	}
	public class ChangePasswordFormData
	{
		[JsonProperty("password")]
		public string OldPassword { get; set; }

		[JsonProperty("newPwd")]
		public string NewPassword { get; set; }

		[JsonProperty("userId")]
		public string UserId { get; set; }
	}
	public class ResponseData<T>
	{
		[JsonProperty("code")]
		public string Code { get; set; }

		[JsonProperty("desc")]
		public string Description { get; set; }

		[JsonProperty("content")]
		public T Data { get; set; }
	}
	public class LmsaUserLoginFormData
	{
		[JsonProperty("password")]
		public string Password { get; set; }

		[JsonProperty("email")]
		public string EmailAddress { get; set; }
	}
	public class UserPermissionResponseData
	{
		[JsonProperty("parentid")]
		public string ParentId { get; set; }

		[JsonProperty("privName")]
		public string PrivName { get; set; }

		[JsonProperty("privId")]
		public string PrivId { get; set; }

		[JsonProperty("privType")]
		public string PrivType { get; set; }
	}
	public class UserRegisterFormData
	{
		[JsonProperty("name")]
		public string UserName { get; set; }

		[JsonProperty("fullName")]
		public string FullName { get; set; }

		[JsonProperty("password")]
		public string Password { get; set; }

		[JsonProperty("email")]
		public string EmailAddress { get; set; }

		[JsonProperty("phone")]
		public string PhoneNumber { get; set; }

		[JsonProperty("country")]
		public string Country { get; set; }

		[JsonProperty("city")]
		public string City { get; set; }

		[JsonProperty("address")]
		public string HouseAddress { get; set; }

		[JsonProperty("company")]
		public string Company { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.Login.Converters
{
	public class PasswordLevelToForegroundConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Expected O, but got Unknown
			//IL_004b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_0056: Expected O, but got Unknown
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Expected O, but got Unknown
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_007e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_008b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Expected O, but got Unknown
			if (value == null)
			{
				return (object)new SolidColorBrush(Colors.Red);
			}
			double result = 0.0;
			double.TryParse(value.ToString(), out result);
			return (int)result switch
			{
				1 => (object)new SolidColorBrush(Colors.Red), 
				2 => (object)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFCC00")), 
				3 => (object)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#00BEC1")), 
				_ => (object)new SolidColorBrush(Colors.Red), 
			};
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class WraningToStringConvertver : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return null;
			}
			FormItemVerifyWraningViewModel formItemVerifyWraningViewModel = (FormItemVerifyWraningViewModel)value;
			if (1.Equals(formItemVerifyWraningViewModel.WraningCode))
			{
				if (formItemVerifyWraningViewModel.WraningContent != null)
				{
					return formItemVerifyWraningViewModel.WraningContent.ToString();
				}
				return string.Empty;
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class ObjectToDoubleConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return 0;
			}
			double result = 0.0;
			double.TryParse(value.ToString(), out result);
			return result;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
}
namespace lenovo.mbg.service.lmsa.Login.View
{
	public class UserOperationMenuV6 : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty IconProperty = DependencyProperty.Register("Icon", typeof(object), typeof(UserOperationMenu), new PropertyMetadata((PropertyChangedCallback)null));

		public static readonly DependencyProperty HeaderProperty = DependencyProperty.Register("Header", typeof(object), typeof(UserOperationMenu), new PropertyMetadata((PropertyChangedCallback)null));

		internal UserOperationMenuV6 winmenu;

		private bool _contentLoaded;

		public object Icon
		{
			get
			{
				return ((DependencyObject)this).GetValue(IconProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(IconProperty, value);
			}
		}

		public object Header
		{
			get
			{
				return ((DependencyObject)this).GetValue(HeaderProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(HeaderProperty, value);
			}
		}

		public UserOperationMenuV6()
		{
			InitializeComponent();
		}

		public void ChangeIsEnabled(bool isEnabled)
		{
			DependencyObject templateChild = ((FrameworkElement)this).GetTemplateChild("bd");
			Border val = (Border)(object)((templateChild is Border) ? templateChild : null);
			((UIElement)val).IsEnabled = isEnabled;
			((UIElement)val).Opacity = (isEnabled ? 1.0 : 0.3);
		}

		private void UserControl_MouseDown(object sender, MouseButtonEventArgs e)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuClick", "menu button click", 0L).Build());
		}

		private void winmenu_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
		{
			if (ApplcationClass.IsExecuteWork)
			{
				((RoutedEventArgs)e).Handled = true;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/login/view/useroperationmenuv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Expected O, but got Unknown
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Expected O, but got Unknown
			if (connectionId == 1)
			{
				winmenu = (UserOperationMenuV6)target;
				((UIElement)winmenu).MouseDown += new MouseButtonEventHandler(UserControl_MouseDown);
				((UIElement)winmenu).PreviewMouseLeftButtonDown += new MouseButtonEventHandler(winmenu_PreviewMouseLeftButtonDown);
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class UserProfileView : Window, IMessageWindowV6, IComponentConnector
	{
		private bool isRunning = false;

		internal Run txtUser;

		internal Button btnCopy;

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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public UserProfileView()
		{
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((FrameworkElement)this).Loaded += (RoutedEventHandler)delegate
			{
				txtUser.Text = UserService.Single.CurrentLoggedInUser.UserName;
			};
		}

		private void BtnCloseClick(object sender, RoutedEventArgs e)
		{
			Result = false;
			((Window)this).Close();
		}

		private async void BtnCopyClick(object sender, RoutedEventArgs e)
		{
			if (!isRunning)
			{
				Clipboard.Clear();
				isRunning = true;
				string textToCopy = txtUser.Text;
				Clipboard.SetText(textToCopy);
				Button button = (Button)sender;
				object obj = ((FrameworkTemplate)((Control)button).Template).FindName("copiedLabel", (FrameworkElement)(object)button);
				Border copiedLabel = (Border)((obj is Border) ? obj : null);
				if (copiedLabel != null)
				{
					((UIElement)copiedLabel).Visibility = (Visibility)0;
					await Task.Delay(800);
					((UIElement)copiedLabel).Visibility = (Visibility)1;
					isRunning = false;
				}
				else
				{
					await Task.Delay(800);
					isRunning = false;
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
				Uri uri = new Uri("/Software Fix;component/login/view/userprofileview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Expected O, but got Unknown
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Expected O, but got Unknown
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Expected O, but got Unknown
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0066: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(BtnCloseClick);
				break;
			case 2:
				txtUser = (Run)target;
				break;
			case 3:
				btnCopy = (Button)target;
				((ButtonBase)btnCopy).Click += new RoutedEventHandler(BtnCopyClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class DeviceDetailView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public DeviceDetailView()
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
				Uri uri = new Uri("/Software Fix;component/login/view/devicedetailview.xaml", UriKind.Relative);
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
	public class DeviceListView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public DeviceListView()
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
				Uri uri = new Uri("/Software Fix;component/login/view/devicelistview.xaml", UriKind.Relative);
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
	public class VerificationCodeView : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty VerificationCodeListProperty = DependencyProperty.Register("VerificationCodeList", typeof(List<string>), typeof(VerificationCodeView), new PropertyMetadata((object)null, new PropertyChangedCallback(PropertyChangedCallbackHandler)));

		internal Canvas paint;

		private bool _contentLoaded;

		public List<string> VerificationCodeList
		{
			get
			{
				return (List<string>)((DependencyObject)this).GetValue(VerificationCodeListProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(VerificationCodeListProperty, (object)value);
			}
		}

		public VerificationCodeView()
		{
			InitializeComponent();
		}

		public override void OnApplyTemplate()
		{
			((FrameworkElement)this).OnApplyTemplate();
		}

		private static void PropertyChangedCallbackHandler(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			if (((DependencyPropertyChangedEventArgs)(ref e)).NewValue != null && ((DependencyPropertyChangedEventArgs)(ref e)).NewValue is List<string> codes)
			{
				VerificationCodeView verificationCodeView = d as VerificationCodeView;
				verificationCodeView.RefreshCode(codes);
			}
		}

		private void UserControl_MouseDown(object sender, MouseButtonEventArgs e)
		{
			List<string> codes = (VerificationCodeList = VerificationCodeFactory.CeateNewCode(4, VerificationCodeFactory.PredefinedExceptChars));
			RefreshCode(codes);
		}

		private void RefreshCode(List<string> codes)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Expected O, but got Unknown
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			FontSizeConverter val = new FontSizeConverter();
			TextBlock val2 = new TextBlock();
			val2.FontSize = 16.0;
			val2.Foreground = ((Control)this).Foreground;
			val2.TextDecorations = TextDecorations.Strikethrough;
			val2.FontStyle = FontStyles.Italic;
			Canvas.SetTop((UIElement)(object)val2, 2.0);
			Canvas.SetLeft((UIElement)(object)val2, 9.0);
			StringBuilder stringBuilder = new StringBuilder();
			foreach (string code in codes)
			{
				stringBuilder.Append(code).Append(' ');
			}
			val2.Text = stringBuilder.ToString();
			((Panel)paint).Children.Clear();
			((Panel)paint).Children.Add((UIElement)(object)val2);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/login/view/verificationcodeview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Expected O, but got Unknown
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(VerificationCodeView)target).MouseDown += new MouseButtonEventHandler(UserControl_MouseDown);
				break;
			case 2:
				paint = (Canvas)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class UserOperationMenu : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty IconProperty = DependencyProperty.Register("Icon", typeof(object), typeof(UserOperationMenu), new PropertyMetadata((PropertyChangedCallback)null));

		public static readonly DependencyProperty HeaderProperty = DependencyProperty.Register("Header", typeof(object), typeof(UserOperationMenu), new PropertyMetadata((PropertyChangedCallback)null));

		internal UserOperationMenu winmenu;

		internal Menu menum;

		private bool _contentLoaded;

		public object Icon
		{
			get
			{
				return ((DependencyObject)this).GetValue(IconProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(IconProperty, value);
			}
		}

		public object Header
		{
			get
			{
				return ((DependencyObject)this).GetValue(HeaderProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(HeaderProperty, value);
			}
		}

		public UserOperationMenu()
		{
			InitializeComponent();
		}

		private void UserControl_MouseDown(object sender, MouseButtonEventArgs e)
		{
			global::Smart.GoogleAnalyticsTracker.Tracker.Send(HitBuilder.CreateCustomEvent(App.Category, "MenuClick", "menu button click", 0L).Build());
		}

		private void winmenu_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
		{
			if (ApplcationClass.IsExecuteWork)
			{
				((RoutedEventArgs)e).Handled = true;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/login/view/useroperationmenu.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_004c: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				winmenu = (UserOperationMenu)target;
				((UIElement)winmenu).MouseDown += new MouseButtonEventHandler(UserControl_MouseDown);
				((UIElement)winmenu).PreviewMouseLeftButtonDown += new MouseButtonEventHandler(winmenu_PreviewMouseLeftButtonDown);
				break;
			case 2:
				menum = (Menu)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.Login.ViewModel
{
	public class DeviceDetailViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private DeviceModel _Device;

		public DeviceModel Device
		{
			get
			{
				return _Device;
			}
			set
			{
				_Device = value;
				OnPropertyChanged("Device");
			}
		}

		public DeviceDetailViewModel(DeviceModel device)
		{
			Device = device;
		}
	}
	public abstract class OperationMenuItemViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private ReplayCommand mClickCommand;

		private Visibility mItemVisibility;

		private ImageSource m_iconSource;

		private ImageSource m_mouseOverIconSource;

		private string m_headerText;

		private bool isEnabled = true;

		public ReplayCommand ClickCommand
		{
			get
			{
				return mClickCommand;
			}
			set
			{
				if (mClickCommand != value)
				{
					mClickCommand = value;
					OnPropertyChanged("ClickCommand");
				}
			}
		}

		public Visibility ItemVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return mItemVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (mItemVisibility != value)
				{
					mItemVisibility = value;
					OnPropertyChanged("ItemVisibility");
				}
			}
		}

		public ImageSource IconSource
		{
			get
			{
				return m_iconSource;
			}
			set
			{
				if (m_iconSource != value)
				{
					m_iconSource = value;
					OnPropertyChanged("IconSource");
				}
			}
		}

		public ImageSource MouseOverIconSource
		{
			get
			{
				return m_mouseOverIconSource;
			}
			set
			{
				if (m_mouseOverIconSource != value)
				{
					m_mouseOverIconSource = value;
					OnPropertyChanged("MouseOverIconSource");
				}
			}
		}

		public string HeaderText
		{
			get
			{
				return m_headerText;
			}
			set
			{
				if (!(m_headerText == value))
				{
					m_headerText = value;
					OnPropertyChanged("HeaderText");
				}
			}
		}

		public bool IsEnabled
		{
			get
			{
				return isEnabled;
			}
			set
			{
				if (isEnabled != value)
				{
					isEnabled = value;
					OnPropertyChanged("IsEnabled");
				}
			}
		}

		public OperationMenuItemViewModel()
		{
			ClickCommand = new ReplayCommand(ClickCommandHandler);
		}

		protected abstract void ClickCommandHandler(object e);
	}
	public class UserOperationMenuViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private Dictionary<MouseOverMenuItemViewModel, bool> itemsActiveStatus = new Dictionary<MouseOverMenuItemViewModel, bool>();

		private ObservableCollection<MouseOverMenuItemViewModel> m_menumItemsSource;

		private ReplayCommand mLogIn;

		private bool mIsOnline = false;

		private string mUserName;

		private Visibility mLoginButtonVisibility = (Visibility)0;

		private Visibility mUserOperationMenuVisibility = (Visibility)2;

		private string mLoginButtonText = "K0006";

		public ObservableCollection<MouseOverMenuItemViewModel> MenuItems
		{
			get
			{
				return m_menumItemsSource;
			}
			set
			{
				if (m_menumItemsSource != value)
				{
					m_menumItemsSource = value;
					OnPropertyChanged("MenuItems");
				}
			}
		}

		public ReplayCommand LogInCommand
		{
			get
			{
				return mLogIn;
			}
			set
			{
				if (mLogIn != value)
				{
					mLogIn = value;
					OnPropertyChanged("LogInCommand");
				}
			}
		}

		public bool IsOnline
		{
			get
			{
				return mIsOnline;
			}
			set
			{
				if (mIsOnline != value)
				{
					mIsOnline = value;
					OnPropertyChanged("IsOnline");
				}
			}
		}

		public string UserName
		{
			get
			{
				return mUserName;
			}
			set
			{
				if (!(mUserName == value))
				{
					mUserName = value;
					OnPropertyChanged("UserName");
				}
			}
		}

		public Visibility LoginButtonVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return mLoginButtonVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (mLoginButtonVisibility != value)
				{
					mLoginButtonVisibility = value;
					OnPropertyChanged("LoginButtonVisibility");
				}
			}
		}

		public Visibility UserOperationMenuVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return mUserOperationMenuVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (mUserOperationMenuVisibility != value)
				{
					mUserOperationMenuVisibility = value;
					OnPropertyChanged("UserOperationMenuVisibility");
				}
			}
		}

		public string LoginButtonText
		{
			get
			{
				return mLoginButtonText;
			}
			set
			{
				if (!(mLoginButtonText == value))
				{
					mLoginButtonText = value;
					OnPropertyChanged("LoginButtonText");
				}
			}
		}

		public UserOperationMenuViewModel()
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			MenuItems = new ObservableCollection<MouseOverMenuItemViewModel>();
			DeviceListMenuItemViewModel deviceListMenuItemViewModel = new DeviceListMenuItemViewModel
			{
				ItemVisibility = (Visibility)2
			};
			itemsActiveStatus.Add(deviceListMenuItemViewModel, value: true);
			MenuItems.Add(deviceListMenuItemViewModel);
			B2BPurchaseMenuItemViewModel b2BPurchaseMenuItemViewModel = new B2BPurchaseMenuItemViewModel
			{
				ItemVisibility = (Visibility)2
			};
			itemsActiveStatus.Add(b2BPurchaseMenuItemViewModel, value: true);
			MenuItems.Add(b2BPurchaseMenuItemViewModel);
			UserProfileMenuItemViewModel userProfileMenuItemViewModel = new UserProfileMenuItemViewModel
			{
				ItemVisibility = (Visibility)2
			};
			MenuItems.Add(userProfileMenuItemViewModel);
			itemsActiveStatus.Add(userProfileMenuItemViewModel, value: true);
			LogoutMenuItemViewModel logoutMenuItemViewModel = new LogoutMenuItemViewModel
			{
				ItemVisibility = (Visibility)2
			};
			MenuItems.Add(logoutMenuItemViewModel);
			itemsActiveStatus.Add(logoutMenuItemViewModel, value: true);
			LogInCommand = new ReplayCommand(LogInCommandHandler);
		}

		public void ActiveItem(Type type)
		{
			if (type == null)
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
				KeyValuePair<MouseOverMenuItemViewModel, bool> keyValuePair = itemsActiveStatus.Where((KeyValuePair<MouseOverMenuItemViewModel, bool> m) => m.Key.GetType().Equals(type)).FirstOrDefault();
				if (itemsActiveStatus.ContainsKey(keyValuePair.Key))
				{
					keyValuePair.Key.ItemVisibility = (Visibility)2;
					itemsActiveStatus[keyValuePair.Key] = false;
				}
			});
		}

		public void OnlineUserChangedHandler(object sender, OnlineUserChangedEventArgs e)
		{
			if (IsOnline = e.IsOnline)
			{
				LoginButtonVisibility = (Visibility)2;
				UserOperationMenuVisibility = (Visibility)0;
				if ("lmsa".Equals(e.UserInfo.UserSource))
				{
					UserName = e.UserInfo.UserName;
				}
				else
				{
					UserName = e.UserInfo.FullName;
				}
				bool flag = lenovo.mbg.service.lmsa.Login.Business.PermissionService.Single.CheckPermission(UserService.Single.CurrentLoggedInUser.UserId, "10", "1");
				{
					foreach (MouseOverMenuItemViewModel menuItem in MenuItems)
					{
						if (flag && menuItem is DeviceListMenuItemViewModel)
						{
							if (itemsActiveStatus[menuItem])
							{
								menuItem.ItemVisibility = (Visibility)2;
							}
						}
						else if (menuItem is B2BPurchaseMenuItemViewModel)
						{
							menuItem.ItemVisibility = (Visibility)((!UserService.Single.CurrentLoggedInUser.B2BEntranceEnable) ? 2 : 0);
						}
						else
						{
							menuItem.ItemVisibility = (Visibility)0;
						}
					}
					return;
				}
			}
			lenovo.mbg.service.lmsa.Login.Business.PermissionService.Single.Stop();
			UserName = string.Empty;
			LoginButtonVisibility = (Visibility)0;
			UserOperationMenuVisibility = (Visibility)2;
			foreach (MouseOverMenuItemViewModel menuItem2 in MenuItems)
			{
				menuItem2.ItemVisibility = (Visibility)2;
			}
		}

		private void LogInCommandHandler(object e)
		{
			if (!UserService.Single.IsOnline)
			{
				LogHelper.LogInstance.Debug("click login button in the main window");
				LenovoIdWindow.ShowDialogEx();
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.Login.ViewModel.UserOperation
{
	public class B2BPurchaseMenuItemViewModel : MouseOverMenuItemViewModel
	{
		public B2BPurchaseMenuItemViewModel()
		{
			base.Header = "K1688";
		}

		public override void ClickCommandHandler(object e)
		{
			ApplcationClass.ApplcationStartWindow.ShowB2BPurchaseOverview();
		}
	}
	public class UserProfileMenuItemViewModel : MouseOverMenuItemViewModel
	{
		public UserProfileMenuItemViewModel()
		{
			object obj = Application.Current.FindResource((object)"userDefauleIcon");
			base.Icon = ((obj is BitmapImage) ? obj : null);
			object obj2 = Application.Current.FindResource((object)"userLogoutMouseover");
			base.MouseOverIcon = ((obj2 is BitmapImage) ? obj2 : null);
			base.Header = "K2175";
		}

		public override void ClickCommandHandler(object e)
		{
			OpenUserProfile();
		}

		public static async void OpenUserProfile()
		{
			if (!(await MainWindowViewModel.SingleInstance.IsExecuteWork()))
			{
				UserProfileView view = new UserProfileView();
				await MessageWindowHelper.Instance.Show(view, true);
			}
		}
	}
	public class DeviceListMenuItemViewModel : MouseOverMenuItemViewModel
	{
		public DeviceListMenuItemViewModel()
		{
			object obj = Application.Current.FindResource((object)"fileDrawingImage");
			base.Icon = ((obj is DrawingImage) ? obj : null);
			object obj2 = Application.Current.FindResource((object)"fileDrawingImage_mouseover");
			base.MouseOverIcon = ((obj2 is DrawingImage) ? obj2 : null);
			base.Header = "K0705";
		}

		public override void ClickCommandHandler(object e)
		{
			if (!lenovo.mbg.service.lmsa.Login.Business.PermissionService.Single.CheckPermission(UserService.Single.CurrentLoggedInUser.UserId, "10", "1"))
			{
				RegisterDevView registerDevView = new RegisterDevView("K0705", IsOnlySel: false);
				registerDevView.IsExistRegistedDev();
				MessageWindowHelper.Instance.Show(registerDevView, true);
			}
		}
	}
	public class LogoutMenuItemViewModel : MouseOverMenuItemViewModel
	{
		public LogoutMenuItemViewModel()
		{
			object obj = Application.Current.FindResource((object)"userLogoutNormal");
			base.Icon = ((obj is BitmapImage) ? obj : null);
			object obj2 = Application.Current.FindResource((object)"userLogoutMouseover");
			base.MouseOverIcon = ((obj2 is BitmapImage) ? obj2 : null);
			base.Header = "K0019";
		}

		public override void ClickCommandHandler(object e)
		{
			LogOut(force: false);
		}

		public static async void LogOut(bool force)
		{
			bool flag = !force;
			bool flag2 = flag;
			if (flag2)
			{
				flag2 = await MainWindowViewModel.SingleInstance.IsExecuteWork();
			}
			if (!flag2)
			{
				UserService.Single.Dispose();
				UserService.Single.Logout(delegate
				{
				});
				WebApiContext.GUID = Guid.NewGuid().ToString();
				global::Smart.DeviceManagerEx.Dispose();
				DeviceConnectViewModel.Instance.Reset();
				Application.Current.MainWindow = (Window)(object)new SplashScreenWindow();
				((Window)ApplcationClass.ApplcationStartWindow).Close();
				Application.Current.MainWindow.Show();
				MainWindowViewModel.SingleInstance.PluginArr.Clear();
				Configurations.ResetRescueResultMap();
				MessageWindowHelper.Instance.Dispose();
				WebView2Helper.Instance.DisposeAll();
				ViewContext.Reset();
				AppContext.IsLogIn = false;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.Login.Business
{
	public class GuestLogin : IUserLoginHandler
	{
		public ResponseData<LoggingInResponseData> Login(UserLoginFormData data)
		{
			LogHelper.LogInstance.Debug("guest login start");
			JObject jObject = new JObject();
			data.UserSource = "guest";
			jObject.Add("accountId", data.UserData);
			ResponseData<LoggingInResponseData> responseData = WebServiceProxy.SingleInstance.GuestLogin(jObject);
			LogHelper.LogInstance.Debug("guest login response: " + JsonHelper.SerializeObject2Json(responseData));
			LogHelper.LogInstance.Debug("guest login end");
			return responseData;
		}

		public void Logout(Action AfterLogoutCall)
		{
		}

		Task IUserLoginHandler.Logout(Action AfterLogoutCall)
		{
			throw new NotImplementedException();
		}
	}
	public class OnlineUserChangingEventArgs : EventArgs
	{
		public DateTime Timestamp { get; private set; }

		public bool IsLoggingIn { get; private set; }

		public string UserSource { get; private set; }

		public OnlineUserChangingEventArgs(string userSource, bool isLoggingIn, DateTime timestamp)
		{
			Timestamp = timestamp;
			UserSource = userSource;
			IsLoggingIn = isLoggingIn;
		}
	}
	public class LenovoIdUserLogin : IUserLoginHandler
	{
		private static System.Timers.Timer m_timer;

		public ResponseData<LoggingInResponseData> Login(UserLoginFormData userInfo)
		{
			if (string.IsNullOrEmpty(userInfo.UserData))
			{
				return new ResponseData<LoggingInResponseData>
				{
					Code = "FAILED"
				};
			}
			ResponseModel<LoggingInResponseData> responseModel = AppContext.WebApi.Request<LoggingInResponseData>(WebApiUrl.LENOVOID_LOGIN_CALLBACK, null, 3, null, HttpMethod.GET);
			ResponseData<LoggingInResponseData> responseData = new ResponseData<LoggingInResponseData>
			{
				Code = responseModel.code
			};
			if (responseModel != null && responseModel.code == "0000")
			{
				if (m_timer != null)
				{
					m_timer.Stop();
					m_timer = null;
				}
				m_timer = new System.Timers.Timer(1200000.0);
				m_timer.Elapsed += OnTimedEvent;
				m_timer.Start();
				OnTimedEvent(null, null);
				responseData.Data = responseModel.content;
				LogHelper.LogInstance.Info("get lenovo account info successed");
			}
			else
			{
				responseData.Data = new LoggingInResponseData();
				LogHelper.LogInstance.Info("get lenovo account info failed");
			}
			responseData.Data.IsLenovoId = true;
			return responseData;
		}

		private void OnTimedEvent(object source, ElapsedEventArgs e)
		{
			using PipeClientService pipeClientService = new PipeClientService();
			pipeClientService.Create(5000);
			pipeClientService.Send(PipeMessage.LMSA_DATA, WebApiContext.REQUEST_AUTHOR_HEADERS);
		}

		public void LoginOutOAuto()
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected O, but got Unknown
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Expected O, but got Unknown
			HttpClient val = new HttpClient();
			try
			{
				Uri uri = new Uri(WebApiUrl.TOKEN_URL);
				string leftPart = uri.GetLeftPart(UriPartial.Authority);
				FormUrlEncodedContent val2 = new FormUrlEncodedContent((IEnumerable<KeyValuePair<string, string>>)new KeyValuePair<string, string>[2]
				{
					new KeyValuePair<string, string>("access_token", WebApiUrl.LOGIN_TOKEN),
					new KeyValuePair<string, string>("post_logout_redirect_uri", leftPart + "/Tips/lenovoIdSuccess.html")
				});
				HttpResponseMessage result = val.PostAsync(leftPart + "/v1.0/utility/lenovoid/oauth2/logout", (HttpContent)(object)val2).Result;
				string result2 = result.Content.ReadAsStringAsync().Result;
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		public async Task Logout(Action AfterLogoutCall)
		{
			m_timer.Stop();
			m_timer = null;
			string logouturl = "https://passport.lenovo.com/wauthen5/gateway?lenovoid.action=uilogout&lenovoid.realm=lmsaclient";
			WebView2 webView2 = new WebView2();
			await Task.Run(async delegate
			{
				await WebView2Helper.Instance.LoadUrl(webView2, logouturl, null);
				AfterLogoutCall?.Invoke();
			});
		}
	}
	public class LmsaUserLogin : IUserLoginHandler
	{
		public ResponseData<LoggingInResponseData> Login(UserLoginFormData data)
		{
			ResponseData<LoggingInResponseData> responseData = null;
			LogHelper.LogInstance.Debug("lmsa user login start");
			if (!string.IsNullOrEmpty(data.UserData))
			{
				if (JsonConvert.DeserializeObject(data.UserData, typeof(LmsaUserLoginFormData)) is LmsaUserLoginFormData data2)
				{
					responseData = WebServiceProxy.SingleInstance.Login(data2);
				}
				LogHelper.LogInstance.Debug("lmsa user login response: " + JsonHelper.SerializeObject2Json(responseData));
			}
			LogHelper.LogInstance.Debug("lmsa user login end");
			return responseData;
		}

		public Task Logout(Action AfterLogoutCall)
		{
			throw new NotImplementedException();
		}
	}
	public class LoginHandlerFacory
	{
		public static IUserLoginHandler CreateLoginHandler(string userSource)
		{
			if (!(userSource == "lenovoId"))
			{
				if (userSource == "lmsa")
				{
					LogHelper.LogInstance.Info("Create lmsa login handler");
					return new LmsaUserLogin();
				}
				LogHelper.LogInstance.Info("Create guest login handler");
				return new GuestLogin();
			}
			LogHelper.LogInstance.Info("Create lenovo id login handler");
			return new LenovoIdUserLogin();
		}
	}
	public interface IUserLoginHandler
	{
		ResponseData<LoggingInResponseData> Login(UserLoginFormData data);

		Task Logout(Action AfterLogoutCall);
	}
	public class PermissionService
	{
		private static PermissionService single;

		private readonly Dictionary<string, List<UserPermissionResponseData>> mPermissionList;

		private static readonly object mPermissionListLock = new object();

		public static PermissionService Single
		{
			get
			{
				if (single == null)
				{
					lock (mPermissionListLock)
					{
						if (single == null)
						{
							single = new PermissionService();
						}
					}
				}
				return single;
			}
		}

		private PermissionService()
		{
			mPermissionList = new Dictionary<string, List<UserPermissionResponseData>>();
		}

		public List<UserPermissionResponseData> GetPermission(string userId, string parentId)
		{
			lock (mPermissionListLock)
			{
				string key = userId + "#" + parentId;
				if (!mPermissionList.ContainsKey(key))
				{
					ResponseData<List<UserPermissionResponseData>> permission = WebServiceProxy.SingleInstance.GetPermission(new Dictionary<string, string> { { "privId", parentId } });
					if (string.Compare("0000", permission.Code) == 0)
					{
						mPermissionList[key] = permission.Data;
					}
					else
					{
						mPermissionList[key] = new List<UserPermissionResponseData>();
					}
					return mPermissionList[key];
				}
				return mPermissionList[key];
			}
		}

		public bool CheckPermission(string userId, string permissionId, string parentId)
		{
			List<UserPermissionResponseData> permission = GetPermission(userId, parentId);
			return permission.Exists((UserPermissionResponseData m) => string.Compare(permissionId, m.PrivId) == 0);
		}

		public void Start()
		{
			lock (mPermissionListLock)
			{
				mPermissionList.Clear();
			}
		}

		public void Stop()
		{
			lock (mPermissionListLock)
			{
				mPermissionList.Clear();
			}
		}
	}
	public sealed class VerificationCodeFactory
	{
		public static char[] PredefinedExceptChars = new char[3] { 'O', 'o', '\0' };

		public static List<string> CeateNewCode(int targetLength, char[] exceptChars)
		{
			List<string> list = new List<string>(targetLength);
			Random random = new Random(DateTime.Now.Millisecond);
			int num = 0;
			int num2 = 0;
			char value = ' ';
			while (num < targetLength)
			{
				switch (random.Next(0, 3))
				{
				case 0:
					value = (char)random.Next(48, 58);
					break;
				case 1:
					value = (char)random.Next(65, 91);
					break;
				case 2:
					value = (char)random.Next(97, 123);
					break;
				}
				if (exceptChars != null && !Enumerable.Contains(exceptChars, value))
				{
					num++;
					list.Add(value.ToString());
				}
			}
			return list;
		}
	}
	public class CountrySources
	{
		private static readonly List<string> mCountrys;

		static CountrySources()
		{
			mCountrys = new List<string>
			{
				"Algeria", "Angola", "Argentina", "Belgium", "Australia", "Austria", "Bahrain", "Bangladesh", "Belarus", "Benin",
				"Bolivia", "Botswana", "Brazil", "Bulgaria", "Burkina", "Burundi", "Cameroon", "Canada", "Cape Verde", "Central African Republic",
				"Central America", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo, Dem. Rep. (Kinshasa)", "Congo, Rep. (Brazzaville)", "Cote d'Ivoire", "Croatia",
				"Czech Republic", "Denmark", "Deutschland", "Djibouti", "Ecuador", "Egypt", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia",
				"Finland", "France", "Gabon", "The Gambia", "Germany", "Ghana", "Greece", "Guinea", "Guinea-Bissau", "Hong Kong S.A.R. of China",
				"Hungary", "India", "Indonesia", "Ireland", "Israel", "Italy", "Japan", "Jordan", "Kazakhstan", "Kenya",
				"Korea", "Kuwait", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Lithuania", "Macedonia", "Madagascar",
				"Malawi", "Malaysia", "Mali", "Mauritania", "Mauritius", "Mexico", "Moldova", "Morocco", "Mozambique", "Myanmar",
				"Namibia", "Netherlands", "New Zealand", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Paraguay", "Peru",
				"Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russian Federation", "Rwanda", "Réunion", "Saint Helena", "Saudi Arabia",
				"Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Somalia", "South Africa", "South Sudan",
				"Spain", "Sri Lanka", "Sudan", "Swaziland", "Sweden", "Switzerland", "São Tomé and Príncipe", "Taiwan Region", "Tanzania", "Thailand",
				"Togo", "Tunisia", "Turkey", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Venezuela",
				"Vietnam", "Western Sahara", "Zambia", "Zimbabwe"
			};
			mCountrys.Sort();
		}

		public List<string> GetCountrys()
		{
			return mCountrys;
		}
	}
	public class OnlineUserChangedEventArgs : EventArgs
	{
		public DateTime Timestamp { get; private set; }

		public bool IsOnline { get; private set; }

		public OnlineUserInfo UserInfo { get; private set; }

		public UserLoginFormData UserLoginFormData { get; private set; }

		public OnlineUserChangedEventArgs(OnlineUserInfo userInfo, UserLoginFormData formData, bool isOnline, DateTime timestamp)
		{
			Timestamp = timestamp;
			IsOnline = isOnline;
			UserInfo = userInfo;
			UserLoginFormData = formData;
		}
	}
	public class UserPermission
	{
		public string Id { get; set; }

		public string PId { get; set; }
	}
	public class UserService : IDisposable
	{
		private static UserService single;

		private volatile bool mIsOnlie = false;

		private readonly object mCurrentOnlineUserChangingEventArgsLock = new object();

		private OnlineUserChangingEventArgs mCurrentOnlineUserChangingEventArgs;

		private OnlineUserChangedEventArgs mCurrentOnlineUserChangedEventArgs;

		private readonly object mCurrentOnlineUserChangedEventArgsLock = new object();

		public static UserService Single
		{
			get
			{
				if (single == null)
				{
					single = new UserService();
				}
				return single;
			}
		}

		public string UserSource { get; protected set; }

		public bool IsOnline => mIsOnlie;

		public OnlineUserInfo CurrentLoggedInUser { get; set; }

		private event EventHandler<OnlineUserChangingEventArgs> mOnlineUserChanging;

		public event EventHandler<OnlineUserChangingEventArgs> OnlineUserChanging
		{
			add
			{
				mOnlineUserChanging += value;
				lock (mCurrentOnlineUserChangingEventArgsLock)
				{
					if (mCurrentOnlineUserChangedEventArgs != null)
					{
						value.BeginInvoke(this, mCurrentOnlineUserChangingEventArgs, null, null);
					}
				}
			}
			remove
			{
				mOnlineUserChanging -= value;
			}
		}

		private event EventHandler<OnlineUserChangedEventArgs> mOnlineUserChanged;

		public event EventHandler<OnlineUserChangedEventArgs> OnlineUserChanged
		{
			add
			{
				mOnlineUserChanged += value;
				lock (mCurrentOnlineUserChangedEventArgsLock)
				{
					if (mCurrentOnlineUserChangedEventArgs != null)
					{
						value.BeginInvoke(this, mCurrentOnlineUserChangedEventArgs, null, null);
					}
				}
			}
			remove
			{
				mOnlineUserChanged -= value;
			}
		}

		private UserService()
		{
		}

		public ResponseData<LoggingInResponseData> Login(UserLoginFormData data, Window win)
		{
			LogHelper.LogInstance.Info("rsa login method entered");
			UserSource = data.UserSource;
			FireOnlineUserChangingEvent(this, new OnlineUserChangingEventArgs(data.UserSource, isLoggingIn: true, DateTime.Now));
			IUserLoginHandler userLoginHandler = LoginHandlerFacory.CreateLoginHandler(data.UserSource);
			ResponseData<LoggingInResponseData> responseData = userLoginHandler.Login(data);
			if (mIsOnlie = responseData != null && string.Compare("0000", responseData.Code) == 0)
			{
				AppContext.IsLogIn = true;
				LogHelper.LogInstance.Info("rsa login success");
				OnlineUserInfo onlineUserInfo = new OnlineUserInfo();
				onlineUserInfo.UserName = responseData.Data.Name;
				onlineUserInfo.EmailAddress = responseData.Data.EmailAddress;
				onlineUserInfo.UserId = responseData.Data.UserId;
				onlineUserInfo.Country = responseData.Data.Country;
				onlineUserInfo.FullName = data.UserData;
				onlineUserInfo.PhoneNumber = responseData.Data.PhoneNumber;
				onlineUserInfo.UserSource = data.UserSource;
				onlineUserInfo.quitSurvey = responseData.Data.quitSurvey;
				onlineUserInfo.failureNum = responseData.Data.failureNum;
				onlineUserInfo.config = responseData.Data.dictionary;
				if (responseData.Data.dictionary.ContainsKey("MIN_MA_SUPPORT_VERSION"))
				{
					int num = Convert.ToInt32(responseData.Data.dictionary["MIN_MA_SUPPORT_VERSION"]);
					if (num > Configurations.AppMinVersionCodeOfMA)
					{
						Configurations.AppMinVersionCodeOfMA = num;
					}
				}
				if (responseData.Data.dictionary.ContainsKey("TURN_ON_NOTICE"))
				{
					onlineUserInfo.IsRtNotify = responseData.Data.dictionary["TURN_ON_NOTICE"].ToString() == "Y";
				}
				else
				{
					onlineUserInfo.IsRtNotify = false;
				}
				onlineUserInfo.IsB2BSupportMultDev = responseData.Data.B2bUsrInfo?.IsMultiDev ?? false;
				onlineUserInfo.B2BBuyNowDisplay = responseData.Data.B2bCountry && GetB2BBuyNowButtonDisplay(onlineUserInfo.UserId);
				onlineUserInfo.B2BEntranceEnable = responseData.Data.B2bUsrInfo?.B2bButtonDisplay ?? false;
				CurrentLoggedInUser = onlineUserInfo;
				global::Smart.BehaviorService.InitUser(onlineUserInfo.UserName);
				FireOnlineUserChangedEvent(this, new OnlineUserChangedEventArgs(CurrentLoggedInUser, data, mIsOnlie, DateTime.Now));
				Task.Run(delegate
				{
					GetB2bPrice();
				});
			}
			else
			{
				if (data.UserSource == "guest")
				{
					MessageWindowHelper.Instance.Show(null, "Guest user expire", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true).Wait();
				}
				LogHelper.LogInstance.Info("rsa login failed");
				UserSource = string.Empty;
				OnlineUserInfo userInfo = (CurrentLoggedInUser = null);
				FireOnlineUserChangedEvent(this, new OnlineUserChangedEventArgs(userInfo, data, mIsOnlie, DateTime.Now));
			}
			Single.OnlineUserChanged += Temp_OnlineUserChanged;
			if (!string.IsNullOrEmpty(responseData?.Data?.RSANotification))
			{
				string notification = Regex.Unescape(responseData.Data.RSANotification);
				LoginNotificationDialog(notification, win);
			}
			return responseData;
		}

		public void GetB2bPrice()
		{
			try
			{
				string empty = string.Empty;
				List<PriceInfo> list = AppContext.WebApi.RequestContent<List<PriceInfo>>(WebApiUrl.CALL_B2B_GET_PRICE_URL, null, 3, null, HttpMethod.GET);
				if (list != null && list.Count >= 3)
				{
					PriceInfo priceInfo = list[0] ?? new PriceInfo
					{
						monetaryUnit = "$",
						price = 1.99f,
						sku = "sku1"
					};
					PriceInfo priceInfo2 = list[1] ?? new PriceInfo
					{
						monetaryUnit = "$",
						price = 17.99f,
						sku = "sku2"
					};
					PriceInfo priceInfo3 = list[2] ?? new PriceInfo
					{
						monetaryUnit = "$",
						price = 49.99f,
						sku = "sku3"
					};
					CurrentLoggedInUser.PriceUnit = priceInfo.monetaryUnit;
					CurrentLoggedInUser.Price1 = priceInfo.price;
					CurrentLoggedInUser.Price2 = priceInfo2.price;
					CurrentLoggedInUser.Price3 = priceInfo3.price;
					CurrentLoggedInUser.SkuName1 = priceInfo.sku;
					CurrentLoggedInUser.SkuName2 = priceInfo2.sku;
					CurrentLoggedInUser.SkuName3 = priceInfo3.sku;
				}
				else
				{
					CurrentLoggedInUser.PriceUnit = "$";
					CurrentLoggedInUser.Price1 = 1.99f;
					CurrentLoggedInUser.Price2 = 17.99f;
					CurrentLoggedInUser.Price3 = 49.99f;
					CurrentLoggedInUser.SkuName1 = "sku1";
					CurrentLoggedInUser.SkuName2 = "sku2";
					CurrentLoggedInUser.SkuName3 = "sku3";
				}
			}
			catch (Exception)
			{
			}
		}

		private void Temp_OnlineUserChanged(object sender, OnlineUserChangedEventArgs e)
		{
			if (e.IsOnline)
			{
				LatestLoginUserInfo latestLoginUserInfo = new LatestLoginUserInfo();
				latestLoginUserInfo.UserName = e.UserInfo.UserName;
				latestLoginUserInfo.Password = string.Empty;
				latestLoginUserInfo.UserID = e.UserInfo.UserId;
				latestLoginUserInfo.LoginFormData = e.UserLoginFormData;
				latestLoginUserInfo.email = e.UserInfo.EmailAddress;
				latestLoginUserInfo.phone = e.UserInfo.PhoneNumber;
				latestLoginUserInfo.config = e.UserInfo.config;
				string value = JsonConvert.SerializeObject(latestLoginUserInfo);
				Single.AddOrUpdateLoginSetting(LatestLoginUserInfo.TAG, value);
			}
		}

		public void AutoLoginIfNeed(Action<Window> callBack)
		{
			if ("TRUE".Equals(GetLoginSetting("AutoLogin")))
			{
				LogHelper.LogInstance.Info("Curent user will auto login by lenovo_id.");
				HostProxy.CurrentDispatcher.BeginInvoke((Delegate)(Action)delegate
				{
					LenovoIdWindow.ShowDialogEx(isRegister: false, callBack);
				}, Array.Empty<object>());
			}
			else
			{
				callBack(null);
				LogHelper.LogInstance.Info("System not set auto login.");
			}
		}

		private void LoginNotificationDialog(string _notification, Window win)
		{
			MessageWindowHelper.Instance.Show(null, _notification, "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true).Wait();
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				Window obj = win;
				if (obj != null)
				{
					obj.Close();
				}
				LenovoIdWindow.ShowDialogEx();
			});
		}

		public ResponseData<LoggingInResponseData> VerifyPassword(LmsaUserLoginFormData data)
		{
			return WebServiceProxy.SingleInstance.PasswordVerify(data);
		}

		public void Logout(Action AfterCallback)
		{
			mIsOnlie = false;
			FireOnlineUserChangingEvent(this, new OnlineUserChangingEventArgs(CurrentLoggedInUser.UserSource, isLoggingIn: false, DateTime.Now));
			IUserLoginHandler userLoginHandler = LoginHandlerFacory.CreateLoginHandler(CurrentLoggedInUser.UserSource);
			userLoginHandler.Logout(AfterCallback);
			OnlineUserInfo currentLoggedInUser = CurrentLoggedInUser;
			if (CurrentLoggedInUser.UserId != null)
			{
				LogoutReport(null);
			}
			CurrentLoggedInUser = null;
			global::Smart.BehaviorService.InitUser(null);
			FireOnlineUserChangedEvent(this, new OnlineUserChangedEventArgs(currentLoggedInUser, null, mIsOnlie, DateTime.Now));
			FileHelper.WriteJsonWithAesEncrypt(Configurations.DefaultOptionsFileName, "AutoLogin", false);
		}

		public ResponseData<ChangePasswordResponseData> ChangePassword(ChangePasswordFormData data)
		{
			return WebServiceProxy.SingleInstance.ChangePassowrd(data);
		}

		public ResponseData<ForgotPasswordResponseData> ForgotPassowrd(ForgotPasswordFormData data)
		{
			return WebServiceProxy.SingleInstance.ForgotPassowrd(data);
		}

		public ResponseData<LogoutReportResponseData> LogoutReport(LogoutReportFormData data)
		{
			return WebServiceProxy.SingleInstance.LogoutReport(data);
		}

		private void FireOnlineUserChangingEvent(object sender, OnlineUserChangingEventArgs e)
		{
			lock (mCurrentOnlineUserChangingEventArgsLock)
			{
				mCurrentOnlineUserChangingEventArgs = e;
			}
			if (this.mOnlineUserChanging != null)
			{
				Delegate[] invocationList = this.mOnlineUserChanging.GetInvocationList();
				for (int num = invocationList.Count() - 1; num >= 0; num--)
				{
					((EventHandler<OnlineUserChangingEventArgs>)invocationList[num]).BeginInvoke(sender, e, null, null);
				}
			}
		}

		private void FireOnlineUserChangedEvent(object sender, OnlineUserChangedEventArgs e)
		{
			lock (mCurrentOnlineUserChangedEventArgsLock)
			{
				mCurrentOnlineUserChangedEventArgs = e;
			}
			UserInfo userInfo = null;
			if (e.IsOnline && e.UserInfo != null)
			{
				userInfo = new UserInfo();
				userInfo.UserName = e.UserInfo.UserName;
				userInfo.EmailAddress = e.UserInfo.EmailAddress;
				userInfo.Country = e.UserInfo.Country;
				userInfo.FullName = e.UserInfo.FullName;
				userInfo.PhoneNumber = e.UserInfo.PhoneNumber;
				userInfo.UserId = e.UserInfo.UserId;
				userInfo.Config = e.UserInfo.config;
				userInfo.IsB2BSupportMultDev = e.UserInfo.IsB2BSupportMultDev;
			}
			global::Smart.User.FireUserChanged(new UserInfoArgs(userInfo, e.IsOnline));
			if (this.mOnlineUserChanged != null)
			{
				Delegate[] invocationList = this.mOnlineUserChanged.GetInvocationList();
				for (int num = invocationList.Count() - 1; num >= 0; num--)
				{
					((EventHandler<OnlineUserChangedEventArgs>)invocationList[num]).BeginInvoke(sender, e, null, null);
				}
			}
		}

		public void Dispose()
		{
			EventHandler<OnlineUserChangedEventArgs> eventHandler = this.mOnlineUserChanged;
			if (this.mOnlineUserChanged != null)
			{
				Delegate[] invocationList = this.mOnlineUserChanged.GetInvocationList();
				Delegate[] array = invocationList;
				for (int i = 0; i < array.Length; i++)
				{
					EventHandler<OnlineUserChangedEventArgs> value = (EventHandler<OnlineUserChangedEventArgs>)array[i];
					mOnlineUserChanged -= value;
				}
			}
		}

		public bool AddOrUpdateLoginSetting(string key, object value)
		{
			try
			{
				FileHelper.WriteJsonWithAesEncrypt(Configurations.DefaultOptionsFileName, key, value);
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public bool AddOrUpdateAgreePolicySetting(string key, object value)
		{
			try
			{
				FileHelper.WriteJsonWithAesEncrypt(Configurations.DefaultOptionsFileName, key, value);
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public string GetLoginSetting(string key)
		{
			string empty = string.Empty;
			switch (key)
			{
			case "AutoLogin":
				empty = FileHelper.ReadWithAesDecrypt(Configurations.DefaultOptionsFileName, "AutoLogin");
				if (!string.IsNullOrEmpty(empty))
				{
					return empty.ToUpper();
				}
				return "FALSE";
			case "SavePassword":
				empty = FileHelper.ReadWithAesDecrypt(Configurations.DefaultOptionsFileName, "SavePassword");
				if (!string.IsNullOrEmpty(empty))
				{
					return empty.ToUpper();
				}
				return "FALSE";
			case "AgreePolicy":
				empty = FileHelper.ReadWithAesDecrypt(Configurations.DefaultOptionsFileName, "AgreePolicy");
				if (!string.IsNullOrEmpty(empty))
				{
					return empty.ToUpper();
				}
				return "FALSE";
			default:
				return "UNKNOWN";
			}
		}

		public bool GetB2BBuyNowButtonDisplay(string _userId)
		{
			string value = FileHelper.ReadWithAesDecrypt(Configurations.DefaultOptionsFileName, "B2BBuyNowButtonDisplay_" + _userId);
			if (!string.IsNullOrEmpty(value))
			{
				return Convert.ToBoolean(value);
			}
			return false;
		}

		public void SaveB2BBuyNowButtonDisplay()
		{
			CurrentLoggedInUser.B2BBuyNowDisplay = true;
			FileHelper.WriteJsonWithAesEncrypt(Configurations.DefaultOptionsFileName, "B2BBuyNowButtonDisplay_" + CurrentLoggedInUser.UserId, true);
		}
	}
}
namespace lenovo.mbg.service.lmsa.Login.Business.FormVerify
{
	public class CountryVerify : IFormVerify
	{
		public VerifyResult Verify(object data)
		{
			VerifyResult verifyResult = new VerifyResult();
			if (data == null || string.IsNullOrWhiteSpace(data.ToString()))
			{
				verifyResult.IsCorrect = false;
				verifyResult.WraningCode = 1;
				verifyResult.WraningContent = "K0041";
				return verifyResult;
			}
			verifyResult.WraningCode = 2;
			verifyResult.IsCorrect = true;
			return verifyResult;
		}
	}
	public class UserNameVerify : IFormVerify
	{
		public VerifyResult Verify(object data)
		{
			VerifyResult verifyResult = new VerifyResult();
			string empty = string.Empty;
			if (data == null || string.IsNullOrWhiteSpace(empty = data.ToString()))
			{
				verifyResult.IsCorrect = false;
				verifyResult.WraningCode = 1;
				verifyResult.WraningContent = "K0041";
				return verifyResult;
			}
			verifyResult.WraningCode = 2;
			verifyResult.IsCorrect = true;
			return verifyResult;
		}
	}
}
namespace lenovo.mbg.service.lmsa.GlobalCache
{
	public class GlobalCacheService : IGlobalCache
	{
		private readonly ConcurrentDictionary<string, object> cache = new ConcurrentDictionary<string, object>();

		public object Get(string key)
		{
			object value;
			if (cache.ContainsKey(key))
			{
				cache.TryGetValue(key, out value);
				return value;
			}
			Init(key);
			cache.TryGetValue(key, out value);
			return value;
		}

		public object AddOrUpdate(string key, object value)
		{
			object result = cache.AddOrUpdate(key, value, (string k, object old) => value);
			if (key == "BackupRestoreHasFailed")
			{
				Task.Run(delegate
				{
					try
					{
						using PipeClientService pipeClientService = new PipeClientService();
						Dictionary<string, object> dictionary = HostProxy.User.user.Config;
						if (dictionary == null)
						{
							dictionary = new Dictionary<string, object>();
						}
						dictionary.Add(key, value);
						pipeClientService.Create(5000);
						pipeClientService.Send(PipeMessage.LMSA_DATA, JsonHelper.SerializeObject2Json(dictionary));
					}
					catch
					{
						LogHelper.LogInstance.Debug("send backuprestore failed pipe message failed");
					}
				});
			}
			return result;
		}

		private void Init(string key)
		{
			if (key == "countrySupportedMoliLenaList")
			{
				LoadMoliLenaConfig(key);
			}
		}

		private void LoadMoliLenaConfig(string key)
		{
			var aparams = new
			{
				country = GlobalFun.GetRegionInfo().TwoLetterISORegionName
			};
			ResponseModel<object> responseModel = AppContext.WebApi.RequestBase(WebApiUrl.MOLI_INFO, aparams);
			if (responseModel.code == "0000")
			{
				AddOrUpdate(key, responseModel.content);
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.Feedback.View
{
	public class FeedbackListViewV6 : Window, IMessageWindowV6, IComponentConnector, IStyleConnector
	{
		private Regex regex = new Regex("([&<>\"'\\\\\\/\\u2026])");

		internal Border bdInvid;

		internal TextBox txtComments;

		internal LangButton btnReply;

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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public FeedbackListViewV6()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Closed += delegate
			{
				Result = false;
			};
		}

		private void ListBox_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Expected O, but got Unknown
			ScrollViewer val = (ScrollViewer)sender;
			val.ScrollToVerticalOffset(val.VerticalOffset - (double)e.Delta);
			((RoutedEventArgs)e).Handled = true;
		}

		private void CloseBtnClick(object sender, RoutedEventArgs e)
		{
			Result = false;
			((Window)this).Close();
		}

		private void TxtCommentsTextChanged(object sender, TextChangedEventArgs e)
		{
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cb: Expected O, but got Unknown
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_0077: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Expected O, but got Unknown
			((UIElement)btnReply).IsEnabled = !string.IsNullOrWhiteSpace(txtComments.Text);
			if (regex.IsMatch(txtComments.Text))
			{
				((UIElement)bdInvid).Visibility = (Visibility)0;
				((Control)txtComments).BorderThickness = new Thickness(1.0);
				((Control)txtComments).BorderBrush = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#EE4848"));
				((UIElement)btnReply).IsEnabled = false;
			}
			else
			{
				((Control)txtComments).BorderThickness = new Thickness(1.0);
				((Control)txtComments).BorderBrush = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#6D86AB"));
				((UIElement)bdInvid).Visibility = (Visibility)2;
			}
		}

		private void ImgContentPreviewMouseDown(object sender, MouseButtonEventArgs e)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			string path = ((FrameworkElement)(Image)sender).Tag.ToString();
			string text = Path.Combine(Path.GetTempPath(), "feedback_img_" + Path.GetFileName(path));
			if (File.Exists(text))
			{
				Process.Start(text);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/feedback/view/feedbacklistviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Expected O, but got Unknown
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Expected O, but got Unknown
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Expected O, but got Unknown
			switch (connectionId)
			{
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(CloseBtnClick);
				break;
			case 3:
				bdInvid = (Border)target;
				break;
			case 4:
				txtComments = (TextBox)target;
				((TextBoxBase)txtComments).TextChanged += new TextChangedEventHandler(TxtCommentsTextChanged);
				break;
			case 5:
				btnReply = (LangButton)target;
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
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			if (connectionId == 1)
			{
				((UIElement)(Image)target).PreviewMouseDown += new MouseButtonEventHandler(ImgContentPreviewMouseDown);
			}
		}
	}
	public class FeedbackListView : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public FeedbackListView()
		{
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected O, but got Unknown
			InitializeComponent();
			((FrameworkElement)this).Loaded += new RoutedEventHandler(FeedbackListView_Loaded);
		}

		private void FeedbackListView_Loaded(object sender, RoutedEventArgs e)
		{
		}

		private void ListBox_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Expected O, but got Unknown
			ScrollViewer val = (ScrollViewer)sender;
			val.ScrollToVerticalOffset(val.VerticalOffset - (double)e.Delta);
			((RoutedEventArgs)e).Handled = true;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/feedback/view/feedbacklistview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			if (connectionId == 1)
			{
				((UIElement)(ScrollViewer)target).PreviewMouseWheel += new MouseWheelEventHandler(ListBox_PreviewMouseWheel);
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class FeedbackMainView : Window, IMessageWindowV6, IComponentConnector
	{
		private Regex regex = new Regex("([&<>\\\\\\/])");

		internal Border bdInvid;

		internal Border bdComments;

		internal TipsTextBox txtComments;

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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public FeedbackMainView(bool isMainWindowLoad = true)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Owner = Application.Current.MainWindow;
			((FrameworkElement)this).DataContext = new FeedbackMainViewModelV6((Window)(object)this, isMainWindowLoad);
		}

		protected override void OnClosed(EventArgs e)
		{
			Result = false;
			((Window)this).OnClosed(e);
		}

		private void OnPreviewTextInput(object sender, TextCompositionEventArgs e)
		{
			((RoutedEventArgs)e).Handled = Regex.IsMatch(e.Text, "[/,<,>,|,:,?,*,\\\\,\"]");
		}

		private void OnPreviewExecuted(object sender, ExecutedRoutedEventArgs e)
		{
			if (e.Command == ApplicationCommands.Paste)
			{
				string text = Clipboard.GetText();
				((RoutedEventArgs)e).Handled = Regex.IsMatch(text, "[/,<,>,|,:,?,*,\\\\,\"]");
			}
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			GlobalFun.OpenUrlByBrowser("www.lenovo.com/privacy/");
		}

		public Window GetMsgUi()
		{
			return (Window)(object)this;
		}

		private void TipsTextBox_TextChanged(object sender, TextChangedEventArgs e)
		{
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_008b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Expected O, but got Unknown
			//IL_0188: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_01bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c2: Unknown result type (might be due to invalid IL or missing references)
			//IL_01cc: Expected O, but got Unknown
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_010e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0129: Unknown result type (might be due to invalid IL or missing references)
			//IL_012e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0138: Expected O, but got Unknown
			if (regex.IsMatch(((TextBox)txtComments).Text))
			{
				((UIElement)bdInvid).Visibility = (Visibility)0;
				bdComments.CornerRadius = new CornerRadius(0.0, 0.0, 4.0, 4.0);
				((Control)txtComments).BorderThickness = new Thickness(1.0);
				bdComments.BorderBrush = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#EE4848"));
				(((FrameworkElement)this).DataContext as FeedbackMainViewModelV6).IsValid = true;
			}
			else if (string.IsNullOrWhiteSpace(((TextBox)txtComments).Text))
			{
				bdComments.CornerRadius = new CornerRadius(0.0, 0.0, 4.0, 4.0);
				((Control)txtComments).BorderThickness = new Thickness(1.0);
				bdComments.BorderBrush = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#EE4848"));
				((UIElement)bdInvid).Visibility = (Visibility)2;
				(((FrameworkElement)this).DataContext as FeedbackMainViewModelV6).IsValid = false;
			}
			else
			{
				bdComments.CornerRadius = new CornerRadius(4.0, 4.0, 4.0, 4.0);
				((Control)txtComments).BorderThickness = new Thickness(1.0);
				bdComments.BorderBrush = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#6D86AB"));
				((UIElement)bdInvid).Visibility = (Visibility)2;
				(((FrameworkElement)this).DataContext as FeedbackMainViewModelV6).IsValid = false;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/feedback/view/feedbackmainview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Expected O, but got Unknown
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				bdInvid = (Border)target;
				break;
			case 2:
				bdComments = (Border)target;
				break;
			case 3:
				txtComments = (TipsTextBox)target;
				((TextBoxBase)txtComments).TextChanged += new TextChangedEventHandler(TipsTextBox_TextChanged);
				break;
			case 4:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class QuestionVisibleConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values == null || values.Length != 2)
			{
				return (object)(Visibility)2;
			}
			string value = values[0] as string;
			bool flag = System.Convert.ToBoolean(values[1]);
			if (!string.IsNullOrEmpty(value) && flag)
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
	public class FeedbackMainViewOnLogin : Window, IMessageWindowV6, IComponentConnector
	{
		private Regex regex = new Regex("([&<>\\\\\\/])");

		internal FeedbackMainViewOnLogin frmWorkstation;

		internal Border bdInvid;

		internal Border bdComments;

		internal TipsTextBox txtComments;

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
			return ExecutePredicate == null || ExecutePredicate(parameter);
		}

		public bool CanClose(object parameter)
		{
			return CanClosePredicate == null || CanClosePredicate(parameter);
		}

		public FeedbackMainViewOnLogin(Window lenovoIdWindow = null, bool isMainWindowLoad = true)
		{
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Expected O, but got Unknown
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Owner = lenovoIdWindow ?? Application.Current.MainWindow;
			((FrameworkElement)this).DataContext = new FeedbackMainViewModelV6((Window)(object)this, isMainWindowLoad);
			((FrameworkElement)this).SizeChanged += (SizeChangedEventHandler)delegate
			{
				CenterToOwner();
			};
		}

		private void CenterToOwner()
		{
			if (((Window)this).Owner != null)
			{
				double actualWidth = ((FrameworkElement)((Window)this).Owner).ActualWidth;
				double actualHeight = ((FrameworkElement)((Window)this).Owner).ActualHeight;
				((FrameworkElement)this).Width = Math.Min(((FrameworkElement)this).ActualWidth, actualWidth);
				((FrameworkElement)this).Height = Math.Min(((FrameworkElement)this).ActualHeight, actualHeight);
				((Window)this).Left = ((Window)this).Owner.Left + (((FrameworkElement)((Window)this).Owner).ActualWidth - ((FrameworkElement)this).ActualWidth) / 2.0;
				((Window)this).Top = ((Window)this).Owner.Top + (((FrameworkElement)((Window)this).Owner).ActualHeight - ((FrameworkElement)this).ActualHeight) / 2.0;
			}
		}

		protected override void OnClosed(EventArgs e)
		{
			Result = false;
			((Window)this).OnClosed(e);
		}

		private void OnPreviewTextInput(object sender, TextCompositionEventArgs e)
		{
			((RoutedEventArgs)e).Handled = Regex.IsMatch(e.Text, "[/,<,>,|,:,?,*,\\\\,\"]");
		}

		private void OnPreviewExecuted(object sender, ExecutedRoutedEventArgs e)
		{
			if (e.Command == ApplicationCommands.Paste)
			{
				string text = Clipboard.GetText();
				((RoutedEventArgs)e).Handled = Regex.IsMatch(text, "[/,<,>,|,:,?,*,\\\\,\"]");
			}
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			GlobalFun.OpenUrlByBrowser("www.lenovo.com/privacy/");
		}

		public Window GetMsgUi()
		{
			return (Window)(object)this;
		}

		private void TipsTextBox_TextChanged(object sender, TextChangedEventArgs e)
		{
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_008b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Expected O, but got Unknown
			//IL_0188: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_01bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c2: Unknown result type (might be due to invalid IL or missing references)
			//IL_01cc: Expected O, but got Unknown
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_010e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0129: Unknown result type (might be due to invalid IL or missing references)
			//IL_012e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0138: Expected O, but got Unknown
			if (regex.IsMatch(((TextBox)txtComments).Text))
			{
				((UIElement)bdInvid).Visibility = (Visibility)0;
				bdComments.CornerRadius = new CornerRadius(0.0, 0.0, 4.0, 4.0);
				((Control)txtComments).BorderThickness = new Thickness(1.0);
				bdComments.BorderBrush = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#EE4848"));
				(((FrameworkElement)this).DataContext as FeedbackMainViewModelV6).IsValid = true;
			}
			else if (string.IsNullOrWhiteSpace(((TextBox)txtComments).Text))
			{
				bdComments.CornerRadius = new CornerRadius(0.0, 0.0, 4.0, 4.0);
				((Control)txtComments).BorderThickness = new Thickness(1.0);
				bdComments.BorderBrush = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#EE4848"));
				((UIElement)bdInvid).Visibility = (Visibility)2;
				(((FrameworkElement)this).DataContext as FeedbackMainViewModelV6).IsValid = false;
			}
			else
			{
				bdComments.CornerRadius = new CornerRadius(4.0, 4.0, 4.0, 4.0);
				((Control)txtComments).BorderThickness = new Thickness(1.0);
				bdComments.BorderBrush = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#6D86AB"));
				((UIElement)bdInvid).Visibility = (Visibility)2;
				(((FrameworkElement)this).DataContext as FeedbackMainViewModelV6).IsValid = false;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/Software Fix;component/feedback/view/feedbackmainviewonlogin.xaml", UriKind.Relative);
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
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Expected O, but got Unknown
			//IL_0066: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Expected O, but got Unknown
			//IL_0080: Unknown result type (might be due to invalid IL or missing references)
			//IL_008a: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				frmWorkstation = (FeedbackMainViewOnLogin)target;
				break;
			case 2:
				bdInvid = (Border)target;
				break;
			case 3:
				bdComments = (Border)target;
				break;
			case 4:
				txtComments = (TipsTextBox)target;
				((TextBoxBase)txtComments).TextChanged += new TextChangedEventHandler(TipsTextBox_TextChanged);
				break;
			case 5:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.Feedback.ViewModel
{
	public class FeedbackModelTemplateSelector : DataTemplateSelector
	{
		public DataTemplate TextTemplate { get; set; }

		public DataTemplate RemakeTemplate { get; set; }

		public DataTemplate ChooseTemplate { get; set; }

		public override DataTemplate SelectTemplate(object item, DependencyObject container)
		{
			QTreeNode qTreeNode = (QTreeNode)item;
			if (qTreeNode == null)
			{
				return null;
			}
			return (DataTemplate)(qTreeNode.Type switch
			{
				"TEXT" => TextTemplate, 
				"REMARK" => RemakeTemplate, 
				"CHOOSE" => ChooseTemplate, 
				_ => null, 
			});
		}
	}
	public class FeedbackItemTemplateSelector : DataTemplateSelector
	{
		public override DataTemplate SelectTemplate(object item, DependencyObject container)
		{
			FrameworkElement val = (FrameworkElement)(object)((container is FrameworkElement) ? container : null);
			if (!(item is FeedbackItemViewModel feedbackItemViewModel) || val == null)
			{
				return null;
			}
			string empty = string.Empty;
			empty = ((!"Q".Equals(feedbackItemViewModel.Type)) ? "feedbackForAnswer" : "feedbackForQuestion");
			object obj = val.FindResource((object)empty);
			return (DataTemplate)((obj is DataTemplate) ? obj : null);
		}
	}
	public class FeedbackSubContentItemViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private string dataType;

		private string content;

		public string DataType
		{
			get
			{
				return dataType;
			}
			set
			{
				if (!(dataType == value))
				{
					dataType = value;
					OnPropertyChanged("DataType");
				}
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
				if (!(content == value))
				{
					content = value;
					OnPropertyChanged("Content");
				}
			}
		}
	}
	public class FeedbackItemViewModel : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private bool isReplay;

		private List<FeedbackSubContentItemViewModel> feedbackContentItmes;

		private string title;

		private DateTime date;

		private long? id;

		private string type;

		private int? helpfulCode;

		private ReplayCommand helpfulCommand;

		private ReplayCommand noHelpfulCommand;

		private DataTemplateSelector dataTemplateSelector = (DataTemplateSelector)(object)new HelpfulTemplateSelector();

		public bool IsReplay
		{
			get
			{
				return isReplay;
			}
			set
			{
				if (isReplay != value)
				{
					isReplay = value;
					OnPropertyChanged("IsReplay");
				}
			}
		}

		public List<FeedbackSubContentItemViewModel> FeedbackContentItmes
		{
			get
			{
				return feedbackContentItmes;
			}
			set
			{
				if (feedbackContentItmes != value)
				{
					feedbackContentItmes = value;
					OnPropertyChanged("FeedbackContentItmes");
				}
			}
		}

		public string Title
		{
			get
			{
				return title;
			}
			set
			{
				if (!(title == value))
				{
					title = value;
					OnPropertyChanged("Title");
				}
			}
		}

		public DateTime Date
		{
			get
			{
				return date;
			}
			set
			{
				if (!(date == value))
				{
					date = value;
					OnPropertyChanged("Date");
				}
			}
		}

		public long? Id
		{
			get
			{
				return id;
			}
			set
			{
				if (id != value)
				{
					id = value;
					OnPropertyChanged("Id");
				}
			}
		}

		public string Type
		{
			get
			{
				return type;
			}
			set
			{
				if (!(type == value))
				{
					type = value;
					OnPropertyChanged("Type");
				}
			}
		}

		public int? HelpfulCode
		{
			get
			{
				return helpfulCode;
			}
			set
			{
				if (helpfulCode != value)
				{
					helpfulCode = value;
					OnPropertyChanged("HelpfulCode");
				}
			}
		}

		public ReplayCommand HelpfulCommand
		{
			get
			{
				return helpfulCommand;
			}
			set
			{
				if (helpfulCommand != value)
				{
					helpfulCommand = value;
					OnPropertyChanged("HelpfulCommand");
				}
			}
		}

		public ReplayCommand NoHelpfulCommand
		{
			get
			{
				return noHelpfulCommand;
			}
			set
			{
				if (noHelpfulCommand != value)
				{
					noHelpfulCommand = value;
					OnPropertyChanged("NoHelpfulCommand");
				}
			}
		}

		public DataTemplateSelector DataTemplateSelector
		{
			get
			{
				return dataTemplateSelector;
			}
			set
			{
				if (dataTemplateSelector != value)
				{
					dataTemplateSelector = value;
					OnPropertyChanged("DataTemplateSelector");
				}
			}
		}

		public FeedbackItemViewModel()
		{
			NoHelpfulCommand = new ReplayCommand(NoHelpfulCommandHandler);
			HelpfulCommand = new ReplayCommand(HelpfulCommandHandler);
		}

		private void HelpfulCommandHandler(object args)
		{
			SubmitHelpfulAsync(1);
		}

		private void NoHelpfulCommandHandler(object args)
		{
			SubmitHelpfulAsync(-1);
		}

		private async void SubmitHelpfulAsync(int helpfulCode)
		{
			if (await new FeedBackBLL().SubmitReplyIsHelpfull(Id, helpfulCode))
			{
				HelpfulCode = helpfulCode;
				DataTemplateSelector = (DataTemplateSelector)(object)new HelpfulTemplateSelector();
			}
		}
	}
	public class FeedbackListViewModelV6 : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private string mComments;

		private ObservableCollection<FeedbackItemViewModel> feedbackItems;

		private string winTitle;

		private ReplayCommand replyCommand;

		private bool logFileIsChecked;

		private bool submitButtonIsEnabled = false;

		public string Comments
		{
			get
			{
				return mComments;
			}
			set
			{
				if (!(mComments == value))
				{
					mComments = value;
					OnPropertyChanged("Comments");
				}
			}
		}

		public FeedBackNodeModel FeedBack { get; set; }

		public ObservableCollection<FeedbackItemViewModel> FeedbackItems
		{
			get
			{
				return feedbackItems;
			}
			set
			{
				if (feedbackItems != value)
				{
					feedbackItems = value;
					OnPropertyChanged("FeedbackItems");
				}
			}
		}

		public string WinTitle
		{
			get
			{
				return winTitle;
			}
			set
			{
				if (!(winTitle == value))
				{
					winTitle = value;
					OnPropertyChanged("WinTitle");
				}
			}
		}

		public ReplayCommand ReplyCommand
		{
			get
			{
				return replyCommand;
			}
			set
			{
				if (replyCommand != value)
				{
					replyCommand = value;
					OnPropertyChanged("ReplyCommand");
				}
			}
		}

		public bool LogFileIsChekced
		{
			get
			{
				return logFileIsChecked;
			}
			set
			{
				if (logFileIsChecked != value)
				{
					logFileIsChecked = value;
					OnPropertyChanged("LogFileIsChekced");
				}
			}
		}

		public bool SubmitButtonIsEnabled
		{
			get
			{
				return submitButtonIsEnabled;
			}
			set
			{
				if (submitButtonIsEnabled != value)
				{
					submitButtonIsEnabled = value;
					OnPropertyChanged("SubmitButtonIsEnabled");
				}
			}
		}

		public FeedbackListViewModelV6()
		{
			ReplyCommand = new ReplayCommand(ReplyCommandHandler);
		}

		private async void ReplyCommandHandler(object args)
		{
			Window win = (Window)((args is Window) ? args : null);
			if (FeedBack == null || string.IsNullOrWhiteSpace(Comments))
			{
				return;
			}
			long? latestFeedbackId = null;
			FeedBackNodeModel current = FeedBack;
			while (current != null)
			{
				if ("Q".Equals(current.Type))
				{
					latestFeedbackId = current.Id;
				}
				if (current.Children != null)
				{
					current = current.Children.FirstOrDefault((FeedBackNodeModel m) => m.Children != null && m.Children.Count > 0);
				}
			}
			FeedbackSubmitModel model = new FeedbackSubmitModel
			{
				FeedbackContent = Comments,
				FeedbackId = latestFeedbackId,
				IsReplay = (FeedBack != null)
			};
			bool isUploadlog = (logFileIsChecked ? LogFileIsChekced : (await MessageWindowHelper.Instance.Show(null, "K0829", "K0571", "K0570", showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true) == true));
			SubmitButtonIsEnabled = false;
			FeedBackBLL bll = new FeedBackBLL();
			List<string> files = (isUploadlog ? bll.GetLogFileCopy() : null);
			bool isSuccess = await bll.SubmitFeedbackAsync(model, files);
			if (files != null && files.Count > 0)
			{
				files.ForEach(delegate(string n)
				{
					if (!string.IsNullOrEmpty(n))
					{
						GlobalFun.TryDeleteFile(n);
					}
				});
			}
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher == null)
			{
				return;
			}
			currentDispatcher.Invoke((Action)delegate
			{
				Window obj = win;
				if (obj != null)
				{
					obj.Close();
				}
				if (isSuccess)
				{
					MessageWindowHelper.Instance.Show(null, "K0733", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
				}
				else
				{
					MessageWindowHelper.Instance.Show(null, "K0734", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
				}
			});
		}
	}
	public class FeedbackMainViewModelV6 : lenovo.themes.generic.ViewModelV6.ViewModelBase
	{
		private List<FormItemViewModel> mFormItems = null;

		public QTreeNode _SelFunction;

		private ObservableCollection<QTreeNode> _QuestionList = new ObservableCollection<QTreeNode>();

		private Window _View;

		private bool _IsMainWindowLoad;

		private bool deviceIsConnected;

		private FormItemViewModel mEmailAddress;

		private FormItemViewModel mComments;

		private string marketName;

		private string modelName;

		private bool submitButtonIsEnabled = true;

		private ReplayCommand mSubmitCommand;

		private bool isOnline;

		private string loginUserName;

		private string deviceSN;

		private Visibility deviceSNPanelVisibility;

		private bool deviceInfoIsChecked;

		private bool isValid;

		private string deviceImeiLabel;

		private string deviceImei1;

		private string deviceImei2;

		private Visibility DeviceIemiPanelVisibility;

		private Visibility feedbackItemPanelVisibility = (Visibility)2;

		private Visibility _IsModuleWarnVisible;

		private bool logFileIsChecked = false;

		private string tips;

		private string buttonContent = "K0036";

		private ReplayCommand closeWinCommand;

		public static string QFeedbackRespStr { get; set; }

		public FeedBackNodeModel Feedback { get; private set; }

		public ObservableCollection<QTreeNode> FunctionArr { get; set; }

		public ReplayCommand RadioBtnSingleCommand { get; set; }

		public QTreeNode SelFunction
		{
			get
			{
				return _SelFunction;
			}
			set
			{
				_SelFunction = value;
				OnPropertyChanged("SelFunction");
				GeQuestionList();
			}
		}

		public ObservableCollection<QTreeNode> QuestionList
		{
			get
			{
				return _QuestionList;
			}
			set
			{
				_QuestionList = value;
				OnPropertyChanged("QuestionList");
			}
		}

		public bool DeviceIsConnected
		{
			get
			{
				return deviceIsConnected;
			}
			set
			{
				if (deviceIsConnected != value)
				{
					deviceIsConnected = value;
					OnPropertyChanged("DeviceIsConnected");
				}
			}
		}

		public FormItemViewModel EmailAddress
		{
			get
			{
				return mEmailAddress;
			}
			set
			{
				if (mEmailAddress != value)
				{
					mEmailAddress = value;
					OnPropertyChanged("EmailAddress");
				}
			}
		}

		public FormItemViewModel Comments
		{
			get
			{
				return mComments;
			}
			set
			{
				if (mComments != value)
				{
					mComments = value;
					OnPropertyChanged("Comments");
				}
			}
		}

		public string MarketName
		{
			get
			{
				return marketName;
			}
			set
			{
				if (!(marketName == value))
				{
					marketName = value;
					OnPropertyChanged("MarketName");
				}
			}
		}

		public string ModelName
		{
			get
			{
				return modelName;
			}
			set
			{
				if (!(modelName == value))
				{
					modelName = value;
					OnPropertyChanged("ModelName");
				}
			}
		}

		public bool SubmitButtonIsEnabled
		{
			get
			{
				return submitButtonIsEnabled;
			}
			set
			{
				if (submitButtonIsEnabled != value)
				{
					submitButtonIsEnabled = value;
					OnPropertyChanged("SubmitButtonIsEnabled");
				}
			}
		}

		public ReplayCommand SubmitCommand
		{
			get
			{
				return mSubmitCommand;
			}
			set
			{
				if (mSubmitCommand != value)
				{
					mSubmitCommand = value;
					OnPropertyChanged("SubmitCommand");
				}
			}
		}

		public ReplayCommand FunSelCommand { get; set; }

		public bool IsOnline
		{
			get
			{
				return isOnline;
			}
			set
			{
				if (isOnline != value)
				{
					isOnline = value;
					EmailAddressVerify emailAddressVerify = (EmailAddressVerify)EmailAddress.FormVerify;
					emailAddressVerify.IsCanEmpty = false;
					OnPropertyChanged("IsOnline");
				}
			}
		}

		public string LoginUserName
		{
			get
			{
				return loginUserName;
			}
			set
			{
				if (!(loginUserName == value))
				{
					loginUserName = value;
					OnPropertyChanged("LoginUserName");
				}
			}
		}

		public string DeviceSN
		{
			get
			{
				return deviceSN;
			}
			set
			{
				if (!(deviceSN == value))
				{
					deviceSN = value;
					OnPropertyChanged("DeviceSN");
				}
			}
		}

		public Visibility DeviceSNPanelVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return deviceSNPanelVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (deviceSNPanelVisibility != value)
				{
					deviceSNPanelVisibility = value;
					OnPropertyChanged("DeviceSNPanelVisibility");
				}
			}
		}

		public bool DeviceInfoIsChecked
		{
			get
			{
				return deviceInfoIsChecked;
			}
			set
			{
				if (deviceInfoIsChecked != value)
				{
					deviceInfoIsChecked = value;
					OnPropertyChanged("DeviceInfoIsChecked");
				}
			}
		}

		public bool IsValid
		{
			get
			{
				return isValid;
			}
			set
			{
				if (isValid != value)
				{
					isValid = value;
					OnPropertyChanged("IsValid");
				}
			}
		}

		public string DeviceImeiLabel
		{
			get
			{
				return deviceImeiLabel;
			}
			set
			{
				if (!(deviceImeiLabel == value))
				{
					deviceImeiLabel = value;
					OnPropertyChanged("DeviceImeiLabel");
				}
			}
		}

		public string DeviceImei1
		{
			get
			{
				return deviceImei1;
			}
			set
			{
				if (!(deviceImei1 == value))
				{
					deviceImei1 = value;
					OnPropertyChanged("DeviceImei1");
				}
			}
		}

		public string DeviceImei2
		{
			get
			{
				return deviceImei2;
			}
			set
			{
				if (!(deviceImei2 == value))
				{
					deviceImei2 = value;
					OnPropertyChanged("DeviceImei2");
				}
			}
		}

		public Visibility MyProperty
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return DeviceIemiPanelVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (DeviceIemiPanelVisibility != value)
				{
					DeviceIemiPanelVisibility = value;
					OnPropertyChanged("MyProperty");
				}
			}
		}

		public Visibility FeedbackItemPanelVisibility
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return feedbackItemPanelVisibility;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (feedbackItemPanelVisibility != value)
				{
					feedbackItemPanelVisibility = value;
					OnPropertyChanged("FeedbackItemPanelVisibility");
				}
			}
		}

		public Visibility IsModuleWarnVisible
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return _IsModuleWarnVisible;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				if (_IsModuleWarnVisible != value)
				{
					_IsModuleWarnVisible = value;
					OnPropertyChanged("IsModuleWarnVisible");
				}
			}
		}

		public bool LogFileIsChekced
		{
			get
			{
				return logFileIsChecked;
			}
			set
			{
				if (logFileIsChecked != value)
				{
					logFileIsChecked = value;
					OnPropertyChanged("LogFileIsChekced");
				}
			}
		}

		public string Tips
		{
			get
			{
				return tips;
			}
			set
			{
				if (!(tips == value))
				{
					tips = value;
					OnPropertyChanged("Tips");
				}
			}
		}

		public string ButtonContent
		{
			get
			{
				return buttonContent;
			}
			set
			{
				if (!(buttonContent == value))
				{
					buttonContent = value;
					OnPropertyChanged("ButtonContent");
				}
			}
		}

		public ReplayCommand CloseWinCommand
		{
			get
			{
				return closeWinCommand;
			}
			set
			{
				if (closeWinCommand != value)
				{
					closeWinCommand = value;
					OnPropertyChanged("CloseWinCommand");
				}
			}
		}

		public void GeQuestionList()
		{
			if (!_IsMainWindowLoad)
			{
				RadioBtnSingleCommandArg(null);
			}
		}

		public FeedbackMainViewModelV6(Window ui, bool isMainWindowLoad)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			_View = ui;
			_IsMainWindowLoad = isMainWindowLoad;
			FunctionArr = new ObservableCollection<QTreeNode>();
			if (string.IsNullOrEmpty(QFeedbackRespStr))
			{
				QFeedbackRespStr = AppContext.WebApi.RequestBase(WebApiUrl.FEEDBACK_GET_ISSUE_INFO, null, 0, null, HttpMethod.POST, "application/json", author: false).content?.ToString();
				LoadTreeNode(JsonConvert.DeserializeObject<List<QTreeNode>>((!string.IsNullOrEmpty(QFeedbackRespStr)) ? QFeedbackRespStr : (Configurations.BaseHttpUrl.Contains("lsa.lenovo.com") ? Resources.ResourceManager.GetString("QFeedbackStr") : Resources.ResourceManager.GetString("QFeedbackStrTest"))));
			}
			else
			{
				List<QTreeNode> arr = JsonHelper.DeserializeJson2Object<List<QTreeNode>>(QFeedbackRespStr);
				LoadTreeNode(arr);
			}
			IsModuleWarnVisible = (Visibility)2;
			FunSelCommand = new ReplayCommand(delegate
			{
				IsModuleWarnVisible = (Visibility)2;
			});
			SubmitCommand = new ReplayCommand(SubmitCommandHandler);
			RadioBtnSingleCommand = new ReplayCommand(RadioBtnSingleCommandArg);
			CloseWinCommand = new ReplayCommand(CloseWinCommandHandler);
			mFormItems = new List<FormItemViewModel>();
			EmailAddress = new FormItemViewModel(new EmailAddressVerify());
			Comments = new FormItemViewModel(new CanNotEmptyVerify());
			UserService.Single.OnlineUserChanged += Single_OnlineUserChanged;
			HostProxy.deviceManager.MasterDeviceChanged += DeviceManager_MasterDeviceChanged;
		}

		public void RadioBtnSingleCommandArg(object arg)
		{
			QuestionList.Clear();
			int num = SelFunction.Children[0].Children.FindIndex((QTreeNode x) => x.IsSelected);
			if (num < 2)
			{
				QuestionList.Add(SelFunction.Children[0]);
				return;
			}
			SelFunction.Children.ToList().ForEach(delegate(QTreeNode item)
			{
				QuestionList.Add(item);
			});
		}

		private void LoadTreeNode(List<QTreeNode> arr)
		{
			if (arr == null || arr.Count == 0)
			{
				return;
			}
			SetArrItemmCommand(arr, new ReplayCommand(OnLinkClicked));
			if (UserService.Single.IsOnline)
			{
				QTreeNode qTreeNode = arr.FirstOrDefault((QTreeNode p) => p.Context == "Log in");
				if (qTreeNode != null)
				{
					qTreeNode.Visible = (Visibility)2;
				}
				qTreeNode = arr.FirstOrDefault((QTreeNode p) => p.Context == "Rescue");
				if (qTreeNode != null)
				{
					qTreeNode.Visible = (Visibility)0;
				}
			}
			else
			{
				QTreeNode qTreeNode2 = arr.FirstOrDefault((QTreeNode p) => p.Context == "Log in");
				if (qTreeNode2 != null)
				{
					qTreeNode2.Visible = (Visibility)0;
				}
				qTreeNode2 = arr.FirstOrDefault((QTreeNode p) => p.Context == "Rescue");
				if (qTreeNode2 != null)
				{
					qTreeNode2.Visible = (Visibility)2;
				}
			}
			QTreeNode qTreeNode3 = arr.FirstOrDefault((QTreeNode p) => p.Context == "Other");
			if (qTreeNode3 != null)
			{
				qTreeNode3.Question = string.Empty;
			}
			HostProxy.CurrentDispatcher.Invoke((Action)delegate
			{
				FunctionArr.Clear();
				arr.ForEach(delegate(QTreeNode p)
				{
					FunctionArr.Add(p);
				});
			});
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
			//IL_0103: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
			if (e == DeviceSoftStateEx.Online)
			{
				DeviceIsConnected = true;
				TcpAndroidDevice tcpAndroidDevice = sender as TcpAndroidDevice;
				DeviceSN = tcpAndroidDevice.Property.SN;
				DeviceSNPanelVisibility = (Visibility)(string.IsNullOrEmpty(DeviceSN) ? 2 : 0);
				DeviceImei1 = tcpAndroidDevice.Property.IMEI1;
				DeviceImei2 = tcpAndroidDevice.Property.IMEI2;
				ModelName = tcpAndroidDevice.Property.ModelName;
				DeviceImeiLabel = (string.IsNullOrEmpty(tcpAndroidDevice.Property.IMEI2) ? "IMEI:" : "IMEI 1:");
				DeviceIemiPanelVisibility = (Visibility)((string.IsNullOrEmpty(DeviceImei1) && string.IsNullOrEmpty(DeviceImei2)) ? 2 : 0);
			}
			else
			{
				DeviceIsConnected = false;
				DeviceSN = string.Empty;
				DeviceImei1 = string.Empty;
				DeviceImei2 = string.Empty;
				ModelName = string.Empty;
				DeviceIemiPanelVisibility = (Visibility)2;
				DeviceSNPanelVisibility = (Visibility)2;
			}
		}

		private void Single_OnlineUserChanged(object sender, OnlineUserChangedEventArgs e)
		{
			IsOnline = e.IsOnline;
			if (e.IsOnline)
			{
				LoginUserName = ((e.UserInfo.UserSource == "lmsa") ? e.UserInfo.UserName : e.UserInfo.FullName);
			}
			else
			{
				LoginUserName = string.Empty;
			}
		}

		private void OnLinkClicked(object param)
		{
			string text = param as string;
			if (text == "#")
			{
				((dynamic)MainWindowViewModel.SingleInstance.PluginArr.FirstOrDefault((PluginModel p) => p.Info.PluginID == "8ab04aa975e34f1ca4f9dc3a81374e2c")?.UiElement).ShowStartTutoiral();
			}
			else
			{
				Process.Start(text);
			}
		}

		private bool IsTutorialEnable()
		{
			if (!_IsMainWindowLoad)
			{
				return false;
			}
			return MainWindowViewModel.SingleInstance.PluginArr.FirstOrDefault((PluginModel p) => p.Info.PluginID == "8ab04aa975e34f1ca4f9dc3a81374e2c")?.IsLoaded ?? false;
		}

		private void SetArrItemmCommand(List<QTreeNode> arr, ICommand cmd)
		{
			arr.ForEach(delegate(QTreeNode p)
			{
				if (p.Url == "#" && !IsTutorialEnable())
				{
					p.Url = string.Empty;
					p.Question = string.Empty;
				}
				if (!string.IsNullOrEmpty(p.Url))
				{
					p.LinkCommand = cmd;
				}
				List<QTreeNode> children = p.Children;
				if (children != null && children.Count > 0)
				{
					SetArrItemmCommand(p.Children, cmd);
				}
			});
		}

		public bool Verify()
		{
			bool flag = true;
			foreach (FormItemViewModel mFormItem in mFormItems)
			{
				flag &= mFormItem.Verify();
			}
			return flag;
		}

		private bool IsAllowCollectionIP()
		{
			bool result = false;
			try
			{
				result = SelFunction.Children[1].Children[0].IsSelected;
			}
			catch
			{
			}
			return result;
		}

		private async void SubmitCommandHandler(object args)
		{
			if (IsValid)
			{
				return;
			}
			Window win = (Window)((args is Window) ? args : null);
			foreach (FormItemViewModel item in mFormItems)
			{
				item.Wraning = new FormItemVerifyWraningViewModel();
			}
			mFormItems.Clear();
			EmailAddressVerify email = (EmailAddressVerify)EmailAddress.FormVerify;
			if (IsOnline)
			{
				email.IsCanEmpty = false;
			}
			else
			{
				email.IsCanEmpty = false;
			}
			if (!_IsMainWindowLoad)
			{
				mFormItems.Add(EmailAddress);
			}
			mFormItems.Add(Comments);
			if (!Verify())
			{
				return;
			}
			ButtonContent = "K1844";
			long? latestFeedbackId = null;
			FeedBackNodeModel current = Feedback;
			while (current != null)
			{
				if ("Q".Equals(current.Type))
				{
					latestFeedbackId = current.Id;
				}
				if (current.Children != null)
				{
					current = current.Children.FirstOrDefault((FeedBackNodeModel m) => m.Children != null && m.Children.Count > 0);
				}
			}
			FeedbackSubmitModel model = new FeedbackSubmitModel
			{
				UserName = string.Empty,
				Email = EmailAddress.InputValue,
				FeedbackContent = Comments.InputValue,
				FeedbackId = latestFeedbackId,
				Module = (_IsMainWindowLoad ? $"{SelFunction?.GetLastSelectedId()}" : $"{SelFunction?.GetLastSelectedIdBeforeLogin(QuestionList, SelFunction)}"),
				IsReplay = (Feedback != null),
				IsAllowCollectionIP = (!_IsMainWindowLoad && IsAllowCollectionIP())
			};
			if (DeviceIsConnected)
			{
				if (DeviceInfoIsChecked)
				{
					model.Imei1 = DeviceImei1;
					model.Imei2 = DeviceImei2;
					model.ModelName = ModelName;
					model.SN = DeviceSN;
				}
			}
			else
			{
				model.ModelName = ModelName;
			}
			bool isUploadlog = (logFileIsChecked ? LogFileIsChekced : (await MessageWindowHelper.Instance.Show(null, "K0829", "K0571", "K0570", showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: true, isAsynnc: false, null, null, null, null, true) == true));
			if (!string.IsNullOrEmpty(model.Email))
			{
				LogHelper.LogInstance.AddUnsafeText(model.Email.Trim());
			}
			Tips = string.Empty;
			SubmitButtonIsEnabled = false;
			FeedBackBLL bll = new FeedBackBLL();
			List<string> files = (isUploadlog ? bll.GetLogFileCopy() : null);
			Stopwatch sw = new Stopwatch();
			sw.Start();
			bool isSuccess = await bll.SubmitFeedbackAsync(model, files, _IsMainWindowLoad);
			if (files != null && files.Count > 0)
			{
				files.ForEach(delegate(string n)
				{
					if (!string.IsNullOrEmpty(n))
					{
						GlobalFun.TryDeleteFile(n);
					}
				});
			}
			sw.Stop();
			HostProxy.BehaviorService.Collect(BusinessType.FEEDBACK, new BusinessData(BusinessType.FEEDBACK, null).Update(sw.ElapsedMilliseconds, isSuccess ? BusinessStatus.SUCCESS : BusinessStatus.FALIED, model));
			SubmitButtonIsEnabled = true;
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke<Task>((Func<Task>)async delegate
				{
					Window obj = win;
					if (obj != null)
					{
						obj.Close();
					}
					if (_IsMainWindowLoad)
					{
						await MessageWindowHelper.Instance.Show(null, isSuccess ? "K0733" : "K0734", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
					}
					else
					{
						MessageBoxV6 box = new MessageBoxV6();
						((Window)box).Owner = Application.Current.MainWindow;
						((Window)box).WindowStartupLocation = (WindowStartupLocation)2;
						box.Init(isSuccess ? "K0733" : "K0734", (MessageBoxButton)0, (MessageBoxImage)64, isCloseBtn: false);
						((Window)box).ShowDialog();
					}
				});
			}
			ButtonContent = "K0036";
		}

		private void CloseWinCommandHandler(object args)
		{
			Window val = (Window)((args is Window) ? args : null);
			if (val != null)
			{
				val.Close();
			}
		}
	}
	public class QTreeNode : NotifyBase
	{
		private string _Type;

		private string _Question;

		private bool _IsSelected;

		private Visibility _Visible = (Visibility)0;

		[JsonProperty("id")]
		public long Id { get; set; }

		[JsonProperty("content")]
		public string Context { get; set; }

		[JsonProperty("parentId")]
		public int Parent { get; set; }

		[JsonProperty("type")]
		public string Type
		{
			get
			{
				return _Type;
			}
			set
			{
				_Type = value;
				OnPropertyChanged("Type");
			}
		}

		[JsonProperty("question")]
		public string Question
		{
			get
			{
				return _Question;
			}
			set
			{
				_Question = value;
				OnPropertyChanged("Question");
			}
		}

		[JsonProperty("remark")]
		public string Remark { get; set; }

		[JsonProperty("url")]
		public string Url { get; set; }

		[JsonProperty("hyperlink")]
		public string Title { get; set; }

		[JsonProperty("selected")]
		public bool IsSelected
		{
			get
			{
				return _IsSelected;
			}
			set
			{
				_IsSelected = value;
				OnPropertyChanged("IsSelected");
				if (!_IsSelected)
				{
					Children?.ForEach(delegate(QTreeNode p)
					{
						p.IsSelected = false;
					});
				}
			}
		}

		[JsonIgnore]
		public ICommand LinkCommand { get; set; }

		[JsonIgnore]
		public Visibility Visible
		{
			get
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				//IL_000a: Unknown result type (might be due to invalid IL or missing references)
				return _Visible;
			}
			set
			{
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				//IL_0003: Unknown result type (might be due to invalid IL or missing references)
				_Visible = value;
				OnPropertyChanged("Visible");
			}
		}

		[JsonProperty(PropertyName = "children", NullValueHandling = NullValueHandling.Ignore)]
		public List<QTreeNode> Children { get; set; }

		public void ProcBeforeCommit()
		{
			Context = null;
			Question = null;
			Title = null;
			Url = null;
			Children?.ForEach(delegate(QTreeNode p)
			{
				p.ProcBeforeCommit();
			});
		}

		public long GetLastSelectedId()
		{
			if (Children == null || Children.Count == 0)
			{
				return Id;
			}
			return Children.FirstOrDefault((QTreeNode p) => p.IsSelected)?.GetLastSelectedId() ?? Id;
		}

		public long GetLastSelectedIdBeforeLogin(ObservableCollection<QTreeNode> QuestionList, QTreeNode SelFunction)
		{
			if (QuestionList.Count == 0)
			{
				return SelFunction.Id;
			}
			return QuestionList[0].Children.FirstOrDefault((QTreeNode x) => x.IsSelected)?.Id ?? QuestionList[0].Id;
		}
	}
	public class FeedbackSubContentTemplateSelector : DataTemplateSelector
	{
		public override DataTemplate SelectTemplate(object item, DependencyObject container)
		{
			FrameworkElement val = (FrameworkElement)(object)((container is FrameworkElement) ? container : null);
			if (!(item is FeedbackSubContentItemViewModel feedbackSubContentItemViewModel) || val == null)
			{
				return null;
			}
			string empty = string.Empty;
			empty = ((!"img".Equals(feedbackSubContentItemViewModel.DataType)) ? "feedbackSubContentForString" : "feedbackSubContentForImage");
			object obj = val.FindResource((object)empty);
			return (DataTemplate)((obj is DataTemplate) ? obj : null);
		}
	}
}
namespace lenovo.mbg.service.lmsa.Feedback.Model
{
	public class FeedBackNodeModel
	{
		[JsonProperty("id")]
		public long? Id { get; set; }

		[JsonProperty("type")]
		public string Type { get; set; }

		[JsonProperty("date")]
		public DateTime Date { get; set; }

		[JsonProperty("title")]
		public string Title { get; set; }

		[JsonProperty("content")]
		public string Content { get; set; }

		[JsonProperty("helpful")]
		public int? HelpfulCode { get; set; }

		[JsonProperty("serverReplay")]
		public bool IsServerReplay { get; set; }

		[JsonProperty("tags")]
		public List<ContentItem> ContentItems { get; set; }

		[JsonProperty("children")]
		public List<FeedBackNodeModel> Children { get; set; }
	}
	public class ContentItem
	{
		[JsonProperty("sequence")]
		public int Sort { get; set; }

		[JsonProperty("value")]
		public string Content { get; set; }

		[JsonProperty("type")]
		public string DataType { get; set; }
	}
	public class FeedbackSubmitModel
	{
		public string UserName { get; set; }

		public string Email { get; set; }

		public string FeedbackContent { get; set; }

		public string SN { get; set; }

		public string Imei1 { get; set; }

		public string Imei2 { get; set; }

		public string ModelName { get; set; }

		public string MarketName { get; set; }

		public string Module { get; set; }

		public bool IsReplay { get; set; }

		public long? FeedbackId { get; set; }

		public string LogFilePath { get; set; }

		public bool IsAllowCollectionIP { get; set; }
	}
	public class FeedbackLocalStoreItemModel
	{
	}
	public class FeedbackLocalStoreModel
	{
		public long UserId { get; set; }

		public DateTime SyncTimeline { get; set; }

		public List<FeedBackNodeModel> Feedbacks { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.Feedback.Converter
{
	public class WarnCodeToColorConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				object obj = Application.Current.TryFindResource((object)"V6_BorderBrushKey");
				return (obj is SolidColorBrush) ? obj : null;
			}
			FormItemVerifyWraningViewModel formItemVerifyWraningViewModel = (FormItemVerifyWraningViewModel)value;
			if (1.Equals(formItemVerifyWraningViewModel.WraningCode) && formItemVerifyWraningViewModel.WraningContent != null)
			{
				object obj2 = Application.Current.TryFindResource((object)"V6_WarnningBrushKey");
				return (obj2 is SolidColorBrush) ? obj2 : null;
			}
			object obj3 = Application.Current.TryFindResource((object)"V6_BorderBrushKey");
			return (obj3 is SolidColorBrush) ? obj3 : null;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class HelpfulTemplateSelector : DataTemplateSelector
	{
		public override DataTemplate SelectTemplate(object item, DependencyObject container)
		{
			FrameworkElement val = (FrameworkElement)(object)((container is FrameworkElement) ? container : null);
			if (!(item is FeedbackItemViewModel feedbackItemViewModel) || val == null)
			{
				object obj = val.FindResource((object)"helpfulEmptyDataTemplate");
				return (DataTemplate)((obj is DataTemplate) ? obj : null);
			}
			int? helpfulCode = feedbackItemViewModel.HelpfulCode;
			if (!helpfulCode.HasValue)
			{
				object obj2 = val.FindResource((object)"helpfulEmptyDataTemplate");
				return (DataTemplate)((obj2 is DataTemplate) ? obj2 : null);
			}
			string text = string.Empty;
			switch (helpfulCode.Value)
			{
			case -1:
				text = "helpfulNoDataTemplate";
				break;
			case 0:
				text = "helpfulReadyOptionDataTemplate";
				break;
			case 1:
				text = "helpfulYesDataTemplate";
				break;
			}
			object obj3 = val.FindResource((object)text);
			return (DataTemplate)((obj3 is DataTemplate) ? obj3 : null);
		}
	}
}
namespace lenovo.mbg.service.lmsa.Feedback.Business
{
	public class FeedBackBLL
	{
		private WebService mService = new WebService();

		public async Task<List<FeedBackNodeModel>> GetFeedbackIdAndTimeListAsync()
		{
			return await mService.GetFeedbackIdAndTimeListAsync();
		}

		public async Task<FeedBackNodeModel> GetFeedbackDetailAsync(long feedbackId)
		{
			return await mService.GetFeedbackDetailAsync(feedbackId);
		}

		public async Task<bool> SubmitFeedbackAsync(FeedbackSubmitModel feedback, List<string> files, bool _isLogin = true)
		{
			return await mService.SubmitFeedbackAsync(feedback, files, _isLogin);
		}

		public async Task<string> GetUrlWithToken(string originalUrl)
		{
			return await mService.GetUrlWithToken(originalUrl);
		}

		public async Task<bool> SubmitReplyIsHelpfull(long? replyId, int? helpfullCode)
		{
			return await mService.SubmitReplyIsHelpfull(replyId, helpfullCode);
		}

		public List<string> GetLogFileCopy()
		{
			List<string> list = new List<string>();
			string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "logs");
			string text = DateTime.Now.ToString("yyyy-MM-dd");
			string encryptFile = Path.Combine(path, text + ".log.dpapi");
			LogAesDecrypt logAesDecrypt = new LogAesDecrypt();
			string text2 = Path.Combine(path, text + ".decrpyt.log");
			if (logAesDecrypt.Decrypt2File(encryptFile, text2))
			{
				list.Add(text2);
			}
			string text3 = Path.Combine(Path.GetTempPath(), "lmsatemp");
			if (!Directory.Exists(text3))
			{
				Directory.CreateDirectory(text3);
			}
			else
			{
				GlobalFun.DeleteFileInDirectory(text3);
			}
			string chromiumLogFilePath = Configurations.ChromiumLogFilePath;
			if (File.Exists(chromiumLogFilePath))
			{
				string text4 = Path.Combine(text3, DateTime.Now.ToString("yyyy-MM-dd") + "-browser.log");
				File.Copy(chromiumLogFilePath, text4, overwrite: true);
				list.Add(text4);
			}
			return list;
		}

		public List<FeedbackItemViewModel> CreateFeedbackItemViewModels(FeedBackNodeModel feedback)
		{
			Queue<FeedBackNodeModel> queue = new Queue<FeedBackNodeModel>();
			List<FeedbackItemViewModel> list = new List<FeedbackItemViewModel>();
			string text = "K0732";
			if (HostProxy.LanguageService.IsNeedTranslate())
			{
				text = HostProxy.LanguageService.Translate(text);
			}
			bool flag = true;
			queue.Enqueue(feedback);
			while (queue.Count != 0)
			{
				FeedBackNodeModel feedBackNodeModel = queue.Dequeue();
				if (feedBackNodeModel.Children != null)
				{
					IOrderedEnumerable<FeedBackNodeModel> orderedEnumerable = feedBackNodeModel.Children.OrderBy((FeedBackNodeModel m) => m.Date);
					foreach (FeedBackNodeModel item in orderedEnumerable)
					{
						queue.Enqueue(item);
					}
				}
				FeedbackItemViewModel feedbackItemViewModel = new FeedbackItemViewModel
				{
					Title = feedBackNodeModel.Title,
					Type = feedBackNodeModel.Type,
					Date = FromShanghaiToLocal(feedBackNodeModel.Date),
					Id = feedBackNodeModel.Id,
					HelpfulCode = ((feedBackNodeModel.HelpfulCode.HasValue && (feedBackNodeModel.HelpfulCode.Value == 1 || feedBackNodeModel.HelpfulCode.Value == -1)) ? ((int?)null) : feedBackNodeModel.HelpfulCode)
				};
				LogHelper.LogInstance.Info($"Feedback date convert info:[Title{feedbackItemViewModel.Title},SData:{feedBackNodeModel.Date},LData:{feedbackItemViewModel.Date}]");
				List<FeedbackSubContentItemViewModel> list2 = null;
				if ("Q".Equals(feedbackItemViewModel.Type))
				{
					list2 = new List<FeedbackSubContentItemViewModel>
					{
						new FeedbackSubContentItemViewModel
						{
							DataType = "other",
							Content = feedBackNodeModel.Content?.Replace("<br>", "")
						}
					};
					if (flag)
					{
						flag = false;
						feedbackItemViewModel.Title = text;
						text = HostProxy.LanguageService.Translate("K0731");
					}
					else
					{
						feedbackItemViewModel.Title = text;
					}
				}
				else if (feedBackNodeModel.ContentItems != null && feedBackNodeModel.ContentItems.Count > 0)
				{
					list2 = new List<FeedbackSubContentItemViewModel>();
					foreach (ContentItem item2 in feedBackNodeModel.ContentItems.OrderBy((ContentItem m) => m.Sort))
					{
						list2.Add(new FeedbackSubContentItemViewModel
						{
							DataType = item2.DataType,
							Content = item2.Content?.Replace("<br>", "")
						});
					}
				}
				feedbackItemViewModel.FeedbackContentItmes = list2;
				list.Insert(0, feedbackItemViewModel);
			}
			return list;
		}

		public static DateTime FromShanghaiToLocal(DateTime shanghaiTime)
		{
			string id = (RuntimeInformation.IsOSPlatform(OSPlatform.Windows) ? "China Standard Time" : "Asia/Shanghai");
			TimeZoneInfo sourceTimeZone = TimeZoneInfo.FindSystemTimeZoneById(id);
			DateTime dateTime = DateTime.SpecifyKind(shanghaiTime, DateTimeKind.Unspecified);
			return TimeZoneInfo.ConvertTime(dateTime, sourceTimeZone, TimeZoneInfo.Local);
		}

		public bool HaveReplyFromService(FeedBackNodeModel feedback)
		{
			if (feedback == null)
			{
				return false;
			}
			FeedBackNodeModel feedBackNodeModel = feedback;
			while (feedBackNodeModel != null && feedBackNodeModel.Children != null && feedBackNodeModel.Children.Count > 0)
			{
				FeedBackNodeModel feedBackNodeModel2 = feedBackNodeModel.Children.FirstOrDefault((FeedBackNodeModel m) => m.Children != null && m.Children.Count > 0);
				feedBackNodeModel = ((feedBackNodeModel2 == null) ? feedBackNodeModel.Children.FirstOrDefault() : feedBackNodeModel2);
			}
			return "A".Equals(feedBackNodeModel.Type);
		}
	}
	public class TokenImageUrlConverter : ImageDownloader.IUrlConverter
	{
		private FeedBackBLL bll = new FeedBackBLL();

		public string Convert(string originalUrl)
		{
			return bll.GetUrlWithToken(originalUrl).Result;
		}
	}
	internal class WebService : ApiService
	{
		public async Task<List<FeedBackNodeModel>> GetFeedbackIdAndTimeListAsync()
		{
			Task<List<FeedBackNodeModel>> task = new Task<List<FeedBackNodeModel>>(() => RequestContent<List<FeedBackNodeModel>>(WebApiUrl.FEEDBACK_GET_LIST, null));
			task.Start();
			return await task;
		}

		public async Task<FeedBackNodeModel> GetFeedbackDetailAsync(long feedbackId)
		{
			Task<FeedBackNodeModel> task = new Task<FeedBackNodeModel>(delegate
			{
				dynamic val = new ExpandoObject();
				val.feedbackId = feedbackId;
				return RequestContent<FeedBackNodeModel>(WebApiUrl.FEEDBACK_GET_INFO, val);
			});
			task.Start();
			return await task;
		}

		public async Task<string> GetUrlWithToken(string originalUrl)
		{
			Task<string> task = new Task<string>(delegate
			{
				dynamic val = new ExpandoObject();
				val.fileNames = new string[1] { originalUrl };
				List<string> list = RequestContent<List<string>>(WebApiUrl.FEEDBACK_FILE_SINGNATURE, val);
				return (list.Count > 0) ? list[0] : string.Empty;
			});
			task.Start();
			return await task;
		}

		public async Task<bool> SubmitReplyIsHelpfull(long? replyId, int? helpfullCode)
		{
			return await Task.Run(delegate
			{
				JObject aparams = new JObject
				{
					{ "replyId", replyId },
					{ "helpful", helpfullCode }
				};
				ResponseModel<object> responseModel = RequestBase(WebApiUrl.FEEDBACK_GET_HELPFUL, aparams);
				return responseModel.code == "0000";
			});
		}

		public async Task<bool> SubmitFeedbackAsync(FeedbackSubmitModel feedback, List<string> files, bool _isLogin)
		{
			Dictionary<string, string> header = new Dictionary<string, string>();
			header["clientVersion"] = WebApiContext.CLIENT_VERSION;
			header["feedbackContent"] = feedback.FeedbackContent;
			header["sn"] = feedback.SN;
			header["imei"] = feedback.Imei1;
			header["imei2"] = feedback.Imei2;
			header["modelName"] = feedback.ModelName;
			header["marketName"] = feedback.MarketName;
			header["reply"] = feedback.IsReplay.ToString();
			header["userName"] = feedback.UserName;
			header["email"] = feedback.Email;
			header["isAllowCollectionIP"] = feedback.IsAllowCollectionIP.ToString();
			header.Add("windowsInfo", WebApiContext.WINDOWS_VERSION);
			if (!string.IsNullOrEmpty(feedback.Module))
			{
				header["feedbackIssueModuleId"] = feedback.Module;
			}
			if (feedback.FeedbackId.HasValue)
			{
				header["feedbackId"] = feedback.FeedbackId.Value.ToString();
			}
			string _feedBackUrl = (_isLogin ? WebApiUrl.FEEDBACK_GET_UPLOAD : WebApiUrl.FEEDBACK_GET_UPLOAD_GUEST);
			return await UploadAsync(_feedBackUrl, files, header);
		}
	}
}
namespace lenovo.mbg.service.lmsa.Converters
{
	public class Bool2VisiableConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (parameter != null && parameter.ToString() == "INVERT")
			{
				if (value == null || !System.Convert.ToBoolean(value))
				{
					return (object)(Visibility)0;
				}
				return (object)(Visibility)2;
			}
			if (value == null || !System.Convert.ToBoolean(value))
			{
				return (object)(Visibility)2;
			}
			return (object)(Visibility)0;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class CompareRedioBtnConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values == null || values.Length != 2)
			{
				return false;
			}
			if (int.TryParse(values[0].ToString(), out var result) && int.TryParse(values[1].ToString(), out var result2) && result >= result2)
			{
				return true;
			}
			return false;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public sealed class Boolen2VisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			try
			{
				return (object)(Visibility)((!(bool)value) ? 2 : 0);
			}
			catch (Exception)
			{
				return (object)(Visibility)2;
			}
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class NullOrEmptyToVisibleConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			Visibility val = (Visibility)2;
			if (value != null && !string.IsNullOrWhiteSpace(value.ToString()))
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
	public class IMEI1TextConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			string result = "K0459";
			if (value != null && !string.IsNullOrEmpty(value.ToString()))
			{
				result = "K0460";
			}
			return result;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class PrivateNameConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return null;
			}
			string text = value as string;
			if (Regex.IsMatch(text, "^[\\w-.]+@[\\w-]+(\\.[\\w-]+)+$"))
			{
				return Regex.Replace(text, "[\\w-.]{1,3}@", "***@");
			}
			if (string.IsNullOrEmpty(text) || text.Length <= 3)
			{
				return text;
			}
			int length = text.Length - 3;
			return text.Substring(0, length) + "***";
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class EmptyTextConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			string result = LangTranslation.Translate("K0470");
			if (value != null && !string.IsNullOrEmpty(value.ToString()))
			{
				result = value.ToString();
			}
			return result;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class IndexConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Expected O, but got Unknown
			ListViewItem val = (ListViewItem)value;
			ItemsControl obj = ItemsControl.ItemsControlFromItemContainer((DependencyObject)(object)val);
			ListView val2 = (ListView)(object)((obj is ListView) ? obj : null);
			int num = ((ItemsControl)val2).ItemContainerGenerator.IndexFromContainer((DependencyObject)(object)val);
			return (++num).ToString();
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class NewVersionInfoConverter : IMultiValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return value;
		}

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			string result = string.Empty;
			try
			{
				result = $"[{values[0]}({values[1]})]";
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
	public class NewVersionNameConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			string result = string.Empty;
			try
			{
				string text = (string)value;
				result = ((!string.Equals(text, "Client", StringComparison.CurrentCultureIgnoreCase)) ? string.Format("{1} ({0})", LangTranslation.Translate(text), LangTranslation.Translate("Plugin Upgrade")) : "K0341");
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
	public class NewVersionSizeConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			string result = string.Empty;
			try
			{
				string text = "";
				long filesize = (long)values[0];
				if (filesize == 0L && values[1] != null)
				{
					string url = values[1].ToString();
					GlobalFun.GetFileSize(url, out filesize);
				}
				text = GlobalFun.ConvertLong2String(filesize);
				result = LangTranslation.Translate(values[2].ToString()) + text;
			}
			catch (Exception)
			{
			}
			return result;
		}

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			string result = string.Empty;
			try
			{
				string arg = "";
				long num = (long)value;
				if (num == 0)
				{
					HttpDownload httpDownload = new HttpDownload();
				}
				if ((double)num < 1024.0)
				{
					arg = num.ToString("F2") + " Byte";
				}
				else if ((double)num >= 1024.0 && num < 1048576)
				{
					arg = ((double)num / 1024.0).ToString("F2") + " K";
				}
				else if (num >= 1048576 && num < 1073741824)
				{
					arg = ((double)num / 1024.0 / 1024.0).ToString("F2") + " M";
				}
				else if (num >= 1073741824)
				{
					arg = ((double)num / 1024.0 / 1024.0 / 1024.0).ToString("F2") + " G";
				}
				result = string.Format("{1}:{0}", arg, LangTranslation.Translate("K0378"));
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

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
}
namespace lenovo.mbg.service.lmsa.Business
{
	public class CheckClientVersion
	{
		private MessageBox_Common msgCheckToolVersionCarsh = null;

		private static CheckClientVersion singleInstance;

		private Action m_NoNewVersionAction = null;

		public VersionModel NewVersionModel { get; private set; }

		public static CheckClientVersion Instance
		{
			get
			{
				if (singleInstance == null)
				{
					singleInstance = new CheckClientVersion();
				}
				return singleInstance;
			}
		}

		private CheckClientVersion()
		{
		}

		public void CheckToolVersion(Action _noNewVersionAction)
		{
			m_NoNewVersionAction = _noNewVersionAction;
			UpdateManager.Instance.InitializeToolVersionUpdate();
			UpdateManager.Instance.ToolUpdateWorker.OnCheckVersionStatusChanged += ToolUpdateWorker_OnCheckVersionStatusChanged;
			UpdateManager.Instance.ToolUpdateWorker.CheckVersion(isAutoMode: true);
		}

		private void SetUIbyManualTrigger(CheckVersionStatus status)
		{
			if (!ApplcationClass.manualTrigger)
			{
				return;
			}
			switch (status)
			{
			case CheckVersionStatus.CHECK_VERSION_HAVE_NEW_VERSION:
				if (!NewVersionModel.ForceType)
				{
					ApplcationClass.manualTrigger = false;
					MessageWindowHelper.Instance.Show(new HostUpdateWindowV6(HostUpdateWindowV6.ViewStatus.DetectedVersion, NewVersionModel.ForceType, NewVersionModel), true);
				}
				break;
			case CheckVersionStatus.CHECK_VERSION_NOT_NEW_VERSION:
				ApplcationClass.manualTrigger = false;
				MessageWindowHelper.Instance.Show(null, "K0285", "K0327", null, showClose: false, (MessageBoxImage)64, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
				break;
			}
		}

		private void ToolUpdateWorker_OnCheckVersionStatusChanged(object sender, CheckVersionEventArgs e)
		{
			if (ApplcationClass.IsExecuteWork)
			{
				Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
				if (currentDispatcher != null)
				{
					currentDispatcher.BeginInvoke((Delegate)(Action)delegate
					{
						if (msgCheckToolVersionCarsh != null && ((Window)msgCheckToolVersionCarsh).IsActive)
						{
							((Window)msgCheckToolVersionCarsh).Close();
						}
					}, Array.Empty<object>());
				}
				LogHelper.LogInstance.Info("lenovo.mbg.service.lmsa.MainWindow.ToolUpdateWorker_OnCheckVersionStatusChanged  . because of isupdating plug, retrn. checkversionstatus:" + e.Status);
				return;
			}
			LogHelper.LogInstance.Info("lenovo.mbg.service.lmsa.MainWindow.ToolUpdateWorker_OnCheckVersionStatusChanged event. checkversionstatus:" + e.Status);
			Dispatcher currentDispatcher2 = HostProxy.CurrentDispatcher;
			if (currentDispatcher2 == null)
			{
				return;
			}
			currentDispatcher2.Invoke((Action)async delegate
			{
				switch (e.Status)
				{
				case CheckVersionStatus.CHECK_VERSION_FAILED:
				case CheckVersionStatus.CHECK_VERSION_DATA_REPEAT:
				case CheckVersionStatus.CHECK_VERSION_DATA_INVALID:
					if (msgCheckToolVersionCarsh != null)
					{
						((Window)msgCheckToolVersionCarsh).Close();
					}
					break;
				case CheckVersionStatus.CHECK_VERSION_HAVE_NEW_VERSION:
					NewVersionModel = e.Data as VersionModel;
					if (NewVersionModel != null)
					{
						if (msgCheckToolVersionCarsh != null)
						{
							((Window)msgCheckToolVersionCarsh).Close();
						}
						if (NewVersionModel.ForceType)
						{
							ApplcationClass.ForceUpdate = true;
							await MessageWindowHelper.Instance.Show(new HostUpdateWindowV6(HostUpdateWindowV6.ViewStatus.DetectedVersion, NewVersionModel.ForceType, NewVersionModel), true);
							ApplcationClass.ForceUpdate = false;
						}
						else
						{
							if (e.IsAutoMode)
							{
								UpgradeUserOptionManager manger = new UpgradeUserOptionManager();
								ApplcationClass.manualTrigger = manger.IsRemindToday(NewVersionModel.Version);
							}
							m_NoNewVersionAction?.Invoke();
							m_NoNewVersionAction = null;
						}
					}
					break;
				case CheckVersionStatus.CHECK_VERSION_NOT_NEW_VERSION:
					if (msgCheckToolVersionCarsh != null)
					{
						((Window)msgCheckToolVersionCarsh).Close();
					}
					m_NoNewVersionAction?.Invoke();
					m_NoNewVersionAction = null;
					break;
				}
				SetUIbyManualTrigger(e.Status);
			});
		}
	}
	public class RsaServiceHelper
	{
		public static void PostUserBehavior()
		{
			List<BehaviorModel> all = HostProxy.BehaviorService.GetAll();
			if (all != null && all.Count > 0)
			{
				AppContext.WebApi.RequestContent(WebApiUrl.USER_BEHAVIOR_COLLECTION, all);
			}
		}
	}
	public class Notices
	{
		private static Notices single = new Notices();

		private List<INoticeSource> noticeSources = new List<INoticeSource>();

		public static Notices Single => single;

		public NoticeInfo LatestNotice
		{
			get
			{
				lock (this)
				{
					if (DisplayNotices == null)
					{
						return null;
					}
					return DisplayNotices.FirstOrDefault((NoticeInfo m) => !m.isDeleted && !m.isChecked);
				}
			}
		}

		protected LanguageNotices local_notices { get; set; }

		protected List<NoticeInfo> DisplayNotices { get; set; }

		public Notices()
		{
			noticeSources.Add(new NormalNotice());
			noticeSources.Add(new FeedbackNotice());
		}

		public async Task<LanguageNotices> LoadLocalDataAsync()
		{
			Task<LanguageNotices> task = new Task<LanguageNotices>(delegate
			{
				if (local_notices == null)
				{
					lock (this)
					{
						if (local_notices == null)
						{
							local_notices = JsonHelper.DeserializeJson2Object<LanguageNotices>(FileHelper.ReadWithAesDecrypt(Configurations.NoticesPath));
						}
					}
				}
				return local_notices;
			});
			task.Start();
			return await task;
		}

		public async Task<List<NoticeInfo>> SyncAsync()
		{
			LanguageNotices local = await LoadLocalDataAsync();
			lock (this)
			{
				List<NoticeInfo> server = Request();
				if (server != null && server.Count > 0)
				{
					int num;
					if (local != null)
					{
						List<NoticeInfo> noticeArr = local.NoticeArr;
						num = ((noticeArr != null && noticeArr.Count == 0) ? 1 : 0);
					}
					else
					{
						num = 1;
					}
					if (num != 0)
					{
						Notices notices = this;
						LanguageNotices obj = new LanguageNotices
						{
							Language = LMSAContext.CurrentLanguage,
							NoticeArr = server
						};
						LanguageNotices languageNotices = obj;
						local = obj;
						notices.local_notices = languageNotices;
					}
					else
					{
						List<NoticeInfo> _newNotice = new List<NoticeInfo>();
						foreach (NoticeInfo iter in server)
						{
							NoticeInfo _temp = local.NoticeArr.FirstOrDefault((NoticeInfo p) => p.id == iter.id && p.noticeType == iter.noticeType);
							if (_temp == null)
							{
								_newNotice.Add(iter);
								continue;
							}
							_temp.noticeTitle = iter.noticeTitle;
							_temp.noticeContent = iter.noticeContent;
							_temp.noticeType = iter.noticeType;
							_temp.isServerReplay = iter.isServerReplay;
							if (_temp.modifyDate < iter.modifyDate)
							{
								_temp.modifyDate = iter.modifyDate;
								_temp.isChecked = false;
								_temp.isDeleted = false;
							}
							_newNotice.Add(_temp);
						}
						local = (local_notices = new LanguageNotices
						{
							Language = LMSAContext.CurrentLanguage,
							NoticeArr = _newNotice
						});
					}
				}
				else if (local?.Language != LMSAContext.CurrentLanguage)
				{
					if (local != null)
					{
						local.Language = LMSAContext.CurrentLanguage;
					}
					return DisplayNotices = null;
				}
				SerializeDataFile();
				if (local != null && local.NoticeArr.Count > 0)
				{
					List<NoticeInfo> filterList = Filter(local.NoticeArr.Where((NoticeInfo m) => !m.isDeleted).ToList());
					return DisplayNotices = filterList;
				}
				return DisplayNotices = null;
			}
		}

		private List<NoticeInfo> Filter(List<NoticeInfo> source)
		{
			List<NoticeInfo> list = new List<NoticeInfo>();
			foreach (INoticeSource noticeSource in noticeSources)
			{
				list.AddRange(noticeSource.Filter(source));
			}
			return list;
		}

		protected List<NoticeInfo> Request()
		{
			Task<List<NoticeInfo>>[] array = new Task<List<NoticeInfo>>[noticeSources.Count];
			Task<object> task = Task.FromResult<object>(null);
			for (int i = 0; i < noticeSources.Count; i++)
			{
				array[i] = Task.Factory.StartNew((object index) => noticeSources[(int)index].GetNoticesAsync(), i);
			}
			List<NoticeInfo> list = new List<NoticeInfo>();
			Task[] tasks = array;
			Task.WaitAll(tasks);
			Task<List<NoticeInfo>>[] array2 = array;
			foreach (Task<List<NoticeInfo>> task2 in array2)
			{
				if (task2.Result != null)
				{
					list.AddRange(task2.Result);
				}
			}
			return list;
		}

		public void Show(NoticeInfo checkNotice)
		{
			if (checkNotice == null)
			{
				return;
			}
			string latestNoticeType = checkNotice.type;
			INoticeSource noticeSource = noticeSources.FirstOrDefault((INoticeSource m) => latestNoticeType == m.NoticeType);
			if (noticeSource != null)
			{
				noticeSource.Show(checkNotice);
				Task.Run(delegate
				{
					UpdateIsCheck(checkNotice);
				});
			}
		}

		private void UpdateIsCheck(NoticeInfo notice)
		{
			lock (this)
			{
				NoticeInfo noticeInfo = local_notices?.NoticeArr?.Where((NoticeInfo n) => n.id == notice.id && n.noticeType == notice.noticeType).FirstOrDefault();
				if (noticeInfo != null)
				{
					noticeInfo.isChecked = true;
					SerializeDataFile();
				}
			}
		}

		public void RemoveLocalNotice(NoticeInfo model)
		{
			Task.Run(delegate
			{
				lock (this)
				{
					NoticeInfo noticeInfo = local_notices?.NoticeArr?.Where((NoticeInfo n) => n.id == model.id && n.noticeType == model.noticeType).First();
					if (noticeInfo != null)
					{
						noticeInfo.isChecked = true;
						noticeInfo.isDeleted = true;
						SerializeDataFile();
					}
				}
			});
		}

		protected void SerializeDataFile()
		{
			Task.Factory.StartNew(delegate
			{
				lock (this)
				{
					FileHelper.WriteFileWithAesEncrypt(Configurations.NoticesPath, JsonHelper.SerializeObject2Json(local_notices));
				}
			});
		}
	}
	[Serializable]
	public class NoticeInfo : INotifyPropertyChanged
	{
		private string _type = "Normal";

		private bool _isChecked;

		public long id { get; set; }

		public string noticeTitle { get; set; }

		public string noticeContent { get; set; }

		public DateTime? modifyDate { get; set; }

		public bool isDeleted { get; set; }

		public bool isServerReplay { get; set; }

		public string tag { get; set; }

		public int noticeType { get; set; }

		public string type
		{
			get
			{
				return _type;
			}
			set
			{
				_type = value;
				if (string.IsNullOrEmpty(_type))
				{
					_type = "Normal";
				}
			}
		}

		public bool isChecked
		{
			get
			{
				if (type == "Feedback" && !isServerReplay)
				{
					return true;
				}
				return _isChecked;
			}
			set
			{
				_isChecked = value;
				if (this.PropertyChanged != null)
				{
					this.PropertyChanged(this, new PropertyChangedEventArgs("IsChecked"));
				}
			}
		}

		public event PropertyChangedEventHandler PropertyChanged;
	}
	public class LanguageNotices
	{
		public string Language { get; set; }

		public List<NoticeInfo> NoticeArr { get; set; }
	}
	public abstract class AbstractDataBase
	{
		public abstract List<PluginVersionModel> GetObject();

		public abstract void UpdateObject(List<PluginVersionModel> objs);
	}
	public class DeviceDataCollection : IDisposable
	{
		private string _Json_File_Name = Configurations.DefaultOptionsFileName;

		private string _Json_Property_Key = "devices";

		public static DeviceDataCollection Instance { get; private set; }

		private List<UserDeviceModel> _CacheLocalDevices { get; set; }

		public event Func<DeviceModel, bool> OnNewDeviceFound;

		public event EventHandler<UserDeviceModel> OnDevicesChanged;

		public void Initialize()
		{
			global::Smart.DeviceManagerEx.MasterDeviceChanged += MasterDeviceChangedHandler;
			UserService.Single.OnlineUserChanged += OnlineUserChangedHandler;
			if (Instance == null)
			{
				Instance = this;
			}
		}

		private void MasterDeviceChangedHandler(object sender, MasterDeviceChangedEventArgs e)
		{
			if (e.Current != null)
			{
				e.Current.SoftStatusChanged += Current_SoftStatusChanged;
				if ("985c66acdde2483ed96844a6b5ea4337" == HostProxy.HostNavigation.CurrentPluginID)
				{
					DeviceViewModel selectedItem = DeviceConnectViewModel.Instance.ConnectedDevices.FirstOrDefault((DeviceViewModel p) => p.Device.Identifer == e.Current.Identifer);
					DeviceConnectViewModel.Instance.SelectedItem = selectedItem;
				}
			}
			if (e.Previous != null)
			{
				e.Previous.SoftStatusChanged -= Current_SoftStatusChanged;
			}
		}

		private void Current_SoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			if (e == DeviceSoftStateEx.Online)
			{
				DeviceEx deviceEx = (DeviceEx)sender;
				if (MainWindowViewModel.SingleInstance.PluginArr.Count((PluginModel n) => n.Plugin != null && n.Plugin.IsExecuteWork()) == 0 && CheckUserValidity())
				{
					DeviceModel device = Convert(deviceEx.Property);
					WriteDeviceToFile(device, UserService.Single.CurrentLoggedInUser.UserId);
				}
			}
		}

		public List<DeviceModel> GetUserDevices()
		{
			return _CacheLocalDevices.FirstOrDefault((UserDeviceModel n) => n.UserID == UserService.Single.CurrentLoggedInUser.UserId)?.Devices;
		}

		public void Remove(DeviceModel device)
		{
			UserDeviceModel userDeviceModel = _CacheLocalDevices.FirstOrDefault((UserDeviceModel n) => n.UserID == UserService.Single.CurrentLoggedInUser.UserId);
			if (userDeviceModel == null || userDeviceModel.Devices == null || !userDeviceModel.Devices.Remove(device))
			{
				return;
			}
			FileHelper.WriteJsonWithAesEncrypt(_Json_File_Name, _Json_Property_Key, _CacheLocalDevices, async: true);
			if (!string.IsNullOrEmpty(device.id))
			{
				Task.Factory.StartNew(() => AppContext.WebApi.RequestContent(WebApiUrl.DELETE_USER_DEVICE, new Dictionary<string, List<int>> { 
				{
					"ids",
					new List<int> { int.Parse(device.id) }
				} }));
			}
		}

		public void Dispose()
		{
			_CacheLocalDevices.Clear();
			this.OnNewDeviceFound = null;
			this.OnDevicesChanged = null;
		}

		private void OnlineUserChangedHandler(object sender, OnlineUserChangedEventArgs e)
		{
			if (!e.IsOnline || e.UserInfo == null)
			{
				return;
			}
			if (_CacheLocalDevices == null)
			{
				GetLocalDevices();
			}
			UserDeviceModel userDeviceModel = _CacheLocalDevices.FirstOrDefault((UserDeviceModel n) => n.UserID == e.UserInfo.UserId);
			if (userDeviceModel == null)
			{
				userDeviceModel = new UserDeviceModel
				{
					UserID = e.UserInfo.UserId,
					Devices = new List<DeviceModel>()
				};
				_CacheLocalDevices.Add(userDeviceModel);
			}
			if (CheckUserValidity())
			{
				List<DeviceModel> devices = new List<DeviceModel>();
				if (userDeviceModel.Devices.Count > 0)
				{
					devices = userDeviceModel.Devices.Where((DeviceModel n) => !n.IsUpload).ToList();
				}
				UserDeviceModel userDeviceModel2 = new UserDeviceModel
				{
					UserID = e.UserInfo.UserId,
					Devices = devices
				};
				UserDeviceModel userDeviceModel3 = AppContext.WebApi.RequestContent<UserDeviceModel>(WebApiUrl.UPLOAD_USER_DEVICE, Convert(userDeviceModel2));
				if (userDeviceModel3 != null && userDeviceModel3.Devices != null && userDeviceModel3.Devices.Count > 0)
				{
					List<DeviceModel> list = new List<DeviceModel>();
					userDeviceModel3.Devices.ForEach(delegate(DeviceModel n)
					{
						n.IsUpload = true;
					});
					list.AddRange(userDeviceModel3.Devices);
					userDeviceModel.Devices.Clear();
					userDeviceModel.Devices.AddRange(list);
					FileHelper.WriteJsonWithAesEncrypt(_Json_File_Name, _Json_Property_Key, _CacheLocalDevices);
				}
				this.OnDevicesChanged?.Invoke(this, userDeviceModel);
			}
			else
			{
				userDeviceModel.Devices.Clear();
				FileHelper.WriteJsonWithAesEncrypt(_Json_File_Name, _Json_Property_Key, _CacheLocalDevices);
			}
		}

		private void WriteDeviceToFile(DeviceModel device, string userId)
		{
			UserDeviceModel userDeviceModel = null;
			if (_CacheLocalDevices != null && _CacheLocalDevices.Count > 0)
			{
				userDeviceModel = _CacheLocalDevices.FirstOrDefault((UserDeviceModel n) => n.UserID == userId);
			}
			bool flag = false;
			if (userDeviceModel == null)
			{
				flag = true;
				userDeviceModel = new UserDeviceModel
				{
					UserID = userId,
					Devices = new List<DeviceModel>()
				};
				_CacheLocalDevices.Add(userDeviceModel);
			}
			else if (!userDeviceModel.Devices.Exists((DeviceModel n) => n.Key == device.Key))
			{
				flag = true;
			}
			if (flag && this.OnNewDeviceFound != null && this.OnNewDeviceFound(device))
			{
				userDeviceModel.Devices.Add(device);
				FileHelper.WriteJsonWithAesEncrypt(_Json_File_Name, _Json_Property_Key, _CacheLocalDevices, async: true);
				this.OnDevicesChanged?.Invoke(this, userDeviceModel);
			}
		}

		private bool CheckUserValidity()
		{
			return UserService.Single.IsOnline && UserService.Single.CurrentLoggedInUser != null && !lenovo.mbg.service.lmsa.Login.Business.PermissionService.Single.CheckPermission(UserService.Single.CurrentLoggedInUser.UserId, "10", "1");
		}

		private DeviceModel Convert(IAndroidDevice device)
		{
			string text = null;
			if ("motorola".Equals(device.Brand, StringComparison.CurrentCultureIgnoreCase))
			{
				text = device.GetPropertyValue("ro.boot.hardware.sku");
				if (string.IsNullOrEmpty(text))
				{
					text = device.ModelName2;
				}
			}
			return new DeviceModel
			{
				ModelName = device.ModelName2,
				IMEI = device.IMEI1,
				IMEI2 = device.IMEI2,
				SN = device.SN,
				PN = device.PN,
				Brand = device.Brand,
				Category = device.Category,
				MotoModelName = text,
				Date = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss")
			};
		}

		private JObject Convert(UserDeviceModel userDeviceModel)
		{
			JObject jObject = new JObject();
			if (userDeviceModel != null)
			{
				JArray jarray = new JArray();
				jObject["registeredModels"] = jarray;
				if (userDeviceModel.Devices != null && userDeviceModel.Devices.Count > 0)
				{
					userDeviceModel.Devices.ForEach(delegate(DeviceModel n)
					{
						JObject item = new JObject
						{
							["modelName"] = n.ModelName,
							["imei"] = n.IMEI,
							["imei2"] = n.IMEI2,
							["sn"] = n.SN,
							["pn"] = n.PN,
							["registerDate"] = n.Date,
							["brand"] = n.Brand,
							["category"] = n.Category,
							["motoModelName"] = n.MotoModelName
						};
						jarray.Add(item);
					});
				}
			}
			return jObject;
		}

		public void GetLocalDevices()
		{
			string json = FileHelper.ReadWithAesDecrypt(_Json_File_Name, _Json_Property_Key);
			_CacheLocalDevices = JsonHelper.DeserializeJson2List<UserDeviceModel>(json);
			if (_CacheLocalDevices == null)
			{
				_CacheLocalDevices = new List<UserDeviceModel>();
			}
		}
	}
	public class UserDeviceModel
	{
		[JsonProperty("userId")]
		public string UserID { get; set; }

		[JsonProperty("registeredModels")]
		public List<DeviceModel> Devices { get; set; }
	}
	public class DeviceModel
	{
		public string id { get; set; }

		public bool IsUpload { get; set; }

		[JsonProperty("modelName")]
		public string ModelName { get; set; }

		[JsonProperty("imei")]
		public string IMEI { get; set; }

		[JsonProperty("imei2")]
		public string IMEI2 { get; set; }

		[JsonProperty("sn")]
		public string SN { get; set; }

		[JsonProperty("pn")]
		public string PN { get; set; }

		[JsonProperty("brand")]
		public string Brand { get; set; }

		[JsonProperty("category")]
		public string Category { get; set; }

		[JsonProperty("motoModelName")]
		public string MotoModelName { get; set; }

		[JsonIgnore]
		public string Key => "^" + ModelName + "|" + SN + "|$";

		[JsonIgnore]
		public string Remark { get; set; }

		[JsonProperty("registerDate")]
		public string Date { get; set; }
	}
	internal class DownloadSpeedCollection
	{
		private class CollectionDownloadInfo
		{
			private bool stoped = false;

			public string FileName { get; set; }

			public string OSProductName { get; set; }

			public long Seconds { get; set; }

			public string StartTime { get; set; }

			public void Initialize(DownloadInfo info)
			{
				FileName = info.FileName;
				StartTime = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss");
				OSProductName = SetOsProductName();
				if (info.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING)
				{
					Start();
				}
			}

			public void Start()
			{
				Task.Factory.StartNew(delegate
				{
					while (true)
					{
						Seconds++;
						if (stoped)
						{
							break;
						}
						Thread.Sleep(1000);
					}
				});
			}

			public void Stop()
			{
				stoped = true;
			}

			private string SetOsProductName()
			{
				GlobalFun.TryGetRegistryKey(RegistryHive.LocalMachine, "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion", "ProductName", out var value);
				string arg = (Environment.Is64BitOperatingSystem ? "x64" : "x86");
				return $"{value} {arg}";
			}
		}

		private static object locker = new object();

		private ConcurrentDictionary<string, CollectionDownloadInfo> _Cache { get; set; }

		public void CollectionAsync(DownloadInfo downloadinfo)
		{
			Task.Factory.StartNew(delegate
			{
				if (downloadinfo.FileType == "ROM")
				{
					if (downloadinfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING)
					{
						if (!_Cache.ContainsKey(downloadinfo.FileUrl))
						{
							CollectionDownloadInfo collectionDownloadInfo = new CollectionDownloadInfo();
							collectionDownloadInfo.Initialize(downloadinfo);
							_Cache.TryAdd(downloadinfo.FileUrl, collectionDownloadInfo);
						}
					}
					else
					{
						_Cache.TryRemove(downloadinfo.FileUrl, out var value);
						value?.Stop();
						if (downloadinfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.SUCCESS || downloadinfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPPING || downloadinfo.Status == lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPSUCCESS)
						{
							Upload(value, downloadinfo.FileSize);
						}
					}
				}
			});
		}

		public DownloadSpeedCollection()
		{
			Load();
			LoopWrite();
		}

		private void LoopWrite()
		{
			Task.Factory.StartNew(delegate
			{
				while (true)
				{
					Thread.Sleep(30000);
					Write();
				}
			});
		}

		private void Load()
		{
			_Cache = JsonHelper.DeserializeJson2Object<ConcurrentDictionary<string, CollectionDownloadInfo>>(FileHelper.ReadWithAesDecrypt(Configurations.DownloadSpeedPath));
			if (_Cache == null)
			{
				_Cache = new ConcurrentDictionary<string, CollectionDownloadInfo>();
			}
		}

		private void Upload(CollectionDownloadInfo info, long size)
		{
			if (info != null)
			{
				JObject jObject = new JObject();
				jObject["romName"] = info.FileName;
				jObject["downloadDuration"] = info.Seconds;
				jObject["downloadStart"] = info.StartTime;
				jObject["romSize"] = size;
				jObject["localPcos"] = info.OSProductName;
				AppContext.WebApi.RequestContent(WebApiUrl.UPLOAD_DOWNLOAD_SPEEDINFO, jObject);
				Write();
			}
		}

		private void Write()
		{
			if (_Cache.Count > 0)
			{
				FileHelper.WriteFileWithAesEncrypt(Configurations.DownloadSpeedPath, JsonHelper.SerializeObject2Json(_Cache));
			}
		}
	}
	public class LoadDownloadResources
	{
		private DownloadSpeedCollection _DownloadSpeedCollection;

		public void Load()
		{
			Tuple<List<DownloadInfo>, List<DownloadInfo>, List<string>> tuple = global::Smart.FileDownloadV6.Load();
			if (Regex.IsMatch(Configurations.DownloadPath, "\\s+"))
			{
				tuple.Item3.Add(Configurations.DownloadPath);
				DownloadControlViewModel.SingleInstance.DownloadSavePath = Regex.Replace(Configurations.DownloadPath, "\\s+", "");
			}
			GlobalFun.WriteRegistryKey("Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Rescue and Smart Assistant", "downloadpath", Configurations.DownloadPath);
			_DownloadSpeedCollection = new DownloadSpeedCollection();
			global::Smart.FileDownloadV6.OnRemoteDownloadStatusChanged += FileDownload_OnDownloadStatusChanged;
			if (tuple.Item1 != null)
			{
				List<DownloadInfo> list = tuple.Item1.OrderBy((DownloadInfo n) => n.CreateDateTime).ToList();
				foreach (DownloadInfo item in list)
				{
					if (item.FileType == "ROM" || item.FileType == "COUNTRYCODE" || item.ShowInUI)
					{
						item.LocalFileSize = GlobalFun.GetFileSize(Path.Combine(item.LocalPath, item.FileName + ".tmp"));
						item.Status = lenovo.mbg.service.framework.services.Download.DownloadStatus.MANUAL_PAUSE;
					}
					else
					{
						item.Status = lenovo.mbg.service.framework.services.Download.DownloadStatus.WAITTING;
					}
					global::Smart.FileDownloadV6.Add(item, autoStart: false);
					DownloadControlViewModel.SingleInstance.AddDownloadingTask(item);
				}
			}
			if (tuple.Item2 != null)
			{
				(from n in tuple.Item2
					where n.FileType == "ROM" || n.FileType == "COUNTRYCODE" || n.ShowInUI
					orderby n.CreateDateTime descending
					select n).ToList().ForEach(delegate(DownloadInfo n)
				{
					if (n.UnZip)
					{
						string text = Path.Combine(n.LocalPath, Path.GetFileNameWithoutExtension(n.FileName));
						if (Directory.Exists(text))
						{
							n.FileSize = GlobalFun.GetDirectorySize(text);
						}
						else
						{
							n.FileSize = GlobalFun.GetFileSize(Path.Combine(n.LocalPath, n.FileName));
						}
					}
					else
					{
						n.FileSize = GlobalFun.GetFileSize(Path.Combine(n.LocalPath, n.FileName));
					}
					DownloadControlViewModel.SingleInstance.AddDownloadedTask(n, insertFirst: false);
				});
			}
			if (tuple.Item3.Count > 0)
			{
				ProcessExistsSpaceDownloadPath(tuple.Item3);
			}
		}

		public static void ProcessExistsSpaceDownloadPath(List<string> list)
		{
			JArray jArray = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.DefaultOptionsFileName, "$.ExistSpacePathList");
			if (jArray != null && jArray.HasValues)
			{
				list.AddRange(jArray.Select((JToken n) => n.Value<string>()).ToList());
			}
			IEnumerator<string> enumerator = list.Distinct().GetEnumerator();
			List<string> result = new List<string>();
			while (enumerator.MoveNext())
			{
				string text = enumerator.Current;
				if (Directory.Exists(text) && text.Contains(" "))
				{
					int startIndex = text.LastIndexOf(' ');
					int num = text.IndexOf('\\', startIndex);
					if (num != -1)
					{
						text = text.Substring(0, num);
					}
					result.Add(text);
				}
			}
			result = result.Distinct().ToList();
			FileHelper.WriteJsonWithAesEncrypt(Configurations.DefaultOptionsFileName, "ExistSpacePathList", result);
			if (result.Count > 0)
			{
				ExistsSpacePathView view = null;
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					view = new ExistsSpacePathView();
					view.Init(result, "K2054");
				});
				MessageWindowHelper.Instance.Show(view, showNow: true, isAsynnc: false, null, null, null, null, true);
			}
		}

		private void FileDownload_OnDownloadStatusChanged(object sender, RemoteDownloadStatusEventArgs e)
		{
			DownloadInfo info = e.Info;
			_DownloadSpeedCollection.CollectionAsync(info);
			switch (e.Status)
			{
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.WAITTING:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.MANUAL_PAUSE:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.SUCCESS:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.ALREADYEXISTS:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPSUCCESS:
				if (info.FileType == "ROM" || info.FileType == "COUNTRYCODE" || info.ShowInUI)
				{
					DownloadControlViewModel.SingleInstance.Load(info);
				}
				break;
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.AUTO_PAUSE:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.FAILED:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.DELETED:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPPING:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPFAILED:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPNOSPACE:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.MD5CHECKFAILED:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.GETFILESIZEFAILED:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.UNENOUGHDISKSPACE:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.CREATEDIRECTORYFAILED:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADFILENOTFOUND:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.UNDEFINEERROR:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.NETWORKCONNECTIONERROR:
			case lenovo.mbg.service.framework.services.Download.DownloadStatus.FILERENAMEFAILED:
				break;
			}
		}
	}
	public class MenuPopupWindowBusiness
	{
		private class UserGuideWebServices
		{
			public string GetUserGuide()
			{
				JObject jObject = AppContext.WebApi.RequestContent<JObject>(WebApiUrl.USER_GUIDE, null);
				JProperty jProperty = jObject.Properties().FirstOrDefault((JProperty n) => n.Name.ToLower() == "guidefile");
				if (jProperty == null || jProperty.Value == null || jProperty.Value["uri"] == null)
				{
					return string.Empty;
				}
				return jProperty.Value["uri"].ToString();
			}

			public string CheckClientHelp()
			{
				JObject jObject = AppContext.WebApi.RequestContent<JObject>(WebApiUrl.HELP_URI, null);
				JProperty jProperty = jObject.Properties().FirstOrDefault((JProperty n) => n.Name.ToLower() == "url");
				if (jProperty == null || jProperty.Value == null)
				{
					return string.Empty;
				}
				return jProperty.Value.ToString();
			}
		}

		public string GetUserGuideUrl()
		{
			return new UserGuideWebServices().GetUserGuide();
		}

		public string GetClientHelpUrl()
		{
			return new UserGuideWebServices().CheckClientHelp();
		}
	}
	[XmlType(AnonymousType = true)]
	[XmlRoot(Namespace = "", IsNullable = false)]
	public class PluginCatalog
	{
		private PluginCatalogPlugin[] pluginsField;

		[XmlArrayItem("Plugin", IsNullable = false)]
		public PluginCatalogPlugin[] Plugins
		{
			get
			{
				return pluginsField;
			}
			set
			{
				pluginsField = value;
			}
		}
	}
	[XmlType(AnonymousType = true)]
	public class PluginCatalogPlugin
	{
		private string pluginIDField;

		private string pluginNameField;

		private string versionField;

		private string pluginDownloadUrlField;

		private string pluginDownloadNameField;

		private string pluginDownloadSizeField;

		private string pluginDownloadMD5Field;

		private string pluginAssemblyNameField;

		private string pluginIconPathField;

		private string pluginNameKeyField;

		private string descriptionField;

		private bool installField;

		private bool forceTypeField;

		private int bitsField;

		private int orderField;

		[XmlAttribute]
		public string PluginID
		{
			get
			{
				return pluginIDField;
			}
			set
			{
				pluginIDField = value;
			}
		}

		[XmlAttribute]
		public string PluginNameKey
		{
			get
			{
				return pluginNameKeyField;
			}
			set
			{
				pluginNameKeyField = value;
			}
		}

		[XmlAttribute]
		public string PluginName
		{
			get
			{
				return pluginNameField;
			}
			set
			{
				pluginNameField = value;
			}
		}

		[XmlAttribute]
		public string Version
		{
			get
			{
				return versionField;
			}
			set
			{
				versionField = value;
			}
		}

		[XmlAttribute]
		public string PluginDownloadUrl
		{
			get
			{
				return pluginDownloadUrlField;
			}
			set
			{
				pluginDownloadUrlField = value;
			}
		}

		[XmlAttribute]
		public string PluginDownloadName
		{
			get
			{
				return pluginDownloadNameField;
			}
			set
			{
				pluginDownloadNameField = value;
			}
		}

		[XmlAttribute]
		public string PluginDownloadSize
		{
			get
			{
				return pluginDownloadSizeField;
			}
			set
			{
				pluginDownloadSizeField = value;
			}
		}

		[XmlIgnore]
		public long DownloadSize
		{
			get
			{
				long result = 0L;
				long.TryParse(pluginDownloadSizeField, out result);
				return result;
			}
			set
			{
				pluginDownloadSizeField = value.ToString();
			}
		}

		[XmlAttribute]
		public string PluginDownloadMD5
		{
			get
			{
				return pluginDownloadMD5Field;
			}
			set
			{
				pluginDownloadMD5Field = value;
			}
		}

		[XmlAttribute]
		public string PluginAssemblyName
		{
			get
			{
				return pluginAssemblyNameField;
			}
			set
			{
				pluginAssemblyNameField = value;
			}
		}

		[XmlAttribute]
		public string PluginIconPath
		{
			get
			{
				return pluginIconPathField;
			}
			set
			{
				pluginIconPathField = value;
			}
		}

		[XmlAttribute]
		public string Description
		{
			get
			{
				return descriptionField;
			}
			set
			{
				descriptionField = value;
			}
		}

		[XmlAttribute]
		public bool Install
		{
			get
			{
				return installField;
			}
			set
			{
				installField = value;
			}
		}

		[XmlAttribute]
		public bool ForceType
		{
			get
			{
				return forceTypeField;
			}
			set
			{
				forceTypeField = value;
			}
		}

		[XmlAttribute]
		public int Bits
		{
			get
			{
				return bitsField;
			}
			set
			{
				bitsField = value;
			}
		}

		[XmlAttribute]
		public int Order
		{
			get
			{
				return orderField;
			}
			set
			{
				orderField = value;
			}
		}
	}
	public class PluginCatalogInfo
	{
		public string PluginID { get; set; }

		public string PluginName { get; set; }

		public string Version { get; set; }

		public string PluginDownloadUrl { get; set; }

		public string PluginDownloadName { get; set; }

		public long PluginDownloadSize { get; set; }

		public string PluginDownloadMD5 { get; set; }

		public string PluginAssemblyName { get; set; }

		public string PluginIconPath { get; set; }

		public string PluginUnIconPath { get; set; }

		public string Description { get; set; }

		public int Bits { get; set; }

		public bool Install { get; set; }

		public int VersionCode { get; set; }

		public bool ForceType { get; set; }
	}
	public class WebServiceProxy
	{
		private static WebServiceProxy _webServiceProxy;

		public static WebServiceProxy SingleInstance
		{
			get
			{
				if (_webServiceProxy == null)
				{
					_webServiceProxy = new WebServiceProxy();
				}
				return _webServiceProxy;
			}
		}

		public List<NoticeInfo> GetNotice()
		{
			return AppContext.WebApi.RequestContent<List<NoticeInfo>>(WebApiUrl.NOTICE_BROADCAST_URL, null);
		}

		public ResponseData<LoggingInResponseData> Login(LmsaUserLoginFormData data)
		{
			return Request<LmsaUserLoginFormData, LoggingInResponseData>(data, WebApiUrl.USER_RECORD_LOGIN);
		}

		public ResponseData<LoggingInResponseData> GuestLogin(object data)
		{
			return Request<object, LoggingInResponseData>(data, WebApiUrl.USER_GUEST_LOGIN);
		}

		public ResponseData<LoggingInResponseData> PasswordVerify(LmsaUserLoginFormData data)
		{
			return Request<LmsaUserLoginFormData, LoggingInResponseData>(data, WebApiUrl.USER_LOGIN);
		}

		public ResponseData<ChangePasswordResponseData> ChangePassowrd(ChangePasswordFormData data)
		{
			return Request<ChangePasswordFormData, ChangePasswordResponseData>(data, WebApiUrl.USER_CHANGE_PASSWORD);
		}

		public ResponseData<List<UserPermissionResponseData>> GetPermission(object data)
		{
			return Request<object, List<UserPermissionResponseData>>(data, WebApiUrl.PRIV_GET_PRIV_INFO);
		}

		public ResponseData<ForgotPasswordResponseData> ForgotPassowrd(ForgotPasswordFormData data)
		{
			return Request<ForgotPasswordFormData, ForgotPasswordResponseData>(data, WebApiUrl.USER_FORGOT_PASSWORD);
		}

		public ResponseData<LogoutReportResponseData> LogoutReport(LogoutReportFormData data)
		{
			return Request<LogoutReportFormData, LogoutReportResponseData>(data, WebApiUrl.USER_LOGOUT);
		}

		public ResponseData<object> reportConnectedAppType(string appType)
		{
			int num = ("Ma".Equals(appType) ? 1 : 0);
			dynamic val = new ExpandoObject();
			val.appType = num;
			return Request<object, object>(val, WebApiUrl.COLLECTION_ASSISTANTAPP, true);
		}

		private ResponseData<TResponseData> Request<TRequestData, TResponseData>(TRequestData requestData, string url, bool autoSubmitAgainWhenFailed = false)
		{
			ResponseData<TResponseData> responseData = new ResponseData<TResponseData>();
			ResponseModel<object> responseModel = AppContext.WebApi.RequestBase(url, requestData, 3, null, HttpMethod.POST, "application/json", author: true, autoSubmitAgainWhenFailed);
			if (responseModel.success)
			{
				responseData.Code = responseModel.code;
				responseData.Description = responseModel.desc;
			}
			else
			{
				responseData.Code = "1000";
				responseData.Description = "K0039";
			}
			if (!string.IsNullOrEmpty(responseModel.content?.ToString()))
			{
				TResponseData data = JsonConvert.DeserializeObject<TResponseData>(responseModel.content.ToString());
				responseData.Data = data;
			}
			return responseData;
		}
	}
	public class XmlPluginData : AbstractDataBase
	{
		private string pluginXmlPath { get; set; }

		private string pluginsPath { get; set; }

		public XmlPluginData(string pluginXmlPath, string pluginsPath)
		{
			this.pluginXmlPath = pluginXmlPath;
			this.pluginsPath = pluginsPath;
		}

		public override List<PluginVersionModel> GetObject()
		{
			LogHelper.LogInstance.Info("lenovo.mbg.service.common.utilities.XmlPluginData: GetObject() Start");
			List<PluginVersionModel> list = new List<PluginVersionModel>();
			try
			{
				if (XmlSerializeHelper.DeserializeFromFile<PluginCatalog>(pluginXmlPath) is PluginCatalog { Plugins: not null, Plugins: var plugins })
				{
					foreach (PluginCatalogPlugin pluginCatalogPlugin in plugins)
					{
						list.Add(ConvertPluginCatalogPlugin2PluginVersionModel(pluginCatalogPlugin));
					}
					list = list.OrderBy((PluginVersionModel n) => n.Order).ToList();
				}
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.common.utilities.XmlPluginData: GetObject() Exception", exception);
			}
			LogHelper.LogInstance.Info("lenovo.mbg.service.common.utilities.XmlPluginData: GetObject() End Success");
			return list;
		}

		public override void UpdateObject(List<PluginVersionModel> objs)
		{
			PluginCatalog pluginCatalog = new PluginCatalog();
			if (objs == null)
			{
				return;
			}
			List<PluginCatalogPlugin> list = new List<PluginCatalogPlugin>();
			foreach (PluginVersionModel obj in objs)
			{
				list.Add(ConvertPluginVersionModel2PluginCatalogPlugin(obj));
			}
			pluginCatalog.Plugins = list.ToArray();
			string baseDirectory = AppDomain.CurrentDomain.BaseDirectory;
			string fileName = pluginXmlPath;
			try
			{
				XmlSerializeHelper.Serializer<PluginCatalog>(fileName, pluginCatalog);
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.common.utilities.XmlPluginData: UpdateObject() Exception", exception);
			}
		}

		private PluginVersionModel ConvertPluginCatalogPlugin2PluginVersionModel(PluginCatalogPlugin pluginCatalogPlugin)
		{
			return new PluginVersionModel
			{
				PluginID = pluginCatalogPlugin.PluginID,
				VersionName = pluginCatalogPlugin.PluginName,
				DisplayName = pluginCatalogPlugin.PluginNameKey,
				Version = pluginCatalogPlugin.Version,
				PluginAssemblyName = pluginCatalogPlugin.PluginAssemblyName,
				Bits = pluginCatalogPlugin.Bits,
				Description = pluginCatalogPlugin.Description,
				Install = pluginCatalogPlugin.Install,
				ForceType = pluginCatalogPlugin.ForceType,
				PluginIconPath = pluginCatalogPlugin.PluginIconPath,
				Order = pluginCatalogPlugin.Order,
				Valid = true
			};
		}

		private PluginCatalogPlugin ConvertPluginVersionModel2PluginCatalogPlugin(PluginVersionModel pluginVersionModel)
		{
			return new PluginCatalogPlugin
			{
				PluginID = pluginVersionModel.PluginID,
				PluginName = pluginVersionModel.VersionName,
				Version = pluginVersionModel.Version,
				PluginAssemblyName = pluginVersionModel.PluginAssemblyName,
				Bits = pluginVersionModel.Bits,
				Description = pluginVersionModel.Description,
				Install = pluginVersionModel.Install,
				ForceType = pluginVersionModel.ForceType,
				Order = pluginVersionModel.Order
			};
		}
	}
	public class MainWindowControl : RaisePropertyBase
	{
		public static PluginController m_pluginController;

		private static volatile MainWindowControl _instance = null;

		private static readonly object lockHelper = new object();

		public static MainWindowControl Instance
		{
			get
			{
				if (_instance == null)
				{
					lock (lockHelper)
					{
						if (_instance == null)
						{
							_instance = new MainWindowControl();
						}
					}
				}
				return _instance;
			}
		}

		public List<PluginInfo> LoadPlguinInfo()
		{
			List<PluginInfo> list = new List<PluginInfo>();
			object obj = ApplcationClass.PluginDataBase.GetObject();
			if (obj != null)
			{
				List<PluginVersionModel> list2 = (List<PluginVersionModel>)obj;
				foreach (PluginVersionModel item in list2)
				{
					list.Add(new PluginInfo
					{
						PluginID = item.PluginID,
						PluginName = item.VersionName,
						DisplayName = item.DisplayName,
						Version = item.Version,
						PluginDownloadUrl = item.downloadUrl,
						PluginDir = Path.Combine(ApplcationClass.PluginsPath, item.PluginID),
						PluginIconPath = item.PluginIconPath,
						Bits = item.Bits,
						Description = item.Description,
						Install = item.Install,
						haveNewVersion = item.haveNewVersion,
						Order = item.Order
					});
				}
			}
			return list;
		}
	}
	public class RaisePropertyBase : INotifyPropertyChanged
	{
		public event PropertyChangedEventHandler PropertyChanged;

		protected void RaisePropertyChanged(string name)
		{
			if (this.PropertyChanged != null)
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(name));
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.Business.Notice
{
	public class FeedbackNotice : INoticeSource
	{
		public class FeedbackNoticeTag
		{
			public string UserId { get; set; }
		}

		private FeedBackBLL bll = new FeedBackBLL();

		private List<FeedBackNodeModel> feedbacks = null;

		public string NoticeType { get; set; }

		public FeedbackNotice()
		{
			NoticeType = "Feedback";
		}

		public async void Show(NoticeInfo notice)
		{
			if (notice == null)
			{
				return;
			}
			FeedBackNodeModel feedback = await bll.GetFeedbackDetailAsync(notice.id);
			if (feedback == null)
			{
				return;
			}
			List<FeedbackItemViewModel> viewModels = bll.CreateFeedbackItemViewModels(feedback);
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					FeedbackListViewV6 feedbackListViewV = new FeedbackListViewV6();
					((FrameworkElement)feedbackListViewV).DataContext = new FeedbackListViewModelV6
					{
						FeedBack = feedback,
						WinTitle = notice.noticeTitle,
						FeedbackItems = new ObservableCollection<FeedbackItemViewModel>(viewModels)
					};
					FeedbackListViewV6 win = feedbackListViewV;
					MessageWindowHelper.Instance.Show(win, true);
				});
			}
		}

		public List<NoticeInfo> GetNoticesAsync()
		{
			OnlineUserInfo currentLoggedInUser = UserService.Single.CurrentLoggedInUser;
			if (currentLoggedInUser == null)
			{
				return null;
			}
			feedbacks = bll.GetFeedbackIdAndTimeListAsync().Result;
			if (feedbacks == null)
			{
				return null;
			}
			List<NoticeInfo> list = new List<NoticeInfo>();
			foreach (FeedBackNodeModel feedback in feedbacks)
			{
				string text = (string.IsNullOrEmpty(feedback.Title) ? string.Empty : feedback.Title);
				text = ((text.Length > 25) ? (text.Substring(0, 25) + "...") : text);
				FeedbackNoticeTag feedbackNoticeTag = new FeedbackNoticeTag();
				feedbackNoticeTag.UserId = currentLoggedInUser.UserId;
				list.Add(new NoticeInfo
				{
					id = feedback.Id.GetValueOrDefault(),
					noticeTitle = text,
					modifyDate = feedback.Date,
					type = NoticeType,
					noticeContent = string.Empty,
					isServerReplay = feedback.IsServerReplay,
					noticeType = 0,
					tag = JsonHelper.SerializeObject2Json(feedbackNoticeTag)
				});
			}
			return list;
		}

		public List<NoticeInfo> Filter(List<NoticeInfo> source)
		{
			string text = UserService.Single.CurrentLoggedInUser?.UserId;
			NoticeInfo noticeInfo = null;
			List<NoticeInfo> list = source.Where((NoticeInfo m) => NoticeType.Equals(m.type)).ToList();
			for (int num = list.Count - 1; num >= 0; num--)
			{
				noticeInfo = list[num];
				if (NoticeType.Equals(noticeInfo.type))
				{
					if (string.IsNullOrEmpty(text))
					{
						list.RemoveAt(num);
					}
					else
					{
						FeedbackNoticeTag feedbackNoticeTag = JsonHelper.DeserializeJson2Object<FeedbackNoticeTag>(noticeInfo.tag);
						if (feedbackNoticeTag == null || !text.Equals(feedbackNoticeTag.UserId))
						{
							list.RemoveAt(num);
						}
					}
				}
			}
			return list;
		}
	}
	public class NormalNotice : INoticeSource
	{
		public string NoticeType { get; set; }

		public NormalNotice()
		{
			NoticeType = "Normal";
		}

		public List<NoticeInfo> Filter(List<NoticeInfo> source)
		{
			return source.Where((NoticeInfo m) => NoticeType.Equals(m.type)).ToList();
		}

		public List<NoticeInfo> GetNoticesAsync()
		{
			return AppContext.WebApi.RequestContent<List<NoticeInfo>>(WebApiUrl.NOTICE_URL, null);
		}

		public async void Show(NoticeInfo notice)
		{
			if (notice != null)
			{
				await MessageWindowHelper.Instance.Show(notice.noticeTitle, notice.noticeContent, "K0327", null, showClose: false, (MessageBoxImage)48, null, isPrivacy: false, showNow: false, isAsynnc: false, null, null, null, null, true);
			}
		}
	}
	public class Notice
	{
		public int id { get; set; }

		public string noticeTitle { get; set; }

		public string noticeContent { get; set; }

		public DateTime modifyDate { get; set; }

		public bool isDeleted { get; set; }

		public bool isChecked { get; set; }

		public string type { get; set; }
	}
	public interface INoticeSource
	{
		string NoticeType { get; set; }

		List<NoticeInfo> GetNoticesAsync();

		void Show(NoticeInfo notice);

		List<NoticeInfo> Filter(List<NoticeInfo> source);
	}
}
