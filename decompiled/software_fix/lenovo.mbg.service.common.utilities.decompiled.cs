using System;
using System.Collections;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Management;
using System.Net;
using System.Net.Cache;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.NetworkInformation;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;
using System.Runtime.Versioning;
using System.Security.Cryptography;
using System.ServiceProcess;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;
using System.Web;
using System.Web.Script.Serialization;
using System.Windows;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media.Imaging;
using System.Windows.Threading;
using System.Xml.Serialization;
using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using Microsoft.Web.WebView2.Core;
using Microsoft.Web.WebView2.WinForms;
using Microsoft.Web.WebView2.Wpf;
using Microsoft.Win32;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SevenZip;
using lenovo.mbg.service.common.log;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.common.utilities")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("lenovo.mbg.service.common.utilities")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Guid("18834235-7177-40f1-83a3-11d4c290b939")]
[assembly: AssemblyFileVersion("1.1.0.0")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("1.1.0.0")]
namespace lenovo.mbg.service.common.utilities;

public class AsyncTaskRunner
{
	private IAsyncTaskContext context;

	private IAsyncTaskCancelHander cancelHandler;

	public static IAsyncTaskCancelHander BeginInvok(Action<IAsyncTaskContext> task, Action<IAsyncTaskResult> callback, object objectState)
	{
		return BeginInvok(task, callback, objectState, null);
	}

	public static IAsyncTaskCancelHander BeginInvok(Action<IAsyncTaskContext> task, Action<IAsyncTaskResult> callback, object objectState, TaskScheduler scheduler)
	{
		IAsyncTaskContext context = new AsyncTaskContext(objectState);
		IAsyncTaskCancelHander result = new AsyncTaskCancelHander(context);
		Task task2 = new Task(delegate
		{
			Exception exception = null;
			try
			{
				task(context);
			}
			catch (Exception ex)
			{
				exception = ex;
			}
			callback?.Invoke(new AsyncTaskResult(context, exception));
		});
		if (scheduler == null)
		{
			task2.Start();
		}
		else
		{
			task2.Start(scheduler);
		}
		return result;
	}

	public IAsyncTaskCancelHander Init(object objectState)
	{
		context = new AsyncTaskContext(objectState);
		cancelHandler = new AsyncTaskCancelHander(context);
		return cancelHandler;
	}

	public IAsyncTaskCancelHander BeginInvok(Action<IAsyncTaskContext> task, Action<IAsyncTaskResult> callback)
	{
		Task.Factory.StartNew(delegate
		{
			Exception exception = null;
			try
			{
				task(context);
			}
			catch (Exception ex)
			{
				exception = ex;
			}
			callback?.Invoke(new AsyncTaskResult(context, exception));
		});
		return cancelHandler;
	}
}
public interface IAsyncTaskCancelHander
{
	void Cancel();
}
public interface IAsyncTaskResult
{
	object ObjectState { get; }

	Exception Exception { get; }

	bool IsCanceled { get; }

	bool IsCancelCommandRequested { get; }
}
public interface IAsyncTaskContext : ICancel
{
	object ObjectState { get; }

	bool IsCancelCommandRequested { get; }

	bool IsCanceled { get; }

	void AddCancelSource(Action canceler);

	void AddCancelSource(ICancel canceler);

	void ResetCancelStatus();
}
public interface ICancel
{
	void Cancel();
}
public class AsyncTaskCancelHander : IAsyncTaskCancelHander
{
	private IAsyncTaskContext context;

	public AsyncTaskCancelHander(IAsyncTaskContext context)
	{
		this.context = context;
	}

	public void Cancel()
	{
		context.Cancel();
	}
}
public class AsyncTaskResult : IAsyncTaskResult
{
	private IAsyncTaskContext context;

	public Exception Exception { get; private set; }

	public bool IsCanceled => context.IsCanceled;

	public object ObjectState => context.ObjectState;

	public bool IsCancelCommandRequested => context.IsCancelCommandRequested;

	public AsyncTaskResult(IAsyncTaskContext context, Exception exception)
	{
		this.context = context;
		Exception = exception;
	}
}
public class AsyncTaskContext : IAsyncTaskContext, ICancel
{
	private ConcurrentBag<object> cancelerList = new ConcurrentBag<object>();

	private volatile bool isCancelCommandRequested;

	private volatile bool isCanceled;

	private volatile bool canceling;

	public object ObjectState { get; private set; }

	public bool IsCancelCommandRequested => isCancelCommandRequested;

	public bool IsCanceled => isCanceled;

	public AsyncTaskContext(object objectState)
	{
		ObjectState = objectState;
	}

	public void AddCancelSource(ICancel canceler)
	{
		cancelerList.Add(canceler);
	}

	public void AddCancelSource(Action canceler)
	{
		cancelerList.Add(canceler);
	}

	public void ResetCancelStatus()
	{
		isCancelCommandRequested = false;
		isCanceled = false;
	}

	public void Cancel()
	{
		lock (this)
		{
			if (canceling)
			{
				return;
			}
			canceling = true;
		}
		isCancelCommandRequested = true;
		try
		{
			while (!cancelerList.IsEmpty)
			{
				if (cancelerList.TryTake(out var result) && result != null)
				{
					if (result is Action action)
					{
						action();
					}
					else if (result is ICancel cancel)
					{
						cancel.Cancel();
					}
				}
			}
			isCanceled = true;
		}
		finally
		{
			canceling = false;
		}
	}
}
public static class CommonContantField
{
	public static string WEBVIEW_USER_DATA_FOLDER = string.Empty;
}
public class ConcurrentDictionaryWrapper<TKey, TValue>
{
	private ConcurrentDictionary<TKey, TValue> m_dic;

	public int Count => m_dic.Count;

	public ConcurrentDictionaryWrapper()
	{
		m_dic = new ConcurrentDictionary<TKey, TValue>();
	}

	public void AddOrUpdate(TKey key, TValue value)
	{
		m_dic.AddOrUpdate(key, value, (TKey k, TValue oldValue) => value);
	}

	public TValue Get(TKey key)
	{
		TValue value = default(TValue);
		m_dic.TryGetValue(key, out value);
		return value;
	}

	public TValue Remove(TKey key)
	{
		TValue value = default(TValue);
		while (m_dic.ContainsKey(key))
		{
			if (m_dic.TryRemove(key, out value))
			{
				return value;
			}
		}
		return value;
	}

	public bool ContainsKey(TKey key)
	{
		return m_dic.ContainsKey(key);
	}

	public List<TValue> GetValues()
	{
		return m_dic.Values.ToList();
	}
}
public class DecryptRomFileHelper
{
	private const ulong FC_TAG = 18158797384510146255uL;

	private const int BUFFER_SIZE = 131072;

	private static RandomNumberGenerator rand = new RNGCryptoServiceProvider();

	private static bool CheckByteArrays(byte[] b1, byte[] b2)
	{
		if (b1.Length == b2.Length)
		{
			for (int i = 0; i < b1.Length; i++)
			{
				if (b1[i] != b2[i])
				{
					return false;
				}
			}
			return true;
		}
		return false;
	}

	private static SymmetricAlgorithm CreateRijndael(string password, byte[] salt)
	{
		PasswordDeriveBytes passwordDeriveBytes = new PasswordDeriveBytes(password, salt, "SHA256", 1000);
		Rijndael rijndael = Rijndael.Create();
		rijndael.KeySize = 256;
		rijndael.Key = passwordDeriveBytes.GetBytes(32);
		rijndael.Padding = PaddingMode.PKCS7;
		return rijndael;
	}

	private static byte[] GenerateRandomBytes(int count)
	{
		byte[] array = new byte[count];
		rand.GetBytes(array);
		return array;
	}

	public static void EncryptFile(string inFile, string outFile, string password = "OSD")
	{
		using (FileStream fileStream = File.OpenRead(inFile))
		{
			using FileStream fileStream2 = File.OpenWrite(outFile);
			long length = fileStream.Length;
			byte[] array = new byte[131072];
			int num = -1;
			int num2 = 0;
			byte[] array2 = GenerateRandomBytes(16);
			byte[] array3 = GenerateRandomBytes(16);
			SymmetricAlgorithm symmetricAlgorithm = CreateRijndael(password, array3);
			symmetricAlgorithm.IV = array2;
			fileStream2.Write(array2, 0, array2.Length);
			fileStream2.Write(array3, 0, array3.Length);
			HashAlgorithm hashAlgorithm = SHA256.Create();
			using CryptoStream cryptoStream = new CryptoStream(fileStream2, symmetricAlgorithm.CreateEncryptor(), CryptoStreamMode.Write);
			using CryptoStream cryptoStream2 = new CryptoStream(Stream.Null, hashAlgorithm, CryptoStreamMode.Write);
			BinaryWriter binaryWriter = new BinaryWriter(cryptoStream);
			binaryWriter.Write(length);
			binaryWriter.Write(18158797384510146255uL);
			while ((num = fileStream.Read(array, 0, array.Length)) != 0)
			{
				cryptoStream.Write(array, 0, num);
				cryptoStream2.Write(array, 0, num);
				num2 += num;
			}
			cryptoStream2.Flush();
			cryptoStream2.Close();
			byte[] hash = hashAlgorithm.Hash;
			cryptoStream.Write(hash, 0, hash.Length);
			cryptoStream.Flush();
			cryptoStream.Close();
		}
		File.Delete(inFile);
		File.SetAttributes(outFile, FileAttributes.Hidden);
	}

	public static void DecryptFile(string inFile, string outFile, string password = "")
	{
		password = (string.IsNullOrWhiteSpace(password) ? ConfigurationManager.AppSettings["DefaultDecryptPassword"] : password);
		using FileStream fileStream = File.OpenRead(inFile);
		using FileStream fileStream2 = File.OpenWrite(outFile);
		_ = fileStream.Length;
		byte[] array = new byte[131072];
		int num = -1;
		int num2 = 0;
		int num3 = 0;
		byte[] array2 = new byte[16];
		fileStream.Read(array2, 0, 16);
		byte[] array3 = new byte[16];
		fileStream.Read(array3, 0, 16);
		SymmetricAlgorithm symmetricAlgorithm = CreateRijndael(password, array3);
		symmetricAlgorithm.IV = array2;
		num2 = 32;
		long num4 = -1L;
		HashAlgorithm hashAlgorithm = SHA256.Create();
		using (CryptoStream cryptoStream = new CryptoStream(fileStream, symmetricAlgorithm.CreateDecryptor(), CryptoStreamMode.Read))
		{
			using CryptoStream cryptoStream2 = new CryptoStream(Stream.Null, hashAlgorithm, CryptoStreamMode.Write);
			BinaryReader binaryReader = new BinaryReader(cryptoStream);
			num4 = binaryReader.ReadInt64();
			ulong num5 = binaryReader.ReadUInt64();
			if (-287946689199405361L != (long)num5)
			{
				throw new Exception("file is corrupted!");
			}
			long num6 = num4 / 131072;
			long num7 = num4 % 131072;
			for (int i = 0; i < num6; i++)
			{
				num = cryptoStream.Read(array, 0, array.Length);
				fileStream2.Write(array, 0, num);
				cryptoStream2.Write(array, 0, num);
				num2 += num;
				num3 += num;
			}
			if (num7 > 0)
			{
				num = cryptoStream.Read(array, 0, (int)num7);
				fileStream2.Write(array, 0, num);
				cryptoStream2.Write(array, 0, num);
				num2 += num;
				num3 += num;
			}
			cryptoStream2.Flush();
			cryptoStream2.Close();
			fileStream2.Flush();
			fileStream2.Close();
			new FileInfo(outFile).Attributes = FileAttributes.Hidden;
			byte[] hash = hashAlgorithm.Hash;
			byte[] array4 = new byte[hashAlgorithm.HashSize / 8];
			num = cryptoStream.Read(array4, 0, array4.Length);
			if (array4.Length != num || !CheckByteArrays(array4, hash))
			{
				throw new Exception("file is corrupted!");
			}
		}
		if (num3 != num4)
		{
			throw new Exception("file size mismatch!");
		}
	}
}
public class DleayTask
{
	private long mDelay;

	private DateTime mTimeline;

	private Action<object> mTask;

	private object mArgs;

	private readonly object mTimelineLock = new object();

	private volatile bool mTaskExcuted = true;

	public DleayTask()
	{
		mTimeline = DateTime.Now;
	}

	public void ReplacePrevTaskAndStart(int delay, Action<object> task, object args)
	{
		if (task == null)
		{
			return;
		}
		lock (mTimelineLock)
		{
			mTask = task;
			mArgs = args;
			mDelay = delay;
			mTimeline = DateTime.Now;
			if (!mTaskExcuted)
			{
				return;
			}
			mTaskExcuted = false;
			Task.Run(delegate
			{
				try
				{
					SpinWait spinWait = default(SpinWait);
					Action<object> action = null;
					object obj = null;
					while (true)
					{
						lock (mTimelineLock)
						{
							action = mTask;
							obj = mArgs;
							if ((DateTime.Now - mTimeline).TotalMilliseconds < (double)mDelay)
							{
								break;
							}
						}
						spinWait.SpinOnce();
					}
					action(obj);
				}
				finally
				{
					mTaskExcuted = true;
				}
			});
		}
	}
}
public class DriversHelper
{
	public static readonly Dictionary<string, List<DriverType>> Driver_White_List = new Dictionary<string, List<DriverType>>
	{
		{
			"XT2433",
			new List<DriverType>
			{
				DriverType.Motorola,
				DriverType.Unisoc
			}
		},
		{
			"XT2423",
			new List<DriverType>
			{
				DriverType.Motorola,
				DriverType.MTK
			}
		},
		{
			"XT2425",
			new List<DriverType>
			{
				DriverType.Motorola,
				DriverType.MTK
			}
		}
	};

	private static readonly Dictionary<string, string> MTK_Driver_Mapping = new Dictionary<string, string>
	{
		{
			"cdc-acm",
			Path.Combine(DRIVERS_SAVE_PATH, "MTK_20240103\\CDC\\cdc-acm.inf")
		},
		{
			"android_winusb",
			Path.Combine(DRIVERS_SAVE_PATH, "MTK_20240103\\Android\\android_winusb.inf")
		}
	};

	private static readonly Dictionary<string, string> Motorola_Driver_Mapping = new Dictionary<string, string> { 
	{
		"motoandroid2",
		Path.Combine(DRIVERS_SAVE_PATH, "Motorola\\motoandroid2.inf")
	} };

	private static readonly Dictionary<string, string> Lenovo_Driver_Mapping = new Dictionary<string, string>
	{
		{
			"Lenovo_adb",
			Path.Combine(DRIVERS_SAVE_PATH, "Lenovo_20240103\\ADB\\Lenovo_adb.inf")
		},
		{
			"Lenovo_mdm",
			Path.Combine(DRIVERS_SAVE_PATH, "Lenovo_20240103\\MODEM\\Lenovo_mdm.inf")
		},
		{
			"Lenovo_ser",
			Path.Combine(DRIVERS_SAVE_PATH, "Lenovo_20240103\\SERIAL\\Lenovo_ser.inf")
		}
	};

	private static readonly Dictionary<string, string> Unisoc_Window10_Driver_Mapping = new Dictionary<string, string>
	{
		{
			"DriversForWin10_rdavcom",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\DriversForWin10\\rdavcom.inf")
		},
		{
			"DriversForWin10_sprdadb",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\DriversForWin10\\sprdadb.inf")
		},
		{
			"DriversForWin10_sprdvcom",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\DriversForWin10\\sprdvcom.inf")
		},
		{
			"DriversForWin10_sprdvmdm",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\DriversForWin10\\sprdvmdm.inf")
		}
	};

	private static readonly Dictionary<string, string> Unisoc_Window78_Driver_Mapping = new Dictionary<string, string>
	{
		{
			"DriversForWin78_rdavcom",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\DriversForWin78\\rdavcom.inf")
		},
		{
			"DriversForWin78_sprdadb",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\DriversForWin78\\sprdadb.inf")
		},
		{
			"DriversForWin78_sprdvcom",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\DriversForWin78\\sprdvcom.inf")
		},
		{
			"DriversForWin78_sprdvmdm",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\DriversForWin78\\sprdvmdm.inf")
		}
	};

	private static readonly Dictionary<string, string> Unisoc_L19111_Driver_Mapping = new Dictionary<string, string>
	{
		{
			"L19111drivers_sprdadb",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\L19111drivers\\sprdadb.inf")
		},
		{
			"L19111drivers_sprdvcom",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\L19111drivers\\sprdvcom.inf")
		}
	};

	private static readonly Dictionary<string, string> Unisoc_SPRD_Driver_Mapping = new Dictionary<string, string>
	{
		{
			"SPRD_NPI_drivers_sprdvcom",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\SPRD_NPI_drivers\\sprdvcom.inf")
		},
		{
			"SPRD_NPI_drivers_sprdadb",
			Path.Combine(DRIVERS_SAVE_PATH, "Unisoc\\SPRD_NPI_drivers\\sprdadb.inf")
		}
	};

	private static readonly Dictionary<string, string> PNP_Driver_Mapping = new Dictionary<string, string> { 
	{
		"ElinkAdb_android_winusb",
		Path.Combine(DRIVERS_SAVE_PATH, "Elink\\ADBDriver\\android_winusb.inf")
	} };

	private static readonly Dictionary<string, string> PNP_Window10_Driver_Mapping = new Dictionary<string, string> { 
	{
		"ElinkWin10_rockusb",
		Path.Combine(DRIVERS_SAVE_PATH, "Elink\\Driver\\x64\\win10\\rockusb.inf")
	} };

	private static readonly Dictionary<string, string> PNP_Window78_Driver_Mapping = new Dictionary<string, string> { 
	{
		"ElinkWin7_rockusb",
		Path.Combine(DRIVERS_SAVE_PATH, "Elink\\Driver\\x64\\win7\\rockusb.inf")
	} };

	private static readonly Dictionary<string, string> ADB_Driver_Mapping = new Dictionary<string, string> { 
	{
		"android_winusb",
		Path.Combine(DRIVERS_SAVE_PATH, "ADBDriver\\android_winusb.inf")
	} };

	private static readonly Dictionary<string, string> SmartSilicon_Driver_Mapping = new Dictionary<string, string> { 
	{
		"SmartSilicon_drivers_smsiusb",
		Path.Combine(DRIVERS_SAVE_PATH, "SmarterSilicon\\smsiusb.inf")
	} };

	private static readonly Tuple<DriverType, string, string> Motorola_Driver_Exe_Install_Info = new Tuple<DriverType, string, string>(DriverType.MTK, "Motorola Mobile Drivers Installation 6.4.0", Path.Combine(DRIVERS_SAVE_PATH, "Motorola\\Motorola_End_User_Driver_Installation_6.4.0_64bit.msi"));

	private static readonly Dictionary<DriverType, Dictionary<string, string>> DriverType_Driver_Mapping = new Dictionary<DriverType, Dictionary<string, string>>
	{
		{
			DriverType.MTK,
			MTK_Driver_Mapping
		},
		{
			DriverType.Motorola,
			Motorola_Driver_Mapping
		},
		{
			DriverType.Lenovo,
			Lenovo_Driver_Mapping
		},
		{
			DriverType.Unisoc_Window10,
			Unisoc_Window10_Driver_Mapping
		},
		{
			DriverType.Unisoc_Window78,
			Unisoc_Window78_Driver_Mapping
		},
		{
			DriverType.Unisoc_L19111,
			Unisoc_L19111_Driver_Mapping
		},
		{
			DriverType.Unisoc_SPRD,
			Unisoc_SPRD_Driver_Mapping
		},
		{
			DriverType.PNP,
			PNP_Driver_Mapping
		},
		{
			DriverType.PNP_Window10,
			PNP_Window10_Driver_Mapping
		},
		{
			DriverType.PNP_Window78,
			PNP_Window78_Driver_Mapping
		},
		{
			DriverType.ADBDRIVER,
			ADB_Driver_Mapping
		},
		{
			DriverType.SmarterSilicon,
			SmartSilicon_Driver_Mapping
		}
	};

	public static readonly string PNPUTIL_INSTALL_FORMAT_COMMAND = "pnputil /add-driver \"{0}\" /install";

	private static readonly string DRIVERS_REGISTRY_PATH = "SYSTEM\\Software\\Microsoft\\LmsaDrivers\\drivers";

