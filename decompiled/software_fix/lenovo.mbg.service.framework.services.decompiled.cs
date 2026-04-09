using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.Composition;
using System.Diagnostics;
using System.Globalization;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Windows;
using GoogleAnalytics;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.framework.services.Device;
using lenovo.mbg.service.framework.services.Download;
using lenovo.mbg.service.framework.services.Model;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.framework.services")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("lenovo.mbg.service.framework.services")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Guid("0ba38539-23c2-4b25-9bb3-f7e7a493f6ce")]
[assembly: AssemblyFileVersion("1.1.0.0")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("1.1.0.0")]
namespace lenovo.mbg.service.framework.services
{
	public enum DownloadStatus
	{
		WAITTING,
		DOWNLOADING,
		PAUSE,
		FAILED,
		SUCCESS,
		MD5CHECKFAILED,
		GETFILESIZEFAILED,
		UNENOUGHDISKSPACE,
		CREATEDIRECTORYFAILED,
		DOWNLOADFILENOTFOUND,
		UNDEFINEERROR,
		NETWORKCONNECTIONERROR,
		FILERENAMEFAILED
	}
	public interface IBase : IDisposable
	{
		InterfaceType Load<InterfaceType>(string typeName);

		InterfaceType LoadCached<InterfaceType>();

		InterfaceType LoadNew<InterfaceType>(string typeName);
	}
	public interface ICheckVersion
	{
		bool Check(string device, string config, Dictionary<string, string> aparams);
	}
	public interface IConfigService
	{
		Dictionary<string, string> getConfigs(string type, List<string> keys);

		string getConfig(string type, string key);
	}
	public interface IDownloadService : IDisposable
	{
		event EventHandler<DownloadEventArgs> OnDownloadStatusChanged;
	}
	public class DownloadEventArgs : EventArgs
	{
		public string downloadUrl { get; set; }

		public string downloadFileName { get; set; }

		public string saveLocalPath { get; set; }

		public long downloadFileSize { get; set; }

		public string downloadMD5 { get; set; }

		public DownloadStatus downloadStatus { get; set; }

		public int priorityLevel { get; set; }
	}
	public interface IGlobalCache
	{
		object Get(string key);

		object AddOrUpdate(string key, object value);
	}
	public interface IGoogleAnalyticsTracker
	{
		Tracker Tracker { get; }

		void Send(IDictionary<string, string> data);
	}
	public interface IHostNavigation
	{
		string CurrentPluginID { get; set; }

		object CurrentPage { get; set; }

		void SwitchTo(string pluginID);

		void SwitchTo(string pluginID, object data);
	}
	public interface IHostOperationService
	{
		IntPtr ShowMaskLayer(string uid, WindowState state = (WindowState)0);

		void CloseMaskLayer(string uid);

		string GetAppVersion();

		void ShowGuideTips();

		void ShowFeedBack();

		void ShowBannerAsync(object data);
	}
	public interface ILanguage
	{
		string GetLanguageRootDir();

		RegionInfo GetCurrentRegionInfo();

		string GetCurrentLanguage();

		bool IsNeedTranslate();

		string Translate(string soreceLanguage);

		void LoadCommLanguagePackage();

		void SetCurrentLanguage(string selectLanguage);

		bool IsChinaRegionAndLanguage();
	}
	public class NotifyEventProxy
	{
		public Action<string> OnNotifyLanguageChangeAction;

		public void CallNotifyLanguageChangeAction(string param)
		{
			if (OnNotifyLanguageChangeAction != null)
			{
				OnNotifyLanguageChangeAction(param);
			}
		}
	}
	public interface IPermission
	{
		bool? AppModuleIsReady(DeviceEx device, List<string> permissionModuleNames);

		Task BeginCheckAppIsReady(DeviceEx device, List<string> permissionModuleNames, Action<bool?> finalResultRepoter);

		void BeginRollPollingAppModuleIsReady(DeviceEx device, List<string> permissionModuleNames, CancellationTokenSource cancelToken, Action<bool?> finalResultRepoter, int periodTime = 1000);

		Task BeginConfirmAppIsReady(DeviceEx device, string permissionModule, CancellationTokenSource cancelToken, Action<bool?> finalResultRepoter);
	}
	public interface IPlugin
	{
		void Init();

		FrameworkElement CreateControl(IMessageBox iMsg);

		bool CanClose();

		bool IsExecuteWork();

		void OnSelected(string val);

		void OnSelecting(string val);

		void OnInit(object data);

		bool IsNonBusinessPage();
	}
	public interface IUserMsgControl
	{
		bool? Result { get; set; }

		Action<bool?> CloseAction { get; set; }

		Action<bool?> CallBackAction { get; set; }

		Window GetMsgUi();
	}
	public enum UserMsgWndData
	{
		NONE,
		CanCloseByOthers
	}
	public interface IMessageBox
	{
		void ShowDownloadCenter(bool isShow = true);

