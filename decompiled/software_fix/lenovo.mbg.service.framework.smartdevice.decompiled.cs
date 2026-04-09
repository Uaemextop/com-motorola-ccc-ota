using System;
using System.Collections;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Management;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Xml;
using Microsoft.Win32;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.common.utilities;
using lenovo.mbg.service.common.webservices;
using lenovo.mbg.service.common.webservices.WebApiModel;
using lenovo.mbg.service.common.webservices.WebApiServices;
using lenovo.mbg.service.framework.resources;
using lenovo.mbg.service.framework.services;
using lenovo.mbg.service.framework.services.Device;
using lenovo.mbg.service.framework.services.Download;
using lenovo.mbg.service.framework.smartbase;
using lenovo.mbg.service.framework.smartdevice.ODMSocketServer;
using lenovo.mbg.service.framework.smartdevice.Steps;
using lenovo.mbg.service.lmsa.hostproxy;
using lenovo.themes.generic;
using lenovo.themes.generic.ViewModelV6;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.framework.smartdevice")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("lenovo.mbg.service.framework.smartdevice")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: InternalsVisibleTo("lenovo.mbg.service.common.utilities")]
[assembly: ComVisible(false)]
[assembly: Guid("a58f80b8-72e2-4bf4-b918-8342cd04be8c")]
[assembly: AssemblyFileVersion("1.1.0.0")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("1.1.0.0")]
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

	public static IPermission PermissionService => bases.Load<IPermission>("software fix.permissionservice");

	public static IGoogleAnalyticsTracker GoogleAnalyticsTracker => bases.Load<IGoogleAnalyticsTracker>("Software Fix.GoogleAnalyticsTracker");

	public static IViewContext ViewContext => bases.Load<IViewContext>("Software Fix.ViewContext");

	public static IUser User => bases.Load<IUser>("Software Fix.User");

	public static IGlobalCache GlobalCache => bases.Load<IGlobalCache>("software fix.globalcacheservice");

	public static IUserBehaviorService BehaviorService => bases.Load<IUserBehaviorService>("Software Fix.UserBehaviorService");
}
namespace lenovo.mbg.service.framework.smartdevice
{
	public interface IRecipeMessage
	{
		Task<bool?> Show(string title, string message, string ok = "K0327", string cancel = null, bool showClose = false, MessageBoxImage icon = (MessageBoxImage)64, string notifyText = null, bool isPrivacy = false, bool isWarnYellow = false);

		Task<bool?> ShowCustom(IMessageViewV6 view);

		Task<bool?> WaitByAdb(string title, string message, string image);

		Task<bool?> WaitByFastboot(UseCase _usecase, string modelname);

		Task<bool?> Linker(string title, string message, object data);

		Task<bool?> RightPic(string title, string message, string image, string ok = "K0327", string cancel = null, string tips = null, bool showClose = false, bool popupWhenClose = false);

		bool? AutoClose(string title, string message, string image, List<string> buttons = null, int milliseconds = -1, string link = null, bool showClose = false, bool popupWhenClose = false, bool format = true, bool? autoCloseResult = true);

		bool? AutoCloseMoreStep(string title, ConnectStepInfo stepArr, int milliseconds = -1, bool popupWhenClose = false);

		bool? AutoCloseConnectTutorials(string title, JArray steps, int milliseconds = -1, bool autoPlay = false, double interval = 5000.0, bool showPlayControl = true, bool showClose = true, bool popupWhenClose = true, string noteText = null);

		Task<bool?> TabletTurnoff(string title, string message, string image, string note);

		Task<bool?> DataCollectionAndBackConfirm();

		Task<bool?> BackConfirm(string title, string message, string ok = "K0327", string cancel = null, bool showClose = false, bool isNotifyText = false);

		Task<bool?> EraseData();

		void ShowDownloadCenter(bool show);

		void Close(bool? result, Action<bool?> closeCallback = null);

		void SetMainWindowDriverBtnStatus(string _code);
	}
	public class Recipe
	{
		protected readonly string RuntimeCheckStepName = "RuntimeCheck";

		public List<string> DeviceMonitorConnectedList = new List<string>();

		public List<string> DeviceMonitorCacheIds = new List<string>();

		public bool IsLoadPnPSignedDriver;

		public RecipeInfo Info { get; private set; }

		public ResultLogger Log => UcDevice.Log;

		public List<BaseStep> Steps { get; private set; }

		public SortedList<string, dynamic> Cache { get; private set; }

		public RecipeResources Resources { get; private set; }

		public DeviceEx Device => UcDevice.Device;

		public UseCaseDevice UcDevice { get; set; }

		public int ComPort { get; set; }

		public bool IsEraseDataFailed { get; set; }

		public bool DeviceMonitorRunning { get; set; }

		public Recipe(UseCaseDevice device)
		{
			Resources = device.Resources;
			UcDevice = device;
			Cache = new SortedList<string, object>();
			SetRecipeDevice(device.Device);
		}

		public virtual void SetRecipeDevice(DeviceEx device)
		{
			if (device != null)
			{
				if (Device != null)
				{
					Device.WorkType = DeviceWorkType.None;
				}
				device.WorkType = ((Log.UseCase == UseCase.LMSA_Recovery) ? DeviceWorkType.Rescue : DeviceWorkType.ReadFastboot);
				UcDevice.Device = device;
				Log.AddLog(string.Format("==========Set recipe device id: {0}, modelname: {1}, imei: {2}, connecttype: {3}, softstatus: {4}, worktype: {5} ==========", new object[6]
				{
					Device?.Identifer,
					Device?.Property?.ModelName,
					Device?.Property?.IMEI1,
					Device?.ConnectType,
					Device?.SoftStatus,
					Device?.WorkType
				}), upload: true);
			}
		}

		public void FreeEventHandler(bool realFlash)
		{
			UcDevice.EventHandle.Set();
			if (realFlash)
			{
				UcDevice.RealFlash = true;
				UcDevice.Log.NotifyAsync(RecipeMessageType.REALFLASH, default(RecipeMessage));
			}
		}

		public void Load(RecipeInfo info)
		{
			Info = info;
			Steps = new List<BaseStep>();
			double num = 0.0;
			double num2 = 100.0 / (double)info.Steps.Count;
			foreach (StepInfo step in info.Steps)
			{
				double num3 = 1.0;
				if (step.Args != null && step.Args["ProgressFactor"] != null)
				{
					num3 = step.Args["ProgressFactor"];
				}
				num += num3 * num2;
			}
			double num4 = 0.0;
			int num5 = 1;
			if (Log.UseCase == UseCase.LMSA_Recovery)
			{
				Steps.Add(ConstructRunTimeCheckStep());
				num5 = 2;
			}
			foreach (StepInfo step2 in info.Steps)
			{
				BaseStep baseStep = StepHelper.LoadNew<BaseStep>(step2.Step);
				step2.Args.ProgressStart = num4;
				baseStep.Index = num5++;
				double num6 = 1.0;
				if (step2.Args["ProgressFactor"] != null)
				{
					num6 = step2.Args["ProgressFactor"];
				}
				double num7 = num6 * num2 / num;
				double num8 = num4 + num7 * 100.0;
				step2.Args.ProgressEnd = num8;
				num4 = num8;
				baseStep.Load(this, step2);
				Steps.Add(baseStep);
			}
			Steps.Last().Info.Args.ProgressEnd = 100.0;
		}

		private BaseStep ConstructRunTimeCheckStep()
		{
			JObject stepContent = new JObject
			{
				{ "Name", "Recipe execution environment check" },
				{ "Step", RuntimeCheckStepName },
				{
					"Args",
					new JObject()
				}
			};
			StepInfo stepInfo = new StepInfo();
			stepInfo.Load(stepContent);
			stepInfo.Args.ProgressStart = 0.0;
			stepInfo.Args.ProgressEnd = 0.0;
			BaseStep baseStep = StepHelper.LoadNew<BaseStep>(stepInfo.Step);
			baseStep.Index = 1;
			baseStep.Load(this, stepInfo);
			return baseStep;
		}

		private bool UnzipTool(out string toolDir)
		{
			string text = Resources.Get(RecipeResources.ToolZip);
			toolDir = Resources.Get(RecipeResources.TooL);
			if (!string.IsNullOrEmpty(text) && File.Exists(text) && !GlobalFun.Exists(toolDir) && !Rsd.Instance.UnzipTool(text, toolDir, out var response))
			{
				GlobalCmdHelper.Instance.Execute(new
				{
					type = GlobalCmdType.DELETE_ROM_AFTER_RESCUE,
					data = Path.GetFileName(text)
				});
				Log.AddLog("tool unzip failed: " + response, upload: true);
				UcDevice.MessageBox.Show("K0071", "K1600", "K0327", null, showClose: false, (MessageBoxImage)48).Wait();
				return false;
			}
			return true;
		}

		public void Run()
		{
			if (UnzipTool(out var toolDir))
			{
				Log.CurrentProgress = 0.0;
				string text = string.Empty;
				DriverInstall();
				bool flag = false;
				UcDevice.RecipeLocked = true;
				StartDeviceMonitorAsync();
				HostProxy.deviceManager.StartMonitorFastbootConnect();
				string value = Resources.Get("Mutil");
				bool flag2 = !string.IsNullOrEmpty(value) && !bool.Parse(value);
				foreach (BaseStep step in Steps)
				{
					text = step.Info.Args.SuccessPromptText ?? string.Empty;
					bool flag3 = step.Info.Args.SkipCurrentStep ?? ((object)false);
					bool flag4 = step.Info.Args.AllowSkip ?? ((object)true);
					if ((Log.OverallResult == Result.QUIT && Log.FailedResult == Result.MODELNAME_CHECK_FAILED_REMATCH_QUIT) || flag3 || (Log.OverallResult != Result.PASSED && flag4 && !flag))
					{
						Log.AddResult(step, flag3 ? Result.SKIPPED : Result.CANCELED);
						continue;
					}
					flag = false;
					try
					{
						Log.CurrentProgress = ((step.Info.Args.ProgressEnd >= 100) ? ((object)100) : step.Info.Args.ProgressEnd);
						if (step.VerifyPreContionMet())
						{
							if (flag2)
							{
								if ((bool)(step.Info.Args.DisableFastbootMonitor ?? ((object)false)))
								{
									Log.AddLog("DisableFastbootMonitor Setting :Stop Fastboot Monitor !", upload: true);
									HostProxy.deviceManager.StopFastbootMonitor();
								}
								else if (HostProxy.deviceManager.StartFastbootMonitor())
								{
									Log.AddLog("DisableFastbootMonitor Setting :Start Fastboot Monitor !", upload: true);
								}
							}
							else if (step.Info.Args.TempVP != null)
							{
								step.Info.Args.TempVP = null;
							}
							Log.AddStart(step);
							step.Setup();
							string text2 = step.Info.Args.TempVP;
							if (text2 != null)
							{
								VidPidMonitorHandler.Instance.ChangeMonitorCom(text2);
								Log.AddLog("Temporarily adjust the VIDPID monitoring port to " + text2, upload: true);
							}
							List<BaseStep> subSteps = step.SubSteps;
							if (subSteps != null && subSteps.Count > 0)
							{
								RunSubStep(step);
							}
							else
							{
								RunStep(step);
							}
						}
						else
						{
							Log.AddResult(step, Result.SKIPPED);
						}
					}
					catch (Exception ex)
					{
						step.RunResult = Result.ABORTED.ToString();
						Log.AddResult(step, Result.ABORTED, ex.ToString());
					}
					finally
					{
						if (string.IsNullOrEmpty(step.RunResult))
						{
							step.RunResult = Log.OverallResult.ToString();
						}
						flag = step.IgnoreCurrStepResult;
						if (step.StepResult == Result.FAILED)
						{
							string text3 = step.Info.Args.ErrorPromptText?.ToString();
							if (!string.IsNullOrEmpty(text3) && !step.IgnoreErrorPromptText)
							{
								UcDevice.MessageBox.Show(step.Info.Name, text3, "K0327", null, showClose: false, (MessageBoxImage)48).Wait();
							}
						}
						if (VidPidMonitorHandler.Instance != null && VidPidMonitorHandler.Instance.HasChanged)
						{
							VidPidMonitorHandler.Instance.MonitorComReset();
							Log.AddLog("Step[" + step?.Name + "] has ended, reset the monitoring port to the port set in the initial VidpidMonitoring step", upload: true);
						}
					}
				}
				if (flag2 && HostProxy.deviceManager.StartFastbootMonitor())
				{
					Log.AddLog("DisableFastbootMonitor Setting :Start Fastboot Monitor !", upload: true);
				}
				UcDevice.RecipeLocked = false;
				UcDevice.MessageBox.SetMainWindowDriverBtnStatus("none");
				GlobalFun.DeleteDirectoryEx(toolDir);
				if (Log.OverallResult == Result.PASSED)
				{
					if (IsEraseDataFailed && Log.OverallResult == Result.PASSED)
					{
						Log.FailedResult = Result.FASTBOOT_FLASH_ERASEDATE_FAILED;
					}
					GetDeviceInfo();
					if (!string.IsNullOrEmpty(text))
					{
						Log.SuccessPromptText = text;
					}
				}
				else
				{
					PrintComInfo();
				}
				List<string> list = HostProxy.deviceManager.StopMonitorFastbootConnect();
				if (Log.OverallResult != Result.PASSED && list != null && list.Count > 0)
				{
					Log.AddLog("fastboot device connect data: \r\n" + string.Join("\r\n", list), upload: true);
				}
				if (VidPidMonitorHandler.Instance != null)
				{
					VidPidMonitorHandler.Instance.FinishMonitor();
				}
				StopDeviceMonitor();
				Thread.Sleep(1000);
				Log.Dispose();
			}
			else
			{
				Log.NotifyAsync(RecipeMessageType.UNDO, default(RecipeMessage));
			}
			if (!UcDevice.EventHandle.SafeWaitHandle.IsClosed)
			{
				FreeEventHandler(realFlash: false);
			}
		}

		public void StartDeviceMonitorAsync()
		{
			Task.Run(async delegate
			{
				DeviceMonitorRunning = true;
				IsLoadPnPSignedDriver = false;
				DeviceMonitorConnectedList = new List<string>();
				DeviceMonitorCacheIds = new List<string>();
				int idx = 0;
				do
				{
					List<string> list = new List<string>();
					ManagementObjectSearcher val = new ManagementObjectSearcher("Select * From Win32_PnPEntity");
					try
					{
						ManagementObjectSearcher val2 = new ManagementObjectSearcher("Select * From Win32_USBController");
						try
						{
							List<ManagementBaseObject> list2 = new List<ManagementBaseObject>();
							ManagementObjectEnumerator enumerator = val.Get().GetEnumerator();
							try
							{
								while (enumerator.MoveNext())
								{
									ManagementBaseObject current = enumerator.Current;
									list2.Add(current);
								}
							}
							finally
							{
								((IDisposable)enumerator)?.Dispose();
							}
							enumerator = val2.Get().GetEnumerator();
							try
							{
								while (enumerator.MoveNext())
								{
									ManagementBaseObject current2 = enumerator.Current;
									list2.Add(current2);
								}
							}
							finally
							{
								((IDisposable)enumerator)?.Dispose();
							}
							string dateTime = DateTime.Now.ToString("HH:mm:ss.ffffff");
							foreach (ManagementBaseObject item in list2)
							{
								try
								{
									string text = item.GetPropertyValue("DeviceID") as string;
									if (!string.IsNullOrEmpty(text))
									{
										string text2 = item.GetPropertyValue("Name") as string;
										string text3 = item.GetPropertyValue("Manufacturer") as string;
										string text4 = item.GetPropertyValue("Status") as string;
										list.Add(text);
										if (idx == 0 && !DeviceMonitorCacheIds.Contains(text))
										{
											DeviceMonitorCacheIds.Add(text);
										}
										else if (idx > 0 && !DeviceMonitorCacheIds.Contains(text))
										{
											IsLoadPnPSignedDriver = true;
											DeviceMonitorCacheIds.Add(text);
											string text5 = dateTime + ",Name: " + text2 + ", DeviceId: " + text + ", Manufacturer: " + text3 + ", Status: " + text4;
											if (!string.IsNullOrEmpty(text) && !string.IsNullOrEmpty(text4) && text4.Equals("ok", StringComparison.CurrentCultureIgnoreCase))
											{
												ManagementObjectSearcher val3 = new ManagementObjectSearcher("Select * From Win32_PnPSignedDriver");
												try
												{
													enumerator = val3.Get().GetEnumerator();
													try
													{
														while (enumerator.MoveNext())
														{
															ManagementObject val4 = (ManagementObject)enumerator.Current;
															if (((ManagementBaseObject)val4).GetPropertyValue("DeviceID") as string == text)
															{
																string text6 = ((ManagementBaseObject)val4).GetPropertyValue("DriverProviderName") as string;
																string text7 = ((ManagementBaseObject)val4).GetPropertyValue("DriverVersion") as string;
																string text8 = ((ManagementBaseObject)val4).GetPropertyValue("DriverDate") as string;
																string text9 = ((ManagementBaseObject)val4).GetPropertyValue("Signer") as string;
																text5 = text5 + ", DriverProviderName: " + text6 + ", DriverVersion: " + text7 + ", DriverDate: " + text8 + ", Signer: " + text9;
																break;
															}
														}
													}
													finally
													{
														((IDisposable)enumerator)?.Dispose();
													}
												}
												finally
												{
													((IDisposable)val3)?.Dispose();
												}
											}
											DeviceMonitorConnectedList.Add(text5);
											IsLoadPnPSignedDriver = false;
											Log.AddLog("device connected: " + text5, upload: true);
										}
									}
								}
								catch
								{
								}
							}
							DeviceMonitorCacheIds.Except(list).ToList().ForEach(delegate(string n)
							{
								Log.AddLog("device removed: " + dateTime + "，" + n, upload: true);
								DeviceMonitorCacheIds.Remove(n);
							});
						}
						finally
						{
							((IDisposable)val2)?.Dispose();
						}
					}
					finally
					{
						((IDisposable)val)?.Dispose();
					}
					int num = idx + 1;
					idx = num;
					await Task.Delay(1000).ConfigureAwait(continueOnCapturedContext: false);
				}
				while (DeviceMonitorRunning);
			});
		}

		public void StopDeviceMonitor()
		{
			DeviceMonitorRunning = false;
		}

		public void PrintComInfo()
		{
			List<string> comInfo = GlobalFun.GetComInfo();
			string text = null;
			if (comInfo != null && comInfo.Count > 0)
			{
				text = string.Join("\r\n", comInfo);
			}
			Log.AddLog("com port infos:" + Environment.NewLine + text, upload: true);
		}

		public void Dispose()
		{
			if (Steps != null && Steps.Count != 0)
			{
				Steps.ForEach(delegate(BaseStep p)
				{
					p.Dispose();
				});
			}
		}

		private void GetDeviceInfo()
		{
			if (Device != null && Device.Property != null)
			{
				Log.AddLog($"device info [{Device.ConnectType}]: {JsonHelper.SerializeObject2Json(Device.Property.Others)}");
			}
		}

		private void RunStep(BaseStep step)
		{
			step.Run();
			if (step.Info.Args.Retesting == true)
			{
				Log.AddLog($"Re-running step {step.Info.Name} ({step.Info.Step})", upload: true);
				step.Run();
			}
		}

		private void RunSubStep(BaseStep step)
		{
			if ("before".Equals(step.condition, StringComparison.InvariantCultureIgnoreCase))
			{
				foreach (BaseStep subStep in step.SubSteps)
				{
					Log.AddLog($"before::Running substep '{subStep.Info.Name} ({subStep.Info.Step})'");
					subStep.Run();
				}
				RunStep(step);
				return;
			}
			if ("after".Equals(step.condition, StringComparison.InvariantCultureIgnoreCase))
			{
				RunStep(step);
				{
					foreach (BaseStep subStep2 in step.SubSteps)
					{
						Log.AddLog($"after::Running substep '{subStep2.Info.Name} ({subStep2.Info.Step})'");
						subStep2.Run();
					}
					return;
				}
			}
			RunStep(step);
		}

		private void DriverInstall()
		{
			DriverType drivertype = DriverType.Lenovo;
			string text = Resources.Get(RecipeResources.RealModelName);
			string value = Resources.Get("Platform");
			if (!CheckDriverWhiteList(text))
			{
				if (Resources.Get("IsFastboot") == true.ToString())
				{
					drivertype = DriverType.Motorola;
					string text2 = DriversHelper.CheckMotorolaDriverExeInstalled(delegate(string _arg)
					{
						UcDevice.MessageBox.SetMainWindowDriverBtnStatus(_arg);
					});
					LogHelper.LogInstance.Debug(text2);
					Log.AddLog(text2, upload: true);
				}
				else if ("MTK".Equals(value, StringComparison.CurrentCultureIgnoreCase))
				{
					drivertype = DriverType.MTK;
				}
				else if ("Unisoc".Equals(value, StringComparison.CurrentCultureIgnoreCase))
				{
					drivertype = ((string.IsNullOrEmpty(text) || !Regex.IsMatch(text, "L19111", RegexOptions.IgnoreCase)) ? DriverType.Unisoc : DriverType.Unisoc_L19111);
				}
				if (!string.IsNullOrEmpty(text))
				{
					if (Regex.IsMatch(text, "SP101FU", RegexOptions.IgnoreCase))
					{
						drivertype = DriverType.PNP;
					}
					else if (Regex.IsMatch(text, "CD-17302F", RegexOptions.IgnoreCase))
					{
						drivertype = DriverType.ADBDRIVER;
					}
				}
				DriversHelper.CheckAndInstallInfDriver(drivertype, null, out var output);
				if (!string.IsNullOrEmpty(output))
				{
					LogHelper.LogInstance.Debug(output);
					Log.AddLog(output, upload: true);
				}
			}
			UcDevice.MessageBox.SetMainWindowDriverBtnStatus("installed");
		}

		private bool CheckDriverWhiteList(string _modelName)
		{
			string output = string.Empty;
			if (string.IsNullOrEmpty(_modelName))
			{
				return false;
			}
			List<string> list = new ApiService().RequestContent<List<string>>(WebApiUrl.RESUCE_CHECK_MODEL_NAME_DRIVERS, new
			{
				modelName = _modelName
			});
			if (list != null && list.Count > 0)
			{
				foreach (string item in list)
				{
					if (!Enum.TryParse<DriverType>(item, out var result))
					{
						continue;
					}
					if (result == DriverType.Motorola)
					{
						string text = DriversHelper.CheckMotorolaDriverExeInstalled(delegate(string _arg)
						{
							UcDevice.MessageBox.SetMainWindowDriverBtnStatus(_arg);
						});
						LogHelper.LogInstance.Debug(text);
						Log.AddLog(text, upload: true);
					}
					DriversHelper.CheckAndInstallInfDriver(result, null, out output);
					if (!string.IsNullOrEmpty(output))
					{
						LogHelper.LogInstance.Debug(output);
						Log.AddLog(output, upload: true);
					}
				}
				return true;
			}
			foreach (KeyValuePair<string, List<DriverType>> driver_White_ in DriversHelper.Driver_White_List)
			{
				if (!Regex.IsMatch(_modelName, driver_White_.Key, RegexOptions.IgnoreCase))
				{
					continue;
				}
				foreach (DriverType item2 in driver_White_.Value)
				{
					if (item2 == DriverType.Motorola)
					{
						string text2 = DriversHelper.CheckMotorolaDriverExeInstalled(delegate(string _arg)
						{
							UcDevice.MessageBox.SetMainWindowDriverBtnStatus(_arg);
						});
						LogHelper.LogInstance.Debug(text2);
						Log.AddLog(text2, upload: true);
					}
					DriversHelper.CheckAndInstallInfDriver(item2, null, out output);
					if (!string.IsNullOrEmpty(output))
					{
						LogHelper.LogInstance.Debug(output);
						Log.AddLog(output, upload: true);
					}
				}
				return true;
			}
			return false;
		}
	}
	public class RecipeInfo
	{
		public string Name { get; private set; }

		public string UseCase { get; private set; }

		public bool CheckOpenSSL { get; private set; }

		public List<Tuple<bool, string, string>> DriverList { get; private set; }

		public List<StepInfo> Steps { get; private set; }

		public dynamic Args { get; private set; }

		public bool CheckClientVersion { get; private set; }

		public void Load(dynamic content)
		{
			Name = content.Name;
			UseCase = content.UseCase;
			CheckOpenSSL = content.CheckOpenSSL ?? ((object)false);
			DriverList = new List<Tuple<bool, string, string>>();
			if (content.CheckDrivers is JArray { HasValues: not false } jArray)
			{
				foreach (JToken item in jArray)
				{
					DriverList.Add(new Tuple<bool, string, string>(item.Value<bool>("IsInf"), item.Value<string>("DriverName"), item.Value<string>("FileName")));
				}
			}
			Steps = new List<StepInfo>();
			CheckClientVersion = content.CheckClientVersion ?? ((object)false);
			foreach (dynamic item2 in content.Steps)
			{
				StepInfo stepInfo = new StepInfo();
				stepInfo.Load(item2);
				Steps.Add(stepInfo);
			}
			Args = new ExpandoObject();
		}
	}
	public enum RecipeMessageType
	{
		UNDO,
		START,
		STEP,
		PROGRESS,
		DATA,
		MODELNAME,
		FINISH,
		REALFLASH
	}
	public struct RecipeMessage
	{
		public string RecipeName;

		public double Progress;

		public string StepName;

		public UseCase UseCase;

		[JsonConverter(typeof(StringEnumConverter))]
		public Result OverallResult;

		public object Message;

		public int Index;

		public SortedList<string, string> Info;

		public string failedDescription;

		public Result? FailedResult;

		public string FailedStepName;

		[JsonIgnore]
		public DeviceEx Device;
	}
	public class RecipeResources
	{
		public static string RecipeUrl = "RecipeUrl";

		public static string ModelName = "ModelName";

		public static string RealModelName = "RealModelName";

		public static string TooL = "Tool";

		public static string ToolZip = "ToolZip";

		public static string Rom = "Rom";

		public static string CountryCode = "CountryCode";

		public const string Platform = "Platform";

		public const string IsFastboot = "IsFastboot";

		public Dictionary<string, string> Resources { get; private set; }

		public ResultLogger Log { get; set; }

		public RecipeResources()
		{
			Resources = new Dictionary<string, string>();
		}

		public void Clear()
		{
			Resources.Clear();
		}

		public void Add(string key, string value)
		{
			if (Resources.ContainsKey(key))
			{
				Resources[key] = value;
			}
			else
			{
				Resources.Add(key, value);
			}
		}

		public string Get(string key)
		{
			Resources.TryGetValue(key, out var value);
			return value;
		}

		public void AddResource(string key, string url)
		{
			Rsd.Instance.GetDownloadedResource(url, out var filePath);
			if (key == TooL)
			{
				Resources.Add(TooL, Path.Combine(Configurations.ToolPath, Guid.NewGuid().ToString("N")));
				Resources.Add(ToolZip, filePath);
			}
			else
			{
				Resources.Add(key, filePath);
			}
		}

