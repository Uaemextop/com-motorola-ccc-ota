#define TRACE
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Threading;
using System.Threading.Tasks;
using System.Xml;
using Microsoft.Win32.SafeHandles;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.common.utilities;
using lenovo.mbg.service.framework.download.DownloadControllerImpl;
using lenovo.mbg.service.framework.download.DownloadMode;
using lenovo.mbg.service.framework.download.DownloadSave;
using lenovo.mbg.service.framework.download.DownloadUnity;
using lenovo.mbg.service.framework.download.ICondition;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.framework.download")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("lenovo.mbg.service.framework.download")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Guid("d9aba710-912d-4cba-b97d-b58d1e21284e")]
[assembly: AssemblyFileVersion("1.1.0.0")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("1.1.0.0")]
namespace lenovo.mbg.service.framework.download
{
	public sealed class DownloadWorker
	{
		private static object locker = new object();

		private static DownloadWorker m_woker;

		private ConcurrentDictionary<AbstractDownloadInfo, DownloadTask> TaskDictionary;

		private object lo = new object();

		public static DownloadWorker Instance
		{
			get
			{
				if (m_woker == null)
				{
					lock (locker)
					{
						if (m_woker == null)
						{
							m_woker = new DownloadWorker();
						}
					}
				}
				return m_woker;
			}
		}

		public int DownloadMaxCount { get; private set; }

		public int DownloadingCount => (from n in TaskDictionary.Values.AsParallel()
			where n.DownloadInfo.downloadStatus == DownloadStatus.DOWNLOADING
			select n).Count();

		public event EventHandler<DownloadEventArgs> OnDownloadStatusChanged;

		private DownloadWorker()
		{
			try
			{
				LoadXml();
			}
			catch
			{
				DownloadMaxCount = 1;
			}
			TaskDictionary = new ConcurrentDictionary<AbstractDownloadInfo, DownloadTask>(new CompareDictionary());
		}