		void SelRegistedDevIfExist(string category, Action<string> callBack = null);

		void CallMotoCare(string imei, object wModel);

		Task ShowQuitSurvey();

		void ShowMutilIcon(bool showIcon, bool showList);

		void ChangeIsEnabled(bool isEnabled, string pluginId);

		Task ShowB2BExpired(int _modeType);

		Task ShowB2BRemind(int used, int total);

		void ShowMutilTutorials(bool show);

		void ChangePinStoryboard(bool start);

		void SetDriverButtonStatus(string _code);

		void SetDeviceConnectIconStatus(int _status);

		void LogOut();
	}
	public interface IHost : IServiceProvider
	{
		IntPtr HostMainWindowHandle { get; }

		int HostProcessId { get; }

		T GetService<T>(string name);

		void RegisterService(string name, object value);
	}
	public interface IPluginMetadata
	{
		string PluginId { get; }
	}
	public interface IResourcesLoggingService
	{
		void RegisterFile(string path);

		void RegisterDir(string path);
	}
	public interface IRsd
	{
		DownloadInfo GetDownloadedResource(string downloadurl, out string filePath);

		Dictionary<string, List<DownloadInfo>> LoadCopyRomResources(List<string> desriptionFilePaths);

		Dictionary<string, List<DownloadInfo>> ValidateCopyRomResources(Dictionary<string, List<DownloadInfo>> sources);

		int Unzip(DownloadInfo downloadInfo);
	}
	public interface IUser
	{
		UserInfo user { get; }

		bool onLine { get; }

		event EventHandler<UserInfoArgs> OnUserChanged;

		void FireUserChanged(UserInfoArgs user);
	}
	public interface IUserBehaviorService
	{
		void InitUser(string user);

		void Collect(BusinessType business, BusinessData data);

		List<BehaviorModel> GetAll();
	}
	public interface IViewContext
	{
		FrameworkElement SwitchView(ViewDescription view);

		FrameworkElement SwitchView(ViewDescription view, object initilizeData);

		FrameworkElement SwitchView(ViewDescription view, object initilizeData, bool reload, bool reloadData = false);

		TViewModel FindViewModel<TViewModel>(Type viewType, string uiid = null) where TViewModel : IViewModelBase;

		FrameworkElement FindView(Type viewType, string uiid = null);
	}
	public interface IViewModelBase
	{
		void LoadData();

		void LoadData(object data);

		void Reset();
	}
	[MetadataAttribute]
	[AttributeUsage(AttributeTargets.Class, AllowMultiple = false)]
	public class PluginExportAttribute : ExportAttribute
	{
		public string PluginId { get; private set; }

		public PluginExportAttribute(Type contractType, string pluginId)
			: base(contractType)
		{
			PluginId = pluginId;
		}
	}
	public class RuntimeContext
	{
		private DeviceEx device;

		private ConcurrentDictionary<Type, object> objContainer = new ConcurrentDictionary<Type, object>();

		private RuntimeContext(DeviceEx device)
		{
			this.device = device;
		}

		public T GetDevice<T>() where T : DeviceEx
		{
			return device as T;
		}

		public T RegisterOrGetObj<T>()
		{
			T val = Activator.CreateInstance<T>();
			Type typeFromHandle = typeof(T);
			if (objContainer.TryAdd(typeFromHandle, val))
			{
				return val;
			}
			return default(T);
		}
	}
	public class UserInfo
	{
		public string UserId { get; set; }

		public string UserName { get; set; }

		public string EmailAddress { get; set; }

		public string Country { get; set; }

		public string FullName { get; set; }

		public string PhoneNumber { get; set; }

		public string UserSource { get; set; }

		public bool IsB2BSupportMultDev { get; set; }

		public Dictionary<string, object> Config { get; set; }
	}
	public class UserInfoArgs : EventArgs
	{
		public UserInfo User { get; }

		public bool online { get; }

		public UserInfoArgs(UserInfo user, bool online)
		{
			User = user;
			this.online = online;
		}
	}
	public abstract class PluginBase : IPlugin
	{
		public static ILanguage LangHelper;

		public abstract FrameworkElement CreateControl(IMessageBox iMessage);

		public virtual object GetService(Type serviceType)
		{
			if (serviceType.IsAssignableFrom(GetType()))
			{
				return this;
			}
			return null;
		}

		public virtual void Dispose()
		{
		}

		public virtual bool CanClose()
		{
			return true;
		}

		public virtual bool IsExecuteWork()
		{
			return false;
		}

		public virtual void OnSelected(string val)
		{
		}

		public void OnSelecting(string val)
		{
		}

		public abstract void Init();

		public virtual void OnInit(object data)
		{
		}

		public virtual bool IsNonBusinessPage()
		{
			return true;
		}
	}
	public static class ServiceProviderUtil
	{
		public static T GetService<T>(this IServiceProvider provider) where T : class
		{
			return (T)provider.GetService(typeof(T));
		}
	}
	public class ViewDescription
	{
		public string UIID { get; private set; }