		public string GetLocalFilePath(string name, string filename = null)
		{
			if (name.Equals("xmlFile", StringComparison.CurrentCultureIgnoreCase))
			{
				if (string.IsNullOrEmpty(filename))
				{
					filename = "flashfile.xml";
				}
				return GetXmlFlashFile(filename);
			}
			if (name.Equals("upgradeXmlFile", StringComparison.CurrentCultureIgnoreCase))
			{
				return GetXmlFlashFile("servicefile.xml");
			}
			if (name.StartsWith("flashinfo", StringComparison.CurrentCultureIgnoreCase) || name.Equals("softwareupgrade", StringComparison.CurrentCultureIgnoreCase))
			{
				return GetFlashInfoFile(name);
			}
			if (name.Equals("recoveryFile", StringComparison.CurrentCultureIgnoreCase))
			{
				return GetRecoveryFile();
			}
			if (name.Equals("recoveryFile2", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(Rom, out var value);
				string fullPathName = GetFullPathName(value, "*.img");
				if (!GlobalFun.Exists(fullPathName))
				{
					Log.AddLog(value + ": *.img not exists", upload: true);
				}
				return fullPathName;
			}
			if (name.Equals("recoveryExe", StringComparison.CurrentCultureIgnoreCase))
			{
				return GetRecoveryExe();
			}
			if (name.Equals("recoveryExe2", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(TooL, out var value2);
				string fullPathName2 = GetFullPathName(value2, "flash_tool.exe");
				if (string.IsNullOrEmpty(fullPathName2))
				{
					fullPathName2 = GetFullPathName(value2, "SPFlashToolV6.exe");
				}
				if (!GlobalFun.Exists(fullPathName2))
				{
					Log.AddLog(value2 + ": flash_tool.exe|SPFlashToolV6.exe not exists", upload: true);
				}
				return fullPathName2;
			}
			if (name.Equals("fastbootExe", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(TooL, out var value3);
				if (!GlobalFun.Exists(GetFullPathName(value3, "fastboot.exe")))
				{
					Log.AddLog(value3 + ": fastboot.exe not exists", upload: true);
				}
				return string.Empty;
			}
			if (name.Equals("countryCodes", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(CountryCode, out var value4);
				if (!GlobalFun.Exists(value4))
				{
					Log.AddLog(value4 + ": country code path not exists", upload: true);
				}
				return value4;
			}
			if (name.Equals("progFile", StringComparison.CurrentCultureIgnoreCase))
			{
				return GetProgFile();
			}
			if (name.Equals("recoveryFolder", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(Rom, out var value5);
				return value5;
			}
			if (name.StartsWith("cfc_flash", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(Rom, out var value6);
				string fullPathName3 = GetFullPathName(value6, name);
				if (!GlobalFun.Exists(fullPathName3))
				{
					Log.AddLog(value6 + ": " + name + " not exists", upload: true);
				}
				return fullPathName3;
			}
			if (name.StartsWith("Check_rollbackid_update", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(Rom, out var value7);
				string fullPathName4 = GetFullPathName(value7, name);
				if (!GlobalFun.Exists(fullPathName4))
				{
					Log.AddLog(value7 + ": " + name + " not exists", upload: true);
				}
				return fullPathName4;
			}
			if (name.StartsWith("root", StringComparison.CurrentCultureIgnoreCase))
			{
				return Environment.CurrentDirectory;
			}
			if (name.Equals("toolFolder", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(TooL, out var value8);
				while (Directory.GetFiles(value8).Length == 0)
				{
					string[] directories = Directory.GetDirectories(value8);
					if (directories.Length == 0)
					{
						break;
					}
					value8 = directories[0];
				}
				if (!Directory.Exists(value8))
				{
					Log.AddLog(value8 + ": tool directory not exists", upload: true);
				}
				return value8;
			}
			if (name.ToUpper().EndsWith(".BAT"))
			{
				Resources.TryGetValue(Rom, out var value9);
				string fullPathName5 = GetFullPathName(value9, name);
				if (!GlobalFun.Exists(fullPathName5))
				{
					Log.AddLog(value9 + ": " + name + " not exists", upload: true);
				}
				return fullPathName5;
			}
			Resources.TryGetValue(Rom, out var value10);
			string fullPathName6 = GetFullPathName(value10, name);
			if (string.IsNullOrEmpty(fullPathName6))
			{
				Resources.TryGetValue(TooL, out value10);
				fullPathName6 = GetFullPathName(value10, name);
			}
			if (!GlobalFun.Exists(fullPathName6))
			{
				Log.AddLog(value10 + ": " + name + " not exists", upload: true);
			}
			return fullPathName6;
		}

		public string GetFastbootToolPath(string name, string findDirectory = "")
		{
			if (string.IsNullOrEmpty(findDirectory))
			{
				return Configurations.FastbootPath;
			}
			if (findDirectory.Equals("ROM", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(Rom, out var value);
				return GetFullPathName(value, name);
			}
			if (findDirectory.Equals("TOOL", StringComparison.CurrentCultureIgnoreCase))
			{
				Resources.TryGetValue(TooL, out var value2);
				return GetFullPathName(value2, name);
			}
			return null;
		}

		private string GetXmlFlashFile(string filename)
		{
			Resources.TryGetValue(Rom, out var value);
			string[] files = Directory.GetFiles(value, filename, SearchOption.AllDirectories);
			if (files != null && files.Length != 0)
			{
				return files.First();
			}
			string fileName = Path.GetFileName(value);
			string text = Path.Combine(value, fileName);
			if (File.Exists(text))
			{
				return text;
			}
			files = Directory.GetFiles(value, "*.xml", SearchOption.AllDirectories);
			string[] array = files;
			foreach (string text2 in array)
			{
				if (File.ReadAllText(text2).Contains("operation=\"flash\""))
				{
					return text2;
				}
			}
			Log.AddLog(value + ": " + filename + " not exists", upload: true);
			return string.Empty;
		}

		private string GetFlashInfoFile(string name)
		{
			string text = string.Empty;
			string text2 = string.Empty;
			string empty = string.Empty;
			string value = string.Empty;
			Resources.TryGetValue(Rom, out value);
			Resources.TryGetValue(TooL, out var value2);
			name = name.ToLower();
			if (name.Contains("flashinfo"))
			{
				string text3 = "FlashInfo";
				if (name.Equals("flashinfo3", StringComparison.CurrentCultureIgnoreCase))
				{
					text3 = "FlashInfo_RSA";
				}
				text = GetFullPathName(value, text3 + ".tmp");
				if (string.IsNullOrEmpty(text))
				{
					Log.AddLog(value + ": " + text3 + ".tmp not exists", upload: true);
					return string.Empty;
				}
				value = Path.GetDirectoryName(text);
				text2 = Path.Combine(value, text3 + ".xml");
				empty = GetFullPathName(value2, "flash*.exe");
				if (string.IsNullOrEmpty(empty))
				{
					Log.AddLog(value2 + ": flash*.exe not exists", upload: true);
					return string.Empty;
				}
				value2 = Path.GetDirectoryName(empty);
			}
			else if (name.Contains("softwareupgrade"))
			{
				text = GetFullPathName(value, "SoftwareUpgrade.tmp");
				if (string.IsNullOrEmpty(text))
				{
					Log.AddLog(value + ": SoftwareUpgrade.tmp not exists", upload: true);
					return string.Empty;
				}
				value = Path.GetDirectoryName(text);
				text2 = Path.Combine(value, "SoftwareUpgrade.xml");
				empty = GetFullPathName(value2, "flash*.exe");
				if (string.IsNullOrEmpty(empty))
				{
					Log.AddLog(value2 + ": flash*.exe not exists", upload: true);
					return string.Empty;
				}
				value2 = Path.GetDirectoryName(empty);
			}
			else if (name.Contains("efuse"))
			{
				text = GetFullPathName(value, "Efuse.tmp");
				text2 = GetFullPathName(value, "Efuse.xml");
			}
			else if (name.Contains("lkbin"))
			{
				text = GetFullPathName(value, "LkBin.tmp");
				text2 = GetFullPathName(value, "LkBin.xml");
			}
			if (!File.Exists(text))
			{
				Log.AddLog(text + " not exists", upload: true);
				return string.Empty;
			}
			string text4 = File.ReadAllText(text);
			foreach (Match item in Regex.Matches(text4, "(?<=>)(SP_FLASH_TOOL_DIR|RECOVERY_FILE_DIR).*(?=</)", RegexOptions.IgnoreCase | RegexOptions.Multiline))
			{
				string text5 = item.Value.Replace("RECOVERY_FILE_DIR", value).Replace("SP_FLASH_TOOL_DIR", value2);
				if (!File.Exists(text5))
				{
					Log.AddLog(text5 + " not exists", upload: true);
					return string.Empty;
				}
			}
			text4 = text4.Replace("SP_FLASH_TOOL_DIR", value2);
			text4 = text4.Replace("RECOVERY_FILE_DIR", value);
			File.WriteAllText(text2, text4);
			return text2;
		}

		private string GetRecoveryFile()
		{
			Resources.TryGetValue(Rom, out var value);
			string fullPathName = GetFullPathName(value, "prog_emmc_firehose_*.mbn");
			fullPathName = ((!string.IsNullOrEmpty(fullPathName)) ? Path.GetDirectoryName(fullPathName) : GetFullPathName(value, "*_Android_scatter.txt"));
			if (string.IsNullOrEmpty(fullPathName))
			{
				fullPathName = GetFullPathName(value, "*.pac");
			}
			if (!GlobalFun.Exists(fullPathName))
			{
				Log.AddLog(value + ": prog_emmc_firehose_*.mbn|*_Android_scatter.txt|*.pac not exists", upload: true);
			}
			return fullPathName;
		}

		public string GetRecoveryExe()
		{
			string value = string.Empty;
			Resources.TryGetValue(TooL, out value);
			List<string> obj = new List<string> { "QcomDLoader.exe", "flash_tool.exe", "QFIL.exe", "CmdDloader.exe", "upgrade_tool.exe", "LXConsoleDownLoadTool.exe" };
			string text = null;
			foreach (string item in obj)
			{
				text = GetFullPathName(value, item);
				if (!string.IsNullOrEmpty(text))
				{
					break;
				}
			}
			if (!GlobalFun.Exists(text))
			{
				Log.AddLog(value + ": QcomDLoader.exe|flash_tool.exe|QFIL.exe|CmdDloader.exe|upgrade_tool.exe|LXConsoleDownLoadTool.exe not exists", upload: true);
			}
			return text;
		}

		public string GetRecoveryCmd(string name)
		{
			Resources.TryGetValue(Rom, out var value);
			string fullPathName = GetFullPathName(value, name);
			if (string.IsNullOrEmpty(fullPathName))
			{
				fullPathName = GetFullPathName(value, "Rescue.cmd");
			}
			if (string.IsNullOrEmpty(fullPathName))
			{
				fullPathName = GetFullPathName(value, "Flash.cmd");
			}
			return fullPathName;
		}

		private string GetProgFile()
		{
			Resources.TryGetValue(Rom, out var value);
			string? text = (from n in Directory.GetFiles(value, "*ddr.*", SearchOption.AllDirectories)
				where Regex.IsMatch(Path.GetFileName(n), "(.+ddr\\.mbn$)|(.+ddr\\.elf$)")
				select n).FirstOrDefault();
			if (!GlobalFun.Exists(text))
			{
				Log.AddLog(value + ": (.+ddr\\.mbn$)|(.+ddr\\.elf$) not exists", upload: true);
			}
			return text;
		}

		private string GetFullPathName(string dir, string filePattern)
		{
			if (!Directory.Exists(dir))
			{
				return string.Empty;
			}
			string[] files = Directory.GetFiles(dir, filePattern, SearchOption.AllDirectories);
			if (files.Length == 0)
			{
				return string.Empty;
			}
			return files[0];
		}

		public bool IsResourceDirExist()
		{
			Resources.TryGetValue(Rom, out var value);
			if (!Directory.Exists(value))
			{
				Log.AddLog(value + ": rom directory not exists", upload: true);
				return false;
			}
			Resources.TryGetValue(TooL, out var value2);
			if (!string.IsNullOrEmpty(value2) && !Directory.Exists(value2))
			{
				Log.AddLog(value2 + ": tool directory not exists", upload: true);
				return false;
			}
			return true;
		}
	}
	public enum Result
	{
		FAILED,
		PASSED,
		QUIT,
		MANUAL_QUIT,
		INTERCEPTOR_QUIT,
		ABORTED,
		SKIPPED,
		CANCELED,
		ADB_CONNECT_FAILED,
		CLEAR_FACTORYMODE_FAILED,
		FASTBOOT_FLASH_SINGLEPARTITION_FAILED,
		FASTBOOT_SHELL_FAILED,
		FASTBOOT_FLASH_FAILED,
		FASTBOOT_FLASH_ERASEDATE_FAILED,
		FASTBOOT_FLASH_FILE_MATCH_FAILED,
		FASTBOOT_SLOT_SET_FAILED,
		FASTBOOT_CONNECT_FAILED,
		FASTBOOT_DEGRADE_QUIT,
		FASTBOOT_CID_CHECKE_QUIT,
		FASTBOOT_ERROR_RULES_QUIT,
		FIND_COMPORT_FAILED,
		FIND_LOCATIONPORT_FAILED,
		LOAD_RESOURCE_FAILED,
		LOAD_RESOURCE_FAILED_REPLACE,
		LOAD_RESOURCE_FAILED_COUNTRYCODE,
		SHELL_CONNECTED_FAILED,
		SHELL_RESCUE_FAILED,
		SHELL_EXE_TERMINATED_EXIT,
		SHELL_EXE_START_FAILED,
		ROM_UNMATCH_FAILED,
		PROCESS_FORCED_TEREMINATION,
		FIND_PNPDEVICE_FAILED,
		DEVICE_CONNECT_FAILED,
		PROGRESS,
		AUTRORIZED_FAILED,
		INSTALL_VC_RUNNINGTIME_FAILED,
		MODELNAME_CHECK_FAILED_QUIT,
		CHECK_ROM_FILE_FAILED,
		COPYFILES_FAILED,
		COPYLOGS_FAILED,
		DRIVER_INSTALL_FAILED,
		ROM_DIRECTORY_NOT_EXISTS,
		CLIENT_VERSION_LOWER_QUIT,
		MODELNAME_CHECK_FAILED_REMATCH_QUIT,
		Remove_Google_Account_Quit
	}
	public class ResultLogger
	{
		protected UseCaseDevice UcDevice;

		private bool disposedValue;

		public string ClassGuid { get; }

		public long StartTimestamp { get; set; }

		public long EndTimestamp { get; set; }

		public SortedList<string, string> Info { get; set; }

		public Result OverallResult { get; set; }

		public Result? FailedResult { get; set; }

		public string FailedDescription { get; set; }

		public string FailedStepName { get; set; }

		public object Lock { get; }

		public UseCase UseCase { get; set; }

		public string SuccessPromptText { get; set; }

		public double CurrentProgress { get; set; }

		protected ConcurrentQueue<Tuple<string, bool>> LogQueue { get; }

		public string Logs => string.Join(Environment.NewLine, from n in LogQueue.ToList()
			select n.Item1);

		public string UploadLogs => string.Join(Environment.NewLine, from n in LogQueue.ToList()
			where n.Item2
			select n.Item1);

		public ResultLogger(UseCaseDevice device)
		{
			ClassGuid = Guid.NewGuid().ToString("N");
			StartTimestamp = GlobalFun.ToUtcTimeStamp(DateTime.Now);
			EndTimestamp = long.MaxValue;
			LogQueue = new ConcurrentQueue<Tuple<string, bool>>();
			Lock = new object();
			Info = new SortedList<string, string>();
			OverallResult = Result.PASSED;
			UcDevice = device;
			SuccessPromptText = string.Empty;
		}

		public void AddInfo(string name, string value)
		{
			lock (Lock)
			{
				Info[name] = value;
			}
		}

		public void AddResult(BaseStep step, Result result)
		{
			AddResult(step, result, null);
		}

		public void AddStart(BaseStep step)
		{
			AddLog($"{step.Index}.{step.Info.Name}({step.Info.Step}) start", upload: true);
			RecipeMessage recipeMessage = new RecipeMessage
			{
				UseCase = UseCase,
				StepName = step.Info.Name,
				Message = step.Info.Name,
				Index = step.Index,
				OverallResult = OverallResult
			};
			NotifyAsync(RecipeMessageType.START, recipeMessage);
		}

		private Result ExecResultConditon(BaseStep step, string response)
		{
			if (step.Info.Args.ResultConditions is JArray { HasValues: not false } jArray)
			{
				foreach (JToken item in jArray)
				{
					List<string> list = item.Value<JArray>("Condition").Values<string>().ToList();
					if (list != null && list.Count > 0 && list.Exists((string n) => n.Equals(response, StringComparison.CurrentCultureIgnoreCase)))
					{
						string value = item.Value<string>("RescueMark");
						AddInfo("rescuemark", value);
						if (Enum.TryParse<Result>(item.Value<string>("Result"), out var result))
						{
							return result;
						}
					}
				}
			}
			return Result.CANCELED;
		}

		public void AddResult(BaseStep step, Result result, string response)
		{
			lock (Lock)
			{
				Result result2 = ExecResultConditon(step, response);
				if (result2 != Result.CANCELED)
				{
					result = result2;
				}
				string text = string.Format("{0}.{1}({2}) {3}", new object[4]
				{
					step.Index,
					step.Info.Name,
					step.Info.Step,
					result
				});
				if (!string.IsNullOrEmpty(response))
				{
					text = text + ", response: " + response;
				}
				AddLog(text, upload: true);
				step.StepResult = ConvertResult(result);
				if (string.IsNullOrEmpty(step.RunResult))
				{
					step.RunResult = step.StepResult.ToString();
				}
				if (result == Result.MODELNAME_CHECK_FAILED_REMATCH_QUIT)
				{
					if (!string.IsNullOrEmpty(response) && string.IsNullOrEmpty(FailedDescription))
					{
						FailedDescription = string.Format("{0}({1}): {2}, {3}", new object[4]
						{
							step.Info.Name,
							step.Info.Step,
							result,
							response
						});
					}
					FailedStepName = step.Name;
					OverallResult = Result.QUIT;
					FailedResult = result;
				}
				else if (!step.IgnoreFinalResult)
				{
					if (!string.IsNullOrEmpty(response) && string.IsNullOrEmpty(FailedDescription))
					{
						FailedDescription = string.Format("{0}({1}): {2}, {3}", new object[4]
						{
							step.Info.Name,
							step.Info.Step,
							result,
							response
						});
					}
					if (OverallResult != Result.QUIT)
					{
						if (step.StepResult == Result.PASSED)
						{
							OverallResult = Result.PASSED;
							FailedResult = null;
							FailedDescription = null;
						}
						else if (step.StepResult == Result.FAILED)
						{
							OverallResult = Result.FAILED;
							FailedResult = result;
							FailedStepName = step.Name;
						}
						else if (step.StepResult == Result.QUIT)
						{
							FailedStepName = step.Name;
							OverallResult = Result.QUIT;
							FailedResult = result;
						}
					}
				}
				RecipeMessage recipeMessage = new RecipeMessage
				{
					UseCase = UseCase,
					StepName = step.Name,
					Index = step.Index,
					Progress = CurrentProgress,
					OverallResult = OverallResult
				};
				NotifyAsync(RecipeMessageType.STEP, recipeMessage);
			}
		}

		public void AddLog(string log, bool upload = false, Exception ex = null)
		{
			string text = $"{DateTime.Now:yyyy/MM/dd HH:mm:ss} [{Thread.CurrentThread.ManagedThreadId,2}] - {log}";
			if (ex != null)
			{
				text = $"{text}{Environment.NewLine}{ex}";
			}
			if (!Configurations.BaseHttpUrl.Contains("lsa.lenovo.com"))
			{
				LogHelper.LogInstance.Debug(UcDevice.Id + " : " + log, ex);
			}
			LogQueue.Enqueue(new Tuple<string, bool>(text, upload));
		}

		public void LogClear()
		{
			while (!LogQueue.IsEmpty)
			{
				LogQueue.TryDequeue(out var _);
			}
		}

		public Task<object> NotifyAsync(RecipeMessageType tag, object data)
		{
			if (tag == RecipeMessageType.UNDO)
			{
				AddLog($"***********device: {UcDevice.Id}, usecase: {UseCase} finished, overResult: UnDo***********", upload: true);
				EndTimestamp = GlobalFun.ToUtcTimeStamp(DateTime.Now);
				LogHelper.LogInstance.Info(Environment.NewLine + Logs);
			}
			return UcDevice.NotifyAsync(tag, data);
		}

		private Result ConvertResult(Result result)
		{
			switch (result)
			{
			case Result.FAILED:
			case Result.ABORTED:
			case Result.ADB_CONNECT_FAILED:
			case Result.CLEAR_FACTORYMODE_FAILED:
			case Result.FASTBOOT_FLASH_SINGLEPARTITION_FAILED:
			case Result.FASTBOOT_SHELL_FAILED:
			case Result.FASTBOOT_FLASH_FAILED:
			case Result.FASTBOOT_FLASH_ERASEDATE_FAILED:
			case Result.FASTBOOT_FLASH_FILE_MATCH_FAILED:
			case Result.FASTBOOT_SLOT_SET_FAILED:
			case Result.FASTBOOT_CONNECT_FAILED:
			case Result.FIND_COMPORT_FAILED:
			case Result.FIND_LOCATIONPORT_FAILED:
			case Result.SHELL_CONNECTED_FAILED:
			case Result.SHELL_RESCUE_FAILED:
			case Result.ROM_UNMATCH_FAILED:
			case Result.PROCESS_FORCED_TEREMINATION:
			case Result.FIND_PNPDEVICE_FAILED:
			case Result.DEVICE_CONNECT_FAILED:
			case Result.AUTRORIZED_FAILED:
			case Result.COPYFILES_FAILED:
			case Result.COPYLOGS_FAILED:
				return Result.FAILED;
			case Result.PASSED:
				return Result.PASSED;
			case Result.QUIT:
			case Result.MANUAL_QUIT:
			case Result.INTERCEPTOR_QUIT:
			case Result.FASTBOOT_DEGRADE_QUIT:
			case Result.FASTBOOT_CID_CHECKE_QUIT:
			case Result.FASTBOOT_ERROR_RULES_QUIT:
			case Result.LOAD_RESOURCE_FAILED:
			case Result.LOAD_RESOURCE_FAILED_REPLACE:
			case Result.LOAD_RESOURCE_FAILED_COUNTRYCODE:
			case Result.SHELL_EXE_TERMINATED_EXIT:
			case Result.SHELL_EXE_START_FAILED:
			case Result.INSTALL_VC_RUNNINGTIME_FAILED:
			case Result.MODELNAME_CHECK_FAILED_QUIT:
			case Result.CHECK_ROM_FILE_FAILED:
			case Result.DRIVER_INSTALL_FAILED:
			case Result.ROM_DIRECTORY_NOT_EXISTS:
			case Result.CLIENT_VERSION_LOWER_QUIT:
			case Result.MODELNAME_CHECK_FAILED_REMATCH_QUIT:
				return Result.QUIT;
			default:
				return result;
			}
		}

		protected virtual void Dispose(bool disposing)
		{
			if (disposedValue)
			{
				return;
			}
			if (disposing)
			{
				lock (Lock)
				{
					RecipeMessage recipeMessage = new RecipeMessage
					{
						OverallResult = OverallResult,
						UseCase = UseCase,
						Message = SuccessPromptText,
						Info = Info,
						failedDescription = FailedDescription,
						FailedResult = FailedResult,
						FailedStepName = FailedStepName
					};
					if (!string.IsNullOrEmpty(UcDevice.Device?.Identifer))
					{
						Info.Add("trackId", UcDevice.Device?.Identifer);
					}
					NotifyAsync(RecipeMessageType.FINISH, recipeMessage);
					if (FailedResult.HasValue)
					{
						AddLog(string.Format("***********device: {0}, usecase: {1} finished, failedResult: {2}, overResult: {3}***********", new object[4] { UcDevice.Id, UseCase, FailedResult, OverallResult }), upload: true);
					}
					else
					{
						AddLog($"***********device: {UcDevice.Id}, usecase: {UseCase} finished, overResult: {OverallResult}***********", upload: true);
					}
					EndTimestamp = GlobalFun.ToUtcTimeStamp(DateTime.Now);
					LogHelper.LogInstance.Info(Environment.NewLine + Logs);
				}
			}
			disposedValue = true;
		}

		public void Dispose()
		{
			Dispose(disposing: true);
		}
	}
	public class StepHelper
	{
		public static ReturnType LoadNew<ReturnType>(string stepName)
		{
			ReturnType result = default(ReturnType);
			Assembly assembly = typeof(StepHelper).Assembly;
			Type type = assembly.GetType($"{assembly.GetName().Name}.Steps.{stepName}");
			try
			{
				result = (ReturnType)Activator.CreateInstance(type);
				return result;
			}
			catch (Exception)
			{
			}
			return result;
		}
	}
	public class StepInfo
	{
		private string TAG => GetType().FullName;

		public string Name { get; private set; }

		public string Step { get; private set; }

		public dynamic Args { get; private set; }

		public dynamic SubSteps { get; private set; }

		public void Load(dynamic stepContent)
		{
			Name = stepContent.Name;
			Step = stepContent.Step;
			Args = (object)stepContent.Args;
			SubSteps = (object)stepContent.SubSteps;
		}
	}
	public class UseCaseDevice
	{
		public DeviceEx Device { get; set; }

		public string Id { get; set; }

		public bool ManualDevice { get; set; }

		public bool Locked { get; set; }

		public bool RealFlash { get; set; }

		public bool RecipeLocked { get; set; }

		public RecipeResources Resources { get; set; }

		protected Func<RecipeMessageType, object, object> NotifyFunc { get; set; }

		public IRecipeMessage MessageBox { get; set; }

		public ResultLogger Log { get; set; }

		public string StartTime { get; set; }

		public AutoResetEvent EventHandle { get; set; }

		public UseCaseDevice(DeviceEx device, string id)
		{
			EventHandle = new AutoResetEvent(initialState: false);
			Device = ((device != null && device.ConnectType == ConnectType.Wifi) ? null : device);
			ManualDevice = Device == null;
			Id = id;
		}

		public void Register(RecipeResources resources, IRecipeMessage messagebox, Func<RecipeMessageType, object, object> notifyFunc)
		{
			Resources = resources;
			MessageBox = messagebox;
			NotifyFunc = notifyFunc;
		}

		public virtual Task<object> NotifyAsync(RecipeMessageType tag, object data)
		{
			return Task.Run(() => NotifyFunc(tag, data));
		}

		public override string ToString()
		{
			StringBuilder stringBuilder = new StringBuilder("Virtual device id: " + Id + ", Physical device id: " + Device?.Identifer);
			if (ManualDevice)
			{
				stringBuilder.AppendLine(",NOTE: This device was manually registered, no physical device was detected");
			}
			else
			{
				stringBuilder.AppendLine(",NOTE: Physical device detected");
			}
			return stringBuilder.ToString();
		}
	}
	public class UseCaseRunner
	{
		public static ConcurrentQueue<UseCaseDevice> Queues = new ConcurrentQueue<UseCaseDevice>();

		public static Dictionary<string, ResultLogger> Loggers = new Dictionary<string, ResultLogger>();

		public static void Run(UseCase useCase, UseCaseDevice device)
		{
			device.StartTime = DateTime.Now.ToString("MM/dd HH:mm:ss");
			ResultLogger resultLogger = new ResultLogger(device)
			{
				UseCase = useCase
			};
			Loggers.Add(resultLogger.ClassGuid, resultLogger);
			device.Log = resultLogger;
			device.Resources.Log = device.Log;
			device.EventHandle = new AutoResetEvent(initialState: false);
			device.Log.AddLog(string.Format("***********device: {0}, usecase: {1}, start: {2}, logid: {3}***********", new object[4] { device.Id, useCase, device.StartTime, resultLogger.ClassGuid }), upload: true);
			device.Log.AddLog(device.ToString(), upload: true);
			foreach (KeyValuePair<string, string> resource in device.Resources.Resources)
			{
				device.Log.AddLog("recipe resource: " + resource.Key + " = " + resource.Value, upload: true);
			}
			Task<object> task = Task.Run(delegate
			{
				string text = device.Resources.Get(RecipeResources.RecipeUrl);
				device.Log.AddLog("Recipe: " + text, upload: true);
				text = (text.StartsWith("http", StringComparison.CurrentCultureIgnoreCase) ? text : ("http://" + text));
				return (dynamic)JsonHelper.DeserializeJson2Object(WebApiHttpRequest.GetRecipeContent(text));
			});
			if ((dynamic)task.Result == null)
			{
				device.Log.AddLog("the recipe content is null", upload: true);
				device.MessageBox.Show("K0181", "K1425", "K0327", null, showClose: false, (MessageBoxImage)64).Wait();
				device.Log.NotifyAsync(RecipeMessageType.UNDO, default(RecipeMessage));
				return;
			}
			if (useCase == UseCase.LMSA_Read_Fastboot)
			{
				ExecuteRecipeTask(device, task);
				return;
			}
			lock (Queues)
			{
				IList<DeviceEx> conntectedDevices = HostProxy.deviceManager.ConntectedDevices;
				if (conntectedDevices.Count((DeviceEx n) => n.ConnectType != ConnectType.Wifi && n.WorkType == DeviceWorkType.None) > 0 && (device.Device == null || conntectedDevices.Count((DeviceEx n) => n.Identifer == device.Device.Identifer) == 0))
				{
					device.MessageBox.Show("K0711", "K1651", "K0327", null, showClose: false, (MessageBoxImage)64).Wait();
				}
				ExecuteRecipeTask(device, task);
			}
		}

		protected static void ExecuteRecipeTask(UseCaseDevice device, Task<dynamic> task)
		{
			Task.Run(delegate
			{
				RecipeInfo recipeInfo = new RecipeInfo();
				recipeInfo.Load(task.Result);
				Recipe recipe = new Recipe(device);
				recipe.Load(recipeInfo);
				recipe.Run();
			});
			device.EventHandle.WaitOne();
		}
	}
	public enum UseCase
	{
		None,
		LMSA_Recovery,
		LMSA_Read_Fastboot,
		LMSA_Upgrade
	}
	public class VidPidMonitorHandler
	{
		private static readonly Lazy<VidPidMonitorHandler> _instance = new Lazy<VidPidMonitorHandler>(() => new VidPidMonitorHandler());

		private string _OriginalMonitorCom = string.Empty;

		private string _TempMonitorCom = string.Empty;

		private string _MonitoringCom = string.Empty;

		private System.Timers.Timer _timer;

		private readonly object _syncRoot = new object();

		private MonitorDeviceModel _currentDeviceInfo = new MonitorDeviceModel();

		private int _deviceInstanceCount;

		private const uint INSTALLFLAG_FORCE = 1u;

		public static VidPidMonitorHandler Instance => _instance.Value;

		public bool HasChanged { get; private set; }

		public event EventHandler<DeviceInfoUpdatedEventArgs> DeviceInfoUpdated;

		public void Run(string monitorCom)
		{
			if (string.IsNullOrEmpty(monitorCom))
			{
				return;
			}
			lock (_syncRoot)
			{
				_MonitoringCom = (_OriginalMonitorCom = monitorCom);
				if (_timer == null)
				{
					_timer = new System.Timers.Timer
					{
						Interval = 1000.0,
						AutoReset = false
					};
					_timer.Elapsed += Timer_Elapsed;
				}
				_timer.Start();
			}
		}

		private void Timer_Elapsed(object sender, ElapsedEventArgs e)
		{
			try
			{
				FinDeviceInfo();
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"VidPidMonitorHandler error:{arg} ");
				FinishMonitor();
			}
			lock (_syncRoot)
			{
				if (_timer != null && !string.IsNullOrEmpty(_MonitoringCom))
				{
					_timer.Start();
				}
			}
		}

		public void ChangeMonitorCom(string newMonitorCom)
		{
			if (string.IsNullOrEmpty(newMonitorCom))
			{
				return;
			}
			lock (_syncRoot)
			{
				_TempMonitorCom = newMonitorCom;
				if (_timer == null)
				{
					_timer = new System.Timers.Timer
					{
						Interval = 1000.0,
						AutoReset = false
					};
					_MonitoringCom = _TempMonitorCom;
					_timer.Elapsed += Timer_Elapsed;
				}
				else
				{
					_MonitoringCom = _TempMonitorCom;
					if (_timer.Enabled)
					{
						_timer.Stop();
					}
				}
				_timer.Start();
				HasChanged = true;
			}
		}

		public void MonitorComReset()
		{
			if (string.IsNullOrEmpty(_OriginalMonitorCom))
			{
				return;
			}
			lock (_syncRoot)
			{
				if (_timer == null)
				{
					_timer = new System.Timers.Timer
					{
						Interval = 1000.0,
						AutoReset = false
					};
					_MonitoringCom = _OriginalMonitorCom;
					_timer.Elapsed += Timer_Elapsed;
				}
				else
				{
					_MonitoringCom = _OriginalMonitorCom;
					if (_timer.Enabled)
					{
						_timer.Stop();
					}
				}
				_timer.Start();
				HasChanged = false;
			}
		}

		public void FinishMonitor()
		{
			lock (_syncRoot)
			{
				if (_timer != null)
				{
					_timer.Elapsed -= Timer_Elapsed;
					_timer.Stop();
					_timer.Dispose();
					_timer = null;
				}
				_OriginalMonitorCom = (_TempMonitorCom = (_MonitoringCom = string.Empty));
			}
		}

		public MonitorDeviceModel GetCurrentMonitorDeviceInfo()
		{
			lock (_syncRoot)
			{
				if (!string.IsNullOrEmpty(_currentDeviceInfo?.Name))
				{
					return _currentDeviceInfo;
				}
				return null;
			}
		}

		public int GetDeviceInstanceCount()
		{
			lock (_syncRoot)
			{
				return _deviceInstanceCount;
			}
		}

		private void FinDeviceInfo()
		{
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			string monitoringCom;
			lock (_syncRoot)
			{
				monitoringCom = _MonitoringCom;
			}
			if (string.IsNullOrEmpty(monitoringCom))
			{
				return;
			}
			ManagementObjectSearcher val = new ManagementObjectSearcher("Select * From Win32_PnPEntity Where DeviceID Like '%" + monitoringCom + "%'");
			try
			{
				MonitorDeviceModel monitorDevice = new MonitorDeviceModel();
				ManagementObjectCollection val2 = val.Get();
				if (val2.Count > 0)
				{
					lock (_syncRoot)
					{
						_deviceInstanceCount = val2.Count;
					}
					ManagementObjectEnumerator enumerator = val2.GetEnumerator();
					try
					{
						if (enumerator.MoveNext())
						{
							ManagementBaseObject current = enumerator.Current;
							monitorDevice.Name = current.GetPropertyValue("Name") as string;
							monitorDevice.Manufacturer = current.GetPropertyValue("Manufacturer") as string;
							monitorDevice.PnpDeviceId = current.GetPropertyValue("PNPDeviceID") as string;
							monitorDevice.Status = current.GetPropertyValue("Status") as string;
							monitorDevice.DeviceId = current.GetPropertyValue("DeviceID") as string;
							if (!string.IsNullOrEmpty(monitorDevice.PnpDeviceId))
							{
								FindDriveByRES(ref monitorDevice);
							}
						}
					}
					finally
					{
						((IDisposable)enumerator)?.Dispose();
					}
				}
				lock (_syncRoot)
				{
					_currentDeviceInfo = monitorDevice;
				}
				this.DeviceInfoUpdated?.Invoke(this, new DeviceInfoUpdatedEventArgs(monitorDevice));
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
		}

		private void FindDriveByRES(ref MonitorDeviceModel monitorDevice)
		{
			string pnpDeviceId = monitorDevice.PnpDeviceId;
			if (string.IsNullOrEmpty(pnpDeviceId))
			{
				return;
			}
			try
			{
				string name = "SYSTEM\\CurrentControlSet\\Enum\\" + pnpDeviceId;
				using RegistryKey registryKey = Registry.LocalMachine.OpenSubKey(name);
				if (registryKey == null)
				{
					return;
				}
				string text = registryKey.GetValue("Driver") as string;
				if (string.IsNullOrEmpty(text))
				{
					return;
				}
				string name2 = "SYSTEM\\CurrentControlSet\\Control\\Class\\" + text;
				using RegistryKey registryKey2 = Registry.LocalMachine.OpenSubKey(name2);
				if (registryKey2 != null)
				{
					monitorDevice.ProviderName = registryKey2.GetValue("ProviderName") as string;
					monitorDevice.DriverVersion = registryKey2.GetValue("DriverVersion") as string;
				}
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"VidPidMonitorHandler FindDriveByRES failed,error:{arg} ");
			}
		}

		[DllImport("newdev.dll", CharSet = CharSet.Auto, SetLastError = true)]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		private static extern bool UpdateDriverForPlugAndPlayDevices(IntPtr hwndParent, string hardwareId, string fullInfPath, uint installFlags, out bool rebootRequired);

		public bool ForceDriverUpdate(string instanceId, string infPath)
		{
			try
			{
				int deviceInstanceCount = GetDeviceInstanceCount();
				if (deviceInstanceCount > 1)
				{
					LogHelper.LogInstance.Info($"Under port [{_MonitoringCom}] monitoring ,Multiple [{deviceInstanceCount}] instances of fastboot devices were found, so no driver updates will be performed ");
					return false;
				}
				string text = ConvertToHardwareId(instanceId);
				LogHelper.LogInstance.Info("Updateing the Device [" + text + "] Driver ");
				uint installFlags = 1u;
				if (!UpdateDriverForPlugAndPlayDevices(IntPtr.Zero, text, infPath, installFlags, out var _))
				{
					int lastWin32Error = Marshal.GetLastWin32Error();
					LogHelper.LogInstance.Error($"UpdateDriverForPlugAndPlayDevices failed，errorCode: {lastWin32Error}");
					return false;
				}
				LogHelper.LogInstance.Info("Update Driver successfully!");
				return true;
			}
			catch (Exception ex)
			{
				Console.WriteLine("Update Driver exception: " + ex.Message);
				return false;
			}
		}

		private string ConvertToHardwareId(string instanceId)
		{
			int num = instanceId.LastIndexOf('\\');
			if (num <= 0)
			{
				return instanceId;
			}
			return instanceId.Substring(0, num);
		}
	}
	public class DeviceInfoUpdatedEventArgs : EventArgs
	{
		public MonitorDeviceModel MonitorDevice { get; }

		public DeviceInfoUpdatedEventArgs(MonitorDeviceModel status)
		{
			MonitorDevice = status;
		}
	}
	public class MonitorDeviceModel : NotifyBase
	{
		private string _name = "--";

		private string _status = "--";

		private string _manufacturer = "--";

		private string _deviceid = "--";

		private string _providerName = "--";

		private string _driverVersion = "--";

		private string _parentIdprefix = "--";

		private string _pnpDeviceId = "--";

		public string Name
		{
			get
			{
				return _name;
			}
			set
			{
				if (_name != value)
				{
					_name = value;
					OnPropertyChanged("Name");
				}
			}
		}

		public string Manufacturer
		{
			get
			{
				return _manufacturer;
			}
			set
			{
				if (_manufacturer != value)
				{
					_manufacturer = value;
					OnPropertyChanged("Manufacturer");
				}
			}
		}

		public string Status
		{
			get
			{
				return _status;
			}
			set
			{
				if (_status != value)
				{
					_status = value;
					OnPropertyChanged("Status");
				}
			}
		}

		public string DeviceId
		{
			get
			{
				return _deviceid;
			}
			set
			{
				if (_deviceid != value)
				{
					_deviceid = value;
					OnPropertyChanged("DeviceId");
				}
			}
		}

		public string ProviderName
		{
			get
			{
				return _providerName;
			}
			set
			{
				if (_providerName != value)
				{
					_providerName = value;
					OnPropertyChanged("ProviderName");
				}
			}
		}

		public string DriverVersion
		{
			get
			{
				return _driverVersion;
			}
			set
			{
				if (_driverVersion != value)
				{
					_driverVersion = value;
					OnPropertyChanged("DriverVersion");
				}
			}
		}

		public string ParentIdPrefix
		{
			get
			{
				return _parentIdprefix;
			}
			set
			{
				if (_parentIdprefix != value)
				{
					_parentIdprefix = value;
				}
			}
		}

		public string PnpDeviceId
		{
			get
			{
				return _pnpDeviceId;
			}
			set
			{
				if (_pnpDeviceId != value)
				{
					_pnpDeviceId = value;
				}
			}
		}
	}
}
namespace lenovo.mbg.service.framework.smartdevice.Steps
{
	public class ADBConnect : BaseStep
	{
		public override void Run()
		{
			int num = 180;
			if (base.Info.Args.Timeout != null)
			{
				num = base.Info.Args.Timeout / 1000;
			}
			bool flag = false;
			while (!flag && num > 0)
			{
				if (GetDevice(ConnectType.Adb, delegate(object s)
				{
					DeviceEx deviceEx = s as DeviceEx;
					return !Regex.IsMatch(deviceEx.Identifer, "&|:") && deviceEx.PhysicalStatus == DevicePhysicalStateEx.Online;
				}) != null)
				{
					flag = true;
					break;
				}
				Thread.Sleep(5000);
				num -= 5;
			}
			Result result = Result.PASSED;
			string response = null;
			if (!flag)
			{
				result = Result.ADB_CONNECT_FAILED;
				response = "connect timeout";
			}
			base.Log.AddResult(this, result, response);
		}
	}
	public class AndroidShell : BaseStep
	{
		public override void Run()
		{
			DeviceEx device = base.Recipe.Device;
			string text = base.Info.Args.Command;
			string empty = string.Empty;
			if (text == "reboot bootloader")
			{
				empty = global::Smart.DeviceOperator.Command(text, -1, device?.Identifer);
				base.Log.AddLog("adb command: reboot bootloader, response: " + empty, upload: true);
			}
			else
			{
				empty = global::Smart.DeviceOperator.Shell(device?.Identifer, text);
				base.Log.AddLog("adb command: " + text + ", response: " + empty, upload: true);
			}
			if (base.Info.Args.PromptText != null)
			{
				string message = base.Info.Args.PromptText.ToString();
				string name = base.Info.Name;
				base.Recipe.UcDevice.MessageBox.Show(name, message, "K0327", null, showClose: false, (MessageBoxImage)64).Wait();
			}
			base.RunResult = empty;
			if (text == "reboot edl")
			{
				base.Cache.Add("auto9008", true);
				if (empty.ToLower().Contains("error") || empty.ToLower().Contains("failed"))
				{
					base.RunResult = Result.FAILED.ToString();
				}
				else
				{
					base.RunResult = Result.PASSED.ToString();
				}
			}
			base.Log.AddResult(this, Result.PASSED);
		}
	}
	public class AndroidShellVerify : BaseStep
	{
		private string TAG => GetType().FullName;

		public override void Run()
		{
			DeviceEx device = base.Recipe.Device;
			string deviceID = null;
			if (device != null)
			{
				deviceID = device.Identifer;
			}
			string command = base.Info.Args.Command;
			string text = base.Info.Args.Ref;
			string text2 = global::Smart.DeviceOperator.Shell(deviceID, command).Trim();
			bool flag = false;
			flag = ((!(text == string.Empty)) ? (text2 == text) : (text2 != string.Empty));
			Result result = (flag ? Result.PASSED : Result.FAILED);
			base.Log.AddResult(this, result);
		}
	}
	public abstract class BaseStep : IDisposable
	{
		private static readonly Random rand = new Random();

		protected bool audited;

		protected List<string> CacheComports = new List<string>();

		protected static object locker = new object();

		public static string fastbootExe = Path.Combine(".", "fastboot.exe");

		private static string fastbootVidPid = "VID_22B8&PID_2E80";

		private static readonly HashSet<string> ConnectedWords = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
		{
			"開始", "Iniciado", "Uruchomiony", "Iniciado", "Запущен", "Avviato", "已启动", "Gestartet", "Spustený", "Pokrenut",
			"Покренут", "Pornit", "Стартиран", "Spuštěno", "Démarré", "प\u094dर\u093eर\u0902भ", "Dimulai", "بدء", "Started"
		};

		public string Name => Info.Name;

		public Recipe Recipe { get; private set; }

		public StepInfo Info { get; private set; }

		protected ResultLogger Log => Recipe.Log;

		protected SortedList<string, dynamic> Cache => Recipe.Cache;

		protected RecipeResources Resources => Recipe.Resources;

		protected SortedList<string, dynamic> CheckedLimits { get; private set; }

		protected AutoResetEvent WaitEvent { get; private set; }

		protected int TimeoutMilliseconds { get; set; }

		public string condition { get; private set; }

		public List<BaseStep> SubSteps { get; private set; }

		protected List<string> SkipCommands { get; private set; }

		protected List<JObject> ConditionSkipCommands { get; private set; }

		protected string OutCondition { get; private set; }

		protected List<string> IgnoreResultCommands { get; private set; }

		public virtual int Retry { get; set; }

		public int Index { get; set; }

		public string RunResult { get; set; }

		public string ShellResult { get; set; }

		public Result StepResult { get; set; }

		public bool IgnoreCurrStepResult { get; private set; }

		public bool IgnoreFinalResult { get; private set; }

		public bool FailedByDeviceRemoved { get; set; }

		public bool IgnoreErrorPromptText { get; protected set; }

		public string TempVP { get; protected set; }

		public bool StartDeviceMonitor { get; private set; }

		public abstract void Run();

		public virtual bool RunSubSteps()
		{
			if (SubSteps != null && SubSteps.Count > 0)
			{
				foreach (BaseStep subStep in SubSteps)
				{
					Log.AddLog($"Middle::Running substep '{subStep.Info.Name}({subStep.Info.Step})'");
					subStep.Run();
					if (Log.OverallResult == Result.QUIT || Log.OverallResult == Result.FAILED)
					{
						return false;
					}
				}
			}
			return true;
		}

		protected string AnalysisFailedResponse(string response)
		{
			if (string.IsNullOrEmpty(response))
			{
				return null;
			}
			return ((IEnumerable<string>)response.Split(new string[2] { "\r\n", "\n" }, StringSplitOptions.RemoveEmptyEntries)).Reverse().ToList().FirstOrDefault((string n) => Regex.IsMatch(n, "(fail)|(error)", RegexOptions.IgnoreCase));
		}

		public virtual DeviceEx GetDevice(ConnectType connectType, Predicate<object> predicate = null)
		{
			lock (locker)
			{
				IList<DeviceEx> conntectedDevices = HostProxy.deviceManager.ConntectedDevices;
				DeviceEx deviceEx = null;
				Predicate<object> tp = predicate ?? ((Predicate<object>)((object s) => true));
				if (conntectedDevices != null && conntectedDevices.Count > 0)
				{
					deviceEx = ((Recipe.Device == null) ? conntectedDevices.FirstOrDefault((DeviceEx n) => n.WorkType == DeviceWorkType.None && n.ConnectType == connectType && tp(n)) : conntectedDevices.FirstOrDefault((DeviceEx n) => n.ConnectType == connectType && n.Identifer == Recipe.Device.Identifer && tp(n)));
				}
				Recipe.SetRecipeDevice(deviceEx);
				return deviceEx;
			}
		}

		public void PrintConnectedDevice(bool print)
		{
			if (!print)
			{
				return;
			}
			Log.AddLog("current bind device: " + Recipe.Device?.Identifer, upload: true);
			IList<DeviceEx> conntectedDevices = HostProxy.deviceManager.ConntectedDevices;
			if (conntectedDevices == null || conntectedDevices.Count == 0)
			{
				Log.AddLog("No device is connected in the device list", upload: true);
			}
			foreach (DeviceEx item in conntectedDevices)
			{
				Log.AddLog($"device-{item.Identifer}, worktype: {item.WorkType}, softStatus: {item.SoftStatus}", upload: true);
			}
		}

		public void Load(Recipe recipe, StepInfo info)
		{
			Recipe = recipe;
			Info = info;
			SkipCommands = new List<string>();
			IgnoreResultCommands = new List<string>();
			Retry = 0;
			if (info.Args != null)
			{
				IgnoreCurrStepResult = Info.Args.IgnoreCurrStepResult ?? ((object)false);
				IgnoreFinalResult = Info.Args.IgnoreFinalResult ?? ((object)false);
				if (info.Args.SkipCommands != null)
				{
					SkipCommands = info.Args.SkipCommands.ToObject<List<string>>();
				}
				if (info.Args.IgnoreResultCommands != null)
				{
					IgnoreResultCommands = info.Args.IgnoreResultCommands.ToObject<List<string>>();
				}
				if (info.Args.Retry != null)
				{
					Retry = info.Args.Retry;
				}
				if (info.Args.ConditionSkipCommands != null)
				{
					OutCondition = info.Args.ConditionSkipCommands.condition;
					if (info.Args.ConditionSkipCommands.Commands != null && info.Args.ConditionSkipCommands.Commands is JArray)
					{
						ConditionSkipCommands = info.Args.ConditionSkipCommands.Commands.ToObject<List<JObject>>();
					}
				}
				if (Info.Args.StartDeviceMonitor != null)
				{
					StartDeviceMonitor = Info.Args.StartDeviceMonitor;
				}
			}
			if (info.SubSteps != null)
			{
				condition = info.SubSteps.Condition?.Value;
				if (info.SubSteps.Steps != null)
				{
					SubSteps = new List<BaseStep>();
					foreach (dynamic item in info.SubSteps.Steps)
					{
						StepInfo stepInfo = new StepInfo();
						stepInfo.Load(item);
						BaseStep baseStep = StepHelper.LoadNew<BaseStep>(stepInfo.Step);
						baseStep.Load(Recipe, stepInfo);
						SubSteps.Add(baseStep);
					}
				}
			}
			CheckedLimits = new SortedList<string, object>();
			if (Info.Args?.Timeout != null)
			{
				TimeoutMilliseconds = Info.Args?.Timeout;
				WaitEvent = new AutoResetEvent(initialState: false);
			}
		}

		public virtual bool Audit()
		{
			double? num = Info.Args.AuditPercent;
			if (!num.HasValue)
			{
				return true;
			}
			if (rand.NextDouble() >= num)
			{
				return true;
			}
			LogHelper.LogInstance.Debug($"Audit selected for {Name}({Info.Step})");
			bool flag = true;
			if (Info.Args.AuditSetup != null)
			{
				flag = Info.Args.AuditSetup;
			}
			try
			{
				if (flag)
				{
					Setup();
					if (Info.Args.AuditSettings != null)
					{
						Set(Info.Args.SettingsType.ToString(), Info.Args.AuditSettings);
					}
				}
				string type = Info.Args.PromptType;
				string text = Info.Args.PromptText;
				Result num2 = Prompt(type, text);
				audited = true;
				if (num2 == Result.PASSED)
				{
					LogHelper.LogInstance.Debug($"Audit failure for {Name}({Info.Step})");
					return false;
				}
				LogHelper.LogInstance.Debug($"Audit complete for {Name}({Info.Step})");
			}
			finally
			{
				if (flag)
				{
					TearDown();
				}
			}
			return true;
		}

		public virtual string LoadToolPath(string exe = null)
		{
			exe = exe ?? Info.Args.EXE;
			string text = Info.Args.FindLocation;
			if (string.IsNullOrEmpty(exe))
			{
				exe = "fastboot.exe";
			}
			string text2 = null;
			if (string.IsNullOrEmpty(text))
			{
				text2 = Resources.GetFastbootToolPath(exe, "ROM");
				if (string.IsNullOrEmpty(text2))
				{
					text2 = Resources.GetFastbootToolPath(exe, "TOOL");
					if (string.IsNullOrEmpty(text2))
					{
						text2 = Resources.GetFastbootToolPath(exe);
					}
				}
			}
			else if (text.Equals("TOOL"))
			{
				text2 = Resources.GetFastbootToolPath(exe, "TOOL");
				if (string.IsNullOrEmpty(text2))
				{
					text2 = Resources.GetFastbootToolPath(exe, "ROM");
					if (string.IsNullOrEmpty(text2))
					{
						text2 = Resources.GetFastbootToolPath(exe);
					}
				}
			}
			else if (text.Equals("INSTALL"))
			{
				text2 = (text2 = Resources.GetFastbootToolPath(exe));
				if (string.IsNullOrEmpty(text2))
				{
					text2 = Resources.GetFastbootToolPath(exe, "ROM");
					if (string.IsNullOrEmpty(text2))
					{
						Resources.GetFastbootToolPath(exe, "TOOL");
					}
				}
			}
			if (string.IsNullOrEmpty(text2))
			{
				Log.AddLog(exe + " not found", upload: true);
			}
			else if (!GlobalFun.Exists(text2))
			{
				Log.AddLog(text2 + " not exists", upload: true);
			}
			else
			{
				Log.AddLog("fastboot tool path: " + text2, upload: true);
			}
			return text2;
		}

		public virtual void TearDown()
		{
			foreach (string key in CheckedLimits.Keys)
			{
				string text = $"{Name}-{key}";
				double num = CheckedLimits[key].Min;
				double num2 = CheckedLimits[key].Max;
				double num3 = CheckedLimits[key].Value;
				Result result = CheckedLimits[key].Result;
				LogHelper logInstance = LogHelper.LogInstance;
				object[] args = new string[5]
				{
					text,
					num.ToString(),
					num3.ToString(),
					num2.ToString(),
					result.ToString()
				};
				logInstance.Info(string.Format("{0} - {1} < {2} < {3}: {4}", args));
			}
		}

		public virtual void Setup()
		{
		}

		protected void ProgressUpdate(double progress)
		{
			double num = Info.Args["ProgressStart"];
			double num2 = (double)Info.Args["ProgressEnd"] - num;
			double progress2 = num + num2 * (progress / 100.0);
			RecipeMessage recipeMessage = new RecipeMessage
			{
				Progress = progress2,
				UseCase = Log.UseCase,
				OverallResult = Result.PROGRESS
			};
			Log.NotifyAsync(RecipeMessageType.PROGRESS, recipeMessage);
		}

		protected virtual void Set(string settingType, dynamic settings)
		{
		}

		protected Result Prompt(string type, string text)
		{
			if (audited)
			{
				text = "Please re-check: " + text;
			}
			List<string> list = new List<string>();
			foreach (object item2 in Info.Args.ButtonContent)
			{
				string item = (string)(dynamic)item2;
				list.Add(item);
			}
			string ok = null;
			string cancel = null;
			if (list.Count == 1)
			{
				ok = list[0];
			}
			else if (list.Count == 2)
			{
				ok = list[0];
				cancel = list[1];
			}
			if (Recipe.UcDevice.MessageBox.Show(Info.Name, text, ok, cancel, showClose: false, (MessageBoxImage)64).Result != true)
			{
				return Result.QUIT;
			}
			return Result.PASSED;
		}

		public void ErrorConnectProcess(bool checkErrorConnect = true)
		{
			string value = Resources.Get("Mutil");
			if (!string.IsNullOrEmpty(value) && !bool.Parse(value) && checkErrorConnect)
			{
				while (Recipe.IsLoadPnPSignedDriver)
				{
					Thread.Sleep(1000);
				}
				ErrorConnectProcess(Recipe.DeviceMonitorConnectedList);
			}
		}

		private void ErrorConnectProcess(List<string> list)
		{
			if (!(Info.Args.BlackList is JObject { HasValues: not false } jObject) || jObject.Value<JArray>("Condition") == null)
			{
				return;
			}
			List<string> list2 = (from n in jObject.Value<JArray>("Condition")
				select n.Value<string>()).ToList();
			IEnumerator<string> enumerator = list.GetEnumerator();
			bool flag = false;
			while (!flag && enumerator.MoveNext())
			{
				flag = list2.Exists((string n) => enumerator.Current.IndexOf(n, StringComparison.CurrentCultureIgnoreCase) >= 0);
			}
			string text = jObject.Value<string>("Message");
			if (flag && !string.IsNullOrEmpty(text) && !Recipe.UcDevice.MessageBox.Show("K0711", text, "K0327", null, showClose: false, (MessageBoxImage)64).Wait(30000))
			{
				Recipe.UcDevice.MessageBox.Close(true);
			}
		}

		protected void ClearDeviceMonitorConnectedList()
		{
			if (Recipe.DeviceMonitorConnectedList == null || Recipe.DeviceMonitorConnectedList.Count == 0)
			{
				return;
			}
			Recipe.DeviceMonitorCacheIds = Recipe.DeviceMonitorCacheIds.Where((string b) => !Recipe.DeviceMonitorConnectedList.Any((string a) => a.Contains(b))).ToList();
			Recipe.DeviceMonitorConnectedList = new List<string>();
		}

		protected Task<List<string>> ComportMonitorTask(CancellationTokenSource tokenSource)
		{
			return Task.Run(delegate
			{
				List<string> result = new List<string>();
				List<string> list = new List<string>();
				new List<string>();
				CacheComports = new List<string>();
				do
				{
					List<string> comInfo = GlobalFun.GetComInfo();
					list = comInfo.Except(CacheComports).ToList();
					list.ForEach(delegate(string n)
					{
						result.Add($"device connected-{DateTime.Now:HH:mm:ss}: {n}");
					});
					CacheComports.AddRange(list);
					CacheComports.Except(comInfo).ToList().ForEach(delegate(string n)
					{
						result.Add($"device removed-{DateTime.Now:HH:mm:ss}: {n}");
						CacheComports.Remove(n);
					});
					Thread.Sleep(1000);
				}
				while (!tokenSource.IsCancellationRequested);
				if (result.Count == 0)
				{
					result.Add("no device connected");
				}
				return result;
			}, tokenSource.Token);
		}

		protected void PrintUnknownDevice()
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Expected O, but got Unknown
			List<string> list = new List<string>();
			ManagementObjectSearcher val = new ManagementObjectSearcher("Select * From Win32_PnPEntity where service='WINUSB' or Status='Error'");
			try
			{
				ManagementObjectEnumerator enumerator = val.Get().GetEnumerator();
				try
				{
					while (enumerator.MoveNext())
					{
						ManagementBaseObject current = enumerator.Current;
						string text = current.GetPropertyValue("Status") as string;
						if (string.IsNullOrEmpty(text) || text.Equals("error", StringComparison.CurrentCultureIgnoreCase))
						{
							string text2 = current.GetPropertyValue("Name").ToString();
							string text3 = null;
							try
							{
								text3 = current.GetPropertyValue("DeviceID").ToString();
							}
							catch
							{
							}
							list.Add("Name: " + text2 + ", DeviceId: " + text3 + ", Status: " + text);
						}
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
			if (list.Count > 0)
			{
				Log.AddLog("unknown device list: " + Environment.NewLine + string.Join("\r\n", list), upload: true);
			}
		}

		private List<string> getPreCondList(dynamic data)
		{
			List<string> result = new List<string>();
			try
			{
				if (data is JArray { HasValues: not false } jArray)
				{
					result = jArray.Values<string>().ToList();
				}
				else
				{
					string text = (string)data;
					char[] separator = new char[4] { '，', ',', ';', '：' };
					result = (from s in text.Split(separator, StringSplitOptions.RemoveEmptyEntries)
						select s.Trim()).ToList();
				}
			}
			catch (Exception ex)
			{
				Log.AddLog("getPreCondList Error: " + ex.Message);
			}
			return result;
		}

		public bool VerifyPreContionMet()
		{
			if (Info.Args.PreCondTest != null)
			{
				List<string> list = new List<string>();
				if (Info.Args.PreCondTest is JArray { HasValues: not false } jArray)
				{
					list = jArray.Values<string>().ToList();
				}
				else
				{
					list.Add((string)Info.Args.PreCondTest);
				}
				List<string> list2 = ((Info.Args.Expected != null) ? getPreCondList(Info.Args.Expected) : null);
				List<string> list3 = ((Info.Args.NotExpected != null) ? getPreCondList(Info.Args.NotExpected) : null);
				string text = ((Info.Args.PreCondValue != null) ? ((string)Info.Args.PreCondValue) : null);
				string text2 = ((Info.Args.PreCondStepResult != null) ? ((string)Info.Args.PreCondStepResult) : null);
				string[] source = (string.IsNullOrEmpty(text) ? null : text.Split(new char[2] { ',', ';' }));
				string[] source2 = (string.IsNullOrEmpty(text2) ? null : text2.Split(new char[2] { ',', ';' }));
				bool flag = true;
				foreach (string condTest in list)
				{
					BaseStep found = Recipe.Steps.FirstOrDefault((BaseStep n) => n.Name == condTest);
					if (found != null && !string.IsNullOrEmpty(found.RunResult) && !string.IsNullOrEmpty(text))
					{
						flag = Enumerable.Contains<string>(source, found.RunResult, StringComparer.CurrentCultureIgnoreCase);
						if (flag)
						{
							break;
						}
					}
					if (found != null && !string.IsNullOrEmpty(found.StepResult.ToString()) && !string.IsNullOrEmpty(text2))
					{
						flag = Enumerable.Contains<string>(source2, found.StepResult.ToString(), StringComparer.CurrentCultureIgnoreCase);
						if (flag)
						{
							break;
						}
					}
					if (found != null && !string.IsNullOrEmpty(found.ShellResult) && list2 != null)
					{
						flag = list2?.Any((string p) => found.ShellResult.IndexOf(p, StringComparison.OrdinalIgnoreCase) >= 0) ?? false;
						if (flag)
						{
							break;
						}
					}
					if (found != null && !string.IsNullOrEmpty(found.ShellResult) && list3 != null)
					{
						flag = list3?.All((string p) => found.ShellResult.IndexOf(p, StringComparison.OrdinalIgnoreCase) < 0) ?? false;
						if (flag)
						{
							break;
						}
					}
				}
				return flag;
			}
			return true;
		}

		protected bool GetPnputilIsConnected()
		{
			string value = Resources.Get("Mutil");
			if (string.IsNullOrEmpty(value) || bool.Parse(value))
			{
				return true;
			}
			Thread.Sleep(1000);
			bool result = false;
			int num = 0;
			for (int i = 0; i < 5; i++)
			{
				List<string> source = ProcessRunner.ProcessList(fastbootExe, "devices", 3000);
				List<string> list = ProcessRunner.ProcessList("pnputil.exe", "/enum-devices /deviceid USB\\" + fastbootVidPid, 5000);
				bool flag = source.Count((string p) => p.Contains(Recipe.Device?.Identifer)) > 0;
				bool flag2 = false;
				if (list != null && list.Count != 0)
				{
					flag2 = list.Any((string p) => ConnectedWords.Any((string w) => p.IndexOf(w, StringComparison.OrdinalIgnoreCase) >= 0));
				}
				bool flag3 = list.Count((string p) => p.Contains(fastbootVidPid)) > 1;
				Log.AddLog(string.Format("[GetPnputilConnected]: The {0} time, among which fastbootDevice:[{1}]、pnputilConnected:[{2}]、isMultResult:[{3}]", new object[4]
				{
					i + 1,
					flag,
					flag2,
					flag3
				}), upload: true);
				Log.AddLog("[GetPnputilConnected]: pnputil Deviceid:[" + fastbootVidPid + "],Result:[" + string.Join("\r\n", list) + "]", upload: true);
				if ((flag && flag2) || (flag3 && flag2))
				{
					result = true;
					break;
				}
				if (!flag && flag2)
				{
					num++;
					if (num >= 2)
					{
						result = true;
						break;
					}
				}
				Thread.Sleep(1000);
			}
			return result;
		}

		protected string EncapsulationFastbootCommand(string command)
		{
			if (!string.IsNullOrEmpty(command))
			{
				string text = Recipe.Device?.Identifer;
				if (!string.IsNullOrEmpty(text))
				{
					command = "-s " + text + " " + command;
				}
			}
			return command;
		}

		public virtual void Dispose()
		{
			WaitEvent?.Dispose();
		}

		protected bool DriverErrorPromptByFastboot()
		{
			return Recipe.UcDevice.MessageBox.Show(Name, "K2188", "K0327", "K0208", showClose: false, (MessageBoxImage)48).Result == true;
		}

		protected bool DriverErrorPrompt()
		{
			return Recipe.UcDevice.MessageBox.Show(Name, "K2189", "K0327", null, showClose: false, (MessageBoxImage)48).Result == true;
		}
	}
	public class BatFileVersionCheck : BaseStep
	{
		private string TAG => GetType().FullName;

		public override void Run()
		{
			string text = base.Info.Args.EXE;
			if (text.StartsWith("$"))
			{
				string key = text.Substring(1);
				text = base.Cache[key];
			}
			int timeOut = ((base.Info.Args.Timeout == null) ? ((object)6000) : base.Info.Args.Timeout);
			string text2 = base.Info.Args.Command;
			List<object> list = new List<object>();
			if (base.Info.Args.Format != null)
			{
				foreach (object item2 in base.Info.Args.Format)
				{
					string text3 = (string)(dynamic)item2;
					object item = text3;
					if (text3.StartsWith("$"))
					{
						string key2 = text3.Substring(1);
						item = base.Cache[key2];
					}
					list.Add(item);
				}
				text2 = string.Format(text2, list.ToArray());
			}
			string empty = string.Empty;
			do
			{
				empty = ProcessRunner.CmdExcuteWithExit(text + " " + text2, base.Resources.Get("Rom"), timeOut);
				if (string.IsNullOrEmpty(empty))
				{
					continue;
				}
				int result = int.MinValue;
				int result2 = int.MinValue;
				string[] array = empty.Split(new char[2] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);
				_ = string.Empty;
				string[] array2 = array;
				foreach (string text4 in array2)
				{
					if (text4.Contains("device rollback id sum:"))
					{
						string[] array3 = text4.Trim().Split(new char[1] { ':' });
						if (array3.Length == 2 && !int.TryParse(array3[1], out result2))
						{
							result2 = int.MinValue;
						}
					}
					if (text4.Contains("signinfo id sum:"))
					{
						string[] array4 = text4.Trim().Split(new char[1] { ':' });
						if (array4.Length == 2 && !int.TryParse(array4[1], out result))
						{
							result = int.MinValue;
						}
					}
				}
				if (result2 != int.MinValue && result != int.MinValue)
				{
					if (result >= result2)
					{
						base.Log.AddResult(this, Result.PASSED, "bat check rom upgrade!");
						return;
					}
					base.Recipe.UcDevice.MessageBox.Show("K0711", "K1119", "K0327", null, showClose: false, (MessageBoxImage)64).Wait();
					base.Log.AddResult(this, Result.FASTBOOT_DEGRADE_QUIT, "bat check rom upgrade!");
					return;
				}
			}
			while (Retry-- > 0);
			base.Log.AddLog($"Bat file {(object?)base.Info.Args.EXE} exucte failed! Can't get device rollbackid or rom version.");
			base.Log.AddResult(this, Result.FAILED, "bat file excute failed!");
		}
	}
	public class EraseUserData : BaseStep
	{
		public override void Run()
		{
			bool flag = false;
			bool flag2 = false;
			bool? result;
			if (base.Info.Args.UnFastboot == true)
			{
				result = base.Recipe.UcDevice.MessageBox.EraseData().Result;
			}
			else
			{
				IAndroidDevice androidDevice = null;
				androidDevice = ((base.Recipe.Device.ConnectType != ConnectType.Adb) ? base.Recipe.Device.Property : GetDevice(ConnectType.Fastboot)?.Property);
				string text = base.Log.Info["fdr-allowed"];
				if (string.IsNullOrEmpty(text))
				{
					text = androidDevice?.GetPropertyValue("fdr-allowed")?.ToLower();
				}
				flag2 = text?.ToLower() == "no";
				LogHelper.LogInstance.Info($"read fdr-allowed: {text}, enterprise device: {flag2}");
				if (flag2)
				{
					result = base.Recipe.UcDevice.MessageBox.Show("K2130", "K1618", "K2129", "K0208", showClose: true, (MessageBoxImage)64, null, isPrivacy: false, isWarnYellow: true).Result;
					flag = result != true;
				}
				else
				{
					result = base.Recipe.UcDevice.MessageBox.EraseData().Result;
				}
			}
			if (flag)
			{
				base.Log.AddInfo("erase_personal_data", false.ToString());
				base.Log.AddResult(this, Result.MANUAL_QUIT, base.RunResult);
				return;
			}
			if (flag2)
			{
				base.RunResult = "unerase";
				base.Log.AddInfo("erase_personal_data", false.ToString());
			}
			else
			{
				base.RunResult = ((result != true) ? "unerase" : "erase");
				base.Log.AddInfo("erase_personal_data", (result == true).ToString());
			}
			base.Log.AddResult(this, Result.PASSED, base.RunResult);
		}
	}
	public class FindLocationPort : BaseStep
	{
		protected bool quit;

		public override void Run()
		{
			//IL_01c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d0: Expected O, but got Unknown
			//IL_01a8: Unknown result type (might be due to invalid IL or missing references)
			//IL_01af: Expected O, but got Unknown
			DateTime now = DateTime.Now;
			int num = base.Info.Args.Timeout ?? ((object)180000);
			bool flag = false;
			bool flag2 = false;
			Task task = null;
			List<string> list = base.Info.Args.ComPorts.ToObject<List<string>>();
			do
			{
				ManagementObjectSearcher val = new ManagementObjectSearcher("Select * From Win32_PnPEntity");
				try
				{
					ManagementObjectEnumerator enumerator = val.Get().GetEnumerator();
					try
					{
						while (enumerator.MoveNext())
						{
							ManagementObject val2 = (ManagementObject)enumerator.Current;
							try
							{
								string name = ((ManagementBaseObject)val2).GetPropertyValue("Name") as string;
								if (!list.Exists((string n) => Regex.IsMatch(name, n, RegexOptions.IgnoreCase)))
								{
									continue;
								}
								object[] array = new object[2]
								{
									new string[10] { "DEVPKEY_Device_DeviceDesc", "DEVPKEY_Device_Parent", "DEVPKEY_Device_LocationInfo", "DEVPKEY_Device_LocationPaths", "DEVPKEY_Device_InstanceId", "DEVPKEY_Device_Driver", "DEVPKEY_Device_DriverProvider", "DEVPKEY_Device_DriverVersion", "DEVPKEY_Device_DriverInfPath", "DEVPKEY_Device_Manufacturer" },
									null
								};
								val2.InvokeMethod("GetDeviceProperties", array);
								ManagementBaseObject[] obj = (ManagementBaseObject[])array[1];
								PropertyData? obj2 = ((IEnumerable)obj[2].Properties).OfType<PropertyData>().FirstOrDefault((PropertyData p) => p.Name == "Data");
								string text = ((obj2 != null) ? obj2.Value : null) as string;
								PropertyData? obj3 = ((IEnumerable)obj[4].Properties).OfType<PropertyData>().FirstOrDefault((PropertyData p) => p.Name == "Data");
								string text2 = ((obj3 != null) ? obj3.Value : null) as string;
								PropertyData? obj4 = ((IEnumerable)obj[5].Properties).OfType<PropertyData>().FirstOrDefault((PropertyData p) => p.Name == "Data");
								object obj5 = ((obj4 != null) ? obj4.Value : null);
								PropertyData? obj6 = ((IEnumerable)obj[6].Properties).OfType<PropertyData>().FirstOrDefault((PropertyData p) => p.Name == "Data");
								object obj7 = ((obj6 != null) ? obj6.Value : null);
								PropertyData? obj8 = ((IEnumerable)obj[7].Properties).OfType<PropertyData>().FirstOrDefault((PropertyData p) => p.Name == "Data");
								object obj9 = ((obj8 != null) ? obj8.Value : null);
								PropertyData? obj10 = ((IEnumerable)obj[8].Properties).OfType<PropertyData>().FirstOrDefault((PropertyData p) => p.Name == "Data");
								object obj11 = ((obj10 != null) ? obj10.Value : null);
								PropertyData? obj12 = ((IEnumerable)obj[9].Properties).OfType<PropertyData>().FirstOrDefault((PropertyData p) => p.Name == "Data");
								object obj13 = ((obj12 != null) ? obj12.Value : null);
								if (!string.IsNullOrEmpty(text))
								{
									base.Log.AddLog(string.Format("{0} | {1} | {2} | {3} | {4} | {5} | {6}", new object[7] { text2, text, obj5, obj7, obj9, obj11, obj13 }));
									base.Cache[list.First()] = text;
									flag = true;
									task = Task.Run(() => ShowReleaseTutorials());
									break;
								}
							}
							catch (Exception)
							{
							}
						}
					}
					finally
					{
						((IDisposable)enumerator)?.Dispose();
					}
					if (!flag && !flag2)
					{
						flag2 = true;
						Task.Run(() => ShowConnectTutorials());
					}
				}
				finally
				{
					((IDisposable)val)?.Dispose();
				}
			}
			while (!quit && !flag && DateTime.Now.Subtract(now).TotalMilliseconds < (double)num);
			task?.Wait(10000);
			base.Recipe.UcDevice.MessageBox.Close(true);
			Result result = (quit ? Result.MANUAL_QUIT : (flag ? Result.PASSED : Result.FIND_LOCATIONPORT_FAILED));
			base.Log.AddResult(this, result, (result == Result.PASSED) ? null : "find location port failed");
		}

		public async Task ShowConnectTutorials()
		{
			if (base.Info.Args.ConnectTutorials is JObject jObject && jObject.Value<JArray>("Steps") != null)
			{
				await Show(jObject, "Steps");
			}
			else
			{
				if (!((base.Info.Args.PromptText != null) ? true : false))
				{
					return;
				}
				await Task.Run(delegate
				{
					string image = base.Info.Args.Image?.ToString();
					string message = base.Info.Args.PromptText.ToString();
					if (!base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, message, image, null, -1, null, showClose: true, popupWhenClose: true, format: true, true).HasValue)
					{
						quit = true;
					}
				});
			}
		}

		public async Task ShowReleaseTutorials()
		{
			if (base.Info.Args.ConnectTutorials is JObject jObject && jObject.Value<JArray>("ReleaseSteps") != null)
			{
				await Show(jObject, "ReleaseSteps");
			}
		}

		protected Task Show(JObject jobj, string stepKey)
		{
			return Task.Run(delegate
			{
				bool flag = stepKey == "ReleaseSteps";
				string title = jobj.Value<string>("Title");
				JArray steps = jobj.Value<JArray>(stepKey);
				bool autoPlay = jobj.Value<bool>("AutoPlay");
				double interval = jobj.Value<double>("Interval");
				LogHelper.LogInstance.Debug("Args.ConnectTutorials." + stepKey + " will show");
				bool? flag2 = base.Recipe.UcDevice.MessageBox.AutoCloseConnectTutorials(title, steps, -1, autoPlay, interval, !flag, !flag, !flag);
				if (!flag && !flag2.HasValue)
				{
					quit = true;
				}
			});
		}
	}
	public class InstallDriver : BaseStep
	{
		protected DownloadInfo driverInfo;

		protected AutoResetEvent autoResetEvent = new AutoResetEvent(initialState: false);

		protected List<string> downloads = new List<string>();

		public override void Run()
		{
			string displayPattern = base.Info.Args.DisplayPattern;
			if (DriversHelper.CheckDriverInstall(displayPattern))
			{
				base.Log.AddResult(this, Result.PASSED);
				return;
			}
			int num = 1;
			Result result = Result.QUIT;
			bool num2 = base.Info.Args.ShowPrePop ?? ((object)false);
			string text = null;
			if (num2)
			{
				num = ((base.Recipe.UcDevice.MessageBox.Show("K0711", "K1606", "K0327", "K0208", showClose: false, (MessageBoxImage)64).Result == true) ? 1 : 0);
			}
			if (num == 1)
			{
				driverInfo = new DownloadInfo
				{
					DownloadUrl = base.Info.Args.DownloadUrl,
					FileType = "ROM"
				};
				HostProxy.DownloadServerV6.OnRemoteDownloadStatusChanged += DownloadServer_OnDownloadStatusChanged;
				HostProxy.DownloadServerV6.Add(driverInfo);
				base.Recipe.UcDevice.MessageBox.ShowDownloadCenter(show: true);
				autoResetEvent.WaitOne();
				base.Recipe.UcDevice.MessageBox.ShowDownloadCenter(show: false);
				HostProxy.DownloadServerV6.OnRemoteDownloadStatusChanged -= DownloadServer_OnDownloadStatusChanged;
				if (downloads.Count > 0)
				{
					List<string> driverPaths = new List<string>();
					downloads.ForEach(delegate(string n)
					{
						Rsd.Instance.GetDownloadedResource(n, out var filePath);
						driverPaths.Add(filePath);
					});
					base.Recipe.UcDevice.MessageBox.SetMainWindowDriverBtnStatus("installing");
					DriversHelper.InstallDriver(driverPaths);
					bool num3 = DriversHelper.CheckDriverInstall(displayPattern);
					base.Recipe.UcDevice.MessageBox.SetMainWindowDriverBtnStatus("installed");
					if (!num3)
					{
						text = "The user exited during the driver installation process";
						base.Log.AddLog(text, upload: true);
					}
					result = (num3 ? Result.PASSED : Result.QUIT);
				}
				else
				{
					string text2 = base.Info.Args.ErrorPromptText?.ToString();
					if (!string.IsNullOrEmpty(text2))
					{
						base.Recipe.UcDevice.MessageBox.Show(base.Name, text2, "K0327", null, showClose: false, (MessageBoxImage)48).Wait();
					}
					text = $"driver {driverInfo.DownloadUrl} download failed, status: {driverInfo.Status}";
					base.Log.AddLog(text, upload: true);
				}
			}
			else
			{
				text = "The user refuses to download driver";
				base.Log.AddLog(text, upload: true);
			}
			base.Log.AddResult(this, result, text);
		}

		private void DownloadServer_OnDownloadStatusChanged(object sender, RemoteDownloadStatusEventArgs e)
		{
			LogHelper.LogInstance.Debug($"install driver download, url is match: {e.FileUrl.Equals(driverInfo.FileUrl)}, status: {e.Status}");
			if (e.FileUrl.Equals(driverInfo.FileUrl))
			{
				switch (e.Status)
				{
				case lenovo.mbg.service.framework.services.Download.DownloadStatus.SUCCESS:
				case lenovo.mbg.service.framework.services.Download.DownloadStatus.ALREADYEXISTS:
				case lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPSUCCESS:
					downloads.Add(driverInfo.FileUrl);
					autoResetEvent.Set();
					break;
				default:
					autoResetEvent.Set();
					break;
				case lenovo.mbg.service.framework.services.Download.DownloadStatus.WAITTING:
				case lenovo.mbg.service.framework.services.Download.DownloadStatus.DOWNLOADING:
				case lenovo.mbg.service.framework.services.Download.DownloadStatus.AUTO_PAUSE:
				case lenovo.mbg.service.framework.services.Download.DownloadStatus.MANUAL_PAUSE:
				case lenovo.mbg.service.framework.services.Download.DownloadStatus.UNZIPPING:
					break;
				}
			}
		}
	}
	public class CopyLogs : BaseStep
	{
		public override void Run()
		{
			string text = base.Info.Args.LogLocation;
			string text2 = base.Info.Args.LogSubDir;
			string searchPattern = base.Info.Args.SearchPattern ?? "*.log";
			bool flag = base.Info.Args.LatestSubDir ?? ((object)false);
			if (text.StartsWith("$"))
			{
				if (!base.Cache.ContainsKey(text.Substring(1)))
				{
					base.Log.AddResult(this, Result.SKIPPED, "LogLocation configuration error in recipe file");
					return;
				}
				text = base.Cache[text.Substring(1)];
				text = Path.GetDirectoryName(text);
			}
			if (!string.IsNullOrEmpty(text2))
			{
				text = Path.Combine(text, text2);
			}
			if (flag)
			{
				text = GlobalFun.GetLasterDirectory(text);
			}
			List<string> allFiles = GlobalFun.GetAllFiles(text, searchPattern);
			Result result = Result.PASSED;
			if (allFiles != null && allFiles.Count > 0)
			{
				try
				{
					string tmpfolder = Path.Combine(Path.GetTempPath(), "lmsatemp");
					if (!Directory.Exists(tmpfolder))
					{
						Directory.CreateDirectory(tmpfolder);
					}
					else
					{
						GlobalFun.DeleteFileInDirectory(tmpfolder);
					}
					LogHelper.LogInstance.Info("Copy files to dir: " + tmpfolder, upload: true);
					allFiles.ForEach(delegate(string n)
					{
						File.Copy(n, Path.Combine(tmpfolder, new FileInfo(n).Name), overwrite: true);
					});
				}
				catch (Exception ex)
				{
					result = Result.COPYLOGS_FAILED;
					base.Log.AddLog("copy tool log file error!", upload: true, ex);
				}
			}
			else
			{
				LogHelper.LogInstance.Info("No log file need to copy!", upload: true);
			}
			base.RunResult = result.ToString();
			base.Log.AddResult(this, result);
		}
	}
	public class CopyFiles : BaseStep
	{
		private string failedResponse;

		public override void Run()
		{
			JArray jArray = base.Info.Args.Files;
			SortedList<string, string> sortedList = new SortedList<string, string>();
			if (jArray != null && jArray.HasValues)
			{
				foreach (JToken item in jArray)
				{
					string text = item.Value<string>("SourcePath");
					if (string.IsNullOrEmpty(text))
					{
						failedResponse = "SourcePath format error";
						break;
					}
					string text2 = item.Value<string>("DestPath");
					if (string.IsNullOrEmpty(text2))
					{
						failedResponse = "DestPath format error";
						break;
					}
					JArray jArray2 = item.Value<JArray>("SourceFiles");
					if (jArray2 == null || !jArray2.HasValues)
					{
						failedResponse = "SourceFiles format error";
						break;
					}
					List<string> list = jArray2.Values<string>().ToList();
					List<string> list2 = null;
					int count = list.Count;
					int num = -1;
					JArray jArray3 = item.Value<JArray>("DestFiles");
					if (jArray3 != null && jArray3.HasValues)
					{
						list2 = jArray3.Values<string>().ToList();
						num = list2.Count;
					}
					if (text.StartsWith("$"))
					{
						string key = text.Substring(1);
						text = base.Cache[key];
					}
					if (text2.StartsWith("$"))
					{
						string key2 = text2.Substring(1);
						text2 = base.Cache[key2];
					}
					for (int i = 0; i < count; i++)
					{
						string text3 = Path.Combine(text, list[i]);
						string value = Path.Combine(text2, list[i]);
						if (num > i)
						{
							value = Path.Combine(text2, list2[i]);
						}
						if (!File.Exists(text3))
						{
							failedResponse = text3 + " not exists";
							sortedList.Clear();
							break;
						}
						sortedList.Add(text3, value);
					}
				}
				foreach (KeyValuePair<string, string> item2 in sortedList)
				{
					File.Copy(item2.Key, item2.Value, overwrite: true);
				}
			}
			base.Log.AddResult(this, string.IsNullOrEmpty(failedResponse) ? Result.PASSED : Result.COPYFILES_FAILED, failedResponse);
		}
	}
	public class Clear : BaseStep
	{
		public override void Run()
		{
			ODMServerMain.CloseAllSockets();
			base.Log.AddResult(this, Result.PASSED);
		}
	}
	public class CmdRunner : BaseStep
	{
		private List<string> decryptFiles;

		private Action closeResuingWndAction;

		private bool quit;

		private Action closeMessageboxAction;

		private volatile bool IsConnected;

		private volatile bool IsCompleted;

		private volatile bool IsError;

		private double totalFile;

		private double currentFile;

		private static Dictionary<string, ShellCmdStatus> ResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"Device successfully AVB unlocked",
				ShellCmdStatus.Connected
			},
			{
				"Finished. Total time",
				ShellCmdStatus.Downloading
			},
			{
				"Press any key to reboot",
				ShellCmdStatus.Completed
			},
			{
				"flash successed",
				ShellCmdStatus.Completed
			},
			{
				"fastboot: error",
				ShellCmdStatus.Error
			}
		};

		public override void Run()
		{
			string text = base.Info.Args.Command;
			if (base.Info.Args.Format != null)
			{
				List<object> list = new List<object>();
				foreach (object item2 in base.Info.Args.Format)
				{
					string text2 = (string)(dynamic)item2;
					object item = text2;
					if (text2.StartsWith("$"))
					{
						string key = text2.Substring(1);
						item = base.Cache[key];
					}
					list.Add(item);
				}
				text = string.Format(text, list.ToArray());
			}
			base.Log.AddLog("CmdRunner execute cmd: " + text);
			MatchCollection matchCollection = Regex.Matches(File.ReadAllText(text), "^fastboot\\s+?[^\\\"]+\\\".+\\\"\\s*$", RegexOptions.Multiline);
			totalFile = matchCollection.Count;
			if (base.Info.Args.PromptText != null)
			{
				Task.Run(delegate
				{
					dynamic val = base.Info.Args.Image?.ToString();
					dynamic val2 = base.Info.Args.PromptText.ToString();
					dynamic val3 = base.Info.Args.link?.ToString();
					if (base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, val2, val, link: val3, milliseconds: 10000) == null)
					{
						quit = true;
					}
				});
			}
			try
			{
				string text3 = base.Info.Args.DecryptFileType;
				if (!string.IsNullOrEmpty(text3))
				{
					decryptFiles = GlobalFun.DecryptRomFile(base.Resources.Get("Rom"), text3);
				}
			}
			catch (Exception)
			{
			}
			GlobalFun.KillProcess("cmd");
			GlobalFun.KillProcess("fastboot");
			Thread.Sleep(3000);
			IsConnected = false;
			string workingDirectory = base.Resources.Get(RecipeResources.Rom);
			Process process = new Process();
			process.StartInfo.FileName = Path.Combine(Environment.SystemDirectory, "cmd.exe");
			process.StartInfo.WorkingDirectory = workingDirectory;
			process.StartInfo.Arguments = "";
			process.StartInfo.RedirectStandardInput = true;
			process.StartInfo.RedirectStandardOutput = true;
			process.StartInfo.RedirectStandardError = true;
			process.StartInfo.UseShellExecute = false;
			process.StartInfo.Verb = "runas";
			process.EnableRaisingEvents = true;
			process.StartInfo.CreateNoWindow = true;
			List<string> outputList = new List<string>();
			process.OutputDataReceived += delegate(object sender, DataReceivedEventArgs e)
			{
				Redirected(outputList, sender, e);
			};
			process.ErrorDataReceived += delegate(object sender, DataReceivedEventArgs e)
			{
				Redirected(outputList, sender, e);
			};
			process.Start();
			process.BeginOutputReadLine();
			process.BeginErrorReadLine();
			process.StandardInput.WriteLine("\"" + text + "\" &exit");
			int num = 0;
			int num2 = ((base.Info.Args.Timeout == null) ? ((object)1800000) : base.Info.Args.Timeout);
			bool flag = false;
			do
			{
				flag = process.HasExited;
				if (IsCompleted || IsError || flag || quit || (num >= 600000 && !IsConnected))
				{
					break;
				}
				Thread.Sleep(1000);
				num += 1000;
			}
			while (num < num2);
			if (!flag)
			{
				process.Kill();
			}
			GlobalFun.KillProcess("cmd");
			GlobalFun.KillProcess("fastboot");
			Thread.Sleep(3000);
			Result result = Result.PASSED;
			string response = null;
			if (quit)
			{
				result = Result.MANUAL_QUIT;
				response = "quit";
			}
			else if (!IsConnected)
			{
				result = Result.DEVICE_CONNECT_FAILED;
				response = "device connected timeout";
			}
			else if (!IsCompleted)
			{
				result = Result.FAILED;
				response = string.Join("\r\n", outputList);
			}
			closeMessageboxAction?.Invoke();
			closeMessageboxAction = null;
			closeResuingWndAction?.Invoke();
			closeResuingWndAction = null;
			if (decryptFiles != null && decryptFiles.Count > 0)
			{
				Task.Run(delegate
				{
					decryptFiles.ForEach(delegate(string n)
					{
						GlobalFun.TryDeleteFile(n);
					});
				});
			}
			base.Log.AddResult(this, result, response);
		}

		private void Redirected(List<string> outputList, object sender, DataReceivedEventArgs e)
		{
			if (string.IsNullOrEmpty(e.Data))
			{
				return;
			}
			outputList.Add(e.Data);
			string text = null;
			base.Log.AddLog("flash cmd output: " + e.Data);
			foreach (string key in ResponseToStatus.Keys)
			{
				if (Regex.IsMatch(e.Data, key, RegexOptions.IgnoreCase))
				{
					text = key;
				}
			}
			if (string.IsNullOrEmpty(text))
			{
				return;
			}
			ShellCmdStatus value = ShellCmdStatus.None;
			if (!ResponseToStatus.TryGetValue(text, out value))
			{
				return;
			}
			base.Log.AddLog($"====>>Cmd runner response status:{value}!");
			switch (value)
			{
			case ShellCmdStatus.Connected:
				base.Recipe.FreeEventHandler(realFlash: true);
				IsConnected = true;
				closeMessageboxAction?.Invoke();
				closeMessageboxAction = null;
				break;
			case ShellCmdStatus.Downloading:
			{
				if (!IsConnected)
				{
					IsConnected = true;
					closeMessageboxAction?.Invoke();
					closeMessageboxAction = null;
				}
				if (!(totalFile > 0.0))
				{
					break;
				}
				currentFile += 1.0;
				double result = currentFile / totalFile;
				if (double.TryParse($"{result * 100.0:0.00}", out result))
				{
					double num = ((100.0 - result < 0.02) ? 100.0 : result);
					if (num > 0.0)
					{
						ProgressUpdate(num);
					}
				}
				break;
			}
			case ShellCmdStatus.Completed:
				IsCompleted = true;
				break;
			case ShellCmdStatus.Error:
				IsError = true;
				break;
			case ShellCmdStatus.None:
			case ShellCmdStatus.Connecting:
				break;
			}
		}
	}
	public class FastbootDeviceMatchCheck : BaseStep
	{
		private readonly List<string> elements = new List<string>
		{
			"sku", "serialno", "imei", "ro.carrier", "version-baseband", "ro.build.fingerprint", "ro.build.version.full", "ro.build.version.qcom", "oem hw dualsim", "softwareVersion",
			"ram", "emmc", "androidVer", "fdr-allowed", "securestate", "cid"
		};

		private DeviceEx device;

		private IAndroidDevice properties;

		private bool isBatFileCheckDowngradeError;

		public override void Run()
		{
			if (base.TimeoutMilliseconds <= 0)
			{
				base.TimeoutMilliseconds = 20000;
			}
			do
			{
				properties = FindDevice();
				if (properties != null)
				{
					break;
				}
				if (base.Info.Args.TempVP != null && Retry > 0)
				{
					DriverPrompt();
				}
				int retry = Retry - 1;
				Retry = retry;
			}
			while (Retry >= 0);
			if (properties == null)
			{
				base.Log.AddLog("Find Fastboot Device TimeOut,Start Getvar all", upload: true);
				if (device != null)
				{
					device.Load();
					if (string.IsNullOrEmpty(device.Property.ModelName) && string.IsNullOrEmpty(device.Property.IMEI1))
					{
						base.Recipe.UcDevice.MessageBox.Show("K0071", "K1478", "K0327", null, showClose: false, (MessageBoxImage)48).Wait();
						base.Log.AddResult(this, Result.QUIT, "Read device info failed");
						return;
					}
					properties = device.Property;
				}
				else
				{
					string command = EncapsulationFastbootCommand("getvar all");
					for (int i = 0; i < 2; i++)
					{
						List<string> list = ProcessRunner.ProcessList(LoadToolPath("fastboot.exe"), command, 5000);
						if (list.Count > 0 && list.Count((string n) => n.Contains("execute error, commnad timeout")) == 0 && list.Count((string n) => n.Contains("FAILED")) == 0)
						{
							device = GetDevice(ConnectType.Fastboot);
							if (device != null && device.SoftStatus == DeviceSoftStateEx.Online)
							{
								properties = device.Property;
								break;
							}
							base.Log.AddLog("Device is null, but getvar all has data, reload the device!", upload: true);
							Thread.Sleep(5000);
							device = GetDevice(ConnectType.Fastboot);
							if (device != null)
							{
								properties = device.Property;
								break;
							}
							base.Log.AddLog("device reload failed !", upload: true);
						}
						else if (list.Count((string n) => n.Contains("FAILED")) != 0)
						{
							base.Log.AddLog("getvar all failed !");
						}
					}
				}
				if (properties == null)
				{
					PrintConnectedDevice(print: true);
					base.Recipe.UcDevice.MessageBox.Show("K0071", "K0935", "K0327", null, showClose: false, (MessageBoxImage)48).Wait();
					base.Log.AddResult(this, Result.QUIT, "Not find fastboot device!");
					return;
				}
			}
			bool? flag = null;
			if (base.Info.Args.EXE != null && base.Info.Args.Command != null)
			{
				string text = base.Info.Args.EXE;
				if (text.StartsWith("$"))
				{
					string key = text.Substring(1);
					text = $"\"{(object?)base.Cache[key]}\"";
				}
				string text2 = base.Info.Args.Command;
				if (base.Info.Args.Format != null)
				{
					List<object> list2 = new List<object>();
					foreach (object item2 in base.Info.Args.Format)
					{
						string text3 = (string)(dynamic)item2;
						object item = text3;
						if (text3.StartsWith("$"))
						{
							string key2 = text3.Substring(1);
							item = base.Cache[key2];
						}
						list2.Add(item);
					}
					text2 = string.Format(text2, list2.ToArray());
				}
				int timeout = base.Info.Args.Timeout ?? ((object)6000);
				flag = BatFileCheckDowngrade(text + " " + text2, timeout);
			}
			else
			{
				flag = NewMethodCheckDowngrade();
			}
			if (isBatFileCheckDowngradeError)
			{
				base.Log.AddResult(this, Result.QUIT, "bat file check downgrade error");
				return;
			}
			string text4 = null;
			string text5 = null;
			string text6 = null;
			string text7 = null;
			string text8 = null;
			string text9 = null;
			string text10 = null;
			if (properties != null)
			{
				foreach (string element in elements)
				{
					string text11 = properties.GetPropertyValue(element);
					if (element == "ram" && !string.IsNullOrEmpty(text11))
					{
						text11 = Regex.Split(text11, "\\s")[0];
					}
					base.Log.AddInfo(element, text11);
				}
				text4 = properties.ModelName;
				text5 = properties.IMEI1;
				text6 = properties.GetPropertyValue("softwareVersion");
				text7 = base.Log.Info["fdr-allowed"];
				text8 = base.Log.Info["securestate"];
				text10 = base.Log.Info["cid"];
				text9 = properties.GetPropertyValue("channelid");
				base.Log.AddLog("modelname: " + text4 + ", imei: " + text5 + ", softwareVersion: " + text6 + ", securestate: " + text8 + ",fdrallowed: " + text7 + ",channelid: " + text9 + " ", upload: true);
			}
			bool flag2 = ErrorRulesCheck(properties);
			string value = base.Info.Args.ErrorRulePromptText;
			string value2 = base.Info.Args.OnlyCheckModelName ?? "False";
			Dictionary<string, string> data = new Dictionary<string, string>
			{
				{ "onlyCheckModelName", value2 },
				{
					"tractId",
					base.Recipe.Device.Identifer
				},
				{ "modelname", text4 },
				{ "imei", text5 },
				{ "softwareVersion", text6 },
				{ "fdrallowed", text7 },
				{ "securestate", text8 },
				{
					"versioncheck",
					$"{flag}"
				},
				{
					"channelid",
					text9 ?? ""
				},
				{
					"cid",
					text10 ?? ""
				},
				{
					"errorRules",
					flag2.ToString()
				},
				{ "errorRuleMessage", value }
			};
			Task<object> task = base.Log.NotifyAsync(RecipeMessageType.MODELNAME, data);
			task.Wait();
			int num = (int)task.Result;
			Result result = Result.QUIT;
			string response = null;
			switch (num)
			{
			case 0:
			{
				bool num2 = base.Info.Args.ExitWithFailed ?? ((object)false);
				base.RunResult = "MODELNAME_CHECK_FAILED";
				response = "modelname check failed";
				result = ((!num2) ? Result.MODELNAME_CHECK_FAILED_QUIT : Result.FAILED);
				FreeDevice();
				base.Log.AddLog("==========modelname unmatch, reset recipe device: null ==========");
				if (base.Info.Args.PromptText != null)
				{
					base.Recipe.UcDevice.MessageBox.Show("K0711", string.Format(HostProxy.LanguageService.Translate(base.Info.Args.PromptText.ToString()), text4)).Wait();
				}
				break;
			}
			case 1:
				response = "device downgrade";
				result = Result.FASTBOOT_DEGRADE_QUIT;
				break;
			case 2:
				response = "fdr-allowed: no";
				break;
			case 3:
				response = "securestate: flashing_locked";
				break;
			case 5:
				response = "Cid:" + text10 + ", device is in states been modified somehow";
				result = Result.FASTBOOT_CID_CHECKE_QUIT;
				break;
			case 6:
				response = "data match error rule";
				result = Result.FASTBOOT_ERROR_RULES_QUIT;
				break;
			case 7:
				response = "model name not match ,Rematch";
				result = Result.MODELNAME_CHECK_FAILED_REMATCH_QUIT;
				break;
			default:
				result = Result.PASSED;
				break;
			}
			base.Log.AddResult(this, result, response);
		}

		private IAndroidDevice FindDevice()
		{
			DateTime now = DateTime.Now;
			do
			{
				device = GetDevice(ConnectType.Fastboot);
				if (device != null && device.SoftStatus == DeviceSoftStateEx.Online)
				{
					return device.Property;
				}
				Thread.Sleep(500);
			}
			while (DateTime.Now.Subtract(now).TotalMilliseconds < (double)base.TimeoutMilliseconds);
			return null;
		}

		private void FreeDevice()
		{
			if (base.Recipe.UcDevice.ManualDevice)
			{
				base.Recipe.UcDevice.Device.WorkType = DeviceWorkType.None;
				base.Recipe.UcDevice.Device = null;
			}
		}

		private int? GetVersionFormFile(string fileName)
		{
			string[] array = File.ReadAllLines(fileName);
			foreach (string text in array)
			{
				if (!text.Contains("HAB_SECURITY_VERSION"))
				{
					continue;
				}
				string[] array2 = text.Trim().Split(new char[1] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
				try
				{
					if (array2.Length >= 2)
					{
						return System.Convert.ToInt32(array2[1]);
					}
					return null;
				}
				catch (Exception)
				{
					return null;
				}
			}
			return null;
		}

		private (bool, int?) GetDevVersion(string cmdResp)
		{
			if (string.IsNullOrEmpty(cmdResp))
			{
				return (false, null);
			}
			bool item = false;
			int? item2 = null;
			string[] array = cmdResp.Split(new char[2] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);
			string empty = string.Empty;
			string[] array2 = array;
			foreach (string text in array2)
			{
				empty = text.Trim(new char[2] { ' ', '.' }).ToLower();
				if (empty.Contains("_da"))
				{
					item = true;
				}
				if (!empty.Contains("vbmeta") && !text.Contains("RIL #0"))
				{
					continue;
				}
				string[] array3 = empty.Split(new string[1] { " = " }, StringSplitOptions.RemoveEmptyEntries);
				if (array3.Length == 2)
				{
					try
					{
						item2 = ((!array3[1].StartsWith("0x")) ? new int?(System.Convert.ToInt32(array3[1])) : new int?(System.Convert.ToInt32(array3[1], 16)));
					}
					catch (Exception)
					{
					}
				}
			}
			return (item, item2);
		}

		private bool? NewMethodCheckDowngrade()
		{
			string text = base.Resources.Get("Rom");
			if (string.IsNullOrEmpty(text))
			{
				base.Log.AddLog("Rom Directory is null");
				return null;
			}
			if (!Directory.Exists(text))
			{
				base.Log.AddLog("Rom Directory: " + text + ", not exists");
				return null;
			}
			string text2 = Path.Combine(text, "signing-info.txt");
			if (File.Exists(text2))
			{
				int? versionFormFile = GetVersionFormFile(text2);
				base.Log.AddLog("signing-info.txt rom version is [" + ((!versionFormFile.HasValue) ? "null" : versionFormFile.ToString()) + "]!", upload: true);
				if (versionFormFile.HasValue)
				{
					string text3 = EncapsulationFastbootCommand("oem read_sv");
					text3 = "fastboot " + text3;
					string text4 = ProcessRunner.CmdExcuteWithExit(text3, null, 6000);
					base.Log.AddLog("check downgrade command: " + text3 + ", response: " + text4);
					if (string.IsNullOrEmpty(text4))
					{
						base.Log.AddLog("shell cmd [fastboot oem read_sv] have no response!", upload: true);
						return null;
					}
					if (BatFileDowngradeRespError(text4))
					{
						return null;
					}
					(bool, int?) devVersion = GetDevVersion(text4);
					base.Log.AddLog($"Device is MTK {devVersion.Item1}, device version is {devVersion.Item2}!", upload: true);
					if (devVersion.Item2.HasValue)
					{
						return versionFormFile < devVersion.Item2;
					}
				}
			}
			return null;
		}

		private bool BatFileDowngradeRespError(string cmdResp)
		{
			isBatFileCheckDowngradeError = false;
			if (base.Info.Args.QuitConditions != null)
			{
				foreach (dynamic item in base.Info.Args.QuitConditions)
				{
					if (!((item.Condition != null) ? true : false))
					{
						continue;
					}
					foreach (object item2 in item.Condition)
					{
						string text = (string)(dynamic)item2;
						if (cmdResp.Contains(text))
						{
							base.Log.AddLog("Bat file read error: " + text, upload: true);
							isBatFileCheckDowngradeError = true;
							if (item.Message != null)
							{
								base.Recipe.UcDevice.MessageBox.Show("K0711", HostProxy.LanguageService.Translate(item.Message.ToString())).Wait();
							}
							if (item.RescueMark != null)
							{
								base.Log.AddInfo("rescuemark", (string)item.RescueMark);
							}
							base.Log.AddLog(cmdResp, upload: true);
							return isBatFileCheckDowngradeError;
						}
					}
				}
			}
			return isBatFileCheckDowngradeError;
		}

		private bool? BatFileCheckDowngrade(string commandLine, int timeout)
		{
			if (!File.Exists(Path.Combine(base.Resources.Get("Rom"), "sign_info.txt")))
			{
				return null;
			}
			string text = ProcessRunner.CmdExcuteWithExit(commandLine, base.Resources.Get("Rom"), timeout);
			if (!string.IsNullOrEmpty(text))
			{
				if (BatFileDowngradeRespError(text))
				{
					return null;
				}
				int? num = null;
				int? num2 = null;
				string[] array = text.Split(new char[2] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);
				_ = string.Empty;
				string[] array2 = array;
				foreach (string text2 in array2)
				{
					if (text2.Contains("device rollback id sum:"))
					{
						string[] array3 = text2.Trim().Split(new char[1] { ':' });
						if (array3.Length == 2)
						{
							int result = 0;
							if (int.TryParse(array3[1], out result))
							{
								num2 = result;
							}
						}
					}
					if (!text2.Contains("signinfo id sum:"))
					{
						continue;
					}
					string[] array4 = text2.Trim().Split(new char[1] { ':' });
					if (array4.Length == 2)
					{
						int result2 = 0;
						if (int.TryParse(array4[1], out result2))
						{
							num = result2;
						}
					}
				}
				if (!num2.HasValue || !num.HasValue || num == 0)
				{
					return null;
				}
				if (base.Info.Args.SVValueMax != null)
				{
					int num3 = base.Info.Args.SVValueMax;
					if (num2 > num3)
					{
						base.Log.AddLog($"Bat file read device version is {num2}, larger than SVValueMax:[{num3}]! signing-info.txt rom version is {num}.", upload: true);
						return null;
					}
				}
				base.Log.AddLog($"Bat file read device version is {num2}, signing-info.txt rom version is {num}!", upload: true);
				return num < num2;
			}
			base.Log.AddLog("Bat file excute timeout!", upload: true);
			return null;
		}

		private bool ErrorRulesCheck(IAndroidDevice properties)
		{
			if (base.Info.Args.ErrorRules is JArray { HasValues: not false } jArray)
			{
				Dictionary<string, List<string>> dictionary = new Dictionary<string, List<string>>();
				foreach (JToken item3 in jArray)
				{
					List<string> list = new List<string>();
					string key = item3.Value<string>("Property");
					JToken jToken = item3.Value<JToken>("Values");
					if (jToken is JArray jArray2)
					{
						list = jArray2.Values<string>().ToList();
					}
					else
					{
						string item = jToken.Value<string>();
						list.Add(item);
					}
					if (list != null && list.Count > 0)
					{
						if (!dictionary.ContainsKey(key))
						{
							dictionary.Add(key, list);
						}
						else
						{
							dictionary[key].AddRange(list);
						}
					}
				}
				StringBuilder stringBuilder = new StringBuilder();
				if (base.Info.Args.ErrorExtendRules is JArray { HasValues: not false } jArray3)
				{
					bool flag = true;
					foreach (string item2 in jArray3.Values<string>().ToList())
					{
						KeyValuePair<string, List<string>> keyValuePair = dictionary.FirstOrDefault((KeyValuePair<string, List<string>> m) => m.Key.Equals(item2));
						if (keyValuePair.Value != null)
						{
							string propertyValue = properties.GetPropertyValue(item2);
							flag = checkFun(keyValuePair.Value, propertyValue);
							if (!flag)
							{
								stringBuilder.AppendLine(propertyValue + " unmatch error rule: " + string.Join(",", keyValuePair.Value));
								break;
							}
							stringBuilder.AppendLine(propertyValue + " match error rule: " + string.Join(",", keyValuePair.Value));
						}
					}
					base.Log.AddLog(stringBuilder.ToString(), upload: true);
					return flag;
				}
				bool flag2 = true;
				foreach (KeyValuePair<string, List<string>> item4 in dictionary)
				{
					string propertyValue2 = properties.GetPropertyValue(item4.Key);
					flag2 = checkFun(item4.Value, propertyValue2);
					if (flag2)
					{
						stringBuilder.AppendLine(propertyValue2 + " match error rule: " + string.Join(",", item4.Value));
						break;
					}
					stringBuilder.AppendLine(propertyValue2 + " unmatch error rule: " + string.Join(",", item4.Value));
				}
				base.Log.AddLog(stringBuilder.ToString(), upload: true);
				return flag2;
			}
			return false;
			static bool checkFun(List<string> ruleValueList, string data)
			{
				return ruleValueList.Exists(delegate(string r)
				{
					if (string.IsNullOrEmpty(r))
					{
						return string.IsNullOrEmpty(data);
					}
					return !string.IsNullOrEmpty(data) && Regex.IsMatch(data, r, RegexOptions.IgnoreCase);
				});
			}
		}

		private void DriverPrompt()
		{
			MonitorDeviceModel currentMonitorDeviceInfo = VidPidMonitorHandler.Instance.GetCurrentMonitorDeviceInfo();
			base.Log.AddLog(string.Format("The device information obtained by detecting the port [{0}] in step [{1}] : DriverName [{2}] DeviceId [{3}] ", new object[4]
			{
				base.Info.Args.TempVP,
				base.Name,
				currentMonitorDeviceInfo.ProviderName,
				currentMonitorDeviceInfo.PnpDeviceId
			}), upload: true);
			if (string.IsNullOrEmpty(currentMonitorDeviceInfo?.ProviderName) || currentMonitorDeviceInfo.ProviderName.Equals("--", StringComparison.CurrentCultureIgnoreCase) || string.IsNullOrEmpty(currentMonitorDeviceInfo?.PnpDeviceId) || currentMonitorDeviceInfo.ProviderName.Equals("Motorola", StringComparison.CurrentCultureIgnoreCase))
			{
				return;
			}
			if (DriverErrorPromptByFastboot())
			{
				if (!VidPidMonitorHandler.Instance.ForceDriverUpdate(currentMonitorDeviceInfo.PnpDeviceId, Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "LMSA\\drivers\\Motorola\\motoandroid2.inf")))
				{
					base.Recipe.UcDevice.MessageBox.Show(base.Name, "K2190", "K0327", "K0208", showClose: false, (MessageBoxImage)48).Wait();
				}
				return;
			}
			base.Log.AddLog("The user chooses not to update the driver. The driver information currently in use is:DriverName [" + currentMonitorDeviceInfo.ProviderName + "] DeviceId [" + currentMonitorDeviceInfo.PnpDeviceId + "] DriverVersion [" + currentMonitorDeviceInfo.DriverVersion + "]", upload: true);
		}
	}
	public class CleanupFactoryMode : BaseStep
	{
		protected int timeout = 30000;

		protected StringBuilder sb = new StringBuilder();

		public override void Run()
		{
			int num = 0;
			if (base.Info.Args.RetryTimes != null)
			{
				num = base.Info.Args.RetryTimes;
			}
			if (base.Info.Args.Timeout != null)
			{
				timeout = base.Info.Args.Timeout;
			}
			Result result = Result.CLEAR_FACTORYMODE_FAILED;
			int num2 = 0;
			do
			{
				Clear();
				if (Check())
				{
					result = Result.PASSED;
					break;
				}
				Thread.Sleep(3000);
				base.Log.AddLog($"cleanup factory mode failed, try {++num2}", upload: true);
			}
			while (--num >= 0);
			string response = null;
			if (result != Result.PASSED)
			{
				response = "cleanup factory mode failed";
			}
			base.Log.AddResult(this, result, response);
		}

		protected void Clear()
		{
			string command = base.Info.Args.Command;
			command = EncapsulationFastbootCommand(command);
			string text = ProcessRunner.ProcessString(LoadToolPath(), command, timeout)?.ToLower();
			base.Log.AddLog("fastboot command:" + command + ",response: " + text, upload: true);
		}

		protected bool Check()
		{
			string text = EncapsulationFastbootCommand("oem config bootmode");
			string text2 = ProcessRunner.ProcessString(LoadToolPath(), text, timeout)?.ToLower();
			base.Log.AddLog("fastboot command: " + text + ", response: " + text2, upload: true);
			Regex regex = new Regex("<value>\\r\\n\\(bootloader\\)\\s*</value>\\r\\n");
			Regex regex2 = new Regex("<value>\\r\\n\\(bootloader\\)\\s*normal\\s*\\r\\n\\(bootloader\\)\\s*</value>\\r\\n");
			Regex regex3 = new Regex("<value>\\r\\n\\(bootloader\\)\\s*\\r\\n\\(bootloader\\)\\s*</value>\\r\\n");
			if (!regex.IsMatch(text2) && !regex2.IsMatch(text2))
			{
				return regex3.IsMatch(text2);
			}
			return true;
		}
	}
	public class FastbootFlash : BaseStep
	{
		private static Dictionary<string, int> OperationToTimeout = new Dictionary<string, int>
		{
			{ "flash", 300000 },
			{ "erase", 60000 },
			{ "oem", 60000 },
			{ "getvar", 20000 },
			{ "reboot", 20000 },
			{ "reboot-bootloader", 10000 },
			{ "format", 60000 },
			{ "flashall", 600000 },
			{ "continue", 10000 }
		};

		private Action closeResuingWndAction;

		private List<CommandLine> commands;

		private string failedResponse;

		private int outCondition;

		private static readonly Regex REG_EX = new Regex("(?<bootloader>\\(bootloader\\)\\s+)(?<key>.+):\\s+(?<value>.*)");

		private double usbStandardRate;

		private double filterFileSize;

		private int executedFileSize;

		private double executedSendTime;

		private List<string> usbPormpList;

		private bool isTimeOutFailed;

		protected string fullpath;

		protected long totalDataSize;

		private string TAG => GetType().FullName;

		private string logPath => Configurations.RescueFailedLogPath;

		public override void Run()
		{
			base.FailedByDeviceRemoved = false;
			outCondition = ParseCondition(base.OutCondition);
			string text = base.Info.Args.XML;
			_ = (string)base.Info.Args.EXE;
			if (text.StartsWith("$"))
			{
				string key = text.Substring(1);
				text = base.Cache[key];
			}
			fullpath = LoadToolPath();
			executedFileSize = 0;
			executedSendTime = 0.0;
			usbStandardRate = base.Info.Args.USBStandardRateKB ?? ((object)0);
			filterFileSize = base.Info.Args.FilterFileSizeKB ?? ((object)0);
			usbPormpList = new List<string>();
			isTimeOutFailed = false;
			Result result = ParseCommands(text);
			if (File.Exists(logPath))
			{
				File.Delete(logPath);
			}
			string text2 = string.Empty;
			if (result == Result.PASSED && commands.Count > 0)
			{
				result = ExecuteCommand();
			}
			if (base.Info.Args.IgnoreCurrStepResult != null)
			{
				_ = (bool)base.Info.Args.IgnoreCurrStepResult;
			}
			bool flag = result == Result.PASSED || GetPnputilIsConnected();
			if (result != Result.PASSED)
			{
				List<string> list = ProcessRunner.ProcessList(fullpath, EncapsulationFastbootCommand("getvar all"), 12000);
				if (list != null)
				{
					foreach (string item in list)
					{
						Match match = REG_EX.Match(item);
						string value = match.Groups["key"].Value;
						string value2 = match.Groups["value"].Value;
						if (!string.IsNullOrEmpty(value) && value.Equals("channelid"))
						{
							base.Log.AddInfo("channelid", value2);
							break;
						}
					}
					text2 = string.Join("\r\n", list);
				}
				base.Log.AddLog("command : getvar all, response: " + text2, upload: true);
			}
			if (result != Result.PASSED && (base.FailedByDeviceRemoved || !flag))
			{
				base.IgnoreErrorPromptText = true;
				base.Log.AddLog($"fastboot device connect error, too many links: {base.FailedByDeviceRemoved} ,device disConnected :{!flag}", upload: true);
				base.Recipe.UcDevice.MessageBox.Show(base.Name, "K1452", "K0327", null, showClose: false, (MessageBoxImage)48).Wait();
			}
			if (result != Result.PASSED && usbStandardRate != 0.0 && executedSendTime != 0.0)
			{
				double num = Math.Round((double)executedFileSize / executedSendTime, 2);
				base.Log.AddLog(string.Format("Total size of sent files:[{0}]KB,Total time of sent files:[{1}]S,Overall speed:[{2}],Setting speed: [{3}],FilterFileSize:[{4}]KB", new object[5]
				{
					executedFileSize,
					executedSendTime,
					GetRate(num),
					GetRate(usbStandardRate),
					filterFileSize
				}), upload: true);
				base.Log.AddLog("Detailed file transfer rate:\r\n" + string.Join("\r\n", usbPormpList), upload: true);
				if (flag && !base.FailedByDeviceRemoved && isTimeOutFailed && num <= usbStandardRate && base.Info.Args.USBPromptText != null)
				{
					base.IgnoreErrorPromptText = true;
					base.Recipe.UcDevice.MessageBox.Show("K0711", HostProxy.LanguageService.Translate(base.Info.Args.USBPromptText.ToString())).Wait();
				}
			}
			base.Log.AddResult(this, result, failedResponse);
		}

		private int ParseCondition(string condition)
		{
			DeviceEx device = base.Recipe.Device;
			if (string.IsNullOrEmpty(condition))
			{
				return 0;
			}
			if (device != null && device.Property != null)
			{
				int num = condition.LastIndexOf(':');
				string name = condition.Substring(0, num);
				string value = condition.Substring(num + 1);
				string propertyValue = device.Property.GetPropertyValue(name);
				if (!string.IsNullOrEmpty(propertyValue) && !string.IsNullOrEmpty(value) && propertyValue.Equals(value, StringComparison.CurrentCultureIgnoreCase))
				{
					return 2;
				}
			}
			return 1;
		}

		private Result ExecuteCommand()
		{
			Result result = Result.PASSED;
			int num = -1;
			if (!string.IsNullOrEmpty(base.condition))
			{
				CommandLine commandLine = commands.LastOrDefault((CommandLine n) => n.command.Contains(base.condition));
				if (commandLine.id > 0)
				{
					num = commandLine.id + 1;
				}
			}
			base.Recipe.FreeEventHandler(realFlash: true);
			bool flag = true;
			string empty = string.Empty;
			long num2 = 0L;
			_ = base.Recipe.Device?.Identifer;
			foreach (CommandLine command in commands)
			{
				if (!File.Exists(fullpath))
				{
					result = Result.FASTBOOT_FLASH_FAILED;
					failedResponse = "file: " + fullpath + " not exists";
					break;
				}
				if (base.ConditionSkipCommands != null)
				{
					JObject jObject = base.ConditionSkipCommands.FirstOrDefault((JObject n) => command.command.Contains(n.Value<string>("command")));
					if (jObject != null)
					{
						int num3 = ParseCondition(jObject.Value<string>("condition"));
						if (num3 == 2 || (num3 == 0 && outCondition != 1))
						{
							continue;
						}
					}
				}
				if (command.command.Contains("oem fb_mode_set") || command.command.Contains("oem fb_mode_clear") || base.SkipCommands.Exists((string n) => command.command.Contains(n)))
				{
					continue;
				}
				bool flag2 = false;
				if (base.IgnoreResultCommands.Exists((string n) => command.command.Contains(n)))
				{
					flag2 = true;
				}
				if (command.id == num)
				{
					flag = RunSubSteps();
				}
				if (!flag)
				{
					result = Result.FASTBOOT_FLASH_FAILED;
					break;
				}
				string cmd = EncapsulationFastbootCommand(command.command);
				empty = ProcessRunner.ProcessString(fullpath, cmd, command.timeout, delegate(Process p)
				{
					if (!p.HasExited)
					{
						p.StandardInput.WriteLine();
						base.Log.AddLog("input 'enter' when execute command: " + cmd, upload: true);
					}
				}, 60000, out var exitCode)?.ToLower();
				if (usbStandardRate != 0.0)
				{
					double num4 = ParseUsbTransferRate(empty);
					if (num4 != 0.0)
					{
						usbPormpList.Add("fastboot command:" + command.command + "  ,transmission rate :[" + GetRate(num4) + "]");
					}
				}
				base.Log.AddLog($"fastboot command : {cmd}, response: {empty}, exitcode: {exitCode}", upload: true);
				if (flag2)
				{
					if ((empty.Contains("fail") || empty.Contains("error")) && (command.command.ToLower().Contains("erase userdata") || command.command.ToLower().Contains("erase metadata")))
					{
						base.Recipe.IsEraseDataFailed = true;
					}
				}
				else
				{
					if (exitCode != 0L && string.IsNullOrEmpty(empty))
					{
						result = Result.FASTBOOT_FLASH_FAILED;
						failedResponse = "fastboot flash cmd exitcode error";
					}
					if (exitCode == -1 && empty.Contains("timeout") && command.command.Split(new char[1] { ' ' })[0] == "flash" && result != Result.FASTBOOT_FLASH_FAILED)
					{
						isTimeOutFailed = true;
					}
					if (empty.Contains("fail") || empty.Contains("error"))
					{
						failedResponse = "exec command failed: " + cmd + ", " + AnalysisFailedResponse(empty);
						if (empty.Contains("too many links"))
						{
							base.FailedByDeviceRemoved = true;
						}
						if (empty.Contains("failed to write") && !File.Exists(logPath))
						{
							ProcessRunner.ProcessString(fullpath, EncapsulationFastbootCommand("oem partition dump logfs"), 20000)?.ToLower();
							base.Log.AddLog("fastboot command: oem partition dump logfs, response: " + empty, upload: true);
						}
						result = ((!command.command.ToLower().Contains("erase userdata")) ? Result.FASTBOOT_FLASH_FAILED : Result.FASTBOOT_FLASH_ERASEDATE_FAILED);
						break;
					}
				}
				if (totalDataSize > 0)
				{
					num2 += command.size;
					double progress = 100.0 * (double)num2 / (double)totalDataSize;
					ProgressUpdate(progress);
				}
			}
			closeResuingWndAction?.Invoke();
			closeResuingWndAction = null;
			return result;
		}

		private Result ParseCommands(string xml)
		{
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f7: Unknown result type (might be due to invalid IL or missing references)
			//IL_0121: Unknown result type (might be due to invalid IL or missing references)
			commands = new List<CommandLine>();
			totalDataSize = 0L;
			if (!File.Exists(xml))
			{
				failedResponse = $"fastboot xml file: {xml} not exists";
				base.Log.AddLog(failedResponse, upload: true);
				return Result.FASTBOOT_FLASH_FAILED;
			}
			string text = File.ReadAllText(xml);
			XmlDocument val = new XmlDocument();
			val.LoadXml(text);
			XmlNode val2 = ((XmlNode)val).SelectSingleNode("/flashing/steps");
			string directoryName = Path.GetDirectoryName(xml);
			if (val2 != null)
			{
				XmlNodeList val3 = val2.SelectNodes("step");
				if (val3 != null)
				{
					int num = 0;
					long num2 = 0L;
					foreach (XmlNode item in val3)
					{
						num2 = 0L;
						XmlNode namedItem;
						string text2 = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("operation")) != null) ? namedItem.Value : string.Empty).Trim();
						string text3 = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("partition")) != null) ? namedItem.Value : string.Empty).Trim();
						string text4 = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("filename")) != null) ? namedItem.Value : string.Empty).Trim();
						string text5 = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("var")) != null) ? namedItem.Value : string.Empty).Trim();
						(((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("MD5")) != null) ? namedItem.Value : string.Empty).Trim();
						string text6;
						if (text4 != string.Empty)
						{
							text6 = Path.Combine(directoryName, text4);
							if (File.Exists(text6))
							{
								num2 = new FileInfo(text6).Length;
								totalDataSize += num2;
							}
						}
						else
						{
							text6 = string.Empty;
						}
						int timeout = ((!OperationToTimeout.ContainsKey(text2)) ? 120000 : OperationToTimeout[text2]);
						string text7 = ((!(text5 != string.Empty)) ? (string.IsNullOrEmpty(text6) ? (text2 + " " + text3) : (text2 + " " + text3 + " \"" + text6 + "\"")) : (text2 + " " + text5));
						text7 = text7.Trim();
						commands.Add(new CommandLine(++num, text7, timeout, num2));
					}
				}
			}
			return Result.PASSED;
		}

		private string GetRate(double rate)
		{
			string result = $"{rate} KB/S";
			if (rate > 1024.0)
			{
				result = $"{Math.Round(rate / 1024.0, 2)} MB/S";
			}
			return result;
		}

		private double ParseUsbTransferRate(string response)
		{
			double value = 0.0;
			int num = 0;
			double num2 = 0.0;
			string pattern = "sending\\s+'[^']*'\\s*\\((\\d+)\\s*kb\\)[\\s\\S]*?okay\\s*\\[\\s*([\\d.]+)\\s*s\\]";
			Match match = Regex.Match(response, pattern);
			if (match.Success)
			{
				string value2 = match.Groups[1].Value;
				string value3 = match.Groups[2].Value;
				num = int.Parse(value2);
				num2 = double.Parse(value3);
				if ((double)num <= filterFileSize)
				{
					value = 0.0;
				}
				else
				{
					executedFileSize += num;
					executedSendTime += num2;
					value = (double)num / num2;
				}
			}
			return Math.Round(value, 2);
		}
	}
	public class CommandLine
	{
		public int id { get; set; }

		public string command { get; private set; }

		public int timeout { get; private set; }

		public long size { get; private set; }

		public CommandLine(int id, string command, int timeout, long size)
		{
			this.id = id;
			this.command = command;
			this.timeout = timeout;
			this.size = size;
		}
	}
	public class FastbootFlashSinglepartition : BaseStep
	{
		private string failedResponse;

		private static readonly Regex REG_EX = new Regex("(?<bootloader>\\(bootloader\\)\\s+)(?<key>.+):\\s+(?<value>.*)");

		private List<KeyValuePair<string, int>> commands;

		public override void Run()
		{
			string text = base.Info.Args.XML;
			string text2 = base.Info.Args.EXE;
			string name = base.Info.Args.PartitionName;
			if (text.StartsWith("$"))
			{
				string key = text.Substring(1);
				text = base.Cache[key];
			}
			if (!File.Exists(text))
			{
				if (Directory.Exists(text))
				{
					base.Log.AddResult(this, Result.LOAD_RESOURCE_FAILED, "Rom resource file: " + text + " not exist!");
				}
				else
				{
					base.Log.AddResult(this, Result.ABORTED, "Mybe the key \"XMl\" in json args is error!");
				}
				return;
			}
			bool flag = ExtractBootloaderCommand(text, name);
			if (!flag)
			{
				base.Log.AddResult(this, Result.LOAD_RESOURCE_FAILED, "Rom resource file: " + text + " not exist!");
				return;
			}
			if (string.IsNullOrEmpty(text2))
			{
				text2 = "fastboot.exe";
			}
			string text3 = base.Resources.GetLocalFilePath(text2);
			if (string.IsNullOrEmpty(text3))
			{
				text3 = Configurations.FastbootPath;
			}
			foreach (KeyValuePair<string, int> command in commands)
			{
				string text4 = EncapsulationFastbootCommand(command.Key);
				string text5 = ProcessRunner.ProcessString(text3, text4, command.Value)?.ToLower();
				base.Log.AddLog("fastboot command: " + text4 + ", response: " + text5, upload: true);
				if (text5.Contains("fail") || text5.Contains("error"))
				{
					failedResponse = "exec command failed: " + text4;
					flag = false;
					if (text5.Contains("too many links"))
					{
						base.FailedByDeviceRemoved = true;
					}
					break;
				}
			}
			dynamic val = base.Info.Args.IgnoreCurrStepResult ?? ((object)false);
			if (flag)
			{
				base.Log.AddResult(this, Result.PASSED);
				return;
			}
			bool pnputilIsConnected = GetPnputilIsConnected();
			if (base.FailedByDeviceRemoved || !pnputilIsConnected)
			{
				base.IgnoreErrorPromptText = true;
				base.Log.AddLog($"fastboot device connect error, too many links: {base.FailedByDeviceRemoved} ,device disConnected :{!pnputilIsConnected}", upload: true);
				base.Recipe.UcDevice.MessageBox.Show(base.Name, "K1452", "K0327", null, showClose: false, (MessageBoxImage)48).Wait();
			}
			if ((!val))
			{
				string text6 = string.Empty;
				List<string> list = ProcessRunner.ProcessList(text3, EncapsulationFastbootCommand("getvar all"), 12000);
				if (list != null)
				{
					foreach (string item in list)
					{
						Match match = REG_EX.Match(item);
						string value = match.Groups["key"].Value;
						string value2 = match.Groups["value"].Value;
						if (!string.IsNullOrEmpty(value) && value.Equals("channelid"))
						{
							base.Log.AddInfo("channelid", value2);
							break;
						}
					}
					text6 = string.Join("\r\n", list);
				}
				base.Log.AddLog("fastboot command : getvar all, response: " + text6, upload: true);
				text6 = ProcessRunner.ProcessString(text3, EncapsulationFastbootCommand("oem read_sv"), 12000)?.ToLower();
				base.Log.AddLog("fastboot command : oem read_sv, response: " + text6, upload: true);
				text6 = ProcessRunner.ProcessString(text3, EncapsulationFastbootCommand("oem partition"), 12000)?.ToLower();
				base.Log.AddLog("fastboot command : oem partition, response: " + text6, upload: true);
			}
			base.Log.AddResult(this, Result.FASTBOOT_FLASH_SINGLEPARTITION_FAILED, failedResponse);
		}

		private bool ExtractBootloaderCommand(string xml, string name)
		{
			//IL_01b7: Expected O, but got Unknown
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Unknown result type (might be due to invalid IL or missing references)
			//IL_0097: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
			string text = string.Empty;
			try
			{
				text = File.ReadAllText(xml);
				XmlDocument val = new XmlDocument();
				val.LoadXml(text);
				XmlNodeList val2 = ((XmlNode)val).SelectNodes($"//step[@partition='{name}']");
				if (val2 != null && val2.Count == 0)
				{
					failedResponse = "partition=" + name + " not exists in file: " + xml;
					base.Log.AddLog(failedResponse, upload: true);
					return false;
				}
				string directoryName = Path.GetDirectoryName(xml);
				commands = new List<KeyValuePair<string, int>>();
				foreach (XmlNode item in val2)
				{
					XmlNode namedItem;
					string text2 = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("operation")) != null) ? namedItem.Value : string.Empty).Trim();
					string text3 = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("partition")) != null) ? namedItem.Value : string.Empty).Trim();
					string path = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("filename")) != null) ? namedItem.Value : string.Empty).Trim();
					(((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("MD5")) != null) ? namedItem.Value : string.Empty).Trim();
					string text4 = Path.Combine(directoryName, path);
					string key = text2 + " " + text3 + " \"" + text4 + "\"";
					commands.Add(new KeyValuePair<string, int>(key, 300000));
				}
				return true;
			}
			catch (XmlException ex)
			{
				XmlException ex2 = ex;
				base.Log.AddLog("Error xml content: " + text, upload: false, (Exception)(object)ex2);
				return false;
			}
			catch (Exception ex3)
			{
				base.Log.AddLog("Read xml for exucte bootloader command failed!", upload: false, ex3);
				return false;
			}
		}
	}
	public class FastbootMatchFlashFile : BaseStep
	{
		public override void Run()
		{
			Result result = Result.FASTBOOT_FLASH_FILE_MATCH_FAILED;
			string text = EncapsulationFastbootCommand(base.Info.Args.Command?.ToString());
			string text2 = ProcessRunner.ProcessString(Configurations.FastbootPath, text, 6000)?.ToLower();
			base.Log.AddLog("fastboot command : " + text + ", response: " + text2, upload: true);
			string cond = null;
			if (!string.IsNullOrEmpty(text2))
			{
				string[] array = text2.Split(new string[1] { "\r\n" }, StringSplitOptions.None);
				string value = text.Substring(text.IndexOf(' '))?.Trim();
				if (array != null && array.Length != 0)
				{
					for (int i = 0; i < array.Length; i++)
					{
						if (array[i].Contains(value))
						{
							array = array[i].Split(new char[1] { ':' });
							if (array != null && array.Length > 1)
							{
								cond = array[1]?.Trim();
							}
							break;
						}
					}
				}
			}
			if (!string.IsNullOrEmpty(cond))
			{
				string text3 = ((JArray)JArray.Parse(base.Info.Args.CondMap.ToString())).FirstOrDefault((JToken n) => n.Value<string>("cond") == cond).Value<string>("value");
				base.Cache.Add("FastbootMatchFlashFile", text3);
				base.Log.AddLog("match filename: " + text3, upload: true);
				result = Result.PASSED;
			}
			base.Log.AddResult(this, result, (result == Result.PASSED) ? null : "fastboot match flash file failed");
		}
	}
	public class FastbootShell : BaseStep
	{
		public override void Run()
		{
			string text = string.Empty;
			Result result = Result.PASSED;
			if (base.Info.Args.Data != null)
			{
				text = base.Info.Args.Data;
				if (text.StartsWith("$"))
				{
					string key = text.Substring(1);
					text = base.Cache[key];
				}
			}
			string text2 = (string.IsNullOrEmpty(text) ? base.Info.Args.Command : $"{(object?)base.Info.Args.Command} {text}");
			if (string.IsNullOrEmpty(text2))
			{
				base.Log.AddResult(this, Result.FAILED, "Command is not set!");
				return;
			}
			text2 = EncapsulationFastbootCommand(text2);
			bool flag = false;
			string exe = LoadToolPath();
			string empty = string.Empty;
			_ = base.Recipe.Device?.Identifer;
			int timeout = base.Info.Args.Timeout ?? ((object)60000);
			do
			{
				empty = ProcessRunner.ProcessString(exe, text2, timeout)?.ToLower();
				base.Log.AddLog("fastboot command: " + text2 + ", response: " + empty, upload: true);
				flag = IsStrHasErrorMark(empty);
				if (flag && base.Info.Args.Print == true)
				{
					PrintDevStatus();
				}
			}
			while (flag && Retry-- > 0);
			string response = null;
			if (!string.IsNullOrEmpty(empty) && empty.Contains("STATUS_SEC_VIOLATE_ANTI_ROLLBACK"))
			{
				result = Result.FASTBOOT_DEGRADE_QUIT;
				response = "STATUS_SEC_VIOLATE_ANTI_ROLLBACK";
			}
			else if (flag)
			{
				result = Result.FASTBOOT_SHELL_FAILED;
				response = AnalysisFailedResponse(empty);
			}
			string[] array = empty?.Split(new string[1] { "\r\n" }, StringSplitOptions.None);
			base.ShellResult = empty;
			if (array != null && array.Length != 0)
			{
				base.RunResult = array[0];
			}
			base.Log.AddResult(this, result, response);
		}

		private void PrintDevStatus()
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			ManagementObjectCollection obj = new ManagementObjectSearcher("Select * From Win32_PnPEntity where service='WinUSB' or Status='ERROR'").Get();
			string text = string.Empty;
			ManagementObjectEnumerator enumerator = obj.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					ManagementBaseObject current = enumerator.Current;
					string text2 = current.GetPropertyValue("Status") as string;
					string text3 = current.GetPropertyValue("Service") as string;
					if (!text2.Equals("ERROR", StringComparison.CurrentCultureIgnoreCase) || string.IsNullOrEmpty(text3))
					{
						text += string.Format("Name: {0}\tService: {1}\tStatus: {2}\r\n", current.GetPropertyValue("Name"), text3, text2);
					}
				}
			}
			finally
			{
				((IDisposable)enumerator)?.Dispose();
			}
			base.Log.AddLog("::::::::::::::::::::::::::Detect device status:::::::::::::::::::::::::::::::::", upload: true);
			if (!string.IsNullOrEmpty(text))
			{
				base.Log.AddLog(text, upload: true);
			}
			base.Log.AddLog("Fastboot device isn't find!", upload: true);
			base.Log.AddLog(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::", upload: true);
		}

		private bool IsStrHasErrorMark(string str)
		{
			if (string.IsNullOrEmpty(str))
			{
				return false;
			}
			if (!str.Contains("error"))
			{
				return str.Contains("fail");
			}
			return true;
		}
	}
	public class FindComPorts : BaseStep
	{
		protected int timeout = 180000;

		protected bool quit;

		protected static bool running = false;

		protected static bool comporttask = false;

		protected static List<string> comports;

		protected static List<string> usedcomports = new List<string>();

		public override void Run()
		{
			running = true;
			ComPortResidentTask();
			ShowConnectMessagebox();
			Result result = Result.FIND_COMPORT_FAILED;
			if (Search())
			{
				result = Result.PASSED;
			}
			else if (!quit && ShowMessageWhenReConnect())
			{
				result = (Search() ? Result.PASSED : Result.FIND_COMPORT_FAILED);
			}
			if (result == Result.PASSED)
			{
				ShowMessageWhenConnectedSuccess();
			}
			if (quit)
			{
				result = Result.MANUAL_QUIT;
			}
			running = false;
			base.Log.AddResult(this, result, (result == Result.PASSED) ? null : "find comport failed");
		}

		protected static void ComPortResidentTask()
		{
			Thread.Sleep(new Random().Next(100));
			if (comporttask)
			{
				return;
			}
			comporttask = true;
			Task.Run(delegate
			{
				do
				{
					comports = GlobalFun.GetComInfo();
					usedcomports = usedcomports.Intersect(comports).ToList();
					if (usedcomports.Count == 0 && !running)
					{
						comports = null;
						LogHelper.LogInstance.Debug("device removed, comport resident task stop");
						comporttask = false;
					}
					Thread.Sleep(1000);
				}
				while (comporttask);
			});
		}

		protected void ShowConnectMessagebox()
		{
			object obj = base.Info.Args.ConnectTutorials;
			JObject jobj = obj as JObject;
			if (jobj != null && jobj.Value<JArray>("Steps") != null)
			{
				Task.Run(delegate
				{
					Show(jobj, "Steps");
				});
			}
			else if (base.Info.Args.ConnectSteps != null)
			{
				ConnectStepInfo _connectStep = new ConnectStepInfo
				{
					NoteText = base.Info.Args.ConnectSteps.NoteText?.ToString(),
					RetryText = base.Info.Args.ConnectSteps.RetryText?.ToString(),
					WidthRatio = (base.Info.Args.ConnectSteps.WidthRatio?.ToString() ?? "1:2:2")
				};
				Task.Run(delegate
				{
					List<ConnectSteps> list = new List<ConnectSteps>();
					foreach (dynamic item in base.Info.Args.ConnectSteps.Steps)
					{
						list.Add(new ConnectSteps
						{
							StepImage = item.Image.ToString(),
							StepContent = item.Content.ToString()
						});
					}
					_connectStep.Steps = list;
					if (!base.Recipe.UcDevice.MessageBox.AutoCloseMoreStep(base.Name, _connectStep, -1, popupWhenClose: true).HasValue)
					{
						quit = true;
					}
				});
			}
			else
			{
				if (!((base.Info.Args.PromptText != null) ? true : false))
				{
					return;
				}
				Task.Run(delegate
				{
					dynamic val = base.Info.Args.Image?.ToString();
					dynamic val2 = base.Info.Args.PromptText.ToString();
					if (base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, val2, val, showClose: true, popupWhenClose: true) == null)
					{
						quit = true;
					}
				});
			}
		}

		protected bool ShowMessageWhenReConnect()
		{
			bool result = true;
			object obj = base.Info.Args.ConnectTutorials;
			JObject jobj = obj as JObject;
			if (jobj != null && jobj.Value<JArray>("ReSteps") != null)
			{
				Task.Run(delegate
				{
					Show(jobj, "ReSteps");
				});
			}
			else if (base.Info.Args.ReconnectPromptText != null)
			{
				Task.Run(delegate
				{
					string image = base.Info.Args.Image?.ToString();
					string message = base.Info.Args.ReconnectPromptText.ToString();
					if (!base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, message, image, null, -1, null, showClose: true, popupWhenClose: true, format: true, true).HasValue)
					{
						quit = true;
					}
				});
			}
			else
			{
				result = false;
			}
			return result;
		}

		protected void ShowMessageWhenConnectedSuccess()
		{
			if (base.Info.Args.ConnectTutorials is JObject jObject && jObject.Value<JArray>("ReleaseSteps") != null)
			{
				JArray steps = jObject.Value<JArray>("ReleaseSteps");
				LogHelper.LogInstance.Debug("Args.ConnectTutorials.ReleaseSteps will show");
				base.Recipe.UcDevice.MessageBox.AutoCloseConnectTutorials(null, steps, 5000, autoPlay: false, 5000.0, showPlayControl: false, showClose: false);
			}
			else if (base.Info.Args.ExPromptText != null)
			{
				string image = base.Info.Args.ExImage?.ToString();
				string message = base.Info.Args.ExPromptText.ToString();
				base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, message, image, null, 5000, null, showClose: false, popupWhenClose: false, format: true, true);
			}
		}

		private void Show(JObject jobj, string stepKey)
		{
			string title = jobj.Value<string>("Title");
			JArray steps = jobj.Value<JArray>(stepKey);
			bool autoPlay = jobj.Value<bool>("AutoPlay");
			double interval = jobj.Value<double>("Interval");
			LogHelper.LogInstance.Debug("Args.ConnectTutorials.Steps will show");
			if (!base.Recipe.UcDevice.MessageBox.AutoCloseConnectTutorials(title, steps, -1, autoPlay, interval).HasValue)
			{
				quit = true;
			}
		}

		protected bool Search()
		{
			DateTime now = DateTime.Now;
			int num = base.Info.Args.Timeout ?? ((object)180000);
			List<string> list = base.Info.Args.ComPorts.ToObject<List<string>>();
			bool flag = false;
			bool flag2 = false;
			Task<bool?> task = null;
			bool flag3 = false;
			Task<bool?> task2 = null;
			while (!quit && !flag && DateTime.Now.Subtract(now).TotalMilliseconds < (double)num && (task == null || !task.IsCompleted) && (task2 == null || !task2.IsCompleted))
			{
				if (!comporttask)
				{
					ComPortResidentTask();
				}
				if (comports == null || comports.Count <= 0)
				{
					continue;
				}
				foreach (string item in list)
				{
					string text = comports.FirstOrDefault((string n) => Regex.IsMatch(n, item, RegexOptions.IgnoreCase));
					if (text == null)
					{
						continue;
					}
					string value = Regex.Match(text, "(?<key>COM)(?<com>\\d+)").Groups["com"].Value;
					if (!string.IsNullOrEmpty(value))
					{
						int num2 = System.Convert.ToInt32(value);
						if (!usedcomports.Contains(text))
						{
							base.Log.AddLog($"device: {base.Recipe.UcDevice.Id}, comport: {num2}");
							usedcomports.Add(text);
							base.Cache[item] = num2;
							base.Cache["comport"] = num2;
							flag = true;
							break;
						}
					}
				}
				if (!flag && !flag2 && base.Info.Args.Error900ePromptText != null && comports.Exists((string n) => Regex.IsMatch(n, "Qualcomm.*900e", RegexOptions.IgnoreCase)))
				{
					flag2 = true;
					base.Recipe.UcDevice.MessageBox.Close(true);
					task = base.Recipe.UcDevice.MessageBox.Show(base.Name, base.Info.Args.Error900ePromptText.ToString());
				}
				if (!flag && !flag3 && base.Info.Args.ErrorAdbInterfacePromptText != null && comports.Exists((string n) => Regex.IsMatch(n, "ADB Interface", RegexOptions.IgnoreCase)))
				{
					flag3 = true;
					base.Recipe.UcDevice.MessageBox.Close(true);
					task2 = base.Recipe.UcDevice.MessageBox.Show(base.Name, base.Info.Args.ErrorAdbInterfacePromptText.ToString());
				}
			}
			string arg = ((comports == null) ? "" : string.Join("\r\n", comports));
			base.Log.AddLog($"comporttask running: {comporttask}, allcomports: {arg}");
			base.Log.AddLog("usedcomports: " + string.Join("\r\n", usedcomports));
			base.Recipe.UcDevice.MessageBox.Close(true);
			return flag;
		}
	}
	public class FindPnpDevice : BaseStep
	{
		public override void Run()
		{
			bool running = true;
			bool quit = false;
			Task.Run(delegate
			{
				dynamic val = base.Info.Args.Image?.ToString();
				dynamic val2 = base.Info.Args.PromptText.ToString();
				if (base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, val2, val, showClose: true, popupWhenClose: true) == null)
				{
					quit = true;
				}
			});
			Task<bool> task = Task.Run(delegate
			{
				do
				{
					string text = base.Info.Args.DeviceName;
					List<string> comInfo = GlobalFun.GetComInfo("SELECT * FROM Win32_PnPEntity where Name like '%" + text + "%'");
					if (comInfo != null && comInfo.Count > 0)
					{
						return true;
					}
				}
				while (running && !quit);
				return false;
			});
			if (base.TimeoutMilliseconds == 0)
			{
				base.TimeoutMilliseconds = 30000;
			}
			bool num = task.Wait(base.TimeoutMilliseconds);
			running = false;
			base.Recipe.UcDevice.MessageBox.Close(true);
			Result result = ((num && task.Result) ? Result.PASSED : Result.FIND_PNPDEVICE_FAILED);
			if (quit)
			{
				result = Result.MANUAL_QUIT;
			}
			if (result == Result.PASSED && base.Info.Args.ExPromptText != null)
			{
				Task.Run(delegate
				{
					dynamic val = base.Info.Args.ExImage?.ToString();
					dynamic val2 = base.Info.Args.ExPromptText.ToString();
					base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, val2, val, milliseconds: 5000);
				})?.Wait();
			}
			base.Log.AddResult(this, result, (result == Result.PASSED) ? null : "find pnp device failed");
		}
	}
	public class InfoPrompt : BaseStep
	{
		public override void Run()
		{
			if (base.Info.Args.PromptText != null)
			{
				string message = base.Info.Args.PromptText.ToString();
				string text = string.Empty;
				if (base.Info.Args.Image != null)
				{
					text = base.Info.Args.Image.ToString();
				}
				if (string.IsNullOrEmpty(text))
				{
					base.Recipe.UcDevice.MessageBox.Show(base.Info.Name, message, "K0327", null, showClose: false, (MessageBoxImage)64).Wait();
				}
				else
				{
					base.Recipe.UcDevice.MessageBox.RightPic(base.Info.Name, message, text).Wait();
				}
			}
			if (base.Info.Args.DiscntTitle != null && base.Info.Args.DiscntContent != null)
			{
				string title = base.Info.Args.DiscntTitle.ToString();
				string message2 = base.Info.Args.DiscntContent.ToString();
				string note = base.Info.Args.DiscntNote.ToString();
				string image = base.Info.Args.DiscntImage?.ToString();
				base.Recipe.UcDevice.MessageBox.TabletTurnoff(title, message2, image, note).Wait();
			}
			base.Log.AddResult(this, Result.PASSED);
		}
	}
	public class InteractPrompt : BaseStep
	{
		public override void Run()
		{
			Result result = Result.PASSED;
			string response = null;
			string title = base.Info.Args.title.ToString();
			string message = base.Info.Args.content.ToString();
			JArray data = base.Info.Args.links;
			if (base.Recipe.UcDevice.MessageBox.Linker(title, message, data).Result != true)
			{
				result = Result.QUIT;
				response = "interact prompt quit";
			}
			base.Log.AddResult(this, result, response);
		}
	}
	public class LoadFiles : BaseStep
	{
		public override void Run()
		{
			if (!base.Resources.IsResourceDirExist())
			{
				base.Log.AddResult(this, Result.LOAD_RESOURCE_FAILED, "Resources directory does not exist!");
				return;
			}
			foreach (object item in base.Info.Args.Files)
			{
				string text = (string)(dynamic)item;
				string filename = null;
				if (base.Cache.ContainsKey("FastbootMatchFlashFile"))
				{
					filename = base.Cache["FastbootMatchFlashFile"];
				}
				string localFilePath = base.Resources.GetLocalFilePath(text, filename);
				if (!GlobalFun.Exists(localFilePath))
				{
					base.Log.AddResult(this, ("countryCodes" == text) ? Result.LOAD_RESOURCE_FAILED_COUNTRYCODE : Result.LOAD_RESOURCE_FAILED, "resource not found");
					return;
				}
				base.Log.AddLog(text + "=" + localFilePath, upload: true);
				if (!FlashFileCheck(localFilePath))
				{
					base.Log.AddResult(this, Result.LOAD_RESOURCE_FAILED, "resource not found");
					return;
				}
				if (!FlashFileMd5Check(localFilePath))
				{
					base.Log.AddLog("Flash file md5 check failed, path is " + localFilePath);
					base.Log.AddResult(this, Result.LOAD_RESOURCE_FAILED, "md5 check failed");
					return;
				}
				if (localFilePath.EndsWith("CmdDloader.exe", StringComparison.CurrentCultureIgnoreCase))
				{
					string path = "BMAFrame9.dll";
					string text2 = Path.Combine(new FileInfo(localFilePath).Directory.FullName, path);
					if (!File.Exists(text2))
					{
						File.Copy(Path.Combine(Environment.CurrentDirectory, path), text2, overwrite: true);
					}
				}
				base.Cache[text] = localFilePath;
			}
			if (base.Info.Args.Values != null)
			{
				foreach (object item2 in base.Info.Args.Values)
				{
					string text3 = (string)(dynamic)item2;
					string text4 = null;
					if (base.Recipe.Device != null)
					{
						text4 = base.Recipe.Device.Property.GetPropertyValue(text3);
					}
					if (string.IsNullOrEmpty(text4))
					{
						string text5 = EncapsulationFastbootCommand("getvar " + text3);
						string exe = LoadToolPath("fastboot.exe");
						string text6 = null;
						for (int i = 0; i < 3; i++)
						{
							text6 = ProcessRunner.ProcessString(exe, text5, 5000);
							base.Log.AddLog("cmd: " + text5 + ", response: " + text6, upload: true);
							if (!string.IsNullOrEmpty(text6))
							{
								break;
							}
							Thread.Sleep(1000);
						}
						if (!string.IsNullOrEmpty(text6))
						{
							text4 = new Regex("(?<key>" + text3 + "):\\s+(?<value>[^\\r]*)", RegexOptions.Multiline).Match(text6).Groups["value"].Value;
						}
					}
					if (string.IsNullOrEmpty(text4))
					{
						base.Log.AddLog("cannot found device, " + text3 + " value is null");
					}
					base.Log.AddLog(text3 + "=" + text4, upload: true);
					base.Cache[text3] = text4;
				}
			}
			base.Log.AddResult(this, Result.PASSED);
		}

		protected bool FlashFileCheck(string filepath)
		{
			if (Regex.IsMatch(filepath, ".*scatter\\.txt$"))
			{
				MatchCollection matchCollection = Regex.Matches(File.ReadAllText(filepath), "(?<key>file_name):\\s+(?<value>.*)", RegexOptions.IgnoreCase | RegexOptions.Multiline);
				string path = base.Resources.Get(RecipeResources.Rom);
				foreach (Match item in matchCollection)
				{
					string value = item.Groups["value"].Value;
					if (!string.IsNullOrEmpty(value) && !"NONE".Equals(value, StringComparison.CurrentCultureIgnoreCase))
					{
						string text = Path.Combine(path, value);
						if (!File.Exists(text))
						{
							base.Log.AddLog(text + " not exists", upload: true);
							return false;
						}
					}
				}
			}
			return true;
		}

		protected bool FlashFileMd5Check(string xml)
		{
			//IL_015c: Expected O, but got Unknown
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_0066: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			if (!xml.EndsWith("xml"))
			{
				return true;
			}
			string text = string.Empty;
			try
			{
				text = File.ReadAllText(xml);
				XmlDocument val = new XmlDocument();
				val.LoadXml(text);
				XmlNode val2 = ((XmlNode)val).SelectSingleNode("/flashing/steps");
				string directoryName = Path.GetDirectoryName(xml);
				if (val2 != null)
				{
					XmlNodeList val3 = val2.SelectNodes("step");
					if (val3 != null)
					{
						foreach (XmlNode item in val3)
						{
							XmlNode namedItem;
							string text2 = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("filename")) != null) ? namedItem.Value : string.Empty).Trim();
							string text3 = (((namedItem = ((XmlNamedNodeMap)item.Attributes).GetNamedItem("MD5")) != null) ? namedItem.Value : string.Empty).Trim();
							if (!string.IsNullOrEmpty(text2) && !string.IsNullOrEmpty(text3))
							{
								string text4 = Path.Combine(directoryName, text2);
								if (!File.Exists(text4))
								{
									string log = $"file: {text4} not exist!";
									base.Log.AddLog(log, upload: true);
									return false;
								}
								if (!GlobalFun.MD5Check(text4, text3))
								{
									string log2 = $"file: {text4} md5 check failed";
									base.Log.AddLog(log2, upload: true);
									return false;
								}
							}
						}
					}
				}
			}
			catch (XmlException ex)
			{
				XmlException ex2 = ex;
				base.Log.AddLog("Error xml content: " + text, upload: true, (Exception)(object)ex2);
				return false;
			}
			catch (Exception ex3)
			{
				base.Log.AddLog("Read xml file for md5 check failed!", upload: true, ex3);
				return false;
			}
			return true;
		}
	}
	public class Manual : BaseStep
	{
		public override void Run()
		{
			string text = base.Info.Args.PromptText.ToString();
			string text2 = string.Empty;
			if (base.Info.Args.Image != null)
			{
				text2 = base.Info.Args.Image.ToString();
			}
			List<string> list = new List<string>();
			if (base.Info.Args.ButtonContent != null)
			{
				foreach (object item2 in base.Info.Args.ButtonContent)
				{
					string item = (string)(dynamic)item2;
					list.Add(item);
				}
			}
			bool? flag = base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, text, text2, list, link: base.Info.Args.link?.ToString(), showClose: true, popupWhenClose: true);
			Result result = Result.PASSED;
			string response = null;
			if (!flag.HasValue)
			{
				result = Result.MANUAL_QUIT;
				response = "manual quit";
			}
			base.Log.AddResult(this, result, response);
		}
	}
	public class PushDirectory : BaseStep
	{
		private string TAG => GetType().FullName;

		public override void Run()
		{
			DeviceEx device = base.Recipe.Device;
			string deviceID = string.Empty;
			if (device != null)
			{
				deviceID = device.Identifer;
			}
			string text = base.Info.Args.LocalPath;
			if (text.StartsWith("$"))
			{
				string key = text.Substring(1);
				text = base.Cache[key];
			}
			string path = base.Info.Args.DevicePath;
			string[] files = Directory.GetFiles(text, "*.zip", SearchOption.AllDirectories);
			foreach (string text2 in files)
			{
				string fileName = Path.GetFileName(text2);
				try
				{
					global::Smart.DeviceOperator.PushFile(deviceID, text2, Path.Combine(path, fileName));
				}
				catch (Exception)
				{
				}
			}
			base.Log.AddResult(this, Result.PASSED);
		}
	}
	public class ReadDeviceMode : BaseStep
	{
		private string TAG => GetType().FullName;

		public override void Run()
		{
			DeviceEx device = base.Recipe.Device;
			string response = null;
			if (device != null)
			{
				response = (base.RunResult = device.ConnectType.ToString());
			}
			base.Log.AddResult(this, Result.PASSED, response);
		}
	}
	public class ReadPropertiesInFastboot : BaseStep
	{
		private readonly List<string> elements = new List<string>
		{
			"sku", "ro.boot.hardware.sku", "serialno", "imei", "ro.carrier", "version-baseband", "ro.build.fingerprint", "ro.build.version.full", "ro.build.version.qcom", "oem hw dualsim",
			"softwareVersion", "ram", "emmc", "androidVer", "fdr-allowed", "securestate", "iswarrantyvoid", "channelid", "cid"
		};

		public override void Run()
		{
			DeviceEx device = GetDevice(ConnectType.Fastboot, (object s) => (s as DeviceEx).SoftStatus == DeviceSoftStateEx.Online);
			if (device == null)
			{
				SpinWait.SpinUntil(delegate
				{
					device = GetDevice(ConnectType.Fastboot, (object s) => (s as DeviceEx).SoftStatus == DeviceSoftStateEx.Online);
					return device != null;
				}, 30000);
			}
			IAndroidDevice androidDevice = device?.Property;
			if (androidDevice != null)
			{
				foreach (string element in elements)
				{
					string propertyValue = androidDevice.GetPropertyValue(element);
					base.Log.AddInfo(element, propertyValue);
				}
			}
			RecipeMessage recipeMessage = new RecipeMessage
			{
				Message = base.Log.Info,
				RecipeName = base.Recipe.Info.Name,
				UseCase = base.Log.UseCase,
				Device = base.Recipe.Device
			};
			base.Log.NotifyAsync(RecipeMessageType.DATA, recipeMessage);
			base.Log.AddResult(this, Result.PASSED, JsonHelper.SerializeObject2Json(base.Log.Info));
		}
	}
	public class RomFileCheck : BaseStep
	{
		public override void Run()
		{
			if (base.Info.Args == null || base.Info.Args.Files == null)
			{
				base.Log.AddResult(this, Result.PASSED);
				return;
			}
			string text = base.Resources.Get(RecipeResources.Rom);
			if (string.IsNullOrEmpty(text) || !Directory.Exists(text))
			{
				base.Log.AddResult(this, Result.LOAD_RESOURCE_FAILED, "Resources directory does not exist!");
				return;
			}
			foreach (dynamic item in base.Info.Args.Files)
			{
				if (!(string.IsNullOrEmpty(item?.Value) ? true : false))
				{
					dynamic files = Directory.GetFiles(text, item.Value, SearchOption.AllDirectories);
					if (files.Length < 1)
					{
						string response = $"Rom:[{text}] search file:[{(object?)item.Value}] not exist!";
						base.Log.AddResult(this, Result.CHECK_ROM_FILE_FAILED, response);
						return;
					}
				}
			}
			base.Log.AddResult(this, Result.PASSED);
		}
	}
	public class RunODMSocketServer : BaseStep
	{
		public override void Run()
		{
			DeviceEx device = base.Recipe.Device;
			string username = null;
			string password = null;
			string imei = null;
			if (device != null)
			{
				imei = device.Property.IMEI1;
			}
			if (base.Info.Args.PARAMS != null)
			{
				dynamic val = base.Info.Args.PARAMS;
				username = val.username;
				password = val.password;
			}
			ODMServerMain.InitParams(username, password, imei);
			ODMServerMain.StartServer();
			base.Log.AddResult(this, Result.PASSED);
		}
	}
	public class RunningTimeCheck : BaseStep
	{
		private enum INSTALLSTATE
		{
			INSTALLSTATE_ABSENT = 2,
			INSTALLSTATE_ADVERTISED = 1,
			INSTALLSTATE_DEFAULT = 5,
			INSTALLSTATE_INVALIDARG = -2,
			INSTALLSTATE_UNKNOWN = -1
		}

		public static List<string> VcGuidList = new List<string> { "{F0C3E5D1-1ADE-321E-8167-68EF0DE699A5}" };

		public override void Run()
		{
			Result result = Result.PASSED;
			if (base.Cache.ContainsKey("recoveryExe"))
			{
				string fileName = base.Cache["recoveryExe"];
				string path = "BMAFrame9.dll";
				string text = Path.Combine(new FileInfo(fileName).Directory.FullName, path);
				if (!File.Exists(text))
				{
					File.Copy(Path.Combine(Environment.CurrentDirectory, path), text, overwrite: true);
				}
			}
			if (!CheckVcRunnigEnv())
			{
				string message = base.Info.Args.PromptText.ToString();
				string image = base.Info.Args.Image?.ToString();
				List<string> list = new List<string>();
				string ok = null;
				string cancel = null;
				if (base.Info.Args.ButtonContent != null)
				{
					foreach (object item2 in base.Info.Args.ButtonContent)
					{
						string item = (string)(dynamic)item2;
						list.Add(item);
					}
					if (list.Count == 1)
					{
						ok = list[0];
					}
					else if (list.Count == 2)
					{
						ok = list[0];
						cancel = list[1];
					}
				}
				if (base.Recipe.UcDevice.MessageBox.RightPic(base.Info.Name, message, image, ok, cancel).Result == true)
				{
					ProcessRunner.ProcessString(Path.Combine(Environment.CurrentDirectory, "vcredist_x86_2010.exe"), null, -1);
					if (!CheckVcRunnigEnv())
					{
						result = Result.INSTALL_VC_RUNNINGTIME_FAILED;
					}
				}
				else
				{
					result = Result.QUIT;
				}
			}
			base.Log.AddResult(this, result, (result == Result.PASSED) ? null : "manual quit");
		}

		private bool CheckVcRunnigEnv()
		{
			foreach (string vcGuid in VcGuidList)
			{
				if (MsiQueryProductState(vcGuid).Equals(INSTALLSTATE.INSTALLSTATE_DEFAULT))
				{
					return true;
				}
			}
			base.Log.AddLog("VC++ running time not exists");
			return false;
		}

		[DllImport("msi.dll")]
		[DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
		private static extern INSTALLSTATE MsiQueryProductState(string product);
	}
	public class RuntimeCheck : BaseStep
	{
		protected static readonly string OPENSSL_REGISTRY_KEY = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{28A58920-7B93-44D8-A863-C28292CE8CAC}";

		protected static readonly string OPENSSL_SMARTERSILICON_KEY = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Smarter Silicon Universal Serial Bus Windows Driver";

		protected ApiService service;

		public override void Run()
		{
			service = new ApiService();
			if (base.Recipe.Info.CheckClientVersion)
			{
				Dictionary<string, string> dictionary = new Dictionary<string, string>();
				dictionary.Add("country", GlobalFun.GetRegionInfo().TwoLetterISORegionName);
				ToolVersionModel toolVersionModel = service.RequestContent<ToolVersionModel>(WebApiUrl.CLIENT_VERSION, dictionary);
				if (toolVersionModel != null)
				{
					base.Log.AddResult(this, Result.CLIENT_VERSION_LOWER_QUIT, "A newer client version " + toolVersionModel.VersionNumber + " exists.");
					return;
				}
			}
			if (base.Recipe.Info.DriverList.Count > 0 && !CheckDrivers(base.Recipe.Info.DriverList))
			{
				base.Log.AddResult(this, Result.DRIVER_INSTALL_FAILED, "driver installed failed");
				return;
			}
			string text = base.Resources.Get(RecipeResources.Rom);
			if (!Directory.Exists(text))
			{
				base.Log.AddResult(this, Result.ROM_DIRECTORY_NOT_EXISTS, "The ROM package does not exist.");
			}
			else if (!CheckRomFileIsReplace(text))
			{
				base.Log.AddResult(this, Result.LOAD_RESOURCE_FAILED_REPLACE, "Resources in the ROM package are replaced");
			}
			else
			{
				base.Log.AddResult(this, Result.PASSED);
			}
		}

		protected bool CheckRomFileIsReplace(string directory)
		{
			string text = Path.Combine(Configurations.DownloadInfoSavePath, Path.GetFileName(directory) + ".check.json.dpapi");
			if (!File.Exists(text))
			{
				base.Log.AddLog("Verification ROM encrypt files does not exist.", upload: true);
				return true;
			}
			string text2 = FileHelper.ReadWithAesDecrypt(text);
			if (string.IsNullOrEmpty(text2))
			{
				base.Log.AddLog("Verify that the encrypted file content of the ROM is empty.", upload: true);
				return true;
			}
			string text3 = base.Resources.Get(RecipeResources.RealModelName);
			object obj = service.RequestContent(WebApiUrl.ROMFILE_CHECK_RULES, new Dictionary<string, string> { { "modelName", text3 } });
			List<string> list = new List<string>();
			if (obj != null && obj is JArray { HasValues: not false } jArray)
			{
				list = jArray.Select((JToken n) => n.Value<string>()).ToList();
			}
			JArray jArray2 = JsonHelper.DeserializeJson2JArray(text2);
			bool flag;
			if (list != null && list.Count > 0)
			{
				if (jArray2 != null && jArray2.HasValues)
				{
					StepInfo stepInfo = base.Recipe.Info.Steps.FirstOrDefault((StepInfo n) => n.Step == "CopyFiles");
					List<string> source = new List<string>();
					flag = stepInfo != null;
					if (flag && stepInfo.Args != null && stepInfo.Args.Files != null && stepInfo.Args.Files is JArray)
					{
						source = (from n in ((JArray)stepInfo.Args.Files).SelectMany((JToken n) => n.Value<JArray>("SourceFiles"))
							select n.Value<string>()).Distinct().ToList();
					}
					foreach (string pattern in list)
					{
						List<JToken> list2 = jArray2.Where((JToken n) => Regex.IsMatch(n.Value<string>("Name"), pattern, RegexOptions.IgnoreCase)).ToList();
						if (list2 != null && list2.Count > 0)
						{
							foreach (JToken item in list2)
							{
								string text4 = item.Value<string>("Name");
								if (!source.Contains<string>(text4, StringComparer.InvariantCultureIgnoreCase))
								{
									string text5 = item.Value<string>("Path");
									if (File.Exists(text5))
									{
										FileInfo fileInfo = new FileInfo(text5);
										long num = item.Value<long>("Size");
										long length = fileInfo.Length;
										long num2 = item.Value<long>("LastModifiedTime");
										long num3 = GlobalFun.ToUtcTimeStamp(fileInfo.LastWriteTime);
										if (num == length && num2 == num3)
										{
											continue;
										}
										base.Log.AddLog(string.Format("Check update time and size in the ROM package failed, File: {0}{1}Source File Size: {2}, Modified Date: {3}{4}Current File Size: {5}, Modified Date: {6}", new object[7]
										{
											text5,
											Environment.NewLine,
											num,
											num2,
											Environment.NewLine,
											length,
											num3
										}), upload: true);
										flag = false;
									}
									else
									{
										base.Log.AddLog("The " + text5 + " file has been deleted", upload: true);
										flag = false;
									}
									goto IL_07a2;
								}
								base.Log.AddLog(text4 + " will be copied in the Copy step and does not need to be verified", upload: true);
							}
						}
						else
						{
							base.Log.AddLog("No need to verify the '" + pattern + "' type, because there is no such file in the ROM package", upload: true);
						}
					}
				}
				else
				{
					base.Log.AddLog("Verify that the encrypted file content of the ROM is empty.", upload: true);
				}
			}
			else
			{
				base.Log.AddLog("The server does not configure the " + text3 + " ROM file verification type", upload: true);
			}
			return true;
			IL_07a2:
			return flag;
		}

		protected bool CheckOpenSSL()
		{
			if (!DriversHelper.CheckDriverInstall("OpenSSL Light"))
			{
				DriversHelper.InstallDriver(new List<string> { Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Win32OpenSSL_Light-3_2_3.msi") });
				return DriversHelper.CheckDriverInstall("OpenSSL Light");
			}
			return true;
		}

		protected bool CheckSmarterSiliconDriver()
		{
			string output;
			return DriversHelper.CheckAndInstallInfDriver(DriverType.SmarterSilicon, null, out output);
		}

		protected bool CheckDrivers(List<Tuple<bool, string, string>> list)
		{
			foreach (Tuple<bool, string, string> item in list)
			{
				if (item.Item1)
				{
					if (!Enum.TryParse<DriverType>(item.Item2, out var result))
					{
						base.Log.AddLog("driver name:  " + item.Item2 + " is not available in the selection range", upload: true);
						return false;
					}
					Dictionary<string, string> infDriver = DriversHelper.GetInfDriver(result);
					bool flag = true;
					string oupput = null;
					foreach (KeyValuePair<string, string> item2 in infDriver)
					{
						flag = DriversHelper.InstallInfDriver(item2.Value, out oupput);
						if (!flag)
						{
							break;
						}
					}
					if (!flag)
					{
						base.Log.AddLog("driver name: " + item.Item2 + " install failed: " + oupput, upload: true);
						return false;
					}
					base.Log.AddLog("driver name: " + item.Item2 + " install success: " + oupput, upload: true);
				}
				else if (!DriversHelper.CheckDriverInstall(item.Item2))
				{
					DriversHelper.InstallDriver(new List<string> { Path.Combine(AppDomain.CurrentDomain.BaseDirectory, item.Item3) });
					if (!DriversHelper.CheckDriverInstall(item.Item2))
					{
						base.Log.AddLog("driver name: " + item.Item2 + " install failed", upload: true);
						return false;
					}
				}
			}
			return true;
		}
	}
	public class Shell : BaseStep
	{
		private delegate bool WNDENUMPROC(IntPtr hWnd, int lParam);

		private delegate bool CHILDWINDOWPROC(IntPtr hwnd, int lParam);

		protected int timeout = 1200000;

		protected bool IsConnected;

		private bool mError;

		private bool mCompleted;

		protected bool quit;

		protected bool hasPort;

		private string failedResponse;

		private int terminatedRetry = 2;

		private ShellCmdStatus ToolErrorStatus;

		private AutoResetEvent autoLockHandler;

		private DateTime startTime;

		private List<string> decryptFiles;

		private int responseCount;

		private int responseTriggerCount;

		private int logMonitorType;

		private bool autoCloseWhenGoOnResponse;

		private string QuitConditionMessage;

		private string FailConditionMessage;

		private bool IsRetry;

		private Task ConnectTutorialsTask;

		private const string FileLostString = "No such file or directory";

		private readonly List<JObject> QuitConditionList = new List<JObject>
		{
			new JObject
			{
				{
					"Condition",
					new JArray("No such file or directory")
				},
				{ "Message", null }
			}
		};

		private readonly List<JObject> FailConditionList = new List<JObject>();

		private bool isFailCondition;

		private string platform = string.Empty;

		private int _officialDriverFlag = 1;

		private List<string> monitorResult;

		public bool isMonitoring;

		private System.Timers.Timer monitorTimer;

		[DllImport("user32.dll")]
		private static extern bool EnumWindows(WNDENUMPROC lpEnumFunc, int lParam);

		[DllImport("user32.dll")]
		private static extern int GetWindowTextW(IntPtr hWnd, [MarshalAs(UnmanagedType.LPWStr)] StringBuilder lpString, int nMaxCount);

		[DllImport("user32.dll")]
		private static extern int GetClassNameW(IntPtr hWnd, [MarshalAs(UnmanagedType.LPWStr)] StringBuilder lpString, int nMaxCount);

		[DllImport("user32.dll")]
		private static extern int EnumChildWindows(IntPtr hWndParent, CHILDWINDOWPROC lpfn, int lParam);

		public override void Run()
		{
			if (base.TimeoutMilliseconds <= 0)
			{
				base.TimeoutMilliseconds = timeout;
			}
			if (Retry > 0)
			{
				terminatedRetry = Retry;
			}
			if (base.Info.Args.QuitConditions is JArray { HasValues: not false } jArray)
			{
				foreach (JObject item3 in jArray)
				{
					QuitConditionList.Add(item3);
				}
			}
			if (base.Info.Args.FailConditions is JArray { HasValues: not false } jArray2)
			{
				foreach (JObject item4 in jArray2)
				{
					FailConditionList.Add(item4);
				}
			}
			List<Tuple<string, string, ShellResponse>> list = Init();
			if (ToolErrorStatus == ShellCmdStatus.FileLostError)
			{
				base.Log.AddResult(this, Result.LOAD_RESOURCE_FAILED, failedResponse);
				return;
			}
			Result result = Result.PASSED;
			int num = base.Info.Args.FlashRetry ?? ((object)0);
			if (base.Info.Args.TempVP != null)
			{
				platform = base.Resources.Get("Platform").ToUpperInvariant();
				VidPidMonitorHandler.Instance.DeviceInfoUpdated += OnDeviceInfoUpdated;
			}
			do
			{
				ClearDeviceMonitorConnectedList();
				if (base.Info.Args.MonitorPort != null)
				{
					string vidpid = base.Info.Args.MonitorPort;
					StartMonitoring(vidpid);
				}
				string text = null;
				startTime = DateTime.Now;
				foreach (Tuple<string, string, ShellResponse> item5 in list)
				{
					result = DoFlash(item5.Item1, item5.Item2, item5.Item3);
				}
				if (Volatile.Read(in _officialDriverFlag) == 0 && result != Result.PASSED)
				{
					DriverErrorPrompt();
				}
				IsRetry = false;
				switch (result)
				{
				case Result.FAILED:
					if (!string.IsNullOrEmpty(FailConditionMessage))
					{
						int num2 = (int)((double)base.TimeoutMilliseconds - DateTime.Now.Subtract(startTime).TotalMilliseconds);
						if (num2 < 10000)
						{
							num2 = 10000;
						}
						base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, FailConditionMessage, null, new List<string> { "K0327" }, num2, null, showClose: false, popupWhenClose: false, format: true, true);
					}
					if (isFailCondition)
					{
						base.IgnoreErrorPromptText = true;
					}
					else
					{
						if (ToolErrorStatus == ShellCmdStatus.FastbootError || ToolErrorStatus == ShellCmdStatus.FileLostError)
						{
							break;
						}
						if (!IsConnected && Retry > 0)
						{
							if (base.Info.Args.ConnectTutorials is JObject jObject && jObject.Value<JArray>("ReSteps") != null)
							{
								Retry--;
								IsRetry = true;
							}
							text = base.Info.Args.ConnectTutorials?.RetryText ?? base.Info.Args.ConnectSteps?.RetryText ?? base.Info.Args.ReconnectPromptText;
							if (!IsRetry && text != null)
							{
								Retry--;
								base.Log.AddLog("device not connected, will try again", upload: true);
								IsRetry = true;
							}
						}
						else if (IsConnected && num > 0)
						{
							text = base.Info.Args.ConnectTutorials?.FlashRetryText ?? base.Info.Args.ConnectSteps?.FlashRetryText;
							if (text != null)
							{
								num--;
								base.Log.AddLog("Unisoc device rescue failed, will try again", upload: true);
								IsRetry = true;
							}
						}
					}
					break;
				case Result.SHELL_EXE_TERMINATED_EXIT:
				case Result.SHELL_EXE_START_FAILED:
					if (terminatedRetry-- > 0)
					{
						IsRetry = true;
						Thread.Sleep(20000);
					}
					break;
				}
				if (!string.IsNullOrEmpty(text))
				{
					int num3 = (int)((double)base.TimeoutMilliseconds - DateTime.Now.Subtract(startTime).TotalMilliseconds);
					if (num3 < 10000)
					{
						num3 = 10000;
					}
					if (!base.Recipe.UcDevice.MessageBox.Show(base.Info.Name, text, "K0327", null, showClose: false, (MessageBoxImage)64).Wait(num3))
					{
						base.Recipe.UcDevice.MessageBox.Close(true);
					}
				}
				ErrorConnectProcess(!quit && !hasPort && !IsConnected && result == Result.FAILED);
				if (!IsRetry && !quit && !mCompleted && !IsConnected && Retry-- > 0)
				{
					IsRetry = true;
				}
			}
			while (IsRetry);
			switch (result)
			{
			case Result.FAILED:
				if (ToolErrorStatus == ShellCmdStatus.RomUnMatchError)
				{
					result = Result.ROM_UNMATCH_FAILED;
				}
				else if (ToolErrorStatus == ShellCmdStatus.AuthorizedError)
				{
					result = Result.AUTRORIZED_FAILED;
				}
				else if (ToolErrorStatus == ShellCmdStatus.FastbootError)
				{
					result = Result.SHELL_RESCUE_FAILED;
				}
				else if (IsConnected)
				{
					result = (CheckComport() ? Result.SHELL_RESCUE_FAILED : Result.PROCESS_FORCED_TEREMINATION);
				}
				else
				{
					result = Result.SHELL_CONNECTED_FAILED;
					if (monitorResult != null)
					{
						base.Log.AddLog(string.Join("\r\n", monitorResult), upload: true);
					}
				}
				if (string.IsNullOrEmpty(failedResponse))
				{
					failedResponse = "shell execute timeout";
				}
				if (list.Select((Tuple<string, string, ShellResponse> n) => n.Item3).Count((ShellResponse n) => n.ShellCmd == ShellCmdType.MTekCfcFlashTool) > 0)
				{
					string text3 = EncapsulationFastbootCommand("getvar all");
					List<string> values = ProcessRunner.ProcessList(LoadToolPath("fastboot.exe"), text3, 5000);
					base.Log.AddLog("command : " + text3 + ", response: " + string.Join("\r\n", values), upload: true);
				}
				break;
			case Result.SHELL_EXE_TERMINATED_EXIT:
			case Result.SHELL_EXE_START_FAILED:
			{
				failedResponse = ((result == Result.SHELL_EXE_START_FAILED) ? "The tool process has not started" : "The tool process terminated abnormally");
				base.Recipe.UcDevice.MessageBox.Show("K0071", "K1832", "K0327", null, showClose: false, (MessageBoxImage)48).Wait();
				string text2 = base.Resources.Get(RecipeResources.TooL);
				if (!Directory.Exists(text2))
				{
					base.Log.AddLog("tool path: " + text2 + " not exists", upload: true);
				}
				else
				{
					List<string> allFiles = GlobalFun.GetAllFiles(text2);
					if (allFiles != null && allFiles.Count > 0)
					{
						base.Log.AddLog($"tool path: {text2}, total files: {allFiles.Count}", upload: true);
						foreach (string item6 in allFiles)
						{
							FileInfo fileInfo = new FileInfo(item6);
							base.Log.AddLog($"{fileInfo.FullName}, {fileInfo.Length}, {fileInfo.LastWriteTime}", upload: true);
						}
					}
					else
					{
						base.Log.AddLog("tool path: " + text2 + ", total files: 0", upload: true);
					}
				}
				base.Log.AddInfo("rescuemark", "11");
				break;
			}
			}
			if (base.Info.Args.TempVP != null)
			{
				VidPidMonitorHandler.Instance.DeviceInfoUpdated -= OnDeviceInfoUpdated;
				SetOfficialDriverFlag(value: true);
			}
			StopMonitoring();
			FreeLock();
			base.Recipe.UcDevice.MessageBox.Close(true);
			ODMServerMain.CloseAllSockets();
			if (decryptFiles != null && decryptFiles.Count > 0)
			{
				Task.Run(delegate
				{
					decryptFiles.ForEach(delegate(string n)
					{
						GlobalFun.TryDeleteFile(n);
					});
				});
			}
			if (!string.IsNullOrEmpty(QuitConditionMessage))
			{
				base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, QuitConditionMessage, null, new List<string> { "K0327" }, 10000, null, showClose: false, popupWhenClose: false, format: true, true);
			}
			base.Log.AddResult(this, result, failedResponse);
		}

		private List<Tuple<string, string, ShellResponse>> Init()
		{
			string category = base.Resources.Get("category");
			string text = base.Info.Args.EXE;
			string text2 = base.Info.Args.Command;
			List<Tuple<string, string, ShellResponse>> list = new List<Tuple<string, string, ShellResponse>>();
			if (!string.IsNullOrEmpty(text) && !string.IsNullOrEmpty(text2))
			{
				if (text.StartsWith("$"))
				{
					string key = text.Substring(1);
					text = base.Cache[key];
				}
				List<object> list2 = new List<object>();
				if (base.Info.Args.Format != null)
				{
					foreach (object item3 in base.Info.Args.Format)
					{
						string text3 = (string)(dynamic)item3;
						object item = text3;
						if (text3.StartsWith("$"))
						{
							string key2 = text3.Substring(1);
							item = base.Cache[key2];
						}
						list2.Add(item);
					}
					text2 = string.Format(text2, list2.ToArray());
				}
				string value = Regex.Match(text2, "\"(?<key>.*scatter.*\\.txt)").Groups["key"].Value;
				if (File.Exists(value))
				{
					base.Log.AddLog("check sactter file: " + value, upload: true);
					MatchCollection matchCollection = Regex.Matches(File.ReadAllText(value), "(?<key>file_name):\\s+(?<value>.*)", RegexOptions.IgnoreCase | RegexOptions.Multiline);
					string path = base.Resources.Get(RecipeResources.Rom);
					foreach (Match item4 in matchCollection)
					{
						string value2 = item4.Groups["value"].Value;
						if (!string.IsNullOrEmpty(value2) && !"NONE".Equals(value2, StringComparison.CurrentCultureIgnoreCase))
						{
							string text4 = Path.Combine(path, value2);
							if (!File.Exists(text4))
							{
								failedResponse = text4 + " not exists";
								ToolErrorStatus = ShellCmdStatus.FileLostError;
								return list;
							}
						}
					}
				}
				ShellResponse shellResponse = ShellResponseFactory.CreateInstance(text);
				shellResponse.Init(category, list2);
				list.Add(new Tuple<string, string, ShellResponse>(text, text2, shellResponse));
			}
			else
			{
				string text5 = base.Info.Args.ComPort ?? string.Empty;
				string name = base.Info.Args.StartupFile ?? "Flash.cmd";
				string localFilePath = base.Resources.GetLocalFilePath("toolFolder");
				if (!string.IsNullOrEmpty(text5))
				{
					string key3 = (base.Cache.ContainsKey(text5) ? text5 : "comport");
					object arg = base.Cache[key3];
					text5 = $"COM{arg}";
				}
				string recoveryCmd = base.Resources.GetRecoveryCmd(name);
				if (string.IsNullOrWhiteSpace(recoveryCmd))
				{
					ToolErrorStatus = ShellCmdStatus.FileLostError;
					failedResponse = "Recipe Shell StartupFile doesn't exist!";
					return list;
				}
				string[] array = Regex.Replace(Regex.Replace(File.ReadAllText(recoveryCmd).Trim(), "%~dp0", Path.GetDirectoryName(recoveryCmd) + "\\", RegexOptions.IgnoreCase).Trim(), "pause", string.Empty, RegexOptions.IgnoreCase).Trim().Replace(".\\portname", ".\\" + text5)
					.Split(new string[1] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
				foreach (string text6 in array)
				{
					string text7 = text6.Substring(0, text6.IndexOf(' '));
					string item2 = text6.Substring(text6.IndexOf(' '));
					string[] files = Directory.GetFiles(localFilePath, text7, SearchOption.AllDirectories);
					if (files.Length == 0)
					{
						ToolErrorStatus = ShellCmdStatus.FileLostError;
						failedResponse = "Recipe Shell FlashToolExe:[" + text7 + "] doesn't exist!";
						return list;
					}
					ShellResponse shellResponse2 = ShellResponseFactory.CreateInstance(files[0]);
					shellResponse2.Init(category);
					list.Add(new Tuple<string, string, ShellResponse>(files[0], item2, shellResponse2));
				}
				try
				{
					string text8 = base.Info.Args.DecryptFileType;
					if (!string.IsNullOrEmpty(text8))
					{
						decryptFiles = GlobalFun.DecryptRomFile(base.Resources.Get("Rom"), text8);
					}
				}
				catch (Exception)
				{
				}
				if (list.Count == 0)
				{
					ToolErrorStatus = ShellCmdStatus.FileLostError;
					failedResponse = recoveryCmd + " content is incorrect";
				}
			}
			return list;
		}

		protected Result DoFlash(string exe, string command, ShellResponse shellResponse)
		{
			Result result = Result.PASSED;
			IsConnected = false;
			mCompleted = false;
			mError = false;
			quit = false;
			hasPort = false;
			ConnectTutorialsTask = null;
			responseCount = 0;
			failedResponse = null;
			bool flag = true;
			bool flag2 = false;
			ToolErrorStatus = ShellCmdStatus.None;
			Process process = new Process();
			process.StartInfo.FileName = "\"" + exe + "\"";
			process.StartInfo.WorkingDirectory = Path.GetDirectoryName(exe);
			process.StartInfo.Arguments = command;
			process.StartInfo.ErrorDialog = true;
			process.StartInfo.RedirectStandardInput = true;
			process.StartInfo.RedirectStandardOutput = true;
			process.StartInfo.RedirectStandardError = true;
			process.StartInfo.UseShellExecute = false;
			process.StartInfo.Verb = "runas";
			process.EnableRaisingEvents = true;
			process.StartInfo.CreateNoWindow = true;
			process.OutputDataReceived += delegate(object s, DataReceivedEventArgs e)
			{
				Redirected(e, shellResponse);
			};
			process.ErrorDataReceived += delegate(object s, DataReceivedEventArgs e)
			{
				Redirected(e, shellResponse);
			};
			try
			{
				process.Start();
			}
			catch (Exception arg)
			{
				base.Log.AddLog($"exe: {exe}, command {command}, exeption: {arg}", upload: true);
				return Result.SHELL_EXE_START_FAILED;
			}
			base.Log.AddLog($"exe: {exe}, pid: {process.Id}, command {command}", upload: true);
			process.BeginOutputReadLine();
			process.BeginErrorReadLine();
			if (base.Info.Args.Input != null)
			{
				string text = base.Info.Args.Input;
				if (text.StartsWith("$"))
				{
					string key = text.Substring(1);
					text = base.Cache[key];
				}
				if (text != string.Empty)
				{
					process.StandardInput.WriteLine(text);
				}
			}
			if (base.Info.Args.ShowRescuingMask == true)
			{
				base.Recipe.FreeEventHandler(realFlash: true);
			}
			if (shellResponse.ShellCmd != ShellCmdType.CmdDloader && shellResponse.ShellCmd != ShellCmdType.CmdDloaderTablet && shellResponse.ShellCmd != ShellCmdType.MTekFlashTool && shellResponse.ShellCmd != ShellCmdType.MTekSpFlashTool)
			{
				Task.Run(() => ShowMessageWhenStartToolAsync(shellResponse));
			}
			bool flag3 = false;
			int num = 3000;
			do
			{
				if (!quit)
				{
					flag3 = process.WaitForExit(num);
				}
				if (flag3)
				{
					flag = false;
					if (!quit)
					{
						Thread.Sleep(num);
					}
				}
				if (mCompleted || mError || quit)
				{
					flag = false;
					if (!flag3 && !quit)
					{
						flag3 = process.WaitForExit(num * 3);
					}
					break;
				}
			}
			while (!flag3 && DateTime.Now.Subtract(startTime).TotalMilliseconds < (double)base.TimeoutMilliseconds);
			if (!quit)
			{
				Thread.Sleep(num);
			}
			if (!flag3)
			{
				try
				{
					process.Kill();
					flag3 = true;
				}
				catch (Exception ex)
				{
					base.Log.AddLog("fail to shut down the shell command process: " + ex.Message);
				}
			}
			if (quit)
			{
				result = ((ToolErrorStatus == ShellCmdStatus.FileLostError) ? Result.LOAD_RESOURCE_FAILED : ((ToolErrorStatus == ShellCmdStatus.FastbootDegrade) ? Result.FASTBOOT_DEGRADE_QUIT : ((ToolErrorStatus != ShellCmdStatus.ConditionQuit) ? Result.MANUAL_QUIT : Result.INTERCEPTOR_QUIT)));
			}
			else if (mCompleted)
			{
				result = Result.PASSED;
			}
			else if (!mError && !quit && !flag)
			{
				flag2 = responseCount == 0;
				failedResponse = "the flash tool process has exited";
				result = (flag2 ? Result.SHELL_EXE_TERMINATED_EXIT : Result.FAILED);
			}
			else if (mError || !mCompleted || flag)
			{
				result = Result.FAILED;
			}
			base.Log.AddLog(string.Format("shell completed: {0}, error: {1}, quit: {2}, terminated exit: {3}, timeout-{4}: {5}", new object[6] { mCompleted, mError, quit, flag2, base.TimeoutMilliseconds, flag }), upload: true);
			FreeLock();
			base.Recipe.UcDevice.MessageBox.Close(true);
			return result;
		}

		private void Redirected(DataReceivedEventArgs e, ShellResponse shellResponse)
		{
			if (string.IsNullOrEmpty(e.Data) || quit)
			{
				return;
			}
			responseCount++;
			if (autoCloseWhenGoOnResponse && logMonitorType > 0 && responseTriggerCount < responseCount)
			{
				if (autoLockHandler != null && !autoLockHandler.SafeWaitHandle.IsClosed)
				{
					autoLockHandler.Set();
					autoLockHandler = null;
				}
				base.Recipe.UcDevice.MessageBox.Close(true);
			}
			string text = e.Data.Trim();
			string responseKey;
			ShellCmdStatus shellCmdStatus = shellResponse.ParseResponse(text, out responseKey);
			base.Log.AddLog($"status: {shellCmdStatus}, shell response: {text}", upload: true);
			if (shellResponse.ShellCmd == ShellCmdType.CmdDloader && text.StartsWith("Port :", StringComparison.CurrentCultureIgnoreCase))
			{
				hasPort = true;
			}
			int num = ConditionCheck(text);
			if (num != 0)
			{
				if (text.Contains("No such file or directory"))
				{
					ToolErrorStatus = ShellCmdStatus.FileLostError;
				}
				else if (text.Contains("STATUS_SEC_VIOLATE_ANTI_ROLLBACK"))
				{
					ToolErrorStatus = ShellCmdStatus.FastbootDegrade;
				}
				else
				{
					ToolErrorStatus = ShellCmdStatus.ConditionQuit;
				}
				if (num == 1)
				{
					quit = true;
				}
				else
				{
					mError = true;
				}
				return;
			}
			ShowMessageAnalyzeResponse(text, shellResponse);
			AnalyzeComport(text);
			switch (shellCmdStatus)
			{
			case ShellCmdStatus.Error:
			case ShellCmdStatus.RomUnMatchError:
			case ShellCmdStatus.AuthorizedError:
			case ShellCmdStatus.FastbootError:
				if (!mError && string.IsNullOrEmpty(failedResponse))
				{
					failedResponse = text;
				}
				if (ToolErrorStatus == ShellCmdStatus.None)
				{
					if (shellCmdStatus == ShellCmdStatus.AuthorizedError)
					{
						IsConnected = true;
					}
					ToolErrorStatus = shellCmdStatus;
				}
				mError = true;
				break;
			case ShellCmdStatus.Connected:
				if (!IsConnected)
				{
					base.Recipe.UcDevice.MessageBox.Close(true);
					base.Recipe.FreeEventHandler(realFlash: true);
					ShowMessageWhenConnectedSuccessAsync();
				}
				IsConnected = true;
				break;
			case ShellCmdStatus.Downloading:
			{
				double downloadProgressPercent = shellResponse.GetDownloadProgressPercent(text, responseKey);
				ProgressUpdate(downloadProgressPercent);
				break;
			}
			case ShellCmdStatus.Completed:
				mCompleted = true;
				break;
			case ShellCmdStatus.None:
			case ShellCmdStatus.Connecting:
			case ShellCmdStatus.Outputing:
			case ShellCmdStatus.Authenticating:
			case ShellCmdStatus.Writing:
			case ShellCmdStatus.FileLostError:
			case ShellCmdStatus.FastbootDegrade:
			case ShellCmdStatus.ConditionQuit:
				break;
			}
		}

		private async Task ShowMessageWhenStartToolAsync(ShellResponse shellResponse)
		{
			bool flag = true;
			if ((shellResponse.ShellCmd == ShellCmdType.MTekFlashTool || shellResponse.ShellCmd == ShellCmdType.MTekSpFlashTool) && base.Cache.ContainsKey("Read Device Mode") && base.Recipe.Device != null)
			{
				flag = base.Recipe.Device.ConnectType != ConnectType.Adb;
			}
			if (flag && base.Info.Args.ConnectTutorials is JObject jObject && ((IsRetry && jObject.Value<JArray>("ReSteps") != null) || jObject.Value<JArray>("Steps") != null))
			{
				string title = jObject.Value<string>("Title");
				JArray steps = jObject.Value<JArray>((IsRetry && jObject.Value<JArray>("ReSteps") != null) ? "ReSteps" : "Steps");
				bool autoPlay = jObject.Value<bool>("AutoPlay");
				double interval = jObject.Value<double>("Interval");
				string noteText = jObject.Value<string>("NoteText");
				LogHelper.LogInstance.Debug("Args.ConnectTutorials.Steps will show");
				if (!base.Recipe.UcDevice.MessageBox.AutoCloseConnectTutorials(title, steps, -1, autoPlay, interval, showPlayControl: true, showClose: true, popupWhenClose: true, noteText).HasValue)
				{
					quit = true;
				}
			}
			else if (flag && base.Info.Args.ConnectSteps != null)
			{
				ConnectStepInfo _connectStep = new ConnectStepInfo();
				_connectStep.NoteText = base.Info.Args.ConnectSteps.NoteText?.ToString();
				_connectStep.RetryText = base.Info.Args.ConnectSteps.RetryText?.ToString();
				_connectStep.WidthRatio = base.Info.Args.ConnectSteps.WidthRatio?.ToString() ?? "1:2:2";
				await Task.Run(delegate
				{
					List<ConnectSteps> list = new List<ConnectSteps>();
					foreach (dynamic item in base.Info.Args.ConnectSteps.Steps)
					{
						list.Add(new ConnectSteps
						{
							StepImage = item.Image.ToString(),
							StepContent = item.Content.ToString()
						});
					}
					_connectStep.Steps = list;
					if (!base.Recipe.UcDevice.MessageBox.AutoCloseMoreStep(base.Name, _connectStep, -1, popupWhenClose: true).HasValue)
					{
						quit = true;
					}
				});
			}
			else
			{
				if (!((flag && base.Info.Args.PromptText != null) ? true : false))
				{
					return;
				}
				await Task.Run(delegate
				{
					dynamic val = base.Info.Args.Image?.ToString();
					dynamic val2 = base.Info.Args.PromptText.ToString();
					if (base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, val2, val, showClose: true, popupWhenClose: true) == null)
					{
						quit = true;
					}
				});
			}
		}

		private void ShowMessageWhenConnectedSuccessAsync()
		{
			Task.Run(delegate
			{
				if (base.Info.Args.ConnectTutorials is JObject jObject && jObject.Value<JArray>("ReleaseSteps") != null)
				{
					JArray steps = jObject.Value<JArray>("ReleaseSteps");
					jObject.Value<string>("NoteText");
					LogHelper.LogInstance.Debug("Args.ConnectTutorials.ReleaseSteps will show");
					base.Recipe.UcDevice.MessageBox.AutoCloseConnectTutorials(null, steps, 10000, autoPlay: false, 5000.0, showPlayControl: false, showClose: false);
				}
				else if (base.Info.Args.ExPromptText != null)
				{
					string image = base.Info.Args.ExImage?.ToString();
					string message = base.Info.Args.ExPromptText.ToString();
					base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, message, image, null, 10000, null, showClose: false, popupWhenClose: false, format: true, true);
				}
			});
		}

		private void ShowMessageAnalyzeResponse(string response, ShellResponse shellResponse)
		{
			if (base.Info.Args.LogMonitorActions != null)
			{
				foreach (dynamic iter in base.Info.Args.LogMonitorActions)
				{
					if (!(response.Contains(iter.MatchText.ToString()) ? true : false))
					{
						continue;
					}
					if (iter.ActionType == "Command")
					{
						string text = iter.EXE;
						if (text.StartsWith("$"))
						{
							text = base.Cache[text.TrimStart(new char[1] { '$' })];
						}
						string text2 = iter.Command.ToString();
						if (text.ToLower().Contains("fastboot"))
						{
							string text3 = base.Recipe.Device?.Identifer;
							if (!string.IsNullOrEmpty(text3))
							{
								text2 = "-s " + text3 + " " + text2;
							}
						}
						string text4 = ProcessRunner.ProcessString(text, text2, 6000);
						base.Log.AddLog("Excute shell command: " + text + " " + text2 + ", response: " + text4 + "!", upload: true);
					}
					else
					{
						if (!((iter.Steps != null && iter.ActionType == "PromptText") ? true : false))
						{
							continue;
						}
						responseTriggerCount = responseCount;
						int millisecondsDelay = iter.Delay ?? ((object)0);
						autoCloseWhenGoOnResponse = iter.AutoCloseWhenGoOnResponse ?? ((object)false);
						if (iter.Steps.Count == 1)
						{
							dynamic img = iter.Steps[0].Image?.ToString();
							dynamic content = iter.Steps[0].Content.ToString();
							Task.Delay(millisecondsDelay).ContinueWith(delegate
							{
								if (!autoCloseWhenGoOnResponse || responseTriggerCount == responseCount)
								{
									Task.Run(delegate
									{
										if (autoLockHandler == null)
										{
											autoLockHandler = new AutoResetEvent(initialState: false);
										}
										logMonitorType = 1;
										int num = (int)((double)base.TimeoutMilliseconds - DateTime.Now.Subtract(startTime).TotalMilliseconds);
										bool? flag = base.Recipe.UcDevice.MessageBox.AutoClose(iter.NoteText?.ToString() ?? base.Name, content, img, new List<string> { "K0327" }, num, showClose: false, popupWhenClose: true, format: false, autoCloseResult: false);
										logMonitorType = 0;
										if (!flag.HasValue)
										{
											quit = true;
										}
										else if (flag == false)
										{
											mError = true;
										}
										autoLockHandler?.Set();
									});
								}
							});
						}
						else
						{
							if (!((iter.Steps.Count == 2 || iter.Steps.Count == 3) ? true : false))
							{
								continue;
							}
							ConnectStepInfo multiInfo = new ConnectStepInfo();
							multiInfo.NoteText = iter.NoteText?.ToString();
							multiInfo.WidthRatio = iter.WidthRatio?.ToString() ?? "1:2:2";
							multiInfo.Steps = new List<ConnectSteps>();
							foreach (dynamic item in iter.Steps)
							{
								multiInfo.Steps.Add(new ConnectSteps
								{
									StepImage = item.Image?.ToString(),
									StepContent = item.Content.ToString()
								});
							}
							Task.Delay(millisecondsDelay).ContinueWith(delegate
							{
								if (!autoCloseWhenGoOnResponse || responseTriggerCount == responseCount)
								{
									Task.Run(delegate
									{
										logMonitorType = 2;
										base.Recipe.UcDevice.MessageBox.AutoCloseMoreStep(base.Name, multiInfo);
										logMonitorType = 0;
									});
								}
							});
						}
					}
				}
			}
			if (response.Contains("too many links"))
			{
				base.Recipe.UcDevice.MessageBox.Show(base.Name, "K1452", "K0327", null, showClose: false, (MessageBoxImage)48).Wait(60000);
			}
			else if (!IsConnected && (response.StartsWith("Scanning USB port", StringComparison.CurrentCultureIgnoreCase) || response.StartsWith("Detecting download device", StringComparison.CurrentCultureIgnoreCase) || response.StartsWith("scan device START", StringComparison.CurrentCultureIgnoreCase)) && ConnectTutorialsTask == null)
			{
				base.Log.AddLog("the response meet the connection pop-up conditions, will show connection popup window");
				ConnectTutorialsTask = Task.Run(() => ShowMessageWhenStartToolAsync(shellResponse));
			}
		}

		protected void AnalyzeComport(string data)
		{
			if (!string.IsNullOrEmpty(data) && !base.Cache.ContainsKey("comport"))
			{
				string value = Regex.Match(data, "\\(COM(?<value>\\d+)\\)").Groups["value"].Value;
				if (!string.IsNullOrEmpty(value) && !base.Cache.ContainsKey("comport"))
				{
					base.Cache.Add("comport", value);
				}
			}
		}

		private bool CheckComport()
		{
			if (!base.Cache.ContainsKey("comport"))
			{
				return true;
			}
			List<string> comInfo = GlobalFun.GetComInfo();
			if (comInfo == null || comInfo.Count == 0)
			{
				return false;
			}
			return comInfo.Exists((string n) => n.Contains(string.Format("(COM{0})", (object?)base.Cache["comport"])));
		}

		private int ConditionCheck(string response)
		{
			string tmp = response.ToLower();
			foreach (JObject quitCondition in QuitConditionList)
			{
				List<string> list = quitCondition.Value<JArray>("Condition").Values<string>().ToList();
				if (list != null && list.Exists((string n) => tmp.Contains(n.ToLower())))
				{
					QuitConditionMessage = quitCondition.Value<string>("Message");
					string value = quitCondition.Value<string>("RescueMark");
					base.Log.AddInfo("rescuemark", value);
					base.Log.AddLog("shell response quit contains: " + string.Join(" | ", list), upload: true);
					return 1;
				}
			}
			foreach (JObject failCondition in FailConditionList)
			{
				List<string> list2 = failCondition.Value<JArray>("Condition").Values<string>().ToList();
				if (list2 != null && list2.Exists((string n) => tmp.Contains(n.ToLower())))
				{
					FailConditionMessage = failCondition.Value<string>("Message");
					isFailCondition = true;
					base.Log.AddLog("shell response fail contains: " + string.Join(" | ", list2), upload: true);
					return 2;
				}
			}
			return 0;
		}

		protected void FreeLock()
		{
			if (autoLockHandler != null)
			{
				autoLockHandler.WaitOne();
				autoLockHandler.Dispose();
				autoLockHandler = null;
			}
		}

		private void StartMonitoring(string vidpid)
		{
			if (isMonitoring)
			{
				return;
			}
			isMonitoring = true;
			monitorResult = new List<string>();
			base.Log.AddLog("Begin monitor device vidpid :" + vidpid, upload: true);
			monitorTimer = new System.Timers.Timer(1000.0);
			monitorTimer.Elapsed += delegate
			{
				if (!isMonitoring)
				{
					return;
				}
				try
				{
					List<string> values = ProcessRunner.ProcessList("pnputil.exe", "/enum-devices /connected", 60000);
					string output = string.Join("\r\n", values);
					string text = ParseAndFilterDevices(output, vidpid);
					string text2 = ((monitorResult.Count > 0) ? monitorResult.Last() : "");
					if (string.IsNullOrEmpty(text))
					{
						if (!text2.Contains("not found device"))
						{
							monitorResult.Add($"[{DateTime.Now}] :not found device:{vidpid}");
						}
					}
					else if (!text2.Contains(text))
					{
						monitorResult.Add($"[{DateTime.Now}]:{text}");
					}
				}
				catch (Exception arg)
				{
					monitorResult.Add($"shell StartMonitoring error,vidpid: {vidpid}, exeption: {arg}");
				}
			};
			monitorTimer.AutoReset = true;
			monitorTimer.Enabled = true;
			monitorTimer.Start();
		}

		private void StopMonitoring()
		{
			if (isMonitoring)
			{
				isMonitoring = false;
				monitorTimer?.Stop();
				monitorTimer?.Dispose();
				base.Log.AddLog("Stop monitor device vidpid", upload: true);
			}
		}

		private string ParseAndFilterDevices(string output, string searchPattern)
		{
			List<string> list = new List<string>();
			string[] array = output.Split(new string[2] { "\r\n", "\n" }, StringSplitOptions.None);
			bool flag = false;
			string[] array2 = array;
			foreach (string text in array2)
			{
				if (text.Contains(searchPattern))
				{
					flag = true;
					list.Add(text);
					continue;
				}
				if (string.IsNullOrWhiteSpace(text) || ((text.ToUpper().Contains(" ID") || text.ToUpper().Contains("ID.")) && flag))
				{
					flag = false;
				}
				if (flag && text.Contains(":"))
				{
					list.Add(text);
				}
			}
			return string.Join("\r\n", list);
		}

		private void OnDeviceInfoUpdated(object sender, DeviceInfoUpdatedEventArgs e)
		{
			if (string.IsNullOrEmpty(e?.MonitorDevice?.ProviderName) || e.MonitorDevice.ProviderName.Equals("--", StringComparison.CurrentCultureIgnoreCase) || string.IsNullOrEmpty(e?.MonitorDevice?.DeviceId) || ((!e.MonitorDevice.DeviceId.Contains(base.Info.Args.TempVP?.ToString()))) || Volatile.Read(in _officialDriverFlag) == 0)
			{
				return;
			}
			string text = platform;
			if (!(text == "MTK"))
			{
				if (text == "UNISOC" && !e.MonitorDevice.ProviderName.Equals("UNISOC Communications Inc.", StringComparison.OrdinalIgnoreCase))
				{
					base.Log.AddLog("platform [UNISOC] current driver provider [" + e.MonitorDevice.ProviderName + "] DeviceId [" + e.MonitorDevice.DeviceId + "] DriverVersion [" + e.MonitorDevice.DriverVersion + "]", upload: true);
					SetOfficialDriverFlag(value: false);
				}
			}
			else if (!e.MonitorDevice.ProviderName.Equals("MediaTek Inc.", StringComparison.OrdinalIgnoreCase))
			{
				base.Log.AddLog("platform [MTK] current driver provider [" + e.MonitorDevice.ProviderName + "] DeviceId [" + e.MonitorDevice.DeviceId + "] DriverVersion [" + e.MonitorDevice.DriverVersion + "]", upload: true);
				SetOfficialDriverFlag(value: false);
			}
		}

		private void SetOfficialDriverFlag(bool value)
		{
			Interlocked.Exchange(ref _officialDriverFlag, value ? 1 : 0);
		}
	}
	public class ConnectSteps
	{
		public string StepImage { get; internal set; }

		public string StepContent { get; internal set; }
	}
	public class ConnectStepInfo
	{
		public string NoteText { get; internal set; }

		public string RetryText { get; internal set; }

		public string WidthRatio { get; internal set; }

		public List<ConnectSteps> Steps { get; internal set; }
	}
	public enum ShellCmdStatus
	{
		None = 0,
		Connecting = 1,
		Connected = 2,
		Downloading = 3,
		Completed = 4,
		Outputing = 5,
		Authenticating = 6,
		Writing = 7,
		RomUnMatchError = 8,
		AuthorizedError = 9,
		FastbootError = 10,
		FileLostError = 11,
		FastbootDegrade = 12,
		ConditionQuit = 13,
		Error = -1
	}
	public enum ShellCmdType
	{
		None,
		MTekFlashTool,
		MTekSpFlashTool,
		MTekCfcFlashTool,
		QComFlashTool,
		QFileTool,
		PnPTool,
		CmdDloader,
		QFileSaharaTool,
		CmdDloaderTablet,
		MTekFlashToolTablet,
		LXDownloadTool
	}
	public abstract class ShellResponse
	{
		public abstract Dictionary<string, ShellCmdStatus> ResponseToStatus { get; }

		public abstract ShellCmdType ShellCmd { get; }

		public abstract string ComputedPercent(string response, string key);

		public virtual void Init(string category = null, object data = null)
		{
		}

		public virtual ShellCmdStatus ParseResponse(string response, out string responseKey)
		{
			ShellCmdStatus result = ShellCmdStatus.None;
			responseKey = string.Empty;
			foreach (string key in ResponseToStatus.Keys)
			{
				if (Regex.IsMatch(response, key, RegexOptions.IgnoreCase))
				{
					responseKey = key;
					result = ResponseToStatus[key];
				}
			}
			return result;
		}

		public virtual double GetDownloadProgressPercent(string response, string key)
		{
			double result = 0.0;
			if (double.TryParse(ComputedPercent(response, key), out var result2))
			{
				result = ((100.0 - result2 < 0.02) ? 100.0 : result2);
			}
			return result;
		}

		public void CleanUp()
		{
			GlobalFun.TryDeleteFile(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Qualcomm\\QFIL\\QFIL.config"));
		}

		public void WriteInput(string message, string serialNumber, string logId, string clientReqType, string prodId, string keyType, string keyName, string inputFileName, Process process)
		{
		}
	}
	public class ShellResponseCfcflash : ShellResponse
	{
		protected readonly Dictionary<string, ShellCmdStatus> MTekCfcResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"all download successful!!!",
				ShellCmdStatus.Completed
			},
			{
				"SearchUSBPortPool failed!",
				ShellCmdStatus.Error
			},
			{
				"Failed to find USB port",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: S_CHIP_TYPE_NOT_MATCH",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"Connect BROM failed: STATUS_SCATTER_HW_CHIP_ID_MISMATCH",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"Connect BROM failed: S_BROM_CMD_STARTCMD_FAIL",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: S_TIMEOUT",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: STATUS_BROM_CMD_FAIL",
				ShellCmdStatus.Error
			},
			{
				"[BROM] Can not pass bootrom start command! Possibly target power up too early.",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: S_FT_ENABLE_DRAM_FAIL",
				ShellCmdStatus.Error
			},
			{
				"[EMI] Enable DRAM Failed!",
				ShellCmdStatus.Error
			},
			{
				"Please check your load matches to your target which is to be downloaded.",
				ShellCmdStatus.Error
			},
			{
				"[DA] DA binary file contains an unsupported version in its header! Please ask for help.",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: S_UNSUPPORTED_VER_OF_DA",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: STATUS_DEVICE_CTRL_EXCEPTION",
				ShellCmdStatus.Error
			},
			{
				"Chip mismatch",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"STATUS_SEC_DL_FORBIDDEN",
				ShellCmdStatus.AuthorizedError
			},
			{
				"fastboot: error",
				ShellCmdStatus.FastbootError
			},
			{
				"error:serialnocannotbenull",
				ShellCmdStatus.Error
			},
			{
				"Flashemmcsplloadererror",
				ShellCmdStatus.Error
			},
			{
				"Flashufssplloadererror",
				ShellCmdStatus.Error
			},
			{
				"Flashuboot_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashtrustos_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashteecfg_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashsml_aerror",
				ShellCmdStatus.Error
			},
			{
				"Eraseuboot_logerror",
				ShellCmdStatus.Error
			},
			{
				"backupnverror",
				ShellCmdStatus.Error
			},
			{
				"Flashl_fixnv1_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashgpterror",
				ShellCmdStatus.Error
			},
			{
				"Flashvbmeta_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashvbmeta_system_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashvbmeta_system_ext_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashvbmeta_vendor_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashvbmeta_product_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashvbmeta_odm_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashl_modem_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashl_deltanv_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashl_ldsp_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashl_gdsp_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashl_agdsp_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashpm_sys_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashboot_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashvendor_boot_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashinit_boot_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashdtbo_aerror",
				ShellCmdStatus.Error
			},
			{
				"Flashsupererror",
				ShellCmdStatus.Error
			},
			{
				"Flashcacheerror",
				ShellCmdStatus.Error
			},
			{
				"Flashblackboxerror",
				ShellCmdStatus.Error
			},
			{
				"Flashelabelerror",
				ShellCmdStatus.Error
			},
			{
				"Flashuserdataerror",
				ShellCmdStatus.Error
			},
			{
				"Flashlogoerror",
				ShellCmdStatus.Error
			},
			{
				"Flashfbootlogoerror",
				ShellCmdStatus.Error
			},
			{
				"Erasel_runtimenv1error",
				ShellCmdStatus.Error
			},
			{
				"Erasemetadataerror",
				ShellCmdStatus.Error
			},
			{
				"Erasesysdumpdberror",
				ShellCmdStatus.Error
			},
			{
				"Flashsplloadererror",
				ShellCmdStatus.Error
			},
			{
				"Erro:enduserflashfailed!!!",
				ShellCmdStatus.Error
			}
		};

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => MTekCfcResponseToStatus;

		public override ShellCmdType ShellCmd => ShellCmdType.MTekCfcFlashTool;

		public override string ComputedPercent(string response, string key)
		{
			return "0";
		}
	}
	public class ShellResponseCmdDloader : ShellResponse
	{
		protected Dictionary<string, ShellCmdStatus> CmdDloaderResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"Connecting",
				ShellCmdStatus.Connected
			},
			{
				"Downloading...",
				ShellCmdStatus.Downloading
			},
			{
				"DownLoad Passed",
				ShellCmdStatus.Completed
			},
			{
				"DownLoad Failed",
				ShellCmdStatus.Error
			},
			{
				"login http Get Fail!",
				ShellCmdStatus.AuthorizedError
			},
			{
				"Not find valid download devices",
				ShellCmdStatus.Error
			},
			{
				"WM_CLOSE",
				ShellCmdStatus.Error
			},
			{
				"login tsdc server fail",
				ShellCmdStatus.Error
			},
			{
				"Failure to load PAC file",
				ShellCmdStatus.Error
			}
		};

		protected Dictionary<string, ShellCmdStatus> CmdDloaderTabletResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"Connecting",
				ShellCmdStatus.Connected
			},
			{
				"Downloading...",
				ShellCmdStatus.Downloading
			},
			{
				"DownLoad Passed",
				ShellCmdStatus.Completed
			},
			{
				"DownLoad Failed",
				ShellCmdStatus.Error
			},
			{
				"login http Get Fail!",
				ShellCmdStatus.AuthorizedError
			},
			{
				"Not find valid download devices",
				ShellCmdStatus.Error
			},
			{
				"Loading firmware",
				ShellCmdStatus.Connected
			},
			{
				"Download Image Total\\(",
				ShellCmdStatus.Downloading
			},
			{
				"Upgrade firmware ok",
				ShellCmdStatus.Completed
			},
			{
				"Download Firmware Fail",
				ShellCmdStatus.Error
			},
			{
				"Load PAC file successfully",
				ShellCmdStatus.Connected
			}
		};

		private ShellCmdType shellCMd = ShellCmdType.CmdDloader;

		private Dictionary<string, ShellCmdStatus> responseToStatus;

		private double mPercentage;

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => responseToStatus;

		public override ShellCmdType ShellCmd => shellCMd;

		public override void Init(string category = null, object data = null)
		{
			bool flag = !string.IsNullOrEmpty(category) && category.Equals("Tablet", StringComparison.OrdinalIgnoreCase);
			shellCMd = (flag ? ShellCmdType.CmdDloaderTablet : ShellCmdType.CmdDloader);
			responseToStatus = (flag ? CmdDloaderTabletResponseToStatus : CmdDloaderResponseToStatus);
		}

		public override string ComputedPercent(string response, string key)
		{
			if (ShellCmd == ShellCmdType.CmdDloader)
			{
				mPercentage += 3.3333333333333335;
				return $"{mPercentage:0.00}";
			}
			return "0";
		}
	}
	public class ShellResponseFactory
	{
		protected static Dictionary<string, string> ExeToShellResponse = new Dictionary<string, string>
		{
			{ "flash_tool", "ShellResponseFlashtool" },
			{ "spflashtool", "ShellResponseSpflashtool" },
			{ "qdowloader", "ShellResponseQdowloader" },
			{ "qcomdloader", "ShellResponseQdowloader" },
			{ "qfil", "ShellResponseQfil" },
			{ "upgrade_tool", "ShellResponseUpgradetool" },
			{ "cfc_flash", "ShellResponseCfcflash" },
			{ "update_flash", "ShellResponseCfcflash" },
			{ "Qsaharaserver", "ShellResponseQsaharaserver" },
			{ "fh_loader", "ShellResponseQsaharaserver" },
			{ "CmdDloader", "ShellResponseCmdDloader" },
			{ "LXConsoleDownLoadTool", "ShellResponseLXConsoleDownLoadTool" }
		};

		public static ShellResponse CreateInstance(string exe)
		{
			exe = Path.GetFileName(exe).ToLower();
			Assembly assembly = typeof(ShellResponseFactory).Assembly;
			string key = ExeToShellResponse.Keys.FirstOrDefault((string n) => exe.StartsWith(n, StringComparison.CurrentCultureIgnoreCase)) ?? "CmdDloader";
			return (ShellResponse)Activator.CreateInstance(assembly.GetType("lenovo.mbg.service.framework.smartdevice.Steps." + ExeToShellResponse[key]));
		}
	}
	public class ShellResponseFlashtool : ShellResponse
	{
		protected Dictionary<string, ShellCmdStatus> MTekResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"BROM connected",
				ShellCmdStatus.Connected
			},
			{
				"connect brom successed",
				ShellCmdStatus.Connected
			},
			{
				"% of image data has been sent",
				ShellCmdStatus.Downloading
			},
			{
				"WRITE TO PARTITION",
				ShellCmdStatus.Downloading
			},
			{
				"All command exec done!",
				ShellCmdStatus.Completed
			},
			{
				"STATUS_DOWNLOAD_EXCEPTION",
				ShellCmdStatus.Error
			},
			{
				"SearchUSBPortPool failed!",
				ShellCmdStatus.Error
			},
			{
				"Failed to find USB port",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: S_CHIP_TYPE_NOT_MATCH",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"Connect BROM failed: STATUS_SCATTER_HW_CHIP_ID_MISMATCH",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"Connect BROM failed: S_BROM_CMD_STARTCMD_FAIL",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: S_TIMEOUT",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: STATUS_BROM_CMD_FAIL",
				ShellCmdStatus.Error
			},
			{
				"[BROM] Can not pass bootrom start command! Possibly target power up too early.",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: S_FT_ENABLE_DRAM_FAIL",
				ShellCmdStatus.Error
			},
			{
				"[EMI] Enable DRAM Failed!",
				ShellCmdStatus.Error
			},
			{
				"Please check your load matches to your target which is to be downloaded.",
				ShellCmdStatus.Error
			},
			{
				"[DA] DA binary file contains an unsupported version in its header! Please ask for help.",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: S_UNSUPPORTED_VER_OF_DA",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: STATUS_DEVICE_CTRL_EXCEPTION",
				ShellCmdStatus.Error
			},
			{
				"Chip mismatch",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"STATUS_SEC_DL_FORBIDDEN",
				ShellCmdStatus.AuthorizedError
			},
			{
				"Exception: err_code",
				ShellCmdStatus.Error
			},
			{
				"lib DA NOT match",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"Download failed",
				ShellCmdStatus.Error
			},
			{
				"S_FT_DOWNLOAD_FAIL ",
				ShellCmdStatus.Error
			},
			{
				"Invalid parameter.",
				ShellCmdStatus.Error
			},
			{
				"connect brom failed",
				ShellCmdStatus.Error
			},
			{
				"Logger deinited",
				ShellCmdStatus.Error
			}
		};

		protected Dictionary<string, ShellCmdStatus> MTekResponseToStatus_Tablet = new Dictionary<string, ShellCmdStatus>
		{
			{
				"BROM connected",
				ShellCmdStatus.Connected
			},
			{
				"connect brom successed",
				ShellCmdStatus.Connected
			},
			{
				"% of image data has been sent",
				ShellCmdStatus.Downloading
			},
			{
				"WRITE TO PARTITION",
				ShellCmdStatus.Downloading
			},
			{
				"All command exec done!",
				ShellCmdStatus.Completed
			},
			{
				"Download Succeeded.",
				ShellCmdStatus.Completed
			},
			{
				"STATUS_DOWNLOAD_EXCEPTION",
				ShellCmdStatus.Error
			},
			{
				"SearchUSBPortPool failed!",
				ShellCmdStatus.Error
			},
			{
				"Failed to find USB port",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: S_CHIP_TYPE_NOT_MATCH",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"Connect BROM failed: STATUS_SCATTER_HW_CHIP_ID_MISMATCH",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"Connect BROM failed: S_BROM_CMD_STARTCMD_FAIL",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: S_TIMEOUT",
				ShellCmdStatus.Error
			},
			{
				"Connect BROM failed: STATUS_BROM_CMD_FAIL",
				ShellCmdStatus.Error
			},
			{
				"[BROM] Can not pass bootrom start command! Possibly target power up too early.",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: S_FT_ENABLE_DRAM_FAIL",
				ShellCmdStatus.Error
			},
			{
				"[EMI] Enable DRAM Failed!",
				ShellCmdStatus.Error
			},
			{
				"Please check your load matches to your target which is to be downloaded.",
				ShellCmdStatus.Error
			},
			{
				"[DA] DA binary file contains an unsupported version in its header! Please ask for help.",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: S_UNSUPPORTED_VER_OF_DA",
				ShellCmdStatus.Error
			},
			{
				"Failed to Connect DA: STATUS_DEVICE_CTRL_EXCEPTION",
				ShellCmdStatus.Error
			},
			{
				"Chip mismatch",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"STATUS_SEC_DL_FORBIDDEN",
				ShellCmdStatus.AuthorizedError
			},
			{
				"Exception: err_code",
				ShellCmdStatus.Error
			},
			{
				"lib DA NOT match",
				ShellCmdStatus.RomUnMatchError
			},
			{
				"Download failed",
				ShellCmdStatus.Error
			},
			{
				"S_FT_DOWNLOAD_FAIL ",
				ShellCmdStatus.Error
			},
			{
				"Invalid parameter.",
				ShellCmdStatus.Error
			},
			{
				"connect brom failed",
				ShellCmdStatus.Error
			},
			{
				"Logger deinited",
				ShellCmdStatus.Error
			}
		};

		private ShellCmdType shellCMd = ShellCmdType.MTekFlashTool;

		private Dictionary<string, ShellCmdStatus> responseToStatus;

		private double mPercentage;

		protected int MTKFileCount = 1;

		public override ShellCmdType ShellCmd => shellCMd;

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => responseToStatus;

		public override void Init(string category = null, object data = null)
		{
			bool flag = !string.IsNullOrEmpty(category) && category.Equals("Tablet", StringComparison.OrdinalIgnoreCase);
			shellCMd = ((!flag) ? ShellCmdType.MTekFlashTool : ShellCmdType.MTekFlashToolTablet);
			responseToStatus = (flag ? MTekResponseToStatus_Tablet : MTekResponseToStatus);
			if (ShellCmd == ShellCmdType.MTekFlashTool)
			{
				ComputedFileCount(data);
			}
		}

		public override string ComputedPercent(string response, string key)
		{
			string text = "0";
			if (key == "WRITE TO PARTITION")
			{
				mPercentage += 100.0 / (double)MTKFileCount;
				text = $"{mPercentage:0.00}";
			}
			else if (key == "% of image data has been sent")
			{
				text = response.Substring(0, response.IndexOf('%'));
				mPercentage = double.Parse(text);
			}
			else
			{
				text = mPercentage.ToString();
			}
			return text;
		}

		protected void ComputedFileCount(object data)
		{
			if (data == null)
			{
				return;
			}
			string text = (data as List<object>).FirstOrDefault((object n) => n.ToString().EndsWith("xml"))?.ToString();
			if (string.IsNullOrEmpty(text))
			{
				return;
			}
			Dictionary<string, long> dictionary = new Dictionary<string, long>();
			foreach (Match item in Regex.Matches(File.ReadAllText(text), "<rom\\s+?index=\"(?<key>\\d+)\"\\s+?.*>(?<value>.+)</rom>", RegexOptions.Multiline))
			{
				dictionary.Add(item.Groups["key"].Value, new FileInfo(item.Groups["value"].Value).Length);
			}
			MTKFileCount = dictionary.Count;
		}
	}
	public class ShellResponseLXConsoleDownLoadTool : ShellResponse
	{
		protected Dictionary<string, ShellCmdStatus> DownLoadToolResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"begin down file...",
				ShellCmdStatus.Connected
			},
			{
				"start download file",
				ShellCmdStatus.Downloading
			},
			{
				"open device fail",
				ShellCmdStatus.Error
			},
			{
				"download finish",
				ShellCmdStatus.Completed
			}
		};

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => DownLoadToolResponseToStatus;

		public override ShellCmdType ShellCmd => ShellCmdType.LXDownloadTool;

		public override string ComputedPercent(string response, string key)
		{
			return "0";
		}
	}
	public class ShellResponseQdowloader : ShellResponse
	{
		protected Dictionary<string, ShellCmdStatus> QComResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"Status=status_flash_dut_connected",
				ShellCmdStatus.Connected
			},
			{
				"Status=status_flash_download_percent_",
				ShellCmdStatus.Downloading
			},
			{
				"Status=status_flash_download_end",
				ShellCmdStatus.Completed
			},
			{
				"Status=status_flash_download_failed",
				ShellCmdStatus.Error
			}
		};

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => QComResponseToStatus;

		public override ShellCmdType ShellCmd => ShellCmdType.QComFlashTool;

		public override string ComputedPercent(string response, string key)
		{
			return response.Substring(key.Length);
		}
	}
	public class ShellResponseQfil : ShellResponse
	{
		protected Dictionary<string, ShellCmdStatus> QFileResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"Start Download",
				ShellCmdStatus.Connected
			},
			{
				"{percent files transferred",
				ShellCmdStatus.Downloading
			},
			{
				"Download Succeed",
				ShellCmdStatus.Completed
			},
			{
				"Download Fail",
				ShellCmdStatus.Error
			}
		};

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => QFileResponseToStatus;

		public override ShellCmdType ShellCmd => ShellCmdType.QFileTool;

		public override string ComputedPercent(string response, string key)
		{
			string pattern = $"(?<key>.+?{key})\\s+?(?<value>[\\d\\.]+)";
			return Regex.Match(response, pattern, RegexOptions.IgnoreCase).Groups["value"].Value;
		}
	}
	public class ShellResponseQsaharaserver : ShellResponse
	{
		protected Dictionary<string, ShellCmdStatus> QFileSaharaResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"Start Download",
				ShellCmdStatus.Connected
			},
			{
				"{percent files transferred",
				ShellCmdStatus.Downloading
			},
			{
				"Sahara protocol completed",
				ShellCmdStatus.Completed
			},
			{
				"File transferred successfully",
				ShellCmdStatus.Outputing
			},
			{
				"Download Succeed",
				ShellCmdStatus.Completed
			},
			{
				"Download Fail",
				ShellCmdStatus.Error
			},
			{
				"All Finished Successfully",
				ShellCmdStatus.Completed
			},
			{
				"There is a chance your target is in SAHARA mode!!",
				ShellCmdStatus.Error
			},
			{
				"ERROR: XML not formed correctly",
				ShellCmdStatus.Error
			}
		};

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => QFileSaharaResponseToStatus;

		public override ShellCmdType ShellCmd => ShellCmdType.QFileSaharaTool;

		public override string ComputedPercent(string response, string key)
		{
			return "0";
		}
	}
	public class ShellResponseSpflashtool : ShellResponseFlashtool
	{
		public override ShellCmdType ShellCmd => ShellCmdType.MTekSpFlashTool;

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => MTekResponseToStatus;

		public override void Init(string category = null, object data = null)
		{
			ComputedFileCount(data);
		}
	}
	public class ShellResponseUpgradetool : ShellResponse
	{
		protected Dictionary<string, ShellCmdStatus> PnpResponseToStatus = new Dictionary<string, ShellCmdStatus>
		{
			{
				"Start to upgrade firmware",
				ShellCmdStatus.Connected
			},
			{
				"Download Image...",
				ShellCmdStatus.Downloading
			},
			{
				"Upgrade firmware ok",
				ShellCmdStatus.Completed
			},
			{
				"Download Firmware Fail",
				ShellCmdStatus.Error
			}
		};

		public override Dictionary<string, ShellCmdStatus> ResponseToStatus => PnpResponseToStatus;

		public override ShellCmdType ShellCmd => ShellCmdType.PnPTool;

		public override string ComputedPercent(string response, string key)
		{
			return Regex.Match(response, "\\((?<value>[\\d\\.]+)", RegexOptions.IgnoreCase).Groups["value"].Value;
		}
	}
	public class Sleep : BaseStep
	{
		public override void Run()
		{
			Thread.Sleep((int)base.Info.Args.Milliseconds);
			base.Log.AddResult(this, Result.PASSED);
		}
	}
	public class FastbootModifyFlashFile : BaseStep
	{
		public override void Run()
		{
			string text = base.Info.Args.DefaultSlot;
			if (string.IsNullOrEmpty(text))
			{
				base.Log.AddLog("recipe config defaultSlot is null");
				base.Log.AddResult(this, Result.FASTBOOT_SLOT_SET_FAILED, "recipe config error");
				return;
			}
			string text2 = base.Info.Args.Command?.ToString();
			string text3 = EncapsulationFastbootCommand(text2);
			if (string.IsNullOrEmpty(text3))
			{
				base.Log.AddLog("recipe config command is null");
				base.Log.AddResult(this, Result.FASTBOOT_SLOT_SET_FAILED, "recipe config error");
				return;
			}
			string text4 = ProcessRunner.ProcessString(Configurations.FastbootPath, text3, 6000)?.ToLower();
			base.Log.AddLog("fastboot command : " + text3 + ", response: " + text4, upload: true);
			string value = null;
			if (!string.IsNullOrEmpty(text4))
			{
				string[] array = text4.Split(new string[1] { "\r\n" }, StringSplitOptions.None);
				string value2 = text2.Substring(text2.IndexOf(' '))?.Trim();
				if (array != null && array.Length != 0)
				{
					for (int i = 0; i < array.Length; i++)
					{
						if (array[i].Contains(value2))
						{
							array = array[i].Split(new char[1] { ':' });
							if (array != null && array.Length > 1)
							{
								value = array[1]?.Trim();
							}
							break;
						}
					}
				}
			}
			if (string.IsNullOrEmpty(value))
			{
				base.Log.AddLog("current slot is null", upload: true);
				base.Log.AddResult(this, Result.FASTBOOT_SLOT_SET_FAILED, "current slot not found");
				return;
			}
			if (!text.Equals(value, StringComparison.CurrentCultureIgnoreCase))
			{
				base.Log.AddLog("current slot is not equal default solt");
				string key = base.Info.Args.File;
				string text5 = base.Cache[key];
				base.Log.AddLog("old flash file: " + text5);
				string pa = "(partition\\s*=\\s*\"[^\"]+?)_a\"";
				string pb = "(partition\\s*=\\s*\"[^\"]+?)_b\"";
				List<string> result = new List<string>();
				File.ReadAllLines(text5).ToList().ForEach(delegate(string n)
				{
					if (Regex.IsMatch(n, pa))
					{
						result.Add(Regex.Replace(n, pa, "$1_b\""));
					}
					else if (Regex.IsMatch(n, pb))
					{
						result.Add(Regex.Replace(n, pb, "$1_a\""));
					}
					else
					{
						result.Add(n);
					}
				});
				string text6 = Path.Combine(Directory.GetParent(text5).FullName, "flash.temp.xml");
				if (File.Exists(text6))
				{
					File.Delete(text6);
				}
				File.WriteAllLines(text6, result, Encoding.UTF8);
				base.Cache[key] = text6;
				base.Log.AddLog("new flash file: " + text6);
			}
			base.Log.AddResult(this, Result.PASSED);
		}
	}
	public class VidPidMonitoring : BaseStep
	{
		public override void Run()
		{
			string pattern = "^VID_[0-9A-Fa-f]{4}&PID_[0-9A-Fa-f]{4}$";
			string text = base.Info.Args.OriginalVP;
			if (string.IsNullOrEmpty(text))
			{
				base.Log.AddLog("The OriginalVP parameters parsed in the step[VidPidMonitoring] are empty", upload: true);
				base.Log.AddResult(this, Result.FAILED);
				return;
			}
			if (!Regex.IsMatch(text, pattern))
			{
				base.Log.AddLog("The OriginalVP [" + text + "] parameters Format error", upload: true);
				base.Log.AddResult(this, Result.FAILED);
				return;
			}
			string value = base.Resources.Get("Mutil");
			if (!string.IsNullOrEmpty(value) && bool.Parse(value))
			{
				base.Log.AddLog("VidPidMonitoring is currently not supported in the case of multiple device flashing", upload: true);
				base.Log.AddResult(this, Result.SKIPPED);
			}
			else
			{
				VidPidMonitorHandler.Instance.Run(text);
				base.Log.AddLog("Start monitoring the port[" + text + "] in step[VidPidMonitoring]", upload: true);
				base.Log.AddResult(this, Result.PASSED);
			}
		}
	}
	public class WaitConnectByAdb : BaseStep
	{
		protected bool running = true;

		public override void Run()
		{
			string message = base.Info.Args.PromptText.ToString();
			string image = string.Empty;
			if (base.Info.Args.Image != null)
			{
				image = base.Info.Args.Image.ToString();
			}
			Task<bool?> msgbxTask = base.Recipe.UcDevice.MessageBox.WaitByAdb(base.Info.Name, message, image);
			int num = FindDevice(msgbxTask);
			if (num == -1)
			{
				base.Log.AddResult(this, Result.MANUAL_QUIT, "customer closes the connection pop-up window");
				return;
			}
			base.Recipe.UcDevice.MessageBox.Close(true);
			if (num == 1)
			{
				base.Log.AddResult(this, Result.PASSED);
			}
			else
			{
				base.Log.AddResult(this, Result.ADB_CONNECT_FAILED, "connect timeout");
			}
		}

		protected int FindDevice(Task<bool?> msgbxTask)
		{
			Task<int> task = Task.Run(delegate
			{
				do
				{
					try
					{
						if (GetDevice(ConnectType.Adb, (object d) => !Regex.IsMatch((d as DeviceEx).Identifer, "&|:")) != null)
						{
							return 1;
						}
					}
					catch
					{
					}
					Thread.Sleep(1000);
				}
				while (!msgbxTask.IsCompleted);
				return -1;
			});
			int millisecondsTimeout = ((base.TimeoutMilliseconds <= 0) ? (-1) : base.TimeoutMilliseconds);
			if (!task.Wait(millisecondsTimeout))
			{
				return 0;
			}
			return task.Result;
		}
	}
	public class WaitConnectByFastboot : BaseStep
	{
		public override void Run()
		{
			Result result = Result.PASSED;
			if (base.TimeoutMilliseconds <= 0)
			{
				base.TimeoutMilliseconds = 20000;
			}
			string response = null;
			DeviceEx deviceEx = GetDevice(ConnectType.Fastboot);
			if (deviceEx == null && base.Recipe.Device != null)
			{
				deviceEx = HostProxy.deviceManager.ConntectedDevices.FirstOrDefault((DeviceEx n) => n.Identifer == base.Recipe.Device.Identifer);
				if (deviceEx != null)
				{
					base.Recipe.SetRecipeDevice(deviceEx);
				}
			}
			if (deviceEx == null)
			{
				int num = 0;
				int num2;
				do
				{
					ClearDeviceMonitorConnectedList();
					num++;
					Task<bool?> msgbxTask = base.Recipe.UcDevice.MessageBox.WaitByFastboot(base.Log.UseCase, base.Resources.Get(RecipeResources.ModelName) + "#" + base.Resources.Get(RecipeResources.RealModelName));
					num2 = FindDevice(msgbxTask);
					if (num2 == -1)
					{
						break;
					}
					base.Recipe.UcDevice.MessageBox.Close(true);
					if (num2 == 1)
					{
						break;
					}
					if ((Retry > 0 && base.Info.Args.RetryPromptText != null) && ((!base.Recipe.UcDevice.MessageBox.Show(base.Name, base.Info.Args.RetryPromptText.ToString()).Wait(base.TimeoutMilliseconds)) ? true : false))
					{
						num2 = 0;
						base.Recipe.UcDevice.MessageBox.Close(true);
						break;
					}
					base.Log.AddLog($"Not find fastboot device,connect timeout ! Execute count :{num}");
					if (base.Info.Args.TempVP != null && Retry > 0)
					{
						DriverPrompt();
					}
					ErrorConnectProcess();
				}
				while (Retry-- > 0);
				switch (num2)
				{
				case -1:
					result = Result.MANUAL_QUIT;
					response = "customer closes the connection pop-up window";
					break;
				case 1:
					result = Result.PASSED;
					break;
				default:
					result = Result.FASTBOOT_CONNECT_FAILED;
					response = "connect timeout";
					break;
				}
			}
			Thread.Sleep(2000);
			PrintConnectedDevice(result != Result.PASSED);
			base.Log.AddResult(this, result, response);
		}

		protected int FindDevice(Task<bool?> msgbxTask)
		{
			DateTime now = DateTime.Now;
			do
			{
				if (msgbxTask.IsCompleted)
				{
					return -1;
				}
				if (GetDevice(ConnectType.Fastboot) != null)
				{
					return 1;
				}
				Thread.Sleep(500);
			}
			while (DateTime.Now.Subtract(now).TotalMilliseconds < (double)base.TimeoutMilliseconds);
			return 0;
		}

		private void DriverPrompt()
		{
			MonitorDeviceModel currentMonitorDeviceInfo = VidPidMonitorHandler.Instance.GetCurrentMonitorDeviceInfo();
			base.Log.AddLog(string.Format("The device information obtained by detecting the port [{0}] in step [{1}] : DriverName [{2}] DeviceId [{3}] ", new object[4]
			{
				base.Info.Args.TempVP,
				base.Name,
				currentMonitorDeviceInfo.ProviderName,
				currentMonitorDeviceInfo.PnpDeviceId
			}), upload: true);
			if (string.IsNullOrEmpty(currentMonitorDeviceInfo?.ProviderName) || currentMonitorDeviceInfo.ProviderName.Equals("--", StringComparison.CurrentCultureIgnoreCase) || string.IsNullOrEmpty(currentMonitorDeviceInfo?.PnpDeviceId) || currentMonitorDeviceInfo.ProviderName.Equals("Motorola", StringComparison.CurrentCultureIgnoreCase))
			{
				return;
			}
			if (DriverErrorPromptByFastboot())
			{
				if (!VidPidMonitorHandler.Instance.ForceDriverUpdate(currentMonitorDeviceInfo.PnpDeviceId, Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "LMSA\\drivers\\Motorola\\motoandroid2.inf")))
				{
					base.Recipe.UcDevice.MessageBox.Show(base.Name, "K2190", "K0327", "K0208", showClose: false, (MessageBoxImage)48).Wait();
				}
				return;
			}
			base.Log.AddLog("The user chooses not to update the driver. The driver information currently in use is:DriverName [" + currentMonitorDeviceInfo.ProviderName + "] DeviceId [" + currentMonitorDeviceInfo.PnpDeviceId + "] DriverVersion [" + currentMonitorDeviceInfo.DriverVersion + "]", upload: true);
		}
	}
	public class WaitFastbootConnectUntilTimeout : BaseStep
	{
		protected bool quit;

		private string TAG => GetType().FullName;

		public override void Run()
		{
			bool flag = false;
			quit = false;
			DriversHelper.CheckMotorolaDriverExeInstalled(delegate(string _arg)
			{
				base.Recipe.UcDevice.MessageBox.SetMainWindowDriverBtnStatus(_arg);
			});
			if (GetDevice(ConnectType.Fastboot) != null)
			{
				flag = true;
			}
			else
			{
				do
				{
					ShowConnectMessagebox();
					int num = 0;
					int num2 = base.Info.Args.Timeout ?? ((object)300000);
					while (!quit && num <= num2)
					{
						if (GetDevice(ConnectType.Fastboot) != null)
						{
							flag = true;
							break;
						}
						Thread.Sleep(1000);
						num += 1000;
					}
					base.Recipe.UcDevice.MessageBox.Close(true);
					if (quit)
					{
						break;
					}
					if (!flag)
					{
						string text = "Fastboot device isn't find!";
						bool flag2 = PrintDevStatus();
						if (flag2)
						{
							text += " will install driver";
						}
						base.Log.AddLog(text, upload: true);
						if (Retry > 0 && flag2)
						{
							string output = string.Empty;
							DriversHelper.CheckAndInstallInfDriver(DriverType.MTK, null, out output);
						}
						if (Retry > 0 && base.Info.Args.RetryText != null)
						{
							base.Recipe.UcDevice.MessageBox.Show(base.Info.Name, base.Info.Args.RetryText.ToString()).Wait();
						}
					}
				}
				while (!flag && Retry-- > 0);
			}
			if (quit)
			{
				base.Log.AddResult(this, Result.MANUAL_QUIT, "customer closes the connection pop-up window");
			}
			else if (!flag)
			{
				base.Log.AddResult(this, Result.FAILED, "Fastboot device isn't find!");
			}
			else
			{
				base.Log.AddResult(this, Result.PASSED);
			}
		}

		private void ShowConnectMessagebox()
		{
			if (base.Info.Args.ConnectTutorials is JObject jObject && jObject.Value<JArray>("Steps") != null)
			{
				string title = jObject.Value<string>("Title");
				JArray steps = jObject.Value<JArray>("Steps");
				bool autoPlay = jObject.Value<bool>("AutoPlay");
				double interval = jObject.Value<double>("Interval");
				string noteText = jObject.Value<string>("NoteText");
				LogHelper.LogInstance.Debug("Args.ConnectTutorials.Steps will show");
				Task.Run(delegate
				{
					if (!base.Recipe.UcDevice.MessageBox.AutoCloseConnectTutorials(title, steps, -1, autoPlay, interval, showPlayControl: true, showClose: true, popupWhenClose: true, noteText).HasValue)
					{
						quit = true;
					}
				});
			}
			else if (base.Info.Args.ConnectSteps != null)
			{
				ConnectStepInfo _connectStep = new ConnectStepInfo
				{
					NoteText = base.Info.Args.ConnectSteps.NoteText?.ToString(),
					RetryText = base.Info.Args.ConnectSteps.RetryText?.ToString(),
					WidthRatio = (base.Info.Args.ConnectSteps.WidthRatio?.ToString() ?? "1:2:2")
				};
				Task.Run(delegate
				{
					List<ConnectSteps> list = new List<ConnectSteps>();
					foreach (dynamic item in base.Info.Args.ConnectSteps.Steps)
					{
						list.Add(new ConnectSteps
						{
							StepImage = item.Image.ToString(),
							StepContent = item.Content.ToString()
						});
					}
					_connectStep.Steps = list;
					if (!base.Recipe.UcDevice.MessageBox.AutoCloseMoreStep(base.Name, _connectStep, -1, popupWhenClose: true).HasValue)
					{
						quit = true;
					}
				});
			}
			else
			{
				if (!((base.Info.Args.PromptText != null) ? true : false))
				{
					return;
				}
				Task.Run(delegate
				{
					dynamic val = base.Info.Args.Image?.ToString();
					dynamic val2 = base.Info.Args.PromptText.ToString();
					if (base.Recipe.UcDevice.MessageBox.AutoClose(base.Name, val2, val, showClose: true, popupWhenClose: true) == null)
					{
						quit = true;
					}
				});
			}
		}

		private bool PrintDevStatus()
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			bool result = false;
			ManagementObjectCollection obj = new ManagementObjectSearcher("Select * From Win32_PnPEntity where service='WinUSB' or Status='ERROR'").Get();
			List<string> list = new List<string>();
			ManagementObjectEnumerator enumerator = obj.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					ManagementBaseObject current = enumerator.Current;
					string text = current.GetPropertyValue("Status") as string;
					string value = current.GetPropertyValue("Service") as string;
					if (!text.Equals("ERROR", StringComparison.CurrentCultureIgnoreCase) || string.IsNullOrEmpty(value))
					{
						list.Add(string.Format("Name: {0}\t  Status: {1}", current.GetPropertyValue("Name"), text));
					}
				}
			}
			finally
			{
				((IDisposable)enumerator)?.Dispose();
			}
			string output = string.Empty;
			if (list.Exists((string n) => n.Equals("Name: Android\t  Status: Error", StringComparison.CurrentCultureIgnoreCase)) || (list.Exists((string n) => n.Equals("Name: \t  Status: Error", StringComparison.CurrentCultureIgnoreCase)) && !DriversHelper.CheckAndInstallInfDriver(DriverType.MTK, null, out output)))
			{
				result = true;
			}
			if (base.Info.Args.Print == true && list.Count > 0)
			{
				base.Log.AddLog("::::::::::::::::::::::::::Detect device status:::::::::::::::::::::::::::::::::", upload: true);
				base.Log.AddLog(string.Join("\n", list), upload: true);
				base.Log.AddLog(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::", upload: true);
			}
			return result;
		}
	}
}
namespace lenovo.mbg.service.framework.smartdevice.ODMSocketServer
{
	public class Convert
	{
		public static string ToString(string name, IEnumerable<KeyValuePair<string, object>> fields)
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
	}
	public class DataSigningODMService : RestService
	{
		public struct DataSigningODMInput
		{
			public string NewImei { get; private set; }