		public void LoadXml()
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Invalid comparison between Unknown and I4
			XmlReader val = XmlReader.Create(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "download-config.xml"));
			try
			{
				while (val.Read())
				{
					if ((int)val.NodeType == 1 && val.Name.Equals("MaxDownloadCount"))
					{
						DownloadMaxCount = int.Parse(val.Value);
						break;
					}
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		public void InitializeMaxDownloadCount(int count)
		{
			DownloadMaxCount = count;
		}

		private DownloadTask FindLowerLevelTask()
		{
			lock (lo)
			{
				try
				{
					IEnumerable<DownloadTask> downloadingTasks = TaskDictionary.Values.Where((DownloadTask n) => n.DownloadInfo.downloadStatus == DownloadStatus.DOWNLOADING);
					IEnumerable<DownloadTask> lowerControllerTasks = downloadingTasks.Where((DownloadTask n) => n.Controller.ControllerLevel == downloadingTasks.AsParallel().Min((DownloadTask m) => m.Controller.ControllerLevel));
					IEnumerable<DownloadTask> lowerDownloadLevelTasks = lowerControllerTasks.Where((DownloadTask n) => n.DownloadInfo.downloadLevel == lowerControllerTasks.AsParallel().Min((DownloadTask m) => m.DownloadInfo.downloadLevel));
					return lowerDownloadLevelTasks.FirstOrDefault((DownloadTask n) => n.DownloadInfo.downloadedSize == lowerDownloadLevelTasks.Min((DownloadTask m) => m.DownloadInfo.downloadedSize));
				}
				catch (Exception)
				{
					return null;
				}
			}
		}

		public void Start(DownloadTask task)
		{
			lock (lo)
			{
				if (!TaskDictionary.ContainsKey(task.DownloadInfo))
				{
					task.OnDownloadStatusChanged += FireDownloadStatusChanged;
					TaskDictionary.TryAdd(task.DownloadInfo, task);
					if (DownloadMaxCount > GetDownloadingCount())
					{
						task.downloadTaskProcessor.Start();
						return;
					}
					DownloadTask downloadTask = FindLowerLevelTask();
					if (downloadTask != null && task.Controller.ControllerLevel > downloadTask.Controller.ControllerLevel)
					{
						downloadTask.FireStopLowerControllerLevelTask();
						downloadTask.downloadTaskProcessor.Stop();
					}
					task.downloadTaskProcessor.Start();
				}
				else if (task.Controller.ControllerLevel == TaskDictionary[task.DownloadInfo].Controller.ControllerLevel && TaskDictionary[task.DownloadInfo].DownloadInfo.downloadStatus == DownloadStatus.DOWNLOADING)
				{
					task.FireExistedDownloadTask(new DownloadEventArgs(TaskDictionary[task.DownloadInfo]));
					TaskDictionary[task.DownloadInfo].downloadTaskProcessor.Start();
				}
				else if (DownloadMaxCount <= GetDownloadingCount())
				{
					if (TaskDictionary[task.DownloadInfo].DownloadInfo.downloadStatus != DownloadStatus.DOWNLOADING && TaskDictionary[task.DownloadInfo].DownloadInfo.downloadStatus != DownloadStatus.SUCCESS)
					{
						DownloadTask downloadTask2 = FindLowerLevelTask();
						if (task.Controller.ControllerLevel > TaskDictionary[task.DownloadInfo].Controller.ControllerLevel)
						{
							TaskDictionary[task.DownloadInfo] = task;
						}
						if (downloadTask2 != null && TaskDictionary[task.DownloadInfo].Controller.ControllerLevel > downloadTask2.Controller.ControllerLevel)
						{
							downloadTask2.FireStopLowerControllerLevelTask();
							downloadTask2.downloadTaskProcessor.Stop();
						}
					}
					TaskDictionary[task.DownloadInfo].downloadTaskProcessor.Start();
				}
				else
				{
					TaskDictionary[task.DownloadInfo].downloadTaskProcessor.Start();
				}
			}
		}

		public void Stop(DownloadTask task)
		{
			lock (lo)
			{
				if (TaskDictionary.ContainsKey(task.DownloadInfo))
				{
					TaskDictionary[task.DownloadInfo].downloadTaskProcessor.Stop();
				}
			}
		}

		public void Delete(DownloadTask task)
		{
			lock (lo)
			{
				if (TaskDictionary.ContainsKey(task.DownloadInfo))
				{
					TaskDictionary[task.DownloadInfo].downloadTaskProcessor.Delete();
					TaskDictionary.TryRemove(task.DownloadInfo, out task);
				}
			}
		}

		public void Dispose()
		{
			lock (lo)
			{
				if (TaskDictionary != null)
				{
					TaskDictionary.Clear();
					TaskDictionary = null;
				}
				if (m_woker != null)
				{
					m_woker = null;
				}
			}
		}

		private int GetDownloadingCount()
		{
			lock (lo)
			{
				return TaskDictionary.Where((KeyValuePair<AbstractDownloadInfo, DownloadTask> n) => n.Value.DownloadInfo.downloadStatus == DownloadStatus.DOWNLOADING).Count();
			}
		}

		private void FireDownloadStatusChanged(object sender, DownloadEventArgs e)
		{
			lock (lo)
			{
				if (this.OnDownloadStatusChanged != null)
				{
					Delegate[] invocationList = this.OnDownloadStatusChanged.GetInvocationList();
					for (int i = 0; i < invocationList.Length; i++)
					{
						((EventHandler<DownloadEventArgs>)invocationList[i]).BeginInvoke(sender, e, null, null);
					}
				}
				if ((e.downloadTask.DownloadInfo.downloadStatus != DownloadStatus.DOWNLOADING && e.downloadTask.DownloadInfo.downloadStatus != DownloadStatus.WAITTING && e.downloadTask.DownloadInfo.downloadStatus != DownloadStatus.PAUSE) || e.downloadTask.DownloadInfo.downloadStatus == DownloadStatus.SUCCESS)
				{
					TaskDictionary.TryRemove(e.downloadTask.DownloadInfo, out var _);
				}
				if (e.downloadTask.DownloadInfo.downloadStatus != DownloadStatus.DOWNLOADING)
				{
					StartNextTask();
				}
			}
		}

		private void StartNextTask()
		{
			try
			{
				IEnumerable<KeyValuePair<AbstractDownloadInfo, DownloadTask>> source = TaskDictionary.Where((KeyValuePair<AbstractDownloadInfo, DownloadTask> n) => n.Value.DownloadInfo.downloadStatus == DownloadStatus.WAITTING);
				if (source.Count() > 0)
				{
					(from n in source
						orderby n.Value.Controller.ControllerLevel descending, n.Value.DownloadInfo.downloadLevel descending, n.Value.StartTime descending
						select n).First().Value.downloadTaskProcessor.Start();
				}
			}
			catch
			{
			}
		}
	}
	public class DownloadTaskProcessor
	{
		private CancellationTokenSource tokenSource;

		private volatile bool isRuning;

		private object locker = new object();

		private DownloadTask task { get; set; }

		public DownloadTaskProcessor(DownloadTask task)
		{
			this.task = task;
		}

		public void Start()
		{
			DownloadStatus downloadStatus = DownloadStatus.DOWNLOADING;
			task.DownloadInfo.downloadStatus = downloadStatus;
			task.FireDownloadStatusChanged();
			if (!isRuning)
			{
				if (tokenSource == null)
				{
					tokenSource = new CancellationTokenSource();
				}
				Task.Factory.StartNew(DownloadThread, tokenSource.Token);
			}
		}

		public void Stop()
		{
			lock (locker)
			{
				while (isRuning)
				{
					if (tokenSource != null)
					{
						tokenSource.Cancel();
					}
					Thread.Sleep(10);
				}
			}
		}

		public void Delete()
		{
			Stop();
			TryRemoveDownloadFile();
		}

		public void Dispose()
		{
			if (tokenSource != null)
			{
				tokenSource.Dispose();
				tokenSource = null;
			}
		}

		private void DownloadThread()
		{
			try
			{
				SysSleepManagement.PreventSleep(includeDisplay: false);
				isRuning = true;
				LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadTaskProcessor: FileName: {task.DownloadInfo.downloadFileName}  Url: {task.DownloadInfo.downloadUrl} Start Download");
				if (tokenSource.IsCancellationRequested)
				{
					task.DownloadInfo.downloadStatus = DownloadStatus.PAUSE;
					task.DownloadInfo.downloadSpeed = "0.0B";
					return;
				}
				DownloadStatus downloadStatus = DownloadStatus.DOWNLOADING;
				int num = 0;
				do
				{
					downloadStatus = task.DownloadInfo.download.Start(task, tokenSource);
					if (downloadStatus == DownloadStatus.SUCCESS || downloadStatus == DownloadStatus.PAUSE)
					{
						break;
					}
					num++;
					Thread.Sleep(1000);
				}
				while (num < 1);
				task.DownloadInfo.downloadSpeed = "0.0B";
				task.DownloadInfo.downloadStatus = downloadStatus;
				task.EndTime = DateTime.Now;
			}
			catch (Exception exception)
			{
				task.DownloadInfo.downloadSpeed = "0.0B";
				task.DownloadInfo.downloadStatus = DownloadStatus.FAILED;
				LogHelper.LogInstance.Error($"lenovo.mbg.service.framework.download.DownloadTaskProcessor: FileName: {task.DownloadInfo.downloadFileName}  Url: {task.DownloadInfo.downloadUrl} Start Failed", exception);
			}
			finally
			{
				Dispose();
				LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadTaskProcessor: FileName: {task.DownloadInfo.downloadFileName}  Url: {task.DownloadInfo.downloadUrl} Start Finished");
				isRuning = false;
				task.FireDownloadStatusChanged();
				SysSleepManagement.RestoreSleep();
			}
		}

		private void TryRemoveDownloadFile()
		{
			LogHelper.LogInstance.Error($"lenovo.mbg.service.framework.download.DownloadTaskProcessor.TryRemoveDownloadFile: RemoveFile FileName: {task.DownloadInfo.downloadFileName}  Url: {task.DownloadInfo.downloadUrl} Start");
			GlobalFun.TryDeleteFile(Path.Combine(task.DownloadInfo.saveLocalPath, task.DownloadInfo.tempFileName));
			LogHelper.LogInstance.Error($"lenovo.mbg.service.framework.download.DownloadTaskProcessor.TryRemoveDownloadFile: RemoveFile FileName: {task.DownloadInfo.downloadFileName}  Url: {task.DownloadInfo.downloadUrl} End");
		}
	}
	public class SysSleepManagement
	{
		[Flags]
		private enum ExecutionFlag : uint
		{
			System = 1u,
			Display = 2u,
			Continus = 0x80000000u
		}

		[DllImport("kernel32.dll")]
		private static extern uint SetThreadExecutionState(ExecutionFlag flags);

		[DllImport("kernel32.dll")]
		public static extern SafeWaitHandle CreateWaitableTimer(IntPtr lpTimerAttributes, bool bManualReset, string lpTimerName);

		[DllImport("kernel32.dll", SetLastError = true)]
		[return: MarshalAs(UnmanagedType.Bool)]
		public static extern bool SetWaitableTimer(SafeWaitHandle hTimer, [In] ref long pDueTime, int lPeriod, IntPtr pfnCompletionRoutine, IntPtr lpArgToCompletionRoutine, bool fResume);

		public static void SetWaitForWakeUpTime(int minutes)
		{
			long pDueTime = DateTime.Now.AddMinutes(minutes).ToFileTime();
			using SafeWaitHandle safeWaitHandle = CreateWaitableTimer(IntPtr.Zero, bManualReset: true, "LenovoWaitabletimer");
			if (SetWaitableTimer(safeWaitHandle, ref pDueTime, 0, IntPtr.Zero, IntPtr.Zero, fResume: true))
			{
				using (EventWaitHandle eventWaitHandle = new EventWaitHandle(initialState: false, EventResetMode.AutoReset))
				{
					eventWaitHandle.SafeWaitHandle = safeWaitHandle;
					eventWaitHandle.WaitOne();
					return;
				}
			}
			throw new Win32Exception(Marshal.GetLastWin32Error());
		}

		public static void PreventSleep(bool includeDisplay)
		{
			if (includeDisplay)
			{
				SetThreadExecutionState(ExecutionFlag.System | ExecutionFlag.Display | ExecutionFlag.Continus);
			}
			else
			{
				SetThreadExecutionState(ExecutionFlag.System | ExecutionFlag.Continus);
			}
		}

		public static void RestoreSleep()
		{
			SetThreadExecutionState(ExecutionFlag.Continus);
		}

		public static void ResetSleepTimer(bool includeDisplay)
		{
			if (includeDisplay)
			{
				SetThreadExecutionState(ExecutionFlag.System | ExecutionFlag.Display);
			}
			else
			{
				SetThreadExecutionState(ExecutionFlag.System);
			}
		}
	}
}
namespace lenovo.mbg.service.framework.download.ICondition
{
	public interface IDownloadCondition
	{
		bool CanDownload();
	}
}
namespace lenovo.mbg.service.framework.download.DownloadUnity
{
	public abstract class AbstractDownloadInfo
	{
		[JsonIgnore]
		private string m_downloadSpeed = "0.0B/s";