		public Type ViewType { get; private set; }

		public Type ViewModelType { get; private set; }

		public FrameworkElement View { get; set; }

		public IViewModelBase ViewModel { get; set; }

		public ViewDescription(Type viewType, Type viewModelType, string uiid = null)
		{
			ViewType = viewType;
			ViewModelType = viewModelType;
			UIID = ViewType.FullName + uiid;
		}
	}
	[Serializable]
	public class WindowMessageGeneratedEventArgs : EventArgs
	{
		public IntPtr HWnd { get; set; }

		public IntPtr LParam { get; set; }

		public int Msg { get; set; }

		public IntPtr WParam { get; set; }

		public WindowMessageGeneratedEventArgs()
		{
		}

		public WindowMessageGeneratedEventArgs(IntPtr hWnd, int msg, IntPtr wparam, IntPtr lparam)
		{
			HWnd = hWnd;
			Msg = msg;
			WParam = wparam;
			LParam = LParam;
		}
	}
}
namespace lenovo.mbg.service.framework.services.Model
{
	public class BehaviorModel : BusinessModel
	{
		public string user;

		public int count;

		public string dateTime;

		public List<BusinessData> data;
	}
	public class BusinessData
	{
		public string appType { get; set; }

		public string connectType { get; set; }

		public string androidVersion { get; set; }

		public string modelName { get; set; }

		public string useCaseStep { get; set; }

		public long cycleTime { get; set; }

		public BusinessStatus status { get; set; }

		public string clientDate { get; set; }

		public JObject extraData { get; set; }

		public BusinessData()
		{
		}

		public static BusinessData Clone(BusinessData data)
		{
			return new BusinessData((BusinessType)Enum.Parse(typeof(BusinessType), data.useCaseStep), null)
			{
				appType = data.appType,
				connectType = data.connectType,
				androidVersion = data.androidVersion,
				useCaseStep = data.useCaseStep,
				status = data.status,
				clientDate = data.clientDate,
				extraData = new JObject(data.extraData),
				modelName = data.modelName,
				cycleTime = data.cycleTime
			};
		}

		public BusinessData(BusinessType subBusiness, DeviceEx device, BusinessStatus status = BusinessStatus.CLICK)
		{
			cycleTime = 0L;
			useCaseStep = subBusiness.ToString();
			this.status = status;
			appType = device?.ConnectedAppType;
			connectType = device?.ConnectType.ToString();
			androidVersion = device?.Property?.AndroidVersion;
			modelName = device?.Property?.ModelName;
			clientDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
			extraData = new JObject();
			JToken value = null;
			if (device != null && device.Property != null)
			{
				value = JToken.FromObject(device.Property);
			}
			extraData.Add("device", value);
			extraData.Add("data", null);
		}

		public BusinessData Update(long useTime, BusinessStatus status, object extraData)
		{
			return Update(useTime, status, null, extraData);
		}

		public BusinessData Update(long useTime, BusinessStatus status, string modelName, object extraData)
		{
			cycleTime = useTime / 1000;
			this.status = status;
			if (!string.IsNullOrEmpty(modelName))
			{
				this.modelName = modelName;
			}
			if (extraData != null)
			{
				this.extraData["data"] = JToken.FromObject(extraData);
			}
			return this;
		}
	}
	public class BusinessModel
	{
		public BusinessType business;