			public string MascId { get; private set; }

			public string ClientIp { get; private set; }

			public string ClientReqType { get; private set; }

			public string RsdLogId { get; private set; }

			public string ProdId { get; private set; }

			public string KeyType { get; private set; }

			public string KeyName { get; private set; }

			public string Data { get; private set; }

			public dynamic Fields
			{
				get
				{
					dynamic val = new ExpandoObject();
					val.newIMEI = NewImei;
					val.mascid = MascId;
					val.clientIP = ClientIp;
					val.clientReqType = ClientReqType;
					val.rsd_log_id = RsdLogId;
					val.prod_id = ProdId;
					val.type = KeyType;
					val.keyname = KeyName;
					val.data = Data;
					IDictionary<string, object> dictionary = val;
					foreach (string item in new List<string>(dictionary.Keys))
					{
						if (dictionary[item] == null)
						{
							dictionary.Remove(item);
						}
					}
					return val;
				}
			}

			public DataSigningODMInput(string newImei, string mascId, string clientIp, string clientReqType, string rsdLogId, string prodId, string keyType, string keyName, string data)
			{
				this = default(DataSigningODMInput);
				NewImei = newImei;
				MascId = mascId;
				ClientIp = clientIp;
				ClientReqType = clientReqType;
				RsdLogId = rsdLogId;
				ProdId = prodId;
				KeyType = keyType;
				KeyName = keyName;
				Data = data;
			}