	private static string DRIVERS_SAVE_PATH => Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "LMSA\\drivers\\");

	[DllImport("USER32.DLL")]
	public static extern bool SetForegroundWindow(IntPtr hWnd);

	public static Dictionary<string, string> GetInfDriver(DriverType drivertype)
	{
		Dictionary<string, string> dictionary;
		if (DriverType.Unisoc == drivertype)
		{
			dictionary = new Dictionary<string, string>(DriverType_Driver_Mapping[DriverType.Unisoc_SPRD]);
			Dictionary<string, string> dictionary2 = ((!IsWindow10Or11()) ? DriverType_Driver_Mapping[DriverType.Unisoc_Window78] : DriverType_Driver_Mapping[DriverType.Unisoc_Window10]);
			foreach (KeyValuePair<string, string> item in dictionary2)
			{
				dictionary.Add(item.Key, item.Value);
			}
		}
		else if (DriverType.PNP == drivertype)
		{
			dictionary = new Dictionary<string, string>(DriverType_Driver_Mapping[DriverType.PNP]);
			Dictionary<string, string> dictionary3 = ((!IsWindow10Or11()) ? DriverType_Driver_Mapping[DriverType.PNP_Window78] : DriverType_Driver_Mapping[DriverType.PNP_Window10]);
			foreach (KeyValuePair<string, string> item2 in dictionary3)
			{
				dictionary.Add(item2.Key, item2.Value);
			}
		}
		else
		{
			dictionary = DriverType_Driver_Mapping[drivertype];
		}
		return dictionary;
	}

	public static bool InstallInfDriver(string file, out string oupput)
	{
		StringBuilder stringBuilder = new StringBuilder();
		bool result = false;
		if (File.Exists(file))
		{
			string text = ExecuteCommand(string.Format(PNPUTIL_INSTALL_FORMAT_COMMAND, file));
			stringBuilder.AppendLine(text);
			result = text != null && text.IndexOf("failed", StringComparison.CurrentCultureIgnoreCase) < 0;
		}
		else
		{
			stringBuilder.AppendLine($"the file: {file} not found");
		}
		oupput = stringBuilder.ToString();
		return result;
	}

	public static bool CheckAndInstallInfDriver(DriverType drivertype, Action confrimAction, out string output)
	{
		Dictionary<string, string> infDriver = GetInfDriver(drivertype);
		bool flag = false;
		StringBuilder stringBuilder = new StringBuilder();
		foreach (KeyValuePair<string, string> item in infDriver)
		{
			if (!CheckDriverInstall(drivertype.ToString(), item.Key))
			{
				flag = InstallInfDriver(item.Value, out var oupput);
				if (flag)
				{
					WriteRegistry(drivertype.ToString(), item.Key, item.Value);
				}
				stringBuilder.Append(oupput);
			}
			else
			{
				flag = true;
				stringBuilder.AppendLine("inf driver: " + item.Value + " already exists");
			}
		}
		output = stringBuilder.ToString();
		return flag;
	}

	public static void InstallDriver(List<string> drivers)
	{
		foreach (string driver in drivers)
		{
			if (File.Exists(driver))
			{
				string text = driver;
				if (Regex.IsMatch(text, "^*.msi$", RegexOptions.IgnoreCase))
				{
					text = "msiexec /i \"" + text + "\"";
				}
				LogHelper.LogInstance.Debug("install driver: " + text);
				ExecuteCommand(text);
			}
			else
			{
				LogHelper.LogInstance.Error("the file: " + driver + " not found");
			}
		}
	}

	public static void InstallDriver(List<Tuple<DriverType, string, string>> drivers, Action confrimAction, Action finisheAction)
	{
		confrimAction?.Invoke();
		foreach (Tuple<DriverType, string, string> driver in drivers)
		{
			if (File.Exists(driver.Item3))
			{
				string text = driver.Item3;
				if (Regex.IsMatch(text, "^*.msi$", RegexOptions.IgnoreCase))
				{
					text = "msiexec /i \"" + text + "\"";
				}
				ExecuteCommand(text);
				if (finisheAction != null)
				{
					finisheAction();
				}
				else
				{
					WriteRegistry(driver.Item1.ToString(), driver.Item2, driver.Item3);
				}
			}
			else
			{
				LogHelper.LogInstance.Error("the file: " + driver.Item3 + " not found");
			}
		}
	}

	public static bool CheckDriverInstall(string subkey, string key)
	{
		GlobalFun.TryGetRegistryKey(RegistryHive.LocalMachine, Path.Combine(DRIVERS_REGISTRY_PATH, subkey), key, out var value);
		if (value == null)
		{
			return false;
		}
		return true;
	}

	public static bool CheckDriverInstall(string displayPattern)
	{
		string name = "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall";
		RegistryKey registryKey = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, RegistryView.Registry64).OpenSubKey(name, RegistryKeyPermissionCheck.ReadWriteSubTree);
		string[] subKeyNames = registryKey.GetSubKeyNames();
		foreach (string name2 in subKeyNames)
		{
			RegistryKey? registryKey2 = registryKey.OpenSubKey(name2);
			object value = registryKey2.GetValue("DisplayName");
			object value2 = registryKey2.GetValue("DisplayVersion");
			if (value != null && Regex.IsMatch(value.ToString(), displayPattern, RegexOptions.IgnoreCase))
			{
				LogHelper.LogInstance.Info($"driver : {value}, version: {value2}");
				return true;
			}
		}
		registryKey = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, RegistryView.Registry32).OpenSubKey(name, RegistryKeyPermissionCheck.ReadWriteSubTree);
		subKeyNames = registryKey.GetSubKeyNames();
		foreach (string name3 in subKeyNames)
		{
			RegistryKey? registryKey3 = registryKey.OpenSubKey(name3);
			object value = registryKey3.GetValue("DisplayName");
			object value2 = registryKey3.GetValue("DisplayVersion");
			if (value != null && Regex.IsMatch(value.ToString(), displayPattern, RegexOptions.IgnoreCase))
			{
				LogHelper.LogInstance.Info($"driver : {value}, version: {value2}");
				return true;
			}
		}
		LogHelper.LogInstance.Info(displayPattern + " driver not exists");
		return false;
	}

	public static void WriteRegistry(string key, string name, object value)
	{
		string text = Path.Combine(DRIVERS_REGISTRY_PATH, key);
		RegistryKey localMachine = Registry.LocalMachine;
		RegistryKey registryKey = localMachine.OpenSubKey(text, RegistryKeyPermissionCheck.ReadWriteSubTree);
		if (registryKey == null)
		{
			registryKey = localMachine.CreateSubKey(text, RegistryKeyPermissionCheck.ReadWriteSubTree);
		}
		registryKey.SetValue(name, value);
	}

	public static string CheckMotorolaDriverExeInstalled(Action<string> _action)
	{
		string name = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall";
		bool flag = false;
		string text = string.Empty;
		using (RegistryKey registryKey = Registry.LocalMachine.OpenSubKey(name))
		{
			string[] subKeyNames = registryKey.GetSubKeyNames();
			foreach (string name2 in subKeyNames)
			{
				object value = registryKey.OpenSubKey(name2).GetValue("DisplayName");
				if (value != null && value.ToString() == Motorola_Driver_Exe_Install_Info.Item2)
				{
					flag = true;
					LogHelper.LogInstance.Info("Motorola driver:[" + Motorola_Driver_Exe_Install_Info.Item2 + "] is installed.");
					text = "Motorola driver:[" + Motorola_Driver_Exe_Install_Info.Item2 + "] is installed.";
					break;
				}
			}
		}
		if (!flag)
		{
			_action("installing");
			LogHelper.LogInstance.Info("Installing Motorola driver:[" + Motorola_Driver_Exe_Install_Info.Item3 + "].");
			text = text + Environment.NewLine + "Installing Motorola driver:[" + Motorola_Driver_Exe_Install_Info.Item3 + "].";
			ExecuteCommand("msiexec /i \"" + Motorola_Driver_Exe_Install_Info.Item3 + "\" /quiet");
			_action("installed");
		}
		return text;
	}

	public static string ExecuteCommand(string command)
	{
		bool Wow64Process = false;
		IsWow64Process(Process.GetCurrentProcess().Handle, out Wow64Process);
		if (Wow64Process)
		{
			IntPtr OldValue = IntPtr.Zero;
			Wow64DisableWow64FsRedirection(out OldValue);
		}
		string result = null;
		try
		{
			command = command.Trim() + " &exit";
			using Process process = new Process();
			process.StartInfo.FileName = Path.Combine(Environment.SystemDirectory, "cmd.exe");
			process.StartInfo.UseShellExecute = false;
			process.StartInfo.RedirectStandardInput = true;
			process.StartInfo.RedirectStandardOutput = true;
			process.StartInfo.RedirectStandardError = true;
			process.StartInfo.CreateNoWindow = true;
			process.StartInfo.Verb = "runas";
			if (process.Start())
			{
				SetForegroundWindow(process.MainWindowHandle);
			}
			process.StandardInput.WriteLine(command);
			process.StandardInput.AutoFlush = true;
			result = process.StandardOutput.ReadToEnd();
			process.WaitForExit();
			process.Close();
			process.Dispose();
		}
		catch (Exception ex)
		{
			LogHelper.LogInstance.Error(ex.ToString());
		}
		return result;
	}

	private static bool IsWindow10Or11()
	{
		GetOsInfo(out var caption, out var _);
		if (!string.IsNullOrEmpty(caption) && Regex.IsMatch(caption, "windows 10", RegexOptions.IgnoreCase))
		{
			return true;
		}
		if (!string.IsNullOrEmpty(caption) && Regex.IsMatch(caption, "windows 11", RegexOptions.IgnoreCase))
		{
			return true;
		}
		return false;
	}

	private static void GetOsInfo(out string caption, out string architecture)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Expected O, but got Unknown
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Expected O, but got Unknown
		caption = null;
		architecture = null;
		ManagementObjectSearcher val = new ManagementObjectSearcher("select * from Win32_OperatingSystem");
		try
		{
			ManagementObjectEnumerator enumerator = val.Get().GetEnumerator();
			try
			{
				if (enumerator.MoveNext())
				{
					ManagementObject val2 = (ManagementObject)enumerator.Current;
					caption = ((ManagementBaseObject)val2)["Caption"].ToString();
					architecture = ((ManagementBaseObject)val2)["OSArchitecture"].ToString();
				}
			}
			finally
			{
				((IDisposable)enumerator)?.Dispose();
			}
		}
		finally
		{
			((IDisposable)val)?.Dispose();
		}
	}

	[DllImport("Kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
	private static extern bool IsWow64Process(IntPtr hProcess, out bool Wow64Process);

	[DllImport("Kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
	private static extern bool Wow64DisableWow64FsRedirection(out IntPtr OldValue);
}
public enum DriverType : uint
{
	MTK = 1u,
	Motorola,
	Lenovo,
	Unisoc,
	Unisoc_Window10,
	Unisoc_Window78,
	Unisoc_L19111,
	Unisoc_SPRD,
	PNP,
	PNP_Window10,
	PNP_Window78,
	ADBDRIVER,
	SmarterSilicon
}
public static class EqualityComparerHelper<T>
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
public class FileHelper
{
	private class SamePathSync
	{
		private ConcurrentDictionary<string, object> map = new ConcurrentDictionary<string, object>();

		public object GetSyncObj(string path)
		{
			object value = null;
			if (map.TryGetValue(path, out value))
			{
				return value;
			}
			value = new object();
			if (!map.TryAdd(path, value))
			{
				map.TryGetValue(path, out value);
			}
			return value;
		}
	}

	private static SamePathSync samePathSync = new SamePathSync();

	public static bool WriteFileWithAesEncrypt(string fileName, string content, FileAttributes fileAttribute = FileAttributes.ReadOnly)
	{
		string text = DefaultOptionsDirectory(fileName);
		lock (samePathSync.GetSyncObj(text))
		{
			bool result = true;
			try
			{
				if (File.Exists(text))
				{
					File.SetAttributes(text, FileAttributes.Normal);
				}
				byte[] array = Security.EncryptWithDPAPI(content);
				using (FileStream fileStream = new FileStream(text, FileMode.Create, FileAccess.ReadWrite))
				{
					fileStream.Write(array, 0, array.Length);
					fileStream.Flush();
				}
				File.SetAttributes(text, fileAttribute);
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"encrypt failed to file: {text},execption: {arg}");
				result = false;
			}
			return result;
		}
	}

	public static string ReadWithAesDecrypt(string fileName)
	{
		string text = DefaultOptionsDirectory(fileName);
		lock (samePathSync.GetSyncObj(text))
		{
			string result = string.Empty;
			if (File.Exists(text))
			{
				try
				{
					using MemoryStream memoryStream = new MemoryStream();
					byte[] array = new byte[4096];
					using (Stream stream = new FileStream(text, FileMode.Open, FileAccess.Read))
					{
						int count;
						while ((count = stream.Read(array, 0, array.Length)) > 0)
						{
							memoryStream.Write(array, 0, count);
						}
					}
					result = Security.DecryptWithDPAPI(memoryStream.ToArray());
				}
				catch (Exception arg)
				{
					LogHelper.LogInstance.Error($"decrypt failed from file: {text}, exception: {arg}");
				}
			}
			return result;
		}
	}

	public static string ReadWithAesDecrypt(string fileName, string key)
	{
		string text = DefaultOptionsDirectory(fileName);
		lock (samePathSync.GetSyncObj(text))
		{
			JObject jObject = JsonHelper.DeserializeJson2Jobjcet(ReadWithAesDecrypt(text));
			if (jObject == null)
			{
				return null;
			}
			if (key == null)
			{
				return jObject.ToString();
			}
			return jObject.Properties().FirstOrDefault((JProperty n) => n.Name == key)?.Value?.ToString();
		}
	}

	public static List<JToken> ReadJtokensWithAesDecrypt(string fileName, string jpath)
	{
		string text = DefaultOptionsDirectory(fileName);
		lock (samePathSync.GetSyncObj(text))
		{
			JObject jObject = JsonHelper.DeserializeJson2Jobjcet(ReadWithAesDecrypt(text));
			if (jObject == null || string.IsNullOrEmpty(jpath))
			{
				return null;
			}
			try
			{
				JToken jToken = jObject.SelectToken(jpath);
				if (jToken != null)
				{
					return new List<JToken> { jToken };
				}
				return null;
			}
			catch (Exception)
			{
				return jObject.SelectTokens(jpath)?.ToList();
			}
		}
	}

	public static T ReadJtokenWithAesDecrypt<T>(string fileName, string jpath, bool isDateAsStr = false)
	{
		string text = DefaultOptionsDirectory(fileName);
		lock (samePathSync.GetSyncObj(text))
		{
			JObject jObject = JsonHelper.DeserializeJson2Jobjcet(ReadWithAesDecrypt(text), isDateAsStr);
			if (jObject == null || string.IsNullOrEmpty(jpath))
			{
				return default(T);
			}
			try
			{
				JToken jToken = jObject.SelectToken(jpath);
				if (jToken == null)
				{
					return default(T);
				}
				return jToken.Value<T>();
			}
			catch (Exception)
			{
				return default(T);
			}
		}
	}

	public static void WriteJsonWithAesEncrypt(string fileName, Dictionary<string, object> properties, bool async = false)
	{
		Task task = Task.Factory.StartNew(delegate
		{
			string path = DefaultOptionsDirectory(fileName);
			using ThreadLocker threadLocker = new ThreadLocker(path, () => ReadWithAesDecrypt1(path, null), delegate(dynamic content)
			{
				FileHelper.WriteFileWithAesEncrypt(path, content);
			});
			dynamic val = threadLocker.Data;
			if (val == null || val["fileversion"] == null || string.IsNullOrWhiteSpace((string)val["fileversion"]))
			{
				val = new JObject();
				val["fileversion"] = 1.0;
			}
			foreach (KeyValuePair<string, object> property in properties)
			{
				if (property.Value != null)
				{
					val[property.Key] = JToken.FromObject(property.Value);
				}
			}
			threadLocker.Data = (object)val.ToString(Formatting.Indented);
		});
		if (!async)
		{
			Task.WaitAll(new Task[1] { task });
		}
	}

	public static void WriteJsonWithAesEncrypt(string fileName, string key, object data, bool async = false)
	{
		WriteJsonWithAesEncrypt(DefaultOptionsDirectory(fileName), new Dictionary<string, object> { { key, data } });
	}

	public static string ReadText(string fileName)
	{
		string path = DefaultOptionsDirectory(fileName);
		lock (samePathSync.GetSyncObj(path))
		{
			try
			{
				return File.ReadAllText(path, Encoding.UTF8);
			}
			catch (IOException)
			{
				try
				{
					using Stream stream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
					using StreamReader streamReader = new StreamReader(stream, Encoding.UTF8);
					return streamReader.ReadToEnd();
				}
				catch (Exception)
				{
					return string.Empty;
				}
			}
		}
	}

	public static void WriteText(string fileName, string text)
	{
		string text2 = DefaultOptionsDirectory(fileName);
		EnsureExists(text2);
		lock (samePathSync.GetSyncObj(text2))
		{
			File.WriteAllText(text2, text, Encoding.UTF8);
		}
	}

	private static dynamic ReadWithAesDecrypt1(string fileName, string key)
	{
		string text = DefaultOptionsDirectory(fileName);
		lock (samePathSync.GetSyncObj(text))
		{
			JObject jObject = JsonHelper.DeserializeJson2Jobjcet(ReadWithAesDecrypt(text));
			if (jObject == null)
			{
				return null;
			}
			if (key == null)
			{
				return jObject;
			}
			return jObject.Properties().FirstOrDefault((JProperty n) => n.Name == key)?.Value;
		}
	}

	private static void EnsureExists(string filePath)
	{
		FileInfo fileInfo = new FileInfo(filePath);
		if (!fileInfo.Directory.Exists)
		{
			Directory.CreateDirectory(fileInfo.Directory.FullName);
		}
	}

	private static string DefaultOptionsDirectory(string fileName)
	{
		return Path.Combine(Configurations.ProgramDataPath, fileName);
	}

	public static List<T> ReadJtokens<T>(string fileName, string jpath)
	{
		string text = DefaultOptionsDirectory(fileName);
		lock (samePathSync.GetSyncObj(text))
		{
			JArray jArray = JsonHelper.DeserializeJson2JArray(ReadText(fileName));
			if (jArray == null || string.IsNullOrEmpty(jpath))
			{
				return null;
			}
			try
			{
				List<T> list = new List<T>();
				foreach (JToken item in jArray.SelectTokens(jpath))
				{
					list.Add(item.ToObject<T>());
				}
				return list;
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"read json failed from file:[{text}], jpath:[{jpath}], exception:[{arg}].");
				return null;
			}
		}
	}
}
public class HugeMemoryStream : Stream
{
	private const int PAGE_SIZE = 1024000;

	private const int ALLOC_STEP = 1024;

	private byte[][] _streamBuffers;

	private int _pageCount;

	private long _allocatedBytes;

	private long _position;

	private long _length;

	public override bool CanRead => true;

	public override bool CanSeek => true;

	public override bool CanWrite => true;

	public override long Length => _length;

	public override long Position
	{
		get
		{
			return _position;
		}
		set
		{
			if (value > _length)
			{
				throw new InvalidOperationException("Position > Length");
			}
			if (value < 0)
			{
				throw new InvalidOperationException("Position < 0");
			}
			_position = value;
		}
	}

	private int GetPageCount(long length)
	{
		int num = (int)(length / 1024000) + 1;
		if (length % 1024000 == 0L)
		{
			num--;
		}
		return num;
	}

	private void ExtendPages()
	{
		if (_streamBuffers == null)
		{
			_streamBuffers = new byte[1024][];
		}
		else
		{
			byte[][] array = new byte[_streamBuffers.Length + 1024][];
			Array.Copy(_streamBuffers, array, _streamBuffers.Length);
			_streamBuffers = array;
		}
		_pageCount = _streamBuffers.Length;
	}

	private void AllocSpaceIfNeeded(long value)
	{
		if (value < 0)
		{
			throw new InvalidOperationException("AllocSpaceIfNeeded < 0");
		}
		if (value == 0L)
		{
			return;
		}
		int pageCount = GetPageCount(_allocatedBytes);
		int pageCount2 = GetPageCount(value);
		while (pageCount < pageCount2)
		{
			if (pageCount == _pageCount)
			{
				ExtendPages();
			}
			_streamBuffers[pageCount++] = new byte[1024000];
		}
		_allocatedBytes = (long)pageCount * 1024000L;
		value = Math.Max(value, _length);
		if (_position > (_length = value))
		{
			_position = _length;
		}
	}

	public override void Flush()
	{
	}

	public override int Read(byte[] buffer, int offset, int count)
	{
		int num = (int)(_position / 1024000);
		int num2 = (int)(_position % 1024000);
		int num3 = 1024000 - num2;
		long position = _position;
		if (position + count > _length)
		{
			count = (int)(_length - position);
		}
		while (count != 0 && _position < _length)
		{
			if (num3 > count)
			{
				num3 = count;
			}
			Array.Copy(_streamBuffers[num++], num2, buffer, offset, num3);
			offset += num3;
			_position += num3;
			count -= num3;
			num2 = 0;
			num3 = 1024000;
		}
		return (int)(_position - position);
	}

	public override long Seek(long offset, SeekOrigin origin)
	{
		switch (origin)
		{
		case SeekOrigin.Current:
			offset += _position;
			break;
		case SeekOrigin.End:
			offset = _length - offset;
			break;
		default:
			throw new ArgumentOutOfRangeException("origin");
		case SeekOrigin.Begin:
			break;
		}
		return Position = offset;
	}

	public override void SetLength(long value)
	{
		if (value < 0)
		{
			throw new InvalidOperationException("SetLength < 0");
		}
		if (value == 0L)
		{
			_streamBuffers = null;
			_allocatedBytes = (_position = (_length = 0L));
			_pageCount = 0;
			return;
		}
		int num = GetPageCount(_allocatedBytes);
		int pageCount = GetPageCount(value);
		while (num > pageCount)
		{
			_streamBuffers[--num] = null;
		}
		AllocSpaceIfNeeded(value);
		if (_position > (_length = value))
		{
			_position = _length;
		}
	}

	public override void Write(byte[] buffer, int offset, int count)
	{
		int num = (int)(_position / 1024000);
		int num2 = (int)(_position % 1024000);
		int num3 = 1024000 - num2;
		_ = _position;
		AllocSpaceIfNeeded(_position + count);
		while (count != 0)
		{
			if (num3 > count)
			{
				num3 = count;
			}
			Array.Copy(buffer, offset, _streamBuffers[num++], num2, num3);
			offset += num3;
			_position += num3;
			count -= num3;
			num2 = 0;
			num3 = 1024000;
		}
	}
}
public sealed class MessageConstant
{
	public sealed class Permission
	{
		public sealed class Modules
		{
			public const string BASIC_INFO = "BasicInfo";

			public const string SET_RING_TONE = "SetRingTone";

			public const string APP = "Apps";

			public const string PICTURE = "Pictures";

			public const string SONG = "Songs";

			public const string VIDEO = "Videos";

			public const string CONTACT = "Contacts";

			public const string CALL_LOG = "CallLogs";

			public const string SMS = "SMS";

			public const string FILE = "File";

			public const string BACKUP = "Backup";

			public const string RESTORE = "Restore";

			public const string SCREEN_RECORD = "ScreenRecord";

			public const string ACCESS_ALL_FILES = "ACCESS_ALL_FILES";
		}

		public sealed class Actions
		{
			public const string CHECK_PERMISSIONS = "checkPermissions";
		}
	}

	public sealed class SMS
	{
		public sealed class Actions
		{
			public const string IS_MESSENGER_APPEXISTED = "isMessengerAppExisted";
		}
	}

	private const string ACTION_RESPONSE_SUFFIX = "Response";

	public static string getResponseAction(string action)
	{
		return action + "Response";
	}
}
public class NetworkCheckHelper
{
	protected System.Timers.Timer LoopDataTimer;

	protected bool NetworkConnected;

	public static event EventHandler<bool> NetworkChanged;

	public NetworkCheckHelper()
	{
		LoopDataTimer = new System.Timers.Timer();
		LoopDataTimer.Elapsed += LoopCheckHandler;
	}

	public void Start(int interval = 5000)
	{
		LoopDataTimer.Interval = interval;
		LoopDataTimer.Enabled = true;
	}

	public void Stop()
	{
		if (LoopDataTimer != null)
		{
			LoopDataTimer.Enabled = false;
			LoopDataTimer = null;
		}
	}

	protected void LoopCheckHandler(object sender, ElapsedEventArgs e)
	{
		string stringFromUrl = GlobalFun.GetStringFromUrl("https://lsa.lenovo.com/lmsa-web/index.jsp");
		bool flag = false;
		if (!string.IsNullOrEmpty(stringFromUrl))
		{
			flag = Regex.IsMatch(stringFromUrl, "Web is running", RegexOptions.IgnoreCase | RegexOptions.Multiline);
		}
		if (flag != NetworkConnected)
		{
			NetworkConnected = !NetworkConnected;
			FireEvent(NetworkConnected);
		}
	}

	protected void FireEvent(bool connected)
	{
		EventHandler<bool> networkChanged = NetworkCheckHelper.NetworkChanged;
		if (networkChanged != null)
		{
			Delegate[] invocationList = networkChanged.GetInvocationList();
			for (int i = 0; i < invocationList.Length; i++)
			{
				((EventHandler<bool>)invocationList[i]).BeginInvoke(this, connected, null, null);
			}
		}
	}
}
public class RandomAesKeyHelper
{
	private readonly byte[] _RandomCodeArr;

	public static RandomAesKeyHelper _Instance;

	public string EncryptCode { get; private set; }

	public static RandomAesKeyHelper Instance
	{
		get
		{
			if (_Instance != null)
			{
				return _Instance;
			}
			return _Instance = new RandomAesKeyHelper();
		}
	}

	private RandomAesKeyHelper()
	{
		EncryptCode = GenerateRandomCode(8);
		_RandomCodeArr = Encoding.UTF8.GetBytes(GetPBKDF2Str(EncryptCode));
	}

	private string GenerateRandomCode(int length)
	{
		char[] array = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ".ToCharArray();
		Random random = new Random();
		char[] array2 = new char[length];
		for (int i = 0; i < length; i++)
		{
			array2[i] = array[random.Next(array.Length)];
		}
		return new string(array2);
	}

	public static string GetPBKDF2Str(string param)
	{
		if (param == null || param.Length != 8)
		{
			return null;
		}
		byte[] bytes = Encoding.UTF8.GetBytes(ConfigurationManager.AppSettings["ConnectionField"]);
		byte[] bytes2 = new Rfc2898DeriveBytes(param, bytes, 1000, HashAlgorithmName.SHA1).GetBytes(8);
		StringBuilder stringBuilder = new StringBuilder();
		byte[] array = bytes2;
		foreach (byte b in array)
		{
			stringBuilder.Append($"{b:X2}");
		}
		return stringBuilder.ToString();
	}

	public byte[] GetKeyBytes(bool isRandomKey = false)
	{
		return Generice(isRandomKey);
	}

	private byte[] Generice(bool isRandomKey = false)
	{
		if (!isRandomKey)
		{
			return Encoding.UTF8.GetBytes("LsdW^19dG1s&Pc*M").ToArray();
		}
		return _RandomCodeArr.ToArray();
	}
}
public class ReadWriteFile
{
	private string _filePath;

	public ReadWriteFile(string filePath)
	{
		_filePath = filePath;
	}

	public dynamic Read()
	{
		if (!GlobalFun.Exists(_filePath))
		{
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary["fileversion"] = 1.0;
			Write(dictionary);
		}
		return JsonHelper.DeserializeJson2ObjcetFromFile<object>(_filePath);
	}

	public void Write(dynamic content)
	{
		JsonHelper.SerializeObject2File(_filePath, content);
	}
}
public class SysSleepManager
{
	[Flags]
	public enum EXECUTION_STATE : uint
	{
		ES_AWAYMODE_REQUIRED = 0x40u,
		ES_CONTINUOUS = 0x80000000u,
		ES_DISPLAY_REQUIRED = 2u,
		ES_SYSTEM_REQUIRED = 1u
	}

	private static AutoResetEvent _event = new AutoResetEvent(initialState: false);

	[DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
	protected static extern EXECUTION_STATE SetThreadExecutionState(EXECUTION_STATE esFlags);

	public static void PreventSleep()
	{
		Task.Factory.StartNew(delegate
		{
			SetThreadExecutionState(EXECUTION_STATE.ES_CONTINUOUS | EXECUTION_STATE.ES_DISPLAY_REQUIRED | EXECUTION_STATE.ES_SYSTEM_REQUIRED);
			_event.WaitOne();
		}, TaskCreationOptions.LongRunning);
	}

	public static void ResetSleep()
	{
		_event.Set();
	}
}
public class ThreadLocker : IDisposable
{
	private object locker = new object();

	private volatile bool disposed;

	private Func<dynamic> getter = () => (dynamic)null;

	private Action<dynamic> setter = delegate
	{
	};

	public dynamic Data
	{
		get
		{
			return getter();
		}
		set
		{
			((Action<object>)setter)(value);
		}
	}

	public ThreadLocker(Func<dynamic> getter)
		: this(null, getter, null)
	{
	}

	public ThreadLocker(Action<dynamic> setter)
		: this(null, null, setter)
	{
	}

	public ThreadLocker(object locker, Func<dynamic> getter, Action<dynamic> setter)
	{
		if (locker != null)
		{
			this.locker = locker;
		}
		Monitor.Enter(this.locker);
		this.getter = getter;
		this.setter = setter;
	}

	public void Close()
	{
		Dispose();
	}

	public void Dispose()
	{
		Dispose(disposing: true);
	}

	private void Dispose(bool disposing)
	{
		if (!disposed && disposing)
		{
			Monitor.Exit(locker);
		}
		disposed = true;
	}
}
public class TimedCache<Tkey, TValue>
{
	private SortedList<Tkey, TValue> _Cache = new SortedList<Tkey, TValue>();

	private SortedList<Tkey, DateTime> _Expirations = new SortedList<Tkey, DateTime>();

	public TValue this[Tkey key]
	{
		get
		{
			lock (this)
			{
				Refresh();
				if (_Cache.ContainsKey(key))
				{
					return _Cache[key];
				}
				return default(TValue);
			}
		}
	}

	public int Count
	{
		get
		{
			lock (this)
			{
				Refresh();
				return _Cache.Count;
			}
		}
	}

	public IList<Tkey> Keys
	{
		get
		{
			lock (this)
			{
				Refresh();
				return _Cache.Keys;
			}
		}
	}

	public IList<TValue> Values
	{
		get
		{
			lock (this)
			{
				Refresh();
				return _Cache.Values;
			}
		}
	}

	public void Add(Tkey key, TValue value)
	{
		Add(key, value, TimeSpan.FromDays(30.0));
	}

	public void Add(Tkey key, TValue value, TimeSpan expiration)
	{
		lock (this)
		{
			Refresh();
			_Expirations[key] = DateTime.Now.Add(expiration);
			_Cache[key] = value;
		}
	}

	public void Remove(Tkey key)
	{
		lock (this)
		{
			if (_Expirations.ContainsKey(key))
			{
				_Expirations.Remove(key);
			}
			if (_Cache.ContainsKey(key))
			{
				_Cache.Remove(key);
			}
		}
	}

	public IEnumerator<KeyValuePair<Tkey, TValue>> GetEnumerator()
	{
		lock (this)
		{
			Refresh();
			return _Cache.GetEnumerator();
		}
	}

	public bool ContainsKey(Tkey key)
	{
		lock (this)
		{
			Refresh();
			return _Cache.ContainsKey(key);
		}
	}

	public void Clear()
	{
		lock (this)
		{
			_Cache.Clear();
			_Expirations.Clear();
		}
	}

	private void Refresh()
	{
		List<Tkey> list = new List<Tkey>();
		foreach (Tkey key in _Expirations.Keys)
		{
			DateTime value = _Expirations[key];
			if (DateTime.Now.CompareTo(value) > 0)
			{
				list.Add(key);
			}
		}
		foreach (Tkey item in list)
		{
			_Cache.Remove(item);
			_Expirations.Remove(item);
		}
	}
}
public enum HardwareEnum
{
	Win32_Processor,
	Win32_PhysicalMemory,
	Win32_Keyboard,
	Win32_PointingDevice,
	Win32_FloppyDrive,
	Win32_DiskDrive,
	Win32_CDROMDrive,
	Win32_BaseBoard,
	Win32_BIOS,
	Win32_ParallelPort,
	Win32_SerialPort,
	Win32_SerialPortConfiguration,
	Win32_SoundDevice,
	Win32_SystemSlot,
	Win32_USBController,
	Win32_NetworkAdapter,
	Win32_NetworkAdapterConfiguration,
	Win32_Printer,
	Win32_PrinterConfiguration,
	Win32_PrintJob,
	Win32_TCPIPPrinterPort,
	Win32_POTSModem,
	Win32_POTSModemToSerialPort,
	Win32_DesktopMonitor,
	Win32_DisplayConfiguration,
	Win32_DisplayControllerConfiguration,
	Win32_VideoController,
	Win32_VideoSettings,
	Win32_TimeZone,
	Win32_SystemDriver,
	Win32_DiskPartition,
	Win32_LogicalDisk,
	Win32_LogicalDiskToPartition,
	Win32_LogicalMemoryConfiguration,
	Win32_PageFile,
	Win32_PageFileSetting,
	Win32_BootConfiguration,
	Win32_ComputerSystem,
	Win32_OperatingSystem,
	Win32_StartupCommand,
	Win32_Service,
	Win32_Group,
	Win32_GroupUser,
	Win32_UserAccount,
	Win32_Process,
	Win32_Thread,
	Win32_Share,
	Win32_NetworkClient,
	Win32_NetworkProtocol,
	Win32_PnPEntity
}
public class HardwareHelper
{
	public class Com
	{
		public struct DEV_BROADCAST_HDR
		{
			public uint dbch_size;

			public uint dbch_devicetype;

			public uint dbch_reserved;
		}

		protected struct DEV_BROADCAST_PORT_Fixed
		{
			public uint dbcp_size;

			public uint dbcp_devicetype;

			public uint dbcp_reserved;
		}

		public const int WM_DEVICE_CHANGE = 537;

		public const int DBT_DEVICEARRIVAL = 32768;

		public const int DBT_DEVICE_REMOVE_COMPLETE = 32772;

		public const uint DBT_DEVTYP_PORT = 3u;

		public static string GetComPortName(IntPtr wParam, IntPtr lParam)
		{
			if (((DEV_BROADCAST_HDR)Marshal.PtrToStructure(lParam, typeof(DEV_BROADCAST_HDR))).dbch_devicetype == 3)
			{
				return Marshal.PtrToStringUni(IntPtr.Add(lParam, Marshal.SizeOf(typeof(DEV_BROADCAST_PORT_Fixed))));
			}
			return string.Empty;
		}
	}

	public static string GetHardwareInfo(HardwareEnum hardType, string propKey, string valKeyWords)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Expected O, but got Unknown
		new List<string>();
		ManagementObjectSearcher val = null;
		try
		{
			val = new ManagementObjectSearcher("select * from " + hardType);
		}
		catch (Exception)
		{
			return string.Empty;
		}
		finally
		{
			if (val != null)
			{
				try
				{
					((Component)(object)val).Dispose();
				}
				catch (Exception)
				{
				}
			}
		}
		return string.Empty;
	}

	public static Rectangle GetPosition(Window win)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Invalid comparison between Unknown and I4
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		if ((int)win.WindowState != 2)
		{
			return new Rectangle((int)win.Left, (int)win.Top, (int)((FrameworkElement)win).ActualWidth, (int)((FrameworkElement)win).ActualHeight);
		}
		_ = ((FrameworkElement)win).ActualWidth;
		_ = ((FrameworkElement)win).ActualHeight;
		return Screen.FromHandle(new WindowInteropHelper(win).Handle).WorkingArea;
	}
}
public class UserConfigHleper
{
	private string fileName;