		public string businessName;
	}
	public enum BusinessStatus
	{
		CLICK = 0,
		SUCCESS = 10,
		FALIED = 20,
		QUIT = 30
	}
	public enum BusinessType
	{
		HOME = 1000,
		APP = 1100,
		APP_UNINSTALL = 1110,
		APP_EXPORT = 1120,
		PICTURE = 1200,
		PICTURE_IMPORT = 1210,
		PICTURE_EXPORT = 1220,
		PICTURE_DELETE = 1230,
		SONG = 1300,
		SONG_IMPORT = 1310,
		SONG_EXPORT = 1320,
		SONG_DELETE = 1330,
		SONG_SET_RINGTONE = 1340,
		SONG_PLAY = 1350,
		VIDEO = 1400,
		VIDEO_IMPORT = 1410,
		VIDEO_EXPORT = 1420,
		VIDEO_DELETE = 1430,
		CONTACT = 1500,
		CONTACT_IMPORT = 1510,
		CONTACT_EXPORT = 1520,
		CONTACT_DELETE = 1530,
		CONTACT_ADD = 1540,
		CONTACT_CALLLOG_IMPORT = 1550,
		FILE = 1600,
		FILE_IMPORT = 1610,
		FILE_EXPORT = 1620,
		SMS_IMPORT = 1710,
		SMS_EXPORT = 1720,
		ONEKEYCLONE = 1800,
		ONEKEYCLONE_CLONE = 1810,
		BACKUPRESTORE = 2000,
		BACKUPRESTORE_BACKUP = 2010,
		BACKUPRESTORE_RESTORE = 2020,
		CLIP_BOARD = 2100,
		CLIP_BOARD_IMPORT = 2110,
		CLIP_BOARD_EXPORT = 2120,
		GIF_MAKER = 2200,
		GIF_MAKER_CREATEGIF = 2210,
		RINGTONE_MAKER = 2300,
		RINGTONE_MAKER_SETASRINGTONE = 2310,
		RINGTONE_MAKER_SAVE2DEVICE = 2320,
		SCREEN_RECORDER = 2400,
		SCREEN_RECORDER_USED = 2410,
		SCREEN_RECORDER_EXPORT = 2420,
		SCREEN_RECORDER_DELETE = 2430,
		RESCUE_IMEI_SEARCH = 3010,
		RESCUE_SN_SEARCH = 3020,
		RESCUE_MANUAL_PHONE_FLASH = 3030,
		RESCUE_MANUAL_TABLET_FLASH = 3040,
		RESCUE_MANUAL_SMART_FLASH = 3045,
		RESCUE_AUTO_PHONE_FLASH = 3050,
		RESCUE_AUTO_TABLET_FLASH = 3060,
		RESCUE_AUTO_SMART_FLASH = 3065,
		RESCUE_AUTO_PHONE_MATCH = 3070,
		RESCUE_AUTO_TABLET_MATCH = 3071,
		RESCUE_AUTO_SMART_MATCH = 3072,
		RESCUE_IMEI_MATCH = 3073,
		RESCUE_SN_MATCH = 3074,
		RESCUE_MANUAL_FASTBOOT_MATCH = 3075,
		RESCUE_MANUAL_PHONE_MATCH = 3076,
		RESCUE_MANUAL_TABLET_MATCH = 3077,
		RESCUE_MANUAL_SMART_MATCH = 3078,
		SUPPORT = 4000,
		SUPPORT_MOLI = 4010,
		SUPPORT_TIPS = 4020,
		SUPPORT_FORUM = 4030,
		SUPPORT_WARRRANTY = 4040,
		HARDWARETEST_START = 5000,
		HARDWARETEST_FINISHED = 5010,
		FEEDBACK = 8000,
		SURVEY_QUIT = 9900
	}
}
namespace lenovo.mbg.service.framework.services.Download
{
	[Serializable]
	public class DownloadInfo : EventArgs, INotifyPropertyChanged
	{
		[JsonIgnore]
		public Action<DownloadStatus> OnComplete;

		private bool isManualMatch;

		private string _originalFileName;

		private string _FileName;

		private string _Speed;

		private double _Progress;

		private DownloadStatus _Status;

		private long _LocalFileSize;

		private long _FileSize;

		private string _FileType;

		private string _DownloadUrl;

		private string _LocalPath;

		private bool _ShowInUI = true;

		private string _MD5;

		private string _NeedTakesTime;

		private bool _UnZip;

		private string _LocalFileSizeStr = "0MB";

		private string _FileSizeStr = "0MB";

		private string _ErrorMessage = "";

		public string FileType
		{
			get
			{
				return _FileType;
			}
			set
			{
				_FileType = FileTypeConverter(value);
				FirePropertyChangedEvent("FileType");
			}
		}

		public string FileUrl { get; private set; }

		public string DownloadUrl
		{
			get
			{
				return _DownloadUrl;
			}
			set
			{
				_DownloadUrl = value;
				FileUrl = _DownloadUrl.Split(new char[1] { '?' })[0];
				OriginalFileName = GetFileName(FileUrl);
			}
		}

		[JsonIgnore]
		public string FileName
		{
			get
			{
				return _FileName;
			}
			private set
			{
				_FileName = value;
				FirePropertyChangedEvent("FileName");
			}
		}

		public string OriginalFileName
		{
			get
			{
				return _originalFileName;
			}
			private set
			{
				_originalFileName = value;
				Regex regex = new Regex("-|\\\\|\\/|:|\\*|\\?|\\<|\\>|\"");
				FileName = regex.Replace(HttpUtility.UrlDecode(_originalFileName), "_");
			}
		}

		public string LocalPath
		{
			get
			{
				return _LocalPath;
			}
			set
			{
				_LocalPath = value;
				FirePropertyChangedEvent("LocalPath");
			}
		}

		public long FileSize
		{
			get
			{
				return _FileSize;
			}
			set
			{
				_FileSize = value;
				FileSizeStr = ConvertLong2String2(value);
				FirePropertyChangedEvent("FileSize");
			}
		}

		public string MD5
		{
			get
			{
				return _MD5;
			}
			set
			{
				_MD5 = value;
				FirePropertyChangedEvent("MD5");
			}
		}

		public bool ShowInUI
		{
			get
			{
				return _ShowInUI;
			}
			set
			{
				_ShowInUI = value;
				FirePropertyChangedEvent("ShowInUI");
			}
		}

