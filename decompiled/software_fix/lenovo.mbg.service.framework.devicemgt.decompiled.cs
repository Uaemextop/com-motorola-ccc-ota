using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Management;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SharpAdbClient;
using SharpAdbClient.DeviceCommands;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.common.utilities;
using lenovo.mbg.service.common.webservices;
using lenovo.mbg.service.common.webservices.WebApiServices;
using lenovo.mbg.service.framework.devicemgt.DeviceInfo;
using lenovo.mbg.service.framework.devicemgt.DeviceOperator;
using lenovo.mbg.service.framework.services.Device;
using lenovo.mbg.service.framework.socket;
using lenovo.mbg.service.lmsa.hostproxy;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.framework.devicemgt")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("lenovo.mbg.service.framework.devicemgt")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: InternalsVisibleTo("lenovo.mbg.service.common.utilities")]
[assembly: ComVisible(false)]
[assembly: Guid("aadb1072-7f98-4ce6-b791-1f16404d89ee")]
[assembly: AssemblyFileVersion("1.1.0.0")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("1.1.0.0")]
namespace lenovo.mbg.service.framework.devicemgt
{
	public class FBConnectionMonitorEx
	{
		private class FastbootScaner
		{
			private readonly FBConnectionMonitorEx outer;

			private readonly Dictionary<string, DeviceEx> Cache = new Dictionary<string, DeviceEx>();

			private volatile bool isRunning;

			public FastbootScaner(FBConnectionMonitorEx outer)
			{
				this.outer = outer;
			}

			public void Start(bool isClear = true)
			{
				isRunning = true;
				ScanDevice(isClear);
			}

			private void ScanDevice(bool isClear = true)
			{
				if (isClear)
				{
					Cache.Clear();
				}
				List<string> list = new List<string>();
				new List<string>();
				while (isRunning)
				{
					list = outer._operator.FindDevices();
					if (list.Count == 0)
					{
						list = outer._operator.FindDevices(FastbootOperator.fastbootExe);
					}
					foreach (string item in list)
					{
						if (!Cache.ContainsKey(item))
						{
							FastbootDeviceEx fastbootDeviceEx = new FastbootDeviceEx
							{
								ConnectType = ConnectType.Fastboot,
								Identifer = item
							};
							Cache.Add(item, fastbootDeviceEx);
							outer.m_listener.OnConnect(fastbootDeviceEx, DevicePhysicalStateEx.Online);
						}
						else if (Cache[item].IsRemove)
						{
							Cache[item].IsRemove = false;
							outer.m_listener.OnConnect(Cache[item], DevicePhysicalStateEx.Online);
							LogHelper.LogInstance.Info($"ScanDevice====Cache exists ,Current WorkType:[{Cache[item].WorkType}]");
						}
					}
					foreach (string item2 in (from n in Cache
						where !n.Value.IsRemove
						select n.Key).Except(list).ToList())
					{
						DeviceEx deviceEx = Cache[item2];
						if (deviceEx.WorkType == DeviceWorkType.None)
						{
							Cache.Remove(item2);
						}
						else
						{
							deviceEx.IsRemove = true;
						}
						outer.m_listener.OnDisconnect(deviceEx);
					}
					Thread.Sleep(1000);
				}
			}

			public void Stop()
			{
				isRunning = false;
			}
		}

		private FastbootScaner scaner;

		private ICompositListener m_listener;

		private FastbootOperator _operator = new FastbootOperator();

		public FBConnectionMonitorEx(ICompositListener listener)
		{
			m_listener = listener;
			scaner = new FastbootScaner(this);
		}

		public void StartMonitoring(bool isClear = true)
		{
			scaner.Start(isClear);
		}

		public void StopMonitoring()
		{
			scaner.Stop();
		}
	}
	public static class DevicemgtContantClass
	{
		public static bool IsBackAndRestoreFrm { get; set; }

		public static bool IsOtherToBackAndRestoreAndAutoConnection { get; set; }
	}
	public class DeviceReadConfig
	{
		protected static ApiService servic = new ApiService();

		public static DeviceReadConfig Instance = new DeviceReadConfig();

		private static Task task;

		public Dictionary<string, dynamic> ModelConfigMapping { get; private set; }

		public dynamic this[string key]
		{
			get
			{
				task?.Wait();
				if (!ModelConfigMapping.ContainsKey(key))
				{
					return null;
				}
				return ModelConfigMapping[key];
			}
		}

		private DeviceReadConfig()
		{
		}

		public Task LoadTask()
		{
			ModelConfigMapping = new Dictionary<string, object>();
			task = Task.Factory.StartNew(delegate
			{
				object obj = servic.RequestContent(WebApiUrl.MODEL_READ_CONFIG, null);
				if (obj != null)
				{
					foreach (JToken item in obj as JArray)
					{
						string text = item.Value<string>("modelName");
						if (!string.IsNullOrEmpty(text) && !ModelConfigMapping.ContainsKey(text))
						{
							ModelConfigMapping.Add(text, item);
						}
					}
				}
			});
			return task;
		}

		public List<string> GetAllProps()
		{
			task?.Wait();
			List<string> result = new List<string>();
			if (ModelConfigMapping.Count > 0)
			{
				ModelConfigMapping.Values.ToList().ForEach(delegate(dynamic n)
				{
					if (n.pn != null)
					{
						result.Add(n.pn.Value);
					}
					if (n.sn != null)
					{
						result.Add(n.sn.Value);
					}
					if (n.imei != null)
					{
						result.Add(n.imei.Value);
					}
					if (n.imei2 != null)
					{
						result.Add(n.imei2.Value);
					}
				});
				string text = string.Join(",", result);
				result = text.Split(new char[1] { ',' }, StringSplitOptions.RemoveEmptyEntries).Distinct().ToList();
			}
			return result;
		}
	}
	public class FastbootDeviceEx : DeviceEx
	{
		public override IAndroidDevice Property { get; set; }

		public FastbootDeviceEx()
		{
			Property = new FastbootAndroidDevice(this);
			base.DeviceOperator = new FastbootOperator();
		}

		public override void Load()
		{
			((ILoadDeviceData)Property).Load();
		}

		protected override void OnPhysicalStatusChanged(DevicePhysicalStateEx prev, DevicePhysicalStateEx current)
		{
			if (current != DevicePhysicalStateEx.Online)
			{
				return;
			}
			base.SoftStatus = DeviceSoftStateEx.Connecting;
			Task.Run(delegate
			{
				Load();
			}).ContinueWith(delegate
			{
				if (base.PhysicalStatus == DevicePhysicalStateEx.Online)
				{
					LogHelper.LogInstance.Info("TestLog-->device softStatus Changed ModelName:" + Property.ModelName + ",Imei1:" + Property.IMEI1);
					if (!string.IsNullOrEmpty(Property.ModelName) || !string.IsNullOrEmpty(Property.IMEI1))
					{
						base.SoftStatus = DeviceSoftStateEx.Online;
					}
					else
					{
						base.SoftStatus = DeviceSoftStateEx.Offline;
						if (base.WorkType == DeviceWorkType.None)
						{
							GlobalCmdHelper.Instance.Execute(new
							{
								type = GlobalCmdType.READ_DEVICEINFO_CALLBACK,
								data = (Property.Others.Count == 0)
							});
						}
					}
				}
				else
				{
					base.SoftStatus = DeviceSoftStateEx.Offline;
				}
			});
		}
	}
	public class WifiDeviceData
	{
		public string Ip { get; set; }

		public string IpRSA { get; set; }

		public int CmdPort { get; set; }

		public int DataPort { get; set; }

		public int ExtendDataPort { get; set; }

		public int BackupAndRestorePort { get; set; }

		public string ConnectedAppType { get; set; }
	}
	public class WifiDeviceEx : TcpAndroidDevice
	{
		public WifiDeviceData DeviceData { get; set; }

		protected override ConnectErrorCode CheckMotoAppVersion()
		{
			return ConnectErrorCode.OK;
		}

		public override ConnectErrorCode StartMotoApp()
		{
			return ConnectErrorCode.OK;
		}

		protected override ConnectErrorCode CheckMaAppVersion()
		{
			return ConnectErrorCode.OK;
		}

		public override ConnectErrorCode StartMaApp()
		{
			return ConnectErrorCode.OK;
		}

		protected override ConnectErrorCode InstallApp()
		{
			return ConnectErrorCode.OK;
		}

		protected override ConnectErrorCode UninstallApp()
		{
			return ConnectErrorCode.OK;
		}

		protected override void UninstallDebugOrOldPackageNameApp()
		{
		}

		public override void CallAppToFrontstage()
		{
		}

		protected override WifiDeviceData GetServiceHostEndPointInfo()
		{
			return DeviceData;
		}

		public override ConnectErrorCode LoadProperty()
		{
			if (base.MessageManager == null)
			{
				return ConnectErrorCode.Unknown;
			}
			Load();
			if (Property != null)
			{
				return ConnectErrorCode.OK;
			}
			return ConnectErrorCode.PropertyLoadFail;
		}

		public override bool FocuseApp()
		{
			return true;
		}

		protected override bool CheckPermissionsPerpare()
		{
			return true;
		}

		public override void Load()
		{
			try
			{
				PropInfo propInfo = new PropInfoLoader().LoadAll(this);
				Property = new AndroidDeviceProperty(propInfo);
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Load wifi device property failed:" + ex);
			}
		}
	}
	internal class AdbConnectionMonitorEx : IDisposable
	{
		private class AdbScaner
		{
			private readonly AdbConnectionMonitorEx outer;

			private readonly Dictionary<string, DeviceEx> Cache = new Dictionary<string, DeviceEx>();

			private volatile bool isRunning;

			protected AdbOperator Operator = new AdbOperator();

			private static string wmiDeviceQuery = "SELECT * FROM Win32_PnPEntity WHERE ClassGuid='{eec5ad98-8080-425f-922a-dabf3de3f69a}'";

			private ManagementObjectSearcher wmiSearcher = new ManagementObjectSearcher(wmiDeviceQuery);

			private string[] manufacturers = new string[2] { "LENOVO", "MOTOROLA" };

			public AdbScaner(AdbConnectionMonitorEx outer)
			{
				//IL_001c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0026: Expected O, but got Unknown
				this.outer = outer;
			}

			public void Start()
			{
				isRunning = true;
				Cache.Clear();
				List<DeviceDataEx> foundDevices = new List<DeviceDataEx>();
				List<DeviceData> list = new List<DeviceData>();
				new List<string>();
				while (isRunning)
				{
					foundDevices.Clear();
					list = Operator.FindAdbDevices();
					if (list.Count == 0)
					{
						DeviceDataEx deviceDataEx = findNewDeviceByWmi();
						if (deviceDataEx != null)
						{
							foundDevices.Add(deviceDataEx);
						}
					}
					else
					{
						list.ForEach(delegate(DeviceData n)
						{
							foundDevices.Add(new DeviceDataEx
							{
								Data = n,
								PhyState = (DevicePhysicalStateEx)n.State
							});
						});
					}
					foreach (DeviceDataEx item in foundDevices)
					{
						if (item == null || item.Data == null || string.IsNullOrWhiteSpace(item.Data.Serial) || item.Data.Serial.StartsWith("emulator-"))
						{
							continue;
						}
						if (!Cache.ContainsKey(item.Data.Serial))
						{
							AdbDeviceEx adbDeviceEx = new AdbDeviceEx
							{
								ConnectType = ConnectType.Adb,
								Identifer = item.Data.Serial,
								ValidateCodeFunc = (outer.m_Listener as DeviceConnectionManagerEx).ValidateCodeFunc
							};
							DevicemgtContantClass.IsOtherToBackAndRestoreAndAutoConnection = true;
							try
							{
								Cache.Add(item.Data.Serial, adbDeviceEx);
							}
							catch (Exception)
							{
							}
							outer.m_Listener.OnConnect(adbDeviceEx, item.PhyState);
						}
						else if (Cache[item.Data.Serial].IsRemove)
						{
							Cache[item.Data.Serial].IsRemove = false;
							outer.m_Listener.OnConnect(Cache[item.Data.Serial], item.PhyState);
						}
						else
						{
							Cache[item.Data.Serial].PhysicalStatus = item.PhyState;
						}
					}
					foreach (string item2 in (from n in Cache
						where !n.Value.IsRemove
						select n.Key).Except(foundDevices.Select((DeviceDataEx n) => n.Data.Serial)).ToList())
					{
						DeviceEx deviceEx = Cache[item2];
						if (deviceEx.WorkType == DeviceWorkType.None)
						{
							Cache.Remove(item2);
						}
						else
						{
							deviceEx.IsRemove = true;
						}
						outer.m_Listener.OnDisconnect(deviceEx);
					}
					Thread.Sleep(1000);
				}
			}

			private void ChangeOtherEquipment(DeviceEx deviceEx)
			{
				DevicemgtContantClass.IsOtherToBackAndRestoreAndAutoConnection = deviceEx.ConnectedAppType == "Moto";
			}

			public void Stop()
			{
				isRunning = false;
			}

			private DeviceDataEx findNewDeviceByWmi()
			{
				//IL_0019: Unknown result type (might be due to invalid IL or missing references)
				//IL_001e: Unknown result type (might be due to invalid IL or missing references)
				try
				{
					ManagementObjectEnumerator enumerator = wmiSearcher.Get().GetEnumerator();
					try
					{
						while (enumerator.MoveNext())
						{
							ManagementObject val = (ManagementObject)enumerator.Current;
							object obj = ((ManagementBaseObject)val)["Manufacturer"];
							object obj2 = ((ManagementBaseObject)val)["PNPDeviceID"];
							string empty = string.Empty;
							if (obj != null && obj2 != null && Enumerable.Contains(manufacturers, obj.ToString().ToUpper()) && (empty = obj2.ToString()).StartsWith("USB"))
							{
								return new DeviceDataEx
								{
									Data = new DeviceData
									{
										Serial = empty
									},
									PhyState = DevicePhysicalStateEx.UsbDebugSwitchClosed
								};
							}
						}
					}
					finally
					{
						((IDisposable)enumerator)?.Dispose();
					}
				}
				catch (Exception)
				{
				}
				return null;
			}
		}

		public static IAdbClient m_AdbClient = new AdbClient();

		private readonly ICompositListener m_Listener;

		private readonly string m_AdbExeFileFullName;

		private readonly AdbScaner adbScaner;

		public AdbConnectionMonitorEx(ICompositListener listener, string adbFileName)
		{
			m_Listener = listener;
			m_AdbExeFileFullName = adbFileName;
			adbScaner = new AdbScaner(this);
		}

		public void StartMonitoring()
		{
			int num = 3;
			do
			{
				try
				{
					AdbServer.Instance.StartServer(m_AdbExeFileFullName, restartServerIfNewer: true);
				}
				catch
				{
					continue;
				}
				break;
			}
			while (num-- > 0);
			adbScaner.Start();
		}

		public void StopMonitoring()
		{
			adbScaner.Stop();
			TryKillAdb();
		}

		private void TryKillAdb()
		{
			try
			{
				if (m_AdbClient != null)
				{
					m_AdbClient.KillAdb();
				}
			}
			catch (Exception)
			{
			}
		}

		public void Dispose()
		{
			StopMonitoring();
		}
	}
	internal class WifiConnectionMonitorEx : IDisposable
	{
		private class AppSocketServiceConfig
		{
			[JsonProperty("ip")]
			public string Ip { get; set; }

			[JsonProperty("cmdPort")]
			public int CmdPort { get; set; }

			[JsonProperty("dataProt")]
			public int DataProt { get; set; }

			[JsonProperty("extendDataPort")]
			public int ExtendDataPort { get; set; }

			[JsonProperty("backupAndRestorePort")]
			public int BackupAndRestorePort { get; set; }

			[JsonProperty("isForcedRestart")]
			public bool IsForcedRestart { get; set; }

			[JsonProperty("appType")]
			public string ConnectedAppType { get; set; }

			public int appVersion { get; set; }
		}

		private class NetworkAdapterWatcher
		{
			public delegate void NetworkAdapterChangeHandler(List<Tuple<string, string>> add, List<Tuple<string, string>> remove);

			private List<string> m_Unusables = new List<string>();

			private List<Tuple<string, string>> m_IPs = new List<Tuple<string, string>>();

			private Timer m_Timer;

			private NetworkAdapterChangeHandler m_Handler;

			public List<Tuple<string, string>> IPs
			{
				get
				{
					return new List<Tuple<string, string>>(m_IPs);
				}
				private set
				{
					m_IPs = value;
				}
			}

			public NetworkAdapterWatcher(NetworkAdapterChangeHandler handler)
			{
				m_Handler = handler;
			}

			public void Start()
			{
				m_Timer = new Timer(RefreshProc, null, 0, 5000);
			}

			public void Stop()
			{
				m_Timer.Dispose();
				m_Timer = null;
			}

			private void RefreshProc(object obj)
			{
				lock (this)
				{
					List<Tuple<string, string>> allIPV4s = NetworkUtility.GetAllIPV4s();
					List<Tuple<string, string>> list = allIPV4s.Except(IPs).ToList();
					List<Tuple<string, string>> list2 = IPs.Except(allIPV4s).ToList();
					if (list.Count > 0 || list2.Count > 0)
					{
						IPs = allIPV4s;
						m_Handler?.Invoke(list, list2);
					}
				}
			}
		}

		private class WaitForConnectWrapper : IDisposable
		{
			private SortedList<string, ListeningSocket> m_WaitForConnects;