	private string langRoot;

	private static UserConfigHleper instance;

	public SysConfig Config { get; private set; }

	public static UserConfigHleper Instance => instance ?? (instance = new UserConfigHleper());

	public string LangRoot => langRoot;

	public string ConfigReadyLang => Config.ReadyLang;

	public string ConfigLanguage => Config.Language;

	public string ConfigBackupPath
	{
		get
		{
			try
			{
				if (!Directory.Exists(Config.BackupPath))
				{
					Directory.CreateDirectory(Config.BackupPath);
				}
			}
			catch
			{
			}
			return Config.BackupPath;
		}
	}

	public string ConfigGifSavePath => Config.GifSavePath;

	private UserConfigHleper()
	{
		InitializeContext();
		InitializeUserConfig();
	}

	private void InitializeContext()
	{
		string currentDirectory = Environment.CurrentDirectory;
		fileName = Path.Combine(currentDirectory, LMSAContext.USER_CONFIG_FILE);
		langRoot = Path.Combine(currentDirectory, LMSAContext.LANGUAGE);
	}

	private void InitializeUserConfig()
	{
		if (File.Exists(fileName))
		{
			Config = XmlSerializeHelper.DeserializeFromFile<SysConfig>(fileName) as SysConfig;
		}
	}

	public void SetCurrentLanguage(string selectLanguage)
	{
		Config.Language = selectLanguage;
		Config.ReadyLang = selectLanguage;
		GlobalFun.WriteRegistryKey("Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Rescue and Smart Assistant", "NSIS:language", LMSAContext.GetLanguageId(selectLanguage));
		XmlSerializeHelper.Serializer<SysConfig>(fileName, Config, FileShare.Write);
	}

	public void SetReadyLanguage(string selectLanguage)
	{
		Config = XmlSerializeHelper.DeserializeFromFile<SysConfig>(fileName) as SysConfig;
		Config.ReadyLang = selectLanguage;
		XmlSerializeHelper.Serializer<SysConfig>(fileName, Config, FileShare.Write);
	}

	public void SetBackUpPath(string selectpath)
	{
		Config = XmlSerializeHelper.DeserializeFromFile<SysConfig>(fileName) as SysConfig;
		Config.BackupPath = selectpath;
		XmlSerializeHelper.Serializer<SysConfig>(fileName, Config, FileShare.Write);
	}

	public void SetGifSavePath(string selectpath)
	{
		Config = XmlSerializeHelper.DeserializeFromFile<SysConfig>(fileName) as SysConfig;
		Config.GifSavePath = selectpath;
		XmlSerializeHelper.Serializer<SysConfig>(fileName, Config, FileShare.Write);
	}

	public void UpdateBackUpPathConfig(string key, string value)
	{
		PropertyInfo[] properties = Config.GetType().GetProperties();
		foreach (PropertyInfo propertyInfo in properties)
		{
			if (propertyInfo.PropertyType == typeof(string))
			{
				propertyInfo.GetValue(Config, null);
				_ = propertyInfo.Name;
			}
		}
		XmlSerializeHelper.Serializer<SysConfig>(fileName, Config, FileShare.Write);
	}

	public void MigrateDataToOptions()
	{
		try
		{
			if (File.Exists(fileName))
			{
				Configurations.BackupPath = Config.BackupPath;
				Configurations.GifSavePath = Config.GifSavePath;
				GlobalFun.TryDeleteFile(fileName);
			}
		}
		catch (Exception exception)
		{
			LogHelper.LogInstance.Error("migrate old data(user_config.xml) error:", exception);
		}
	}
}
[StructLayout(LayoutKind.Sequential, Size = 1)]
public struct ResourceFileType
{
	public const string ROM = "ROM";

	public const string APK = "APK";

	public const string TOOL = "TOOL";

	public const string ICON = "ICON";

	public const string COUNTRYCODE = "COUNTRYCODE";

	public const string JSON = "JSON";

	public const string BANNER = "BANNER";

	public const string XAML = "XAML";

	public const string UNKNOWN = "UNKNOWN";
}
public class Configurations
{
	private static string _DownloadPath = DefaultDownloadPath;

	private static string _BackupPath = DefaultBackupPath;

	private static DateTime _BackupLastDateTime = DateTime.MinValue;

	private static string _GifSavePath = DefaultGifSavePath;

	private static string _languageVersion = DefaultLanguageVersion;

	private static string serviceBaseUrl;

	private static readonly object serviceBaseUrlLock = new object();

	private static string serviceInterfaceUrl = string.Empty;

	private static string _baseHttpUrl = string.Empty;

	private static int _apkVersionCode = 1;

	public static string _qrCodeDownloadMaUrl = "";

	private static readonly string ProdPath = "https://download.lenovo.com/lsa/";

	private static readonly string DevPath = "https://download.lenovo.com/lsa/Staging/Resource/MA/";

	private static int _minMaApkVersionCode = 0;

	private static string _ProgramDataPath = null;

	private static Dictionary<bool, int> _RescueResultMap = new Dictionary<bool, int>
	{
		{ true, 0 },
		{ false, 0 }
	};

	public const long TRANSFER_FILE_MAX_SIZE = 4294967296L;

	public static string TRANSFER_FILE_ERROR_TXT_PATH = Path.Combine(TempDir, "larger_max_size_file_list.txt");

	public static string ToolPath => Path.Combine(DownloadPath, "ToolFiles\\");

	public static string RomsPath => Path.Combine(DownloadPath, "RomFiles\\");

	public static string ApkPath => Path.Combine(DownloadPath, "ApkFiles\\");

	public static string IconPath => Path.Combine(DownloadPath, "IconFiles\\");

	public static string CountryCodePath => Path.Combine(DownloadPath, "CountryCodeFiles\\");

	public static string JsonPath => Path.Combine(DownloadPath, "JsonFiles\\");

	public static string BannerPath => Path.Combine(DownloadPath, "BannerFiles\\");

	public static string XamlPath => Path.Combine(DownloadPath, "XamlFiles\\");

	public static string UnknownPath => Path.Combine(DownloadPath, "UnknownFiles\\");

	public static string DownloadingSavePath => Path.Combine(DownloadInfoSavePath, "download_resources.json");

	public static string DownloadedSavePath => Path.Combine(DownloadInfoSavePath, "downloaded_resources.json");

	public static string DownloadedMatchPath => Path.Combine(DownloadInfoSavePath, "downloaded_match.json");

	public static string DownloadSpeedPath => Path.Combine(DownloadInfoSavePath, "speed.json.dpapi");

	public static string NoticesPath => Path.Combine(ProgramDataPath, "notices.json.dpapi");

	public static string RescueManualMatchFile => "rescueddevice.json.dpapi";

	public static string DefaultOptionsFileName => "options.json.dpapi";

	public static string RescueRecordsFile => "flashrecords.json.dpapi";

	public static string UserRequestRecordsFile => "user_request_records.json.dpapi";

	public static string AppCacheDir => Path.Combine(ProgramDataPath, "App");

	public static string AppIconCacheDir => Path.Combine(ProgramDataPath, "AppIcon");

	public static string PicCacheDir => Path.Combine(ProgramDataPath, "Pic");

	public static string PicOriginalCacheDir => Path.Combine(ProgramDataPath, "PicOriginal");

	public static string MusicCacheDir => Path.Combine(ProgramDataPath, "Music");

	public static string VideoCacheDir => Path.Combine(ProgramDataPath, "Video");

	public static string ContactCacheDir => Path.Combine(ProgramDataPath, "Contact");

	public static string PhoneBackupCacheDir
	{
		get
		{
			string text = Path.Combine(ProgramDataPath, "Backup");
			if (!Directory.Exists(text))
			{
				Directory.CreateDirectory(text);
			}
			return text;
		}
	}

	public static string ScreencapDir => Path.Combine(ProgramDataPath, "Screencap");

	public static string TempDir
	{
		get
		{
			string text = Path.Combine(ProgramDataPath, "Temp");
			if (!Directory.Exists(text))
			{
				Directory.CreateDirectory(text);
			}
			return text;
		}
	}

	public static string ProgramDataPath
	{
		get
		{
			if (_ProgramDataPath == null)
			{
				_ProgramDataPath = Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData);
				_ProgramDataPath = Path.Combine(_ProgramDataPath, "LMSA");
				if (StorageDirName != null && StorageDirName != string.Empty)
				{
					_ProgramDataPath = Path.Combine(_ProgramDataPath, StorageDirName);
				}
			}
			return _ProgramDataPath;
		}
	}

	public static string ProgramDataRSARootPath => Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "RSA");

	public static string ChromiumLogFilePath { get; set; }

	public static string DownloadInfoSavePath
	{
		get
		{
			string text = Path.Combine(ProgramDataPath, "Download");
			if (!Directory.Exists(text))
			{
				Directory.CreateDirectory(text);
			}
			return text;
		}
	}

	public static string DefaultDownloadPath
	{
		get
		{
			string text = FileHelper.ReadWithAesDecrypt(DefaultOptionsFileName, "downloadpath");
			if (text == null)
			{
				text = Path.Combine(ProgramDataRSARootPath, "Download");
			}
			return text;
		}
	}

	public static string DownloadPath
	{
		get
		{
			return _DownloadPath;
		}
		set
		{
			if (!(_DownloadPath == value))
			{
				_DownloadPath = value;
				GlobalFun.WriteRegistryKey("Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Rescue and Smart Assistant", "downloadpath", value);
				FileHelper.WriteJsonWithAesEncrypt(DefaultOptionsFileName, "downloadpath", value);
			}
		}
	}

	private static string DefaultBackupPath
	{
		get
		{
			string text = FileHelper.ReadWithAesDecrypt(DefaultOptionsFileName, "BackupPath");
			if (text == null)
			{
				text = Path.Combine(ProgramDataRSARootPath, "Backup");
			}
			if (!Directory.Exists(text))
			{
				Directory.CreateDirectory(text);
			}
			return text;
		}
	}

	public static string BackupPath
	{
		get
		{
			if (!Directory.Exists(_BackupPath))
			{
				Directory.CreateDirectory(_BackupPath);
			}
			return _BackupPath;
		}
		set
		{
			if (!(_BackupPath == value))
			{
				_BackupPath = value;
				FileHelper.WriteJsonWithAesEncrypt(DefaultOptionsFileName, "BackupPath", value);
			}
		}
	}

	public static DateTime BackupLastDateTime
	{
		get
		{
			if (_BackupLastDateTime == DateTime.MinValue)
			{
				string text = FileHelper.ReadWithAesDecrypt(DefaultOptionsFileName, "BackupLastDateTime");
				if (!string.IsNullOrEmpty(text))
				{
					try
					{
						_BackupLastDateTime = Convert.ToDateTime(text);
					}
					catch
					{
						LogHelper.LogInstance.Error("Configuration BackupLastDateTime:[" + text + "] error.");
					}
				}
			}
			return _BackupLastDateTime;
		}
		set
		{
			if (!(_BackupLastDateTime == value))
			{
				_BackupLastDateTime = value;
				FileHelper.WriteJsonWithAesEncrypt(DefaultOptionsFileName, "BackupLastDateTime", value.ToString("yyyy-MM-dd HH:mm:ss"));
			}
		}
	}

	private static string DefaultGifSavePath
	{
		get
		{
			string text = FileHelper.ReadWithAesDecrypt(DefaultOptionsFileName, "GifSavePath");
			if (text == null)
			{
				text = Path.Combine(ProgramDataRSARootPath, "Gif");
			}
			if (!Directory.Exists(text))
			{
				Directory.CreateDirectory(text);
			}
			return text;
		}
	}

	public static string GifSavePath
	{
		get
		{
			if (!Directory.Exists(_GifSavePath))
			{
				Directory.CreateDirectory(_GifSavePath);
			}
			return _GifSavePath;
		}
		set
		{
			if (!(_GifSavePath == value))
			{
				_GifSavePath = value;
				FileHelper.WriteJsonWithAesEncrypt(DefaultOptionsFileName, "GifSavePath", value);
			}
		}
	}

	private static string DefaultLanguageVersion
	{
		get
		{
			string text = FileHelper.ReadWithAesDecrypt(DefaultOptionsFileName, "LanguagePackageVersion");
			if (text != null && text.Split(new char[1] { '_' })[0] == LMSAContext.MainProcessVersion)
			{
				return text;
			}
			return LMSAContext.MainProcessVersion + "_0";
		}
	}

	public static int LanguagePackageVersion
	{
		get
		{
			return Convert.ToInt32(_languageVersion.Split(new char[1] { '_' })[1]);
		}
		set
		{
			string text = $"{LMSAContext.MainProcessVersion}_{value}";
			if (!(_languageVersion == text))
			{
				_languageVersion = text;
				FileHelper.WriteJsonWithAesEncrypt(DefaultOptionsFileName, "LanguagePackageVersion", text);
			}
		}
	}

	public static Dictionary<string, string> FileSaveLocalPath => new Dictionary<string, string>
	{
		{ "ROM", RomsPath },
		{ "APK", ApkPath },
		{ "TOOL", ToolPath },
		{ "ICON", IconPath },
		{ "COUNTRYCODE", CountryCodePath },
		{ "JSON", JsonPath },
		{ "BANNER", BannerPath },
		{ "XAML", XamlPath },
		{ "UNKNOWN", UnknownPath }
	};

	public static string AdbPath => Path.Combine(".", "adb.exe");

	public static string RescueFailedLogPath => Path.Combine(".", "rescuefailedtmp.log");

	public static string FastbootPath => Path.Combine(".", "fastboot.exe");

	public static string SevenZipDllPath => Path.Combine(".", "7zSharp", Environment.Is64BitProcess ? "7z64.dll" : "7z.dll");

	public static bool IsReleaseVersion => "https://lsa.lenovo.com".Equals(ServiceBaseUrl, StringComparison.InvariantCultureIgnoreCase);

	public static string ServiceBaseUrl
	{
		get
		{
			if (string.IsNullOrEmpty(serviceBaseUrl))
			{
				lock (serviceBaseUrlLock)
				{
					serviceBaseUrl = GetExecuteConfig().AppSettings.Settings["BaseHttpUrl"].Value.TrimEnd(new char[1] { '/' });
				}
			}
			return serviceBaseUrl;
		}
	}

	public static string ServiceInterfaceUrl
	{
		get
		{
			if (string.IsNullOrEmpty(serviceInterfaceUrl))
			{
				serviceInterfaceUrl = ServiceBaseUrl + "/Interface";
			}
			return serviceInterfaceUrl;
		}
	}

	public static string BaseHttpUrl
	{
		get
		{
			if (string.IsNullOrEmpty(_baseHttpUrl))
			{
				_baseHttpUrl = GetExecuteConfig().AppSettings.Settings["BaseHttpUrl"].Value;
			}
			return _baseHttpUrl;
		}
	}

	public static int AppVersionCode
	{
		get
		{
			if (_apkVersionCode != 1)
			{
				return _apkVersionCode;
			}
			int.TryParse(ConfigurationManager.AppSettings["ApkVersionCode"], out _apkVersionCode);
			return _apkVersionCode;
		}
		set
		{
			Configuration executeConfig = GetExecuteConfig();
			executeConfig.AppSettings.Settings["ApkVersionCode"].Value = value.ToString();
			executeConfig.Save((ConfigurationSaveMode)1);
			_apkVersionCode = value;
		}
	}

	public static string QrCodeDownloadMaUrl
	{
		get
		{
			if (string.IsNullOrEmpty(_qrCodeDownloadMaUrl))
			{
				return QrCodeDownloadMaUrl_Version;
			}
			if (!QrCodeUtility.IsUrlAccessible(_qrCodeDownloadMaUrl))
			{
				return QrCodeDownloadMaUrl_Version;
			}
			return _qrCodeDownloadMaUrl;
		}
		set
		{
			_qrCodeDownloadMaUrl = value;
		}
	}

	public static string QrCodeDownloadMaUrl_Version
	{
		get
		{
			if (IsReleaseVersion)
			{
				return $"{ProdPath}ma.apk";
			}
			return $"{DevPath}ma{AppVersionCode}.apk";
		}
	}

	public static int DefaultAppMinVersionCodeOfMotoStr
	{
		get
		{
			string text = ConfigurationManager.AppSettings["MotoApkMinVersionCode"];
			if (text != null)
			{
				return int.Parse(text);
			}
			return 0;
		}
	}

	public static int AppMinVersionCodeOfMoto { get; set; } = DefaultAppMinVersionCodeOfMotoStr;

	public static string MotoHelperSecurityVersion => ConfigurationManager.AppSettings["MotoHelperSecurityVersion"];

	public static string MotoApkRandomKeyVersion => ConfigurationManager.AppSettings["MotoApkRandomKeyVersion"];

	public static int ConnectedVersionCodeOfMA { get; set; }

	public static bool IsOldBackupFile { get; set; }

	public static bool IsOldBackupRestore
	{
		get
		{
			if (ConnectedVersionCodeOfMA != 0)
			{
				return ConnectedVersionCodeOfMA < 45000;
			}
			return false;
		}
	}

	public static int AppMinVersionCodeOfMA
	{
		get
		{
			if (_minMaApkVersionCode > 0)
			{
				return _minMaApkVersionCode;
			}
			int.TryParse(ConfigurationManager.AppSettings["MAApkMinVersionCode"], out _minMaApkVersionCode);
			return _minMaApkVersionCode;
		}
		set
		{
			Configuration executeConfig = GetExecuteConfig();
			executeConfig.AppSettings.Settings["MAApkMinVersionCode"].Value = value.ToString();
			executeConfig.Save((ConfigurationSaveMode)1);
			_minMaApkVersionCode = value;
		}
	}

	public static string StorageDirName { get; set; }

	private static bool defaultAppdomain => AppDomain.CurrentDomain.IsDefaultAppDomain();

	public static Dictionary<bool, int> RescueResultMap => _RescueResultMap;

	private static Configuration GetExecuteConfig()
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Expected O, but got Unknown
		if (AppDomain.CurrentDomain.IsDefaultAppDomain())
		{
			return ConfigurationManager.OpenExeConfiguration((ConfigurationUserLevel)0);
		}
		return ConfigurationManager.OpenMappedExeConfiguration(new ExeConfigurationFileMap
		{
			ExeConfigFilename = "./Software Fix.exe.config"
		}, (ConfigurationUserLevel)0);
	}

	public static void AddRescueResult(bool success)
	{
		_RescueResultMap[success] = ++_RescueResultMap[success];
	}

	public static void ResetRescueResultMap()
	{
		_RescueResultMap = new Dictionary<bool, int>
		{
			{ true, 0 },
			{ false, 0 }
		};
	}
}
public sealed class ContainerManager : IDisposable
{
	private ConcurrentDictionary<string, object> Container;

	private static readonly ContainerManager m_Instance = new ContainerManager();

	public static ContainerManager Instance => m_Instance;

	public void RegisterService(string key, object value)
	{
		if (!Container.ContainsKey(key))
		{
			Container.TryAdd(key, value);
		}
	}

	public T GetService<T>(string key)
	{
		T result = default(T);
		try
		{
			result = (T)Container[key];
			return result;
		}
		catch (Exception)
		{
		}
		return result;
	}

	private ContainerManager()
	{
		Container = new ConcurrentDictionary<string, object>();
	}

	public void Dispose()
	{
		if (Container != null)
		{
			Container.Clear();
			Container = null;
		}
	}
}
public enum SerialNumberType
{
	Unknown,
	Imei,
	Meid,
	Msn,
	Hsn
}
public class CustomConvert
{
	private const string MEID_IMEI = "^(99)([0-9]{12,13})$";

	private const string IMEI = "^[0-9]{14,15}$";

	private const string MEID = "^[0-9A-F]{14,15}$";

	private const string MSN = "^[0-9A-Z]{10}$";

	private const string HSN = "^[0-9A-Z]{11}$";

	private static CustomConvert _instance;

	public static CustomConvert Instance
	{
		get
		{
			if (_instance != null)
			{
				return _instance;
			}
			return _instance = new CustomConvert();
		}
	}

	public string BytesToHex(byte[] bytes)
	{
		return BitConverter.ToString(bytes).Replace("-", string.Empty);
	}