		private DateTime _CreateDateTime { get; set; }

		public DateTime CreateDateTime
		{
			get
			{
				return _CreateDateTime;
			}
			set
			{
				_CreateDateTime = value;
			}
		}

		[JsonIgnore]
		public string Speed
		{
			get
			{
				return _Speed;
			}
			set
			{
				_Speed = value;
				FirePropertyChangedEvent("Speed");
			}
		}

		public string NeedTakesTime
		{
			get
			{
				return _NeedTakesTime;
			}
			set
			{
				_NeedTakesTime = value;
				FirePropertyChangedEvent("NeedTakesTime");
			}
		}

		[JsonIgnore]
		public double Progress
		{
			get
			{
				return _Progress;
			}
			set
			{
				_Progress = value;
				FirePropertyChangedEvent("Progress");
			}
		}

		[JsonConverter(typeof(StringEnumConverter))]
		public DownloadStatus Status
		{
			get
			{
				return _Status;
			}
			set
			{
				_Status = value;
				FirePropertyChangedEvent("Status");
			}
		}

		[JsonIgnore]
		public long LocalFileSize
		{
			get
			{
				return _LocalFileSize;
			}
			set
			{
				_LocalFileSize = value;
				LocalFileSizeStr = ConvertLong2String2(value);
				FirePropertyChangedEvent("LocalFileSize");
			}
		}

		public bool UnZip
		{
			get
			{
				return _UnZip;
			}
			set
			{
				_UnZip = value;
				FirePropertyChangedEvent("UnZip");
			}
		}

		public string ZipPwd { get; set; }

		[JsonIgnore]
		public string LocalFileSizeStr
		{
			get
			{
				return _LocalFileSizeStr;
			}
			set
			{
				_LocalFileSizeStr = value;
				FirePropertyChangedEvent("LocalFileSizeStr");
			}
		}

		[JsonIgnore]
		public string FileSizeStr
		{
			get
			{
				return _FileSizeStr;
			}
			set
			{
				_FileSizeStr = value;
				FirePropertyChangedEvent("FileSizeStr");
			}
		}

		[JsonIgnore]
		public string ErrorMessage
		{
			get
			{
				return _ErrorMessage;
			}
			set
			{
				_ErrorMessage = value;
				FirePropertyChangedEvent("ErrorMessage");
			}
		}

		public bool IsManualMatch
		{
			get
			{
				return isManualMatch;
			}
			set
			{
				isManualMatch = value;
				FirePropertyChangedEvent("IsManualMatch");
			}
		}

		public event PropertyChangedEventHandler PropertyChanged;

		public virtual bool CanDownload()
		{
			return true;
		}

		public DownloadInfo()
		{
			Speed = "0KB/S";
			Progress = 0.0;
			FileType = "UNKNOWN";
			CreateDateTime = DateTime.Now;
		}

		public DownloadInfo(string FileUrl, string LocalPath, long FileSize, string MD5, string FileType = "UNKNOWN")
			: this(FileUrl, LocalPath, FileSize, MD5, FileType, null)
		{
		}

		public DownloadInfo(string FileUrl, string LocalPath, long FileSize, string MD5, string FileType, Action<DownloadStatus> OnComplete, bool ShowInUI = false)
		{
			this.FileType = FileType;
			DownloadUrl = FileUrl;
			this.LocalPath = LocalPath;
			this.FileSize = FileSize;
			this.MD5 = MD5;
			CreateDateTime = DateTime.Now;
			this.ShowInUI = true;
			Speed = "0KB/S";
			Progress = 0.0;
			this.OnComplete = OnComplete;
		}

		public void FireComplete(DownloadStatus status)
		{
			try
			{
				if (OnComplete != null)
				{
					OnComplete.BeginInvoke(status, null, null);
				}
			}
			catch (Exception)
			{
			}
		}

		protected string GetFileName(string fileUrl)
		{
			string[] array = Regex.Split(fileUrl, "\\\\|/");
			if (array != null && array.Length != 0)
			{
				return array[^1];
			}
			return fileUrl;
		}

		protected void FirePropertyChangedEvent(string propertyName)
		{
			if (this.PropertyChanged != null)
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}

		private string FileTypeConverter(string data)
		{
			string result = "UNKNOWN";
			if (string.IsNullOrEmpty(data))
			{
				return result;
			}
			switch (data.ToUpper())
			{
			case "APK":
				return "APK";
			case "ICON":
				return "ICON";
			case "ROM":
				return "ROM";
			case "TOOL":
				return "TOOL";
			case "COUNTRYCODE":
			case "COUNTRY_CODE":
				return "COUNTRYCODE";
			case "JSON":
				return "JSON";
			case "BANNER_ICON":
			case "BANNER":
				return "BANNER";
			case "XAML":
				return "XAML";
			default:
				return "UNKNOWN";
			}
		}