			public override string ToString()
			{
				Dictionary<string, object> dictionary = new Dictionary<string, object>();
				foreach (KeyValuePair<string, object> item in (IDictionary<string, object>)Fields)
				{
					dictionary[item.Key] = item.Value.ToString();
				}
				return Convert.ToString(GetType().Name, dictionary.ToList());
			}

			public override bool Equals(object obj)
			{
				return ToString().Equals(obj.ToString());
			}

			public override int GetHashCode()
			{
				return ToString().GetHashCode();
			}
		}

		public struct DataSigningODMOutput
		{
			private string TAG => GetType().FullName;

			public string ResponseCode { get; private set; }

			public string ResponseMessage { get; private set; }

			public string ReturnedData { get; private set; }

			public DataSigningODMOutput(string responseCode, string responseMessage, string returnedData)
			{
				this = default(DataSigningODMOutput);
				ResponseCode = responseCode;
				ResponseMessage = responseMessage;
				ReturnedData = returnedData;
			}

			public static DataSigningODMOutput FromDictionary(dynamic fields)
			{
				string responseCode = fields.responseCode;
				string responseMessage = fields.responseMsg;
				string returnedData = fields.msg;
				return new DataSigningODMOutput(responseCode, responseMessage, returnedData);
			}

			public override string ToString()
			{
				Dictionary<string, object> dictionary = new Dictionary<string, object>();
				dictionary["ResponseCode"] = ResponseCode;
				dictionary["ResponseMessage"] = ResponseMessage;
				dictionary["ReturnedData"] = ReturnedData;
				return Convert.ToString(GetType().Name, dictionary.ToList());
			}