			private readonly object m_WaitForConnectsLock = new object();

			public List<Tuple<string, string>> GetIpGateWayArr
			{
				get
				{
					lock (m_WaitForConnectsLock)
					{
						return m_WaitForConnects.Select((KeyValuePair<string, ListeningSocket> p) => new Tuple<string, string>(p.Key, p.Value.GateWay)).ToList();
					}
				}
			}

			public WaitForConnectWrapper()
			{
				m_WaitForConnects = new SortedList<string, ListeningSocket>();
			}

			public void Dispose()
			{
				lock (m_WaitForConnectsLock)
				{
					if (m_WaitForConnects == null)
					{
						return;
					}
					foreach (ListeningSocket value in m_WaitForConnects.Values)
					{
						value.Close();
					}
					m_WaitForConnects.Clear();
				}
			}

			public ListeningSocket GetValue(string key)
			{
				lock (m_WaitForConnectsLock)
				{
					if (m_WaitForConnects.ContainsKey(key))
					{
						return m_WaitForConnects[key];
					}
					return null;
				}
			}

			public void AddRange(SortedList<string, ListeningSocket> items)
			{
				lock (m_WaitForConnectsLock)
				{
					foreach (KeyValuePair<string, ListeningSocket> item in items)
					{
						m_WaitForConnects.Add(item.Key, item.Value);
					}
				}
			}

			public void Remove(string key)
			{
				lock (m_WaitForConnectsLock)
				{
					if (m_WaitForConnects.ContainsKey(key))
					{
						m_WaitForConnects.Remove(key);
					}
				}
			}

			public bool TryRemoveAndClose(string ip)
			{
				lock (m_WaitForConnectsLock)
				{
					KeyValuePair<string, ListeningSocket> keyValuePair = default(KeyValuePair<string, ListeningSocket>);
					KeyValuePair<string, ListeningSocket> keyValuePair2 = m_WaitForConnects.FirstOrDefault((KeyValuePair<string, ListeningSocket> p) => p.Key.Contains(ip));
					if (keyValuePair2.Equals(keyValuePair))
					{
						return false;
					}
					m_WaitForConnects.Remove(keyValuePair2.Key);
					keyValuePair2.Value?.Close();
					return true;
				}
			}
		}

		private class ListeningSocket
		{
			public IPAddress Address { get; set; }

			public int Port { get; set; }

			public Socket Listener { get; set; }

			public string GateWay { get; set; }

			public override string ToString()
			{
				return Address?.ToString() + ":" + Port;
			}

			public void Close()
			{
				if (Listener == null)
				{
					return;
				}
				try
				{
					Listener.Close();
					Listener.Dispose();
					Listener = null;
				}
				catch (Exception arg)
				{
					LogHelper.LogInstance.Error($"Close socket listener {Address}:{Port} failed, throw exception: {arg}");
				}
			}
		}

		private ICompositListener m_Listener;

		private NetworkAdapterWatcher m_NetworkWatcher;

		private WaitForConnectWrapper m_waitForConnect;

		private volatile bool _connecting;

		public string TAG => GetType().ToString();

		public List<Tuple<string, string>> WaitForConnectEndPoints => m_waitForConnect.GetIpGateWayArr;

		public WifiConnectionMonitorEx(ICompositListener listener)
		{
			m_Listener = listener;
			m_waitForConnect = new WaitForConnectWrapper();
		}

		public void StartMonitoring()
		{
			m_NetworkWatcher = new NetworkAdapterWatcher(NetworkAdapterChangeHandler);
			m_NetworkWatcher.Start();
		}

		public void StopMonitoring()
		{
			if (m_NetworkWatcher != null)
			{
				m_NetworkWatcher.Stop();
				m_NetworkWatcher = null;
			}
			if (m_waitForConnect != null)
			{
				m_waitForConnect.Dispose();
			}
		}

		public void Dispose()
		{
			StopMonitoring();
		}

		public void NetworkAdapterChangeHandler(List<Tuple<string, string>> add, List<Tuple<string, string>> remove)
		{
			bool changed = false;
			SortedList<string, ListeningSocket> sortedList = new SortedList<string, ListeningSocket>();
			foreach (Tuple<string, string> item in add)
			{
				int availablePort = NetworkUtility.GetAvailablePort(10000, 20000);
				ListeningSocket listeningSocket = LaunchWaitForConnectTask(item.Item1, availablePort);
				if (listeningSocket != null)
				{
					changed = true;
					listeningSocket.GateWay = item.Item2;
					string key = $"{item.Item1}:{availablePort}";
					sortedList.Add(key, listeningSocket);
				}
			}
			m_waitForConnect.AddRange(sortedList);
			remove.ForEach(delegate(Tuple<string, string> p)
			{
				changed |= m_waitForConnect.TryRemoveAndClose(p.Item1);
			});
			if (changed)
			{
				m_Listener.OnWifiMonitoringEndPointChanged(m_waitForConnect.GetIpGateWayArr);
			}
		}

		private ListeningSocket LaunchWaitForConnectTask(string ip, int port)
		{
			Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
			ListeningSocket listeningSocket = new ListeningSocket
			{
				Address = IPAddress.Parse(ip),
				Port = port,
				Listener = socket
			};
			try
			{
				socket.Bind(new IPEndPoint(IPAddress.Parse(ip), port));
				socket.Listen(1);
				socket.BeginAccept(CmdClientConnectionRequestHandler, listeningSocket);
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error($"Add a new listener {ip}:{port} failed! Error: {ex.Message}");
				listeningSocket.Close();
				listeningSocket = null;
			}
			return listeningSocket;
		}

		private void CmdClientConnectionRequestHandler(IAsyncResult ar)
		{
			ListeningSocket listeningSocket = ar.AsyncState as ListeningSocket;
			if (_connecting)
			{
				return;
			}
			_connecting = true;
			Socket socket = null;
			try
			{
				if (listeningSocket.Listener == null)
				{
					return;
				}
				socket = listeningSocket.Listener.EndAccept(ar);
				socket.SetSocketOption(SocketOptionLevel.Tcp, SocketOptionName.Debug, optionValue: true);
				socket.ReceiveTimeout = 40000;
				byte[] array = new byte[2048];
				if (!socket.Connected || socket.Receive(array, 0, 4, SocketFlags.None) != 4)
				{
					return;
				}
				int num = BitConverter.ToInt32(array, 0);
				if (num != socket.Receive(array, 0, num, SocketFlags.None))
				{
					return;
				}
				string text = Encoding.UTF8.GetString(array, 0, num);
				LogHelper.LogInstance.Info("wifi device raw data: " + text);
				AppSocketServiceConfig appSocketServiceConfig = JsonConvert.DeserializeObject<AppSocketServiceConfig>(text);
				WifiDeviceData wifiDeviceData = new WifiDeviceData();
				wifiDeviceData.Ip = appSocketServiceConfig.Ip;
				wifiDeviceData.CmdPort = appSocketServiceConfig.CmdPort;
				wifiDeviceData.DataPort = appSocketServiceConfig.DataProt;
				wifiDeviceData.ExtendDataPort = appSocketServiceConfig.ExtendDataPort;
				wifiDeviceData.BackupAndRestorePort = appSocketServiceConfig.BackupAndRestorePort;
				wifiDeviceData.IpRSA = (socket.LocalEndPoint as IPEndPoint).Address.ToString();
				wifiDeviceData.ConnectedAppType = (string.IsNullOrEmpty(appSocketServiceConfig.ConnectedAppType) ? "Moto" : "Ma");
				WifiDeviceEx device = new WifiDeviceEx();
				device.DeviceData = wifiDeviceData;
				device.Identifer = $"{wifiDeviceData.Ip}:{wifiDeviceData.CmdPort}";
				device.ValidateCodeFunc = (m_Listener as DeviceConnectionManagerEx).ValidateCodeFunc;
				device.ConnectType = ConnectType.Wifi;
				device.AppVersion = appSocketServiceConfig.appVersion;
				device.ConnectedAppType = wifiDeviceData.ConnectedAppType;
				device.SoftStatusChanged += delegate(object s, DeviceSoftStateEx e)
				{
					if (e == DeviceSoftStateEx.Offline || e == DeviceSoftStateEx.ManualDisconnect)
					{
						m_Listener.OnDisconnect(device);
					}
				};
				m_Listener.OnConnect(device, DevicePhysicalStateEx.Online);
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Info("Software Fix try to read config from new device failed! Error: " + ex.Message);
			}
			finally
			{
				_connecting = false;
				socket?.Close();
				try
				{
					listeningSocket?.Listener?.BeginAccept(CmdClientConnectionRequestHandler, listeningSocket);
				}
				catch
				{
					listeningSocket.Close();
					listeningSocket = null;
				}
			}
		}
	}
	public class DeviceDataEx
	{
		public DevicePhysicalStateEx PhyState { get; set; }

		public DeviceData Data { get; set; }
	}
	public class AdbDeviceEx : TcpAndroidDevice
	{
		private class TcpConnectHandler
		{
			protected AdbDeviceEx outer;

			public string AppPackageName { get; set; }

			public ConnectErrorCode VersionMatchCode { get; set; }

			public TcpConnectHandler(AdbDeviceEx outer, string appPackageName)
			{
				this.outer = outer;
				AppPackageName = appPackageName;
				outer.ConnectedAppType = "Ma";
			}

			protected virtual Dictionary<string, object> GetAppVersionCode(string packageName = "")
			{
				if (string.IsNullOrEmpty(packageName))
				{
					packageName = AppPackageName;
				}
				Dictionary<string, object> dictionary = new Dictionary<string, object>
				{
					{ "code", 0 },
					{
						"name",
						string.Empty
					}
				};
				outer.AppVersion = 0;
				string command = "shell \"dumpsys package " + packageName + " | grep version\"";
				string text = outer.DeviceOperator.Command(command, 10000, outer.Identifer);
				if (!string.IsNullOrEmpty(text))
				{
					Match match = Regex.Match(text, "(?<key>versioncode=)(?<value>\\d*)(\\s*.*)", RegexOptions.IgnoreCase | RegexOptions.Multiline);
					Match match2 = Regex.Match(text, "(?<key>versionname=)(?<value>[\\d\\.]+)", RegexOptions.IgnoreCase | RegexOptions.Multiline);
					string value = match.Groups["value"].Value;
					string value2 = match2.Groups["value"].Value;
					int.TryParse(value, out var result);
					dictionary["code"] = result;
					dictionary["name"] = value2;
					outer.AppVersion = result;
				}
				return dictionary;
			}

			public virtual void AppVersionIsMatched()
			{
				Dictionary<string, object> appVersionCode = GetAppVersionCode();
				int num = int.Parse(appVersionCode["code"].ToString());
				LogHelper.LogInstance.Info(string.Format("Client version: {0}, App version: {1}, Name: {2}", Configurations.AppVersionCode, num, appVersionCode["name"]));
				Configurations.ConnectedVersionCodeOfMA = num;
				if (num == 0)
				{
					VersionMatchCode = ConnectErrorCode.Unknown;
				}
				else if (num > 0 && Configurations.AppMinVersionCodeOfMA > num)
				{
					VersionMatchCode = ConnectErrorCode.ClientUnsupport;
				}
				else
				{
					VersionMatchCode = ((Configurations.AppVersionCode <= num) ? ConnectErrorCode.OK : ConnectErrorCode.AppVersionNotMatched);
				}
			}

			public virtual ConnectErrorCode InstallApp()
			{
				if (outer.PhysicalStatus != DevicePhysicalStateEx.Online || outer.WorkType.HasFlag(DeviceWorkType.Rescue))
				{
					return ConnectErrorCode.Unknown;
				}
				if (outer.InstallAppCallback == null || outer.InstallAppCallback((int)VersionMatchCode))
				{
					return Install();
				}
				LogHelper.LogInstance.Debug("User refuses to install app");
				return ConnectErrorCode.ApkInstallFail;
			}

			public ConnectErrorCode Install()
			{
				ConnectErrorCode result = ConnectErrorCode.Unknown;
				LogHelper.LogInstance.Info("Begin install app");
				string text = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "apk", "lmsa.apk");
				LogHelper.LogInstance.Debug("LMSA apk path : " + text);
				if (File.Exists(text))
				{
					string text2 = outer.DeviceOperator.Command($"install -r \"{text}\"", 20000, outer.Identifer);
					LogHelper.LogInstance.Info("Apk install cmd response:" + text2);
					text2 = ((text2 != null) ? text2.ToUpper() : string.Empty);
					if (text2.Contains("SUCCESS"))
					{
						result = ConnectErrorCode.OK;
						Configurations.ConnectedVersionCodeOfMA = int.Parse(GetAppVersionCode()["code"].ToString());
					}
					else
					{
						if (!text2.Contains("NO SPACE LEFT ON DEVICE") && !text2.Contains("NOT ENOUGH SPACE"))
						{
							AppVersionIsMatched();
							if (VersionMatchCode != ConnectErrorCode.AppVersionNotMatched)
							{
								return ConnectErrorCode.OK;
							}
							return ConnectErrorCode.ApkInstallFail;
						}
						result = ConnectErrorCode.ApkInstallFailWithHaveNoSpace;
					}
				}
				else
				{
					LogHelper.LogInstance.Info("Apk file not existed:" + text);
				}
				return result;
			}

			public virtual ConnectErrorCode UnInstallApp()
			{
				if (outer.PhysicalStatus != DevicePhysicalStateEx.Online)
				{
					return ConnectErrorCode.Unknown;
				}
				LogHelper.LogInstance.Debug("Begin uninstall apk");
				string text = outer.DeviceOperator.Command("uninstall " + AppPackageName, 20000, outer.Identifer);
				LogHelper.LogInstance.Info("Uninstall apk,command response value:" + text);
				return ConnectErrorCode.OK;
			}

			public virtual void UninstallDebugOrOldPackageNameApp()
			{
				if (outer.PhysicalStatus != DevicePhysicalStateEx.Online)
				{
					return;
				}
				LogHelper.LogInstance.Debug("Begin uninstall com.lmsa.lmsaappclient.");
				string text = outer.DeviceOperator.Command("uninstall com.lmsa.lmsaappclient", 20000, outer.Identifer);
				LogHelper.LogInstance.Debug("Uninstall com.lmsa.lmsaappclient, command response value:" + text);
				string text2 = GetAppVersionCode("com.motorola.lmsaappclient")["name"].ToString();
				if (!string.IsNullOrEmpty(text2))
				{
					string[] array = text2.Split(new char[1] { '.' });
					if (array.Length == 4 && array[2] == "6")
					{
						LogHelper.LogInstance.Debug("Check whether the com.motorola.lmsaappclient is a debug version, version is :[" + text2 + "].");
						LogHelper.LogInstance.Debug("Begin uninstall com.motorola.lmsaappclient.");
						text = outer.DeviceOperator.Command("uninstall com.motorola.lmsaappclient", 20000, outer.Identifer);
						LogHelper.LogInstance.Debug("Uninstall com.motorola.lmsaappclient, command response value:" + text);
					}
				}
			}

			public virtual ConnectErrorCode LoadProperty()
			{
				try
				{
					if (outer == null || outer.MessageManager == null)
					{
						return ConnectErrorCode.Unknown;
					}
					AndroidDeviceProperty androidDeviceProperty = new AndroidDeviceProperty(new PropInfoLoader().LoadAll(outer));
					outer.Property = androidDeviceProperty;
					if (string.IsNullOrEmpty(androidDeviceProperty.SN))
					{
						string text = outer.DeviceOperator.Command("shell getprop", -1, outer.Identifer);
						if (!string.IsNullOrEmpty(text))
						{
							using StringReader stringReader = new StringReader(text);
							(new char[1])[0] = ':';
							string text2 = null;
							string[] array = new string[AndroidDeviceProperty.SN_PROP_FIELDS.Length];
							for (int i = 0; i < array.Length; i++)
							{
								array[i] = "[" + AndroidDeviceProperty.SN_PROP_FIELDS[i] + "]";
							}
							bool flag = false;
							while ((text2 = stringReader.ReadLine()) != null && !flag)
							{
								string empty = string.Empty;
								for (int j = 0; j < array.Count(); j++)
								{
									empty = array[j];
									if (text2.StartsWith(empty))
									{
										string value = text2.Substring(text2.LastIndexOf('[') + 1).TrimEnd(new char[1] { ']' });
										if (!string.IsNullOrEmpty(value))
										{
											flag = true;
											androidDeviceProperty.AddOrUpdate(new PropItem
											{
												Key = AndroidDeviceProperty.SN_PROP_FIELDS[j],
												Value = value
											});
											break;
										}
									}
								}
							}
						}
					}
					if (string.IsNullOrEmpty(androidDeviceProperty.GetPropertyValue("ro.build.version.full")))
					{
						string text3 = outer.DeviceOperator.Command("shell getprop ro.build.version.full", -1, outer.Identifer);
						if (string.IsNullOrEmpty(text3))
						{
							text3 = "";
						}
						androidDeviceProperty.AddOrUpdate(new PropItem
						{
							Key = "ro.build.version.full",
							Value = text3.Replace("\r\n", "")
						});
					}
					return ConnectErrorCode.OK;
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("Load data throw exception:" + ex.ToString());
					return ConnectErrorCode.PropertyLoadFail;
				}
			}