	public byte[] HexToBytes(string hex)
	{
		int length = hex.Length;
		byte[] array = new byte[length / 2];
		for (int i = 0; i < length; i += 2)
		{
			array[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
		}
		return array;
	}

	public byte[] LongToBytes(long value)
	{
		return ValueToBytes(value, 8);
	}

	public byte[] IntToBytes(int value)
	{
		return ValueToBytes((uint)value, 4);
	}

	public byte[] UShortToBytes(ushort value)
	{
		return ValueToBytes(value, 2);
	}

	public long BytesToLong(byte[] value)
	{
		return BytesToValue(value, 8);
	}

	public int BytesToInt(byte[] value)
	{
		return (int)BytesToValue(value, 4);
	}

	public ushort BytesToUShort(byte[] value)
	{
		return (ushort)BytesToValue(value, 2);
	}

	private byte[] ValueToBytes(long value, int expectedBytes)
	{
		byte[] bytes = BitConverter.GetBytes(value);
		if (BitConverter.IsLittleEndian)
		{
			Array.Reverse((Array)bytes);
		}
		for (int i = 0; i < bytes.Length - expectedBytes; i++)
		{
			if (bytes[i] != 0)
			{
				throw new OverflowException($"Value size of {value} is larger than {expectedBytes} bytes");
			}
		}
		byte[] array = new byte[expectedBytes];
		Array.Copy(bytes, bytes.Length - expectedBytes, array, 0, expectedBytes);
		return array;
	}

	private long BytesToValue(byte[] value, int expectedBytes)
	{
		if (value.Length > expectedBytes)
		{
			for (int i = 0; i < value.Length - expectedBytes; i++)
			{
				if (value[i] != 0)
				{
					throw new OverflowException($"Value size of {value.Length} is larger than {expectedBytes} bytes");
				}
			}
		}
		else if (value.Length < expectedBytes)
		{
			expectedBytes = value.Length;
		}
		byte[] array = new byte[8];
		Array.Copy(value, value.Length - expectedBytes, array, array.Length - expectedBytes, expectedBytes);
		if (BitConverter.IsLittleEndian)
		{
			Array.Reverse((Array)array);
		}
		return BitConverter.ToInt64(array, 0);
	}

	public byte[] AsciiToBytes(string asciiString)
	{
		return Encoding.UTF8.GetBytes(asciiString);
	}

	public string BytesToAscii(byte[] asciiBytes)
	{
		return Encoding.UTF8.GetString(asciiBytes);
	}

	public byte[] Base64ToBytes(string base64)
	{
		return Convert.FromBase64String(base64);
	}

	public string BytesToBase64(byte[] bytes)
	{
		return Convert.ToBase64String(bytes);
	}

	public string LongToBase26(long value)
	{
		int num = 65;
		List<char> list = new List<char>();
		do
		{
			char item = (char)((int)(value % 26) + num);
			list.Insert(0, item);
			value /= 26;
		}
		while (value >= 1);
		return new string(list.ToArray());
	}

	public long Base26ToLong(string base26)
	{
		int num = 65;
		long num2 = 0L;
		for (int i = 0; i < base26.Length; i++)
		{
			int num3 = base26[base26.Length - 1 - i];
			num3 -= num;
			int num4 = (int)Math.Pow(26.0, i);
			num2 += num3 * num4;
		}
		return num2;
	}

	public byte[] StreamToBytes(Stream stream)
	{
		using MemoryStream memoryStream = new MemoryStream();
		MemoryStream memoryStream2 = memoryStream;
		if (typeof(MemoryStream).IsAssignableFrom(stream.GetType()))
		{
			memoryStream2 = (MemoryStream)stream;
		}
		else
		{
			CustomFile.Instance.CopyStream(stream, memoryStream2);
		}
		return memoryStream2.ToArray();
	}

	public Stream BytesToStream(byte[] bytes)
	{
		return new MemoryStream(bytes);
	}

	public List<EnumType> EnumToValues<EnumType>() where EnumType : struct, IConvertible
	{
		List<EnumType> list = new List<EnumType>();
		foreach (object value in Enum.GetValues(typeof(EnumType)))
		{
			list.Add((EnumType)value);
		}
		return list;
	}

	public string TimeSpanToDisplay(TimeSpan time)
	{
		string text = " years";
		string text2 = " year";
		string text3 = " days";
		string text4 = " day";
		string text5 = " hours";
		string text6 = " hour";
		string text7 = " minutes";
		string text8 = " minute";
		string text9 = " seconds";
		string text10 = " second";
		string text11 = " milliseconds";
		string text12 = " millisecond";
		int num = time.Days / 365;
		int num2 = time.Days % 365;
		string text13 = string.Empty;
		if (num > 0)
		{
			text13 += num;
			text13 = ((num <= 1) ? (text13 + text2) : (text13 + text));
			text13 += " ";
		}
		if (num2 > 0)
		{
			text13 += num2;
			text13 = ((num2 <= 1) ? (text13 + text4) : (text13 + text3));
			text13 += " ";
		}
		if (time.Hours > 0 && num < 1)
		{
			text13 += time.Hours;
			text13 = ((time.Hours <= 1) ? (text13 + text6) : (text13 + text5));
			text13 += " ";
		}
		if (time.Minutes > 0 && time.TotalDays < 1.0)
		{
			text13 += time.Minutes;
			text13 = ((time.Minutes <= 1) ? (text13 + text8) : (text13 + text7));
			text13 += " ";
		}
		if (time.Seconds > 0 && time.TotalMinutes < 5.0)
		{
			text13 += time.Seconds;
			text13 = ((time.Seconds <= 1) ? (text13 + text10) : (text13 + text9));
			text13 += " ";
		}
		if (time.TotalSeconds < 1.0)
		{
			text13 += time.Milliseconds;
			text13 = ((time.Milliseconds <= 1) ? (text13 + text12) : (text13 + text11));
			text13 += " ";
		}
		return text13.TrimEnd(Array.Empty<char>());
	}

	public int TwosComplement(int data)
	{
		if (data > 32768)
		{
			data -= 65536;
		}
		return data;
	}

	public byte[] ByteSwap(byte[] bytes)
	{
		byte[] array = new byte[bytes.Length];
		Array.Copy(bytes, array, bytes.Length);
		Array.Reverse((Array)array);
		return array;
	}

	public string ToString(string name, IEnumerable<KeyValuePair<string, object>> fields)
	{
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.AppendLine(name);
		foreach (KeyValuePair<string, object> field in fields)
		{
			stringBuilder.Append("    ");
			stringBuilder.Append(field.Key);
			stringBuilder.Append(": ");
			if (field.Value != null)
			{
				stringBuilder.AppendLine(field.Value.ToString());
			}
			else
			{
				stringBuilder.AppendLine("[NULL]");
			}
		}
		return stringBuilder.ToString();
	}

	public string ToCommaSeparated(IEnumerable list)
	{
		string text = string.Empty;
		foreach (object item in list)
		{
			text = text + item.ToString() + ",";
		}
		return text.TrimEnd(new char[1] { ',' });
	}

	public string ToStatusText(string message, double percentageComplete)
	{
		string result = message;
		if (percentageComplete > 0.0 && percentageComplete < 100.0)
		{
			int num = (int)Math.Round(percentageComplete);
			result = $"{message} {num}% complete";
		}
		return result;
	}

	public bool IsSerialNumberValid(string serialNumber)
	{
		if (ToSerialNumberType(serialNumber) == SerialNumberType.Unknown)
		{
			return false;
		}
		return serialNumber.ToLowerInvariant() == CalculateCheckDigit(serialNumber).ToLowerInvariant();
	}

	public string CalculateCheckDigit(string serialNumber)
	{
		serialNumber = serialNumber.Trim();
		SerialNumberType serialNumberType = ToSerialNumberType(serialNumber);
		if (serialNumberType == SerialNumberType.Imei || RegMatch(serialNumber, "^(99)([0-9]{12,13})$"))
		{
			string text = serialNumber;
			if (text.Length > 14)
			{
				text = text.Substring(0, 14);
			}
			int num = 0;
			List<char> list = new List<char>();
			for (int i = 1; i < text.Length; i += 2)
			{
				string text2 = (int.Parse(text[i].ToString()) * 2).ToString();
				list.AddRange(text2.ToCharArray());
			}
			for (int j = 0; j < text.Length; j += 2)
			{
				list.Add(text[j]);
			}
			foreach (char item3 in list)
			{
				num += int.Parse(item3.ToString());
			}
			num %= 10;
			if (num != 0)
			{
				num = 10 - num;
			}
			return text + num;
		}
		switch (serialNumberType)
		{
		case SerialNumberType.Meid:
		{
			char[] array = serialNumber.ToCharArray(0, 14);
			List<char> list2 = new List<char>();
			for (int k = 1; k <= array.Length; k++)
			{
				char item = array[k - 1];
				if (k % 2 == 0)
				{
					byte b = byte.Parse(item.ToString(), NumberStyles.HexNumber);
					char[] array2 = ((byte)(b + b)).ToString("X").ToCharArray();
					foreach (char item2 in array2)
					{
						list2.Add(item2);
					}
				}
				else
				{
					list2.Add(item);
				}
			}
			int num2 = 0;
			foreach (char item4 in list2)
			{
				num2 += byte.Parse(item4.ToString(), NumberStyles.HexNumber);
			}
			int num3 = num2 % 16;
			if (num3 != 0)
			{
				num3 = 16 - num3;
			}
			string text3 = num3.ToString("X");
			return new string(array) + text3;
		}
		case SerialNumberType.Msn:
		case SerialNumberType.Hsn:
			return serialNumber;
		default:
			throw new NotSupportedException("Check digit calculation not supported for " + serialNumberType.ToString() + " ('" + serialNumber + "')");
		}
	}

	public SerialNumberType ToSerialNumberType(string serialNumber)
	{
		if (RegMatch(serialNumber, "^(99)([0-9]{12,13})$"))
		{
			return SerialNumberType.Meid;
		}
		if (RegMatch(serialNumber, "^[0-9]{14,15}$"))
		{
			return SerialNumberType.Imei;
		}
		if (RegMatch(serialNumber, "^[0-9A-F]{14,15}$"))
		{
			return SerialNumberType.Meid;
		}
		if (RegMatch(serialNumber, "^[0-9A-Z]{10}$"))
		{
			return SerialNumberType.Msn;
		}
		if (RegMatch(serialNumber, "^[0-9A-Z]{11}$"))
		{
			return SerialNumberType.Hsn;
		}
		return SerialNumberType.Unknown;
	}

	private bool RegMatch(string input, string pattern)
	{
		return Regex.IsMatch(input, pattern);
	}

	public string ByteArrayToString(byte[] ba)
	{
		StringBuilder stringBuilder = new StringBuilder(ba.Length * 2);
		foreach (byte b in ba)
		{
			stringBuilder.AppendFormat("{0:x2}", b);
		}
		return stringBuilder.ToString();
	}

	public byte[] StringToByteArray(string hex)
	{
		return (from x in Enumerable.Range(0, hex.Length)
			where x % 2 == 0
			select Convert.ToByte(hex.Substring(x, 2), 16)).ToArray();
	}
}
public class CustomFile
{
	private static CustomFile _instance;

	private string TAG => GetType().FullName;

	public static CustomFile Instance
	{
		get
		{
			if (_instance != null)
			{
				return _instance;
			}
			return _instance = new CustomFile();
		}
	}

	public string StorageDirName { get; set; }

	public Stream ReadStream(string filePath)
	{
		return new FileStream(filePath, FileMode.Open, FileAccess.Read);
	}

	public Stream WriteStream(string filePath)
	{
		return WriteStream(filePath, FileMode.Create);
	}

	public Stream WriteStream(string filePath, FileMode mode)
	{
		EnsureExists(filePath);
		return new FileStream(filePath, mode, FileAccess.Write);
	}

	public void CopyStream(Stream input, Stream output)
	{
		byte[] array = new byte[4096];
		int count;
		while ((count = input.Read(array, 0, array.Length)) > 0)
		{
			output.Write(array, 0, count);
		}
	}

	public void CopyStream(Stream input, Stream output, Func<byte[], byte[]> modifier)
	{
		byte[] array = new byte[4096];
		int num;
		while ((num = input.Read(array, 0, array.Length)) > 0)
		{
			byte[] array2 = array;
			if (modifier != null)
			{
				if (array2.Length != num)
				{
					array2 = new byte[num];
					Array.Copy(array, array2, num);
				}
				array2 = modifier(array2);
			}
			output.Write(array2, 0, num);
		}
	}

	public string ReadText(string filePath)
	{
		try
		{
			return File.ReadAllText(filePath, Encoding.UTF8);
		}
		catch
		{
			using Stream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
			using StreamReader streamReader = new StreamReader(stream, Encoding.UTF8);
			return streamReader.ReadToEnd();
		}
	}

	public void WriteText(string filePath, string text)
	{
		EnsureExists(filePath);
		File.WriteAllText(filePath, text, Encoding.UTF8);
	}

	public string Uuid()
	{
		return Guid.NewGuid().ToString("N").ToLowerInvariant();
	}

	public string TempFolder()
	{
		string text = string.Empty;
		do
		{
			string text2 = PathJoin(Path.GetTempPath(), Uuid());
			if (!Exists(text2))
			{
				text = text2;
			}
		}
		while (text == string.Empty);
		return text;
	}

	public string PathJoin(string path1, string path2)
	{
		return Path.Combine(path1, path2);
	}

	public bool Exists(string path)
	{
		if (!File.Exists(path))
		{
			return Directory.Exists(path);
		}
		return true;
	}

	public long FileSize(string path)
	{
		if (!Exists(path))
		{
			return -1L;
		}
		return new FileInfo(path).Length;
	}

	public void Delete(string path)
	{
		File.Delete(path);
	}

	public void Remove(string folderPath)
	{
		Directory.Delete(folderPath, recursive: true);
	}

	public void MirrorFiles(string sourcePath, string destinationPath)
	{
		if (!Exists(sourcePath))
		{
			throw new DirectoryNotFoundException("Could not find " + sourcePath);
		}
		DirectoryInfo directoryInfo = new DirectoryInfo(sourcePath);
		DirectoryInfo directoryInfo2 = new DirectoryInfo(destinationPath);
		if (!directoryInfo2.Exists)
		{
			directoryInfo2.Create();
		}
		foreach (string item in FindFiles("*.*", directoryInfo.FullName, recursive: true))
		{
			FileInfo fileInfo = new FileInfo(item);
			if (!item.StartsWith(directoryInfo.FullName))
			{
				continue;
			}
			string text = item.Substring(directoryInfo.FullName.Length);
			string text2 = directoryInfo2.FullName + text;
			if (Exists(text2))
			{
				FileInfo fileInfo2 = new FileInfo(text2);
				if (fileInfo2.Length == fileInfo.Length && fileInfo2.LastWriteTime.Equals(fileInfo.LastWriteTime))
				{
					continue;
				}
			}
			EnsureExists(text2);
			fileInfo.CopyTo(text2, overwrite: true);
		}
	}

	public List<string> FindFiles(string searchPattern, string path, bool recursive)
	{
		List<string> list = new List<string>();
		SearchOption searchOption = SearchOption.TopDirectoryOnly;
		if (recursive)
		{
			searchOption = SearchOption.AllDirectories;
		}
		DirectoryInfo directoryInfo = new DirectoryInfo(path);
		if (!directoryInfo.Exists)
		{
			return list;
		}
		FileInfo[] files = directoryInfo.GetFiles(searchPattern, searchOption);
		foreach (FileInfo fileInfo in files)
		{
			list.Add(fileInfo.FullName);
		}
		list.Sort();
		return list;
	}

	private void EnsureExists(string filePath)
	{
		FileInfo fileInfo = new FileInfo(filePath);
		if (!fileInfo.Directory.Exists)
		{
			Directory.CreateDirectory(fileInfo.Directory.FullName);
		}
	}

	public void FileCopy(string source, string destination, bool overwrite)
	{
		File.Copy(source, destination, overwrite);
	}
}
public delegate ReturnType Checker<ReturnType>();
public class CustomThread
{
	private static CustomThread _instance;

	public static CustomThread Instance
	{
		get
		{
			if (_instance != null)
			{
				return _instance;
			}
			return _instance = new CustomThread();
		}
	}

	public void Run(ThreadStart task)
	{
		Run(task, setSta: false);
	}

	public void Run(ThreadStart task, bool setSta)
	{
		RunThread(task, setSta);
	}

	public void Run<ReturnValue>(Func<ReturnValue> task, Action<ReturnValue> callback)
	{
		Run(task, callback, setSta: false);
	}

	public void Run<ReturnValue>(Func<ReturnValue> task, Action<ReturnValue> callback, bool setSta)
	{
		ThreadStart task2 = delegate
		{
			ReturnValue obj = task();
			callback(obj);
		};
		Run(task2, setSta);
	}

	public ReturnValue RunAndWait<ReturnValue>(Func<ReturnValue> task)
	{
		return RunAndWait(task, setSta: false);
	}

	public ReturnValue RunAndWait<ReturnValue>(Func<ReturnValue> task, bool setSta)
	{
		ReturnValue returned = default(ReturnValue);
		ThreadStart task2 = delegate
		{
			returned = task();
		};
		RunThread(task2, setSta).Join();
		return returned;
	}

	public Thread RunThread(ThreadStart task)
	{
		return RunThread(task, setSta: false);
	}

	public Thread RunThread(ThreadStart task, bool setSta)
	{
		Thread thread = new Thread((ThreadStart)delegate
		{
			try
			{
				task();
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("Unhandled exception in thread: ", exception);
			}
		});
		thread.IsBackground = true;
		if (setSta)
		{
			thread.SetApartmentState(ApartmentState.STA);
		}
		thread.Start();
		return thread;
	}

	public void Wait(TimeSpan waitTime)
	{
		Wait(waitTime, null);
	}

	public bool Wait(TimeSpan waitTime, Checker<bool> returnIfTrue)
	{
		return Wait(waitTime, returnIfTrue, valueToWaitFor: true);
	}

	public ReturnType Wait<ReturnType>(TimeSpan waitTime, Checker<ReturnType> checker, ReturnType valueToWaitFor)
	{
		DateTime now = DateTime.Now;
		ReturnType result = default(ReturnType);
		while (DateTime.Now.Subtract(now).TotalMilliseconds < waitTime.TotalMilliseconds)
		{
			if (checker != null)
			{
				result = checker();
				if (result.Equals(valueToWaitFor))
				{
					return result;
				}
			}
		}
		return result;
	}

	public Checker<ReturnType> AddDelay<ReturnType>(Checker<ReturnType> checker, ReturnType valueToWaitFor, TimeSpan delay)
	{
		return () => DelayedCheck(checker, valueToWaitFor, delay);
	}

	private ReturnType DelayedCheck<ReturnType>(Checker<ReturnType> checker, ReturnType valueToWaitFor, TimeSpan delay)
	{
		ReturnType result = checker();
		if (!result.Equals(valueToWaitFor))
		{
			Wait(delay);
		}
		return result;
	}
}
public class GlobalCmdData
{
	public GlobalCmdType type;
}
public class GlobalCmdHelper : ICommand
{
	private static GlobalCmdHelper instance;

	public Action AutoCloseUsbConnectTutorial;

	public Action CloseRescueDlgEvent;

	public Action CloseGuidStepDlgEvent;

	public Action CloseRescueHelpEvent;

	public Action CloseWifiTutorialEvent;

	public Action<string> OnDelRomAfterRescue;

	public Action<List<string>> OnDelRomAfterRescueRetry;

	public Action<bool> ReadDevieInfoCallback;

	public Action TabletOpenUsbDebugCallback;

	public static GlobalCmdHelper Instance => instance ?? (instance = new GlobalCmdHelper());

	public event Action<bool> SwitchDeviceEventHander;

	public event EventHandler CanExecuteChanged
	{
		add
		{
			CommandManager.RequerySuggested += value;
		}
		remove
		{
			CommandManager.RequerySuggested -= value;
		}
	}

	public bool CanExecute(object parameter)
	{
		return true;
	}

	public void Execute(dynamic param)
	{
		if (param.type == GlobalCmdType.SWITCHDEVICE)
		{
			if (this.SwitchDeviceEventHander != null)
			{
				this.SwitchDeviceEventHander(param.data);
			}
		}
		else if (param.type == GlobalCmdType.AUTO_CLOSE_USB_CONN_TUTORIAL)
		{
			AutoCloseUsbConnectTutorial?.Invoke();
		}
		else if (param.type == GlobalCmdType.CLOSE_RESCUE_DIALOG)
		{
			CloseRescueDlgEvent?.Invoke();
		}
		else if (param.type == GlobalCmdType.DELETE_ROM_AFTER_RESCUE)
		{
			OnDelRomAfterRescue?.Invoke(param.data);
		}
		else if (param.type == GlobalCmdType.DELETE_ROM_AFTER_RESCUE_RETRY)
		{
			OnDelRomAfterRescueRetry?.Invoke(param.data);
		}
		else if (param.type == GlobalCmdType.CLOSE_GUID_SETP_DIALOG)
		{
			CloseGuidStepDlgEvent?.Invoke();
		}
		else if (param.type == GlobalCmdType.CLOSE_RESCUE_HELP)
		{
			CloseRescueHelpEvent?.Invoke();
		}
		else if (param.type == GlobalCmdType.CLOSE_WIFI_TUTORIAL)
		{
			CloseWifiTutorialEvent?.Invoke();
		}
		else if (param.type == GlobalCmdType.READ_DEVICEINFO_CALLBACK)
		{
			ReadDevieInfoCallback?.Invoke(param.data);
		}
		else if (param.type == GlobalCmdType.TABLET_OPEN_USBDEBUG)
		{
			TabletOpenUsbDebugCallback?.Invoke();
		}
	}
}
public enum GlobalCmdType
{
	SWITCHDEVICE,
	AUTO_CLOSE_USB_CONN_TUTORIAL,
	CLOSE_RESCUE_DIALOG,
	DELETE_ROM_AFTER_RESCUE,
	DELETE_ROM_AFTER_RESCUE_RETRY,
	CLOSE_GUID_SETP_DIALOG,
	CLOSE_RESCUE_HELP,
	CLOSE_WIFI_TUTORIAL,
	READ_DEVICEINFO_CALLBACK,
	TABLET_OPEN_USBDEBUG
}
public class ImageHandle
{
	public static void CutForSquare(string fromFile, string fileSaveUrl, int side, int quality)
	{
		//IL_0121: Unknown result type (might be due to invalid IL or missing references)
		//IL_0128: Expected O, but got Unknown
		//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Expected O, but got Unknown
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		//IL_006d: Expected O, but got Unknown
		//IL_01de: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e5: Expected O, but got Unknown
		//IL_01f4: Unknown result type (might be due to invalid IL or missing references)
		//IL_01fa: Expected O, but got Unknown
		//IL_010b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0111: Expected O, but got Unknown
		string directoryName = Path.GetDirectoryName(fileSaveUrl);
		if (!Directory.Exists(directoryName))
		{
			Directory.CreateDirectory(directoryName);
		}
		Image val = Image.FromFile(fromFile, true);
		ImageFormat rawFormat = val.RawFormat;
		if (val.Width <= side && val.Height <= side)
		{
			val.Save(fileSaveUrl, rawFormat);
			return;
		}
		int num = val.Width;
		int num2 = val.Height;
		if (num != num2)
		{
			Image val2 = null;
			Graphics val3 = null;
			if (num > num2)
			{
				val2 = (Image)new Bitmap(num2, num2);
				val3 = Graphics.FromImage(val2);
				val3.InterpolationMode = (InterpolationMode)7;
				val3.SmoothingMode = (SmoothingMode)2;
				Rectangle rectangle = new Rectangle((num - num2) / 2, 0, num2, num2);
				Rectangle rectangle2 = new Rectangle(0, 0, num2, num2);
				val3.DrawImage(val, rectangle2, rectangle, (GraphicsUnit)2);
				num = num2;
			}
			else
			{
				val2 = (Image)new Bitmap(num, num);
				val3 = Graphics.FromImage(val2);
				val3.InterpolationMode = (InterpolationMode)7;
				val3.SmoothingMode = (SmoothingMode)2;
				Rectangle rectangle3 = new Rectangle(0, (num2 - num) / 2, num, num);
				Rectangle rectangle4 = new Rectangle(0, 0, num, num);
				val3.DrawImage(val, rectangle4, rectangle3, (GraphicsUnit)2);
				num2 = num;
			}
			val = (Image)val2.Clone();
			val3.Dispose();
			val2.Dispose();
		}
		Image val4 = (Image)new Bitmap(side, side);
		Graphics val5 = Graphics.FromImage(val4);
		val5.InterpolationMode = (InterpolationMode)7;
		val5.SmoothingMode = (SmoothingMode)2;
		val5.Clear(Color.White);
		val5.DrawImage(val, new Rectangle(0, 0, side, side), new Rectangle(0, 0, num, num2), (GraphicsUnit)2);
		ImageCodecInfo[] imageEncoders = ImageCodecInfo.GetImageEncoders();
		ImageCodecInfo val6 = null;
		ImageCodecInfo[] array = imageEncoders;
		foreach (ImageCodecInfo val7 in array)
		{
			if (val7.MimeType == "image/jpeg" || val7.MimeType == "image/bmp" || val7.MimeType == "image/png" || val7.MimeType == "image/gif")
			{
				val6 = val7;
			}
		}
		EncoderParameters val8 = new EncoderParameters(1);
		val8.Param[0] = new EncoderParameter(Encoder.Quality, (long)quality);
		val4.Save(fileSaveUrl, val6, val8);
		val8.Dispose();
		val5.Dispose();
		val4.Dispose();
		val.Dispose();
	}

	public static void CutForCustom(string fromFile, string fileSaveUrl, int maxWidth, int maxHeight, int quality)
	{
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Expected O, but got Unknown
		//IL_0185: Unknown result type (might be due to invalid IL or missing references)
		//IL_018c: Expected O, but got Unknown
		//IL_00d5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00dc: Expected O, but got Unknown
		//IL_023a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0241: Expected O, but got Unknown
		//IL_0303: Unknown result type (might be due to invalid IL or missing references)
		//IL_030a: Expected O, but got Unknown
		//IL_031a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0320: Expected O, but got Unknown
		Image val = Image.FromFile(fromFile, true);
		ImageFormat rawFormat = val.RawFormat;
		if (val.Width <= maxWidth && val.Height <= maxHeight)
		{
			val.Save(fileSaveUrl, rawFormat);
		}
		else
		{
			double num = (double)maxWidth / (double)maxHeight;
			double num2 = (double)val.Width / (double)val.Height;
			if (num == num2)
			{
				Bitmap val2 = new Bitmap(maxWidth, maxHeight);
				Graphics obj = Graphics.FromImage((Image)val2);
				obj.InterpolationMode = (InterpolationMode)2;
				obj.SmoothingMode = (SmoothingMode)2;
				obj.Clear(Color.White);
				obj.DrawImage(val, new Rectangle(0, 0, maxWidth, maxHeight), new Rectangle(0, 0, val.Width, val.Height), (GraphicsUnit)2);
				((Image)val2).Save(fileSaveUrl, rawFormat);
			}
			else
			{
				Image val3 = null;
				Graphics val4 = null;
				Rectangle rectangle = new Rectangle(0, 0, 0, 0);
				Rectangle rectangle2 = new Rectangle(0, 0, 0, 0);
				if (num > num2)
				{
					val3 = (Image)new Bitmap(val.Width, (int)Math.Floor((double)val.Width / num));
					val4 = Graphics.FromImage(val3);
					rectangle.X = 0;
					rectangle.Y = (int)Math.Floor(((double)val.Height - (double)val.Width / num) / 2.0);
					rectangle.Width = val.Width;
					rectangle.Height = (int)Math.Floor((double)val.Width / num);
					rectangle2.X = 0;
					rectangle2.Y = 0;
					rectangle2.Width = val.Width;
					rectangle2.Height = (int)Math.Floor((double)val.Width / num);
				}
				else
				{
					val3 = (Image)new Bitmap((int)Math.Floor((double)val.Height * num), val.Height);
					val4 = Graphics.FromImage(val3);
					rectangle.X = (int)Math.Floor(((double)val.Width - (double)val.Height * num) / 2.0);
					rectangle.Y = 0;
					rectangle.Width = (int)Math.Floor((double)val.Height * num);
					rectangle.Height = val.Height;
					rectangle2.X = 0;
					rectangle2.Y = 0;
					rectangle2.Width = (int)Math.Floor((double)val.Height * num);
					rectangle2.Height = val.Height;
				}
				val4.InterpolationMode = (InterpolationMode)7;
				val4.SmoothingMode = (SmoothingMode)2;
				val4.DrawImage(val, rectangle2, rectangle, (GraphicsUnit)2);
				Image val5 = (Image)new Bitmap(maxWidth, maxHeight);
				Graphics val6 = Graphics.FromImage(val5);
				val6.InterpolationMode = (InterpolationMode)2;
				val6.SmoothingMode = (SmoothingMode)2;
				val6.Clear(Color.White);
				val6.DrawImage(val3, new Rectangle(0, 0, maxWidth, maxHeight), new Rectangle(0, 0, val3.Width, val3.Height), (GraphicsUnit)2);
				ImageCodecInfo[] imageEncoders = ImageCodecInfo.GetImageEncoders();
				ImageCodecInfo val7 = null;
				ImageCodecInfo[] array = imageEncoders;
				foreach (ImageCodecInfo val8 in array)
				{
					if (val8.MimeType == "image/jpeg" || val8.MimeType == "image/bmp" || val8.MimeType == "image/png" || val8.MimeType == "image/gif")
					{
						val7 = val8;
					}
				}
				EncoderParameters val9 = new EncoderParameters(1);
				val9.Param[0] = new EncoderParameter(Encoder.Quality, (long)quality);
				val5.Save(fileSaveUrl, val7, val9);
				val6.Dispose();
				val5.Dispose();
				val4.Dispose();
				val3.Dispose();
			}
		}
		val.Dispose();
	}