		private DownloadStatus m_downloadStatus;

		public abstract string downloadUrl { get; set; }

		public abstract string downloadFileName { get; set; }

		public abstract string saveLocalPath { get; set; }

		public abstract long downloadFileSize { get; set; }

		public abstract string downloadMD5 { get; set; }

		public abstract int downloadLevel { get; set; }

		[JsonIgnore]
		public IDownload download => AnalyzeDownloadMode();

		[JsonIgnore]
		public virtual IDownloadCondition Condition => null;

		[JsonIgnore]
		public string downloadSpeed
		{
			get
			{
				return m_downloadSpeed;
			}
			set
			{
				m_downloadSpeed = value + "/s";
			}
		}

		[JsonIgnore]
		public long downloadedSize { get; set; }

		[JsonConverter(typeof(StringEnumConverter))]
		public DownloadStatus downloadStatus
		{
			get
			{
				return m_downloadStatus;
			}
			set
			{
				m_downloadStatus = value;
			}
		}

		public virtual string tempFileName => downloadFileName + ".tmp";

		private IDownload AnalyzeDownloadMode()
		{
			if (downloadUrl.Trim().StartsWith("ftp", StringComparison.CurrentCultureIgnoreCase))
			{
				return new FtpDownload();
			}
			return new HttpDownload();
		}
	}
	public class CompareDictionary : IEqualityComparer<AbstractDownloadInfo>
	{
		bool IEqualityComparer<AbstractDownloadInfo>.Equals(AbstractDownloadInfo x, AbstractDownloadInfo y)
		{
			if (x.downloadFileName.Equals(y.downloadFileName) && x.downloadMD5.Equals(y.downloadMD5))
			{
				return x.saveLocalPath.Equals(y.saveLocalPath);
			}
			return false;
		}

		int IEqualityComparer<AbstractDownloadInfo>.GetHashCode(AbstractDownloadInfo obj)
		{
			return obj.ToString().GetHashCode();
		}
	}
	public class CompareObject<T> : IEqualityComparer<T>
	{
		public bool Equals(T x, T y)
		{
			return ((Expression<Func<T, T, bool>>)((T val, T val2) => (object)val == (object)val2)).Compile()(x, y);
		}

		public int GetHashCode(T obj)
		{
			return ((Expression<Func<T, int>>)((T val) => (int)val)).Compile()(obj);
		}
	}
	public static class DictionaryExtensionMethodClass
	{
		public static bool TryAddEx<TKey, TValue>(this ConcurrentDictionary<TKey, TValue> dict, TKey key, TValue value)
		{
			if (!dict.ContainsKey(key))
			{
				return dict.TryAdd(key, value);
			}
			return false;
		}
	}
	public class DownloadEventArgs : EventArgs
	{
		private DownloadTask m_task;

		public DownloadTask downloadTask => m_task;

		public DownloadEventArgs(DownloadTask task)
		{
			m_task = task;
		}
	}
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
	public sealed class DownloadTask
	{
		private DownloadTaskProcessor m_downloadTaskProcessor;

		private AbstractDownloadInfo m_downloadInfo { get; set; }

		public DateTime? StartTime { get; set; }

		public DateTime? EndTime { get; set; }

		public Type DownloadInfoClassType { get; set; }

		public AbstractDownloadController Controller { get; set; }

		public DownloadTaskProcessor downloadTaskProcessor
		{
			get
			{
				if (m_downloadTaskProcessor == null)
				{
					m_downloadTaskProcessor = new DownloadTaskProcessor(this);
				}
				return m_downloadTaskProcessor;
			}
		}