			public virtual void FocuseApp()
			{
				string text = outer.DeviceOperator.Command("shell \"dumpsys window | grep mCurrentFocus\"", -1, outer.Identifer);
				LogHelper.LogInstance.Debug("shell \"dumpsys window | grep mCurrentFocus\". Response:[" + text + "]");
				if (!text.Contains("com.motorola.lmsaappclient"))
				{
					outer.DeviceOperator.Command("shell am start -n " + AppPackageName + "/" + AppPackageName + ".ui.FlashActivity", -1, outer.Identifer);
				}
			}

			public virtual ConnectErrorCode StartApp()
			{
				WifiDeviceData serviceEndPointInfo = outer.serviceAndLocalForwardEndPoint.ServiceEndPointInfo;
				string text = string.Format("shell am start -n {0}/{1}.ui.FlashActivity --ei cmdPort {2} --ei dataPort {3} --ei extendDataPort {4} --ei backupAndRestorePort {5}", new object[6] { AppPackageName, AppPackageName, serviceEndPointInfo.CmdPort, serviceEndPointInfo.DataPort, serviceEndPointInfo.ExtendDataPort, serviceEndPointInfo.BackupAndRestorePort });
				LogHelper.LogInstance.Debug("Start app cmd:" + text);
				string text2 = outer.DeviceOperator.Command(text, -1, outer.Identifer);
				LogHelper.LogInstance.Debug("Start app response:" + text2);
				string command = string.Format("shell am broadcast -a SocketServiceStart -n {0}/{1}.service.SocketBroadcastReceiver --ei cmdPort {2} --ei dataPort {3} --ei extendDataPort {4} --ei backupAndRestorePort {5}", new object[6] { AppPackageName, AppPackageName, serviceEndPointInfo.CmdPort, serviceEndPointInfo.DataPort, serviceEndPointInfo.ExtendDataPort, serviceEndPointInfo.BackupAndRestorePort });
				string text3 = outer.DeviceOperator.Command(command, -1, outer.Identifer);
				LogHelper.LogInstance.Debug("Broadcast response:" + text3);
				if (text2.ToUpper().Contains("ERROR") || text2.ToUpper().Contains("DOES NOT EXIST"))
				{
					return ConnectErrorCode.LaunchAppFail;
				}
				return ConnectErrorCode.OK;
			}

			public virtual bool CheckPermissionsPerpare()
			{
				FocuseApp();
				return true;
			}

			public virtual int GetCreateMessageTimeout()
			{
				return 300000;
			}

			public virtual void CallAppToFrontstage()
			{
				outer.DeviceOperator.Command("shell am start -n " + AppPackageName + "/" + AppPackageName + ".ui.FlashActivity", -1, outer.Identifer);
			}
		}

		private class MotoTcpConnectHandler : TcpConnectHandler
		{
			public MotoTcpConnectHandler(AdbDeviceEx outer, string appPackageName)
				: base(outer, appPackageName)
			{
				outer.ConnectedAppType = "Moto";
			}

			public override void AppVersionIsMatched()
			{
				Dictionary<string, object> appVersionCode = GetAppVersionCode();
				int num = int.Parse(appVersionCode["code"].ToString());
				LogHelper.LogInstance.Info(string.Format("Device Helper Version Code: {0},  Name: {1}", num, appVersionCode["name"]));
				bool flag = num >= Configurations.AppMinVersionCodeOfMoto;
				base.VersionMatchCode = (flag ? ConnectErrorCode.OK : ConnectErrorCode.ClientUnsupport);
			}

			public override ConnectErrorCode InstallApp()
			{
				return ConnectErrorCode.OK;
			}

			public override ConnectErrorCode UnInstallApp()
			{
				return ConnectErrorCode.OK;
			}

			public override void FocuseApp()
			{
			}

			public override ConnectErrorCode StartApp()
			{
				outer.DeviceOperator.Command("shell am force-stop " + base.AppPackageName, -1, outer.Identifer);
				WifiDeviceData serviceEndPointInfo = outer.serviceAndLocalForwardEndPoint.ServiceEndPointInfo;
				string text = string.Format("shell am start -n {0}/{1}.main.start.LaunchActivity --ei cmdPort {2} --ei dataPort {3} --ei extendDataPort {4} --ei backupAndRestorePort {5}", new object[6] { base.AppPackageName, base.AppPackageName, serviceEndPointInfo.CmdPort, serviceEndPointInfo.DataPort, serviceEndPointInfo.ExtendDataPort, serviceEndPointInfo.BackupAndRestorePort });
				LogHelper.LogInstance.Debug("Start app cmd:" + text);
				string text2 = outer.DeviceOperator.Command(text, -1, outer.Identifer);
				LogHelper.LogInstance.Debug("Start app response:" + text2);
				if (text2.ToUpper().Contains("ERROR") || text2.ToUpper().Contains("DOES NOT EXIST"))
				{
					return ConnectErrorCode.LaunchAppFail;
				}
				return ConnectErrorCode.OK;
			}

			public override bool CheckPermissionsPerpare()
			{
				return true;
			}

			public override int GetCreateMessageTimeout()
			{
				return 300000;
			}

			public override void CallAppToFrontstage()
			{
				outer.DeviceOperator.Command("shell am start -n " + base.AppPackageName + "/" + base.AppPackageName + ".main.start.LaunchActivity", -1, outer.Identifer);
			}
		}

		private class TcpConnectHandlerFactroy
		{
			public const string MA_APP_PACKAGE_NAME = "com.motorola.lmsaappclient";

			public const string MA_APP_PACKAGE_NAME_OLD = "com.lmsa.lmsaappclient";

			public const string MOTO_APP_PACKAGE_NAME = "com.motorola.genie";

			private AdbDeviceEx outer;

			public TcpConnectHandlerFactroy(AdbDeviceEx outer)
			{
				this.outer = outer;
			}

			public TcpConnectHandler ReCheckMotoVersion()
			{
				MotoTcpConnectHandler motoTcpConnectHandler = new MotoTcpConnectHandler(outer, "com.motorola.genie");
				motoTcpConnectHandler.AppVersionIsMatched();
				return motoTcpConnectHandler;
			}

			public TcpConnectHandler Create()
			{
				MotoTcpConnectHandler motoTcpConnectHandler = new MotoTcpConnectHandler(outer, "com.motorola.genie");
				motoTcpConnectHandler.AppVersionIsMatched();
				if (ConnectErrorCode.OK == motoTcpConnectHandler.VersionMatchCode)
				{
					LogHelper.LogInstance.Debug("create moto helper connect handler");
					return motoTcpConnectHandler;
				}
				return CreateMA();
			}

			public TcpConnectHandler CreateMA()
			{
				LogHelper.LogInstance.Debug("create ma connect handler");
				return new TcpConnectHandler(outer, "com.motorola.lmsaappclient");
			}
		}

		private class ServiceAndLocalForwardEndPoint
		{
			private AdbDeviceEx outer;

			public WifiDeviceData ServiceEndPointInfo { get; private set; }

			public WifiDeviceData ForwardEndPointInfo { get; private set; }

			private int GetAvailablePort()
			{
				return NetworkUtility.GetAvailablePort(10000, 20000);
			}

			public ServiceAndLocalForwardEndPoint(AdbDeviceEx outer)
			{
				this.outer = outer;
				ServiceEndPointInfo = new WifiDeviceData
				{
					Ip = IPAddress.Loopback.ToString(),
					CmdPort = GetAvailablePort(),
					DataPort = GetAvailablePort(),
					ExtendDataPort = GetAvailablePort(),
					BackupAndRestorePort = GetAvailablePort()
				};
				ForwardEndPointInfo = new WifiDeviceData
				{
					Ip = IPAddress.Loopback.ToString(),
					CmdPort = GetAvailablePort(),
					DataPort = GetAvailablePort(),
					ExtendDataPort = GetAvailablePort(),
					BackupAndRestorePort = GetAvailablePort()
				};
			}

			public void ForwardPort()
			{
				LogHelper.LogInstance.Info(string.Format("adb device fordward: [id: {0}], [cmdPort: {1}], [dataPort:{2}], [extendDataPort:{3}],[backRestorePort:{4}]", new object[5] { outer.Identifer, ForwardEndPointInfo.CmdPort, ForwardEndPointInfo.DataPort, ForwardEndPointInfo.ExtendDataPort, ForwardEndPointInfo.BackupAndRestorePort }));
				outer.DeviceOperator.ForwardPort(outer.Identifer, ServiceEndPointInfo.CmdPort, ForwardEndPointInfo.CmdPort);
				outer.DeviceOperator.ForwardPort(outer.Identifer, ServiceEndPointInfo.DataPort, ForwardEndPointInfo.DataPort);
				outer.DeviceOperator.ForwardPort(outer.Identifer, ServiceEndPointInfo.ExtendDataPort, ForwardEndPointInfo.ExtendDataPort);
				outer.DeviceOperator.ForwardPort(outer.Identifer, ServiceEndPointInfo.BackupAndRestorePort, ForwardEndPointInfo.BackupAndRestorePort);
			}
		}

		private TcpConnectHandlerFactroy tcpConnectHandlerFactroy;

		private TcpConnectHandler _handler;

		private ServiceAndLocalForwardEndPoint _serviceAndLocalForwardEndPoint;

		private TcpConnectHandler handler
		{
			get
			{
				if (_handler == null)
				{
					_handler = tcpConnectHandlerFactroy.Create();
				}
				return _handler;
			}
			set
			{
				_handler = value;
			}
		}

		private ServiceAndLocalForwardEndPoint serviceAndLocalForwardEndPoint
		{
			get
			{
				lock (this)
				{
					if (_serviceAndLocalForwardEndPoint == null)
					{
						_serviceAndLocalForwardEndPoint = new ServiceAndLocalForwardEndPoint(this);
						_serviceAndLocalForwardEndPoint.ForwardPort();
					}
					return _serviceAndLocalForwardEndPoint;
				}
			}
			set
			{
				_serviceAndLocalForwardEndPoint = value;
			}
		}

		public AdbDeviceEx()
		{
			base.DeviceOperator = new AdbOperator();
			tcpConnectHandlerFactroy = new TcpConnectHandlerFactroy(this);
			Property = new AndroidDeviceProperty();
		}

		public override bool FocuseApp()
		{
			handler.FocuseApp();
			Thread.Sleep(3000);
			return true;
		}

		public override ConnectErrorCode LoadProperty()
		{
			return handler.LoadProperty();
		}

		protected override WifiDeviceData GetServiceHostEndPointInfo()
		{
			return serviceAndLocalForwardEndPoint.ForwardEndPointInfo;
		}

		protected override ConnectErrorCode CheckMotoAppVersion()
		{
			_serviceAndLocalForwardEndPoint = null;
			handler = tcpConnectHandlerFactroy.ReCheckMotoVersion();
			return handler.VersionMatchCode;
		}

		public override ConnectErrorCode StartMotoApp()
		{
			int num = 0;
			ConnectErrorCode connectErrorCode = ConnectErrorCode.LaunchAppFail;
			do
			{
				connectErrorCode = handler.StartApp();
				if (connectErrorCode == ConnectErrorCode.OK)
				{
					break;
				}
				Thread.Sleep(1000);
			}
			while (++num < 5);
			return connectErrorCode;
		}

		protected override ConnectErrorCode CheckMaAppVersion()
		{
			ConnectErrorCode connectErrorCode = ConnectErrorCode.Unknown;
			handler = tcpConnectHandlerFactroy.CreateMA();
			for (int i = 0; i < 3; i++)
			{
				handler.AppVersionIsMatched();
				connectErrorCode = handler.VersionMatchCode;
				if (connectErrorCode == ConnectErrorCode.OK || connectErrorCode == ConnectErrorCode.ClientUnsupport)
				{
					break;
				}
				Thread.Sleep(1000);
			}
			return connectErrorCode;
		}

		public override ConnectErrorCode StartMaApp()
		{
			ConnectErrorCode connectErrorCode = handler.VersionMatchCode;
			if (connectErrorCode != ConnectErrorCode.OK)
			{
				connectErrorCode = InstallApp();
			}
			if (handler.VersionMatchCode == ConnectErrorCode.AppVersionNotMatched || (handler.VersionMatchCode != ConnectErrorCode.AppVersionNotMatched && connectErrorCode != ConnectErrorCode.ClientUnsupport && connectErrorCode != ConnectErrorCode.ApkInstallFail && connectErrorCode != ConnectErrorCode.ApkInstallFailWithHaveNoSpace))
			{
				connectErrorCode = handler.StartApp();
			}
			return connectErrorCode;
		}

		protected override ConnectErrorCode InstallApp()
		{
			base.AppInstallFinished = false;
			ConnectErrorCode result = handler.InstallApp();
			base.AppInstallFinished = true;
			return result;
		}

		public override void CallAppToFrontstage()
		{
			handler.CallAppToFrontstage();
		}

		protected override ConnectErrorCode UninstallApp()
		{
			return handler.UnInstallApp();
		}

		protected override void UninstallDebugOrOldPackageNameApp()
		{
			handler.UninstallDebugOrOldPackageNameApp();
		}

		protected override bool CheckPermissionsPerpare()
		{
			return handler.CheckPermissionsPerpare();
		}

		public override void Load()
		{
			LoadProperty();
		}