			public override bool Equals(object obj)
			{
				return ToString().Equals(obj.ToString());
			}

			public override int GetHashCode()
			{
				return ToString().GetHashCode();
			}
		}

		protected override NetworkCredential Credential => new NetworkCredential(Login.UserName, Login.Password);

		public DataSigningODMService()
		{
			base.Url = "https://ebiz-esb.cloud.motorola.net/callsimunlockservice";
		}

		public override dynamic Invoke(dynamic request)
		{
			return SendRequest(request);
		}

		public DataSigningODMOutput SignData(DataSigningODMInput input)
		{
			LogHelper.LogInstance.Debug("Contacting DataSigningODMService");
			LogHelper.LogInstance.Debug("UserName: " + Login.UserName + ", Password: " + Login.Password);
			LogHelper.LogInstance.Debug(JsonHelper.SerializeObject2FormatJson(input.Fields));
			dynamic fields = input.Fields;
			dynamic val = Invoke(fields);
			DataSigningODMOutput result = DataSigningODMOutput.FromDictionary(val);
			LogHelper.LogInstance.Debug("DataSigningODMService request completed");
			LogHelper.LogInstance.Debug(result.ToString());
			return result;
		}
	}
	public class ODMServerMain
	{
		public struct InputParameters
		{
			public string siteId;