		public AbstractDownloadInfo DownloadInfo => m_downloadInfo;

		public long totalSizeOfSec { get; set; }

		public event EventHandler<DownloadEventArgs> OnDownloadStatusChanged;

		public event EventHandler<DownloadEventArgs> OnExistedDownloadTask;

		public event EventHandler<DownloadEventArgs> OnStopLowerControllerLevelTask;

		public DownloadTask(AbstractDownloadInfo downloadInfo, AbstractDownloadController controller)
		{
			totalSizeOfSec = 0L;
			m_downloadInfo = downloadInfo;
			Controller = controller;
			StartTime = DateTime.Now;
		}

		public void Update(AbstractDownloadInfo downloadInfo)
		{
			m_downloadInfo.downloadFileSize = downloadInfo.downloadFileSize;
			m_downloadInfo.downloadMD5 = downloadInfo.downloadMD5;
			m_downloadInfo.downloadUrl = downloadInfo.downloadUrl;
			m_downloadInfo.downloadFileName = downloadInfo.downloadFileName;
		}

		public void FireDownloadStatusChanged()
		{
			if (this.OnDownloadStatusChanged != null)
			{
				this.OnDownloadStatusChanged(this, new DownloadEventArgs(this));
			}
		}

		public void FireExistedDownloadTask(DownloadEventArgs args)
		{
			if (this.OnExistedDownloadTask != null)
			{
				Delegate[] invocationList = this.OnExistedDownloadTask.GetInvocationList();
				for (int i = 0; i < invocationList.Length; i++)
				{
					((EventHandler<DownloadEventArgs>)invocationList[i]).BeginInvoke(this, args, null, null);
				}
			}
		}

		public void FireStopLowerControllerLevelTask()
		{
			if (this.OnStopLowerControllerLevelTask != null)
			{
				this.OnStopLowerControllerLevelTask(this, new DownloadEventArgs(this));
			}
		}
	}
	public class DownloadThreadManager
	{
		private List<ThreadHandle> TaskThreadList;

		private static object syncLock = new object();

		private static readonly DownloadThreadManager m_instance = new DownloadThreadManager();

		public static DownloadThreadManager Instance => m_instance;

		private DownloadThreadManager()
		{
			Initialize();
		}

		private void Initialize()
		{
			TaskThreadList = new List<ThreadHandle>();
		}

		public ThreadHandle StartTask(Action task)
		{
			return StartTask(task, null);
		}

		public ThreadHandle StartTask(Action task, Action<TaskStatus> callback)
		{
			lock (syncLock)
			{
				ThreadHandle threadHandle = new ThreadHandle();
				Task.Factory.StartNew(task, threadHandle.tokenSource.Token);
				TaskThreadList.Add(threadHandle);
				return threadHandle;
			}
		}

		public void StopTask(ThreadHandle handle)
		{
			lock (syncLock)
			{
				ThreadHandle threadHandle = TaskThreadList.FirstOrDefault((ThreadHandle n) => n.ID == handle.ID);
				if (threadHandle.tokenSource != null)
				{
					threadHandle.tokenSource.Cancel();
					TaskThreadList.Remove(threadHandle);
				}
			}
		}

		public int GetAllDownloadingCount()
		{
			lock (syncLock)
			{
				return TaskThreadList.Count;
			}
		}
	}
	public class ThreadHandle
	{
		public Guid ID = Guid.NewGuid();

		public CancellationTokenSource tokenSource = new CancellationTokenSource();
	}
}
namespace lenovo.mbg.service.framework.download.DownloadSave
{
	public interface ISaveDownloadInfoMode
	{
		void SaveAbstractDownloadInfo(object obj);

		IEnumerable<AbstractDownloadInfo> GetAbstractDownloadInfoList();
	}
	public class SaveDownloadInfo2Json : ISaveDownloadInfoMode
	{
		private static ReaderWriterLockSlim jsonLocker = new ReaderWriterLockSlim();

		private string downloadsave2jsonPath { get; set; }

		public SaveDownloadInfo2Json(string path)
		{
			downloadsave2jsonPath = path;
		}

		public void SaveAbstractDownloadInfo(object obj)
		{
			try
			{
				jsonLocker.EnterWriteLock();
				JsonHelper.SerializeObject2File(downloadsave2jsonPath, obj);
			}
			finally
			{
				jsonLocker.ExitWriteLock();
			}
		}

		public IEnumerable<AbstractDownloadInfo> GetAbstractDownloadInfoList()
		{
			List<AbstractDownloadInfo> list = new List<AbstractDownloadInfo>();
			try
			{
				jsonLocker.EnterReadLock();
				return JsonHelper.DeserializeJson2ListFromFile<AbstractDownloadInfo>(downloadsave2jsonPath);
			}
			finally
			{
				jsonLocker.ExitReadLock();
			}
		}
	}
}
namespace lenovo.mbg.service.framework.download.DownloadMode
{
	public abstract class AbstractDownloadMode : IDownload
	{
		private string oldSpeed = string.Empty;

		private string newSpeed = string.Empty;

		protected int ReadWriteTimeout = 30000;

		public abstract DownloadStatus Start(DownloadTask task, CancellationTokenSource tokeSource);

		public abstract bool GetFileSizeFormServer(string url, ref long fileSize);