	public static void ZoomAuto(string fromFile, string savePath, double targetWidth, double targetHeight)
	{
		ZoomAuto(fromFile, savePath, targetWidth, targetHeight, "", "");
	}

	public static void ZoomAuto(string fromFile, string savePath, double targetWidth, double targetHeight, string watermarkText, string watermarkImage)
	{
		//IL_028b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0292: Expected O, but got Unknown
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0065: Expected O, but got Unknown
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0071: Expected O, but got Unknown
		//IL_0309: Unknown result type (might be due to invalid IL or missing references)
		//IL_0310: Expected O, but got Unknown
		//IL_0315: Unknown result type (might be due to invalid IL or missing references)
		//IL_031c: Expected O, but got Unknown
		//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f2: Expected O, but got Unknown
		//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f9: Expected O, but got Unknown
		//IL_0193: Unknown result type (might be due to invalid IL or missing references)
		//IL_019a: Expected O, but got Unknown
		//IL_039d: Unknown result type (might be due to invalid IL or missing references)
		//IL_03a4: Expected O, but got Unknown
		//IL_03a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_03ab: Expected O, but got Unknown
		//IL_0445: Unknown result type (might be due to invalid IL or missing references)
		//IL_044c: Expected O, but got Unknown
		string directoryName = Path.GetDirectoryName(savePath);
		if (!Directory.Exists(directoryName))
		{
			Directory.CreateDirectory(directoryName);
		}
		Image val = Image.FromFile(fromFile, true);
		ImageFormat rawFormat = val.RawFormat;
		if ((double)val.Width <= targetWidth && (double)val.Height <= targetHeight)
		{
			if (watermarkText != "")
			{
				Graphics val2 = Graphics.FromImage(val);
				try
				{
					Font val3 = new Font("黑体", 10f);
					Brush val4 = (Brush)new SolidBrush(Color.White);
					val2.DrawString(watermarkText, val3, val4, 10f, 10f);
					val2.Dispose();
				}
				finally
				{
					((IDisposable)val2)?.Dispose();
				}
			}
			if (watermarkImage != "" && File.Exists(watermarkImage))
			{
				Image val5 = Image.FromFile(watermarkImage);
				try
				{
					if (val.Width >= val5.Width && val.Height >= val5.Height)
					{
						Graphics val6 = Graphics.FromImage(val);
						ImageAttributes val7 = new ImageAttributes();
						ColorMap val8 = new ColorMap();
						val8.OldColor = Color.FromArgb(255, 0, 255, 0);
						val8.NewColor = Color.FromArgb(0, 0, 0, 0);
						ColorMap[] array = (ColorMap[])(object)new ColorMap[1] { val8 };
						val7.SetRemapTable(array, (ColorAdjustType)1);
						ColorMatrix val9 = new ColorMatrix(new float[5][]
						{
							new float[5] { 1f, 0f, 0f, 0f, 0f },
							new float[5] { 0f, 1f, 0f, 0f, 0f },
							new float[5] { 0f, 0f, 1f, 0f, 0f },
							new float[5] { 0f, 0f, 0f, 0.5f, 0f },
							new float[5] { 0f, 0f, 0f, 0f, 1f }
						});
						val7.SetColorMatrix(val9, (ColorMatrixFlag)0, (ColorAdjustType)1);
						val6.DrawImage(val5, new Rectangle(val.Width - val5.Width, val.Height - val5.Height, val5.Width, val5.Height), 0, 0, val5.Width, val5.Height, (GraphicsUnit)2, val7);
						val6.Dispose();
					}
					val5.Dispose();
				}
				finally
				{
					((IDisposable)val5)?.Dispose();
				}
			}
			val.Save(savePath, rawFormat);
			return;
		}
		double num = val.Width;
		double num2 = val.Height;
		if (val.Width > val.Height || val.Width == val.Height)
		{
			if ((double)val.Width > targetWidth)
			{
				num = targetWidth;
				num2 = (double)val.Height * (targetWidth / (double)val.Width);
			}
		}
		else if ((double)val.Height > targetHeight)
		{
			num2 = targetHeight;
			num = (double)val.Width * (targetHeight / (double)val.Height);
		}
		Image val10 = (Image)new Bitmap((int)num, (int)num2);
		Graphics val11 = Graphics.FromImage(val10);
		val11.InterpolationMode = (InterpolationMode)7;
		val11.SmoothingMode = (SmoothingMode)2;
		val11.Clear(Color.White);
		val11.DrawImage(val, new Rectangle(0, 0, val10.Width, val10.Height), new Rectangle(0, 0, val.Width, val.Height), (GraphicsUnit)2);
		if (watermarkText != "")
		{
			Graphics val12 = Graphics.FromImage(val10);
			try
			{
				Font val13 = new Font("宋体", 10f);
				Brush val14 = (Brush)new SolidBrush(Color.White);
				val12.DrawString(watermarkText, val13, val14, 10f, 10f);
				val12.Dispose();
			}
			finally
			{
				((IDisposable)val12)?.Dispose();
			}
		}
		if (watermarkImage != "" && File.Exists(watermarkImage))
		{
			Image val15 = Image.FromFile(watermarkImage);
			try
			{
				if (val10.Width >= val15.Width && val10.Height >= val15.Height)
				{
					Graphics val16 = Graphics.FromImage(val10);
					ImageAttributes val17 = new ImageAttributes();
					ColorMap val18 = new ColorMap();
					val18.OldColor = Color.FromArgb(255, 0, 255, 0);
					val18.NewColor = Color.FromArgb(0, 0, 0, 0);
					ColorMap[] array2 = (ColorMap[])(object)new ColorMap[1] { val18 };
					val17.SetRemapTable(array2, (ColorAdjustType)1);
					ColorMatrix val19 = new ColorMatrix(new float[5][]
					{
						new float[5] { 1f, 0f, 0f, 0f, 0f },
						new float[5] { 0f, 1f, 0f, 0f, 0f },
						new float[5] { 0f, 0f, 1f, 0f, 0f },
						new float[5] { 0f, 0f, 0f, 0.5f, 0f },
						new float[5] { 0f, 0f, 0f, 0f, 1f }
					});
					val17.SetColorMatrix(val19, (ColorMatrixFlag)0, (ColorAdjustType)1);
					val16.DrawImage(val15, new Rectangle(val10.Width - val15.Width, val10.Height - val15.Height, val15.Width, val15.Height), 0, 0, val15.Width, val15.Height, (GraphicsUnit)2, val17);
					val16.Dispose();
				}
				val15.Dispose();
			}
			finally
			{
				((IDisposable)val15)?.Dispose();
			}
		}
		val10.Save(savePath, rawFormat);
		val11.Dispose();
		val10.Dispose();
		val.Dispose();
	}

	public static bool IsWebImage(string contentType)
	{
		switch (contentType)
		{
		case "image/pjpeg":
		case "image/jpeg":
		case "image/gif":
		case "image/bmp":
		case "image/png":
			return true;
		default:
			return false;
		}
	}
}
public class JsonFormat
{
	private static string SPACE = "    ";

	private static string NEWLINE = "\r\n";

	public static string Format(string json)
	{
		StringBuilder stringBuilder = new StringBuilder();
		int length = json.Length;
		int num = 0;
		char c = ' ';
		for (int i = 0; i < length; i++)
		{
			c = json[i];
			switch (c)
			{
			case '[':
			case '{':
				if (i - 1 > 0 && json[i - 1] == ':')
				{
					stringBuilder.Append(NEWLINE);
					stringBuilder.Append(indent(num));
				}
				stringBuilder.Append(c);
				stringBuilder.Append(NEWLINE);
				num++;
				stringBuilder.Append(indent(num));
				break;
			case ']':
			case '}':
				stringBuilder.Append(NEWLINE);
				num--;
				stringBuilder.Append(indent(num));
				stringBuilder.Append(c);
				if (i + 1 < length && json[i + 1] != ',')
				{
					stringBuilder.Append(NEWLINE);
				}
				break;
			case ',':
				stringBuilder.Append(c);
				stringBuilder.Append(NEWLINE);
				stringBuilder.Append(indent(num));
				break;
			default:
				stringBuilder.Append(c);
				break;
			}
		}
		return stringBuilder.ToString();
	}

	public static string GetJsonString(object obj)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return new JavaScriptSerializer().Serialize(obj);
	}

	public static T GetObject<T>(string json)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return new JavaScriptSerializer().Deserialize<T>(json);
	}

	private static string indent(int number)
	{
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < number; i++)
		{
			stringBuilder.Append(SPACE);
		}
		return stringBuilder.ToString();
	}
}
public class JsonHelper
{
	public static string SerializeObject2Json(object obj)
	{
		try
		{
			return JsonConvert.SerializeObject(obj);
		}
		catch (Exception ex)
		{
			LogHelper.LogInstance.Error("serialize object to json failed, exception: " + ex);
			return string.Empty;
		}
	}

	public static string SerializeObject2JsonExceptNull(object obj)
	{
		try
		{
			JsonSerializerSettings settings = new JsonSerializerSettings
			{
				NullValueHandling = NullValueHandling.Ignore
			};
			return JsonConvert.SerializeObject(obj, settings);
		}
		catch (Exception ex)
		{
			LogHelper.LogInstance.Error("serialize object to json failed, exception: " + ex);
			return string.Empty;
		}
	}

	public static string SerializeObject2FormatJson(object obj)
	{
		try
		{
			return JsonConvert.SerializeObject(obj, Formatting.Indented);
		}
		catch (Exception ex)
		{
			LogHelper.LogInstance.Error("serialize object to json failed, exception: " + ex);
			return string.Empty;
		}
	}

	public static T DeserializeObject2OT<T>(object obj)
	{
		try
		{
			return JsonConvert.DeserializeObject<T>(JsonConvert.SerializeObject(obj, Formatting.Indented));
		}
		catch (Exception)
		{
			return default(T);
		}
	}

	public static T DeserializeJson2Object<T>(string json) where T : class, new()
	{
		if (string.IsNullOrEmpty(json))
		{
			return null;
		}
		try
		{
			return JsonConvert.DeserializeObject<T>(WebUtility.HtmlDecode(json));
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"deserialize json to object failed, json: [{json}]. Exception: {arg}");
			return null;
		}
	}

	public static List<T> DeserializeJson2List<T>(string json) where T : class, new()
	{
		if (string.IsNullOrEmpty(json))
		{
			return null;
		}
		try
		{
			return JsonConvert.DeserializeObject<List<T>>(json);
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"deserialize json to list failed, json: [{json}]. Exception: {arg}");
			return null;
		}
	}

	public static T DeserializeAnonymousType<T>(string json, T anonymousTypeObject)
	{
		if (string.IsNullOrEmpty(json))
		{
			return default(T);
		}
		try
		{
			return JsonConvert.DeserializeAnonymousType(json, anonymousTypeObject);
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"deserialize anonymous type failed, json: [{json}]. Exception: {arg} ");
			return default(T);
		}
	}

	public static object DeserializeJson2Object(string json)
	{
		if (string.IsNullOrEmpty(json))
		{
			return null;
		}
		try
		{
			return JsonConvert.DeserializeObject(json);
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"deserialize json to object failed, json: [{json}]. Exception: {arg}");
			return null;
		}
	}

	public static bool SerializeObject2File(string filePath, object obj)
	{
		try
		{
			using (StreamWriter textWriter = File.CreateText(filePath))
			{
				JsonSerializer jsonSerializer = new JsonSerializer();
				jsonSerializer.Formatting = Formatting.Indented;
				jsonSerializer.Serialize(textWriter, obj);
			}
			return true;
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"serialize object to file failed, filePath: [{filePath}] exception: {arg}");
			return false;
		}
	}

	public static T DeserializeJson2ObjcetFromFile<T>(string path) where T : class
	{
		try
		{
			if (!File.Exists(path))
			{
				return null;
			}
			using StreamReader reader = File.OpenText(path);
			return new JsonSerializer().Deserialize(reader, typeof(T)) as T;
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"deserialize json to objcet from file failed, filePath: [{path}] exception: {arg}");
			return null;
		}
	}

	public static List<T> DeserializeJson2ListFromFile<T>(string path)
	{
		try
		{
			if (!File.Exists(path))
			{
				return null;
			}
			using StreamReader reader = File.OpenText(path);
			return new JsonSerializer().Deserialize(reader, typeof(List<T>)) as List<T>;
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"deserialize json to list from file failed, filePath: [{path}] exception: {arg}");
			return null;
		}
	}

	public static JObject DeserializeJson2Jobjcet(string json, bool isDateAsStr = false)
	{
		if (string.IsNullOrEmpty(json))
		{
			return null;
		}
		try
		{
			if (isDateAsStr)
			{
				return (JObject)JsonConvert.DeserializeObject(json, new JsonSerializerSettings
				{
					DateParseHandling = DateParseHandling.None
				});
			}
			return (JObject)JsonConvert.DeserializeObject(json);
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"deserialize json to jobject failed, json: [{json}] Exception: {arg}");
			return null;
		}
	}

	public static JArray DeserializeJson2JArray(string json)
	{
		if (string.IsNullOrEmpty(json))
		{
			return null;
		}
		try
		{
			return (JArray)JsonConvert.DeserializeObject(json);
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"deserialize json to jarray failed, json: [{json}] Exception: {arg}");
			return null;
		}
	}

	public static string ReadText(string filepath)
	{
		try
		{
			return File.ReadAllText(filepath, Encoding.UTF8);
		}
		catch (Exception)
		{
			using Stream stream = new FileStream(filepath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
			using StreamReader streamReader = new StreamReader(stream, Encoding.UTF8);
			return streamReader.ReadToEnd();
		}
	}

	public static void WriteText(string filepath, string content)
	{
		FileInfo fileInfo = new FileInfo(filepath);
		if (!fileInfo.Directory.Exists)
		{
			Directory.CreateDirectory(fileInfo.Directory.FullName);
		}
		File.WriteAllText(filepath, content, Encoding.UTF8);
	}
}
[Serializable]
public class SysConfig
{
	[XmlElement(ElementName = "backupPath")]
	public string BackupPath { get; set; }

	[XmlElement(ElementName = "language")]
	public string Language { get; set; }

	[XmlElement(ElementName = "readyLang")]
	public string ReadyLang { get; set; }

	[XmlElement(ElementName = "gifSavePath")]
	public string GifSavePath { get; set; }
}
public class LMSAContext
{
	public static string LANGUAGE = "lang";

	public static string DEF_LANGUAGE = "en-US";

	public static string UPDATE_XML_FILE = "update";

	public static string USER_CONFIG_FILE = "user_config.xml";

	public static string SERVER_CATALOG_FILE = "catalog.xml";

	public static string LANGUAGE_PACKAGE_URI = "https://rsddownload-cloud.motorola.com/RSALanguage";

	public static string PC_BACKUP_PATH = "C:\\ProgramData\\LMSA\\Backup";

	public static string GIF_SAVE_PATH = AppDomain.CurrentDomain.BaseDirectory;

	private static string currentlanguage;

	private static string sMainProcessVersion;

	protected static Dictionary<string, string> LanguageMap = new Dictionary<string, string>
	{
		{ "1033", "en-US" },
		{ "1034", "es-ES" },
		{ "1041", "ja-JP" },
		{ "1045", "pl-PL" },
		{ "1046", "pt-BR" },
		{ "1049", "ru-RU" },
		{ "1040", "it-IT" },
		{ "2052", "zh-CN" },
		{ "1031", "de-DE" },
		{ "1051", "sk-SK" },
		{ "3098", "sr-RS" },
		{ "1048", "ro-RO" },
		{ "1026", "bg-BG" },
		{ "1029", "cs-CZ" },
		{ "1036", "fr-FR" },
		{ "1081", "hi-IN" },
		{ "1057", "id-ID" },
		{ "1025", "ar-SA" }
	};

	public static string CurrentLanguage
	{
		get
		{
			if (string.IsNullOrEmpty(currentlanguage))
			{
				currentlanguage = GetCurrentLanguage();
			}
			return currentlanguage;
		}
	}

	public static string OsVersionName
	{
		get
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			object obj = (from ManagementObject x in (IEnumerable)new ManagementObjectSearcher("SELECT Caption FROM Win32_OperatingSystem").Get()
				select ((ManagementBaseObject)x).GetPropertyValue("Caption")).FirstOrDefault();
			if (obj == null)
			{
				return "unknown";
			}
			return obj.ToString();
		}
	}

	public static string LanguagePackageRootPath => Path.Combine(Environment.CurrentDirectory, LANGUAGE);

	public static string MainProcessVersion
	{
		get
		{
			if (string.IsNullOrEmpty(sMainProcessVersion))
			{
				sMainProcessVersion = FileVersionInfo.GetVersionInfo(Process.GetCurrentProcess().MainModule.FileName).FileVersion;
			}
			return sMainProcessVersion;
		}
	}

	public static string GetLanguageId(string lang)
	{
		return LanguageMap.FirstOrDefault((KeyValuePair<string, string> n) => n.Value == lang).Key;
	}

	private static string GetCurrentLanguage()
	{
		string value = "en-US";
		GlobalFun.TryGetRegistryKey(RegistryHive.LocalMachine, "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Rescue and Smart Assistant", "NSIS:language", out var value2);
		if (value2 == null)
		{
			return value;
		}
		LanguageMap.TryGetValue(value2.ToString(), out value);
		return value ?? "en-US";
	}

	public static void SetCurrentLanguage(string selectLanguage)
	{
		LogHelper.LogInstance.Info("Set current language [" + GetLanguageId(selectLanguage) + "].");
		GlobalFun.WriteRegistryKey("Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Rescue and Smart Assistant", "NSIS:language", GetLanguageId(selectLanguage));
	}
}
[Serializable]
public class PluginInfo
{
	public string PluginID { get; set; }

	public string PluginName { get; set; }

	public string DisplayName { get; set; }

	public string Version { get; set; }

	public int VersionCode { get; set; }

	public string PluginDownloadUrl { get; set; }

	public string PluginIconPath { get; set; }

	public int Bits { get; set; }

	public int Order { get; set; }

	public string Description { get; set; }

	public bool haveNewVersion { get; set; }

	public bool Install { get; set; }

	public string PluginDir { get; set; }
}
public class PopupHelper
{
	public static void a()
	{
	}
}
public class ProcessRunner
{
	public static string ProcessString(string exe, string command, int timeout)
	{
		List<string> list = ProcessList(exe, command, timeout);
		if (list != null && list.Count > 0)
		{
			string text = string.Join("\r\n", list);
			if (text.EndsWith("\r\n"))
			{
				text = text.Remove(text.LastIndexOf("\r\n"));
			}
			return text;
		}
		return string.Empty;
	}

	public static string ProcessString(string exe, string command, int timeout, Action<Process> action, int period, out long exitCode, string workingDirectory = null)
	{
		exitCode = 0L;
		List<string> response = new List<string>();
		Process process = new Process();
		try
		{
			process.StartInfo.FileName = exe;
			process.StartInfo.WorkingDirectory = workingDirectory ?? Environment.CurrentDirectory;
			process.StartInfo.Arguments = command;
			process.StartInfo.RedirectStandardInput = true;
			process.StartInfo.RedirectStandardOutput = true;
			process.StartInfo.RedirectStandardError = true;
			process.StartInfo.UseShellExecute = false;
			process.EnableRaisingEvents = true;
			process.StartInfo.CreateNoWindow = true;
			System.Threading.Timer inputTimer = null;
			bool processExited = false;
			try
			{
				process.OutputDataReceived += delegate(object sender, DataReceivedEventArgs e)
				{
					if (!string.IsNullOrEmpty(e.Data))
					{
						response.Add(e.Data);
					}
				};
				process.ErrorDataReceived += delegate(object sender, DataReceivedEventArgs e)
				{
					if (!string.IsNullOrEmpty(e.Data))
					{
						response.Add(e.Data);
					}
				};
				process.Exited += delegate
				{
					processExited = true;
					try
					{
						inputTimer?.Dispose();
					}
					catch
					{
					}
				};
				process.Start();
				process.BeginOutputReadLine();
				process.BeginErrorReadLine();
				if (action != null)
				{
					inputTimer = new System.Threading.Timer(delegate
					{
						try
						{
							if (!processExited && !process.HasExited)
							{
								action?.Invoke(process);
							}
						}
						catch (Exception)
						{
						}
					}, null, TimeSpan.FromMilliseconds((double)period), TimeSpan.FromMilliseconds((double)period));
				}
				if (!process.WaitForExit(timeout))
				{
					response.Add($"execute error, commnad timeout: {timeout}");
					process.Kill();
				}
			}
			catch (Exception arg)
			{
				response.Add($"execute occur an error, {arg}");
			}
			exitCode = process.ExitCode;
			return string.Join("\r\n", response);
		}
		finally
		{
			if (process != null)
			{
				((IDisposable)process).Dispose();
			}
		}
	}

	public static string ProcessString(string exe, string command, int timeout, Action<Process> action, int period, string workingDirectory = null)
	{
		List<string> response = new List<string>();
		Process process = new Process();
		try
		{
			process.StartInfo.FileName = exe;
			process.StartInfo.WorkingDirectory = workingDirectory ?? Environment.CurrentDirectory;
			process.StartInfo.Arguments = command;
			process.StartInfo.RedirectStandardInput = true;
			process.StartInfo.RedirectStandardOutput = true;
			process.StartInfo.RedirectStandardError = true;
			process.StartInfo.UseShellExecute = false;
			process.EnableRaisingEvents = true;
			process.StartInfo.CreateNoWindow = true;
			System.Threading.Timer inputTimer = null;
			bool processExited = false;
			try
			{
				process.OutputDataReceived += delegate(object sender, DataReceivedEventArgs e)
				{
					if (!string.IsNullOrEmpty(e.Data))
					{
						response.Add(e.Data);
					}
				};
				process.ErrorDataReceived += delegate(object sender, DataReceivedEventArgs e)
				{
					if (!string.IsNullOrEmpty(e.Data))
					{
						response.Add(e.Data);
					}
				};
				process.Exited += delegate
				{
					processExited = true;
					try
					{
						inputTimer?.Dispose();
					}
					catch
					{
					}
				};
				process.Start();
				process.BeginOutputReadLine();
				process.BeginErrorReadLine();
				if (action != null)
				{
					inputTimer = new System.Threading.Timer(delegate
					{
						try
						{
							if (!processExited && !process.HasExited)
							{
								action?.Invoke(process);
							}
						}
						catch (Exception)
						{
						}
					}, null, TimeSpan.FromMilliseconds((double)period), TimeSpan.FromMilliseconds((double)period));
				}
				if (!process.WaitForExit(timeout))
				{
					response.Add($"execute error, commnad timeout: {timeout}");
					process.Kill();
				}
			}
			catch (Exception arg)
			{
				response.Add($"execute occur an error, {arg}");
			}
			return string.Join("\r\n", response);
		}
		finally
		{
			if (process != null)
			{
				((IDisposable)process).Dispose();
			}
		}
	}

	public static List<string> ProcessList(string exe, string command, int timeout, string workingDirectory = null)
	{
		List<string> list = new List<string>();
		List<string> output = new List<string>();
		List<string> error = new List<string>();
		using Process process = new Process();
		process.StartInfo.FileName = exe;
		process.StartInfo.WorkingDirectory = workingDirectory ?? Environment.CurrentDirectory;
		process.StartInfo.Arguments = command;
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
				output.Add(e.Data);
			}
		};
		process.ErrorDataReceived += delegate(object sender, DataReceivedEventArgs e)
		{
			if (!string.IsNullOrEmpty(e.Data))
			{
				error.Add(e.Data);
			}
		};
		try
		{
			process.Start();
			process.BeginOutputReadLine();
			process.BeginErrorReadLine();
			if (!process.WaitForExit(timeout))
			{
				list.Add($"execute error, commnad timeout: {timeout}");
				LogHelper.LogInstance.Debug("execute commnad timeout, command: " + command);
				process.Kill();
				return list;
			}
			if (output.Count > 0)
			{
				list.AddRange(output);
			}
			if (error.Count > 0)
			{
				list.AddRange(error);
			}
			return list;
		}
		catch (Exception arg)
		{
			list.Add($"execute occur an error, {arg}");
			return list;
		}
	}

	public static List<string> ProcessListKeyWord(string exe, string command, int timeout, List<string> keyword, string workingDirectory = null)
	{
		List<string> list = new List<string>();
		List<string> output = new List<string>();
		List<string> error = new List<string>();
		using Process process = new Process();
		process.StartInfo.FileName = exe;
		process.StartInfo.WorkingDirectory = workingDirectory ?? Environment.CurrentDirectory;
		process.StartInfo.Arguments = command;
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
				output.Add(e.Data);
			}
		};
		process.ErrorDataReceived += delegate(object sender, DataReceivedEventArgs e)
		{
			if (!string.IsNullOrEmpty(e.Data))
			{
				error.Add(e.Data);
			}
		};
		try
		{
			process.Start();
			process.BeginOutputReadLine();
			process.BeginErrorReadLine();
			int num = 0;
			if (!process.WaitForExit(timeout))
			{
				for (; num < 4; num++)
				{
					string[] source = output.ToArray();
					string[] source2 = error.ToArray();
					string[] outputSnapshot = source.Where((string p) => !p.ToLower().Contains("waiting for")).ToArray();
					string[] errorSnapshot = source2.Where((string p) => !p.ToLower().Contains("waiting for")).ToArray();
					if (error.Count() <= 1 && output.Count() <= 1)
					{
						list.Add($"execute error, commnad timeout: {timeout}");
						LogHelper.LogInstance.Debug("execute commnad timeout, command: " + command);
						if (!process.HasExited)
						{
							process.Kill();
						}
						return list;
					}
					bool flag = false;
					if (keyword != null && keyword.Count > 0)
					{
						flag = keyword.Any((string item) => outputSnapshot.Any((string p) => p.Contains(item))) || keyword.Any((string item) => errorSnapshot.Any((string p) => p.Contains(item)));
					}
					if (flag)
					{
						LogHelper.LogInstance.Debug($"TestLog--execute timeout ,but has data,try sleep:{num * 500} milliseconds");
						break;
					}
					Thread.Sleep(500);
				}
				if (!process.HasExited)
				{
					process.Kill();
				}
			}
			if (output.Count > 0)
			{
				list.AddRange(output);
			}
			if (error.Count > 0)
			{
				list.AddRange(error);
			}
			if (num == 4)
			{
				list.Add($"execute error, commnad timeout: {timeout}");
				LogHelper.LogInstance.Debug("execute commnad timeout,buffer data residue， command: " + command);
				if (!process.HasExited)
				{
					process.Kill();
				}
				return list;
			}
			return list;
		}
		catch (InvalidOperationException) when (process.HasExited)
		{
			LogHelper.LogInstance.Debug("test---result-exited--error");
			if (output.Count > 0)
			{
				list.AddRange(output);
			}
			if (error.Count > 0)
			{
				list.AddRange(error);
			}
			return list;
		}
		catch (Exception arg)
		{
			list.Add($"execute occur an error, {arg}");
			return list;
		}
	}

	public static string Shell(string command, string excuteExe = "cmd.exe", int timeout = 2000)
	{
		Process process = new Process();
		process.StartInfo.FileName = excuteExe;
		process.StartInfo.UseShellExecute = false;
		process.StartInfo.RedirectStandardInput = true;
		process.StartInfo.RedirectStandardOutput = true;
		process.StartInfo.RedirectStandardError = true;
		process.StartInfo.CreateNoWindow = true;
		process.Start();
		process.StandardInput.WriteLine(command + " &exit");
		process.StandardInput.AutoFlush = true;
		string result = process.StandardOutput.ReadToEnd();
		process.WaitForExit(timeout);
		process.Close();
		return result;
	}

	public static string CmdExcuteWithExit(string _cmdStr, string workdir = null, int _timeOut = 60000)
	{
		try
		{
			using Process process = new Process();
			process.StartInfo.FileName = "cmd.exe";
			if (!string.IsNullOrEmpty(workdir))
			{
				process.StartInfo.WorkingDirectory = workdir;
			}
			process.StartInfo.RedirectStandardInput = true;
			process.StartInfo.RedirectStandardOutput = true;
			process.StartInfo.RedirectStandardError = true;
			process.StartInfo.CreateNoWindow = true;
			process.StartInfo.UseShellExecute = false;
			process.Start();
			process.StandardInput.AutoFlush = true;
			process.StandardInput.WriteLine(_cmdStr);
			process.StandardInput.WriteLine("exit");
			if (!process.WaitForExit(_timeOut))
			{
				process.Kill();
				return null;
			}
			string text = string.Empty;
			StreamReader standardOutput = process.StandardOutput;
			StreamReader standardError = process.StandardError;
			if (standardOutput != null)
			{
				text = standardOutput.ReadToEnd();
			}
			if (standardError != null)
			{
				text += standardError.ReadToEnd();
			}
			LogHelper.LogInstance.Info("CmdHelper.Excute END - Ouput:[" + text + "]");
			return text;
		}
		catch
		{
			return null;
		}
	}
}
public class ProcessEventArgs : EventArgs
{
	private string content = string.Empty;