			public string siteUrl;

			public string serialNumber;

			public string logId;

			public string prodId;

			public string keyType;

			public string keyName;

			public string clientReqType;

			public string userName;

			public string password;

			public string mascId;

			public string tokenconnectpath;
		}

		private static InputParameters inputParameters = default(InputParameters);

		private static Socket serverSocket;

		private static readonly List<Socket> clientSockets = new List<Socket>();

		private const int BUFFER_SIZE = 2048;

		private const int PORT = 5000;

		private static readonly byte[] buffer = new byte[2048];

		public static void InitParams(string username, string password, string imei)
		{
			inputParameters.userName = username;
			inputParameters.password = password;
			inputParameters.siteId = "RSA";
			inputParameters.siteUrl = "RSA";
			inputParameters.serialNumber = imei;
			inputParameters.logId = "91C44564934F4E96A1533641D2694B38";
			inputParameters.prodId = "M6102";
			inputParameters.keyType = "23";
			inputParameters.keyName = "1";
			inputParameters.clientReqType = "0x00";
			inputParameters.mascId = "GC-7777777-TEST-190";
		}

		public static void StartServer()
		{
			LogHelper.LogInstance.Debug("Start ODMSocketServer");
			try
			{
				SetupServer();
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Error("Start ODMSocketServer error: " + Environment.NewLine + ex.Message + Environment.NewLine + ex.StackTrace);
			}
		}