		protected virtual bool CheckBeforeDownload(DownloadTask task, ref DownloadStatus status, ref long offset)
		{
			if (File.Exists(Path.Combine(task.DownloadInfo.saveLocalPath, task.DownloadInfo.downloadFileName)))
			{
				status = DownloadStatus.SUCCESS;
				LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.MD5Check: File '{task.DownloadInfo.downloadFileName}' existsed");
				return false;
			}
			if (task.DownloadInfo.downloadFileSize <= 0)
			{
				long fileSize = 0L;
				if (!GetFileSizeFormServer(task.DownloadInfo.downloadUrl, ref fileSize) || fileSize < 0)
				{
					LogHelper.LogInstance.Info("lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.GetFileSizeFormServer: Get FileSize Form Server Failed");
					status = DownloadStatus.GETFILESIZEFAILED;
					return false;
				}
				task.DownloadInfo.downloadFileSize = fileSize;
			}
			if (HardDisk.GetHardDiskFreeSpace(task.DownloadInfo.saveLocalPath) <= task.DownloadInfo.downloadFileSize)
			{
				LogHelper.LogInstance.Info("lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.GetHardDiskFreeSpace: Have Not Enough Disk Space");
				status = DownloadStatus.UNENOUGHDISKSPACE;
				return false;
			}
			if (!Directory.Exists(task.DownloadInfo.saveLocalPath))
			{
				try
				{
					Directory.CreateDirectory(task.DownloadInfo.saveLocalPath);
				}
				catch
				{
					LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.GetHardDiskFreeSpace: Create Directory '{task.DownloadInfo.saveLocalPath}' Failed");
					status = DownloadStatus.CREATEDIRECTORYFAILED;
					return false;
				}
			}
			string text = Path.Combine(task.DownloadInfo.saveLocalPath, task.DownloadInfo.tempFileName);
			if (File.Exists(text))
			{
				FileInfo fileInfo = new FileInfo(text);
				if (fileInfo.Length >= task.DownloadInfo.downloadFileSize)
				{
					bool flag = true;
					if (!string.IsNullOrEmpty(task.DownloadInfo.downloadMD5))
					{
						flag = GlobalFun.MD5Check(text, task.DownloadInfo.downloadMD5);
					}
					if (flag)
					{
						GlobalFun.FileRename(text, Path.Combine(task.DownloadInfo.saveLocalPath, task.DownloadInfo.downloadFileName));
						LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.MD5Check: File '{task.DownloadInfo.downloadFileName}' MD5 Check Success");
						status = DownloadStatus.SUCCESS;
						return false;
					}
					LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.MD5Check: File '{task.DownloadInfo.downloadFileName}' MD5 Check Failed");
					GlobalFun.TryDeleteFile(text);
					status = DownloadStatus.MD5CHECKFAILED;
					return false;
				}
				offset = fileInfo.Length;
			}
			return true;
		}

		protected virtual DownloadStatus CheckAfterDownload(DownloadTask task, string path)
		{
			if (File.Exists(path))
			{
				if (new FileInfo(path).Length < task.DownloadInfo.downloadFileSize)
				{
					LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.CheckAfterDownload: File '{task.DownloadInfo.downloadFileName}' Download Pause");
					return DownloadStatus.PAUSE;
				}
				bool flag = true;
				if (!string.IsNullOrEmpty(task.DownloadInfo.downloadMD5))
				{
					flag = GlobalFun.MD5Check(path, task.DownloadInfo.downloadMD5);
				}
				if (flag)
				{
					LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.CheckAfterDownload: File '{task.DownloadInfo.downloadFileName}' MD5 Check Success");
					if (GlobalFun.FileRename(path, Path.Combine(task.DownloadInfo.saveLocalPath, task.DownloadInfo.downloadFileName)))
					{
						LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.CheckAfterDownload: File '{task.DownloadInfo.downloadFileName}' Download Success");
						return DownloadStatus.SUCCESS;
					}
					LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.CheckAfterDownload: File '{task.DownloadInfo.tempFileName}' Rename To '{task.DownloadInfo.downloadFileName}' Failed");
					return DownloadStatus.FILERENAMEFAILED;
				}
				LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.CheckAfterDownload: File '{task.DownloadInfo.downloadFileName}' MD5 Check Failed");
				GlobalFun.TryDeleteFile(path);
				return DownloadStatus.MD5CHECKFAILED;
			}
			LogHelper.LogInstance.Info($"lenovo.mbg.service.framework.download.DownloadMode.AbstractDownloadMode.CheckAfterDownload: File '{task.DownloadInfo.downloadFileName}' Download Pause");
			return DownloadStatus.PAUSE;
		}

		protected void SpeedTimer(object state)
		{
			DownloadTask downloadTask = state as DownloadTask;
			newSpeed = GlobalFun.ConvertLong2String(downloadTask.totalSizeOfSec);
			downloadTask.totalSizeOfSec = 0L;
			if (!oldSpeed.Equals(newSpeed))
			{
				downloadTask.DownloadInfo.downloadSpeed = newSpeed;
				Trace.WriteLine(downloadTask.DownloadInfo.downloadSpeed);
				oldSpeed = newSpeed;
			}
		}
	}
	public class FtpDownload : AbstractDownloadMode
	{
		private const int MAX_BUFFER_LEN = 1024;