	public string Content => content;

	public ProcessEventArgs()
	{
	}

	public ProcessEventArgs(string content)
	{
		this.content = content;
	}
}
public static class QrCodeUtility
{
	public static MemoryStream GenerateQrCodeImageStream(string content)
	{
		MemoryStream memoryStream = null;
		if (!string.IsNullOrEmpty(content))
		{
			try
			{
				QrEncoder qrEncoder = new QrEncoder(ErrorCorrectionLevel.H);
				QrCode qrCode = new QrCode();
				qrEncoder.TryEncode(content, out qrCode);
				GraphicsRenderer graphicsRenderer = new GraphicsRenderer(new FixedModuleSize(12, QuietZoneModules.Two));
				memoryStream = new MemoryStream();
				graphicsRenderer.WriteToStream(qrCode.Matrix, ImageFormat.Png, memoryStream);
			}
			catch
			{
				memoryStream = null;
			}
		}
		return memoryStream;
	}

	public static bool IsUrlAccessible(string url)
	{
		try
		{
			WebRequest webRequest = WebRequest.Create(url);
			webRequest.Method = "HEAD";
			webRequest.Timeout = 3000;
			using HttpWebResponse httpWebResponse = (HttpWebResponse)webRequest.GetResponse();
			return httpWebResponse.StatusCode == HttpStatusCode.OK;
		}
		catch
		{
			return false;
		}
	}

	public static DateTime? ConvertDateTime(string value)
	{
		try
		{
			if (value == null)
			{
				return null;
			}
			long num = long.Parse(value);
			return new DateTime(1970, 1, 1).AddMilliseconds(num).ToLocalTime();
		}
		catch (Exception)
		{
			return null;
		}
	}
}
public enum CryptoType
{
	Arc4,
	Aes
}
public class Security
{
	private static Security _instance;

	private const char HASH_SEPARATOR = '|';

	private string TAG => GetType().FullName;

	public static Security Instance
	{
		get
		{
			if (_instance != null)
			{
				return _instance;
			}
			return _instance = new Security();
		}
	}

	public void Encrypt(byte[] key, CryptoType type, Stream inputData, Stream outputData)
	{
		Encrypt(key, null, type, inputData, outputData);
	}

	public void Decrypt(byte[] key, CryptoType type, Stream inputData, Stream outputData)
	{
		Decrypt(key, null, type, inputData, outputData);
	}

	public void Encrypt(byte[] key, byte[] hardcodedIv, CryptoType type, Stream inputData, Stream outputData)
	{
		switch (type)
		{
		case CryptoType.Aes:
			Encrypt(key, hardcodedIv, 16, new RijndaelManaged(), inputData, outputData);
			break;
		case CryptoType.Arc4:
			CryptArc4(key, inputData, outputData);
			break;
		default:
			throw new NotSupportedException($"Encryption type {type} not supported");
		}
	}

	public void Decrypt(byte[] key, byte[] hardcodedIv, CryptoType type, Stream inputData, Stream outputData)
	{
		switch (type)
		{
		case CryptoType.Aes:
			Decrypt(key, hardcodedIv, 16, new RijndaelManaged(), inputData, outputData);
			break;
		case CryptoType.Arc4:
			CryptArc4(key, inputData, outputData);
			break;
		default:
			throw new NotSupportedException($"Decryption type {type} not supported");
		}
	}

	public static byte[] EncryptWithDPAPI(string content)
	{
		return ProtectedData.Protect(Encoding.UTF8.GetBytes(content), (byte[])null, (DataProtectionScope)1);
	}

	public static string DecryptWithDPAPI(byte[] content)
	{
		return Encoding.UTF8.GetString(ProtectedData.Unprotect(content, (byte[])null, (DataProtectionScope)1));
	}

	private static void Encrypt(byte[] key, byte[] hardcodedIv, int blockSize, SymmetricAlgorithm algorithm, Stream inputData, Stream outputData)
	{
		byte[] array = hardcodedIv;
		if (array == null)
		{
			array = new byte[blockSize];
			new RNGCryptoServiceProvider().GetBytes(array);
			outputData.Write(array, 0, array.Length);
		}
		ICryptoTransform transform = algorithm.CreateEncryptor(key, array);
		CryptoStream cryptoStream = new CryptoStream(outputData, transform, CryptoStreamMode.Write);
		CustomFile.Instance.CopyStream(inputData, cryptoStream);
		cryptoStream.FlushFinalBlock();
	}

	private static void Decrypt(byte[] key, byte[] hardcodedIv, int blockSize, SymmetricAlgorithm algorithm, Stream inputData, Stream outputData)
	{
		byte[] array = hardcodedIv;
		if (array == null)
		{
			array = new byte[blockSize];
			inputData.Read(array, 0, array.Length);
		}
		ICryptoTransform transform = algorithm.CreateDecryptor(key, array);
		CryptoStream input = new CryptoStream(inputData, transform, CryptoStreamMode.Read);
		CustomFile.Instance.CopyStream(input, outputData);
	}

	private void CryptArc4(byte[] key, Stream inputData, Stream outputData)
	{
		long length = inputData.Length;
		byte[] keyStream = GenerateKeystream(key, length);
		ModifyWithKeystream(keyStream, inputData, outputData);
	}

	private byte[] GenerateKeystream(byte[] key, long length)
	{
		byte b = (byte)key.Length;
		byte[] array = new byte[256];
		foreach (int item in Enumerable.Range(0, array.Length))
		{
			array[item] = (byte)item;
		}
		int num = 0;
		foreach (int item2 in Enumerable.Range(0, array.Length))
		{
			num = (num + array[item2] + key[item2 % b]) % array.Length;
			byte b2 = array[item2];
			array[item2] = array[num];
			array[num] = b2;
		}
		byte[] array2 = new byte[length];
		int num2 = 0;
		int num3 = 0;
		foreach (int item3 in Enumerable.Range(0, array2.Length))
		{
			num2 = (num2 + 1) % array.Length;
			num3 = (num3 + array[num2]) % array.Length;
			byte b3 = array[num2];
			array[num2] = array[num3];
			array[num3] = b3;
			int num4 = (array[num2] + array[num3]) % array.Length;
			array2[item3] = array[num4];
		}
		return array2;
	}

	private void ModifyWithKeystream(byte[] keyStream, Stream inputData, Stream outputData)
	{
		Queue<byte> keyQueue = new Queue<byte>(keyStream);
		CustomFile.Instance.CopyStream(inputData, outputData, (byte[] input) => ModifyWithKeystream(keyQueue, input));
	}

	private byte[] ModifyWithKeystream(Queue<byte> keyStream, byte[] input)
	{
		if (keyStream.Count < input.Length)
		{
			throw new EndOfStreamException("Not enough key stream to continue");
		}
		byte[] array = new byte[input.Length];
		foreach (int item in Enumerable.Range(0, input.Length))
		{
			byte b = keyStream.Dequeue();
			array[item] = (byte)(input[item] ^ b);
		}
		return array;
	}

	public byte[] RandomBytes(int length)
	{
		RNGCryptoServiceProvider rNGCryptoServiceProvider = new RNGCryptoServiceProvider();
		byte[] array = new byte[length];
		rNGCryptoServiceProvider.GetBytes(array);
		return array;
	}

	public string Hash(string input)
	{
		byte[] salt = RandomBytes(16);
		return Hash(input, 16, 32768, salt);
	}

	public bool HashCheck(string input, string existingHash)
	{
		existingHash = existingHash.Trim();
		if (existingHash == string.Empty)
		{
			return false;
		}
		string[] array = existingHash.Split(new char[1] { '|' });
		if (array.Length != 3)
		{
			throw new FormatException("Unrecognized hash format: " + existingHash);
		}
		ushort iterations = CustomConvert.Instance.BytesToUShort(CustomConvert.Instance.HexToBytes(array[0]));
		byte[] salt = CustomConvert.Instance.Base64ToBytes(array[1]);
		byte[] array2 = CustomConvert.Instance.Base64ToBytes(array[2]);
		string text = Hash(input, array2.Length, iterations, salt);
		LogHelper.LogInstance.Info($"Comparing hashes. Old: {existingHash}, New: {text}");
		return text == existingHash;
	}

	private string Hash(string input, int length, ushort iterations, byte[] salt)
	{
		byte[] bytes = new Rfc2898DeriveBytes(input, salt)
		{
			IterationCount = iterations
		}.GetBytes(length);
		string text = CustomConvert.Instance.BytesToBase64(bytes);
		string text2 = CustomConvert.Instance.BytesToHex(CustomConvert.Instance.UShortToBytes(iterations));
		string text3 = CustomConvert.Instance.BytesToBase64(salt);
		return text2 + "|" + text3 + "|" + text;
	}

	public string EncryptAseString(string _content)
	{
		try
		{
			using MemoryStream inputData = new MemoryStream(Encoding.UTF8.GetBytes(_content));
			using MemoryStream memoryStream = new MemoryStream();
			Encrypt(RandomAesKeyHelper.Instance.GetKeyBytes(), CryptoType.Aes, inputData, memoryStream);
			return Convert.ToBase64String(memoryStream.ToArray());
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"ecrypt failed [{_content}], exception: {arg}");
			return string.Empty;
		}
	}

	public string DecryptAseString(string _content)
	{
		try
		{
			if (string.IsNullOrEmpty(_content))
			{
				return string.Empty;
			}
			using MemoryStream inputData = new MemoryStream(Convert.FromBase64String(_content));
			using MemoryStream memoryStream = new MemoryStream();
			Decrypt(RandomAesKeyHelper.Instance.GetKeyBytes(), CryptoType.Aes, inputData, memoryStream);
			return Encoding.UTF8.GetString(memoryStream.ToArray());
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"decrypt failed [{_content}], exception: {arg}");
			return string.Empty;
		}
	}

	public string GetRandomString(int length, bool useNum, bool useLow, bool useUpp, bool useSpe, string custom)
	{
		byte[] array = new byte[4];
		new RNGCryptoServiceProvider().GetBytes(array);
		Random random = new Random(BitConverter.ToInt32(array, 0));
		string text = null;
		string text2 = custom;
		if (useNum)
		{
			text2 += "0123456789";
		}
		if (useLow)
		{
			text2 += "abcdefghijklmnopqrstuvwxyz";
		}
		if (useUpp)
		{
			text2 += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		}
		if (useSpe)
		{
			text2 += "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
		}
		for (int i = 0; i < length; i++)
		{
			text += text2.Substring(random.Next(0, text2.Length - 1), 1);
		}
		return text;
	}
}
public class SevenZipHelper
{
	private static SevenZipHelper _instance;

	public static SevenZipHelper Instance
	{
		get
		{
			if (_instance != null)
			{
				return _instance;
			}
			return _instance = new SevenZipHelper();
		}
	}

	private SevenZipHelper()
	{
		SevenZipBase.SetLibraryPath(Configurations.SevenZipDllPath);
	}

	public int Extractor(string zipFile, string directory)
	{
		return Extractor(zipFile, directory, 3);
	}

	public int Extractor(string zipFile, string directory, int tryCount)
	{
		return Extractor(zipFile, directory, null, tryCount);
	}

	public int Check7zAndZipFiles(string zipFilePath)
	{
		try
		{
			SevenZipExtractor sevenZipExtractor = new SevenZipExtractor(zipFilePath);
			_ = string.Empty;
			foreach (ArchiveFileInfo archiveFileDatum in sevenZipExtractor.ArchiveFileData)
			{
				if (!IsSafePath(archiveFileDatum.FileName))
				{
					LogHelper.LogInstance.Warn("Unsafe file names:[" + archiveFileDatum.FileName + "], detected in ZIP file:[" + zipFilePath + "].");
					return 3;
				}
			}
			return 1;
		}
		catch (InvalidDataException arg)
		{
			LogHelper.LogInstance.Error($"Unable to open ZIP file:[{zipFilePath}], exception:[{arg}].");
			return 3;
		}
		catch (IOException ex)
		{
			LogHelper.LogInstance.Error($"open zip file:[{zipFilePath}], {ex.HResult}, io exception:[{ex}].");
			return (ex.HResult == -2147024864) ? (-1) : 3;
		}
		catch (Exception arg2)
		{
			LogHelper.LogInstance.Error($"open zip file:[{zipFilePath}], exception:[{arg2}].");
			return 3;
		}
	}

	public bool IsSafePath(string entryName)
	{
		string currentDirectory = Directory.GetCurrentDirectory();
		return Path.GetFullPath(Path.Combine(currentDirectory, entryName)).StartsWith(currentDirectory, StringComparison.OrdinalIgnoreCase);
	}

	public int Extractor(string zipFile, string directory, Action<int> progress, int tryCount = 3)
	{
		int num = Check7zAndZipFiles(zipFile);
		if (num != 1)
		{
			return num;
		}
		int code = 0;
		do
		{
			SevenZipExtractor sevenZipExtractor = null;
			try
			{
				sevenZipExtractor = new SevenZipExtractor(zipFile);
				sevenZipExtractor.Extracting += delegate(object sender, ProgressEventArgs e)
				{
					progress?.Invoke(e.PercentDone);
				};
				sevenZipExtractor.ExtractionFinished += delegate
				{
					LogHelper.LogInstance.Info(zipFile + " already extractor finished");
					code = 0;
				};
				sevenZipExtractor.ExtractArchive(directory);
			}
			catch (SevenZipException ex)
			{
				code = (ex.Message.Contains("not enough space") ? 1 : 2);
				LogHelper.LogInstance.Error("Extractor file " + zipFile + " occur an 7zip exception.\nmsg: " + ex.Message);
			}
			catch (Exception ex2)
			{
				code = 3;
				LogHelper.LogInstance.Error("Extractor file " + zipFile + " occur an exception.\nmsg: " + ex2.Message);
			}
			finally
			{
				sevenZipExtractor?.Dispose();
			}
			if (code == 0)
			{
				break;
			}
			GlobalFun.DeleteDirectoryEx(directory);
			if (code == 1)
			{
				break;
			}
			Thread.Sleep(500);
		}
		while (--tryCount > 0);
		return code;
	}

	public bool ExtractorWithPwd(string _zipFile, string _dir, string _zipPwd)
	{
		if (string.IsNullOrEmpty(_zipPwd))
		{
			LogHelper.LogInstance.Warn("Zip password is empty. Extractor with pwd file [" + _zipFile + "] failed.");
			return false;
		}
		if (Check7zAndZipFiles(_zipFile) != 1)
		{
			return false;
		}
		if (!Directory.Exists(_dir))
		{
			Directory.CreateDirectory(_dir);
		}
		SevenZipExtractor sevenZipExtractor = null;
		try
		{
			string password = Security.Instance.DecryptAseString(_zipPwd);
			sevenZipExtractor = new SevenZipExtractor(_zipFile, password);
			sevenZipExtractor.ExtractionFinished += delegate
			{
				LogHelper.LogInstance.Info("[" + _zipFile + "] already extractor with password finished.");
			};
			sevenZipExtractor.ExtractArchive(_dir);
			if (!ExtractFileSuccessedWithPwd(_dir))
			{
				LogHelper.LogInstance.Info("Unzip folder size is zero. Extractor with pwd file [" + _zipFile + "] failed.");
				return false;
			}
			return true;
		}
		catch (Exception exception)
		{
			LogHelper.LogInstance.Error($"Extractor file [{_zipFile}] occur an exception", exception);
			return false;
		}
		finally
		{
			sevenZipExtractor?.Dispose();
		}
	}

	public bool CheckExtractorWithPwd(string _zipFile, string _zipPwd)
	{
		string text = Path.Combine(Path.GetDirectoryName(_zipFile), Path.GetFileNameWithoutExtension(_zipFile));
		SevenZipExtractor sevenZipExtractor = null;
		if (string.IsNullOrEmpty(_zipPwd))
		{
			LogHelper.LogInstance.Warn("Zip password is empty. Check extractor with pwd file [" + _zipFile + "] failed.");
			return false;
		}
		try
		{
			string password = Security.Instance.DecryptAseString(_zipPwd);
			LogHelper.LogInstance.Debug("begin CheckExtractorWithPwd file [" + _zipFile + "].");
			sevenZipExtractor = new SevenZipExtractor(_zipFile, password);
			string text2 = string.Empty;
			ulong num = ulong.MaxValue;
			foreach (ArchiveFileInfo archiveFileDatum in sevenZipExtractor.ArchiveFileData)
			{
				if (!archiveFileDatum.IsDirectory && archiveFileDatum.Size != 0 && archiveFileDatum.Size < num)
				{
					num = archiveFileDatum.Size;
					text2 = archiveFileDatum.FileName;
				}
			}
			sevenZipExtractor.ExtractFiles(text, text2);
			if (!ExtractFileSuccessedWithPwd(text))
			{
				LogHelper.LogInstance.Info("Unzip folder size is zero. Check extractor with pwd file [" + _zipFile + "] failed.");
				return false;
			}
			return true;
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error("check extractor with pwd file [" + _zipFile + "] failed.");
			LogHelper.LogInstance.Debug($"check extractor with pwd file [{_zipFile}] failed, exception:[{arg}].");
			return false;
		}
		finally
		{
			sevenZipExtractor?.Dispose();
			GlobalFun.DeleteDirectory(text);
		}
	}

	private bool ExtractFileSuccessedWithPwd(string _dir)
	{
		string[] files = Directory.GetFiles(_dir, "*.*", SearchOption.AllDirectories);
		for (int i = 0; i < files.Length; i++)
		{
			if (new FileInfo(files[i]).Length > 0)
			{
				return true;
			}
		}
		return false;
	}

	public int CompressWithPwd(string directory, string archiveName, string _pwd)
	{
		int result = 0;
		try
		{
			string password = Security.Instance.DecryptAseString(_pwd);
			string? extension = Path.GetExtension(archiveName);
			SevenZipCompressor sevenZipCompressor = new SevenZipCompressor
			{
				FastCompression = true
			};
			if (extension == ".7z")
			{
				sevenZipCompressor.ArchiveFormat = OutArchiveFormat.SevenZip;
			}
			else
			{
				sevenZipCompressor.ArchiveFormat = OutArchiveFormat.Zip;
			}
			sevenZipCompressor.CompressionFinished += delegate
			{
				LogHelper.LogInstance.Info("[" + archiveName + "] already compress finished.");
				GlobalFun.DeleteDirectory(directory);
			};
			sevenZipCompressor.CompressionMethod = CompressionMethod.Lzma;
			sevenZipCompressor.CompressDirectory(directory, archiveName, password);
		}
		catch (SevenZipException ex)
		{
			result = (ex.Message.Contains("not enough space") ? 1 : 2);
			if (File.Exists(archiveName))
			{
				File.Delete(archiveName);
			}
			LogHelper.LogInstance.Error("compress with password failed, directory:[" + directory + "] archiveName:[" + archiveName + "],.\nmsg: " + ex.Message);
		}
		catch (Exception ex2)
		{
			result = 3;
			if (File.Exists(archiveName))
			{
				File.Delete(archiveName);
			}
			LogHelper.LogInstance.Error("compress with password failed, directory:[" + directory + "] archiveName:[" + archiveName + "], \nmsg:[" + ex2.Message + "]");
		}
		return result;
	}

	public bool Compress(string directory, string archiveName, Action<int> progress)
	{
		try
		{
			SevenZipCompressor sevenZipCompressor = new SevenZipCompressor();
			sevenZipCompressor.Compressing += delegate(object s, ProgressEventArgs e)
			{
				progress?.Invoke(e.PercentDone);
			};
			sevenZipCompressor.FastCompression = false;
			sevenZipCompressor.ArchiveFormat = OutArchiveFormat.SevenZip;
			sevenZipCompressor.CompressionMethod = CompressionMethod.Lzma;
			sevenZipCompressor.CompressDirectory(directory, archiveName);
			return true;
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"compress directory: {directory} failed, {arg}");
			return false;
		}
	}
}
public class PluginHelper
{
	private static string pluginsPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "plugins");

	public static string GetPluginAssemblyPath(string plugin)
	{
		return Path.Combine(pluginsPath, plugin);
	}
}
public class LogStatic
{
	private static string logsPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "logs");

	private static string mainlogsPath = "logs";

	public static string GetMainLogPath()
	{
		return mainlogsPath;
	}

	public static string GetMainLogAbsolutePathPath()
	{
		return Path.Combine(AppDomain.CurrentDomain.BaseDirectory, mainlogsPath);
	}

	public static string GetPluginLogPath(string logPath)
	{
		return Path.Combine(logsPath, logPath);
	}
}
public class HardDisk
{
	public static long GetHardDiskFreeSpace(string path)
	{
		return new DriveInfo(Path.GetPathRoot(path)).AvailableFreeSpace;
	}
}
public class GlobalFun
{
	private static List<string> PackageVersionList = new List<string>
	{
		"Rescue and Smart Assistant", "{1930BFD1-2F0A-43D9-B760-FAA2A40806DE}", "{21E28485-F3A3-4D3E-86A3-7E17C1BAAF42}", "{63BF7D1C-95B4-4E37-97A7-F8835B8A13D0}", "{3E34ECBE-D771-4D2B-8BDB-F4CF0BF663D1}", "{B72D19C8-EDA7-4C56-B8E8-EA3D35749BF4}", "{DB16BC9B-89C2-46A5-840F-79410CAB73B1}", "{C5E66E98-6776-477B-B0B3-B1A8372F8CC6}", "{4EE4FC82-5245-478B-BBD2-15E977072240}", "{4F7F8A4C-5D6E-4A4D-AD0B-8FF4964CA277}",
		"{A92D6B74-8528-4284-841F-76B3D9CE478B}", "{4226EB1C-E6C5-471F-88BC-5081A8D3FBD8}"
	};

	private static string systemType = null;

	public static string GetMd5Hash(string pathName)
	{
		using MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
		try
		{
			pathName = pathName.Replace("\"", "");
			byte[] array;
			using (FileStream inputStream = File.OpenRead(pathName))
			{
				array = mD5CryptoServiceProvider.ComputeHash(inputStream);
			}
			StringBuilder stringBuilder = new StringBuilder();
			byte[] array2 = array;
			foreach (byte b in array2)
			{
				stringBuilder.AppendFormat("{0:X2}", b);
			}
			return stringBuilder.ToString();
		}
		catch (Exception ex)
		{
			Console.WriteLine("Error calculating MD5 value for the specified file: " + ex.Message);
			return string.Empty;
		}
	}

	public static string GetStringSha256(string str, bool removeSplitter = false)
	{
		string text = string.Empty;
		using (SHA256 sHA = SHA256.Create())
		{
			text = BitConverter.ToString(sHA.ComputeHash(new UTF8Encoding().GetBytes(str)));
		}
		if (removeSplitter && !string.IsNullOrEmpty(text))
		{
			return text.Replace("-", "").ToLower();
		}
		return text;
	}

	public static bool MD5Check(string path, string md5)
	{
		return md5.ToUpper().Equals(GetMd5Hash(path).ToUpper());
	}

	public static bool TryDeleteFile(string path)
	{
		try
		{
			if (File.Exists(path))
			{
				File.SetAttributes(path, FileAttributes.Normal);
				File.Delete(path);
			}
			return true;
		}
		catch (Exception)
		{
			return false;
		}
	}

	public static bool CopyDirectory(string srcDir, string tarDir)
	{
		try
		{
			if (!Directory.Exists(srcDir))
			{
				return true;
			}
			if (!Directory.Exists(tarDir))
			{
				Directory.CreateDirectory(tarDir);
			}
			DirectoryInfo directoryInfo = new DirectoryInfo(srcDir);
			FileInfo[] files = directoryInfo.GetFiles();
			foreach (FileInfo fileInfo in files)
			{
				try
				{
					fileInfo.CopyTo(Path.Combine(tarDir, fileInfo.Name), overwrite: true);
				}
				catch
				{
					return false;
				}
			}
			DirectoryInfo[] directories = directoryInfo.GetDirectories();
			foreach (DirectoryInfo directoryInfo2 in directories)
			{
				if (!CopyDirectory(Path.Combine(srcDir, directoryInfo2.Name), Path.Combine(tarDir, directoryInfo2.Name)))
				{
					return false;
				}
			}
			return true;
		}
		catch
		{
			return false;
		}
	}