		public void ForceInstallMa()
		{
			TcpConnectHandler tcpConnectHandler = new TcpConnectHandler(new AdbDeviceEx
			{
				Identifer = base.Identifer
			}, "com.motorola.lmsaappclient");
			tcpConnectHandler.AppVersionIsMatched();
			if (tcpConnectHandler.VersionMatchCode != ConnectErrorCode.OK)
			{
				tcpConnectHandler.Install();
				_ = 1;
			}
		}
	}
	public class DeviceConnectionManagerEx : AbstractDeviceConnectionManagerEx, ICompositListener, IPhysicalConnectionListener, INetworkAdapterListener
	{
		private AdbConnectionMonitorEx adbListerner;

		private WifiConnectionMonitorEx wifiListener;

		private FBConnectionMonitorEx fastbootListener;

		private readonly object sync = new object();

		private readonly IList<DeviceEx> conntectedDevices = new List<DeviceEx>();

		private DeviceEx masterDevice;

		private EventHandler<MasterDeviceChangedEventArgs> masterDeviceChanged;

		private MasterDeviceChangedEventArgs masterDeviceChangedEventArgs = new MasterDeviceChangedEventArgs(null, null);

		private bool isRunning;

		private List<string> connectedData;

		private bool isWriteData;

		private bool IsFastbootMonitorRunning { get; set; }

		public static bool IsLogOut { get; set; }

		public override List<Tuple<string, string>> WirelessWaitForConnectEndPoints
		{
			get
			{
				if (wifiListener == null)
				{
					return null;
				}
				return wifiListener.WaitForConnectEndPoints;
			}
		}

		public override IList<DeviceEx> ConntectedDevices
		{
			get
			{
				lock (sync)
				{
					return conntectedDevices.ToList();
				}
			}
		}

		public override DeviceEx MasterDevice
		{
			get
			{
				return masterDevice;
			}
			protected set
			{
				if (masterDevice != value)
				{
					DeviceEx deviceEx = masterDevice;
					if (deviceEx != null)
					{
						deviceEx.DeviceType = DeviceType.Slave;
					}
					masterDevice = value;
					if (masterDevice != null)
					{
						masterDevice.DeviceType = DeviceType.Master;
					}
					if (deviceEx != null && masterDevice != null)
					{
						LogHelper.LogInstance.Info("======chang master device:  " + deviceEx.Identifer + "#" + deviceEx.ConnectTime + ", " + deviceEx.Property?.ModelName + " --> " + masterDevice.Identifer + "#" + masterDevice.ConnectTime + ", " + masterDevice.Property?.ModelName + "======");
					}
					else if (deviceEx != null)
					{
						LogHelper.LogInstance.Info("======chang master device:  " + deviceEx.Identifer + "#" + deviceEx.ConnectTime + ", " + deviceEx.Property?.ModelName + " --> NULL======");
					}
					else if (masterDevice != null)
					{
						LogHelper.LogInstance.Info("======chang master device:  NULL --> " + masterDevice.Identifer + "#" + masterDevice.ConnectTime + ", " + masterDevice.Property?.ModelName + "======");
					}
					else
					{
						LogHelper.LogInstance.Info("======chang master device: NULL --> NULL======");
					}
					FireMasterDeviceChangedEvent(this, new MasterDeviceChangedEventArgs(deviceEx, masterDevice));
				}
			}
		}

		public override Func<Task, string, bool> ValidateCodeFunc { get; set; }

		public override event WirelessMornitoringAddressChangedHandler WifiMonitoringEndPointChanged;

		private event EventHandler<DeviceEx> connecte;

		public override event EventHandler<DeviceEx> Connecte
		{
			add
			{
				connecte += value;
				foreach (DeviceEx conntectedDevice in ConntectedDevices)
				{
					Delegate[] invocationList = this.connecte.GetInvocationList();
					for (int i = 0; i < invocationList.Length; i++)
					{
						((EventHandler<DeviceEx>)invocationList[i]).BeginInvoke(this, conntectedDevice, null, null);
					}
				}
			}
			remove
			{
				connecte -= value;
			}
		}

		private event EventHandler<DeviceEx> disconnecte;

		public override event EventHandler<DeviceEx> DisConnecte
		{
			add
			{
				disconnecte += value;
			}
			remove
			{
				disconnecte -= value;
			}
		}

		public override event EventHandler<MasterDeviceChangedEventArgs> MasterDeviceChanged
		{
			add
			{
				masterDeviceChanged = (EventHandler<MasterDeviceChangedEventArgs>)Delegate.Combine(masterDeviceChanged, value);
				value.BeginInvoke(this, masterDeviceChangedEventArgs, null, null);
			}
			remove
			{
				masterDeviceChanged = (EventHandler<MasterDeviceChangedEventArgs>)Delegate.Remove(masterDeviceChanged, value);
			}
		}

		public DeviceConnectionManagerEx()
		{
			Port5037Check();
			adbListerner = new AdbConnectionMonitorEx(this, "adb.exe");
			wifiListener = new WifiConnectionMonitorEx(this);
			fastbootListener = new FBConnectionMonitorEx(this);
		}

		public void OnConnect(DeviceEx device, DevicePhysicalStateEx phyState)
		{
			lock (sync)
			{
				device.ConnectTime = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss.ffffff");
				LogHelper.LogInstance.Info(string.Format("======device connected: {0}#{1}, connect type: {2}, app type: {3}, work type: {4}======", new object[5] { device.Identifer, device.ConnectTime, device.ConnectType, device.ConnectedAppType, device.WorkType }));
				device.PhysicalStatus = phyState;
				if (!conntectedDevices.Any((DeviceEx p) => p.Identifer == device.Identifer))
				{
					conntectedDevices.Add(device);
				}
				if (isWriteData)
				{
					connectedData.Add(string.Format("======device connected: {0}#{1}, connect type: {2}, app type: {3}, work type: {4}======", new object[5] { device.Identifer, device.ConnectTime, device.ConnectType, device.ConnectedAppType, device.WorkType }));
				}
				if (MasterDevice == null && device.ConnectType != ConnectType.Fastboot)
				{
					MasterDevice = device;
				}
				if (this.connecte != null)
				{
					Delegate[] invocationList = this.connecte.GetInvocationList();
					for (int num = 0; num < invocationList.Length; num++)
					{
						((EventHandler<DeviceEx>)invocationList[num]).BeginInvoke(this, device, null, null);
					}
				}
			}
		}

		public void OnDisconnect(DeviceEx device)
		{
			lock (sync)
			{
				LogHelper.LogInstance.Info(string.Format("======device removed: {0}#{1}, modelname: {2}, connect type: {3}, app type: {4}, work type: {5}, remove time: {6:yyyy-MM-ddTHH:mm:ss.ffffff}======", new object[7]
				{
					device.Identifer,
					device.ConnectTime,
					device.Property?.ModelName,
					device.ConnectType,
					device.ConnectedAppType,
					device.WorkType,
					DateTime.Now
				}));
				int num = conntectedDevices.IndexOf(device);
				LogHelper.LogInstance.Info($"OnDisconnect======idx:[{num}], current DevicesCount:{conntectedDevices.Count((DeviceEx p) => p.Identifer == device.Identifer)}");
				if (num >= 0)
				{
					conntectedDevices.RemoveAt(num);
					foreach (DeviceEx item in conntectedDevices.Where((DeviceEx p) => p.Identifer == device.Identifer).ToList())
					{
						conntectedDevices.Remove(item);
					}
					if (isWriteData)
					{
						connectedData.Add(string.Format("======device removed: {0}#{1}, modelname: {2}, connect type: {3}, app type: {4}, work type: {5}, remove time: {6:yyyy-MM-ddTHH:mm:ss.ffffff}======", new object[7]
						{
							device.Identifer,
							device.ConnectTime,
							device.Property?.ModelName,
							device.ConnectType,
							device.ConnectedAppType,
							device.WorkType,
							DateTime.Now
						}));
					}
				}
				device.PhysicalStatus = DevicePhysicalStateEx.Offline;
				if (MasterDevice == null || MasterDevice.Identifer == device.Identifer)
				{
					MasterDevice = conntectedDevices.FirstOrDefault((DeviceEx m) => m.ConnectType != ConnectType.Fastboot && m.PhysicalStatus != DevicePhysicalStateEx.Offline);
				}
				if (this.disconnecte != null)
				{
					Delegate[] invocationList = this.disconnecte.GetInvocationList();
					for (int num2 = 0; num2 < invocationList.Length; num2++)
					{
						((EventHandler<DeviceEx>)invocationList[num2]).BeginInvoke(this, device, null, null);
					}
				}
			}
		}

		public void OnWifiMonitoringEndPointChanged(List<Tuple<string, string>> endpoints)
		{
			WifiMonitoringEndPointChanged?.Invoke(endpoints);
		}

		public override void Start()
		{
			if (!isRunning)
			{
				IsLogOut = false;
				conntectedDevices.Clear();
				Task.Run(delegate
				{
					adbListerner.StartMonitoring();
				});
				Task.Run(delegate
				{
					wifiListener.StartMonitoring();
				});
				Task.Run(delegate
				{
					fastbootListener.StartMonitoring();
				});
				IsFastbootMonitorRunning = true;
				isRunning = true;
			}
		}

		public override void Stop()
		{
			adbListerner.StopMonitoring();
			wifiListener.StopMonitoring();
			fastbootListener.StopMonitoring();
			IsFastbootMonitorRunning = false;
			isRunning = false;
		}

		private bool Port5037Check()
		{
			foreach (string item in ProcessRunner.ProcessList("netstat.exe", "-nao", 3000))
			{
				if (!Regex.IsMatch(item, ".+?:5037\\s+.+"))
				{
					continue;
				}
				int num = int.Parse(item.Split(new char[1] { ' ' }, StringSplitOptions.RemoveEmptyEntries)[^1]);
				if (num > 0)
				{
					try
					{
						Process.GetProcessById(num).Kill();
						return true;
					}
					catch (Exception exception)
					{
						LogHelper.LogInstance.Error("kill port 5037 failed", exception);
					}
				}
			}
			return false;
		}

		public override void Dispose()
		{
			IsLogOut = true;
			IsFastbootMonitorRunning = false;
			adbListerner.StopMonitoring();
			wifiListener.StopMonitoring();
			fastbootListener.StopMonitoring();
			isRunning = false;
			this.connecte = null;
			this.disconnecte = null;
			masterDeviceChanged = null;
			ValidateCodeFunc = null;
			if (conntectedDevices.Count > 0)
			{
				foreach (DeviceEx conntectedDevice in conntectedDevices)
				{
					(conntectedDevice as TcpAndroidDevice)?.MessageManager?.Dispose();
					conntectedDevice.UnloadEvent();
				}
				conntectedDevices.Clear();
			}
			MasterDevice = null;
		}

		public override void SwitchDevice(string id)
		{
			DeviceEx deviceEx = ConntectedDevices.FirstOrDefault((DeviceEx m) => m.Identifer == id);
			MasterDevice = deviceEx;
		}

		public override void SwitchAfterDevice(string id)
		{
			DeviceEx deviceEx = ConntectedDevices.FirstOrDefault((DeviceEx m) => m.Identifer != id);
			MasterDevice = deviceEx;
		}

		private void FireMasterDeviceChangedEvent(object sender, MasterDeviceChangedEventArgs e)
		{
			masterDeviceChangedEventArgs = e;
			EventHandler<MasterDeviceChangedEventArgs> eventHandler = masterDeviceChanged;
			if (eventHandler != null)
			{
				Delegate[] invocationList = eventHandler.GetInvocationList();
				for (int i = 0; i < invocationList.Length; i++)
				{
					((EventHandler<MasterDeviceChangedEventArgs>)invocationList[i]).BeginInvoke(this, e, null, null);
				}
			}
		}

		public override bool IsMasterConnectedByHelperForAndroid11()
		{
			if (masterDevice == null || !(masterDevice is TcpAndroidDevice))
			{
				return false;
			}
			TcpAndroidDevice tcpAndroidDevice = masterDevice as TcpAndroidDevice;
			if (tcpAndroidDevice.ConnectedAppType == "Moto" && tcpAndroidDevice.Property.AndroidVersion.Trim().StartsWith("11"))
			{
				return true;
			}
			return false;
		}

		public override void StartMonitorFastbootConnect()
		{
			connectedData = new List<string>();
			isWriteData = true;
		}

		public override List<string> StopMonitorFastbootConnect()
		{
			isWriteData = false;
			return connectedData;
		}

		public override void StopFastbootMonitor()
		{
			fastbootListener.StopMonitoring();
			IsFastbootMonitorRunning = false;
		}

		public override bool StartFastbootMonitor()
		{
			bool result = !IsFastbootMonitorRunning;
			if (!IsFastbootMonitorRunning)
			{
				IsFastbootMonitorRunning = true;
				Task.Run(delegate
				{
					fastbootListener.StartMonitoring(isClear: false);
				});
			}
			return result;
		}
	}
	public class FileTransferManager : IFileTransferManager, IDisposable
	{
		private class TransferMappingModel : IDisposable
		{
			public string InstanceID { get; private set; }

			public FileTransferWrapper Transfer { get; set; }

			public AutoResetEvent CreatedResetEvent { get; set; }

			public TransferMappingModel()
			{
				InstanceID = Guid.NewGuid().ToString();
			}

			public void Dispose()
			{
			}
		}

		private IPEndPointInfo _remoteEndPoint;

		protected RsaSocketDataSecurityFactory _RsaSocketEncryptHelper;

		private volatile bool mIsDispose;

		private readonly object _mappingLock;

		private readonly Dictionary<long, TransferMappingModel> _mapping;

		public string InstanceID { get; private set; }

		public bool IsDispose
		{
			get
			{
				return mIsDispose;
			}
			set
			{
				mIsDispose = value;
			}
		}

		public FileTransferManager(IPEndPointInfo remoteEndPoint, RsaSocketDataSecurityFactory encryptHelper)
		{
			InstanceID = Guid.NewGuid().ToString();
			_mappingLock = new object();
			_mapping = new Dictionary<long, TransferMappingModel>();
			_remoteEndPoint = remoteEndPoint;
			_RsaSocketEncryptHelper = encryptHelper;
		}

		public IPEndPointInfo GetIPEndPointInfo()
		{
			return _remoteEndPoint;
		}

		public FileTransferWrapper CreateFileTransfer(long messageSequence)
		{
			LogHelper.LogInstance.Debug(string.Format(InstanceID + ":public FileTransferWrapper CreateFileTransfer(long messageSequence) entered,[sequence:{0}],[instancedId:{1},disposed:{2}]", messageSequence, InstanceID, IsDispose));
			if (IsDispose)
			{
				return null;
			}
			using AutoResetEvent autoResetEvent = new AutoResetEvent(initialState: false);
			TransferMappingModel transferMappingModel = new TransferMappingModel();
			transferMappingModel.CreatedResetEvent = autoResetEvent;
			lock (_mappingLock)
			{
				_mapping[messageSequence] = transferMappingModel;
			}
			BeginCreateFreeTransferAndMapping();
			try
			{
				if (autoResetEvent.WaitOne(120000))
				{
					if (IsDispose)
					{
						return null;
					}
					TransferMappingModel transferMappingModel2 = null;
					lock (_mappingLock)
					{
						transferMappingModel2 = _mapping[messageSequence];
					}
					FileTransferWrapper transfer = transferMappingModel2.Transfer;
					transferMappingModel2.Dispose();
					return transfer;
				}
				LogHelper.LogInstance.Debug(string.Format("Create file transfer time out, mapping{2},Instance:{0},sequence:{1}", InstanceID, messageSequence, transferMappingModel.InstanceID));
				return null;
			}
			catch
			{
				return null;
			}
		}

		private void BeginCreateFreeTransferAndMapping()
		{
			Task.Factory.StartNew(delegate
			{
				long secquence = -1L;
				try
				{
					FileTransferWrapper fileTransferWrapper = new FileTransferWrapper(_remoteEndPoint, _RsaSocketEncryptHelper);
					SocketWrapper channel = fileTransferWrapper.Channel;
					MessageReaderAndWriter messageReaderAndWriter = new MessageReaderAndWriter(new MessageWriter(channel, appendSpliterString: false, _RsaSocketEncryptHelper), new MessageReader(channel, new PackageSpliter(Constants.Encoding.GetBytes("\\r\\n"), removePackageSpliter: true), _RsaSocketEncryptHelper));
					LogHelper.LogInstance.Debug($"Connect to {_remoteEndPoint.IPAddress}:{_remoteEndPoint.Point}, and send transfer channel ready!");
					List<PropItem> receiveData = null;
					if (messageReaderAndWriter.Receive("fileTransferChannelIsReady", out secquence, out receiveData, 15000))
					{
						LogHelper.LogInstance.Debug($"File transfer channel is ready  received,Instance:{InstanceID},sequence:{secquence}");
						TransferMappingModel transferMappingModel = null;
						try
						{
							lock (_mappingLock)
							{
								transferMappingModel = _mapping[secquence];
							}
							transferMappingModel.Transfer = fileTransferWrapper;
						}
						finally
						{
							LogHelper.LogInstance.Debug($"Begin send file transfer channel is ready response,Instance:{InstanceID},sequence:{secquence}");
							messageReaderAndWriter.Send("fileTransferChannelIsReadyResponse", new List<string>(), secquence);
						}
						try
						{
							LogHelper.LogInstance.Debug(string.Format("Begin release mapping{2},Instance:{0},sequence:{1}", InstanceID, secquence, transferMappingModel.InstanceID));
							transferMappingModel.CreatedResetEvent.Set();
							return;
						}
						catch (Exception ex)
						{
							LogHelper.LogInstance.Error(string.Format(InstanceID + ":Set mappint thread notify [sequence:{0},Disposed:{1}] throw exception:{2}", secquence, IsDispose, ex.ToString()));
							return;
						}
					}
					LogHelper.LogInstance.Debug("send transfer channel ready failed!");
				}
				catch (Exception ex2)
				{
					LogHelper.LogInstance.Error(string.Format(InstanceID + ":Create new file transfer[sequence:{0},Disposed:{1}] throw exception:{2}", secquence, IsDispose, ex2.ToString()));
				}
			});
		}

		public void Dispose()
		{
			if (IsDispose)
			{
				return;
			}
			List<TransferMappingModel> list = null;
			lock (_mappingLock)
			{
				list = _mapping.Values.ToList();
			}
			foreach (TransferMappingModel item in list)
			{
				item.Transfer?.Dispose();
				try
				{
					item.CreatedResetEvent.Set();
				}
				catch (Exception)
				{
				}
			}
		}
	}
	public interface ICompositListener : IPhysicalConnectionListener, INetworkAdapterListener
	{
	}
	public interface IPhysicalConnectionListener
	{
		void OnConnect(DeviceEx device, DevicePhysicalStateEx phyState);

		void OnDisconnect(DeviceEx device);
	}
	public interface INetworkAdapterListener
	{
		void OnWifiMonitoringEndPointChanged(List<Tuple<string, string>> endpoints);
	}
	public class MessageManager : IMessageManager, IDisposable
	{
		private IPEndPointInfo _remoteEndpoint;

		private SocketWrapper _heartbeatChannel;

		private bool _isDisposed;

		private ConcurrentBag<MessageReaderAndWriter> messageReaderAndWriterList = new ConcurrentBag<MessageReaderAndWriter>();

		public RsaSocketDataSecurityFactory RsaSocketEncryptHelper { get; private set; }

		public event EventHandler<HeartbeatStoppedEventArgs> HeartbeatStopped;

		public SocketWrapper GetHeartbeatChannel()
		{
			return _heartbeatChannel;
		}

		public MessageManager(IPEndPointInfo remoteEndPoint, RsaSocketDataSecurityFactory encryptHelper)
		{
			_remoteEndpoint = remoteEndPoint;
			RsaSocketEncryptHelper = encryptHelper;
		}

		public void StartHeartbeat(long sendHeartbeatInterval = 1000L, long receiveHeartbeatTimeout = 10000L)
		{
			HeartbeatSocketWrapper heartbeatSocketWrapper = new HeartbeatSocketWrapper(_remoteEndpoint, noDelay: true, RsaSocketEncryptHelper);
			heartbeatSocketWrapper.SetSendHeartbeatInterval(sendHeartbeatInterval);
			MessageReaderAndWriter messageReaderAndWriter = new MessageReaderAndWriter(new MessageWriter(heartbeatSocketWrapper, appendSpliterString: false, RsaSocketEncryptHelper), new MessageReader(heartbeatSocketWrapper, new PackageSpliter(Constants.Encoding.GetBytes("\\r\\n"), removePackageSpliter: true), RsaSocketEncryptHelper));
			List<PropItem> receiveData = null;
			messageReaderAndWriter.SendAndReceiveSync<object, PropItem>("startHeartbeat", "startHeartbeatResponse", null, Sequence.SingleInstance.New(), out receiveData);
			heartbeatSocketWrapper.StartSendHeartbeat();
			heartbeatSocketWrapper.StartReceiveHeartbeat();
			heartbeatSocketWrapper.HeartbeatStopped += delegate(object s, HeartbeatStoppedEventArgs e)
			{
				FireHeartbeatStoppedEvent(s, e);
			};
			_heartbeatChannel = heartbeatSocketWrapper;
		}

		private void FireHeartbeatStoppedEvent(object sender, HeartbeatStoppedEventArgs e)
		{
			if (this.HeartbeatStopped != null)
			{
				Delegate[] invocationList = this.HeartbeatStopped.GetInvocationList();
				for (int i = 0; i < invocationList.Length; i++)
				{
					((EventHandler<HeartbeatStoppedEventArgs>)invocationList[i]).BeginInvoke(sender, e, null, null);
				}
			}
		}

		public MessageReaderAndWriter CreateMessageReaderAndWriter(int timeout = 0)
		{
			if (_isDisposed)
			{
				return null;
			}
			SocketWrapper socketWrapper = null;
			try
			{
				socketWrapper = new SocketWrapper(_remoteEndpoint, noDelay: true, isHeartbeatChannel: false, timeout);
				MessageReaderAndWriter messageReaderAndWriter = new MessageReaderAndWriter(new MessageWriter(socketWrapper, appendSpliterString: false, RsaSocketEncryptHelper), new MessageReader(socketWrapper, new PackageSpliter(Constants.Encoding.GetBytes("\\r\\n"), removePackageSpliter: true), RsaSocketEncryptHelper));
				CacheMessageReaderAndWriter(messageReaderAndWriter);
				return messageReaderAndWriter;
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Warn("Create message changel failed:" + ex);
				if (socketWrapper != null)
				{
					try
					{
						socketWrapper.Dispose();
						socketWrapper = null;
					}
					catch
					{
					}
				}
				return null;
			}
		}

		public void Dispose()
		{
			if (_isDisposed)
			{
				return;
			}
			try
			{
				_heartbeatChannel?.Dispose();
				ReleaseMessageReaderAndWriter();
			}
			catch
			{
			}
		}

		private void CacheMessageReaderAndWriter(MessageReaderAndWriter messageReaderAndWriter)
		{
			messageReaderAndWriterList.Add(messageReaderAndWriter);
		}

		private void ReleaseMessageReaderAndWriter()
		{
			MessageReaderAndWriter result = null;
			while (!messageReaderAndWriterList.IsEmpty)
			{
				if (messageReaderAndWriterList.TryTake(out result))
				{
					((IDisposable)result)?.Dispose();
				}
			}
		}
	}
	public abstract class TcpAndroidDevice : DeviceEx
	{
		public int RetryConnect = 1;

		private TcpConnectStepChangedEventArgs currentTcpConnectStepChangedEventArgs;

		private PermissionsCheckConfirmEventArgs currentPermissionsCheckConfirmEventArgs;

		private AutoResetEvent autoResetEvent;

		protected volatile bool isconnect;

		public IPEndPoint ExtendDataFileServiceEndPoint { get; set; }

		public IPEndPoint BackupAndRestorePortServiceEndPoint { get; set; }

		public IMessageManager MessageManager { get; set; }

		public IFileTransferManager FileTransferManager { get; set; }

		public override IAndroidDevice Property { get; set; }

		public bool? IsReady { get; protected set; }

		public RsaSocketDataSecurityFactory RsaSocketEncryptHelper { get; private set; }

		private event EventHandler<TcpConnectStepChangedEventArgs> tcpConnectStepChanged;

		public event EventHandler<TcpConnectStepChangedEventArgs> TcpConnectStepChanged
		{
			add
			{
				tcpConnectStepChanged += value;
				if (currentTcpConnectStepChangedEventArgs != null)
				{
					value(this, currentTcpConnectStepChangedEventArgs);
				}
			}
			remove
			{
				tcpConnectStepChanged -= value;
			}
		}

		private event EventHandler<PermissionsCheckConfirmEventArgs> permissionsCheckConfirmEvent;

		public event EventHandler<PermissionsCheckConfirmEventArgs> PermissionsCheckConfirmEvent
		{
			add
			{
				permissionsCheckConfirmEvent += value;
				value(this, currentPermissionsCheckConfirmEventArgs);
			}
			remove
			{
				permissionsCheckConfirmEvent -= value;
			}
		}

		protected void FireTcpConnectStepChangedEvent(object sender, TcpConnectStepChangedEventArgs e)
		{
			lock (this)
			{
				EventHandler<TcpConnectStepChangedEventArgs> eventHandler = this.tcpConnectStepChanged;
				currentTcpConnectStepChangedEventArgs = e;
				if (eventHandler != null)
				{
					LogHelper.LogInstance.Info(string.Format("====>>Device {0} connecting info: step={1}, result={2}, code={3}", new object[4]
					{
						(sender as TcpAndroidDevice).Identifer,
						e.Step,
						e.Result,
						e.ErrorCode
					}));
					Delegate[] invocationList = eventHandler.GetInvocationList();
					for (int i = 0; i < invocationList.Length; i++)
					{
						((EventHandler<TcpConnectStepChangedEventArgs>)invocationList[i]).BeginInvoke(this, e, null, null);
					}
				}
			}
		}

		protected void FirePermissionsCheckConfirmEvent(object sender, PermissionsCheckConfirmEventArgs e)
		{
			currentPermissionsCheckConfirmEventArgs = e;
			if (this.permissionsCheckConfirmEvent != null)
			{
				Delegate[] array = this.permissionsCheckConfirmEvent?.GetInvocationList();
				for (int i = 0; i < array.Length; i++)
				{
					((EventHandler<PermissionsCheckConfirmEventArgs>)array[i]).BeginInvoke(this, e, null, null);
				}
			}
		}

		protected abstract bool CheckPermissionsPerpare();

		public bool CheckPermissions(List<string> permissionModules)
		{
			if (!CheckPermissionsPerpare() || MessageManager == null)
			{
				return false;
			}
			using MessageReaderAndWriter messageReaderAndWriter = MessageManager.CreateMessageReaderAndWriter();
			if (messageReaderAndWriter == null)
			{
				return false;
			}
			List<PropItem> receiveData = null;
			if (!messageReaderAndWriter.SendAndReceiveSync("checkPermissions", permissionModules, Sequence.SingleInstance.New(), out receiveData))
			{
				return false;
			}
			return receiveData?.Exists((PropItem m) => "true".Equals(m.Value)) ?? false;
		}

		protected override void OnPhysicalStatusChanged(DevicePhysicalStateEx prev, DevicePhysicalStateEx current)
		{
			if (current == DevicePhysicalStateEx.Online)
			{
				startConnect();
			}
			base.OnPhysicalStatusChanged(prev, current);
		}

		protected override void OnSoftStatusChanged(DeviceSoftStateEx prev, DeviceSoftStateEx current)
		{
			if (current == DeviceSoftStateEx.Offline)
			{
				MessageManager?.Dispose();
			}
			base.OnSoftStatusChanged(prev, current);
		}

		~TcpAndroidDevice()
		{
			autoResetEvent?.Dispose();
		}

		private void startConnect()
		{
			if (base.PhysicalStatus != DevicePhysicalStateEx.Online)
			{
				return;
			}
			Thread.Sleep(new Random().Next(100));
			if (isconnect)
			{
				return;
			}
			isconnect = true;
			Task.Run(delegate
			{
				try
				{
					bool isBackAndRestoreFrm = DevicemgtContantClass.IsBackAndRestoreFrm;
					do
					{
						if (base.ConnectType == ConnectType.Wifi)
						{
							RetryConnect = -1;
						}
						autoResetEvent = new AutoResetEvent(initialState: false);
						if (DevicemgtContantClass.IsOtherToBackAndRestoreAndAutoConnection && DevicemgtContantClass.IsBackAndRestoreFrm)
						{
							Thread.Sleep(new Random().Next(300));
							isBackAndRestoreFrm = DevicemgtContantClass.IsBackAndRestoreFrm;
						}
						else
						{
							if (base.PhysicalStatus == DevicePhysicalStateEx.Online && base.SoftStatus == DeviceSoftStateEx.Online)
							{
								break;
							}
							if (base.PhysicalStatus == DevicePhysicalStateEx.Online && base.SoftStatus == DeviceSoftStateEx.Offline)
							{
								Thread.Sleep(300);
								HostProxy.deviceManager.SetDeviceConnectIconStatus(0);
							}
							base.SoftStatus = DeviceSoftStateEx.Connecting;
							ConnectErrorCode connectErrorCode = TcpConnectByStepV2(isBackAndRestoreFrm);
							autoResetEvent.WaitOne();
							RetryConnect--;
							if (base.ConnectedAppType == "Ma" || base.SoftStatus == DeviceSoftStateEx.Online)
							{
								RetryConnect = -1;
								if (connectErrorCode == ConnectErrorCode.LaunchAppFail || connectErrorCode == ConnectErrorCode.TcpConnectFailWithTimeout)
								{
									base.SoftStatus = DeviceSoftStateEx.Offline;
									HostProxy.deviceManager.SwitchAfterDevice(base.Identifer);
								}
								HostProxy.deviceManager.SetDeviceConnectIconStatus(99);
							}
							if (RetryConnect < 0)
							{
								break;
							}
							base.RetryConnectCallback?.Invoke();
						}
					}
					while (RetryConnect >= 0);
				}
				finally
				{
					isconnect = false;
					HostProxy.deviceManager.RaiseConnectChange(status: true);
				}
			});
		}

		protected abstract ConnectErrorCode CheckMotoAppVersion();

		public abstract ConnectErrorCode StartMotoApp();

		protected abstract ConnectErrorCode CheckMaAppVersion();

		public abstract ConnectErrorCode StartMaApp();

		public abstract void CallAppToFrontstage();

		protected abstract ConnectErrorCode InstallApp();

		protected abstract ConnectErrorCode UninstallApp();

		protected abstract void UninstallDebugOrOldPackageNameApp();

		protected abstract WifiDeviceData GetServiceHostEndPointInfo();

		protected virtual MessageManager CreateMessageManager(IPEndPointInfo endPointInfo, out ConnectErrorCode errorCode)
		{
			int result = 0;
			bool running = true;
			bool isSecutiry = false;
			bool flag = false;
			CipherMode cipherMode = CipherMode.CBC;
			if (base.ConnectedAppType == "Moto")
			{
				if (int.TryParse(Configurations.MotoHelperSecurityVersion, out result))
				{
					isSecutiry = base.AppVersion >= result;
				}
				if (int.TryParse(Configurations.MotoApkRandomKeyVersion, out result))
				{
					flag = base.AppVersion >= result;
				}
				if (base.AppVersion < 1300400)
				{
					cipherMode = CipherMode.ECB;
				}
			}
			else
			{
				isSecutiry = true;
				flag = true;
			}
			RsaSocketEncryptHelper = new RsaSocketDataSecurityFactory(isSecutiry, flag, cipherMode);
			MessageManager msgManager = new MessageManager(endPointInfo, RsaSocketEncryptHelper);
			ConnectErrorCode status = ConnectErrorCode.Unknown;
			Task task = Task.Run(delegate
			{
				while (base.PhysicalStatus == DevicePhysicalStateEx.Online)
				{
					MessageReaderAndWriter messageReaderAndWriter = null;
					try
					{
						messageReaderAndWriter = msgManager.CreateMessageReaderAndWriter(25000);
						Thread.Sleep(5000);
						if (messageReaderAndWriter != null)
						{
							List<PropItem> receiveData = null;
							if (messageReaderAndWriter.SendAndReceiveSync<object, PropItem>("ping", "pingResponse", null, Sequence.SingleInstance.New(), out receiveData) && receiveData != null)
							{
								status = ((receiveData.FirstOrDefault((PropItem m) => "deny".Equals(m.Value)) == null) ? ConnectErrorCode.OK : ConnectErrorCode.TcpConnectFailWithAppNotAllowed);
								if (status == ConnectErrorCode.OK)
								{
									break;
								}
							}
						}
					}
					catch (Exception ex)
					{
						LogHelper.LogInstance.Warn("Connect and ping failed:" + ex);
					}
					finally
					{
						messageReaderAndWriter?.Dispose();
					}
					Thread.Sleep(1000);
					if (!running)
					{
						break;
					}
				}
			});
			bool flag2 = true;
			flag2 = ((!(base.ValidateCodeFunc != null && flag)) ? task.Wait(50000) : base.ValidateCodeFunc(task, base.Identifer));
			errorCode = (flag2 ? status : ConnectErrorCode.TcpConnectFailWithTimeout);
			if (!flag2)
			{
				running = false;
			}
			if (errorCode != ConnectErrorCode.OK && msgManager != null)
			{
				msgManager.Dispose();
			}
			return msgManager;
		}

		private ConnectErrorCode TcpConnectByStepV2(bool locIsBackAndRestoreFrm = false)
		{
			ConnectErrorCode errorCode = ConnectErrorCode.Unknown;
			int currentPercent = 0;
			UninstallDebugOrOldPackageNameApp();
			if (!locIsBackAndRestoreFrm)
			{
				FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("AppVersionIsMatched", 1, ConnectStepStatus.Starting, errorCode, ref currentPercent));
				int num = 0;
				do
				{
					errorCode = CheckMotoAppVersion();
					if (errorCode == ConnectErrorCode.OK || errorCode == ConnectErrorCode.ClientUnsupport)
					{
						break;
					}
					Thread.Sleep(1000);
				}
				while (++num < 3);
				if (ConnectErrorCode.OK == errorCode)
				{
					FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("AppVersionIsMatched", 1, ConnectStepStatus.Success, errorCode, ref currentPercent));
					FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("TcpConnect", 4, ConnectStepStatus.Starting, errorCode, ref currentPercent));
					errorCode = StartMotoApp();
				}
			}
			if (errorCode != ConnectErrorCode.OK)
			{
				FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("AppVersionIsMatched", 2, ConnectStepStatus.Starting, errorCode, ref currentPercent));
				LogHelper.LogInstance.Warn("Startup moto helper error! Switch to MA connect handler!");
				if (base.PhysicalStatus != DevicePhysicalStateEx.Online)
				{
					HostProxy.deviceManager.RaiseConnectChange(status: true);
					HostProxy.deviceManager.SetDeviceConnectIconStatus(-1);
					return errorCode;
				}
				errorCode = CheckMaAppVersion();
				FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("AppVersionIsMatched", 2, ConnectStepStatus.Success, errorCode, ref currentPercent));
				FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("InstallApp", 3, ConnectStepStatus.Starting, errorCode, ref currentPercent));
				errorCode = StartMaApp();
				if (errorCode == ConnectErrorCode.LaunchAppFail)
				{
					autoResetEvent.Set();
					return errorCode;
				}
				FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("InstallApp", 3, ConnectStepStatus.Success, errorCode, ref currentPercent));
			}
			ConnectErrorCode connectErrorCode = ConnectErrorCode.Unknown;
			if (ConnectErrorCode.OK == errorCode)
			{
				FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("TcpConnect", 4, ConnectStepStatus.Starting, errorCode, ref currentPercent));
				connectErrorCode = PrivateConnect();
				int _checkPermissionsFailedType = 0;
				Func<bool> checkPermissionsAction = delegate
				{
					bool flag = CheckPermissions(new List<string> { "ACCESS_ALL_FILES" });
					if (flag)
					{
						flag = CheckPermissions(new List<string> { "Backup" });
						if (!flag)
						{
							_checkPermissionsFailedType = 2;
						}
					}
					else
					{
						_checkPermissionsFailedType = 1;
					}
					return flag;
				};
				Action<bool> havPermissionsFlowingStepActions = delegate(bool havePermissions)
				{
					FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("TcpConnect", 4, ConnectStepStatus.Success, errorCode, ref currentPercent));
					FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("LoadDeviceProperty", 5, ConnectStepStatus.Starting, errorCode, ref currentPercent));
					if (havePermissions && ConnectErrorCode.OK == (errorCode = LoadProperty()))
					{
						FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("LoadDeviceProperty", 5, ConnectStepStatus.Success, errorCode, ref currentPercent));
						base.SoftStatus = DeviceSoftStateEx.Online;
						autoResetEvent.Set();
					}
					else
					{
						currentPercent = 100;
						FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("LoadDeviceProperty", 5, ConnectStepStatus.Fail, errorCode, ref currentPercent));
						base.SoftStatus = DeviceSoftStateEx.Offline;
						autoResetEvent.Set();
					}
				};
				if (connectErrorCode != ConnectErrorCode.OK || LoadProperty() == ConnectErrorCode.Unknown)
				{
					LogHelper.LogInstance.Debug("LoadProperty false, device will disconnect.");
					currentPercent = 100;
					FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("TcpConnect", 4, ConnectStepStatus.Fail, errorCode, ref currentPercent));
					base.SoftStatus = DeviceSoftStateEx.Offline;
					autoResetEvent.Set();
					return connectErrorCode;
				}
				if (checkPermissionsAction())
				{
					LogHelper.LogInstance.Debug($"checkPermissionsAction result is TRUE. _checkPermissionsFailedType[{_checkPermissionsFailedType}]");
					havPermissionsFlowingStepActions(obj: true);
				}
				else
				{
					LogHelper.LogInstance.Debug($"checkPermissionsAction result is FALSE. _checkPermissionsFailedType[{_checkPermissionsFailedType}]");
					FirePermissionsCheckConfirmEvent(this, new PermissionsCheckConfirmEventArgs(delegate(bool isContinue)
					{
						if (isContinue)
						{
							if (checkPermissionsAction())
							{
								havPermissionsFlowingStepActions.BeginInvoke(obj: true, null, null);
								return true;
							}
							return false;
						}
						havPermissionsFlowingStepActions.BeginInvoke(obj: false, null, null);
						return false;
					}, _checkPermissionsFailedType));
				}
			}
			else
			{
				currentPercent = 100;
				FireTcpConnectStepChangedEvent(this, CreateTcpConnectStepChangedEventArgs("TcpConnect", 4, ConnectStepStatus.Fail, errorCode, ref currentPercent));
				base.SoftStatus = DeviceSoftStateEx.Offline;
				autoResetEvent.Set();
			}
			return errorCode;
		}

		protected virtual ConnectErrorCode PrivateConnect()
		{
			if (base.PhysicalStatus != DevicePhysicalStateEx.Online)
			{
				return ConnectErrorCode.Unknown;
			}
			WifiDeviceData serviceHostEndPointInfo = GetServiceHostEndPointInfo();
			ConnectErrorCode errorCode = ConnectErrorCode.Unknown;
			MessageManager messageManager = CreateMessageManager(new IPEndPointInfo(serviceHostEndPointInfo.Ip, serviceHostEndPointInfo.CmdPort), out errorCode);
			if (messageManager == null || errorCode != ConnectErrorCode.OK)
			{
				return errorCode;
			}
			MessageManager = messageManager;
			ExtendDataFileServiceEndPoint = new IPEndPoint(IPAddress.Parse(serviceHostEndPointInfo.Ip), serviceHostEndPointInfo.ExtendDataPort);
			BackupAndRestorePortServiceEndPoint = new IPEndPoint(IPAddress.Parse(serviceHostEndPointInfo.Ip), serviceHostEndPointInfo.BackupAndRestorePort);
			messageManager.HeartbeatStopped += MsgManager_HeartbeatStopped;
			FileTransferManager = new FileTransferManager(new IPEndPointInfo(serviceHostEndPointInfo.Ip, serviceHostEndPointInfo.DataPort), RsaSocketEncryptHelper);
			using (MessageReaderAndWriter messageReaderAndWriter = messageManager.CreateMessageReaderAndWriter())
			{
				if (messageReaderAndWriter != null)
				{
					List<PropItem> receiveData = null;
					messageReaderAndWriter.SendAndReceiveSync("setConnectStatus", "setConnectStatusResponse", new List<string> { (base.ConnectType == ConnectType.Adb) ? "4" : "2" }, Sequence.SingleInstance.New(), out receiveData);
					messageManager.StartHeartbeat(1000L, 10000L);
					serviceHostEndPointInfo.IpRSA = (messageManager.GetHeartbeatChannel().RawSocket.LocalEndPoint as IPEndPoint).Address.ToString();
					return ConnectErrorCode.OK;
				}
			}
			return ConnectErrorCode.Unknown;
		}

		private void MsgManager_HeartbeatStopped(object sender, HeartbeatStoppedEventArgs e)
		{
			if (base.ConnectType == ConnectType.Adb && base.PhysicalStatus == DevicePhysicalStateEx.Online && !DeviceConnectionManagerEx.IsLogOut)
			{
				if (base.WorkType != DeviceWorkType.Rescue || DevicemgtContantClass.IsBackAndRestoreFrm)
				{
					base.SoftStatus = DeviceSoftStateEx.Offline;
					Thread.Sleep(9000);
					startConnect();
				}
			}
			else
			{
				base.SoftStatus = (e.IsDisconnectedByService ? DeviceSoftStateEx.ManualDisconnect : DeviceSoftStateEx.Offline);
				base.PhysicalStatus = DevicePhysicalStateEx.Offline;
			}
		}

		private TcpConnectStepChangedEventArgs CreateTcpConnectStepChangedEventArgs(string stepName, int currentStepIndex, ConnectStepStatus currentResult, ConnectErrorCode errorCode, ref int currentPercent)
		{
			return new TcpConnectStepChangedEventArgs(stepName, currentResult, errorCode, currentPercent = CalculatePercent(currentPercent, currentStepIndex, currentResult));
		}

		protected virtual int CalculatePercent(int currentPercent, int stepIndex, ConnectStepStatus result)
		{
			int num = 100 - currentPercent;
			switch (result)
			{
			case ConnectStepStatus.Starting:
				currentPercent += (int)((double)num * ((double)(10 + (stepIndex - 1) * 20) / 100.0));
				break;
			case ConnectStepStatus.Success:
				currentPercent += (int)((double)num * ((double)(20 + (stepIndex - 1) * 20) / 100.0));
				break;
			}
			return currentPercent;
		}

		public abstract ConnectErrorCode LoadProperty();

		public abstract bool FocuseApp();

		public override string ToString()
		{
			return string.Format("device info [id:{0}, mn:{1},appType:{2},ps:{3},ss:{4},connectType:{5}]", new object[6]
			{
				base.Identifer,
				(Property != null) ? Property.ModelName : string.Empty,
				base.ConnectedAppType,
				base.PhysicalStatus,
				base.SoftStatus,
				base.ConnectType
			});
		}

		public int GetAndroidMajorVerion()
		{
			string text = Property.AndroidVersion.Trim();
			int num = text.IndexOf('.');
			if (num > 0)
			{
				text = text.Substring(0, num);
			}
			int result = 0;
			int.TryParse(text, out result);
			return result;
		}
	}
	public class ConnectSteps
	{
		public const string APP_VERSION_IS_MATCHED = "AppVersionIsMatched";

		public const string TCP_CONNECT = "TcpConnect";

		public const string LOAD_DEVICE_PROPERTY = "LoadDeviceProperty";

		public const string UNINSTALL_APP = "UnInstallApp";

		public const string INSTALL_APP = "InstallApp";
	}
	public enum ConnectErrorCode
	{
		Unknown,
		OK,
		TcpConnectFailWithAppNotAllowed,
		TcpConnectFailWithTimeout,
		AppVersionNotMatched,
		ApkInstallFailWithHaveNoSpace,
		ApkInstallFail,
		PropertyLoadFail,
		LaunchAppFail,
		ClientUnsupport
	}
	public enum ConnectStepStatus
	{
		Starting,
		Fail,
		Success
	}
	public class TcpConnectStepChangedEventArgs : EventArgs
	{
		public string Step { get; private set; }

		public ConnectStepStatus Result { get; private set; }

		public int Percent { get; private set; }

		public ConnectErrorCode ErrorCode { get; set; }

		public TcpConnectStepChangedEventArgs(string step, ConnectStepStatus result, ConnectErrorCode errorCode, int percent)
		{
			Step = step;
			Result = result;
			Percent = percent;
			ErrorCode = errorCode;
		}
	}
	public class PermissionsCheckConfirmEventArgs : EventArgs
	{
		public int CheckPermissionsFailedResult { get; private set; }

		public Func<bool, bool> RequestPermissionsAction { get; private set; }

		public PermissionsCheckConfirmEventArgs(Func<bool, bool> rquestPermissionsAction, int _failedType)
		{
			RequestPermissionsAction = rquestPermissionsAction;
			CheckPermissionsFailedResult = _failedType;
		}
	}
}
namespace lenovo.mbg.service.framework.devicemgt.DeviceOperator
{
	public class AdbOperator : IDeviceOperator
	{
		private static AdbOperator _instance;