		private string ConvertLong2String2(long bytes)
		{
			string text = "F1";
			float num = bytes;
			if (bytes == 0L)
			{
				return "0MB";
			}
			if (bytes > 1000)
			{
				if (bytes >= 1024000)
				{
					if (bytes >= 1024000000)
					{
						return (num / 1.0737418E+09f).ToString(text) + "GB";
					}
					return (num / 1048576f).ToString(text) + "MB";
				}
				return (num / 1024f).ToString(text) + "KB";
			}
			return bytes + "B";
		}
	}
	public enum DownloadStatus
	{
		WAITTING,
		DOWNLOADING,
		AUTO_PAUSE,
		MANUAL_PAUSE,
		FAILED,
		SUCCESS,
		ALREADYEXISTS,
		DELETED,
		UNZIPPING,
		UNZIPSUCCESS,
		UNZIPFAILED,
		UNZIPNOSPACE,
		MD5CHECKFAILED,
		GETFILESIZEFAILED,
		UNENOUGHDISKSPACE,
		CREATEDIRECTORYFAILED,
		DOWNLOADFILENOTFOUND,
		UNDEFINEERROR,
		NETWORKCONNECTIONERROR,
		FILERENAMEFAILED
	}
	public interface IFileDownload
	{
		int DownloadingCount { get; }

		event EventHandler<RemoteDownloadStatusEventArgs> OnRemoteDownloadStatusChanged;

		Tuple<List<DownloadInfo>, List<DownloadInfo>, List<string>> Load();

		void Add(DownloadInfo resource, bool autoStart = true);

		void Add(List<DownloadInfo> resources, bool autoStart = true);

		void ReStart(string url);

		void Stop(string url);

		void Stop();

		void Delete(string url);

		DownloadInfo GetDownloadedResource(string url);

		DownloadInfo GetDownloadingResource(string url);
	}
	[Serializable]
	public class RemoteDownloadStatusEventArgs : EventArgs
	{
		public string FileUrl { get; }

		public DownloadStatus Status { get; }

		public DownloadInfo Info { get; }

		public RemoteDownloadStatusEventArgs(string fileUrl, DownloadStatus status, DownloadInfo info)
		{
			FileUrl = fileUrl;
			Status = status;
			Info = info;
		}
	}
	public interface ISaveDownloadInfo
	{
		string DownloadingPath { get; }

		string DownloadedPath { get; }

		bool Save(string path, object data);

		List<T> Get<T>(string path);
	}
}
namespace lenovo.mbg.service.framework.services.Device
{
	public abstract class AbstractDeviceConnectionManagerEx : IDisposable
	{
		public abstract Func<Task, string, bool> ValidateCodeFunc { get; set; }

		public abstract DeviceEx MasterDevice { get; protected set; }

		public abstract List<Tuple<string, string>> WirelessWaitForConnectEndPoints { get; }

		public abstract IList<DeviceEx> ConntectedDevices { get; }

		public abstract event WirelessMornitoringAddressChangedHandler WifiMonitoringEndPointChanged;

		public abstract event EventHandler<DeviceEx> Connecte;

		public abstract event EventHandler<DeviceEx> DisConnecte;

		public event Action<bool> ConnectChange;

		public event Action<int> ShowConnectIconStatus;

		public abstract event EventHandler<MasterDeviceChangedEventArgs> MasterDeviceChanged;

		public virtual void RaiseConnectChange(bool status)
		{
			this.ConnectChange?.Invoke(status);
		}

		public virtual void SetDeviceConnectIconStatus(int status)
		{
			this.ShowConnectIconStatus?.Invoke(status);
		}

		public abstract void Start();

		public abstract void Stop();

		public abstract void Dispose();

		public abstract void SwitchDevice(string id);

		public abstract void SwitchAfterDevice(string id);

		public abstract bool IsMasterConnectedByHelperForAndroid11();

		public abstract void StartMonitorFastbootConnect();

		public abstract List<string> StopMonitorFastbootConnect();

		public abstract void StopFastbootMonitor();

		public abstract bool StartFastbootMonitor();
	}
	public class MasterDeviceChangedEventArgs : EventArgs
	{
		public DeviceEx Previous { get; private set; }

		public DeviceEx Current { get; private set; }

		public MasterDeviceChangedEventArgs(DeviceEx previous, DeviceEx current)
		{
			Previous = previous;
			Current = current;
		}
	}
	public abstract class DeviceEx
	{
		private DeviceWorkType workType = DeviceWorkType.None;

		private volatile DevicePhysicalStateEx physicalStatus = DevicePhysicalStateEx.None;

		private volatile DeviceSoftStateEx lockedSoftStatus = DeviceSoftStateEx.None;

		private volatile DeviceSoftStateEx releaseSoftStatusCondition = DeviceSoftStateEx.None;

		private volatile bool softStatusIsLocked;

		private readonly object softStatusLockOjb = new object();