		public override DownloadStatus Start(DownloadTask task, CancellationTokenSource tokeSource)
		{
			if (tokeSource.IsCancellationRequested)
			{
				return DownloadStatus.PAUSE;
			}
			DownloadStatus status = DownloadStatus.DOWNLOADING;
			if (!task.DownloadInfo.downloadUrl.StartsWith("ftp", StringComparison.CurrentCultureIgnoreCase))
			{
				task.DownloadInfo.downloadUrl = "ftp://" + task.DownloadInfo.downloadUrl;
			}
			long offset = 0L;
			if (!CheckBeforeDownload(task, ref status, ref offset))
			{
				return status;
			}
			string path = Path.Combine(task.DownloadInfo.saveLocalPath, task.DownloadInfo.downloadFileName);
			FtpWebRequest ftpWebRequest = null;
			FileStream fileStream = null;
			Stream stream = null;
			Timer timer = null;
			try
			{
				byte[] buffer = new byte[1024];
				ftpWebRequest = OpenRequest(task.DownloadInfo.downloadUrl) as FtpWebRequest;
				ftpWebRequest.ReadWriteTimeout = ReadWriteTimeout;
				ftpWebRequest.ContentOffset = offset;
				using (FtpWebResponse ftpWebResponse = ftpWebRequest.GetResponse() as FtpWebResponse)
				{
					int num = 0;
					fileStream = new FileStream(path, FileMode.Append, FileAccess.Write);
					stream = ftpWebResponse.GetResponseStream();
					timer = new Timer(base.SpeedTimer, task, 0, 1000);
					while (!tokeSource.IsCancellationRequested)
					{
						try
						{
							int num2 = 0;
							while (++num2 < 10)
							{
								if (!stream.CanRead)
								{
									continue;
								}
								try
								{
									num = stream.Read(buffer, 0, 1024);
									offset += num;
									task.totalSizeOfSec += num;
									task.DownloadInfo.downloadedSize = offset;
									if (num <= 0 && fileStream.Length < task.DownloadInfo.downloadFileSize)
									{
										Thread.Sleep(1000);
										continue;
									}
								}
								catch (Exception)
								{
									continue;
								}
								break;
							}
							if (fileStream.Length >= task.DownloadInfo.downloadFileSize)
							{
								break;
							}
							if (num <= 0)
							{
								return DownloadStatus.PAUSE;
							}
							fileStream.Write(buffer, 0, num);
							continue;
						}
						catch (Exception exception)
						{
							LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.HttpDownload: Read Info From Stream Exception", exception);
							continue;
						}
					}
					stream.Close();
					ftpWebRequest.Abort();
					fileStream.Close();
					timer.Dispose();
					LogHelper.LogInstance.Info("lenovo.mbg.service.framework.download.DownloadMode.FtpDownload: Download Finished, But Not Check MD5");
				}
				return CheckAfterDownload(task, path);
			}
			catch (WebException ex2)
			{
				if (ex2.Status == WebExceptionStatus.ProtocolError)
				{
					LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.FtpDownload: WebException Exception - WebExceptionStatus.ProtocolError", ex2);
					return ((ex2.Response as FtpWebResponse).StatusCode == FtpStatusCode.ActionNotTakenFileUnavailable) ? DownloadStatus.DOWNLOADFILENOTFOUND : DownloadStatus.UNDEFINEERROR;
				}
				if (ex2.Status == WebExceptionStatus.ConnectFailure || ex2.Status == WebExceptionStatus.ConnectionClosed || ex2.Status == WebExceptionStatus.Timeout)
				{
					LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.FtpDownload: WebException Exception - WebExceptionStatus.ConnectFailure", ex2);
					return DownloadStatus.NETWORKCONNECTIONERROR;
				}
				LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.FtpDownload: WebException Exception - UNDEFINEERROR", ex2);
				return DownloadStatus.UNDEFINEERROR;
			}
			catch (SocketException exception2)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.FtpDownload: SocketException Exception - UNDEFINEERROR", exception2);
				return DownloadStatus.NETWORKCONNECTIONERROR;
			}
			catch (Exception exception3)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.FtpDownload: Exception", exception3);
				return DownloadStatus.UNDEFINEERROR;
			}
			finally
			{
				try
				{
					stream.Close();
					ftpWebRequest.Abort();
					fileStream.Close();
					timer.Dispose();
				}
				catch
				{
				}
				LogHelper.LogInstance.Info("lenovo.mbg.service.framework.download.DownloadMode.FtpDownload: Download Finished");
			}
		}

		private WebRequest OpenRequest(string requestUri, string method, int timeout)
		{
			try
			{
				FtpWebRequest obj = WebRequest.Create(requestUri) as FtpWebRequest;
				obj.Method = method;
				obj.UseBinary = true;
				obj.UsePassive = true;
				obj.Timeout = timeout;
				obj.ReadWriteTimeout = timeout;
				obj.Proxy = WebRequest.DefaultWebProxy;
				return obj;
			}
			catch
			{
				return null;
			}
		}

		private WebRequest OpenRequest(string requestUri)
		{
			return OpenRequest(requestUri, "RETR", 30000);
		}