		protected IAdbClient adb = AdbConnectionMonitorEx.m_AdbClient;

		private SortedList<string, DeviceData> devices = new SortedList<string, DeviceData>();

		public static AdbOperator Instance
		{
			get
			{
				if (_instance != null)
				{
					return _instance;
				}
				return _instance = new AdbOperator();
			}
		}

		public void ForwardPort(string deviceID, int devicePort, int localPort)
		{
			DeviceData deviceData = FindDeviceData(deviceID);
			if (deviceData != null)
			{
				string local = $"tcp:{localPort}";
				string remote = $"tcp:{devicePort}";
				adb.CreateForward(deviceData, local, remote, allowRebind: false);
				adb.ListForward(deviceData).ToList();
			}
		}

		public void Install(string deviceID, string apkPath)
		{
			DeviceData deviceData = FindDeviceData(deviceID);
			if (deviceData != null)
			{
				new PackageManager(adb, deviceData).InstallPackage(apkPath, reinstall: true);
			}
		}

		public void PushFile(string deviceID, string localFilePath, string deviceFilePath)
		{
			DeviceData deviceData = FindDeviceData(deviceID);
			if (deviceData == null)
			{
				return;
			}
			using SyncService syncService = new SyncService(adb, deviceData);
			using Stream stream = File.OpenRead(localFilePath);
			syncService.Push(stream, deviceFilePath, 777, DateTime.Now, null, CancellationToken.None);
		}