		private static void SetupServer()
		{
			LogHelper.LogInstance.Debug("Setting up server...");
			serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
			serverSocket.Bind(new IPEndPoint(IPAddress.Parse("127.0.0.1"), 5000));
			serverSocket.Listen(100);
			serverSocket.BeginAccept(AcceptCallback, null);
			LogHelper.LogInstance.Debug("Server started.....");
		}

		public static void CloseAllSockets()
		{
			if (serverSocket == null)
			{
				return;
			}
			foreach (Socket clientSocket in clientSockets)
			{
				try
				{
					clientSocket.Shutdown(SocketShutdown.Both);
					clientSocket.Close();
				}
				catch (Exception ex)
				{
					Console.WriteLine("socket shutdown error:" + ex.Message + Environment.NewLine + ex.StackTrace);
				}
			}
			serverSocket.Close();
			LogHelper.LogInstance.Debug("Close ODMSocketServer");
		}

		private static void AcceptCallback(IAsyncResult AR)
		{
			Socket socket;
			try
			{
				socket = serverSocket.EndAccept(AR);
			}
			catch (ObjectDisposedException)
			{
				return;
			}
			clientSockets.Add(socket);
			socket.BeginReceive(buffer, 0, 2048, SocketFlags.None, ReceiveCallback, socket);
			LogHelper.LogInstance.Debug("Client connected, waiting for request...");
			serverSocket.BeginAccept(AcceptCallback, null);
		}