		private volatile bool autoRelease;

		private volatile DeviceSoftStateEx softStatus = DeviceSoftStateEx.None;

		public string Identifer { get; set; }

		public ConnectType ConnectType { get; set; }

		public string ConnectTime { get; set; }

		public IDeviceOperator DeviceOperator { get; set; }

		public DeviceType DeviceType { get; set; }

		public abstract IAndroidDevice Property { get; set; }

		public string ConnectedAppType { get; set; }

		public bool AppInstallFinished { get; set; }

		public int AppVersion { get; set; }

		public Func<Task, string, bool> ValidateCodeFunc { get; set; }

		public DeviceWorkType WorkType
		{
			get
			{
				return workType;
			}
			set
			{
				if (workType != value)
				{
					DeviceWorkType deviceWorkType = workType;
					workType = value;
					LogHelper.LogInstance.Info(string.Format("======device: {0}#{1}, work type: {2} --> {3}======", new object[4] { Identifer, ConnectTime, deviceWorkType, workType }));
				}
			}
		}

		public bool IsRemove { get; set; }

		public DevicePhysicalStateEx PhysicalStatus
		{
			get
			{
				return physicalStatus;
			}
			set
			{
				if (physicalStatus != value)
				{
					DevicePhysicalStateEx devicePhysicalStateEx = physicalStatus;
					physicalStatus = value;
					LogHelper.LogInstance.Info(string.Format("======device: {0}#{1}, phy status: {2} --> {3}======", new object[4] { Identifer, ConnectTime, devicePhysicalStateEx, physicalStatus }));
					OnPhysicalStatusChanged(devicePhysicalStateEx, physicalStatus);
					FirePhysicalStatusChangedEvent(this, physicalStatus);
					if (physicalStatus == DevicePhysicalStateEx.Offline)
					{
						SoftStatus = DeviceSoftStateEx.Offline;
					}
				}
			}
		}

		public bool SoftStatusIsLocked
		{
			get
			{
				return softStatusIsLocked;
			}
			private set
			{
				softStatusIsLocked = value;
			}
		}

		public DeviceSoftStateEx SoftStatus
		{
			get
			{
				return softStatus;
			}
			set
			{
				if (softStatus != value)
				{
					DeviceSoftStateEx deviceSoftStateEx = softStatus;
					softStatus = value;
					LogHelper.LogInstance.Info(string.Format("======device: {0}#{1}, soft status: {2} --> {3}======", new object[4] { Identifer, ConnectTime, deviceSoftStateEx, softStatus }));
					OnSoftStatusChanged(deviceSoftStateEx, softStatus);
					FireSoftStatusChangedEvent(this, softStatus);
				}
			}
		}

		public Func<int, bool> InstallAppCallback { get; set; }

		public Action RetryConnectCallback { get; set; }

		private event EventHandler<DevicePhysicalStateEx> physicalStatusChanged;

		public event EventHandler<DevicePhysicalStateEx> PhysicalStatusChanged
		{
			add
			{
				physicalStatusChanged += value;
				value.BeginInvoke(this, PhysicalStatus, null, null);
			}
			remove
			{
				physicalStatusChanged -= value;
			}
		}

		private event EventHandler<DeviceSoftStateEx> softStatusChanged;

		public event EventHandler<DeviceSoftStateEx> SoftStatusChanged
		{
			add
			{
				softStatusChanged += value;
				value.BeginInvoke(this, SoftStatus, null, null);
			}
			remove
			{
				softStatusChanged -= value;
			}
		}

		public DeviceEx()
		{
			DeviceType = DeviceType.Normal;
		}

		private void FirePhysicalStatusChangedEvent(object sender, DevicePhysicalStateEx e)
		{
			if (this.physicalStatusChanged != null)
			{
				Delegate[] invocationList = this.physicalStatusChanged.GetInvocationList();
				for (int i = 0; i < invocationList.Length; i++)
				{
					((EventHandler<DevicePhysicalStateEx>)invocationList[i]).BeginInvoke(sender, e, null, null);
				}
			}
		}

		public abstract void Load();

		protected virtual void OnPhysicalStatusChanged(DevicePhysicalStateEx prev, DevicePhysicalStateEx current)
		{
		}

		public void LockSoftStatus(bool autoRelease, DeviceSoftStateEx when)
		{
			lock (softStatusLockOjb)
			{
				releaseSoftStatusCondition = when;
				this.autoRelease = autoRelease;
				softStatusIsLocked = true;
			}
		}

		public void ReleaseSoftStatusLock()
		{
			lock (softStatusLockOjb)
			{
				softStatusIsLocked = false;
				if (lockedSoftStatus != DeviceSoftStateEx.None)
				{
					SoftStatus = lockedSoftStatus;
				}
			}
		}