		public override bool GetFileSizeFormServer(string url, ref long fileSize)
		{
			FtpWebRequest ftpWebRequest = null;
			FtpWebResponse ftpWebResponse = null;
			try
			{
				ftpWebRequest = OpenRequest(url, "SIZE", 30000) as FtpWebRequest;
				ftpWebResponse = (FtpWebResponse)ftpWebRequest.GetResponse();
				fileSize = ftpWebResponse.ContentLength;
				return true;
			}
			catch
			{
				return false;
			}
			finally
			{
				ftpWebResponse.Close();
				ftpWebRequest.Abort();
				ftpWebResponse = null;
				ftpWebRequest = null;
			}
		}
	}
	public class HttpDownload : AbstractDownloadMode
	{
		private const int MAX_BUFFER_LEN = 1024;

		public override DownloadStatus Start(DownloadTask task, CancellationTokenSource tokeSource)
		{
			if (tokeSource.IsCancellationRequested)
			{
				return DownloadStatus.PAUSE;
			}
			DownloadStatus status = DownloadStatus.DOWNLOADING;
			if (!task.DownloadInfo.downloadUrl.StartsWith("http", StringComparison.CurrentCultureIgnoreCase) && !task.DownloadInfo.downloadUrl.StartsWith("https", StringComparison.CurrentCultureIgnoreCase))
			{
				task.DownloadInfo.downloadUrl = "http://" + task.DownloadInfo.downloadUrl;
			}
			long offset = 0L;
			if (!CheckBeforeDownload(task, ref status, ref offset))
			{
				return status;
			}
			string path = Path.Combine(task.DownloadInfo.saveLocalPath, task.DownloadInfo.tempFileName);
			HttpWebRequest httpWebRequest = null;
			FileStream fileStream = null;
			Stream stream = null;
			Timer timer = null;
			try
			{
				if (tokeSource.IsCancellationRequested)
				{
					return DownloadStatus.PAUSE;
				}
				byte[] buffer = new byte[1024];
				httpWebRequest = OpenRequest(task.DownloadInfo.downloadUrl);
				httpWebRequest.AddRange((int)offset);
				using (HttpWebResponse httpWebResponse = httpWebRequest.GetResponse() as HttpWebResponse)
				{
					int num = 0;
					fileStream = File.Open(path, FileMode.Append, FileAccess.Write);
					stream = httpWebResponse.GetResponseStream();
					timer = new Timer(base.SpeedTimer, task, 0, 1000);
					while (!tokeSource.IsCancellationRequested)
					{
						int num2 = 0;
						while (++num2 < 30)
						{
							if (stream.CanRead)
							{
								num = stream.Read(buffer, 0, 1024);
								offset += num;
								task.totalSizeOfSec += num;
								task.DownloadInfo.downloadedSize = offset;
								if (num > 0 || fileStream.Length >= task.DownloadInfo.downloadFileSize)
								{
									break;
								}
								Thread.Sleep(2000);
							}
						}
						if (fileStream.Length >= task.DownloadInfo.downloadFileSize)
						{
							break;
						}
						if (num <= 0)
						{
							return DownloadStatus.PAUSE;
						}
						fileStream.Write(buffer, 0, num);
					}
					stream.Close();
					httpWebRequest.Abort();
					fileStream.Close();
					timer.Dispose();
					LogHelper.LogInstance.Info("lenovo.mbg.service.framework.download.DownloadMode.HttpDownload: Download Finished, But Not Check MD5");
				}
				return CheckAfterDownload(task, path);
			}
			catch (WebException ex)
			{
				if (ex.Status == WebExceptionStatus.ProtocolError)
				{
					LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.HttpDownload: WebException Exception - WebExceptionStatus.ProtocolError", ex);
					return ((ex.Response as HttpWebResponse).StatusCode == HttpStatusCode.NotFound) ? DownloadStatus.DOWNLOADFILENOTFOUND : DownloadStatus.UNDEFINEERROR;
				}
				if (ex.Status == WebExceptionStatus.ConnectFailure || ex.Status == WebExceptionStatus.ConnectionClosed || ex.Status == WebExceptionStatus.Timeout || ex.Status == WebExceptionStatus.NameResolutionFailure)
				{
					LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.HttpDownload: WebException Exception - WebExceptionStatus.ConnectFailure", ex);
					return DownloadStatus.NETWORKCONNECTIONERROR;
				}
				LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.HttpDownload: WebException Exception - UNDEFINEERROR", ex);
				return DownloadStatus.UNDEFINEERROR;
			}
			catch (SocketException exception)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.HttpDownload: SocketException Exception - UNDEFINEERROR", exception);
				return DownloadStatus.NETWORKCONNECTIONERROR;
			}
			catch (Exception exception2)
			{
				LogHelper.LogInstance.Error("lenovo.mbg.service.framework.download.DownloadMode.HttpDownload: Exception", exception2);
				return DownloadStatus.UNDEFINEERROR;
			}
			finally
			{
				try
				{
					stream?.Close();
					httpWebRequest?.Abort();
					fileStream?.Close();
					timer?.Dispose();
				}
				catch
				{
				}
				LogHelper.LogInstance.Info("lenovo.mbg.service.framework.download.DownloadMode.HttpDownload: Download Finished");
			}
		}

		public override bool GetFileSizeFormServer(string url, ref long fileSize)
		{
			long num = 0L;
			bool result = false;
			HttpWebRequest httpWebRequest = null;
			HttpWebResponse httpWebResponse = null;
			try
			{
				httpWebRequest = OpenRequest(url, "HEAD", 30000);
				if (httpWebRequest != null)
				{
					httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
					if (httpWebResponse.StatusCode == HttpStatusCode.OK)
					{
						num = httpWebResponse.ContentLength;
						result = true;
					}
					else
					{
						num = 0L;
						result = false;
					}
				}
			}
			catch (WebException ex)
			{
				if (ex.Status == WebExceptionStatus.ProtocolError)
				{
					try
					{
						int result2 = 0;
						httpWebRequest = WebRequest.Create(url) as HttpWebRequest;
						httpWebRequest.Method = "GET";
						httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
						if (int.TryParse(httpWebResponse.Headers["Content-Length"], out result2))
						{
							num = result2;
							result = true;
						}
					}
					catch
					{
					}
				}
				else
				{
					if (ex.Status == WebExceptionStatus.Timeout)
					{
						httpWebRequest.Abort();
					}
					num = 0L;
					result = false;
				}
			}
			catch
			{
				num = 0L;
				result = false;
			}
			finally
			{
				if (httpWebResponse != null)
				{
					httpWebResponse.Close();
					httpWebResponse = null;
				}
				if (httpWebRequest != null)
				{
					httpWebRequest.Abort();
					httpWebRequest = null;
				}
			}
			fileSize = num;
			return result;
		}

		private HttpWebRequest OpenRequest(string serverFileUrl)
		{
			return OpenRequest(serverFileUrl, "GET", 30000);
		}

		private HttpWebRequest OpenRequest(string serverFileUrl, string method, int timeout)
		{
			try
			{
				HttpWebRequest obj = WebRequest.Create(serverFileUrl) as HttpWebRequest;
				obj.Method = method;
				obj.UserAgent = GlobalVar.UserAgent;
				obj.Timeout = timeout;
				obj.KeepAlive = false;
				return obj;
			}
			catch
			{
				return null;
			}
		}
	}
	public interface IDownload
	{
		DownloadStatus Start(DownloadTask task, CancellationTokenSource tokeSource);
	}
}
namespace lenovo.mbg.service.framework.download.DownloadControllerImpl
{
	public abstract class AbstractDownloadController
	{
		public ConcurrentDictionary<AbstractDownloadInfo, DownloadTask> TaskDictionary;

		private object TaskDictionaryLock = new object();

		private object locker = new object();

		public Action<AbstractDownloadInfo> DownloadStatusChanged;

		public Action<AbstractDownloadInfo> ExistedDownloadTask;

		public Action<AbstractDownloadInfo> StopLowerControllerLevelTask;

		public int ControllerLevel { get; private set; }

		public int MaxDownloadCount { get; private set; }

		public ISaveDownloadInfoMode SaveMode { get; private set; }

		public int DownloadingCount => (from n in TaskDictionary.Values.AsParallel()
			where n.DownloadInfo.downloadStatus == DownloadStatus.DOWNLOADING
			select n).Count();

		public DownloadWorker worker => DownloadWorker.Instance;

		public AbstractDownloadController(ISaveDownloadInfoMode saveMode, int maxDownloadCount, int controllerLevel)
		{
			MaxDownloadCount = maxDownloadCount;
			ControllerLevel = controllerLevel;
			SaveMode = saveMode;
			TaskDictionary = new ConcurrentDictionary<AbstractDownloadInfo, DownloadTask>(new CompareDictionary());
			worker.OnDownloadStatusChanged += FireDownloadStatusChanged;
		}

		protected virtual void FireDownloadStatusChanged(object sender, DownloadEventArgs args)
		{
			if (!TaskDictionary.ContainsKey(args.downloadTask.DownloadInfo) || DownloadStatusChanged == null)
			{
				return;
			}
			SaveAbstractDownloadInfo();
			if (args.downloadTask.DownloadInfo.downloadStatus == DownloadStatus.SUCCESS)
			{
				lock (TaskDictionaryLock)
				{
					TaskDictionary.TryRemove(args.downloadTask.DownloadInfo, out var _);
				}
			}
			DownloadStatusChanged(args.downloadTask.DownloadInfo);
		}