	public static bool DeleteFileInDirectory(string dirName)
	{
		try
		{
			if (!Directory.Exists(dirName))
			{
				return true;
			}
			DirectoryInfo directoryInfo = new DirectoryInfo(dirName);
			FileInfo[] files = directoryInfo.GetFiles();
			foreach (FileInfo fileInfo in files)
			{
				try
				{
					fileInfo.Delete();
				}
				catch
				{
					return false;
				}
			}
			DirectoryInfo[] directories = directoryInfo.GetDirectories();
			foreach (DirectoryInfo directoryInfo2 in directories)
			{
				if (!DeleteFileInDirectory(Path.Combine(dirName, directoryInfo2.Name)))
				{
					return false;
				}
			}
			return true;
		}
		catch
		{
			return false;
		}
	}

	public static bool CopyFile(string srcFile, string tarDir, out string resultInfo)
	{
		resultInfo = string.Empty;
		if (string.IsNullOrEmpty(srcFile) || string.IsNullOrEmpty(tarDir))
		{
			resultInfo = "File or directory string is empty.";
			return false;
		}
		FileStream fileStream = null;
		FileStream fileStream2 = null;
		try
		{
			int num = 512000;
			int num2 = 0;
			byte[] buffer = new byte[num];
			string fileName = Path.GetFileName(srcFile);
			string path = Path.Combine(tarDir, fileName);
			fileStream = File.Open(srcFile, FileMode.Open);
			fileStream2 = File.Open(path, FileMode.Append);
			fileStream.Position = fileStream2.Position;
			long num3 = 0L;
			long num4 = 0L;
			while (fileStream.Position < fileStream.Length)
			{
				num2 = fileStream.Read(buffer, 0, num);
				fileStream2.Write(buffer, 0, num2);
				fileStream2.Flush();
				num4 = fileStream2.Position * 100 / fileStream.Length;
				if (num3 != num4)
				{
					num3 = num4;
				}
			}
			return true;
		}
		catch (Exception ex)
		{
			resultInfo = ex.ToString();
			return false;
		}
		finally
		{
			fileStream?.Close();
			fileStream2?.Close();
		}
	}

	public static long GetFileLen(string fileName)
	{
		if (!File.Exists(fileName))
		{
			return 0L;
		}
		return new FileInfo(fileName).Length;
	}

	public static string GetRandomCode(int count)
	{
		string text = string.Empty;
		Random random = new Random((int)DateTime.Now.Ticks);
		for (int i = 0; i < count; i++)
		{
			int num = random.Next();
			num %= 36;
			num = ((num >= 10) ? (num + 55) : (num + 48));
			text += (char)num;
		}
		return text;
	}

	public static string GetRandomCodeEx(int count)
	{
		string[] array = "1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,i,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z".Split(new char[1] { ',' });
		string text = "";
		int num = -1;
		Random random = new Random();
		for (int i = 0; i < count; i++)
		{
			if (num != -1)
			{
				random = new Random(num * i * (int)DateTime.Now.Ticks);
			}
			int num2 = random.Next(array.Length - 1);
			while (num == num2)
			{
				num2 = random.Next(array.Length - 1);
			}
			num = num2;
			text += array[num2];
		}
		return text;
	}

	public static bool FileRename(string oldPathName, string newPathName)
	{
		try
		{
			new FileInfo(oldPathName).MoveTo(newPathName);
			if (File.Exists(oldPathName))
			{
				File.Delete(oldPathName);
			}
			return true;
		}
		catch (Exception)
		{
			return false;
		}
	}

	public static string ConvertLong2String(long bytes, string format = "F1", bool _retGBString = true)
	{
		float num = bytes;
		if (bytes > 1000)
		{
			if (bytes >= 1024000)
			{
				if (bytes >= 1024000000 && _retGBString)
				{
					return (num / 1.0737418E+09f).ToString(format) + " GB";
				}
				return (num / 1048576f).ToString(format) + " MB";
			}
			return (num / 1024f).ToString(format) + " KB";
		}
		return bytes + " B";
	}

	public static long ConvertString2Long(string size)
	{
		if (string.IsNullOrEmpty(size))
		{
			return 0L;
		}
		Match match = Regex.Match(size.Trim().Replace(',', '.'), "^(?<value>[\\d.]+)\\s*(?<unit>[A-Za-z]).*$");
		string value = match.Groups["value"].Value;
		string text = match.Groups["unit"].Value.ToLower();
		double result = 0.0;
		double.TryParse(value, out result);
		return text switch
		{
			"k" => (long)(result * 1024.0), 
			"m" => (long)(result * 1024.0 * 1024.0), 
			"g" => (long)(result * 1024.0 * 1024.0 * 1024.0), 
			"t" => (long)(result * 1024.0 * 1024.0 * 1024.0 * 1024.0), 
			_ => (long)result, 
		};
	}

	public static string GetStringFromUrl(string url)
	{
		WebRequest webRequest = null;
		WebResponse webResponse = null;
		Stream stream = null;
		StreamReader streamReader = null;
		string result = string.Empty;
		try
		{
			webRequest = WebRequest.Create(url);
			webRequest.CachePolicy = new HttpRequestCachePolicy(HttpRequestCacheLevel.NoCacheNoStore);
			webResponse = webRequest.GetResponse();
			stream = webResponse.GetResponseStream();
			streamReader = new StreamReader(stream);
			result = streamReader.ReadToEnd();
		}
		catch (Exception)
		{
		}
		finally
		{
			streamReader?.Close();
			stream?.Close();
			webResponse?.Close();
			webRequest?.Abort();
		}
		return result;
	}

	public static bool GetStreamFormServer(string url, Action<Stream> action, string method = "GET", int timeout = 30000)
	{
		HttpWebRequest httpWebRequest = null;
		WebResponse webResponse = null;
		Stream stream = null;
		try
		{
			httpWebRequest = WebRequest.Create(url) as HttpWebRequest;
			httpWebRequest.Method = method;
			httpWebRequest.UserAgent = GlobalVar.UserAgent;
			httpWebRequest.Timeout = timeout;
			httpWebRequest.KeepAlive = false;
			webResponse = httpWebRequest.GetResponse();
			stream = webResponse.GetResponseStream();
			action(stream);
			return true;
		}
		catch (Exception ex)
		{
			LogHelper.LogInstance.Error(ex.ToString());
			return false;
		}
		finally
		{
			stream?.Close();
			webResponse?.Close();
			httpWebRequest?.Abort();
		}
	}

	public static void OpenFileExplorer(string filePath)
	{
		try
		{
			string fileName = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Windows), "explorer.exe");
			if (Directory.Exists(filePath))
			{
				Process.Start(fileName, "/e,\"" + filePath + "\"");
			}
			else if (File.Exists(filePath))
			{
				Process.Start(fileName, "/e,/select,\"" + filePath + "\"");
			}
			else
			{
				Process.Start(fileName, "/e,\"" + Path.GetDirectoryName(filePath) + "\"");
			}
		}
		catch (Exception)
		{
		}
	}

	public static void OpenUrlByBrowser(string url)
	{
		try
		{
			Process.Start(HttpUtility.UrlPathEncode(url));
		}
		catch (Exception exception)
		{
			LogHelper.LogInstance.Error("open url by browser failed", exception);
		}
	}

	public static void KillProcess(string processName)
	{
		Process[] processesByName = Process.GetProcessesByName(processName);
		if (processesByName == null)
		{
			return;
		}
		Process[] array = processesByName;
		foreach (Process process in array)
		{
			try
			{
				process.Kill();
			}
			catch
			{
			}
		}
	}

	public static bool GetFileSize(string url, out long filesize, bool throwException = true)
	{
		int num = 3;
		filesize = 0L;
		do
		{
			HttpWebRequest httpWebRequest = null;
			try
			{
				GC.Collect();
				ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
				ServicePointManager.DefaultConnectionLimit = 50;
				url = (url.StartsWith("http", StringComparison.CurrentCultureIgnoreCase) ? url : ("http://" + url));
				httpWebRequest = (HttpWebRequest)WebRequest.Create(new Uri(url));
				httpWebRequest.Method = "GET";
				httpWebRequest.UserAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36";
				httpWebRequest.Headers.Add("Request-Tag: lmsa");
				httpWebRequest.CachePolicy = new RequestCachePolicy(RequestCacheLevel.NoCacheNoStore);
				httpWebRequest.KeepAlive = false;
				httpWebRequest.ReadWriteTimeout = 60000;
				using HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
				if (httpWebResponse.StatusCode == HttpStatusCode.OK)
				{
					filesize = httpWebResponse.ContentLength;
					return true;
				}
			}
			catch (Exception exception)
			{
				if (throwException)
				{
					LogHelper.LogInstance.Error("Get file size occur an exception form: " + url, exception);
				}
			}
			finally
			{
				try
				{
					httpWebRequest?.Abort();
				}
				catch (Exception)
				{
				}
			}
			Thread.Sleep(new Random().Next(100));
		}
		while (--num > 0);
		return false;
	}

	public static string Uuid()
	{
		return Guid.NewGuid().ToString("N").ToLowerInvariant();
	}

	public static string GetFullPathNameFromDirectory(string dir, string filePattern)
	{
		string result = string.Empty;
		if (Directory.Exists(dir))
		{
			string[] files = Directory.GetFiles(dir, filePattern, SearchOption.AllDirectories);
			if (files.Length != 0)
			{
				result = files[0];
			}
		}
		return result;
	}

	public static bool Exists(string path)
	{
		if (!File.Exists(path))
		{
			return Directory.Exists(path);
		}
		return true;
	}

	public static long GetDirectorySize(string directory)
	{
		if (!Directory.Exists(directory))
		{
			return 0L;
		}
		return Directory.GetFiles(directory, "*", SearchOption.AllDirectories).Sum((string t) => new FileInfo(t).Length);
	}

	public static long GetFileSize(string file)
	{
		if (!File.Exists(file))
		{
			return 0L;
		}
		return new FileInfo(file).Length;
	}

	public static bool DeleteDirectory(string dirPath)
	{
		try
		{
			if (Directory.Exists(dirPath))
			{
				Directory.Delete(dirPath, recursive: true);
				return true;
			}
			LogHelper.LogInstance.Warn("delete directory [" + dirPath + "] failed. Directory path does not exist.");
			return false;
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"delete directory [{dirPath}] failed. Exception:{arg}");
			return false;
		}
	}

	public static bool DeleteDirectoryEx(string dirPath)
	{
		if (!Directory.Exists(dirPath))
		{
			return true;
		}
		SetDir2Normal(dirPath);
		return DeleteDirectory(dirPath);
	}

	public static void SetDir2Normal(string dirPath)
	{
		DirectoryInfo directoryInfo = new DirectoryInfo(dirPath);
		FileInfo[] files = directoryInfo.GetFiles();
		foreach (FileInfo fileInfo in files)
		{
			if ((fileInfo.Attributes & FileAttributes.ReadOnly) == FileAttributes.ReadOnly)
			{
				fileInfo.Attributes &= ~FileAttributes.ReadOnly;
			}
		}
		DirectoryInfo[] directories = directoryInfo.GetDirectories();
		for (int i = 0; i < directories.Length; i++)
		{
			SetDir2Normal(directories[i].FullName);
		}
		directoryInfo.Attributes = FileAttributes.None;
	}

	public static string RenameIfExist(string fileFullName)
	{
		string result = fileFullName;
		FileInfo fileInfo = new FileInfo(fileFullName);
		if (!fileInfo.Exists)
		{
			return result;
		}
		string directoryName = fileInfo.DirectoryName;
		string extension = fileInfo.Extension;
		string name = fileInfo.Name;
		name = name.Substring(0, name.LastIndexOf(extension));
		int num = 0;
		while (true)
		{
			result = Path.Combine(directoryName, $"{name}({num}){extension}");
			if (!File.Exists(result))
			{
				break;
			}
			num++;
		}
		return result;
	}

	public static string DecodeBase64(string rawString)
	{
		try
		{
			byte[] bytes = Convert.FromBase64String(rawString);
			return Encoding.UTF8.GetString(bytes);
		}
		catch (Exception)
		{
			return null;
		}
	}

	public static BitmapImage LoadBitmap(string imageUri)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Expected O, but got Unknown
		BitmapImage val = new BitmapImage();
		val.BeginInit();
		val.CacheOption = (BitmapCacheOption)1;
		val.UriSource = new Uri(imageUri);
		val.EndInit();
		((Freezable)val).Freeze();
		return val;
	}

	public static BitmapImage ConvertBitmap(Bitmap bitmap)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Expected O, but got Unknown
		BitmapImage val = new BitmapImage();
		using MemoryStream memoryStream = new MemoryStream();
		((Image)bitmap).Save((Stream)memoryStream, ((Image)bitmap).RawFormat);
		memoryStream.Position = 0L;
		val.BeginInit();
		val.StreamSource = memoryStream;
		val.CacheOption = (BitmapCacheOption)1;
		val.EndInit();
		((Freezable)val).Freeze();
		return val;
	}

	public static string EncodeBase64(byte[] buffer)
	{
		return Convert.ToBase64String(buffer);
	}

	public static Image CreateThumbnail(int width, int height, string imagePath)
	{
		if (!File.Exists(imagePath))
		{
			return null;
		}
		Image val = Image.FromFile(imagePath);
		try
		{
			return CreateThumbnail(width, height, val);
		}
		finally
		{
			((IDisposable)val)?.Dispose();
		}
	}

	public static Image CreateThumbnail(int width, int height, Image image)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Expected O, but got Unknown
		//IL_003c: Expected O, but got Unknown
		if (image == null)
		{
			return null;
		}
		Bitmap val = new Bitmap(width, height, (PixelFormat)2498570);
		Graphics obj = Graphics.FromImage((Image)val);
		obj.PixelOffsetMode = (PixelOffsetMode)2;
		obj.SmoothingMode = (SmoothingMode)2;
		obj.InterpolationMode = (InterpolationMode)7;
		obj.DrawImage(image, new Rectangle(0, 0, width, height));
		return (Image)val;
	}

	public static bool TryGetRegistryKey(RegistryKey registrykey, string path, string key, out object value)
	{
		value = null;
		try
		{
			using RegistryKey registryKey = registrykey.OpenSubKey(path);
			if (registryKey == null)
			{
				return false;
			}
			value = registryKey.GetValue(key);
			return value != null;
		}
		catch
		{
			return false;
		}
	}

	public static bool TryGetRegistryKey(RegistryHive hive, string subKeyPath, string key, out object value)
	{
		value = null;
		try
		{
			RegistryKey registryKey = RegistryKey.OpenBaseKey(hive, RegistryView.Registry32).OpenSubKey(subKeyPath, RegistryKeyPermissionCheck.ReadWriteSubTree);
			if (registryKey == null)
			{
				registryKey = RegistryKey.OpenBaseKey(hive, RegistryView.Registry64).OpenSubKey(subKeyPath, RegistryKeyPermissionCheck.ReadWriteSubTree);
				if (registryKey == null)
				{
					return false;
				}
			}
			value = registryKey.GetValue(key);
			return true;
		}
		catch
		{
			return false;
		}
	}

	public static bool TryGetRegistryKey64(RegistryHive hive, string subKeyPath, string key, out object value)
	{
		value = null;
		try
		{
			RegistryKey registryKey = RegistryKey.OpenBaseKey(hive, RegistryView.Registry64).OpenSubKey(subKeyPath, RegistryKeyPermissionCheck.ReadWriteSubTree);
			if (registryKey == null)
			{
				return false;
			}
			value = registryKey.GetValue(key);
			return true;
		}
		catch
		{
			return false;
		}
	}

	public static void WriteRegistryKey(string subKeyPath, string key, object value)
	{
		RegistryKey registryKey = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, RegistryView.Registry32);
		RegistryKey registryKey2 = registryKey.OpenSubKey(subKeyPath, RegistryKeyPermissionCheck.ReadWriteSubTree);
		if (registryKey2 == null)
		{
			registryKey2 = registryKey.CreateSubKey(subKeyPath, RegistryKeyPermissionCheck.ReadWriteSubTree);
			if (registryKey2 == null)
			{
				registryKey2 = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, RegistryView.Registry64).OpenSubKey(subKeyPath, RegistryKeyPermissionCheck.ReadWriteSubTree);
			}
		}
		registryKey2.SetValue(key, value);
	}

	public static bool CheckServerIsRunning(string serviceName)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Invalid comparison between Unknown and I4
		ServiceController val = ServiceController.GetServices().FirstOrDefault((ServiceController n) => n.ServiceName.Equals(serviceName, StringComparison.CurrentCultureIgnoreCase));
		if (val == null)
		{
			return false;
		}
		return (int)val.Status == 4;
	}

	public static string GetClientUUID()
	{
		TryGetRegistryKey64(RegistryHive.LocalMachine, "SOFTWARE\\Microsoft\\Cryptography", "MachineGuid", out var value);
		if (value == null || string.IsNullOrEmpty(value.ToString()))
		{
			TryGetRegistryKey(RegistryHive.LocalMachine, "SYSTEM\\Software\\Microsoft\\LmsaDrivers\\clientuuid", "clientuuid", out var value2);
			if (value2 == null || string.IsNullOrEmpty(value2.ToString()))
			{
				value2 = Guid.NewGuid();
				WriteRegistryKey("SYSTEM\\Software\\Microsoft\\LmsaDrivers\\clientuuid", "clientuuid", value2.ToString());
			}
			value = value2.ToString();
		}
		return value?.ToString();
	}

	public static long GetDriverTotalFreeSapce(string path)
	{
		if (string.IsNullOrEmpty(path))
		{
			return 0L;
		}
		return new DriveInfo(Path.GetPathRoot(path)).TotalFreeSpace;
	}

	public static async Task<bool> Upload(string url, string filePath, Dictionary<string, string> aparams, int trycount, int reuploadwaitmilliseconds)
	{
		_ = 1;
		try
		{
			HttpContent val = (HttpContent)new StreamContent((Stream)new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.Read));
			val.Headers.ContentType = MediaTypeHeaderValue.Parse("multipart/form-data");
			HttpClient client = new HttpClient();
			try
			{
				MultipartFormDataContent mulContent = new MultipartFormDataContent("----");
				try
				{
					if (aparams != null && aparams.Count > 0)
					{
						foreach (KeyValuePair<string, string> aparam in aparams)
						{
							mulContent.Add((HttpContent)new StringContent(aparam.Value ?? ""), aparam.Key);
						}
					}
					mulContent.Add(val, "file", Regex.Split(filePath, "\\\\|/")[^1]);
					do
					{
						try
						{
							HttpResponseMessage response = await client.PostAsync(url, (HttpContent)(object)mulContent);
							await response.Content.ReadAsStringAsync();
							if (response.IsSuccessStatusCode)
							{
								return response.IsSuccessStatusCode;
							}
						}
						catch
						{
							Thread.Sleep(reuploadwaitmilliseconds);
						}
					}
					while (trycount-- > 0);
					return false;
				}
				finally
				{
					((IDisposable)mulContent)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)client)?.Dispose();
			}
		}
		catch (Exception)
		{
			return false;
		}
	}

	public static RegionInfo GetRegionInfo()
	{
		if (!TryGetRegistryKey(RegistryHive.CurrentUser, "Control Panel\\International\\Geo", "Nation", out var geoID))
		{
			TryGetRegistryKey(RegistryHive.Users, ".DEFAULT\\Control Panel\\International\\Geo", "Nation", out geoID);
		}
		RegionInfo regionInfo = (from x in CultureInfo.GetCultures(CultureTypes.SpecificCultures)
			select new RegionInfo(x.ToString())).FirstOrDefault((RegionInfo r) => r.GeoId == int.Parse(geoID.ToString()));
		if (regionInfo == null)
		{
			regionInfo = new RegionInfo("US");
		}
		return regionInfo;
	}

	public static string GetMacAddr()
	{
		NetworkInterface[] array = (from p in NetworkInterface.GetAllNetworkInterfaces()
			where p.NetworkInterfaceType == NetworkInterfaceType.Ethernet || p.NetworkInterfaceType == NetworkInterfaceType.Wireless80211
			orderby p.NetworkInterfaceType
			select p).ToArray();
		string text = "SYSTEM\\CurrentControlSet\\Control\\Network\\{4D36E972-E325-11CE-BFC1-08002BE10318}\\";
		NetworkInterface[] array2 = array;
		foreach (NetworkInterface networkInterface in array2)
		{
			string name = text + networkInterface.Id + "\\Connection";
			RegistryKey registryKey = Registry.LocalMachine.OpenSubKey(name, writable: false);
			if (registryKey == null)
			{
				continue;
			}
			string text2 = registryKey.GetValue("PnpInstanceID", "").ToString();
			if (text2.Length > 3 && text2.Substring(0, 3) == "PCI")
			{
				string text3 = networkInterface.GetPhysicalAddress().ToString().ToUpper();
				for (int num2 = 1; num2 < 6; num2++)
				{
					text3 = text3.Insert(3 * num2 - 1, "-");
				}
				return text3;
			}
		}
		LogHelper.LogInstance.Warn("No MAC address found for this machine.");
		return "00-00-00-00-00-00";
	}

	public static List<string> GetComInfo()
	{
		List<string> list = new List<string>();
		List<string> comInfo = GetComInfo("Select * From Win32_PnPEntity where name like '%(COM%' OR name like '%ADB%'");
		if (comInfo != null && comInfo.Count > 0)
		{
			list.AddRange(comInfo);
		}
		return list;
	}

	public static List<string> GetComInfo(string wql)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Expected O, but got Unknown
		List<string> list = new List<string>();
		ManagementObjectSearcher val = new ManagementObjectSearcher(wql);
		try
		{
			ManagementObjectEnumerator enumerator = val.Get().GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					ManagementBaseObject current = enumerator.Current;
					string text = current.GetPropertyValue("Name").ToString();
					try
					{
						text = string.Format("{0}({1})", text, current.GetPropertyValue("DeviceID"));
					}
					catch
					{
					}
					list.Add(text);
				}
				return list;
			}
			finally
			{
				((IDisposable)enumerator)?.Dispose();
			}
		}
		finally
		{
			((IDisposable)val)?.Dispose();
		}
	}

	public static string GetLmsaVersion()
	{
		foreach (string packageVersion in PackageVersionList)
		{
			string subKeyPath = $"Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{packageVersion}";
			TryGetRegistryKey(RegistryHive.LocalMachine, subKeyPath, "DisplayVersion", out var value);
			if (value != null)
			{
				return value.ToString();
			}
		}
		return "0.0.0.0";
	}

	public static long ToUtcTimeStamp(DateTime datetime)
	{
		return new DateTimeOffset(datetime).ToUnixTimeMilliseconds();
	}

	public static DateTime ToUtcDateTime(long timestamp)
	{
		return DateTimeOffset.FromUnixTimeMilliseconds(timestamp).UtcDateTime;
	}

	public static DateTime? ConvertDateTime(object value)
	{
		try
		{
			if (value == null)
			{
				return null;
			}
			long num = long.Parse((string)value);
			return new DateTime(1970, 1, 1).AddMilliseconds(num).ToLocalTime();
		}
		catch (Exception)
		{
			return null;
		}
	}

	public static DateTime ConvertDateTime(long? _data)
	{
		try
		{
			if (_data.HasValue)
			{
				return TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1)).AddMilliseconds(_data.Value);
			}
		}
		catch (Exception)
		{
		}
		return new DateTime(1970, 1, 1);
	}

	public static void ClearFlashToolDirectory()
	{
		try
		{
			string path = Configurations.FileSaveLocalPath["TOOL"];
			if (!Directory.Exists(path))
			{
				return;
			}
			string[] directories = Directory.GetDirectories(path);
			foreach (string text in directories)
			{
				string[] files = Directory.GetFiles(text, "*.exe", SearchOption.AllDirectories);
				for (int j = 0; j < files.Length; j++)
				{
					KillProcess(Path.GetFileNameWithoutExtension(files[j]));
				}
				for (int k = 0; k < 3; k++)
				{
					Thread.Sleep(1000);
					if (DeleteDirectory(text))
					{
						break;
					}
				}
			}
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Error($"clear flash tool directory exception:[{arg}]");
		}
	}

	public static string GetLasterDirectory(string directory)
	{
		if (string.IsNullOrEmpty(directory) || !Directory.Exists(directory))
		{
			return null;
		}
		List<DirectoryInfo> list = new List<DirectoryInfo>();
		string[] directories = Directory.GetDirectories(directory);
		foreach (string path in directories)
		{
			list.Add(new DirectoryInfo(path));
		}
		if (list.Count == 0)
		{
			return null;
		}
		DateTime lasterTime = list.Max((DirectoryInfo n) => n.LastWriteTime);
		return list.FirstOrDefault((DirectoryInfo n) => n.LastWriteTime.Equals(lasterTime))?.FullName;
	}

	public static List<string> GetAllFiles(string directory, string searchPattern = "*")
	{
		if (string.IsNullOrEmpty(directory) || !Directory.Exists(directory))
		{
			return null;
		}
		return Directory.GetFiles(directory, searchPattern, SearchOption.AllDirectories).ToList();
	}

	public static void KillRescueToolIfExist()
	{
		foreach (Process item in Process.GetProcesses().ToList())
		{
			if (item.ProcessName == "QFIL" || item.ProcessName.ToLower() == "flash_tool" || item.ProcessName == "QcomDLoader" || item.ProcessName == "CmdDloader" || item.ProcessName == "UpgradeDownload")
			{
				try
				{
					item.Kill();
				}
				catch (Exception arg)
				{
					LogHelper.LogInstance.Error($"kill rescue tool:[{item.ProcessName}] exception:[{arg}]");
				}
			}
		}
	}

	public static string GetSystemType()
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0015: Expected O, but got Unknown
		if (systemType == null)
		{
			ManagementObjectSearcher val = new ManagementObjectSearcher("SELECT * FROM Win32_ComputerSystem");
			try
			{
				ManagementObjectEnumerator enumerator = val.Get().GetEnumerator();
				try
				{
					if (enumerator.MoveNext())
					{
						PropertyData? obj = ((IEnumerable)enumerator.Current.Properties).Cast<PropertyData>().ToList().FirstOrDefault((PropertyData n) => n.Name == "SystemType");
						systemType = ((obj != null) ? obj.Value : null) as string;
					}
				}
				finally
				{
					((IDisposable)enumerator)?.Dispose();
				}
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}
		return systemType;
	}

	public static string GenerateOAuth2CodeVerifier()
	{
		using RandomNumberGenerator randomNumberGenerator = RandomNumberGenerator.Create();
		byte[] array = new byte[32];
		randomNumberGenerator.GetBytes(array);
		return Convert.ToBase64String(array).Trim(new char[1] { '=' }).Replace('+', '-')
			.Replace('/', '_');
	}

	public static string GenerateOAuth2CodeChallenge(string codeVerifier)
	{
		using SHA256 sHA = SHA256.Create();
		return Convert.ToBase64String(sHA.ComputeHash(Encoding.UTF8.GetBytes(codeVerifier))).Trim(new char[1] { '=' }).Replace('+', '-')
			.Replace('/', '_');
	}

	public void RegisterCustomUrlProtocol(string protocolName, string appPath)
	{
		if (Registry.ClassesRoot.OpenSubKey(protocolName) == null)
		{
			RegistryKey registryKey = Registry.ClassesRoot.CreateSubKey(protocolName);
			registryKey.SetValue("", "URL:SF Custom Protocol");
			registryKey.SetValue("URL Protocol", "");
			registryKey.CreateSubKey("shell").CreateSubKey("open").CreateSubKey("command")
				.SetValue("", "\"" + appPath + "\" \"%1\" \"%2\"");
		}
	}

	public static List<string> DecryptRomFile(string _romPath, string _fileType)
	{
		List<string> list = new List<string>();
		List<string> list2 = new List<string>();
		string[] array = _fileType.Split(new char[1] { '|' });
		foreach (string searchPattern in array)
		{
			list2.AddRange(Directory.GetFiles(_romPath, searchPattern, SearchOption.AllDirectories));
		}
		string text = string.Empty;
		foreach (string item in list2)
		{
			string extension = Path.GetExtension(item);
			if (!(extension == ".t"))
			{
				if (extension == ".x")
				{
					text = item + "ml";
				}
			}
			else
			{
				text = item + "xt";
			}
			list.Add(text);
			DecryptRomFileHelper.DecryptFile(item, text);
		}
		return list;
	}

	public static void DeleteDecryptedFile(List<string> _DecryptFileWaitDelete)
	{
		foreach (string item in _DecryptFileWaitDelete)
		{
			File.Delete(item);
		}
	}

	public static bool IsChinaUs(bool isOnlyChina = false)
	{
		string currentLanguage = LMSAContext.CurrentLanguage;
		string twoLetterISORegionName = GetRegionInfo().TwoLetterISORegionName;
		if (isOnlyChina)
		{
			if (currentLanguage == "zh-CN")
			{
				return twoLetterISORegionName == "CN";
			}
			return false;
		}
		if (!(currentLanguage == "en-US") || !(twoLetterISORegionName == "US"))
		{
			if (currentLanguage == "zh-CN")
			{
				return twoLetterISORegionName == "CN";
			}
			return false;
		}
		return true;
	}
}
public class GlobalVar
{
	public static string UserAgent = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)";

	public static IWebProxy IEProxy = null;
}
public static class WebBrowserHelper
{
	[StructLayout(LayoutKind.Explicit, Size = 80)]
	public struct INTERNET_CACHE_ENTRY_INFOA
	{
		[FieldOffset(0)]
		public uint dwStructSize;