		public void Reboot(string deviceID, string mode)
		{
			DeviceData deviceData = FindDeviceData(deviceID);
			if (deviceData != null)
			{
				adb.Reboot(mode, deviceData);
			}
		}

		public void RemoveForward(string deviceID, int localPort)
		{
			DeviceData deviceData = FindDeviceData(deviceID);
			if (deviceData != null)
			{
				adb.RemoveForward(deviceData, localPort);
			}
		}

		public void RemoveAllForward(string deviceID)
		{
			DeviceData deviceData = FindDeviceData(deviceID);
			if (deviceData != null)
			{
				adb.RemoveAllForwards(deviceData);
			}
		}

		public string Shell(string deviceID, string command)
		{
			ConsoleOutputReceiver consoleOutputReceiver = new ConsoleOutputReceiver();
			DeviceData deviceData = FindDeviceData(deviceID);
			if (deviceData == null)
			{
				return "failed";
			}
			try
			{
				adb.ExecuteRemoteCommandAsync(command, deviceData, consoleOutputReceiver, default(CancellationToken)).Wait();
				string text = consoleOutputReceiver.ToString();
				if (text.EndsWith("\r\n"))
				{
					text = text.Remove(text.LastIndexOf("\r\n"));
				}
				return text;
			}
			catch
			{
				return "failed";
			}
		}

		public void Uninstall(string deviceID, string apkName)
		{
			DeviceData deviceData = FindDeviceData(deviceID);
			if (deviceData != null)
			{
				new PackageManager(adb, deviceData).UninstallPackage(apkName);
			}
		}

		public string Command(string command, int timeout = -1, string deviceID = "")
		{
			string adbPath = Configurations.AdbPath;
			string command2 = command;
			if (!string.IsNullOrEmpty(deviceID) && string.Compare(deviceID, "UNKNOWN", ignoreCase: true) != 0)
			{
				command2 = "-s " + deviceID + " " + command;
			}
			return ProcessRunner.ProcessString(adbPath, command2, timeout);
		}

		public DeviceData FindDeviceData(string deviceID)
		{
			return FindAdbDevices().FirstOrDefault((DeviceData n) => n.Serial == deviceID);
		}

		public List<string> FindDevices()
		{
			return (from n in FindAdbDevices()
				select n.Serial).ToList();
		}

		public List<DeviceData> FindAdbDevices()
		{
			try
			{
				if (!AdbServer.Instance.GetStatus().IsRunning)
				{
					AdbServer.Instance.StartServer("adb.exe", restartServerIfNewer: true);
				}
				List<DeviceData> list = adb.GetDevices();
				if (list == null)
				{
					list = new List<DeviceData>();
				}
				return list.Where((DeviceData n) => !string.IsNullOrEmpty(n.Serial)).ToList();
			}
			catch
			{
				return new List<DeviceData>();
			}
		}
	}
	public class FastbootOperator : IDeviceOperator
	{
		public static string fastbootExe = Path.Combine(".", "fastboot.exe");

		public static string fastbootMonitorExe = Path.Combine(".", "fastbootmonitor.exe");

		public string Command(string command, int timeout = -1, string deviceID = "")
		{
			if (!string.IsNullOrEmpty(deviceID) && string.Compare(deviceID, "UNKNOWN", ignoreCase: true) == 0)
			{
				_ = "-s " + deviceID + " " + command;
			}
			return ProcessRunner.ProcessString(Configurations.FastbootPath, command, timeout);
		}

		public List<string> FindDevices()
		{
			return FindDevices(fastbootMonitorExe);
		}

		public List<string> FindDevices(string exe)
		{
			string text = ProcessRunner.ProcessString(exe, "devices", 2000);
			List<string> list = new List<string>();
			string[] array = text.Split(new string[1] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);
			for (int i = 0; i < array.Length; i++)
			{
				string[] array2 = array[i].Split(new char[1] { '\t' });
				if (array2.Length >= 2)
				{
					string text2 = array2[0].Trim();
					if (!text2.Contains("??????"))
					{
						list.Add(text2);
					}
				}
			}
			return list;
		}

		public void ForwardPort(string deviceID, int devicePort, int localPort)
		{
			throw new NotImplementedException();
		}

		public void Install(string deviceID, string apkPath)
		{
			throw new NotImplementedException();
		}

		public void PushFile(string deviceID, string localFilePath, string deviceFilePath)
		{
			throw new NotImplementedException();
		}

		public void Reboot(string deviceID, string mode)
		{
			throw new NotImplementedException();
		}

		public void RemoveForward(string deviceID, int localPort)
		{
			throw new NotImplementedException();
		}

		public string Shell(string deviceID, string command)
		{
			throw new NotImplementedException();
		}

		public void Uninstall(string deviceID, string apkName)
		{
			throw new NotImplementedException();
		}

		public void RemoveAllForward(string deviceID)
		{
			throw new NotImplementedException();
		}
	}
	public class ProcessHelper
	{
		private static ProcessHelper m_instance;

		public static ProcessHelper Instance
		{
			get
			{
				if (m_instance != null)
				{
					return m_instance;
				}
				return m_instance = new ProcessHelper();
			}
		}

		public string Do(string exe, string command, int timeout)
		{
			StringBuilder output = new StringBuilder();
			try
			{
				using Process process = new Process();
				process.StartInfo.Arguments = command;
				process.StartInfo.FileName = exe;
				process.StartInfo.UseShellExecute = false;
				process.StartInfo.RedirectStandardInput = false;
				process.StartInfo.RedirectStandardOutput = true;
				process.StartInfo.RedirectStandardError = true;
				process.StartInfo.CreateNoWindow = true;
				process.StartInfo.WorkingDirectory = Environment.CurrentDirectory;
				AutoResetEvent outputWaitHandler = new AutoResetEvent(initialState: false);
				try
				{
					AutoResetEvent errorWaitHandler = new AutoResetEvent(initialState: false);
					try
					{
						process.OutputDataReceived += delegate(object s, DataReceivedEventArgs e)
						{
							if (e.Data == null)
							{
								if (!outputWaitHandler.SafeWaitHandle.IsClosed)
								{
									outputWaitHandler.Set();
								}
							}
							else
							{
								output.AppendLine(e.Data);
							}
						};
						process.ErrorDataReceived += delegate(object s, DataReceivedEventArgs e)
						{
							if (e.Data == null)
							{
								if (!errorWaitHandler.SafeWaitHandle.IsClosed)
								{
									errorWaitHandler.Set();
								}
							}
							else
							{
								output.AppendLine(e.Data);
							}
						};
						process.Start();
						process.BeginOutputReadLine();
						process.BeginErrorReadLine();
						if (process.WaitForExit(timeout) && outputWaitHandler.WaitOne(timeout))
						{
							errorWaitHandler.WaitOne(timeout);
						}
					}
					finally
					{
						if (errorWaitHandler != null)
						{
							((IDisposable)errorWaitHandler).Dispose();
						}
					}
				}
				finally
				{
					if (outputWaitHandler != null)
					{
						((IDisposable)outputWaitHandler).Dispose();
					}
				}
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error(ex.ToString());
			}
			return output.ToString();
		}

		public string Shell(string command, int timeout)
		{
			StringBuilder output = new StringBuilder();
			Process process = new Process();
			process.StartInfo.FileName = Configurations.FastbootPath;
			process.StartInfo.Arguments = command;
			process.StartInfo.UseShellExecute = false;
			process.StartInfo.RedirectStandardInput = true;
			process.StartInfo.RedirectStandardOutput = true;
			process.StartInfo.RedirectStandardError = true;
			process.StartInfo.CreateNoWindow = true;
			process.EnableRaisingEvents = true;
			process.StartInfo.WorkingDirectory = Environment.CurrentDirectory;
			AutoResetEvent outputWaitHandler = new AutoResetEvent(initialState: false);
			try
			{
				AutoResetEvent errorWaitHandler = new AutoResetEvent(initialState: false);
				try
				{
					process.OutputDataReceived += delegate(object s, DataReceivedEventArgs e)
					{
						if (e.Data == null)
						{
							if (!outputWaitHandler.SafeWaitHandle.IsClosed)
							{
								outputWaitHandler.Set();
							}
						}
						else
						{
							output.AppendLine(e.Data);
						}
					};
					process.ErrorDataReceived += delegate(object s, DataReceivedEventArgs e)
					{
						if (e.Data == null)
						{
							if (!errorWaitHandler.SafeWaitHandle.IsClosed)
							{
								errorWaitHandler.Set();
							}
						}
						else
						{
							output.AppendLine(e.Data);
						}
					};
					process.Start();
					process.BeginOutputReadLine();
					process.BeginErrorReadLine();
					if (process.WaitForExit(timeout) && outputWaitHandler.WaitOne(timeout))
					{
						errorWaitHandler.WaitOne(timeout);
					}
				}
				finally
				{
					if (errorWaitHandler != null)
					{
						((IDisposable)errorWaitHandler).Dispose();
					}
				}
			}
			finally
			{
				if (outputWaitHandler != null)
				{
					((IDisposable)outputWaitHandler).Dispose();
				}
			}
			return output.ToString();
		}

		private void Redirected(List<string> dataList, object sender, DataReceivedEventArgs e)
		{
			if (e.Data != null)
			{
				dataList.Add(e.Data);
			}
		}
	}
}
namespace lenovo.mbg.service.framework.devicemgt.DeviceInfo
{
	public class PropInfoLoader
	{
		private PropInfo _PropInfo;

		public PropInfoLoader()
		{
			_PropInfo = new PropInfo();
		}