		private void FireSoftStatusChangedEvent(object sender, DeviceSoftStateEx e)
		{
			EventHandler<DeviceSoftStateEx> eventHandler = this.softStatusChanged;
			if (eventHandler != null)
			{
				Delegate[] invocationList = eventHandler.GetInvocationList();
				for (int i = 0; i < invocationList.Length; i++)
				{
					((EventHandler<DeviceSoftStateEx>)invocationList[i]).BeginInvoke(sender, e, null, null);
				}
			}
		}

		protected virtual void OnSoftStatusChanged(DeviceSoftStateEx prev, DeviceSoftStateEx current)
		{
		}

		public bool IsHWEnable()
		{
			if (softStatus == DeviceSoftStateEx.Online)
			{
				if (!(ConnectedAppType == "Ma"))
				{
					if (ConnectedAppType == "Moto")
					{
						return AppVersion >= 1200000;
					}
					return false;
				}
				return true;
			}
			return false;
		}

		public override string ToString()
		{
			return string.Format("device: {0}#{1}, modelname:{2}, connect type: {3}, phy status: {4}, soft status: {5}, app type: {6}", new object[7]
			{
				Identifer,
				ConnectTime,
				Property?.ModelName,
				ConnectType,
				PhysicalStatus,
				SoftStatus,
				ConnectedAppType
			});
		}

		public void UnloadEvent()
		{
			this.softStatusChanged = null;
			this.physicalStatusChanged = null;
			ValidateCodeFunc = null;
		}
	}
	public enum DevicePhysicalStateEx
	{
		None = -1,
		Offline = 0,
		Online = 2,
		Unauthorized = 7,
		UsbDebugSwitchClosed = 9
	}
	public enum DeviceSoftStateEx
	{
		None = -1,
		Offline,
		Connecting,
		Online,
		Reconncting,
		ManualDisconnect
	}
	public enum DeviceType
	{
		Master,
		Slave,
		Normal
	}
	[Flags]
	public enum DeviceWorkType : uint
	{
		None = 1u,
		Rescue = 2u,
		ReadFastboot = 4u
	}
	public sealed class ConnectedAppTypesDefine
	{
		public const string Ma = "Ma";

		public const string Moto = "Moto";
	}
	public interface IAndroidDevice
	{
		int ApiLevel { get; }

		string IMEI1 { get; }

		string IMEI2 { get; }

		string ModelId { get; }

		string SN { get; }

		string PN { get; }

		string ModelName { get; }

		string ModelName2 { get; }

		string HWCode { get; }

		string Brand { get; }

		string Processor { get; }

		string Uptime { get; }

		string RomVersion { get; }

		string CountryCode { get; }

		string Carrier { get; }

		string FingerPrint { get; }

		string FsgVersion { get; }

		string AndroidVersion { get; }

		double BatteryQuantityPercentage { get; }

		string InternalStoragePath { get; }

		string ExternalStoragePath { get; }

		string TotalExternalStorageWithUnit { get; }

		string UsedExternalStorageWithUnit { get; }

		string FreeExternalStorageWithUnit { get; }

		string TotalInternalStorageWithUnit { get; }

		string UsedInternalStorageWithUnit { get; }

		string FreeInternalStorageWithUnit { get; }

		long TotalExternalStorage { get; }

		long UsedExternalStorage { get; }

		long FreeExternalStorage { get; }

		long TotalInternalStorage { get; }

		long UsedInternalStorage { get; }

		long FreeInternalStorage { get; }

		string Operator { get; }

		string OtaModel { get; }

		string RoHardWare { get; }

		string CustomerVersion { get; }

		string Category { get; }

		int SimCount { get; }

		Dictionary<string, string> Others { get; }

		string GetPropertyValue(string name);
	}
	public interface IDeviceOperator
	{
		string Command(string command, int timeout = -1, string deviceID = "");

		string Shell(string deviceID, string command);

		void Install(string deviceID, string apkPath);

		void Uninstall(string deviceID, string apkName);

		void ForwardPort(string deviceID, int devicePort, int localPort);

		void RemoveForward(string deviceID, int localPort);

		void RemoveAllForward(string deviceID);

		void PushFile(string deviceID, string localFilePath, string deviceFilePath);

		void Reboot(string deviceID, string mode);

		List<string> FindDevices();
	}
	[Serializable]
	public enum TcpStatus
	{
		TCP_CONNECTED,
		TCP_DISCONNECT
	}
	[Serializable]
	[Flags]
	public enum ConnectType
	{
		Adb = 1,
		Fastboot = 2,
		Wifi = 4,
		UNKNOW = 5
	}
	[Serializable]
	public enum DeviceLockReason
	{
		None,
		Reboot2Recovery,
		Reboot2Fastboot
	}
	public delegate void WirelessMornitoringAddressChangedHandler(List<Tuple<string, string>> underWatchEndPoints);
}
namespace lenovo.mbg.service.framework.services.Adb
{
	public interface IAdbService
	{
		string Execute(string cmd);

		void StartServer();

		void KillServer();
	}
}