		private void FireExistedDownloadTask(object sender, DownloadEventArgs args)
		{
			if (TaskDictionary.ContainsKey(args.downloadTask.DownloadInfo) && ExistedDownloadTask != null)
			{
				ExistedDownloadTask(args.downloadTask.DownloadInfo);
				SaveAbstractDownloadInfo();
			}
		}

		private void FireStopLowerControllerLevelTask(object sender, DownloadEventArgs args)
		{
			if (TaskDictionary.ContainsKey(args.downloadTask.DownloadInfo) && StopLowerControllerLevelTask != null)
			{
				StopLowerControllerLevelTask(args.downloadTask.DownloadInfo);
				SaveAbstractDownloadInfo();
			}
		}

		public virtual int Start(AbstractDownloadInfo downloadinfo)
		{
			DownloadTask downloadTask = new DownloadTask(downloadinfo, this);
			if (ExistedDownloadTask != null)
			{
				downloadTask.OnExistedDownloadTask += FireExistedDownloadTask;
			}
			if (StopLowerControllerLevelTask != null)
			{
				downloadTask.OnStopLowerControllerLevelTask += FireStopLowerControllerLevelTask;
			}
			if (!TaskDictionary.ContainsKey(downloadinfo))
			{
				lock (TaskDictionaryLock)
				{
					TaskDictionary.TryAdd(downloadinfo, downloadTask);
					SaveAbstractDownloadInfo();
				}
			}
			worker.Start(TaskDictionary[downloadinfo]);
			return 1;
		}

		public virtual int Stop(AbstractDownloadInfo downloadinfo)
		{
			if (TaskDictionary.ContainsKey(downloadinfo))
			{
				worker.Stop(TaskDictionary[downloadinfo]);
			}
			return 1;
		}

		public virtual int Stop()
		{
			lock (locker)
			{
				IEnumerable<KeyValuePair<AbstractDownloadInfo, DownloadTask>> enumerable = TaskDictionary.Where((KeyValuePair<AbstractDownloadInfo, DownloadTask> n) => n.Value.DownloadInfo.downloadStatus == DownloadStatus.DOWNLOADING);
				if (enumerable != null)
				{
					foreach (KeyValuePair<AbstractDownloadInfo, DownloadTask> item in enumerable)
					{
						worker.Stop(item.Value);
					}
				}
			}
			return 1;
		}

		public virtual int Delete(AbstractDownloadInfo downloadinfo)
		{
			Stop(downloadinfo);
			if (TaskDictionary.ContainsKey(downloadinfo))
			{
				worker.Delete(TaskDictionary[downloadinfo]);
				DownloadTask value = null;
				lock (TaskDictionaryLock)
				{
					TaskDictionary.TryRemove(downloadinfo, out value);
				}
				SaveAbstractDownloadInfo();
			}
			TaskDictionary.Values.Select((DownloadTask n) => n.DownloadInfo);
			return 1;
		}

		public virtual void SaveAbstractDownloadInfo()
		{
			if (SaveMode != null)
			{
				Task.Factory.StartNew(delegate
				{
					SaveMode.SaveAbstractDownloadInfo(SelectDownloadInfoFromTask());
				});
			}
		}

		public IEnumerable<AbstractDownloadInfo> SelectDownloadInfoFromTask()
		{
			return TaskDictionary.Values.Select((DownloadTask n) => n.DownloadInfo);
		}

		public virtual IEnumerable<AbstractDownloadInfo> GetAbstractDownloadInfoList()
		{
			try
			{
				if (SaveMode != null)
				{
					return SaveMode.GetAbstractDownloadInfoList();
				}
			}
			catch (Exception)
			{
			}
			return null;
		}

		private void StartNextTask()
		{
			IEnumerable<KeyValuePair<AbstractDownloadInfo, DownloadTask>> source = TaskDictionary.Where((KeyValuePair<AbstractDownloadInfo, DownloadTask> n) => n.Value.DownloadInfo.downloadStatus == DownloadStatus.WAITTING);
			if (source.Count() > 0)
			{
				DownloadTask value = (from n in source
					orderby n.Value.DownloadInfo.downloadLevel descending, n.Value.StartTime descending
					select n).First().Value;
				worker.Start(value);
			}
		}
	}
	public class ImmediatelyDownloadController : AbstractDownloadController
	{
		public ImmediatelyDownloadController()
			: this(null)
		{
		}

		public ImmediatelyDownloadController(ISaveDownloadInfoMode SaveMode)
			: this(SaveMode, int.MaxValue)
		{
		}

		public ImmediatelyDownloadController(ISaveDownloadInfoMode SaveMode, int maxDownloadCount)
			: this(SaveMode, maxDownloadCount, 0)
		{
		}

		public ImmediatelyDownloadController(ISaveDownloadInfoMode saveMode, int maxDownloadCount, int controllerLevel)
			: base(saveMode, maxDownloadCount, controllerLevel)
		{
		}
	}
	public class ConditionDownloadController : AbstractDownloadController, IDownloadCondition
	{
		public ConditionDownloadController()
			: this(null)
		{
		}

		public ConditionDownloadController(ISaveDownloadInfoMode SaveMode)
			: this(SaveMode, int.MaxValue)
		{
		}

		public ConditionDownloadController(ISaveDownloadInfoMode SaveMode, int maxDownloadCount)
			: this(SaveMode, maxDownloadCount, 0)
		{
		}

		public ConditionDownloadController(ISaveDownloadInfoMode saveMode, int maxDownloadCount, int controllerLevel)
			: base(saveMode, maxDownloadCount, controllerLevel)
		{
		}

		public bool CanDownload()
		{
			return true;
		}
	}
	public class GeneralDownloadController : AbstractDownloadController
	{
		public GeneralDownloadController()
			: this(null)
		{
		}

		public GeneralDownloadController(ISaveDownloadInfoMode SaveMode)
			: this(SaveMode, int.MaxValue)
		{
		}

		public GeneralDownloadController(ISaveDownloadInfoMode SaveMode, int maxDownloadCount)
			: this(SaveMode, maxDownloadCount, 0)
		{
		}

		public GeneralDownloadController(ISaveDownloadInfoMode saveMode, int maxDownloadCount, int controllerLevel)
			: base(saveMode, maxDownloadCount, controllerLevel)
		{
		}
	}
}