		private static void ReceiveCallback(IAsyncResult AR)
		{
			_ = MethodBase.GetCurrentMethod().Name;
			string sErrorMessage = string.Empty;
			Socket socket = (Socket)AR.AsyncState;
			int num;
			try
			{
				num = socket.EndReceive(AR);
			}
			catch (SocketException)
			{
				LogHelper.LogInstance.Debug("Client forcefully disconnected");
				socket.Close();
				clientSockets.Remove(socket);
				return;
			}
			byte[] array = new byte[num];
			Array.Copy(buffer, array, num);
			string text = Encoding.ASCII.GetString(array);
			LogHelper.LogInstance.Debug(text);
			string text2 = text.Substring(0, 2);
			string text3 = CustomConvert.Instance.ByteArrayToString(array);
			if (text3 == "IsRunning")
			{
				byte[] array2 = CustomConvert.Instance.StringToByteArray("0");
				socket.Send(array2);
			}
			string text4 = text3.Substring(4);
			LogHelper.LogInstance.Debug("Get type: " + text2);
			LogHelper.LogInstance.Debug("Received Phone Hash: " + text4);
			try
			{
				string text5 = signDataCollectPenang(inputParameters.serialNumber, inputParameters.logId, inputParameters.prodId, text2, inputParameters.keyName, inputParameters.clientReqType, text4, inputParameters.userName, inputParameters.password, inputParameters.mascId, out sErrorMessage);
				LogHelper.LogInstance.Debug("GPS Signed Hash: " + text5);
				byte[] array3 = CustomConvert.Instance.StringToByteArray(text5);
				Array.Resize(ref array3, 512);
				socket.Send(array3);
				LogHelper.LogInstance.Debug("Signed HASH sent to SLA_Challenge");
			}
			catch
			{
				LogHelper.LogInstance.Debug("GPS Sign FAILED " + sErrorMessage);
			}
		}

		private static string signDataCollectPenang(string serialNumber, string logId, string prodId, string keyType, string keyName, string clientReqType, string hash, string username, string password, string mascid, out string sErrorMessage)
		{
			_ = MethodBase.GetCurrentMethod().Name;
			sErrorMessage = string.Empty;
			LogHelper.LogInstance.Debug("Start to do DataSignODM:" + hash);
			string text = string.Empty;
			bool flag = true;
			for (int i = 0; i < 3; i++)
			{
				try
				{
					LogHelper.LogInstance.Debug("Before DataSignODM...");
					text = Web.DataSignODM(serialNumber, logId, clientReqType, prodId, keyType, keyName, hash, username, password, mascid);
				}
				catch (Exception ex)
				{
					sErrorMessage = ex.Message + Environment.NewLine + ex.StackTrace;
					LogHelper.LogInstance.Debug(sErrorMessage);
					Thread.Sleep(500);
					flag = false;
				}
				if (flag)
				{
					break;
				}
			}
			return text.ToLower();
		}
	}
	public class WebClientTimeout : WebClient
	{
		public TimeSpan Timeout { get; set; } = TimeSpan.FromSeconds(100.0);

		protected override WebRequest GetWebRequest(Uri uri)
		{
			WebRequest webRequest = base.GetWebRequest(uri);
			webRequest.Timeout = (int)Timeout.TotalMilliseconds;
			return webRequest;
		}
	}
	public abstract class RestService : WebService
	{
		private string TAG => GetType().FullName;

		public TimeSpan Timeout { get; protected set; } = TimeSpan.FromSeconds(100.0);

		protected virtual string BasicAuthentication => null;

		public string OAuth { get; set; }

		protected abstract NetworkCredential Credential { get; }

		protected dynamic SendContent(string input, string contentType)
		{
			using WebClientTimeout webClientTimeout = new WebClientTimeout();
			webClientTimeout.Timeout = Timeout;
			if (BasicAuthentication == null)
			{
				webClientTimeout.Credentials = Credential;
			}
			else
			{
				webClientTimeout.Headers[HttpRequestHeader.Authorization] = BasicAuthentication;
			}
			SentRequest(input);
			webClientTimeout.Headers[HttpRequestHeader.ContentType] = contentType;
			string text = webClientTimeout.UploadString(base.Url, "POST", input);
			ReceivedReply(text);
			return ParseResponse(text);
		}

		protected dynamic SendRequest(dynamic input)
		{
			string input2 = JsonConvert.SerializeObject(input, Formatting.Indented);
			return SendContent(input2, "application/json");
		}

		protected dynamic SendForm(dynamic input)
		{
			string text = string.Empty;
			foreach (dynamic item in input)
			{
				if (text != string.Empty)
				{
					text += "&";
				}
				string arg = item.Key.ToString();
				string arg2 = item.Value.ToString();
				text += $"{arg}={arg2}";
			}
			return SendContent(text, "application/x-www-form-urlencoded");
		}

		protected dynamic SendGet(string urlArgs)
		{
			using WebClientTimeout webClientTimeout = new WebClientTimeout();
			webClientTimeout.Timeout = Timeout;
			webClientTimeout.Credentials = Credential;
			SentRequest(urlArgs);
			string text = webClientTimeout.DownloadString(base.Url + urlArgs);
			ReceivedReply(text);
			return ParseResponse(text);
		}

		protected dynamic ParseResponse(string responseContent)
		{
			return JsonConvert.DeserializeObject(responseContent);
		}
	}
	public class Web
	{
		private static DataSigningODMService dataSignOdm = new DataSigningODMService();

		public static string DataSignODM(string newImei, string logId, string clientReqType, string prodId, string keyType, string keyName, string data, string usename, string password, string mascId)
		{
			dataSignOdm.Login = new Login(usename, password);
			string clientIp = "99.99.99.99";
			DataSigningODMService.DataSigningODMInput input = new DataSigningODMService.DataSigningODMInput(newImei, mascId, clientIp, clientReqType, logId, prodId, keyType, keyName, data);
			DataSigningODMService.DataSigningODMOutput dataSigningODMOutput = dataSignOdm.SignData(input);
			if (dataSigningODMOutput.ResponseCode != "0")
			{
				throw new WebException($"Invalid response code '{dataSigningODMOutput.ResponseCode}' from ODM Data Signing service: {dataSigningODMOutput.ResponseMessage}");
			}
			return dataSigningODMOutput.ReturnedData;
		}
	}
	[StructLayout(LayoutKind.Sequential, Size = 1)]
	public struct Login
	{
		public static string UserName { get; set; }

		public static string Password { get; set; }

		public static Login Default => new Login(string.Empty, string.Empty);

		public Login(string userName, string password)
		{
			UserName = userName;
			Password = password;
		}
	}
	public abstract class WebService
	{
		private string TAG => GetType().FullName;

		public string Url { get; set; }

		public Login Login { get; set; }

		public abstract dynamic Invoke(dynamic request);

		protected void SentRequest(string request)
		{
			foreach (string item in new List<string> { "<d3p1:id>", "<d3p1:pw>" })
			{
				int num = request.IndexOf(item);
				if (num >= 0)
				{
					int startIndex = request.IndexOf('<', num + item.Length);
					request = request.Substring(0, num + item.Length) + "********" + request.Substring(startIndex);
				}
			}
			string arg = $"{GetType().Name} request";
			LogHelper.LogInstance.Debug("Sent request to " + Url);
			LogHelper.LogInstance.Debug($"{arg} sent:\n{request}");
		}

		protected void ReceivedReply(string reply)
		{
			string arg = $"{GetType().Name} reply";
			LogHelper.LogInstance.Debug("Received reply from " + Url);
			LogHelper.LogInstance.Debug($"{arg} received:\n{reply}");
		}
	}
}