		public PropInfo LoadAll(TcpAndroidDevice device)
		{
			using (MessageReaderAndWriter msgRWHander = device.MessageManager.CreateMessageReaderAndWriter())
			{
				LoadProp(msgRWHander);
				LoadIMEI(msgRWHander);
				LoadSN(msgRWHander);
				LoadBattery(msgRWHander);
				LoadInternalStorageInfo(msgRWHander);
				LoadExternalStroageInfo(msgRWHander);
				LoadProcessor(msgRWHander);
				LoadUpTime(msgRWHander);
				if (device.ConnectType == ConnectType.Adb)
				{
					LoadPropByAdb(device);
				}
			}
			return _PropInfo;
		}

		private void LoadPropByAdb(TcpAndroidDevice device)
		{
			string text = AdbOperator.Instance.Command("shell getprop", -1, device.Identifer);
			if (string.IsNullOrEmpty(text))
			{
				return;
			}
			MatchCollection matchCollection = Regex.Matches(text, "\\[(?<key>.*)\\]:\\s+?\\[(?<value>.*)\\]", RegexOptions.Multiline);
			if (matchCollection == null || matchCollection.Count <= 0)
			{
				return;
			}
			List<PropItem> list = new List<PropItem>();
			foreach (Match item in matchCollection)
			{
				list.Add(new PropItem
				{
					Key = item.Groups["key"].Value.Trim(),
					Value = item.Groups["value"].Value?.Trim()
				});
			}
			_PropInfo.AddOrUpdateProp(list);
		}

		private void LoadProp(MessageReaderAndWriter msgRWHander)
		{
			List<PropItem> receiveData = null;
			List<string> first = new List<string>
			{
				"ro.build.version.release", "ro.product.brand", "ro.carrier", "ro.lenovo.easyimage.code", "persist.sys.withsim.country", "ro.build.fingerprint", "gsm.imei1", "gsm.imei2", "ro.odm.lenovo.psn", "ro.odm.lenovo.sn",
				"ro.product.model", "ro.product.ota.model", "ro.build.version.incremental", "ro.build.customer-version", "ro.build.characteristics", "ro.lenovo.device", "ro.hardware", "phone.type", "gsm.serial", "gsm.sn1",
				"ro.psnno", "sys.pn", "ro.pcbasn", "persist.sys.cit.sn", "gsm.sn", "persist.sys.pnvalue", "ro.build.version.sdk", "ro.build.display.id", "ro.boot.hardware.sku", "ril.baseband.config.version",
				"gsm.version.baseband", "vendor.ril.baseband.config.version", "ro.build.version.full", "persist.radio.multisim.config", "sys.customsn.showcode", "ro.lenovosn2", "persist.radio.factory_phone_sn", "gsm.lenovosn2", "persist.sys.snvalue", "ro.serialno",
				"sys.pcba.serialno"
			};
			List<string> allProps = DeviceReadConfig.Instance.GetAllProps();
			List<string> parameter = first.Union(allProps).ToList();
			if (msgRWHander.SendAndReceiveSync("getProp", "getPropResponse", parameter, Sequence.SingleInstance.New(), out receiveData))
			{
				_PropInfo.AddOrUpdateProp(receiveData);
			}
		}

		private void LoadIMEI(MessageReaderAndWriter msgRWHander)
		{
			string text = string.Empty;
			string empty = string.Empty;
			List<PropItem> receiveData = null;
			if (msgRWHander.SendAndReceiveSync("getIMEI1", "getIMEI1Response", new List<string>(), Sequence.SingleInstance.New(), out receiveData))
			{
				_PropInfo.AddOrUpdateProp(receiveData, new Dictionary<string, string> { { "imei1", "device.imei1" } });
				text = _PropInfo.GetProp("device.imei1");
				if (!string.IsNullOrEmpty(text) && "NULL".Equals(text.ToUpper()))
				{
					text = string.Empty;
					_PropInfo.Reset("device.imei1", text);
				}
			}
			List<PropItem> receiveData2 = null;
			if (msgRWHander.SendAndReceiveSync("getIMEI2", "getIMEI2Response", new List<string>(), Sequence.SingleInstance.New(), out receiveData2))
			{
				_PropInfo.AddOrUpdateProp(receiveData2, new Dictionary<string, string> { { "imei2", "device.imei2" } });
				empty = _PropInfo.GetProp("device.imei2");
				if (!string.IsNullOrEmpty(empty) && "NULL".Equals(empty.ToUpper()))
				{
					empty = string.Empty;
					_PropInfo.Reset("device.imei2", empty);
				}
				if (!string.IsNullOrEmpty(text) && !string.IsNullOrEmpty(empty) && text.Equals(empty))
				{
					_PropInfo.Reset("device.imei2", string.Empty);
				}
			}
		}

		private void LoadBattery(MessageReaderAndWriter msgRWHander)
		{
			List<PropItem> receiveData = null;
			if (msgRWHander.SendAndReceiveSync("getBattery", "getBatteryResponse", new List<string>(), Sequence.SingleInstance.New(), out receiveData))
			{
				_PropInfo.AddOrUpdateProp(receiveData, new Dictionary<string, string> { { "battery", "battery.quantity" } });
			}
		}

		private void LoadInternalStorageInfo(MessageReaderAndWriter msgRWHander)
		{
			List<PropItem> receiveData = null;
			if (msgRWHander.SendAndReceiveSync("getInternalStorageInfo", "getInternalStorageInfoResponse", new List<string>(), Sequence.SingleInstance.New(), out receiveData))
			{
				_PropInfo.AddOrUpdateProp(receiveData, new Dictionary<string, string>
				{
					{ "path", "Internal.Storage.Path" },
					{ "total", "Internal.Storage.Total" },
					{ "used", "Internal.Storage.Used" },
					{ "free", "Internal.Storage.Free" },
					{ "totalWithUnit", "Internal.Storage.TotalWithUnit" },
					{ "usedWithUnit", "Internal.Storage.UsedWithUnit" },
					{ "freeWithUnit", "Internal.Storage.FreeWithUnit" }
				});
			}
		}

		private void LoadExternalStroageInfo(MessageReaderAndWriter msgRWHander)
		{
			List<PropItem> receiveData = null;
			if (msgRWHander.SendAndReceiveSync("getExternalStorageInfo", "getExternalStorageInfoResponse", new List<string>(), Sequence.SingleInstance.New(), out receiveData))
			{
				_PropInfo.AddOrUpdateProp(receiveData, new Dictionary<string, string>
				{
					{ "path", "External.Storage.Path" },
					{ "total", "External.Storage.Total" },
					{ "used", "External.Storage.Used" },
					{ "free", "External.Storage.Free" },
					{ "totalWithUnit", "External.Storage.TotalWithUnit" },
					{ "usedWithUnit", "External.Storage.UsedWithUnit" },
					{ "freeWithUnit", "External.Storage.FreeWithUnit" }
				});
			}
		}

		private void LoadProcessor(MessageReaderAndWriter msgRWHander)
		{
			List<PropItem> receiveData = null;
			if (msgRWHander.SendAndReceiveSync("getProcessor", "getProcessorResponse", new List<string>(), Sequence.SingleInstance.New(), out receiveData))
			{
				_PropInfo.AddOrUpdateProp(receiveData);
			}
		}

		private void LoadUpTime(MessageReaderAndWriter msgRWHander)
		{
			List<PropItem> receiveData = null;
			if (msgRWHander.SendAndReceiveSync("getUpTime", "getUpTimeResponse", new List<string>(), Sequence.SingleInstance.New(), out receiveData))
			{
				_PropInfo.AddOrUpdateProp(receiveData);
			}
		}

		private void LoadSN(MessageReaderAndWriter msgRWHander)
		{
			List<PropItem> receiveData = null;
			if (msgRWHander.SendAndReceiveSync("getSN", "getSNResponse", new List<string>(), Sequence.SingleInstance.New(), out receiveData))
			{
				_PropInfo.AddOrUpdateProp(receiveData);
			}
		}
	}
	public class FastbootAndroidDevice : IAndroidDevice, ILoadDeviceData
	{
		private ReadPropertiesInFastboot _ReadPropertiesInFastboot;

		public string AndroidVersion => _ReadPropertiesInFastboot.GetProp("androidVer");

		public double BatteryQuantityPercentage => 0.0;

		public string Brand => string.Empty;

		public string Carrier => _ReadPropertiesInFastboot.GetProp("ro.carrier");

		public string CountryCode => null;

		public string CustomerVersion => null;

		public string FingerPrint => _ReadPropertiesInFastboot.GetProp("ro.build.fingerprint");

		public long FreeExternalStorage => 0L;

		public long FreeInternalStorage => 0L;

		public string HWCode => string.Empty;

		public string IMEI1 => _ReadPropertiesInFastboot.GetProp("imei");

		public string IMEI2 => string.Empty;

		public string ModelId => string.Empty;

		public string ModelName
		{
			get
			{
				string prop = _ReadPropertiesInFastboot.GetProp("sku");
				if (string.IsNullOrEmpty(prop))
				{
					prop = _ReadPropertiesInFastboot.GetProp("ro.boot.hardware.sku");
				}
				return prop;
			}
		}

		public string ModelName2
		{
			get
			{
				string prop = _ReadPropertiesInFastboot.GetProp("sku");
				if (string.IsNullOrEmpty(prop))
				{
					prop = _ReadPropertiesInFastboot.GetProp("ro.boot.hardware.sku");
				}
				return prop;
			}
		}

		public string Operator => string.Empty;

		public string OtaModel => string.Empty;

		[JsonIgnore]
		public Dictionary<string, string> Others => _ReadPropertiesInFastboot.Props;

		public string PN => string.Empty;

		public string RoHardWare => string.Empty;

		public string RomVersion => string.Empty;

		public string SN => GetPropertyValue("serialno");

		public long TotalExternalStorage => 0L;

		public long TotalInternalStorage => 0L;

		public long UsedExternalStorage => 0L;

		public long UsedInternalStorage => 0L;

		public string FsgVersion => _ReadPropertiesInFastboot.GetProp("version-baseband");

		public string Processor => string.Empty;

		public string Uptime => string.Empty;

		public string InternalStoragePath => string.Empty;

		public string ExternalStoragePath => string.Empty;

		public string TotalExternalStorageWithUnit => string.Empty;

		public string UsedExternalStorageWithUnit => string.Empty;

		public string FreeExternalStorageWithUnit => string.Empty;

		public string TotalInternalStorageWithUnit => string.Empty;

		public string UsedInternalStorageWithUnit => string.Empty;

		public string FreeInternalStorageWithUnit => string.Empty;

		public int ApiLevel => -1;

		public string Category => "phone";

		public int SimCount
		{
			get
			{
				string propertyValue = GetPropertyValue("oem hw dualsim");
				if (!string.IsNullOrEmpty(propertyValue) && propertyValue.Equals("true", StringComparison.CurrentCultureIgnoreCase))
				{
					return 2;
				}
				return 1;
			}
		}

		public FastbootAndroidDevice(DeviceEx device)
		{
			_ReadPropertiesInFastboot = new ReadPropertiesInFastboot(device);
		}

		public void Load()
		{
			_ReadPropertiesInFastboot.Run();
		}

		public string GetPropertyValue(string name)
		{
			return _ReadPropertiesInFastboot.GetProp(name);
		}
	}
	public class ReadPropertiesInFastboot
	{
		private static readonly Regex REG_EX = new Regex("(?<bootloader>\\(bootloader\\)\\s+)(?<key>.+):\\s+(?<value>.*)");

		protected DeviceEx device;

		private List<string> keyWord = new List<string> { "Finished", "FAILED", "OKAY", "completed" };

		public Dictionary<string, string> Props { get; private set; }

		public ReadPropertiesInFastboot(DeviceEx device)
		{
			this.device = device;
			Props = new Dictionary<string, string>();
		}

		public void Run()
		{
			Dictionary<string, string> dictionary = ReadAll();
			if (dictionary.Count > 0)
			{
				if (!CheckData(dictionary))
				{
					LogHelper.LogInstance.Error("Check Data error,ModelName is null,Retry ReadAll");
					dictionary = ReadAll();
				}
				Props.Clear();
				Props = new Dictionary<string, string>(dictionary);
				ReadSimConfig();
			}
			ConvertFsgVersion();
			ConvertFingerPrint();
			ConvertBlurVersion();
			ConvertFlashSize();
			ConvertRamSize();
		}

		public string GetProp(string element)
		{
			Props.TryGetValue(element, out var value);
			return value;
		}

		private Dictionary<string, string> ReadAll()
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			List<string> list = new List<string>();
			string text = "getvar all";
			try
			{
				if (!string.IsNullOrEmpty(device.Identifer))
				{
					text = "-s " + device.Identifer + " " + text;
				}
				for (int i = 0; i < 3; i++)
				{
					list = ProcessRunner.ProcessListKeyWord(Configurations.FastbootPath, text, 5000, keyWord);
					if (list.Count > 0 && list.Count((string n) => n.Contains("FAILED")) != 0)
					{
						LogHelper.LogInstance.Info("Fastboot device exucte " + text + " Failed!");
						LogHelper.LogInstance.Info(string.Join("\r\n", list));
						list.Clear();
						break;
					}
					if (list.Count > 0 && list.Count((string n) => n.Contains("execute occur an error")) != 0)
					{
						LogHelper.LogInstance.Info(string.Join("\r\n", list));
						list.Clear();
						break;
					}
					if (list.Count > 0 && list.Count((string n) => n.Contains("execute error, commnad timeout")) == 0)
					{
						LogHelper.LogInstance.Info("Fastboot device exucte " + text + " successed!");
						break;
					}
					string text2 = string.Join("\r\n", list);
					LogHelper.LogInstance.Info("Fastboot getvar all timeout or other resp:" + text2);
					if (string.IsNullOrEmpty(text2.Trim(new char[1] { ' ' })))
					{
						Thread.Sleep(1000);
					}
					list.Clear();
				}
				foreach (string item in list)
				{
					Match match = REG_EX.Match(item);
					string value = match.Groups["key"].Value;
					string value2 = match.Groups["value"].Value;
					if (!string.IsNullOrEmpty(value) && !dictionary.ContainsKey(value))
					{
						dictionary.Add(value, value2?.Trim());
					}
				}
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Fastboot device exucte " + text + " Error! Exception:" + ex.Message);
			}
			return dictionary;
		}

		private bool CheckData(Dictionary<string, string> result)
		{
			result.TryGetValue("sku", out var value);
			if (string.IsNullOrEmpty(value))
			{
				result.TryGetValue("ro.boot.hardware.sku", out value);
			}
			return !string.IsNullOrEmpty(value);
		}

		private void ConvertFsgVersion()
		{
			string text = Convert("version-baseband");
			if (!string.IsNullOrEmpty(text) && !text.Contains("not found"))
			{
				string[] array = text.Split(new char[1] { ' ' });
				if (array.Length == 1)
				{
					text = array[0].Trim();
				}
				else if (array.Length > 1)
				{
					text = array[1].Trim();
				}
				Props["version-baseband"] = text;
			}
		}

		private void ConvertFingerPrint()
		{
			string text = Convert("ro.build.fingerprint");
			if (string.IsNullOrEmpty(text))
			{
				return;
			}
			string[] array = text.Split(new char[1] { '/' });
			if (array.Length > 3)
			{
				Props["softwareVersion"] = array[3].Trim();
			}
			if (array.Length > 2)
			{
				string[] array2 = array[2].Split(new char[1] { ':' });
				if (array2.Length > 1)
				{
					Props["androidVer"] = array2[1]?.Trim();
				}
			}
			Props["ro.build.fingerprint"] = text;
		}

		private void ConvertBlurVersion()
		{
			string value = Convert("ro.build.version.full");
			if (!string.IsNullOrEmpty(value))
			{
				Props["ro.build.version.full"] = value;
			}
		}

		private void ConvertFlashSize()
		{
			string text = Convert("emmc");
			if (!string.IsNullOrEmpty(text))
			{
				string[] array = text.Split(new char[1] { ' ' });
				Props["emmc"] = array[0];
			}
		}

		private void ConvertRamSize()
		{
			string text = Convert("ram");
			if (!string.IsNullOrEmpty(text))
			{
				string[] array = text.Split(new char[1] { ' ' });
				Props["ram"] = array[0];
			}
		}

		private void ReadSimConfig()
		{
			string text = "oem hw dualsim";
			if (!string.IsNullOrEmpty(device.Identifer))
			{
				text = "-s " + device.Identifer + " " + text;
			}
			int num = 3;
			List<string> list;
			do
			{
				list = ProcessRunner.ProcessList(Configurations.FastbootPath, text, 20000);
				string text2 = ((list == null) ? "" : string.Join("\r\n", list));
				LogHelper.LogInstance.Info("read sim count: " + text + ", response: " + text2);
				if (!string.IsNullOrEmpty(text2) && !text2.Contains("error") && !text2.Contains("commnad timeout"))
				{
					break;
				}
				Thread.Sleep(1000);
			}
			while (--num > 0);
			string text3 = null;
			foreach (string item in list)
			{
				if (item.Contains("dualsim"))
				{
					string[] array = item.Split(new char[1] { ':' });
					if (array.Length > 1 && array[1].Trim() == "true")
					{
						text3 = "Dual";
					}
				}
			}
			if (text3 == null)
			{
				text3 = GetProp("dualsim");
				text3 = ((string.IsNullOrEmpty(text3) || !(text3.ToLower() == "true")) ? "Single" : "Dual");
			}
			Props["oem hw dualsim"] = text3;
		}