		[FieldOffset(4)]
		public IntPtr lpszSourceUrlName;

		[FieldOffset(8)]
		public IntPtr lpszLocalFileName;

		[FieldOffset(12)]
		public uint CacheEntryType;

		[FieldOffset(16)]
		public uint dwUseCount;

		[FieldOffset(20)]
		public uint dwHitRate;

		[FieldOffset(24)]
		public uint dwSizeLow;

		[FieldOffset(28)]
		public uint dwSizeHigh;

		[FieldOffset(32)]
		public FILETIME LastModifiedTime;

		[FieldOffset(40)]
		public FILETIME ExpireTime;

		[FieldOffset(48)]
		public FILETIME LastAccessTime;

		[FieldOffset(56)]
		public FILETIME LastSyncTime;

		[FieldOffset(64)]
		public IntPtr lpHeaderInfo;

		[FieldOffset(68)]
		public uint dwHeaderInfoSize;

		[FieldOffset(72)]
		public IntPtr lpszFileExtension;

		[FieldOffset(76)]
		public uint dwReserved;

		[FieldOffset(76)]
		public uint dwExemptDelta;
	}

	[DllImport("wininet", CallingConvention = CallingConvention.StdCall, CharSet = CharSet.Auto, SetLastError = true)]
	[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
	public static extern IntPtr FindFirstUrlCacheGroup(int dwFlags, int dwFilter, IntPtr lpSearchCondition, int dwSearchCondition, ref long lpGroupId, IntPtr lpReserved);

	[DllImport("wininet", CallingConvention = CallingConvention.StdCall, CharSet = CharSet.Auto, SetLastError = true)]
	[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
	public static extern bool FindNextUrlCacheGroup(IntPtr hFind, ref long lpGroupId, IntPtr lpReserved);

	[DllImport("wininet", CallingConvention = CallingConvention.StdCall, CharSet = CharSet.Auto, SetLastError = true)]
	[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
	public static extern bool DeleteUrlCacheGroup(long GroupId, int dwFlags, IntPtr lpReserved);

	[DllImport("wininet", CallingConvention = CallingConvention.StdCall, CharSet = CharSet.Auto, EntryPoint = "FindFirstUrlCacheEntryA", SetLastError = true)]
	[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
	public static extern IntPtr FindFirstUrlCacheEntry([MarshalAs(UnmanagedType.LPTStr)] string lpszUrlSearchPattern, IntPtr lpFirstCacheEntryInfo, ref int lpdwFirstCacheEntryInfoBufferSize);

	[DllImport("wininet", CallingConvention = CallingConvention.StdCall, CharSet = CharSet.Auto, EntryPoint = "FindNextUrlCacheEntryA", SetLastError = true)]
	[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
	public static extern bool FindNextUrlCacheEntry(IntPtr hFind, IntPtr lpNextCacheEntryInfo, ref int lpdwNextCacheEntryInfoBufferSize);

	[DllImport("wininet", CallingConvention = CallingConvention.StdCall, CharSet = CharSet.Auto, EntryPoint = "DeleteUrlCacheEntryA", SetLastError = true)]
	[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
	public static extern bool DeleteUrlCacheEntry(IntPtr lpszUrlName);

	public static void ClearCache()
	{
		long lpGroupId = 0L;
		int lpdwFirstCacheEntryInfoBufferSize = 0;
		int num = 0;
		IntPtr zero = IntPtr.Zero;
		IntPtr zero2 = IntPtr.Zero;
		bool flag = false;
		zero2 = FindFirstUrlCacheGroup(0, 0, IntPtr.Zero, 0, ref lpGroupId, IntPtr.Zero);
		if (zero2 != IntPtr.Zero && 259 == Marshal.GetLastWin32Error())
		{
			return;
		}
		while (259 != Marshal.GetLastWin32Error() && 2 != Marshal.GetLastWin32Error())
		{
			flag = DeleteUrlCacheGroup(lpGroupId, 2, IntPtr.Zero);
			if (!flag && 2 == Marshal.GetLastWin32Error())
			{
				flag = FindNextUrlCacheGroup(zero2, ref lpGroupId, IntPtr.Zero);
			}
			if (!flag && (259 == Marshal.GetLastWin32Error() || 2 == Marshal.GetLastWin32Error()))
			{
				break;
			}
		}
		zero2 = FindFirstUrlCacheEntry(null, IntPtr.Zero, ref lpdwFirstCacheEntryInfoBufferSize);
		if (zero2 != IntPtr.Zero && 259 == Marshal.GetLastWin32Error())
		{
			return;
		}
		num = lpdwFirstCacheEntryInfoBufferSize;
		zero = Marshal.AllocHGlobal(num);
		zero2 = FindFirstUrlCacheEntry(null, zero, ref lpdwFirstCacheEntryInfoBufferSize);
		while (true)
		{
			INTERNET_CACHE_ENTRY_INFOA iNTERNET_CACHE_ENTRY_INFOA = (INTERNET_CACHE_ENTRY_INFOA)Marshal.PtrToStructure(zero, typeof(INTERNET_CACHE_ENTRY_INFOA));
			if (259 == Marshal.GetLastWin32Error())
			{
				break;
			}
			lpdwFirstCacheEntryInfoBufferSize = num;
			flag = DeleteUrlCacheEntry(iNTERNET_CACHE_ENTRY_INFOA.lpszSourceUrlName);
			if (!flag)
			{
				flag = FindNextUrlCacheEntry(zero2, zero, ref lpdwFirstCacheEntryInfoBufferSize);
			}
			if (!flag && 259 == Marshal.GetLastWin32Error())
			{
				break;
			}
			if (!flag && lpdwFirstCacheEntryInfoBufferSize > num)
			{
				num = lpdwFirstCacheEntryInfoBufferSize;
				zero = Marshal.ReAllocHGlobal(zero, (IntPtr)num);
				flag = FindNextUrlCacheEntry(zero2, zero, ref lpdwFirstCacheEntryInfoBufferSize);
			}
		}
		Marshal.FreeHGlobal(zero);
	}
}
public enum LoadResult
{
	Success,
	Failed
}
public class NavigationFinishedEventArgsAdapter
{
	public string Url { get; set; }

	public Microsoft.Web.WebView2.Wpf.WebView2 Browser { get; set; }

	public bool IsSuccess { get; set; }

	public CoreWebView2WebErrorStatus? ErrorStatus { get; set; }
}
public class WebView2Helper
{
	private static readonly object locker = new object();

	private static WebView2Helper _instance = new WebView2Helper();

	public static ConcurrentDictionary<Microsoft.Web.WebView2.Wpf.WebView2, CoreWebView2> browserMapping = new ConcurrentDictionary<Microsoft.Web.WebView2.Wpf.WebView2, CoreWebView2>();

	private static readonly ConcurrentDictionary<Microsoft.Web.WebView2.Wpf.WebView2, Task> _initTasks = new ConcurrentDictionary<Microsoft.Web.WebView2.Wpf.WebView2, Task>();

	public CoreWebView2 browser;

	public static WebView2Helper Instance => _instance ?? new WebView2Helper();

	public event Action<string> OnUrlChanged;

	private WebView2Helper()
	{
	}

	private static bool IsInitialized(Microsoft.Web.WebView2.Wpf.WebView2 webView)
	{
		try
		{
			return webView?.CoreWebView2 != null;
		}
		catch
		{
			return false;
		}
	}

	public void InitWebView2(Microsoft.Web.WebView2.Wpf.WebView2 webView)
	{
		if (webView == null || IsInitialized(webView))
		{
			return;
		}
		if (_initTasks.ContainsKey(webView))
		{
			_initTasks[webView].Wait();
			return;
		}
		Exception initException = null;
		Task task = Task.Run(delegate
		{
			((DispatcherObject)webView).Dispatcher.Invoke((Action)delegate
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				//IL_0015: Expected O, but got Unknown
				try
				{
					if (webView.CoreWebView2 == null)
					{
						DispatcherFrame val = new DispatcherFrame();
						InitAsync(webView, val, delegate(Exception ex2)
						{
							initException = ex2;
						});
						Dispatcher.PushFrame(val);
					}
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Warn($"InitWebView2 failed:{ex}");
					initException = ex;
				}
			});
			if (initException != null)
			{
				throw initException;
			}
		});
		_initTasks.TryAdd(webView, task);
		try
		{
			task.Wait();
		}
		finally
		{
			_initTasks.TryRemove(webView, out var _);
		}
	}

	public string GetUrl(Microsoft.Web.WebView2.Wpf.WebView2 webView2Control)
	{
		if (webView2Control == null)
		{
			return string.Empty;
		}
		if (!browserMapping.TryGetValue(webView2Control, out var value) || value == null)
		{
			return string.Empty;
		}
		try
		{
			if (((DispatcherObject)webView2Control).Dispatcher.CheckAccess())
			{
				return value.Source;
			}
			return ((DispatcherObject)webView2Control).Dispatcher.Invoke<string>((Func<string>)(() => (browserMapping.TryGetValue(webView2Control, out var value2) && value2 != null) ? value2.Source : string.Empty));
		}
		catch (InvalidOperationException ex) when (ex.Message.Contains("UI thread"))
		{
			LogHelper.LogInstance.Warn($"UI thread access violation in GetUrl: {ex}");
			return string.Empty;
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Warn($"Get url failed: {arg}");
			return string.Empty;
		}
	}

	private async Task InitAsync(Microsoft.Web.WebView2.Wpf.WebView2 webView, DispatcherFrame frame, Action<Exception> onError)
	{
		_ = 1;
		try
		{
			string path = Assembly.GetEntryAssembly()?.GetName().Name ?? "DefaultApp";
			string userDataFolder = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), path, "WebView2UserData");
			await webView.EnsureCoreWebView2Async(await CoreWebView2Environment.CreateAsync(null, userDataFolder));
			webView.CoreWebView2.Settings.IsPasswordAutosaveEnabled = false;
			LogHelper.LogInstance.Info("WebView2 engine initialized successfully.");
		}
		catch (Exception exception)
		{
			LogHelper.LogInstance.Warn("Init WebView2 engine failed!", exception);
		}
		finally
		{
			frame.Continue = false;
		}
	}

	public void NotifyUrlChange(string newUrl)
	{
		this.OnUrlChanged?.Invoke(newUrl);
	}

	public async Task<LoadResult> LoadUrl(Microsoft.Web.WebView2.Wpf.WebView2 webView, string url, Action<NavigationFinishedEventArgsAdapter> loadFinishedCallback, int timeoutMs = 15000)
	{
		if (string.IsNullOrEmpty(url))
		{
			LogHelper.LogInstance.Warn("WebView2 url null, cannot load url!");
			return LoadResult.Failed;
		}
		if (webView == null)
		{
			LogHelper.LogInstance.Warn("WebView2 is null, cannot load url!");
			return LoadResult.Failed;
		}
		try
		{
			InitWebView2(webView);
			Instance.OnUrlChanged -= OnUrlChangedHandler;
			Instance.OnUrlChanged += OnUrlChangedHandler;
			TaskCompletionSource<LoadResult> tcs = new TaskCompletionSource<LoadResult>();
			string NavigationUrl = url;
			await ((DispatcherObject)webView).Dispatcher.InvokeAsync((Action)delegate
			{
				webView.CoreWebView2.NavigationCompleted += Handler;
				webView.CoreWebView2.NavigationStarting += StartingHandler;
				webView.CoreWebView2.Navigate(url);
			});
			if (await Task.WhenAny(new Task[2]
			{
				tcs.Task,
				Task.Delay(timeoutMs)
			}) != tcs.Task)
			{
				LogHelper.LogInstance.Warn($"WebView2 load url timeout after {timeoutMs}ms: {url}");
				NavigationFinishedEventArgsAdapter timeoutArgs = new NavigationFinishedEventArgsAdapter
				{
					Url = NavigationUrl,
					Browser = webView,
					IsSuccess = false,
					ErrorStatus = CoreWebView2WebErrorStatus.Timeout
				};
				if (((DispatcherObject)webView).Dispatcher.CheckAccess())
				{
					loadFinishedCallback?.Invoke(timeoutArgs);
				}
				else
				{
					((DispatcherObject)webView).Dispatcher.Invoke((Action)delegate
					{
						loadFinishedCallback?.Invoke(timeoutArgs);
					});
				}
				return LoadResult.Failed;
			}
			return await tcs.Task;
			void Handler(object sender, CoreWebView2NavigationCompletedEventArgs e)
			{
				NavigationFinishedEventArgsAdapter navigationFinishedEventArgsAdapter = new NavigationFinishedEventArgsAdapter
				{
					Url = ((CoreWebView2)sender)?.Source,
					Browser = webView,
					IsSuccess = e.IsSuccess,
					ErrorStatus = ((!e.IsSuccess) ? e.WebErrorStatus : CoreWebView2WebErrorStatus.Unknown)
				};
				LoadResult result = ((!e.IsSuccess) ? LoadResult.Failed : LoadResult.Success);
				if (e.IsSuccess)
				{
					browserMapping.TryAdd(webView, webView.CoreWebView2);
					CommonContantField.WEBVIEW_USER_DATA_FOLDER = webView.CoreWebView2.Environment.UserDataFolder;
				}
				LogHelper.LogInstance.Info("WebView2 load url finished, and redirect to: " + navigationFinishedEventArgsAdapter.Url);
				loadFinishedCallback?.Invoke(navigationFinishedEventArgsAdapter);
				tcs.TrySetResult(result);
			}
			void StartingHandler(object sender, CoreWebView2NavigationStartingEventArgs e)
			{
				NavigationUrl = e.Uri;
			}
		}
		catch (Exception exception)
		{
			LogHelper.LogInstance.Error("WebView2 load url failed!", exception);
			loadFinishedCallback?.Invoke(null);
			return LoadResult.Failed;
		}
		void OnUrlChangedHandler(string newUrl)
		{
			if (webView?.CoreWebView2 != null)
			{
				webView.CoreWebView2.Navigate(newUrl);
				LogHelper.LogInstance.Info("[Global Update] WebView2 navigated to " + newUrl);
			}
		}
	}

	public Task LogoutAsync(string urlDomain)
	{
		DisposeAll();
		TaskCompletionSource<bool> tcs = new TaskCompletionSource<bool>();
		Thread thread = new Thread((ThreadStart)delegate
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			Form form = new Form();
			Microsoft.Web.WebView2.WinForms.WebView2 webView = new Microsoft.Web.WebView2.WinForms.WebView2();
			((Control)webView).Dock = (DockStyle)5;
			Microsoft.Web.WebView2.WinForms.WebView2 webView2 = webView;
			form.ShowInTaskbar = false;
			form.Opacity = 0.0;
			form.WindowState = (FormWindowState)1;
			((Control)form).Controls.Add((Control)(object)webView2);
			form.Load += async delegate
			{
				_ = 2;
				try
				{
					CoreWebView2Environment environment = await CoreWebView2Environment.CreateAsync(null, CommonContantField.WEBVIEW_USER_DATA_FOLDER);
					await webView2.EnsureCoreWebView2Async(environment);
					await webView2.CoreWebView2.Profile.ClearBrowsingDataAsync(CoreWebView2BrowsingDataKinds.Cookies);
					LogHelper.LogInstance.Info("Lenovo successfully logged out and cleared cookies");
					tcs.SetResult(result: true);
					form.Close();
				}
				catch (Exception exception)
				{
					tcs.SetException(exception);
					form.Close();
				}
			};
			Application.Run(form);
		});
		thread.SetApartmentState(ApartmentState.STA);
		thread.Start();
		return tcs.Task;
	}

	public bool CanGoBack(Microsoft.Web.WebView2.Wpf.WebView2 webView2Control)
	{
		if (webView2Control == null)
		{
			return false;
		}
		if (browserMapping.TryGetValue(webView2Control, out browser))
		{
			try
			{
				return browser.CanGoBack;
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Warn($"Get property[CanGoBack] failed:{arg}");
			}
		}
		return false;
	}

	public bool GoBack(Microsoft.Web.WebView2.Wpf.WebView2 webView2Control)
	{
		if (browserMapping.TryGetValue(webView2Control, out browser))
		{
			try
			{
				browser.GoBack();
				return true;
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Warn($"Execute method[GoBack] failed:{arg}");
			}
		}
		return false;
	}

	public bool CanGoForward(Microsoft.Web.WebView2.Wpf.WebView2 webView2Control)
	{
		if (browserMapping.TryGetValue(webView2Control, out browser))
		{
			try
			{
				return browser.CanGoForward;
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Warn($"Get property[CanGoForward] failed:{arg}");
			}
		}
		return false;
	}

	public bool GoForward(Microsoft.Web.WebView2.Wpf.WebView2 webView2Control)
	{
		if (browserMapping.TryGetValue(webView2Control, out browser))
		{
			try
			{
				browser.GoForward();
				return true;
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Warn($"Execute method[GoBaGoForwardck] failed:{arg}");
			}
		}
		return false;
	}

	public bool Reload(Microsoft.Web.WebView2.Wpf.WebView2 webView)
	{
		if (webView == null)
		{
			return false;
		}
		try
		{
			((DispatcherObject)webView).Dispatcher.Invoke((Action)delegate
			{
				webView.Reload();
			});
			return true;
		}
		catch (Exception arg)
		{
			LogHelper.LogInstance.Warn($"Execute method[Reload] failed:{arg}");
			return false;
		}
	}

	public void ClearCookies(Microsoft.Web.WebView2.Wpf.WebView2 webView)
	{
		if (webView == null)
		{
			return;
		}
		try
		{
			((DispatcherObject)webView).Dispatcher.Invoke((Action)delegate
			{
				webView.CoreWebView2?.CookieManager.DeleteAllCookies();
				LogHelper.LogInstance.Info("WebView2 cookies cleared successfully.");
			});
		}
		catch (Exception exception)
		{
			LogHelper.LogInstance.Warn("Clear WebView2 cookies failed!", exception);
		}
	}

	public void DisposeWebView(Microsoft.Web.WebView2.Wpf.WebView2 webView)
	{
		if (webView == null || !browserMapping.TryRemove(webView, out var _))
		{
			return;
		}
		try
		{
			((DispatcherObject)webView).Dispatcher.Invoke((Action)delegate
			{
				((HwndHost)webView).Dispose();
			});
			LogHelper.LogInstance.Info("WebView2 disposed successfully.");
		}
		catch (Exception exception)
		{
			LogHelper.LogInstance.Warn("Dispose WebView2 failed!", exception);
		}
	}

	public void DisposeAll()
	{
		foreach (KeyValuePair<Microsoft.Web.WebView2.Wpf.WebView2, CoreWebView2> kvp in browserMapping)
		{
			try
			{
				((DispatcherObject)kvp.Key).Dispatcher.Invoke((Action)delegate
				{
					((HwndHost)kvp.Key).Dispose();
				});
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Warn("Dispose WebView2 failed!", exception);
			}
		}
		browserMapping.Clear();
		LogHelper.LogInstance.Info("All WebView2 instances disposed.");
	}
}
public class XmlLocker
{
	private static readonly string MUTEX_NAME_STRING = "Global\\XmlLocker";

	private static Mutex s_Mutex = null;

	private static XmlLocker s_Instance = null;

	public static XmlLocker Instance
	{
		get
		{
			if (s_Instance == null)
			{
				s_Instance = new XmlLocker();
				try
				{
					s_Mutex = Mutex.OpenExisting(MUTEX_NAME_STRING);
				}
				catch (WaitHandleCannotBeOpenedException)
				{
				}
				catch (UnauthorizedAccessException)
				{
				}
				catch (Exception)
				{
				}
				if (s_Mutex == null)
				{
					s_Mutex = new Mutex(initiallyOwned: false, MUTEX_NAME_STRING);
				}
			}
			return s_Instance;
		}
	}

	private XmlLocker()
	{
	}

	public void ThreadSafeOperation(Action a)
	{
		if (a != null)
		{
			try
			{
				s_Mutex.WaitOne();
				a();
			}
			finally
			{
				s_Mutex.ReleaseMutex();
			}
		}
	}
}
public class XmlSerializeHelper
{
	public static object Deserialize<T>(string xml)
	{
		try
		{
			object obj = null;
			XmlLocker.Instance.ThreadSafeOperation(delegate
			{
				//IL_0016: Unknown result type (might be due to invalid IL or missing references)
				//IL_001c: Expected O, but got Unknown
				try
				{
					using StringReader stringReader = new StringReader(xml);
					XmlSerializer val = new XmlSerializer(typeof(T));
					obj = val.Deserialize((TextReader)stringReader);
				}
				catch
				{
				}
			});
			return obj;
		}
		catch
		{
			return null;
		}
	}

	public static object Deserialize<T>(Stream stream)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Expected O, but got Unknown
		object result = null;
		XmlSerializer val = new XmlSerializer(typeof(T));
		try
		{
			result = val.Deserialize(stream);
		}
		catch
		{
		}
		return result;
	}

	public static object DeserializeFromFile<T>(string fileName)
	{
		return DeserializeFromFile<T>(fileName, FileShare.None);
	}

	public static object DeserializeFromFile<T>(string fileName, FileShare fs)
	{
		if (!File.Exists(fileName))
		{
			return null;
		}
		object obj = null;
		XmlLocker.Instance.ThreadSafeOperation(delegate
		{
			try
			{
				using FileStream stream = new FileStream(fileName, FileMode.Open, FileAccess.Read, fs);
				obj = Deserialize<T>(stream);
			}
			catch
			{
			}
		});
		return obj;
	}

	public static string Serializer<T>(object obj)
	{
		if (obj != null)
		{
			string str = string.Empty;
			XmlLocker.Instance.ThreadSafeOperation(delegate
			{
				//IL_0010: Unknown result type (might be due to invalid IL or missing references)
				//IL_0016: Expected O, but got Unknown
				MemoryStream memoryStream = new MemoryStream();
				XmlSerializer val = new XmlSerializer(typeof(T));
				try
				{
					val.Serialize((Stream)memoryStream, obj);
					memoryStream.Position = 0L;
					StreamReader streamReader = new StreamReader(memoryStream);
					str = streamReader.ReadToEnd();
					streamReader.Dispose();
					memoryStream.Dispose();
				}
				catch (InvalidOperationException)
				{
					throw;
				}
			});
			return str;
		}
		return string.Empty;
	}

	public static void Serializer<T>(string fileName, object obj, FileShare fs)
	{
		if (obj == null)
		{
			return;
		}
		XmlLocker.Instance.ThreadSafeOperation(delegate
		{
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			if (File.Exists(fileName))
			{
				try
				{
					File.Delete(fileName);
				}
				catch (DirectoryNotFoundException ex)
				{
					throw ex;
				}
				catch (UnauthorizedAccessException ex2)
				{
					throw ex2;
				}
				catch (NotSupportedException ex3)
				{
					throw ex3;
				}
				catch (IOException ex4)
				{
					throw ex4;
				}
				catch (Exception ex5)
				{
					throw ex5;
				}
			}
			try
			{
				string directoryName = Path.GetDirectoryName(fileName);
				if (!Directory.Exists(directoryName))
				{
					Directory.CreateDirectory(directoryName);
				}
				using FileStream fileStream = new FileStream(fileName, FileMode.Create, FileAccess.Write, fs);
				new XmlSerializer(typeof(T)).Serialize((Stream)fileStream, obj);
				using StreamWriter streamWriter = new StreamWriter(fileStream, Encoding.UTF8, 2048);
				streamWriter.Flush();
			}
			catch (Exception ex6)
			{
				throw ex6;
			}
		});
	}

	public static void Serializer<T>(string fileName, object obj)
	{
		Serializer<T>(fileName, obj, FileShare.None);
	}
}