		private string Convert(string element)
		{
			if (!Props.TryGetValue(element, out var value))
			{
				int num = 0;
				value = string.Empty;
				bool flag;
				do
				{
					flag = Props.TryGetValue($"{element}[{num}]", out var value2);
					if (flag)
					{
						value += value2;
						num++;
					}
					else
					{
						value = value.Trim();
					}
				}
				while (flag);
			}
			return value;
		}
	}
	[Serializable]
	public class AndroidDeviceProperty : IAndroidDevice, ILoadDeviceData
	{
		private PropInfo _PropInfo;

		protected List<string> countryElements = new List<string> { "ro.lenovo.easyimage.code", "persist.sys.withsim.country", "gsm.operator.iso-country" };

		private string _imei1 = string.Empty;

		private string _imei2 = string.Empty;

		private string _pn = string.Empty;

		private string _sn = string.Empty;

		private string _internalStoragePath = string.Empty;

		private string _externalStoragePath = string.Empty;

		private string _totalExternalStorageWithUnit = string.Empty;

		private string _usedExternalStorageWithUnit = string.Empty;

		private string _totalInternalStorageWithUnit = string.Empty;

		private string _usedInternalStorageWithUnit = string.Empty;

		private string _freeExternalStorageWithUnit = string.Empty;

		private string _freeInternalStorageWithUnit = string.Empty;

		private long _totalExternalStorage;

		private long _usedExternalStorage;

		private long _totalInternalStorage;

		private long _usedInternalStorage;

		private long _freeExternalStorage;

		private long _freeInternalStorage;

		private string _processor = string.Empty;

		private string _uptime = string.Empty;

		public static readonly string[] SN_PROP_FIELDS = new string[7] { "sys.customsn.showcode", "ro.lenovosn2", "persist.radio.factory_phone_sn", "gsm.lenovosn2", "persist.sys.snvalue", "ro.serialno", "ro.odm.lenovo.sn" };

		public static readonly string[] SN_PROP_INVALID_VALUES = new string[1] { "UNKNOWN" };

		protected static Dictionary<string, List<string>> propsMapping = new Dictionary<string, List<string>>
		{
			{
				"imei1",
				new List<string> { "device.imei1", "gsm.imei1" }
			},
			{
				"imei2",
				new List<string> { "device.imei2", "gsm.imei2" }
			},
			{
				"sn",
				new List<string> { "sys.customsn.showcode", "ro.lenovosn2", "persist.radio.factory_phone_sn", "gsm.lenovosn2", "persist.sys.snvalue", "ro.serialno", "ro.odm.lenovo.sn" }
			},
			{
				"pn",
				new List<string> { "gsm.serial", "gsm.sn1", "ro.psnno", "sys.pn", "ro.pcbasn", "persist.sys.cit.sn", "gsm.sn", "persist.sys.pnvalue", "ro.odm.lenovo.psn", "sys.pcba.serialno" }
			}
		};

		public string AndroidVersion => _PropInfo.GetProp("ro.build.version.release");

		public string Brand => _PropInfo.GetProp("ro.product.brand");

		public string Carrier => _PropInfo.GetProp("ro.carrier");

		public string CountryCode
		{
			get
			{
				string text = null;
				foreach (string countryElement in countryElements)
				{
					text = _PropInfo.GetProp(countryElement);
					if (text != null)
					{
						break;
					}
				}
				return text;
			}
		}

		public string FingerPrint => _PropInfo.GetProp("ro.build.fingerprint");

		public string HWCode => GetHwCode();

		public string IMEI1
		{
			get
			{
				string text = DeviceReadConfig.Instance[ModelNameEx]?.imei;
				List<string> list = propsMapping["imei1"];
				if (!string.IsNullOrEmpty(text))
				{
					list = text.Split(new char[1] { ',' }, StringSplitOptions.RemoveEmptyEntries).Union(list).ToList();
				}
				string text2 = null;
				foreach (string item in list)
				{
					text2 = _PropInfo.GetProp(item);
					if (!string.IsNullOrEmpty(text2))
					{
						break;
					}
				}
				return text2;
			}
			private set
			{
				_imei1 = value;
			}
		}

		public string IMEI2
		{
			get
			{
				string text = DeviceReadConfig.Instance[ModelNameEx]?.imei2;
				List<string> list = propsMapping["imei2"];
				if (!string.IsNullOrEmpty(text))
				{
					list = text.Split(new char[1] { ',' }, StringSplitOptions.RemoveEmptyEntries).Union(list).ToList();
				}
				string text2 = null;
				foreach (string item in list)
				{
					text2 = _PropInfo.GetProp(item);
					if (!string.IsNullOrEmpty(text2))
					{
						break;
					}
				}
				return text2;
			}
			private set
			{
				_imei2 = value;
			}
		}

		public string ModelName
		{
			get
			{
				string result = _PropInfo.GetProp("ro.product.model");
				if (!string.IsNullOrEmpty(Brand) && Regex.IsMatch(Brand, "motorola", RegexOptions.IgnoreCase))
				{
					string prop = _PropInfo.GetProp("ro.boot.hardware.sku");
					if (!string.IsNullOrEmpty(prop) && !prop.StartsWith("CMIT_ID"))
					{
						result = prop;
					}
				}
				return result;
			}
		}

		public string ModelName2 => _PropInfo.GetProp("ro.product.model");

		protected string ModelNameEx
		{
			get
			{
				string text = _PropInfo.GetProp("ro.product.model");
				if (!string.IsNullOrEmpty(Brand) && Regex.IsMatch(Brand, "motorola", RegexOptions.IgnoreCase))
				{
					string prop = _PropInfo.GetProp("ro.boot.hardware.sku");
					if (!string.IsNullOrEmpty(prop) && !prop.StartsWith("CMIT_ID"))
					{
						text = prop;
					}
				}
				if (!string.IsNullOrEmpty(text))
				{
					return text;
				}
				return "UnKnown";
			}
		}

		public string OtaModel => _PropInfo.GetProp("ro.product.ota.model");

		public string ModelId => string.Empty;

		[JsonIgnore]
		public Dictionary<string, string> Others
		{
			get
			{
				Dictionary<string, string> dic = new Dictionary<string, string>();
				if (_PropInfo.Props != null)
				{
					_PropInfo.Props.ForEach(delegate(PropItem n)
					{
						dic.Add(n.Key, n.Value);
					});
				}
				return dic;
			}
		}

		public string PN
		{
			get
			{
				if (string.IsNullOrEmpty(_pn))
				{
					_pn = GetPN();
				}
				return _pn;
			}
			private set
			{
				_pn = value;
			}
		}

		public string RomVersion => _PropInfo.GetProp("ro.build.version.incremental");

		public string CustomerVersion => _PropInfo.GetProp("ro.build.customer-version");

		public string RoHardWare => _PropInfo.GetProp("ro.hardware");

		public string SN
		{
			get
			{
				if (string.IsNullOrEmpty(_sn))
				{
					_sn = GetSN();
				}
				return _sn;
			}
			private set
			{
				_sn = value;
			}
		}

		public double BatteryQuantityPercentage
		{
			get
			{
				double result = 0.0;
				double.TryParse(_PropInfo.GetProp("battery.quantity"), out result);
				return result;
			}
		}

		public string InternalStoragePath
		{
			get
			{
				if (!string.IsNullOrEmpty(_internalStoragePath))
				{
					return _internalStoragePath;
				}
				_internalStoragePath = _PropInfo.GetProp("Internal.Storage.Path");
				return _internalStoragePath;
			}
		}

		public string ExternalStoragePath
		{
			get
			{
				if (!string.IsNullOrEmpty(_externalStoragePath))
				{
					return _externalStoragePath;
				}
				_externalStoragePath = _PropInfo.GetProp("External.Storage.Path");
				return _externalStoragePath;
			}
		}

		public string TotalExternalStorageWithUnit
		{
			get
			{
				if (string.IsNullOrEmpty(_totalExternalStorageWithUnit))
				{
					string prop = _PropInfo.GetProp("External.Storage.TotalWithUnit");
					_totalExternalStorageWithUnit = prop;
				}
				return _totalExternalStorageWithUnit;
			}
		}

		public string UsedExternalStorageWithUnit
		{
			get
			{
				if (string.IsNullOrEmpty(_usedExternalStorageWithUnit))
				{
					string prop = _PropInfo.GetProp("External.Storage.UsedWithUnit");
					_usedExternalStorageWithUnit = prop;
				}
				return _usedExternalStorageWithUnit;
			}
		}

		public string TotalInternalStorageWithUnit
		{
			get
			{
				if (string.IsNullOrEmpty(_totalInternalStorageWithUnit))
				{
					string prop = _PropInfo.GetProp("Internal.Storage.TotalWithUnit");
					_totalInternalStorageWithUnit = prop;
				}
				return _totalInternalStorageWithUnit;
			}
		}

		public string UsedInternalStorageWithUnit
		{
			get
			{
				if (string.IsNullOrEmpty(_usedInternalStorageWithUnit))
				{
					string prop = _PropInfo.GetProp("Internal.Storage.UsedWithUnit");
					_usedInternalStorageWithUnit = prop;
				}
				return _usedInternalStorageWithUnit;
			}
		}

		public string FreeExternalStorageWithUnit
		{
			get
			{
				if (string.IsNullOrEmpty(_freeExternalStorageWithUnit))
				{
					string prop = _PropInfo.GetProp("External.Storage.FreeWithUnit");
					_freeExternalStorageWithUnit = prop;
				}
				return _freeExternalStorageWithUnit;
			}
		}

		public string FreeInternalStorageWithUnit
		{
			get
			{
				if (string.IsNullOrEmpty(_freeInternalStorageWithUnit))
				{
					string prop = _PropInfo.GetProp("Internal.Storage.FreeWithUnit");
					_freeInternalStorageWithUnit = prop;
				}
				return _freeInternalStorageWithUnit;
			}
		}

		public long TotalExternalStorage
		{
			get
			{
				if (_totalExternalStorage == 0L)
				{
					string prop = _PropInfo.GetProp("External.Storage.Total");
					if (!string.IsNullOrEmpty(prop))
					{
						long result = 0L;
						long.TryParse(prop, out result);
						return _totalExternalStorage = result;
					}
				}
				return _totalExternalStorage;
			}
		}

		public long UsedExternalStorage
		{
			get
			{
				if (_usedExternalStorage == 0L)
				{
					string prop = _PropInfo.GetProp("External.Storage.Used");
					if (!string.IsNullOrEmpty(prop))
					{
						long result = 0L;
						long.TryParse(prop, out result);
						return _usedExternalStorage = result;
					}
				}
				return _usedExternalStorage;
			}
		}

		public long TotalInternalStorage
		{
			get
			{
				if (_totalInternalStorage == 0L)
				{
					string prop = _PropInfo.GetProp("Internal.Storage.Total");
					if (!string.IsNullOrEmpty(prop))
					{
						long result = 0L;
						long.TryParse(prop, out result);
						return _totalInternalStorage = result;
					}
				}
				return _totalInternalStorage;
			}
		}

		public long UsedInternalStorage
		{
			get
			{
				if (_usedInternalStorage == 0L)
				{
					string prop = _PropInfo.GetProp("Internal.Storage.Used");
					if (!string.IsNullOrEmpty(prop))
					{
						long result = 0L;
						long.TryParse(prop, out result);
						return _usedInternalStorage = result;
					}
				}
				return _usedInternalStorage;
			}
		}

		public long FreeExternalStorage
		{
			get
			{
				if (_freeExternalStorage == 0L)
				{
					string prop = _PropInfo.GetProp("External.Storage.Free");
					if (!string.IsNullOrEmpty(prop))
					{
						long result = 0L;
						long.TryParse(prop, out result);
						return _freeExternalStorage = result;
					}
				}
				return _freeExternalStorage;
			}
		}

		public long FreeInternalStorage
		{
			get
			{
				if (_freeInternalStorage == 0L)
				{
					string prop = _PropInfo.GetProp("Internal.Storage.Free");
					if (!string.IsNullOrEmpty(prop))
					{
						long result = 0L;
						long.TryParse(prop, out result);
						return _freeInternalStorage = result;
					}
				}
				return _freeInternalStorage;
			}
		}

		public string Operator => _PropInfo.GetProp("phone.type");

		public string FsgVersion
		{
			get
			{
				string prop = _PropInfo.GetProp("ril.baseband.config.version");
				if (string.IsNullOrEmpty(prop))
				{
					prop = _PropInfo.GetProp("gsm.version.baseband");
				}
				if (string.IsNullOrEmpty(prop))
				{
					prop = _PropInfo.GetProp("vendor.ril.baseband.config.version");
				}
				return prop;
			}
		}

		public string Processor
		{
			get
			{
				if (string.IsNullOrEmpty(_processor))
				{
					_processor = _PropInfo.GetProp("processor");
				}
				return _processor;
			}
		}

		public string Uptime
		{
			get
			{
				if (string.IsNullOrEmpty(_uptime))
				{
					_uptime = _PropInfo.GetProp("upTime");
				}
				return _uptime;
			}
		}

		public int ApiLevel => _PropInfo.GetIntProp("ro.build.version.sdk");

		public string Category
		{
			get
			{
				string modelName = ModelName;
				if ("Lenovo PB2-690Y".Equals(modelName, StringComparison.OrdinalIgnoreCase) || "Lenovo PB2-690M".Equals(modelName, StringComparison.OrdinalIgnoreCase))
				{
					return "tablet";
				}
				List<string> source = new List<string> { "phone", "tablet" };
				string _category = _PropInfo.GetProp("ro.lenovo.device");
				if (string.IsNullOrEmpty(_category) || !source.Contains<string>(_category, StringComparer.CurrentCultureIgnoreCase))
				{
					_category = _PropInfo.GetProp("ro.build.characteristics");
				}
				if (string.IsNullOrEmpty(_category) || !source.Contains<string>(_category, StringComparer.CurrentCultureIgnoreCase))
				{
					_category = _PropInfo.GetProp("ro.odm.lenovo.device");
				}
				return source.FirstOrDefault((string n) => n.Equals(_category, StringComparison.CurrentCultureIgnoreCase));
			}
		}

		public int SimCount
		{
			get
			{
				string prop = _PropInfo.GetProp("persist.radio.multisim.config");
				if (string.IsNullOrEmpty(prop) || "SS".Equals(prop?.Trim(), StringComparison.CurrentCultureIgnoreCase) || "ssss".Equals(prop?.Trim(), StringComparison.CurrentCultureIgnoreCase))
				{
					return 1;
				}
				return 2;
			}
		}

		public AndroidDeviceProperty()
		{
			_PropInfo = new PropInfo();
		}

		public AndroidDeviceProperty(PropInfo propInfo)
		{
			_PropInfo = propInfo;
		}

		public void Load()
		{
		}

		public void Load(PropInfo prop)
		{
			if (prop != null)
			{
				_PropInfo.AddOrUpdateProp(prop.Props);
			}
		}

		public void AddOrUpdate(PropItem prop)
		{
			_PropInfo.AddOrUpdateProp(prop);
		}

		private string GetPN()
		{
			string text = DeviceReadConfig.Instance[ModelNameEx]?.pn;
			List<string> list = propsMapping["pn"];
			if (!string.IsNullOrEmpty(text))
			{
				list = text.Split(new char[1] { ',' }, StringSplitOptions.RemoveEmptyEntries).Union(list).ToList();
			}
			foreach (string item in list)
			{
				string text2 = _PropInfo.GetProp(item);
				if (string.IsNullOrEmpty(text2))
				{
					continue;
				}
				if (text2.Contains(" "))
				{
					string[] array = text2.Split(new char[1] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
					if (array.Length != 0)
					{
						text2 = array[0];
					}
				}
				if (text2.Length == 18 || text2.Length == 23 || text2.Length == 25)
				{
					return text2.Trim();
				}
			}
			return string.Empty;
		}

		private string GetSN()
		{
			string text = DeviceReadConfig.Instance[ModelNameEx]?.sn;
			List<string> list = propsMapping["sn"];
			if (!string.IsNullOrEmpty(text))
			{
				list = text.Split(new char[1] { ',' }, StringSplitOptions.RemoveEmptyEntries).Union(list).ToList();
			}
			string empty = string.Empty;
			if (string.IsNullOrEmpty(empty))
			{
				foreach (string item in list)
				{
					empty = _PropInfo.GetProp(item);
					if (!string.IsNullOrEmpty(empty) && !Enumerable.Contains(SN_PROP_INVALID_VALUES, empty.ToUpper()))
					{
						return empty.Trim();
					}
				}
			}
			return string.Empty;
		}

		private string GetHwCode()
		{
			if (string.IsNullOrEmpty(PN))
			{
				return string.Empty;
			}
			string empty = string.Empty;
			return (PN.Length switch
			{
				18 => PN.Substring(3, 2), 
				23 => PN.Substring(14, 2), 
				25 => (ModelName == null || !ModelName.Replace(" ", "").Equals("LenovoA2020a40", StringComparison.CurrentCultureIgnoreCase)) ? PN.Substring(23, 2) : PN.Substring(14, 2), 
				_ => string.Empty, 
			}).Trim();
		}

		public string GetPropertyValue(string name)
		{
			return _PropInfo.GetProp(name);
		}
	}
	public interface ILoadDeviceData
	{
		void Load();
	}
}
