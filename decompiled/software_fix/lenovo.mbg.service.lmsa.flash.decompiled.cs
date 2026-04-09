using System;
using System.CodeDom.Compiler;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
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
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
using System.Xml;
using GoogleAnalytics;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
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
using lenovo.mbg.service.framework.services.Download;
using lenovo.mbg.service.framework.services.Model;
using lenovo.mbg.service.framework.smartdevice;
using lenovo.mbg.service.framework.smartdevice.Steps;
using lenovo.mbg.service.framework.socket;
using lenovo.mbg.service.lmsa.flash.Common;
using lenovo.mbg.service.lmsa.flash.ModelV6;
using lenovo.mbg.service.lmsa.flash.Tutorials;
using lenovo.mbg.service.lmsa.flash.Tutorials.Model;
using lenovo.mbg.service.lmsa.flash.Tutorials.RescueTutorials;
using lenovo.mbg.service.lmsa.flash.Tutorials.Resources;
using lenovo.mbg.service.lmsa.flash.UserModelV2;
using lenovo.mbg.service.lmsa.flash.ViewV6;
using lenovo.mbg.service.lmsa.flash.ViewV6.Dialog;
using lenovo.mbg.service.lmsa.hostproxy;
using lenovo.themes.generic;
using lenovo.themes.generic.AttachedProperty;
using lenovo.themes.generic.Controls;
using lenovo.themes.generic.ControlsV6;
using lenovo.themes.generic.ModelV6;
using lenovo.themes.generic.ViewModelV6;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.lmsa.flash")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("8ab04aa975e34f1ca4f9dc3a81374e2c")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: InternalsVisibleTo("lenovo.mbg.service.common.utilities")]
[assembly: ComVisible(false)]
[assembly: ThemeInfo(/*Could not decode attribute arguments.*/)]
[assembly: AssemblyFileVersion("7.5.5.19")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("7.5.5.19")]
namespace lenovo.mbg.service.lmsa.flash
{
	[PluginExport(typeof(IPlugin), "8ab04aa975e34f1ca4f9dc3a81374e2c")]
	public class Plugin : PluginBase
	{
		protected List<PageIndex> list = new List<PageIndex>
		{
			PageIndex.RESCUE_HOME,
			PageIndex.PHONE_ENTRANCE,
			PageIndex.PHONE_SEARCH,
			PageIndex.TABLET_ENTRANCE,
			PageIndex.TABLET_SEARCH,
			PageIndex.SMART_SEARCH
		};

		public static Tracker Tracker => HostProxy.GoogleAnalyticsTracker.Tracker;

		public static bool IsRescuePlugin => HostProxy.HostNavigation.CurrentPluginID == "8ab04aa975e34f1ca4f9dc3a81374e2c";

		public static bool IsExecuteRescueWork { get; set; }

		public static bool SupportMulti { get; set; }

		public static IMessageBox IMsgManager { get; private set; }

		public static void OperateTracker(string operate, string description)
		{
			LogHelper.LogInstance.Info(description, false);
			try
			{
				((SimpleTracker)Tracker).Send(HitBuilder.CreateCustomEvent("lmsa-plugin-flash", operate, description, 0L).Build());
			}
			catch
			{
			}
		}

		public static void ShowMutilIcon()
		{
			IMsgManager.ShowMutilIcon(HostProxy.HostNavigation.CurrentPluginID == "8ab04aa975e34f1ca4f9dc3a81374e2c" && MainFrameV6.Instance.CurrentPageIndex == PageIndex.RESCUE_FLASH, HostProxy.HostNavigation.CurrentPluginID != "8ab04aa975e34f1ca4f9dc3a81374e2c");
		}

		public override void Init()
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Unknown result type (might be due to invalid IL or missing references)
			//IL_0068: Expected O, but got Unknown
			SupportMulti = HostProxy.User.user.IsB2BSupportMultDev;
			Application.Current.Resources.MergedDictionaries.Add(new ResourceDictionary
			{
				Source = new Uri("/lenovo.mbg.service.lmsa.flash;component/UserResources/Style.xaml", UriKind.Relative)
			});
			Application.Current.Resources.MergedDictionaries.Add(new ResourceDictionary
			{
				Source = new Uri("/lenovo.mbg.service.lmsa.flash;component/Themes/Generic.xaml", UriKind.Relative)
			});
			FlashContext.SingleInstance.Initialize();
		}

		public override FrameworkElement CreateControl(IMessageBox iMessage)
		{
			Adorners.CurrentDispatcher = Dispatcher.CurrentDispatcher;
			IMsgManager = iMessage;
			return (FrameworkElement)(object)new MainFrameV6();
		}

		public override void Dispose()
		{
			((PluginBase)this).Dispose();
		}

		public override bool CanClose()
		{
			return false;
		}

		public override bool IsExecuteWork()
		{
			return IsExecuteRescueWork;
		}

		public override void OnInit(object data)
		{
			((PluginBase)this).OnInit(data);
			ShowMutilIcon();
			if (data is Dictionary<string, string>)
			{
				Dictionary<string, string> dictionary = data as Dictionary<string, string>;
				LogHelper.LogInstance.Info(string.Format("Rescue plugin init by Download center resource, category is {0}", dictionary?.ContainsKey("category")), false);
				PageIndex index = PageIndex.PHONE_MANUAL;
				if (dictionary.ContainsKey("category"))
				{
					if (dictionary["category"] == $"{DevCategory.Tablet}")
					{
						index = PageIndex.TABLET_MANUAL;
					}
					else if (dictionary["category"] == $"{DevCategory.Smart}")
					{
						index = PageIndex.SMART_MANUAL;
					}
				}
				MainFrameV6.Instance.ChangeView(index, dictionary);
				return;
			}
			string text = data as string;
			switch (text)
			{
			case "mydevicerescue":
				LogHelper.LogInstance.Info("match device when switch to Rescue plugin", false);
				MainFrameV6.Instance.AutoMatch(HostProxy.deviceManager.MasterDevice, jumpToMatchView: true);
				break;
			case "RESCUE_HOME":
			case "PHONE_ENTRANCE":
			case "TABLET_ENTRANCE":
				MainFrameV6.Instance.ChangeView((PageIndex)Enum.Parse(typeof(PageIndex), text));
				break;
			case null:
				if (data is PageIndex index2)
				{
					MainFrameV6.Instance.ChangeView(index2);
				}
				break;
			}
		}

		public override bool IsNonBusinessPage()
		{
			return list.Contains(MainFrameV6.Instance.CurrentPageIndex);
		}
	}
}
namespace lenovo.mbg.service.lmsa.flash.Properties
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
					resourceMan = new ResourceManager("lenovo.mbg.service.lmsa.flash.Properties.Resources", typeof(Resources).Assembly);
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
namespace lenovo.mbg.service.lmsa.flash.ViewV6
{
	public interface IAMatchView
	{
		AutoMatchViewModel VM { get; }

		FrameworkElement ParentView { get; }

		FrameworkElement RescueView { get; set; }

		void Init(AutoMatchResource data, object wModel, FrameworkElement parentView);
	}
	public class MainFrameV6 : UserControl, IComponentConnector
	{
		public readonly List<string> FastbootErrorStatusArr = new List<string> { "0x00FF", "0x00ff", "0xDEAD", "0xdead" };

		protected WarrantyService warrantyService = new WarrantyService();

		protected PageIndex currentPageIndex;

		private readonly Dictionary<string, int> _FastbootDevUnMatchArr;

		private static long autoMatchLock;

		internal Border containerBorder;

		internal ContentPresenter container;

		internal Border BottomBorder;

		internal Border expand;

		internal Border devicelist;

		private bool _contentLoaded;

		public string RomMatchId { get; set; }

		public MainFrameViewModeV6 VM { get; private set; }

		public IMessageBox IMsgManager => Plugin.IMsgManager;

		public static MainFrameV6 Instance { get; private set; }

		public bool SupportMulti => Plugin.SupportMulti;

		public PageIndex CurrentPageIndex
		{
			get
			{
				return currentPageIndex;
			}
			protected set
			{
				currentPageIndex = value;
				HostProxy.HostNavigation.CurrentPage = currentPageIndex;
				HostProxy.GlobalCache.AddOrUpdate("RESUCE_FLASH", (object)(currentPageIndex == PageIndex.RESCUE_FLASH));
				Plugin.ShowMutilIcon();
			}
		}

		public List<IAMatchView> RescueViews { get; set; }

		public static bool InalidViewIsShow { get; set; }

		public MainFrameV6()
		{
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_0090: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Expected O, but got Unknown
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Expected O, but got Unknown
			InitializeComponent();
			Instance = this;
			_FastbootDevUnMatchArr = new Dictionary<string, int>();
			RescueViews = new List<IAMatchView>();
			VM = new MainFrameViewModeV6();
			((FrameworkElement)this).DataContext = VM;
			CurrentPageIndex = PageIndex.RESCUE_HOME;
			((FrameworkElement)this).Loaded += new RoutedEventHandler(OnLoaded);
			((FrameworkElement)this).Unloaded += new RoutedEventHandler(OnUnloaded);
			GlobalCmdHelper.Instance.ReadDevieInfoCallback = delegate(bool success)
			{
				if (!success && CurrentPageIndex == PageIndex.PHONE_ENTRANCE)
				{
					CloseGifGuideSteps();
					if (!InalidViewIsShow)
					{
						InalidViewIsShow = true;
						InvalidView win = null;
						((DispatcherObject)this).Dispatcher.Invoke<InvalidView>((Func<InvalidView>)(() => win = new InvalidView(DevCategory.Phone, 2)));
						if (Interlocked.Read(in autoMatchLock) == 0L && MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)win, (bool?)true).Result == true)
						{
							ChangeView(win.IsManualModel ? PageIndex.PHONE_MANUAL : PageIndex.PHONE_SEARCH);
						}
						InalidViewIsShow = false;
					}
				}
			};
		}

		private void OnLoaded(object sender, RoutedEventArgs e)
		{
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Invalid comparison between Unknown and I4
			Thread.Sleep(1000);
			if (HostProxy.deviceManager.MasterDevice != null && (int)HostProxy.deviceManager.MasterDevice.SoftStatus == 2)
			{
				if (CurrentPageIndex == PageIndex.RESCUE_FLASH)
				{
					if ((HostProxy.deviceManager.MasterDevice.Property.Category ?? "phone") == "phone")
					{
						ChangeView(PageIndex.PHONE_ENTRANCE);
					}
					else
					{
						ChangeView(PageIndex.RESCUE_HOME);
					}
				}
				AutoMatch(HostProxy.deviceManager.MasterDevice, jumpToMatchView: true);
			}
			HostProxy.deviceManager.Connecte += OnDevConnecte;
			HostProxy.deviceManager.DisConnecte += OnDisConnecte;
		}

		private void OnUnloaded(object sender, RoutedEventArgs e)
		{
			HostProxy.deviceManager.Connecte -= OnDevConnecte;
			HostProxy.deviceManager.DisConnecte -= OnDisConnecte;
		}

		public void ChangeView(PageIndex index, Dictionary<string, string> condition = null)
		{
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				CurrentPageIndex = index;
				ChangeMutilDeviceShowType(CurrentPageIndex == PageIndex.RESCUE_FLASH && SupportMulti);
				switch (index)
				{
				case PageIndex.PHONE_SEARCH:
				{
					FrameworkElement val = null;
					if (!SupportMulti)
					{
						if (!VM.PageViewArr.ContainsKey(index))
						{
							val = (FrameworkElement)(object)new PhoneQueryViewV6();
							VM.PageViewArr.Add(index, val);
						}
						else
						{
							val = VM.PageViewArr[index];
						}
					}
					else
					{
						val = (FrameworkElement)(object)new PhoneQueryViewV6();
					}
					VM.CurrentView = val;
					ChangeFooter(phoneHost: false);
					break;
				}
				case PageIndex.PHONE_MANUAL:
				{
					PhoneMMatchViewV6 phoneMMatchViewV = null;
					if (!SupportMulti)
					{
						if (!VM.PageViewArr.ContainsKey(index))
						{
							phoneMMatchViewV = new PhoneMMatchViewV6();
							VM.PageViewArr.Add(index, (FrameworkElement)(object)phoneMMatchViewV);
						}
						else
						{
							phoneMMatchViewV = VM.PageViewArr[index] as PhoneMMatchViewV6;
						}
					}
					else
					{
						phoneMMatchViewV = new PhoneMMatchViewV6();
					}
					VM.CurrentView = (FrameworkElement)(object)phoneMMatchViewV;
					ChangeFooter(phoneHost: false);
					if (condition != null && condition.ContainsKey("modelName"))
					{
						phoneMMatchViewV.VM.MatchFromDownloadCenter(condition);
					}
					break;
				}
				case PageIndex.PHONE_ENTRANCE:
				{
					if (!VM.PageViewArr.ContainsKey(index))
					{
						VM.PageViewArr.Add(index, (FrameworkElement)(object)new PhoneEntranceViewV6());
					}
					PhoneEntranceViewV6 phoneEntranceViewV = VM.PageViewArr[index] as PhoneEntranceViewV6;
					phoneEntranceViewV.UpdateGridLayout();
					VM.CurrentView = (FrameworkElement)(object)phoneEntranceViewV;
					ChangeFooter(phoneHost: true);
					break;
				}
				case PageIndex.TABLET_ENTRANCE:
				{
					if (!VM.PageViewArr.ContainsKey(index))
					{
						VM.PageViewArr.Add(index, (FrameworkElement)(object)new TabletEntranceViewV6());
					}
					TabletEntranceViewV6 currentView = VM.PageViewArr[index] as TabletEntranceViewV6;
					VM.CurrentView = (FrameworkElement)(object)currentView;
					ChangeFooter(phoneHost: true);
					break;
				}
				case PageIndex.TABLET_SEARCH:
					if (!VM.PageViewArr.ContainsKey(index))
					{
						VM.PageViewArr.Add(index, (FrameworkElement)(object)new TabletQMatchViewV6());
					}
					VM.CurrentView = VM.PageViewArr[index];
					ChangeFooter(phoneHost: false);
					break;
				case PageIndex.TABLET_MANUAL:
				{
					if (!VM.PageViewArr.ContainsKey(index))
					{
						VM.PageViewArr.Add(index, (FrameworkElement)(object)new TabletMMatchViewV6());
					}
					TabletMMatchViewV6 tabletMMatchViewV = VM.PageViewArr[index] as TabletMMatchViewV6;
					VM.CurrentView = (FrameworkElement)(object)tabletMMatchViewV;
					ChangeFooter(phoneHost: false);
					if (condition != null && condition.ContainsKey("modelName"))
					{
						tabletMMatchViewV.VM.MatchFromDownloadCenter(condition);
					}
					break;
				}
				case PageIndex.SMART_SEARCH:
					if (!VM.PageViewArr.ContainsKey(index))
					{
						VM.PageViewArr.Add(index, (FrameworkElement)(object)new SmartQMatchViewV6());
					}
					VM.CurrentView = VM.PageViewArr[index];
					ChangeFooter(phoneHost: false);
					break;
				case PageIndex.SMART_MANUAL:
				{
					if (!VM.PageViewArr.ContainsKey(index))
					{
						VM.PageViewArr.Add(index, (FrameworkElement)(object)new SmartMMatchViewV6());
					}
					SmartMMatchViewV6 smartMMatchViewV = VM.PageViewArr[index] as SmartMMatchViewV6;
					VM.CurrentView = (FrameworkElement)(object)smartMMatchViewV;
					ChangeFooter(phoneHost: false);
					if (condition != null && condition.ContainsKey("modelName"))
					{
						smartMMatchViewV.VM.MatchFromDownloadCenter(condition);
					}
					break;
				}
				case PageIndex.RESCUE_HOME:
					VM.FooterVisible = (Visibility)2;
					VM.CurrentView = VM.PageViewArr[index];
					break;
				case PageIndex.RESCUE_FLASH:
				{
					IAMatchView view = VM.Devices.First((DeviceViewModel n) => n.IsSelected).View;
					VM.CurrentView = (FrameworkElement)(((object)view.RescueView) ?? ((object)((view is FrameworkElement) ? view : null)));
					ChangeFooter(phoneHost: false);
					break;
				}
				case PageIndex.TABLET_AUTO:
				case PageIndex.SMART_AUTO:
					break;
				}
			});
		}

		public void JumptoRescueView(DevCategory category, AutoMatchResource data, object wModel = null, FrameworkElement parentView = null, bool jumpToMatchView = false)
		{
			((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
			{
				LogHelper.LogInstance.Info($"Category:[{category}] Device Info:[{JsonHelper.SerializeObject2Json((object)data.deviceInfo)}].", false);
				LogHelper.LogInstance.Info($"jumpToMatchView: {jumpToMatchView}, Match info:[{data.matchInfo}].", false);
				if (category == DevCategory.Phone)
				{
					IAMatchView iAMatchView = VM.InitPhoneMatchView(data, wModel, parentView, jumpToMatchView);
					if (iAMatchView != null)
					{
						CurrentPageIndex = PageIndex.RESCUE_FLASH;
						VM.CurrentView = (FrameworkElement)(((object)iAMatchView.RescueView) ?? ((object)((iAMatchView is FrameworkElement) ? iAMatchView : null)));
						ChangeMutilDeviceShowType(SupportMulti);
					}
				}
				else
				{
					FrameworkElement val = null;
					bool flag = false;
					if (category == DevCategory.Tablet)
					{
						if (!VM.PageViewArr.ContainsKey(PageIndex.TABLET_AUTO))
						{
							flag = true;
							VM.PageViewArr.Add(PageIndex.TABLET_AUTO, (FrameworkElement)(object)new TabletAMatchViewV6());
						}
						val = VM.PageViewArr[PageIndex.TABLET_AUTO];
					}
					else
					{
						if (!VM.PageViewArr.ContainsKey(PageIndex.SMART_AUTO))
						{
							flag = true;
							VM.PageViewArr.Add(PageIndex.SMART_AUTO, (FrameworkElement)(object)new SmartAMatchViewV6());
						}
						val = VM.PageViewArr[PageIndex.SMART_AUTO];
					}
					(val as IAMatchView).Init(data, wModel, parentView);
					CurrentPageIndex = PageIndex.RESCUE_FLASH;
					VM.CurrentView = val;
					if (flag)
					{
						RescueViews.Add(val as IAMatchView);
					}
					ChangeMutilDeviceShowType(mutil: false);
				}
				ChangeFooter(phoneHost: false);
			});
		}

		public void BacktoView()
		{
			switch (CurrentPageIndex)
			{
			case PageIndex.PHONE_SEARCH:
			case PageIndex.PHONE_MANUAL:
				ChangeView(PageIndex.PHONE_ENTRANCE);
				break;
			case PageIndex.TABLET_SEARCH:
				ChangeView(PageIndex.TABLET_ENTRANCE);
				break;
			case PageIndex.RESCUE_HOME:
			case PageIndex.PHONE_ENTRANCE:
			case PageIndex.SMART_SEARCH:
				ChangeView(PageIndex.RESCUE_HOME);
				break;
			case PageIndex.RESCUE_FLASH:
				if (VM.CurrentView is IAMatchView { ParentView: null } iAMatchView)
				{
					if (iAMatchView.VM.Category == DevCategory.Phone)
					{
						ChangeView(PageIndex.PHONE_ENTRANCE);
					}
					else
					{
						ChangeView(PageIndex.RESCUE_HOME);
					}
				}
				else
				{
					FromRescueViewToPreviousView();
				}
				break;
			case PageIndex.TABLET_MANUAL:
				ChangeView(PageIndex.TABLET_SEARCH);
				break;
			case PageIndex.SMART_MANUAL:
				ChangeView(PageIndex.SMART_SEARCH);
				break;
			case PageIndex.TABLET_ENTRANCE:
				ChangeView(PageIndex.RESCUE_HOME);
				break;
			case PageIndex.TABLET_AUTO:
			case PageIndex.SMART_AUTO:
				break;
			}
		}

		public void FromRescueViewToPreviousView()
		{
			IAMatchView view = VM.CurrentView as IAMatchView;
			FormRescueSuccessViewToPrevView(view);
		}

		public void FormRescueSuccessViewToPrevView(IAMatchView view)
		{
			ChangeMutilDeviceShowType(mutil: false);
			FrameworkElement parentView = view.ParentView;
			RescueViews.Remove(view);
			if (parentView == null)
			{
				ChangeFooter(phoneHost: true);
				ChangeView((view.VM.Category == DevCategory.Phone) ? PageIndex.PHONE_ENTRANCE : PageIndex.RESCUE_HOME);
				return;
			}
			if (parentView.Tag is PageIndex pageIndex)
			{
				CurrentPageIndex = pageIndex;
			}
			else
			{
				CurrentPageIndex = PageIndex.RESCUE_HOME;
			}
			ChangeFooter(phoneHost: false);
			VM.CurrentView = parentView;
		}

		public void ChangeStatus(string id, FlashStatusV6 status)
		{
			if (CurrentPageIndex != PageIndex.RESCUE_HOME)
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					ChangeFooter(CurrentPageIndex == PageIndex.PHONE_ENTRANCE);
				});
			}
			DeviceViewModel found = VM.Devices.FirstOrDefault((DeviceViewModel n) => n.Id == id);
			if (found != null)
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					found.IsRescuing = status == FlashStatusV6.Rescuing;
					string statusKey = null;
					switch (status)
					{
					case FlashStatusV6.Ready:
						statusKey = "K1647";
						found.Status = status.ToString();
						break;
					case FlashStatusV6.PASS:
						statusKey = "K1648";
						found.Status = status.ToString();
						break;
					case FlashStatusV6.FAIL:
						statusKey = "K1649";
						found.Status = status.ToString();
						break;
					case FlashStatusV6.QUIT:
						statusKey = "K1650";
						found.Status = status.ToString();
						break;
					default:
						found.Status = null;
						break;
					}
					found.StatusKey = statusKey;
				});
			}
			ChangeHostIsEnabled(status == FlashStatusV6.Rescuing);
		}

		public void ChangeHostIsEnabled(bool rescuing)
		{
			Plugin.IsExecuteRescueWork = rescuing || VM.Devices.Count((DeviceViewModel n) => n.IsRescuing) > 0;
			IMsgManager.ChangeIsEnabled(!Plugin.IsExecuteRescueWork, "8ab04aa975e34f1ca4f9dc3a81374e2c");
		}

		public void ChangeStatusWhenStartRescue(bool rescuing, bool isPhone = false)
		{
			ChangeHostIsEnabled(rescuing);
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				if (rescuing || (Plugin.SupportMulti && isPhone))
				{
					VM.BackVisible = (Visibility)2;
				}
				else
				{
					VM.BackVisible = (Visibility)0;
				}
			});
		}

		public void RealFalshing(string id)
		{
			if (VM.Devices.FirstOrDefault((DeviceViewModel n) => n.Id == id) == null)
			{
				return;
			}
			DeviceViewModel found = VM.Devices.FirstOrDefault((DeviceViewModel n) => string.IsNullOrEmpty(n.Id));
			if (found != null)
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => found.IsEnabled = true));
			}
		}

		public bool ValidOtherCategoryRescueing(DevCategory category)
		{
			IAMatchView found = RescueViews.FirstOrDefault((IAMatchView n) => !n.VM.Category.Equals(category) && n.VM.UcDevice.Locked);
			if (found != null)
			{
				if (MessageWindowHelper.Instance.Show("K0711", "K1644", "K1645", (string)null, true, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Result == true)
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						CurrentPageIndex = PageIndex.RESCUE_FLASH;
						MainFrameViewModeV6 vM = VM;
						object obj = found.RescueView;
						if (obj == null)
						{
							IAMatchView iAMatchView = found;
							obj = ((iAMatchView is FrameworkElement) ? iAMatchView : null);
						}
						vM.CurrentView = (FrameworkElement)obj;
						ChangeFooter(phoneHost: false);
						ChangeMutilDeviceShowType(found.VM.Category == DevCategory.Phone && SupportMulti);
					});
				}
				return true;
			}
			return false;
		}

		public void ChangeMutilDeviceShowType(bool mutil)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Invalid comparison between Unknown and I4
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Invalid comparison between Unknown and I4
			if (mutil)
			{
				if ((int)((UIElement)expand).Visibility == 2 && (int)((UIElement)devicelist).Visibility == 2)
				{
					((UIElement)expand).Visibility = (Visibility)2;
					((UIElement)devicelist).Visibility = (Visibility)0;
				}
				((FrameworkElement)container).HorizontalAlignment = (HorizontalAlignment)(!(VM.CurrentView is IAMatchView));
				Border obj = containerBorder;
				object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_SubThemeBrushKey");
				obj.Background = (Brush)((obj2 is SolidColorBrush) ? obj2 : null);
			}
			else
			{
				((UIElement)expand).Visibility = (Visibility)2;
				((UIElement)devicelist).Visibility = (Visibility)2;
				((FrameworkElement)container).HorizontalAlignment = (HorizontalAlignment)1;
				Border obj3 = containerBorder;
				object obj4 = ((FrameworkElement)this).TryFindResource((object)"V6_SubThemeBrushKey");
				obj3.Background = (Brush)((obj4 is SolidColorBrush) ? obj4 : null);
			}
		}

		public void ChangeContainerHorizontalAlignment(bool falshing = false)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				//IL_0020: Unknown result type (might be due to invalid IL or missing references)
				if (SupportMulti)
				{
					if (!falshing && (int)((UIElement)devicelist).Visibility == 0)
					{
						((FrameworkElement)container).HorizontalAlignment = (HorizontalAlignment)0;
					}
					else
					{
						((FrameworkElement)container).HorizontalAlignment = (HorizontalAlignment)1;
					}
				}
			});
		}

		public void RemoveDevice(string id, bool forcerRemove = false)
		{
			DeviceViewModel found = VM.Devices.FirstOrDefault((DeviceViewModel n) => n.Id == id);
			if (found == null && id.Contains("#"))
			{
				found = VM.Devices.FirstOrDefault((DeviceViewModel n) => n.Id.Substring(n.Id.IndexOf('#') + 1) == id.Substring(id.IndexOf('#') + 1));
			}
			if (found != null && (!found.View.VM.UcDevice.Locked || forcerRemove))
			{
				((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
				{
					VM.RemoveDeviceCommandHandler(found);
				});
			}
		}

		public WarrantyInfoBaseModel LoadWarranty(string data)
		{
			WarrantyInfoBaseModel result = warrantyService.GetWarrantyInfo<WarrantyInfoBaseModel>(data).Result;
			LogHelper.LogInstance.Info("warranty query data:[" + data + "] result:[" + JsonHelper.SerializeObject2Json((object)result) + "]", false);
			return result;
		}

		public void ShowStartTutoiral()
		{
			TutorialDefineModel currentModel = new StartTutorial();
			TutorialsWindow obj = new TutorialsWindow
			{
				ShowNow = true
			};
			((FrameworkElement)obj).DataContext = new TutorialsWindowViewModel().Inititalize(currentModel, null);
			IMessageWindowV6 val = (IMessageWindowV6)(object)obj;
			MessageWindowHelper.Instance.Show(val, (bool?)true);
		}

		public void ShowTutoiral(DevCategory category)
		{
			TutorialDefineModel currentModel = new RescueTutorial(category, (Visibility)2);
			TutorialsWindow tutorialsWindow = new TutorialsWindow();
			((FrameworkElement)tutorialsWindow).DataContext = new TutorialsWindowViewModel().Inititalize(currentModel, category);
			IMessageWindowV6 val = (IMessageWindowV6)(object)tutorialsWindow;
			MessageWindowHelper.Instance.Show(val, (bool?)true);
		}

		public void ShowGifGuideSteps(bool _showTextDetect, string modelname)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				IMessageWindowV6 val = (IMessageWindowV6)(object)new GuidStepsView(modelname, (UseCase)2);
				MessageWindowHelper.Instance.Show(val, (bool?)true);
			});
		}

		public void CloseGifGuideSteps()
		{
			GlobalCmdHelper.Instance.Execute((object)new
			{
				type = (GlobalCmdType)5
			});
		}

		public void ShowOkWindow(string title, string content, string okButton, ImageSource image = null)
		{
			title = HostProxy.LanguageService.Translate(title);
			content = HostProxy.LanguageService.Translate(content);
			if (image == null)
			{
				MessageWindowHelper.Instance.Show(title, content, okButton, (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
				return;
			}
			MessageRightPicViewV6 vv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Expected O, but got Unknown
				vv = new MessageRightPicViewV6();
				vv.Init(image, title, content, okButton, (string)null, (string)null, false, false);
			});
			MessageWindowHelper.Instance.Show((IMessageViewV6)(object)vv, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true);
		}

		private void OnBtnBack(object sender, RoutedEventArgs e)
		{
			BacktoView();
		}

		private void OnBtnHome(object sender, RoutedEventArgs e)
		{
			ChangeView(PageIndex.RESCUE_HOME);
		}

		private void OnBtnReturnRescue(object sender, RoutedEventArgs e)
		{
			ChangeView(PageIndex.RESCUE_FLASH);
		}

		private void HideClick(object sender, RoutedEventArgs e)
		{
			((UIElement)devicelist).Visibility = (Visibility)2;
			((UIElement)expand).Visibility = (Visibility)0;
			((FrameworkElement)container).HorizontalAlignment = (HorizontalAlignment)1;
			Border obj = containerBorder;
			object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_SubThemeBrushKey");
			obj.Background = (Brush)((obj2 is SolidColorBrush) ? obj2 : null);
		}

		private void ShowClick(object sender, RoutedEventArgs e)
		{
			((UIElement)devicelist).Visibility = (Visibility)0;
			((UIElement)expand).Visibility = (Visibility)2;
			((FrameworkElement)container).HorizontalAlignment = (HorizontalAlignment)(!(VM.CurrentView is IAMatchView));
			Border obj = containerBorder;
			object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_SubThemeBrushKey");
			obj.Background = (Brush)((obj2 is SolidColorBrush) ? obj2 : null);
		}

		private void ChangeFooter(bool phoneHost)
		{
			VM.FooterVisible = (Visibility)0;
			if (phoneHost)
			{
				MainFrameViewModeV6 vM = VM;
				object obj = ((FrameworkElement)this).TryFindResource((object)"V6_DarkBackBtnStyle");
				vM.BackBtnStyle = (Style)((obj is Style) ? obj : null);
				MainFrameViewModeV6 vM2 = VM;
				object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_BorderBrushKey1");
				vM2.BorderBrush = (SolidColorBrush)((obj2 is SolidColorBrush) ? obj2 : null);
				MainFrameViewModeV6 vM3 = VM;
				object obj3 = ((FrameworkElement)this).TryFindResource((object)"V6_ThemeBrushKey");
				vM3.PageBackground = (SolidColorBrush)((obj3 is SolidColorBrush) ? obj3 : null);
				VM.ReturnRescueVisible = (Visibility)((!SupportMulti || VM.Count <= 0) ? 2 : 0);
				VM.HomeVisible = (Visibility)0;
				VM.BackVisible = (Visibility)2;
				return;
			}
			MainFrameViewModeV6 vM4 = VM;
			object obj4 = ((FrameworkElement)this).TryFindResource((object)"V6_BackBtnStyle");
			vM4.BackBtnStyle = (Style)((obj4 is Style) ? obj4 : null);
			MainFrameViewModeV6 vM5 = VM;
			object obj5 = ((FrameworkElement)this).TryFindResource((object)"V6_SplitterBrushKey");
			vM5.BorderBrush = (SolidColorBrush)((obj5 is SolidColorBrush) ? obj5 : null);
			MainFrameViewModeV6 vM6 = VM;
			object obj6 = ((FrameworkElement)this).TryFindResource((object)"V6_SubThemeBrushKey");
			vM6.PageBackground = (SolidColorBrush)((obj6 is SolidColorBrush) ? obj6 : null);
			VM.ReturnRescueVisible = (Visibility)2;
			VM.HomeVisible = (Visibility)2;
			if (SupportMulti && CurrentPageIndex == PageIndex.RESCUE_FLASH && VM.CurrentView is IAMatchView iAMatchView && iAMatchView.VM.Category == DevCategory.Phone)
			{
				VM.BackVisible = (Visibility)2;
			}
			else if (CurrentPageIndex == PageIndex.RESCUE_FLASH && !(VM.CurrentView is IAMatchView))
			{
				VM.BackVisible = (Visibility)2;
			}
			else if (CurrentPageIndex == PageIndex.PHONE_ENTRANCE || currentPageIndex == PageIndex.TABLET_ENTRANCE)
			{
				VM.HomeVisible = (Visibility)0;
				MainFrameViewModeV6 vM7 = VM;
				object obj7 = ((FrameworkElement)this).TryFindResource((object)"V6_ThemeBrushKey");
				vM7.PageBackground = (SolidColorBrush)((obj7 is SolidColorBrush) ? obj7 : null);
				MainFrameViewModeV6 vM8 = VM;
				object obj8 = ((FrameworkElement)this).TryFindResource((object)"V6_ThemeBrushKey");
				vM8.BorderBrush = (SolidColorBrush)((obj8 is SolidColorBrush) ? obj8 : null);
			}
			else
			{
				VM.BackVisible = (Visibility)0;
			}
		}

		private void OnDevConnecte(object sender, DeviceEx e)
		{
			e.SoftStatusChanged += OnSoftStatusChanged;
		}

		private void OnDisConnecte(object sender, DeviceEx e)
		{
			e.SoftStatusChanged -= OnSoftStatusChanged;
		}

		private void OnSoftStatusChanged(object sender, DeviceSoftStateEx e)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Invalid comparison between Unknown and I4
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Invalid comparison between Unknown and I4
			DeviceEx val = (DeviceEx)((sender is DeviceEx) ? sender : null);
			if ((int)e == 2)
			{
				AutoMatch(val);
			}
			else
			{
				if ((int)e != 0 && (int)e != 4)
				{
					return;
				}
				RemoveDevice(val.Identifer);
				if (CurrentPageIndex == PageIndex.RESCUE_FLASH && VM.CurrentView is IAMatchView iAMatchView && iAMatchView.VM.Category != DevCategory.Phone && !iAMatchView.VM.UcDevice.Locked)
				{
					if (iAMatchView.VM.Category == DevCategory.Tablet)
					{
						VM.PageViewArr.Remove(PageIndex.TABLET_AUTO);
					}
					else
					{
						VM.PageViewArr.Remove(PageIndex.SMART_AUTO);
					}
					RescueViews.Remove(iAMatchView);
					ChangeView(PageIndex.RESCUE_HOME);
				}
			}
		}

		private bool CheckPrevMatch(DeviceEx device, bool jumpToMatchView, string categoryStr)
		{
			//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
			//IL_0089: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Invalid comparison between Unknown and I4
			//IL_0097: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Invalid comparison between Unknown and I4
			//IL_0181: Unknown result type (might be due to invalid IL or missing references)
			//IL_0187: Invalid comparison between Unknown and I4
			LogHelper logInstance = LogHelper.LogInstance;
			object[] obj = new object[4] { jumpToMatchView, null, null, null };
			DeviceEx obj2 = device;
			obj[1] = ((obj2 != null) ? obj2.Identifer : null);
			obj[2] = categoryStr;
			obj[3] = CurrentPageIndex;
			logInstance.Debug(string.Format("CheckPrevMatch start - jumpToMatchView:{0}, deviceid: {1}, category: {2}, currentpage: {3}", obj), false);
			if (!Plugin.IsRescuePlugin || device == null || CurrentPageIndex == PageIndex.PHONE_MANUAL || (int)device.PhysicalStatus != 2 || (int)device.SoftStatus != 2)
			{
				LogHelper logInstance2 = LogHelper.LogInstance;
				object arg = Plugin.IsRescuePlugin;
				DeviceEx obj3 = device;
				logInstance2.Debug($"CheckPrevMatch step1 failed: {arg}, {((obj3 != null) ? new DevicePhysicalStateEx?(obj3.PhysicalStatus) : ((DevicePhysicalStateEx?)null))}, {device.SoftStatus}", false);
				return false;
			}
			if (!jumpToMatchView && CurrentPageIndex == PageIndex.RESCUE_FLASH)
			{
				LogHelper.LogInstance.Debug("CheckPrevMatch step2 failed", false);
				return false;
			}
			IAMatchView exists = RescueViews.FirstOrDefault((IAMatchView n) => n.VM.UcDevice.Id == device.Identifer);
			if (exists != null)
			{
				if (!exists.VM.UcDevice.RecipeLocked)
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						CloseAllManualPopWindow(device, categoryStr);
						DeviceViewModel deviceViewModel = VM.Devices.FirstOrDefault((DeviceViewModel n) => n.Id == exists.VM.UcDevice.Id);
						if (deviceViewModel != null)
						{
							deviceViewModel.IsSelected = true;
						}
						ChangeMutilDeviceShowType(exists.VM.Category == DevCategory.Phone && SupportMulti);
						CurrentPageIndex = PageIndex.RESCUE_FLASH;
						MainFrameViewModeV6 vM = VM;
						object obj4 = exists.RescueView;
						if (obj4 == null)
						{
							IAMatchView iAMatchView = exists;
							obj4 = ((iAMatchView is FrameworkElement) ? iAMatchView : null);
						}
						vM.CurrentView = (FrameworkElement)obj4;
						ChangeFooter(phoneHost: false);
					});
				}
				LogHelper.LogInstance.Debug("CheckPrevMatch step3 failed: exist match success", false);
				return false;
			}
			if ((int)device.WorkType == 2)
			{
				LogHelper.LogInstance.Debug("CheckPrevMatch step4 failed: device worktype is rescue", false);
				return false;
			}
			bool flag = VM.Devices.Where((DeviceViewModel n) => !string.IsNullOrEmpty(n.Id)).Count((DeviceViewModel n) => !n.View.VM.UcDevice.RealFlash) > 0;
			if (!jumpToMatchView && Plugin.SupportMulti && categoryStr == "phone" && flag)
			{
				LogHelper.LogInstance.Debug("CheckPrevMatch step5 failed: exist unreal flash device", false);
				return false;
			}
			int result = IsDevAllowRescue(device).Result;
			if (result != -1 && result != 1)
			{
				LogHelper.LogInstance.Debug("CheckPrevMatch step6 failed: not allow to rescue", false);
				MessageWindowHelper.Instance.Show("K1555", "K1478", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
				return false;
			}
			LogHelper.LogInstance.Debug("CheckPrevMatch end: continue match", false);
			return true;
		}

		public void AutoMatch(DeviceEx device, bool jumpToMatchView = false)
		{
			if (Interlocked.Read(in autoMatchLock) != 0L)
			{
				return;
			}
			Interlocked.Exchange(ref autoMatchLock, 1L);
			Task.Run(delegate
			{
				//IL_0035: Unknown result type (might be due to invalid IL or missing references)
				//IL_003b: Invalid comparison between Unknown and I4
				//IL_0128: Unknown result type (might be due to invalid IL or missing references)
				//IL_012e: Invalid comparison between Unknown and I4
				string text = device.Property.Category ?? "phone";
				if (device != null && (int)device.WorkType != 2)
				{
					CloseAllManualPopWindow(device, text);
				}
				if (!CheckPrevMatch(device, jumpToMatchView, text))
				{
					Interlocked.Exchange(ref autoMatchLock, 0L);
				}
				else
				{
					RescueDeviceInfoModel deviceInfo = new RescueDeviceInfoModel
					{
						modelName = device.Property.ModelName,
						imei = device.Property.IMEI1,
						sn = device.Property.SN,
						hwCode = device.Property.HWCode,
						country = device.Property.CountryCode,
						channelId = device.Property.GetPropertyValue("channelid"),
						cid = device.Property.GetPropertyValue("cid"),
						trackId = (((int)device.ConnectType != 4) ? device.Identifer : null)
					};
					LogHelper.LogInstance.Info("\n========================================\nAuto match model name: " + deviceInfo.modelName + "\n========================================", false);
					DevCategory category = ((text == "tablet") ? DevCategory.Tablet : ((text == "smart") ? DevCategory.Smart : DevCategory.Phone));
					string matchText = ((category == DevCategory.Phone) ? device.Property.IMEI1 : device.Property.SN);
					Dictionary<string, object> param = null;
					Task<WarrantyInfoBaseModel> warrantyTask = new Task<WarrantyInfoBaseModel>(delegate
					{
						LogHelper.LogInstance.Info("====>>Warranty interface called!", false);
						WarrantyInfoBaseModel result = LoadWarranty(matchText);
						if (!Plugin.SupportMulti && category == DevCategory.Phone && !string.IsNullOrEmpty(deviceInfo.imei))
						{
							LogHelper.LogInstance.Info("====>>ready for call moto care!", false);
							Task.Run(delegate
							{
								IMsgManager.CallMotoCare(deviceInfo.imei, (object)result);
							});
						}
						return result;
					}, TaskCreationOptions.AttachedToParent);
					Task<dynamic> matchTask = new Task<object>(delegate
					{
						//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
						//IL_0294: Unknown result type (might be due to invalid IL or missing references)
						//IL_00fc: Unknown result type (might be due to invalid IL or missing references)
						//IL_022d: Unknown result type (might be due to invalid IL or missing references)
						Stopwatch stopwatch = new Stopwatch();
						stopwatch.Start();
						List<ResourceResponseModel> arr = null;
						param = FlashBusiness.GetAutoMatchParams(device);
						if (param != null)
						{
							if (param["code"].ToString() == "402")
							{
								return (dynamic)new
								{
									code = "4020",
									arr = arr,
									time = stopwatch.ElapsedMilliseconds,
									status = (BusinessStatus)20
								};
							}
							if (param["code"].ToString() != "0000")
							{
								return (dynamic)new
								{
									code = "8080",
									arr = arr,
									time = stopwatch.ElapsedMilliseconds,
									status = (BusinessStatus)20
								};
							}
							FlashBusiness.ConvertDeviceInfo(param["params"] as Dictionary<string, string>, deviceInfo);
							ResponseModel<List<ResourceResponseModel>> val = FlashContext.SingleInstance.service.Request<List<ResourceResponseModel>>(WebServicesContext.RESUCE_AUTOMATCH_GETROM, (object)param, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
							stopwatch.Stop();
							arr = val.content;
							BusinessStatus status = (BusinessStatus)20;
							if (arr != null && arr.Count > 0)
							{
								status = (BusinessStatus)10;
								deviceInfo.romMatchId = arr[0].romMatchId;
								deviceInfo.saleModel = arr[0].SalesModel;
								param["romMatchId"] = deviceInfo.romMatchId;
							}
							else if (string.IsNullOrEmpty(device.Property.IMEI1) && !string.IsNullOrEmpty(deviceInfo.trackId))
							{
								LogHelper.LogInstance.Info("Auto match device failed and device IMEI is empty, call interface get IMEI by track_id", false);
								string value = ((ApiBaseService)FlashContext.SingleInstance.service).RequestBase(WebApiUrl.CALL_API_URL, (object)new
								{
									key = "IQS_WARRANTY_URL",
									param = deviceInfo.trackId
								}, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false).content?.ToString();
								if (!string.IsNullOrEmpty(value))
								{
									param["imei"] = value;
									val = FlashContext.SingleInstance.service.Request<List<ResourceResponseModel>>(WebServicesContext.RESUCE_AUTOMATCH_GETROM, (object)param, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
									arr = val.content;
									if (arr != null && arr.Count > 0)
									{
										status = (BusinessStatus)10;
										deviceInfo.romMatchId = arr[0].romMatchId;
										deviceInfo.saleModel = arr[0].SalesModel;
										param["romMatchId"] = deviceInfo.romMatchId;
									}
								}
							}
							LogHelper.LogInstance.Info("====>>Resouces match interface called!", false);
							return (dynamic)new
							{
								code = val.code,
								arr = arr,
								time = stopwatch.ElapsedMilliseconds,
								status = status
							};
						}
						stopwatch.Stop();
						param = new Dictionary<string, object>();
						return (dynamic)new
						{
							code = "8080",
							arr = arr,
							time = stopwatch.ElapsedMilliseconds,
							status = (BusinessStatus)20
						};
					}, TaskCreationOptions.AttachedToParent);
					MessageWindowHelper.Instance.Loading("K1588", (Func<object>)delegate
					{
						warrantyTask.Start();
						matchTask.Start();
						Task.WaitAll(new Task[2] { warrantyTask, matchTask });
						return true;
					}, false).ContinueWith(delegate
					{
						//IL_0267: Unknown result type (might be due to invalid IL or missing references)
						//IL_0268: Unknown result type (might be due to invalid IL or missing references)
						//IL_0275: Unknown result type (might be due to invalid IL or missing references)
						//IL_027b: Expected O, but got Unknown
						//IL_02de: Unknown result type (might be due to invalid IL or missing references)
						//IL_0f00: Unknown result type (might be due to invalid IL or missing references)
						//IL_0f06: Invalid comparison between Unknown and I4
						//IL_0eb8: Unknown result type (might be due to invalid IL or missing references)
						//IL_0ebe: Invalid comparison between Unknown and I4
						//IL_0b86: Unknown result type (might be due to invalid IL or missing references)
						//IL_0b8c: Invalid comparison between Unknown and I4
						//IL_0b99: Unknown result type (might be due to invalid IL or missing references)
						//IL_0b9f: Invalid comparison between Unknown and I4
						try
						{
							dynamic result = matchTask.Result;
							param["romMatchId"] = (object)((result.arr?.Count > 0) ? result.arr[0].romMatchId : null);
							BusinessType val = (BusinessType)((category == DevCategory.Tablet) ? 3071 : ((category == DevCategory.Phone) ? 3070 : 3072));
							BusinessData val2 = new BusinessData(val, device, (BusinessStatus)0);
							HostProxy.BehaviorService.Collect(val, val2.Update(result.time, result.status, deviceInfo.modelName, param));
							string text2 = result.code;
							WarrantyInfoBaseModel result2 = warrantyTask.Result;
							LogHelper.LogInstance.Info("warranty info:[" + JsonHelper.SerializeObject2Json((object)result2) + "]", false);
							switch (text2)
							{
							case "0000":
							case "3040":
							{
								ResourceResponseModel resourceResponseModel = result.arr[0];
								if ((!(text2 == "3040") || Match3040View.ProcMatch3040(resourceResponseModel, matchText, category, result2) == true) && (!((text2 == "0000" && result.arr.Count == 1 && (CurrentPageIndex == PageIndex.TABLET_MANUAL || CurrentPageIndex == PageIndex.SMART_MANUAL)) ? true : false) || MessageWindowHelper.Instance.Show("K0711", "K0968", "K0327", "K0208", false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Result == true))
								{
									if (result.arr.Count != 1)
									{
										resourceResponseModel = MultiRomsSelView.SelectOneFormRomArr(result.arr);
										if (resourceResponseModel == null)
										{
											break;
										}
									}
									if (resourceResponseModel.fastboot && !string.IsNullOrEmpty(deviceInfo.fingerPrint))
									{
										Dictionary<string, string> aparams = new Dictionary<string, string>
										{
											{
												"modelName",
												param["modelName"].ToString()
											},
											{ "romFingerPrint", resourceResponseModel.fingerprint },
											{ "romMatchId", resourceResponseModel.romMatchId }
										};
										if (!new CheckFingerPrintVersion().Check(deviceInfo.fingerPrint, resourceResponseModel.fingerprint, aparams))
										{
											MessageWindowHelper.Instance.Show("K0071", "K1119", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
											break;
										}
									}
									lenovo.mbg.service.lmsa.flash.ModelV6.MatchType matchType = (((int)device.ConnectType != 2) ? (((int)device.ConnectType == 4) ? lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.WIFI : lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.ADB) : lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.FASTBOOT);
									AutoMatchResource data = new AutoMatchResource(device, deviceInfo, resourceResponseModel, new MatchInfo(matchType, param, deviceInfo));
									JumptoRescueView(category, data, result2, null, jumpToMatchView);
								}
								break;
							}
							case "8080":
								MessageWindowHelper.Instance.Show("K0711", "K0113", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
								break;
							case "3000":
							case "3030":
								Match3030View.ProcMatch3030(device, deviceInfo, null, result.arr[0], matchText, category, val2, result2, jumpToMatchView).Wait();
								break;
							case "3010":
								if (category == DevCategory.Phone)
								{
									FastbootDeviceAutoMatchFailed(device.Identifer, device.Property.ModelName, device.Property.IMEI1, result2);
								}
								else
								{
									UsbDeviceAutoMatchFailed(category, ((int)device.ConnectType == 2) ? deviceInfo.modelName : null);
								}
								break;
							case "4020":
								break;
							default:
								UsbDeviceAutoMatchFailed(category, ((int)device.ConnectType == 2) ? deviceInfo.modelName : null);
								break;
							}
						}
						finally
						{
							Interlocked.Exchange(ref autoMatchLock, 0L);
						}
					});
				}
			});
		}

		private void CloseAllManualPopWindow(DeviceEx device, string categoryStr)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Invalid comparison between Unknown and I4
			if ((int)device.ConnectType == 4)
			{
				GlobalCmdHelper.Instance.Execute((object)new
				{
					type = (GlobalCmdType)7
				});
			}
			CloseGifGuideSteps();
			GlobalCmdHelper.Instance.Execute((object)new
			{
				type = (GlobalCmdType)9
			});
			GlobalCmdHelper.Instance.Execute((object)new
			{
				type = (GlobalCmdType)1
			});
		}

		public async Task<int> IsDevAllowRescue(DeviceEx dev, bool isMatch = true, string modelName = null)
		{
			return await Task.Run(delegate
			{
				int result = -1;
				DeviceEx obj = dev;
				IAndroidDevice val = ((obj != null) ? obj.Property : null);
				if (val != null)
				{
					string text = val.ModelName ?? modelName;
					string propertyValue = val.GetPropertyValue("fdr-allowed");
					string propertyValue2 = val.GetPropertyValue("securestate");
					string propertyValue3 = val.GetPropertyValue("cid");
					LogHelper.LogInstance.Info((isMatch ? "auto match" : "rescue flash click") + " device check, modelName: " + text + ", fdrallowed: " + propertyValue + ", securestate: " + propertyValue2 + ", cid: " + propertyValue3, false);
					bool flag = propertyValue?.ToLower() == "no";
					bool flag2 = propertyValue2?.ToLower() == "flashing_locked";
					if (FastbootErrorStatusArr.Contains(propertyValue3))
					{
						result = 6;
					}
					else if (flag)
					{
						result = 1;
					}
					else if (flag2)
					{
						result = 2;
					}
					else if (string.IsNullOrEmpty(text) || Regex.IsMatch(text, "^[0]+$"))
					{
						result = 5;
					}
				}
				return result;
			});
		}

		private void UsbDeviceAutoMatchFailed(DevCategory category, string modelName)
		{
			if (CurrentPageIndex == PageIndex.PHONE_MANUAL || CurrentPageIndex == PageIndex.SMART_MANUAL || CurrentPageIndex == PageIndex.TABLET_MANUAL)
			{
				return;
			}
			if (category == DevCategory.Phone)
			{
				ChangeView(PageIndex.PHONE_ENTRANCE);
			}
			int model = 0;
			if (category == DevCategory.Phone)
			{
				model = (IsChinaUs(isOnlyChina: true) ? 3 : 2);
			}
			else if (category == DevCategory.Tablet)
			{
				model = 2;
			}
			InvalidView win = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke<InvalidView>((Func<InvalidView>)(() => win = new InvalidView(category, model, modelName)));
			MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)win, (bool?)true).Wait();
			if (win.Result == true)
			{
				if (category == DevCategory.Tablet)
				{
					ChangeView(win.IsManualModel ? PageIndex.TABLET_MANUAL : PageIndex.TABLET_SEARCH);
				}
				else if (category == DevCategory.Smart)
				{
					ChangeView(PageIndex.SMART_MANUAL);
				}
				else
				{
					ChangeView(win.IsManualModel ? PageIndex.PHONE_MANUAL : PageIndex.PHONE_SEARCH);
				}
			}
		}

		private void FastbootDeviceAutoMatchFailed(string deviceId, string modelName, string imei, object wModel)
		{
			if (CurrentPageIndex == PageIndex.PHONE_MANUAL || CurrentPageIndex == PageIndex.SMART_MANUAL || CurrentPageIndex == PageIndex.TABLET_MANUAL)
			{
				return;
			}
			if (!_FastbootDevUnMatchArr.ContainsKey(deviceId))
			{
				_FastbootDevUnMatchArr.Add(deviceId, 1);
			}
			else if (string.IsNullOrEmpty(modelName))
			{
				_FastbootDevUnMatchArr[deviceId] = 1;
			}
			else
			{
				_FastbootDevUnMatchArr[deviceId]++;
			}
			if (_FastbootDevUnMatchArr[deviceId] > 1)
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					Match3010View match3010View = new Match3010View(DevCategory.Phone, modelName, imei, wModel);
					MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)match3010View, (bool?)true);
				});
			}
			else
			{
				string fASTBOOT_AUTOMATCH_FAILED_FIRST = FlashStaticResources.FASTBOOT_AUTOMATCH_FAILED_FIRST;
				MessageWindowHelper.Instance.Show("K0711", fASTBOOT_AUTOMATCH_FAILED_FIRST, "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
			}
		}

		public bool IsChinaUs(bool isOnlyChina = false)
		{
			string currentLanguage = HostProxy.LanguageService.GetCurrentLanguage();
			string twoLetterISORegionName = GlobalFun.GetRegionInfo().TwoLetterISORegionName;
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

		public BitmapImage GetQrCodeImage(string number)
		{
			return null;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/mainframev6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004e: Expected O, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Expected O, but got Unknown
			//IL_0075: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Unknown result type (might be due to invalid IL or missing references)
			//IL_008b: Expected O, but got Unknown
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0099: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a3: Expected O, but got Unknown
			//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b0: Expected O, but got Unknown
			//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00be: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c8: Expected O, but got Unknown
			//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d5: Expected O, but got Unknown
			//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ed: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				containerBorder = (Border)target;
				break;
			case 2:
				container = (ContentPresenter)target;
				break;
			case 3:
				BottomBorder = (Border)target;
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnBack);
				break;
			case 5:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnHome);
				break;
			case 6:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnReturnRescue);
				break;
			case 7:
				expand = (Border)target;
				break;
			case 8:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(ShowClick);
				break;
			case 9:
				devicelist = (Border)target;
				break;
			case 10:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(HideClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class MainFrameViewModeV6 : ViewModelBase
	{
		private Visibility footerVisible = (Visibility)2;

		private Visibility backVisible = (Visibility)2;

		private Visibility homeVisible = (Visibility)2;

		private Visibility returnRescueVisible = (Visibility)2;

		private FrameworkElement _CurrentView;

		private SolidColorBrush _PageBackground;

		private SolidColorBrush _BorderBrush;

		private Style _BackBtnStyle;

		private ObservableCollection<DeviceViewModel> devices = new ObservableCollection<DeviceViewModel>();

		public Visibility FooterVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return footerVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				footerVisible = value;
				((NotifyBase)this).OnPropertyChanged("FooterVisible");
			}
		}

		public Visibility BackVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return backVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				backVisible = value;
				((NotifyBase)this).OnPropertyChanged("BackVisible");
			}
		}

		public Visibility HomeVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return homeVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				homeVisible = value;
				((NotifyBase)this).OnPropertyChanged("HomeVisible");
			}
		}

		public Visibility ReturnRescueVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return returnRescueVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				returnRescueVisible = value;
				((NotifyBase)this).OnPropertyChanged("ReturnRescueVisible");
			}
		}

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

		public SolidColorBrush PageBackground
		{
			get
			{
				return _PageBackground;
			}
			set
			{
				_PageBackground = value;
				((NotifyBase)this).OnPropertyChanged("PageBackground");
			}
		}

		public SolidColorBrush BorderBrush
		{
			get
			{
				return _BorderBrush;
			}
			set
			{
				_BorderBrush = value;
				((NotifyBase)this).OnPropertyChanged("BorderBrush");
			}
		}

		public Style BackBtnStyle
		{
			get
			{
				return _BackBtnStyle;
			}
			set
			{
				_BackBtnStyle = value;
				((NotifyBase)this).OnPropertyChanged("BackBtnStyle");
			}
		}

		public ObservableCollection<DeviceViewModel> Devices
		{
			get
			{
				return devices;
			}
			set
			{
				devices = value;
				((NotifyBase)this).OnPropertyChanged("Devices");
			}
		}

		public int Count => Devices.Count((DeviceViewModel n) => !string.IsNullOrEmpty(n.Id));

		public Dictionary<PageIndex, FrameworkElement> PageViewArr { get; private set; }

		public ReplayCommand RemoveDeviceCommand { get; }

		public ReplayCommand ClickCommand { get; }

		public MainFrameViewModeV6()
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007b: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Expected O, but got Unknown
			Devices.Add(new DeviceViewModel
			{
				IsEnabled = true
			});
			Devices.Add(new DeviceViewModel());
			Devices.Add(new DeviceViewModel());
			RemoveDeviceCommand = new ReplayCommand((Action<object>)RemoveDeviceCommandHandler);
			ClickCommand = new ReplayCommand((Action<object>)ClickCommandHandler);
			PageViewArr = new Dictionary<PageIndex, FrameworkElement> { 
			{
				PageIndex.RESCUE_HOME,
				(FrameworkElement)(object)new RescueHomeViewV6()
			} };
			CurrentView = PageViewArr[PageIndex.RESCUE_HOME];
		}

		public IAMatchView InitPhoneMatchView(AutoMatchResource data, object wModel, FrameworkElement parentView, bool jumpToMatchView = false)
		{
			bool supportMulti = MainFrameV6.Instance.SupportMulti;
			DeviceViewModel deviceViewModel = ((!jumpToMatchView && supportMulti) ? Devices.FirstOrDefault((DeviceViewModel n) => n.Id == data.Id) : Devices.First());
			bool flag = deviceViewModel != null;
			if (!flag)
			{
				deviceViewModel = Devices.FirstOrDefault((DeviceViewModel n) => string.IsNullOrEmpty(n.Id));
				flag = deviceViewModel != null;
			}
			if (flag)
			{
				deviceViewModel.Id = data.Id;
				deviceViewModel.IMEI = (string.IsNullOrEmpty(data.deviceInfo.imei) ? null : data.deviceInfo.imei);
				deviceViewModel.ModelName = Regex.Replace(data.deviceInfo.modelName ?? data.resource.ModelName, "(^lenovo)|(^motorola)", "", RegexOptions.IgnoreCase).Trim();
				deviceViewModel.IsMotorola = !string.IsNullOrEmpty(data.resource.Brand) && data.resource.Brand.Equals("motorola", StringComparison.CurrentCultureIgnoreCase);
				deviceViewModel.IsSelected = true;
				deviceViewModel.IsEnabled = true;
				if (deviceViewModel.View == null)
				{
					deviceViewModel.View = new PhoneAMatchViewV6();
					MainFrameV6.Instance.RescueViews.Add(deviceViewModel.View);
					deviceViewModel.View.Init(data, wModel, parentView);
				}
				else if (!deviceViewModel.View.VM.UcDevice.Locked || jumpToMatchView || !supportMulti)
				{
					if (deviceViewModel.View.VM.UcDevice.Locked)
					{
						deviceViewModel.View.VM.Free();
					}
					deviceViewModel.View.Init(data, wModel, parentView);
				}
			}
			return deviceViewModel?.View;
		}

		public void ChangeRescuingPercentage(string id, double percentage)
		{
			DeviceViewModel deviceViewModel = Devices.FirstOrDefault((DeviceViewModel n) => n.Id == id);
			if (deviceViewModel != null)
			{
				deviceViewModel.Percentage = percentage;
			}
		}

		public void ChangeRescuingNeedOperator(string id, bool needOperator)
		{
			DeviceViewModel found = Devices.FirstOrDefault((DeviceViewModel n) => n.Id == id);
			if (found != null)
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => found.NeedOperator = needOperator));
			}
		}

		public void ChangeDeviceEnable()
		{
			if (Devices.Where((DeviceViewModel n) => !string.IsNullOrEmpty(n.Id)).Count((DeviceViewModel n) => !n.View.VM.UcDevice.RealFlash) > 0)
			{
				DeviceViewModel deviceViewModel = Devices.FirstOrDefault((DeviceViewModel n) => string.IsNullOrEmpty(n.Id) && n.IsEnabled);
				if (deviceViewModel != null)
				{
					deviceViewModel.IsEnabled = false;
				}
			}
			else if (Devices.Count((DeviceViewModel n) => string.IsNullOrEmpty(n.Id) && n.IsEnabled) == 0)
			{
				DeviceViewModel deviceViewModel2 = Devices.FirstOrDefault((DeviceViewModel n) => string.IsNullOrEmpty(n.Id));
				if (deviceViewModel2 != null)
				{
					deviceViewModel2.IsEnabled = true;
				}
			}
		}

		public void RemoveDeviceCommandHandler(object data)
		{
			lock (this)
			{
				if (data == null)
				{
					return;
				}
				DeviceViewModel deviceViewModel = data as DeviceViewModel;
				deviceViewModel.View.VM.Free();
				MainFrameV6.Instance.RescueViews.Remove(deviceViewModel.View);
				Devices.Remove(deviceViewModel);
				LogHelper.LogInstance.Debug("device: " + deviceViewModel.Id + " removed", false);
				if (Devices.Count < 3)
				{
					Devices.Add(new DeviceViewModel());
					ChangeDeviceEnable();
				}
				if (Devices.Count((DeviceViewModel n) => !string.IsNullOrEmpty(n.Id)) == 0)
				{
					MainFrameV6.Instance.ChangeView(PageIndex.PHONE_ENTRANCE);
					return;
				}
				DeviceViewModel data2 = Devices.FirstOrDefault((DeviceViewModel n) => !string.IsNullOrEmpty(n.Id));
				ClickCommandHandler(data2);
			}
		}

		private void ClickCommandHandler(object data)
		{
			MouseButtonEventArgs e = null;
			DeviceViewModel deviceViewModel = data as DeviceViewModel;
			if (deviceViewModel == null)
			{
				e = (MouseButtonEventArgs)((data is MouseButtonEventArgs) ? data : null);
				object source = ((RoutedEventArgs)e).Source;
				FrameworkElement val = (FrameworkElement)((source is FrameworkElement) ? source : null);
				if (val != null)
				{
					deviceViewModel = val.DataContext as DeviceViewModel;
				}
				else
				{
					object source2 = ((RoutedEventArgs)e).Source;
					deviceViewModel = ((FrameworkContentElement)((source2 is Run) ? source2 : null)).DataContext as DeviceViewModel;
				}
			}
			if (deviceViewModel != null)
			{
				if (deviceViewModel.View == null)
				{
					if (Devices.Count((DeviceViewModel n) => n.View != null && !n.View.VM.SupportFastboot) > 0)
					{
						deviceViewModel.ShowTip = true;
					}
					else
					{
						MainFrameV6.Instance.ChangeView(PageIndex.PHONE_ENTRANCE);
					}
				}
				else
				{
					deviceViewModel.IsSelected = true;
					object obj = deviceViewModel.View.RescueView;
					if (obj == null)
					{
						IAMatchView view = deviceViewModel.View;
						obj = ((view is FrameworkElement) ? view : null);
					}
					CurrentView = (FrameworkElement)obj;
					MainFrameV6.Instance.ChangeMutilDeviceShowType(MainFrameV6.Instance.SupportMulti);
				}
			}
			if (e != null)
			{
				((RoutedEventArgs)e).Handled = true;
			}
		}
	}
	public class PhoneAMatchViewV6 : UserControl, IAMatchView, IComponentConnector
	{
		internal Grid container;

		private bool _contentLoaded;

		public FrameworkElement ParentView { get; private set; }

		public AutoMatchViewModel VM { get; private set; }

		public FrameworkElement RescueView { get; set; }

		public PhoneAMatchViewV6()
		{
			InitializeComponent();
			VM = new PhoneAMatchViewModel(this);
			((FrameworkElement)this).DataContext = VM;
		}

		public void Init(AutoMatchResource data, object wModel, FrameworkElement parentView)
		{
			ParentView = parentView;
			VM.Init(data, (WarrantyInfoBaseModel)((wModel is WarrantyInfoBaseModel) ? wModel : null));
		}

		private void OnBtnCopy(object sender, RoutedEventArgs e)
		{
			object originalSource = e.OriginalSource;
			Button val = (Button)((originalSource is Button) ? originalSource : null);
			if (val != null && ((FrameworkElement)val).Tag != null)
			{
				Clipboard.SetText(((FrameworkElement)val).Tag.ToString());
			}
		}

		private void OnBtnFlash(object sender, RoutedEventArgs e)
		{
			VM.OnRescue();
		}

		private void OnHelpClick(object sender, RoutedEventArgs e)
		{
			Plugin.IMsgManager.ShowMutilTutorials(true);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/phoneamatchviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				container = (Grid)target;
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnHelpClick);
				break;
			case 3:
				((UIElement)(ListBox)target).AddHandler(ButtonBase.ClickEvent, (Delegate)new RoutedEventHandler(OnBtnCopy));
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnFlash);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class PhoneAMatchViewModel : AutoMatchViewModel
	{
		public PhoneAMatchViewModel(PhoneAMatchViewV6 ui)
			: base(ui, DevCategory.Phone)
		{
			base.HelpVisibile = (Visibility)((!Plugin.SupportMulti) ? 2 : 0);
		}
	}
	public class AutoMatchViewModel : ViewModelBase
	{
		private bool ForceReMatch;

		private bool ModelNameMatch;

		private bool _RescueFinished;

		private bool _IsSetCountryCode;

		private ResourceResponseModel _FlashRes;

		private AutoMatchResource _MatchRes;

		protected IRecipeMessage Message;

		protected Dictionary<string, string> DegradeInfos;

		protected BusinessData businessData;

		protected bool IsReady;

		protected List<DownloadInfo> DownloadResources;

		protected RescueFrameV6 RescueFrame;

		protected BusinessType businessType;

		protected int? b2bOrderId;

		protected string IMEI;

		protected List<string> deleteResources = new List<string>();

		protected string fileLostMessage;

		private string _RomFileSize = "-";

		private string _RomFileName;

		private Visibility targetFirmwareVisibile = (Visibility)2;

		private string _TargetFirmwareVersion;

		private string _TargetAndroidVersion;

		private string _FlashBtnText;

		private bool _FlashBtnEnable;

		private WarrantyInfoViewModelV6 warranty;

		private string marketName;

		private static readonly ImageSource DownloadImageIcon;

		private static readonly ImageSource DownloadingImageIcon;

		private ImageSource downloadImage;

		private Visibility reSelectVisibile = (Visibility)2;

		private Visibility helpVisibile = (Visibility)2;

		private ObservableCollection<DeviceInfoModel> itemArr;

		private DateTime startRescueTime = DateTime.Now;

		private bool startRescueTimeTag;

		private bool isGoogle_Account_Quit;

		public DevCategory Category { get; private set; }

		public UseCaseDevice UcDevice { get; private set; }

		public RescueDeviceInfoModel DeviceInfo { get; private set; }

		public string RomFileSize
		{
			get
			{
				return _RomFileSize;
			}
			set
			{
				_RomFileSize = value;
				((NotifyBase)this).OnPropertyChanged("RomFileSize");
			}
		}

		public string RomFileName
		{
			get
			{
				return _RomFileName;
			}
			set
			{
				_RomFileName = value;
				((NotifyBase)this).OnPropertyChanged("RomFileName");
			}
		}

		public Visibility TargetFirmwareVisibile
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return targetFirmwareVisibile;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				targetFirmwareVisibile = value;
				((NotifyBase)this).OnPropertyChanged("TargetFirmwareVisibile");
			}
		}

		public string TargetFirmwareVersion
		{
			get
			{
				return _TargetFirmwareVersion;
			}
			set
			{
				_TargetFirmwareVersion = value;
				((NotifyBase)this).OnPropertyChanged("TargetFirmwareVersion");
			}
		}

		public string TargetAndroidVersion
		{
			get
			{
				return _TargetAndroidVersion;
			}
			set
			{
				_TargetAndroidVersion = value;
				((NotifyBase)this).OnPropertyChanged("TargetAndroidVersion");
			}
		}

		public string FlashBtnText
		{
			get
			{
				return _FlashBtnText;
			}
			set
			{
				_FlashBtnText = value;
				((NotifyBase)this).OnPropertyChanged("FlashBtnText");
			}
		}

		public bool FlashBtnEnable
		{
			get
			{
				return _FlashBtnEnable;
			}
			set
			{
				_FlashBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("FlashBtnEnable");
			}
		}

		public WarrantyInfoViewModelV6 Warranty
		{
			get
			{
				return warranty;
			}
			set
			{
				warranty = value;
				((NotifyBase)this).OnPropertyChanged("Warranty");
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
				marketName = value;
				((NotifyBase)this).OnPropertyChanged("MarketName");
			}
		}

		public ImageSource DownloadImage
		{
			get
			{
				return downloadImage;
			}
			set
			{
				downloadImage = value;
				((NotifyBase)this).OnPropertyChanged("DownloadImage");
			}
		}

		public Visibility ReSelectVisibile
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return reSelectVisibile;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				reSelectVisibile = value;
				((NotifyBase)this).OnPropertyChanged("ReSelectVisibile");
			}
		}

		public Visibility HelpVisibile
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return helpVisibile;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				helpVisibile = value;
				((NotifyBase)this).OnPropertyChanged("HelpVisibile");
			}
		}

		public string ModelName { get; set; }

		public ObservableCollection<DeviceInfoModel> ItemArr
		{
			get
			{
				return itemArr;
			}
			set
			{
				itemArr = value;
				((NotifyBase)this).OnPropertyChanged("ItemArr");
			}
		}

		public ReplayCommand CopyCommand { get; }

		public ReplayCommand ReSelectCommand { get; }

		protected IAMatchView View { get; }

		public bool SupportFastboot => _FlashRes.fastboot;

		public AutoMatchViewModel(IAMatchView ui, DevCategory category)
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Expected O, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Expected O, but got Unknown
			View = ui;
			Category = category;
			CopyCommand = new ReplayCommand((Action<object>)CopyCommandHandler);
			ReSelectCommand = new ReplayCommand((Action<object>)ReSelectCommandHandler);
		}

		public void Init(AutoMatchResource data, WarrantyInfoBaseModel warranty)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Expected O, but got Unknown
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_007b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0085: Expected O, but got Unknown
			//IL_01fd: Unknown result type (might be due to invalid IL or missing references)
			//IL_0203: Invalid comparison between Unknown and I4
			//IL_037d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0387: Expected O, but got Unknown
			//IL_03ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_03b5: Expected O, but got Unknown
			//IL_03ec: Unknown result type (might be due to invalid IL or missing references)
			//IL_03f6: Expected O, but got Unknown
			//IL_0419: Unknown result type (might be due to invalid IL or missing references)
			//IL_0423: Expected O, but got Unknown
			//IL_0446: Unknown result type (might be due to invalid IL or missing references)
			//IL_0450: Expected O, but got Unknown
			//IL_0473: Unknown result type (might be due to invalid IL or missing references)
			//IL_047d: Expected O, but got Unknown
			//IL_04a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_04ab: Expected O, but got Unknown
			//IL_04cf: Unknown result type (might be due to invalid IL or missing references)
			//IL_04d9: Expected O, but got Unknown
			//IL_04fd: Unknown result type (might be due to invalid IL or missing references)
			//IL_0507: Expected O, but got Unknown
			//IL_052b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0535: Expected O, but got Unknown
			//IL_0559: Unknown result type (might be due to invalid IL or missing references)
			//IL_0563: Expected O, but got Unknown
			//IL_0587: Unknown result type (might be due to invalid IL or missing references)
			//IL_0591: Expected O, but got Unknown
			//IL_05b5: Unknown result type (might be due to invalid IL or missing references)
			//IL_05bf: Expected O, but got Unknown
			//IL_05e3: Unknown result type (might be due to invalid IL or missing references)
			//IL_05ed: Expected O, but got Unknown
			//IL_0611: Unknown result type (might be due to invalid IL or missing references)
			//IL_061b: Expected O, but got Unknown
			_MatchRes = data;
			Message = (IRecipeMessage)(object)new RecipeMessageImpl(new MessageViewHelper((ViewModelBase)(object)this, (Action<UserControl>)delegate(UserControl view)
			{
				MainFrameV6.Instance.VM.ChangeRescuingNeedOperator(data.Id, view != null);
			}));
			Warranty = new WarrantyInfoViewModelV6(warranty);
			_FlashRes = data.resource;
			DeviceInfo = data.deviceInfo;
			UcDevice = new UseCaseDevice(data.device, data.Id);
			ReSelectVisibile = (Visibility)((View.ParentView == null) ? 2 : 0);
			IMEI = data.deviceInfo.imei;
			DeviceEx device = data.device;
			object obj;
			if (device == null)
			{
				obj = null;
			}
			else
			{
				IAndroidDevice property = device.Property;
				obj = ((property != null) ? property.IMEI2 : null);
			}
			string text = (string)obj;
			string sn = data.deviceInfo.sn;
			MarketName = data.deviceInfo.marketName ?? data.resource.marketName;
			ModelName = data.deviceInfo.modelName ?? data.resource.ModelName;
			string blurVersion = data.deviceInfo.blurVersion;
			string fingerPrint = data.deviceInfo.fingerPrint;
			string roCarrier = data.deviceInfo.roCarrier;
			string fsgVersion = data.deviceInfo.fsgVersion;
			string saleModel = data.deviceInfo.saleModel;
			string hwCode = data.deviceInfo.hwCode;
			string country = data.deviceInfo.country;
			string simCount = data.deviceInfo.simCount;
			string memory = data.deviceInfo.memory;
			string text2 = null;
			string text3 = null;
			if (data.device != null)
			{
				if ((int)data.device.ConnectType == 2)
				{
					data.device.Property.GetPropertyValue("cpu");
					text2 = data.device.Property.GetPropertyValue("androidVer");
					text3 = data.device.Property.GetPropertyValue("softwareVersion");
				}
				else
				{
					_ = data.device.Property.Processor;
					text2 = data.device.Property.AndroidVersion;
					text3 = data.device.Property.GetPropertyValue("ro.build.display.id");
				}
			}
			if (!string.IsNullOrEmpty(_FlashRes.fingerprint))
			{
				string[] array = _FlashRes.fingerprint.Split(new char[1] { '/' });
				if (array.Length >= 4)
				{
					string[] array2 = array[2].Split(new char[1] { ':' });
					if (array2.Length == 2)
					{
						TargetAndroidVersion = array2[1];
					}
					TargetFirmwareVersion = ((!_FlashRes.ModelName.StartsWith("Lenovo", StringComparison.OrdinalIgnoreCase)) ? array[3] : string.Empty);
					TargetFirmwareVisibile = (Visibility)((string.IsNullOrEmpty(TargetAndroidVersion) && string.IsNullOrEmpty(TargetFirmwareVersion)) ? 2 : 0);
				}
			}
			List<DeviceInfoModel> list = new List<DeviceInfoModel>();
			object obj2 = Application.Current.Resources[(object)"v6_Icon_Model_Name"];
			list.Add(new DeviceInfoModel((ImageSource)((obj2 is ImageSource) ? obj2 : null), "K0455", ModelName, 0, 0, false));
			object obj3 = Application.Current.Resources[(object)"v6_Icon_Code"];
			list.Add(new DeviceInfoModel((ImageSource)((obj3 is ImageSource) ? obj3 : null), "K1766", saleModel, 0, 0, false));
			object obj4 = Application.Current.Resources[(object)"v6_Icon_Code"];
			list.Add(new DeviceInfoModel((ImageSource)((obj4 is ImageSource) ? obj4 : null), string.IsNullOrEmpty(text) ? "K0459" : "K0460", IMEI, 1, 0, false));
			object obj5 = Application.Current.Resources[(object)"v6_Icon_Code"];
			list.Add(new DeviceInfoModel((ImageSource)((obj5 is ImageSource) ? obj5 : null), "K0461", text, 1, 0, false));
			object obj6 = Application.Current.Resources[(object)"v6_Icon_Code"];
			list.Add(new DeviceInfoModel((ImageSource)((obj6 is ImageSource) ? obj6 : null), "K0462", sn, 1, 0, false));
			object obj7 = Application.Current.Resources[(object)"v6_Icon_BlurVersion"];
			list.Add(new DeviceInfoModel((ImageSource)((obj7 is ImageSource) ? obj7 : null), "Blur version:", blurVersion, 0, 0, false));
			object obj8 = Application.Current.Resources[(object)"v6_Icon_Fingerprint"];
			list.Add(new DeviceInfoModel((ImageSource)((obj8 is ImageSource) ? obj8 : null), "Fingerprint:", fingerPrint, 0, 0, false));
			object obj9 = Application.Current.Resources[(object)"v6_Icon_RoCarrier"];
			list.Add(new DeviceInfoModel((ImageSource)((obj9 is ImageSource) ? obj9 : null), "Ro.carrier:", roCarrier, 0, 0, false));
			object obj10 = Application.Current.Resources[(object)"v6_Icon_Fsg_version"];
			list.Add(new DeviceInfoModel((ImageSource)((obj10 is ImageSource) ? obj10 : null), "Fsg version:", fsgVersion, 0, 0, false));
			object obj11 = Application.Current.Resources[(object)"v6_Icon_Code"];
			list.Add(new DeviceInfoModel((ImageSource)((obj11 is ImageSource) ? obj11 : null), "K1125", hwCode, 0, 0, false));
			object obj12 = Application.Current.Resources[(object)"v6_Icon_Country"];
			list.Add(new DeviceInfoModel((ImageSource)((obj12 is ImageSource) ? obj12 : null), "K1126", country, 0, 0, false));
			object obj13 = Application.Current.Resources[(object)"v6_Icon_SimCount"];
			list.Add(new DeviceInfoModel((ImageSource)((obj13 is ImageSource) ? obj13 : null), "K1127", simCount, 0, 0, false));
			object obj14 = Application.Current.Resources[(object)"v6_Icon_Memory"];
			list.Add(new DeviceInfoModel((ImageSource)((obj14 is ImageSource) ? obj14 : null), "K1128", memory, 0, 0, false));
			object obj15 = Application.Current.Resources[(object)"v6_Icon_Android_version"];
			list.Add(new DeviceInfoModel((ImageSource)((obj15 is ImageSource) ? obj15 : null), "K0468", text2, 0, 0, false));
			object obj16 = Application.Current.Resources[(object)"v6_Icon_Firmware_version"];
			list.Add(new DeviceInfoModel((ImageSource)((obj16 is ImageSource) ? obj16 : null), "K0467", text3, 0, 0, false));
			List<DeviceInfoModel> source = list;
			ItemArr = new ObservableCollection<DeviceInfoModel>(source.Where((DeviceInfoModel n) => !string.IsNullOrEmpty(n.Item2)));
			RomFileSize = "-";
			RomFileName = _FlashRes.RomResources.Name;
			InitDownloadResources();
			CheckResourcesIsReady();
		}

		private void InitDownloadResources()
		{
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Expected O, but got Unknown
			//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f7: Unknown result type (might be due to invalid IL or missing references)
			//IL_0103: Expected O, but got Unknown
			//IL_0111: Unknown result type (might be due to invalid IL or missing references)
			//IL_0116: Unknown result type (might be due to invalid IL or missing references)
			//IL_0127: Unknown result type (might be due to invalid IL or missing references)
			//IL_0138: Unknown result type (might be due to invalid IL or missing references)
			//IL_0149: Unknown result type (might be due to invalid IL or missing references)
			//IL_015a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0166: Expected O, but got Unknown
			ResourceResponseModel flashRes = _FlashRes;
			DownloadResources = new List<DownloadInfo>();
			if (flashRes.RomResources != null)
			{
				DownloadInfo rom = new DownloadInfo
				{
					DownloadUrl = flashRes.RomResources.URI,
					MD5 = flashRes.RomResources.MD5,
					FileType = flashRes.RomResources.Type,
					UnZip = flashRes.RomResources.UnZip,
					IsManualMatch = false
				};
				DownloadResources.Add(rom);
				Task.Run(delegate
				{
					DownloadInfo downloadedResource = HostProxy.DownloadServerV6.GetDownloadedResource(rom.FileUrl);
					long size = default(long);
					if (downloadedResource != null && downloadedResource.FileSize > 0)
					{
						size = downloadedResource.FileSize;
					}
					else
					{
						GlobalFun.GetFileSize(rom.DownloadUrl, ref size, false);
					}
					rom.FileSize = size;
					((DispatcherObject)Application.Current).Dispatcher.Invoke<string>((Func<string>)(() => RomFileSize = GlobalFun.ConvertLong2String(size, "F1", true)));
				});
			}
			if (flashRes.ToolResource != null)
			{
				DownloadResources.Add(new DownloadInfo
				{
					DownloadUrl = flashRes.ToolResource.URI,
					MD5 = flashRes.ToolResource.MD5,
					FileType = flashRes.ToolResource.Type,
					UnZip = flashRes.ToolResource.UnZip,
					IsManualMatch = false
				});
			}
			if (flashRes.CountryCode != null)
			{
				DownloadResources.Add(new DownloadInfo
				{
					DownloadUrl = flashRes.CountryCode.URI,
					MD5 = flashRes.CountryCode.MD5,
					FileType = flashRes.CountryCode.Type,
					UnZip = flashRes.CountryCode.UnZip,
					IsManualMatch = false
				});
			}
		}

		protected void SupportMutilChange(bool mutil)
		{
			Plugin.SupportMulti = mutil;
			if (Category == DevCategory.Phone)
			{
				MainFrameV6.Instance.ChangeMutilDeviceShowType(mutil);
			}
		}

		public void OnRescue()
		{
			if (IsReady)
			{
				Task.Run(delegate
				{
					//IL_00f8: Unknown result type (might be due to invalid IL or missing references)
					//IL_0113: Unknown result type (might be due to invalid IL or missing references)
					//IL_0126: Unknown result type (might be due to invalid IL or missing references)
					//IL_0128: Unknown result type (might be due to invalid IL or missing references)
					//IL_012b: Unknown result type (might be due to invalid IL or missing references)
					//IL_0434: Unknown result type (might be due to invalid IL or missing references)
					//IL_0475: Unknown result type (might be due to invalid IL or missing references)
					//IL_0459: Unknown result type (might be due to invalid IL or missing references)
					//IL_047c: Unknown result type (might be due to invalid IL or missing references)
					//IL_048d: Unknown result type (might be due to invalid IL or missing references)
					//IL_0497: Expected O, but got Unknown
					try
					{
						((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
						{
							ChangeRescueBtn(FlashStatusV6.Rescuing);
						});
						Message.ShowDownloadCenter(false);
						UcDevice.Locked = true;
						UcDevice.RecipeLocked = false;
						MainFrameV6.Instance.ChangeStatusWhenStartRescue(rescuing: true, Category == DevCategory.Phone);
						startRescueTime = DateTime.Now;
						if (Category != DevCategory.Smart)
						{
							GoogleAccountPromptView lv = null;
							((DispatcherObject)Application.Current).Dispatcher.Invoke<GoogleAccountPromptView>((Func<GoogleAccountPromptView>)delegate
							{
								GoogleAccountPromptView obj = new GoogleAccountPromptView
								{
									CloseAction = delegate(bool? r)
									{
										Message.Close(r, (Action<bool?>)null);
									}
								};
								GoogleAccountPromptView result2 = obj;
								lv = obj;
								return result2;
							});
							Message.ShowCustom((IMessageViewV6)(object)lv).Wait();
							if (!lv.Result.HasValue || lv.Result == false)
							{
								RecipeMessage message = new RecipeMessage
								{
									Device = UcDevice.Device,
									OverallResult = (Result)2,
									FailedResult = (Result)44
								};
								FireRescueFinish(message);
								isGoogle_Account_Quit = true;
								LogHelper.LogInstance.Info("Exit the rescue process by unable to remove google account", false);
								return;
							}
						}
						if (MainFrameV6.Instance.ValidOtherCategoryRescueing(Category) || !ProcessB2B())
						{
							return;
						}
						int result = MainFrameV6.Instance.IsDevAllowRescue(_MatchRes.device, isMatch: false, DeviceInfo.modelName).Result;
						DeviceInfo.rescueMark = ((result != -1) ? result : 0);
						if (result != -1 && result != 1)
						{
							Message.Show("K1555", "K1478", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false).Wait();
							RescueCollectionModel rescueCollectionModel = GengrateSubmitData(2);
							FlashContext.SingleInstance.service.RequestContent(WebServicesContext.UPLOAD_WHEN_FLASH_FINISHED, (object)rescueCollectionModel, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
							LogHelper.LogInstance.WriteLogForUser(JsonHelper.SerializeObject2Json((object)rescueCollectionModel), rescueCollectionModel.rescueResult);
							return;
						}
						if (((!MainFrameV6.Instance.SupportMulti || Category != DevCategory.Phone) && IsConnectedMutilDevice()) || (_FlashRes.latest && Message.Show("K0711", "K0736", "K0327", "K0208", false, (MessageBoxImage)64, (string)null, false, false).Result != true))
						{
							return;
						}
						if (_FlashRes.Category.Equals("Smart", StringComparison.OrdinalIgnoreCase))
						{
							if (Message.Show("K0939", "K0940", "K0397", "K0208", true, (MessageBoxImage)64, (string)null, true, false).Result != true)
							{
								return;
							}
							new HwDetectionDataCollect().BeginCollect();
						}
						else if (_FlashRes.IsShowBackupTip || !_FlashRes.Category.Equals("Smart", StringComparison.OrdinalIgnoreCase))
						{
							if (Message.DataCollectionAndBackConfirm().Result != true)
							{
								return;
							}
							new HwDetectionDataCollect().BeginCollect();
						}
						if (_FlashRes.CountryCode != null)
						{
							Message.Show((string)null, FlashStaticResources.FLASH_LESSSFREESPACE, "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false).Wait();
						}
					}
					finally
					{
						if (!isGoogle_Account_Quit)
						{
							((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
							{
								MainFrameViewModeV6 vM = MainFrameV6.Instance.VM;
								IAMatchView view = View;
								vM.CurrentView = (FrameworkElement)((view is FrameworkElement) ? view : null);
								RescueFrame = null;
								View.RescueView = null;
								ChangeRescueBtn(FlashStatusV6.Ready);
							});
							MainFrameV6.Instance.ChangeStatusWhenStartRescue(rescuing: false, Category == DevCategory.Phone);
							UcDevice.Locked = false;
							startRescueTimeTag = false;
							if (UcDevice.Device != null)
							{
								UcDevice.Device.WorkType = (DeviceWorkType)1;
							}
						}
						isGoogle_Account_Quit = false;
					}
					UcDevice.Locked = true;
					if (UcDevice.Device != null)
					{
						UcDevice.Device.WorkType = (DeviceWorkType)2;
					}
					bool isManual = _MatchRes.matchInfo.matchType == lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.MANUAL;
					if (Category == DevCategory.Phone)
					{
						businessType = (BusinessType)(isManual ? 3030 : 3050);
					}
					else if (Category == DevCategory.Tablet)
					{
						businessType = (BusinessType)(isManual ? 3040 : 3060);
					}
					else
					{
						businessType = (BusinessType)(isManual ? 3045 : 3065);
					}
					businessData = new BusinessData(businessType, _MatchRes.device, (BusinessStatus)0);
					Plugin.OperateTracker("RescueBtnClick", "Begin to rescue button click");
					LogHelper.LogInstance.Info("begin to rescue button click", false);
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						ChangeRescueBtn(FlashStatusV6.Rescuing);
					});
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						if (isManual && View.ParentView.DataContext is ManualMatchViewModel manualMatchViewModel2)
						{
							manualMatchViewModel2.RegisterDeviceAsync();
						}
					});
					UcDevice.Register(LoadRecipeResources(), Message, (Func<RecipeMessageType, object, object>)RescueFlowMonitorFun);
					Task.Run(delegate
					{
						UseCaseRunner.Run((UseCase)1, UcDevice);
					});
				});
				return;
			}
			Plugin.OperateTracker("DownloadBtnClick", "Begin download button clicked!");
			LogHelper.LogInstance.Info("begin download button clicked.", false);
			Message.ShowDownloadCenter(true);
			FlashBtnEnable = false;
			DownloadImage = DownloadingImageIcon;
			FlashBtnText = "K0293";
			DownloadResourcesManager.SingleInstance.PrepareFlashingResources(_FlashRes.ModelName, DownloadResources, delegate(string modelname, DownloadStatus status)
			{
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0036: Unknown result type (might be due to invalid IL or missing references)
				//IL_0038: Invalid comparison between Unknown and I4
				//IL_004d: Unknown result type (might be due to invalid IL or missing references)
				//IL_004f: Invalid comparison between Unknown and I4
				//IL_0064: Unknown result type (might be due to invalid IL or missing references)
				//IL_0066: Invalid comparison between Unknown and I4
				//IL_0084: Unknown result type (might be due to invalid IL or missing references)
				//IL_0086: Invalid comparison between Unknown and I4
				LogHelper.LogInstance.Debug($"rescue download callback, modelname: {modelname}, {status}", false);
				if (modelname == _FlashRes?.ModelName)
				{
					if ((int)status == 1)
					{
						FlashBtnEnable = false;
						FlashBtnText = "K0293";
					}
					else if ((int)status == 8)
					{
						FlashBtnEnable = false;
						FlashBtnText = "K1596";
					}
					else if ((int)status == 5)
					{
						Message.ShowDownloadCenter(false);
						IsReady = true;
						ChangeRescueBtn(FlashStatusV6.Ready);
					}
					else if ((int)status == 4)
					{
						IsReady = false;
						ChangeRescueBtn(FlashStatusV6.Download);
					}
				}
			});
			if (_MatchRes.matchInfo.matchType == lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.MANUAL && View.ParentView.DataContext is ManualMatchViewModel manualMatchViewModel)
			{
				manualMatchViewModel.SaveDownloadUri2LocalFile();
			}
		}

		private void CheckResourcesIsReady()
		{
			FlashBtnText = "K0100";
			FlashBtnEnable = false;
			Task.Run(() => DownloadResourcesManager.SingleInstance.ResourceReadly(DownloadResources)).ContinueWith(delegate(Task<bool> r)
			{
				IsReady = r.Result;
				ChangeRescueBtn(IsReady ? FlashStatusV6.Ready : FlashStatusV6.Download);
			});
		}

		private bool IsConnectedMutilDevice()
		{
			if (HostProxy.deviceManager.ConntectedDevices.Count > 1)
			{
				foreach (DeviceEx conntectedDevice in HostProxy.deviceManager.ConntectedDevices)
				{
					LogHelper.LogInstance.Debug($"{conntectedDevice}", false);
				}
				Message.Show("K0071", FlashStaticResources.AUTO_DEVICECOUNT_CHECK, "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false).Wait();
				return true;
			}
			return false;
		}

		private RecipeResources LoadRecipeResources()
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			RecipeResources val = new RecipeResources();
			val.Add(RecipeResources.ModelName, _FlashRes?.ModelName);
			val.Add(RecipeResources.RealModelName, _FlashRes?.RealModelName);
			val.Add(RecipeResources.RecipeUrl, _FlashRes.RecipeResource);
			val.Add("Platform", _FlashRes.Platform);
			val.Add("IsFastboot", _FlashRes.fastboot.ToString());
			val.Add("Mutil", Plugin.SupportMulti.ToString());
			val.AddResource(RecipeResources.Rom, _FlashRes.RomResources.URI);
			if (_FlashRes.ToolResource != null)
			{
				val.AddResource(RecipeResources.TooL, _FlashRes.ToolResource.URI);
			}
			if (_FlashRes.CountryCode != null)
			{
				val.AddResource(RecipeResources.CountryCode, _FlashRes.CountryCode.URI);
			}
			val.Add("category", _FlashRes.Category);
			val.Add("connectType", "auto");
			return val;
		}

		private bool ProcessB2B()
		{
			if (Category == DevCategory.Phone)
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => FlashBtnEnable = false));
				b2bOrderId = null;
				ResponseModel<RespOrders> val = FlashContext.SingleInstance.service.Request<RespOrders>(WebApiUrl.CALL_B2B_QUERY_ORDER_URL, (object)new
				{
					macAddressRsa = RsaHelper.RSAEncrypt(WebApiContext.RSA_PUBLIC_KEY, GlobalFun.GetMacAddr()),
					imei = (DeviceInfo.imei ?? ""),
					modelName = ModelName
				}, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				if (val.code == "0003" || val.code == "9999")
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => FlashBtnEnable = true));
					return true;
				}
				RespOrders data = val.content;
				RespOrders obj = data;
				if (((obj != null) ? obj.enableOrderDtos : null) != null && data.enableOrderDtos.Count > 0)
				{
					b2bOrderId = data.enableOrderDtos[0].orderId;
				}
				RespOrders obj2 = data;
				if (obj2 != null && obj2.popUp)
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke<Task>((Func<Task>)async delegate
					{
						if (data.popMode == 0)
						{
							await MainFrameV6.Instance.IMsgManager.ShowB2BRemind(data.usedFreeAmount, data.freeAmount);
						}
						else if (data.popMode == 1)
						{
							await MainFrameV6.Instance.IMsgManager.ShowB2BExpired(1);
						}
						else if (data.popMode == 2)
						{
							await MainFrameV6.Instance.IMsgManager.ShowB2BExpired(2);
						}
						else if (data.popMode == 3)
						{
							await MessageWindowHelper.Instance.Show((string)null, "K1772", "K0327", (string)null, true, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
						}
					});
				}
				((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => FlashBtnEnable = true));
				return b2bOrderId.HasValue;
			}
			return true;
		}

		private void InstallDriver()
		{
			Action action = delegate
			{
				Message.Show("K0711", FlashStaticResources.DRIVER_INSTALL_CONFIRM, "K0295", (string)null, false, (MessageBoxImage)64, (string)null, false, false).Wait();
			};
			if (Regex.IsMatch(ModelName, "L19111", RegexOptions.IgnoreCase))
			{
				LogHelper.LogInstance.Debug("check l19111 driver", false);
				string text = default(string);
				DriversHelper.CheckAndInstallInfDriver((DriverType)7, action, ref text);
				if (!string.IsNullOrEmpty(text))
				{
					LogHelper.LogInstance.Info(text, false);
				}
			}
			else if (Regex.IsMatch(ModelName, "SP101FU", RegexOptions.IgnoreCase))
			{
				LogHelper.LogInstance.Debug("check Lenovo SP101FU driver", false);
				string text2 = default(string);
				DriversHelper.CheckAndInstallInfDriver((DriverType)9, action, ref text2);
				if (!string.IsNullOrEmpty(text2))
				{
					LogHelper.LogInstance.Info(text2, false);
				}
			}
			else if (Regex.IsMatch(ModelName, "CD-17302F", RegexOptions.IgnoreCase))
			{
				LogHelper.LogInstance.Debug("check Lenovo CD-17302F driver", false);
				string text3 = default(string);
				DriversHelper.CheckAndInstallInfDriver((DriverType)12, (Action)null, ref text3);
				if (!string.IsNullOrEmpty(text3))
				{
					LogHelper.LogInstance.Info(text3, false);
				}
			}
		}

		private object RescueFlowMonitorFun(RecipeMessageType messageType, object content)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000a: Invalid comparison between Unknown and I4
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected I4, but got Unknown
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_0132: Unknown result type (might be due to invalid IL or missing references)
			//IL_0152: Unknown result type (might be due to invalid IL or missing references)
			//IL_0105: Unknown result type (might be due to invalid IL or missing references)
			//IL_0106: Unknown result type (might be due to invalid IL or missing references)
			//IL_010c: Invalid comparison between Unknown and I4
			RecipeMessage val = default(RecipeMessage);
			if ((int)messageType != 5)
			{
				val = (RecipeMessage)content;
			}
			switch ((int)messageType)
			{
			case 0:
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					Free();
					MainFrameV6.Instance.ChangeContainerHorizontalAlignment();
					MainFrameViewModeV6 vM = MainFrameV6.Instance.VM;
					IAMatchView view = View;
					vM.CurrentView = (FrameworkElement)((view is FrameworkElement) ? view : null);
				});
				ChangeRescueBtn(FlashStatusV6.Ready);
				RescueCollectionModel rescueCollectionModel = GengrateSubmitData(-1);
				FlashContext.SingleInstance.service.RequestContent(WebServicesContext.UPLOAD_WHEN_FLASH_FINISHED, (object)rescueCollectionModel, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				LogHelper.LogInstance.WriteLogForUser(JsonHelper.SerializeObject2Json((object)rescueCollectionModel), rescueCollectionModel.rescueResult);
				break;
			}
			case 1:
				UpdateRescuingView(val.Message?.ToString());
				if (!startRescueTimeTag)
				{
					startRescueTimeTag = true;
					startRescueTime = DateTime.Now;
				}
				break;
			case 2:
				UpdateRescuingView(null, val.Progress);
				if (val.Progress == 100.0)
				{
					if ((int)val.OverallResult == 1 && !_RescueFinished)
					{
						_RescueFinished = true;
					}
					else if (_RescueFinished)
					{
						_IsSetCountryCode = true;
					}
				}
				break;
			case 3:
				UpdateRescuingView(null, val.Progress);
				break;
			case 5:
				return ValidRescuingData(content as Dictionary<string, string>);
			case 6:
				FireRescueFinish(val);
				break;
			case 7:
				MainFrameV6.Instance.RealFalshing(_MatchRes.Id);
				break;
			}
			return true;
		}

		private void FireRescueFinish(RecipeMessage message)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected I4, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_0077: Invalid comparison between Unknown and I4
			//IL_0478: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_008a: Invalid comparison between Unknown and I4
			//IL_049d: Unknown result type (might be due to invalid IL or missing references)
			//IL_04a4: Invalid comparison between Unknown and I4
			//IL_048a: Unknown result type (might be due to invalid IL or missing references)
			//IL_04d9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ee: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f5: Invalid comparison between Unknown and I4
			//IL_010c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0113: Invalid comparison between Unknown and I4
			//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bd: Invalid comparison between Unknown and I4
			//IL_050e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0124: Unknown result type (might be due to invalid IL or missing references)
			//IL_012b: Invalid comparison between Unknown and I4
			//IL_00c1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Invalid comparison between Unknown and I4
			//IL_013a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0141: Invalid comparison between Unknown and I4
			//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d2: Invalid comparison between Unknown and I4
			//IL_0150: Unknown result type (might be due to invalid IL or missing references)
			//IL_0157: Invalid comparison between Unknown and I4
			//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00dd: Invalid comparison between Unknown and I4
			//IL_0527: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b0: Invalid comparison between Unknown and I4
			//IL_015b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0162: Invalid comparison between Unknown and I4
			//IL_01f5: Unknown result type (might be due to invalid IL or missing references)
			//IL_01fc: Invalid comparison between Unknown and I4
			//IL_0166: Unknown result type (might be due to invalid IL or missing references)
			//IL_016d: Invalid comparison between Unknown and I4
			//IL_0200: Unknown result type (might be due to invalid IL or missing references)
			//IL_0207: Invalid comparison between Unknown and I4
			//IL_0171: Unknown result type (might be due to invalid IL or missing references)
			//IL_0178: Invalid comparison between Unknown and I4
			//IL_017c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0183: Invalid comparison between Unknown and I4
			//IL_02ff: Unknown result type (might be due to invalid IL or missing references)
			//IL_0306: Invalid comparison between Unknown and I4
			//IL_031b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0322: Invalid comparison between Unknown and I4
			//IL_0337: Unknown result type (might be due to invalid IL or missing references)
			//IL_033e: Invalid comparison between Unknown and I4
			//IL_035c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0361: Unknown result type (might be due to invalid IL or missing references)
			//IL_036d: Expected O, but got Unknown
			//IL_0447: Unknown result type (might be due to invalid IL or missing references)
			//IL_044d: Invalid comparison between Unknown and I4
			//IL_03d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_0410: Unknown result type (might be due to invalid IL or missing references)
			//IL_03f8: Unknown result type (might be due to invalid IL or missing references)
			//IL_0417: Unknown result type (might be due to invalid IL or missing references)
			//IL_0428: Unknown result type (might be due to invalid IL or missing references)
			//IL_0432: Expected O, but got Unknown
			int num = (int)message.OverallResult;
			bool flag = num == 1;
			string text = null;
			bool flag2 = false;
			bool? flag3 = false;
			bool flag4 = false;
			if (_IsSetCountryCode)
			{
				text = (flag ? FlashStaticResources.COUNTRYCODE_SETTING_SUCCESS_TITLE : FlashStaticResources.COUNTRYCODE_SETTING_FAILED_TITLE);
			}
			if (message.FailedResult.HasValue)
			{
				Result? failedResult = message.FailedResult;
				int count = FlashFailedGuideHelper.GetCount(HostProxy.User.user.UserId, DeviceInfo.modelName, success: false);
				if ((int)failedResult.GetValueOrDefault() == 43)
				{
					flag4 = true;
				}
				else if ((int)failedResult.GetValueOrDefault() == 13)
				{
					flag3 = true;
					text = (flag ? "K1619" : "K1238");
				}
				else if (count != 3 && count != 10 && ((int)failedResult.GetValueOrDefault() == 20 || (int)failedResult.GetValueOrDefault() == 8 || (int)failedResult.GetValueOrDefault() == 16 || (int)failedResult.GetValueOrDefault() == 25))
				{
					text = "K1202";
					flag2 = true;
				}
				else if ((int)failedResult.GetValueOrDefault() == 10)
				{
					text = "K1239";
					flag3 = true;
				}
				else if ((int)failedResult.GetValueOrDefault() == 34)
				{
					text = "K1333";
					flag2 = true;
				}
				else if ((int)failedResult.GetValueOrDefault() == 30)
				{
					text = "K1204";
				}
				else if ((int)failedResult.GetValueOrDefault() == 29)
				{
					text = "K1205";
				}
				else if ((int)failedResult.GetValueOrDefault() == 22 || (int)failedResult.GetValueOrDefault() == 37 || (int)failedResult.GetValueOrDefault() == 24 || (int)failedResult.GetValueOrDefault() == 23 || (int)failedResult.GetValueOrDefault() == 41)
				{
					DeviceInfo.rescueMark = 7;
					fileLostMessage = "K1418";
					flag3 = null;
					if ((int)failedResult.GetValueOrDefault() == 24)
					{
						if (!string.IsNullOrEmpty(_FlashRes.CountryCode?.Name))
						{
							deleteResources.Add(_FlashRes.CountryCode.Name);
						}
					}
					else if ((int)failedResult.GetValueOrDefault() == 23 || (int)failedResult.GetValueOrDefault() == 41)
					{
						if (!string.IsNullOrEmpty(_FlashRes.RomResources?.Name))
						{
							deleteResources.Add(_FlashRes.RomResources.Name);
						}
					}
					else
					{
						if (!string.IsNullOrEmpty(_FlashRes.RomResources?.Name))
						{
							deleteResources.Add(_FlashRes.RomResources.Name);
						}
						if (!string.IsNullOrEmpty(_FlashRes.ToolResource?.Name))
						{
							deleteResources.Add(_FlashRes.ToolResource.Name);
						}
						if (!string.IsNullOrEmpty(_FlashRes.CountryCode?.Name))
						{
							deleteResources.Add(_FlashRes.CountryCode.Name);
						}
					}
				}
				else if ((int)failedResult.GetValueOrDefault() == 17)
				{
					DeviceInfo.rescueMark = 4;
				}
				else if ((int)failedResult.GetValueOrDefault() == 19)
				{
					DeviceInfo.rescueMark = 8;
				}
				else if ((int)failedResult.GetValueOrDefault() == 44)
				{
					DeviceInfo.rescueMark = 12;
					UcDevice.Log = new ResultLogger(UcDevice)
					{
						UseCase = (UseCase)1
					};
					UcDevice.Log.AddLog("quit the rescue process by unable to remove google account", true, (Exception)null);
					UseCaseRunner.Loggers.Add(UcDevice.Log.ClassGuid, UcDevice.Log);
					bool flag5 = _MatchRes.matchInfo.matchType == lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.MANUAL;
					if (Category == DevCategory.Phone)
					{
						businessType = (BusinessType)(flag5 ? 3030 : 3050);
					}
					else if (Category == DevCategory.Tablet)
					{
						businessType = (BusinessType)(flag5 ? 3040 : 3060);
					}
					else
					{
						businessType = (BusinessType)(flag5 ? 3045 : 3065);
					}
					businessData = new BusinessData(businessType, _MatchRes.device, (BusinessStatus)0);
				}
				else if (num == 2)
				{
					if (DeviceInfo.rescueMark == 0 && (int)failedResult.GetValueOrDefault() == 4)
					{
						DeviceInfo.rescueMark = 9;
					}
					text = null;
				}
				else
				{
					text = "K1663";
				}
			}
			else if (!flag)
			{
				if (num == 0)
				{
					text = "K1663";
					flag2 = true;
				}
			}
			else if (!string.IsNullOrEmpty(message.Message as string))
			{
				text = message.Message.ToString();
			}
			if ((int)message.FailedResult.GetValueOrDefault() == 42)
			{
				DeviceInfo.rescueMark = 10;
				Task.Run(() => MessageWindowHelper.Instance.Show("K0711", "K1885", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)delegate
				{
					MainFrameV6.Instance.IMsgManager.LogOut();
				}, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false));
			}
			SubmitRescueRecord(message);
			if (num != 2)
			{
				FlashFailedGuideHelper.CollectFalshResult(HostProxy.User.user.UserId, DeviceInfo.modelName, flag);
				Configurations.AddRescueResult(flag);
			}
			if (flag4)
			{
				SortedList<string, string> info = message.Info;
				if (info != null && info.ContainsKey("trackId"))
				{
					string identifer = message.Info["trackId"];
					ForceReAutoMatch(identifer);
					return;
				}
			}
			if (flag)
			{
				ChangeRescueBtn(FlashStatusV6.PASS, text);
				return;
			}
			ChangeRescueBtn((num == 2) ? FlashStatusV6.QUIT : FlashStatusV6.FAIL, new Dictionary<string, object>
			{
				{ "msg", text },
				{ "normal", flag3 },
				{ "retry", flag2 }
			});
		}

		private int ValidRescuingData(Dictionary<string, string> dic)
		{
			_ = dic["tractId"];
			string text = dic["modelname"];
			string text2 = dic["imei"];
			string text3 = dic["fdrallowed"];
			string text4 = dic["securestate"];
			string device = dic["softwareVersion"];
			string text5 = dic["cid"];
			string value = dic["versioncheck"];
			bool flag = dic["onlyCheckModelName"].Equals("True", StringComparison.CurrentCultureIgnoreCase);
			bool flag2 = bool.Parse(dic["errorRules"]);
			string text6 = dic["errorRuleMessage"];
			int rescueMark = DeviceInfo.rescueMark;
			int num = -1;
			UcDevice.Log.AddLog("connected fastboot device modelname: " + text + ", resource match modelname: " + _FlashRes.ModelName + " | " + _FlashRes.RealModelName + ", fdrallowed: " + text3 + "，securestate: " + text4 + ", cid: " + text5, true, (Exception)null);
			try
			{
				bool flag3 = text3?.ToLower() == "no";
				bool flag4 = text4?.ToLower() == "flashing_locked";
				if (string.IsNullOrEmpty(text) || Regex.IsMatch(text, "^[0]+$"))
				{
					DeviceInfo.rescueMark = 5;
					Message.Show("K0071", "K1478", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false).Wait();
					num = 0;
				}
				else if (text != _FlashRes.ModelName && text != _FlashRes.RealModelName)
				{
					DeviceInfo.rescueMark = 5;
					ModelNameMatch = false;
					string text7 = string.Format(HostProxy.LanguageService.Translate(FlashStaticResources.RESUCE_AUTO_MATCH_FASTBOOT_DEVICE_CONFIRM), text);
					if (!flag && Message.Show("K0071", text7, "K0571", "K0570", false, (MessageBoxImage)48, (string)null, false, false).Result == true)
					{
						DeviceInfo.rescueMark = 5;
						num = 7;
					}
					else
					{
						num = 0;
					}
				}
				else if (flag2)
				{
					string text8 = (string.IsNullOrEmpty(text6) ? "K1478" : HostProxy.LanguageService.Translate(text6));
					Message.Show("K1555", text8, "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false).Wait();
					num = 6;
				}
				else if (!flag)
				{
					if (flag4)
					{
						DeviceInfo.rescueMark = 2;
						num = 3;
					}
					else if (MainFrameV6.Instance.FastbootErrorStatusArr.Contains(text5))
					{
						num = 5;
						DeviceInfo.rescueMark = 6;
					}
					else if (flag3)
					{
						DeviceInfo.rescueMark = 1;
					}
					if (num != -1)
					{
						if (flag3 && flag4)
						{
							DeviceInfo.rescueMark = 2;
						}
						Message.Show("K0071", "K1478", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false).Wait();
						return num;
					}
					bool? flag5 = null;
					if (!string.IsNullOrEmpty(value))
					{
						flag5 = Convert.ToBoolean(value);
					}
					if (flag5 == true || (!flag5.HasValue && !new CheckFingerPrintVersion().Check(device, _FlashRes.fingerprint, null)))
					{
						Message.Show("K0071", "K1119", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false).Wait();
						DegradeInfos = new Dictionary<string, string>
						{
							{ "modelName", text },
							{ "romFingerPrint", _FlashRes.fingerprint },
							{ "romMatchId", _FlashRes.romMatchId }
						};
						DeviceInfo.rescueMark = 4;
						return 1;
					}
				}
				return num;
			}
			finally
			{
				if (flag)
				{
					DeviceInfo.rescueMark = rescueMark;
				}
				else if (!ForceReMatch && num != 0)
				{
					if (!string.IsNullOrEmpty(text2))
					{
						DeviceInfo.imei = text2;
					}
					if (!string.IsNullOrEmpty(text))
					{
						DeviceInfo.modelName = text;
					}
					if (dic.ContainsKey("channelid") && !string.IsNullOrEmpty(dic["channelid"]))
					{
						DeviceInfo.channelId = dic["channelid"];
					}
					if (!string.IsNullOrEmpty(text5))
					{
						DeviceInfo.cid = text5;
					}
				}
			}
		}

		private void SubmitRescueRecord(RecipeMessage message)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_015b: Unknown result type (might be due to invalid IL or missing references)
			//IL_015c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0162: Invalid comparison between Unknown and I4
			//IL_00db: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e3: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Unknown result type (might be due to invalid IL or missing references)
			//IL_016c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0173: Invalid comparison between Unknown and I4
			//IL_00f5: Unknown result type (might be due to invalid IL or missing references)
			//IL_02db: Unknown result type (might be due to invalid IL or missing references)
			//IL_018e: Unknown result type (might be due to invalid IL or missing references)
			RescueCollectionModel rescueCollectionModel = GengrateSubmitData(Convert.ToInt32(message.OverallResult));
			if (message.Info != null && message.Info.Count > 0)
			{
				RescueDeviceInfoModel rescueDeviceInfoModel = FlashBusiness.ConvertFastbootDeviceInfo(message.Info);
				if (ModelNameMatch)
				{
					FlashBusiness.Copy(rescueDeviceInfoModel, rescueCollectionModel);
					if (rescueCollectionModel.rescueMark == 0 && rescueDeviceInfoModel.rescueMark != 0)
					{
						rescueCollectionModel.rescueMark = rescueDeviceInfoModel.rescueMark;
					}
				}
				message.Info.TryGetValue("rescuemark", out var value);
				if (!string.IsNullOrEmpty(value) && int.TryParse(value, out var result) && result > 0)
				{
					rescueCollectionModel.rescueMark = result;
				}
				_MatchRes.matchInfo.matchDevice = rescueDeviceInfoModel;
			}
			if (!string.IsNullOrEmpty(message.FailedStepName))
			{
				rescueCollectionModel.resultDescription = message.FailedStepName;
			}
			if (!string.IsNullOrEmpty(message.failedDescription))
			{
				string failureCode = message.failedDescription;
				if (message.failedDescription.Length >= 255)
				{
					failureCode = message.failedDescription.Substring(0, 255);
				}
				rescueCollectionModel.failureCode = failureCode;
			}
			double totalMilliseconds = DateTime.Parse(rescueCollectionModel.rescueTime).Subtract(DateTime.Parse(rescueCollectionModel.startRescueTime)).TotalMilliseconds;
			UcDevice.Log.AddLog(_MatchRes.matchInfo.ToString(), true, (Exception)null);
			if ((int)message.OverallResult != 1)
			{
				rescueCollectionModel.errorMsg = (((int)message.FailedResult.GetValueOrDefault() == 42) ? null : UcDevice.Log.UploadLogs);
				rescueCollectionModel.description = message.failedDescription;
			}
			else if (totalMilliseconds <= 90000.0)
			{
				string path = Path.Combine(Environment.CurrentDirectory, Guid.NewGuid().ToString("N") + ".tmp");
				File.WriteAllText(path, UcDevice.Log.UploadLogs, Encoding.UTF8);
				List<string> files = new List<string> { path };
				Dictionary<string, string> dic = new Dictionary<string, string>
				{
					{
						"version",
						LMSAContext.MainProcessVersion
					},
					{ "username", "RSA-Rescue-Less90" },
					{
						"crashTime",
						DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
					}
				};
				Task.Run(() => ((ApiBaseService)FlashContext.SingleInstance.service).UploadAsync(WebApiUrl.RESUCE_FAILED_UPLOAD, files, dic, true, true)).ContinueWith((Task<bool> s) => GlobalFun.TryDeleteFile(path));
			}
			string recipeName = Path.GetFileName(_FlashRes.RecipeResource).Split(new char[1] { '?' })[0];
			Dictionary<string, string> degradeInfos = null;
			if (DegradeInfos != null)
			{
				degradeInfos = new Dictionary<string, string>(DegradeInfos);
			}
			RescueSubmitManager.Instance.CreateSubmitTask(UcDevice.Log.ClassGuid, rescueCollectionModel, businessType, BusinessData.Clone(businessData), recipeName, degradeInfos);
		}

		private RescueCollectionModel GengrateSubmitData(int rescueStatus)
		{
			RescueCollectionModel rescueCollectionModel = new RescueCollectionModel();
			FlashBusiness.Copy(DeviceInfo, rescueCollectionModel);
			rescueCollectionModel.rescueMark = DeviceInfo.rescueMark;
			rescueCollectionModel.version = _FlashRes.RomResources.Name;
			rescueCollectionModel.rescueResult = rescueStatus;
			rescueCollectionModel.startRescueTime = startRescueTime.ToString("yyyy-MM-dd HH:mm:ss");
			rescueCollectionModel.rescueTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
			rescueCollectionModel.automatched = _MatchRes.device != null;
			rescueCollectionModel.clientUuid = GlobalFun.GetClientUUID();
			rescueCollectionModel.orderId = b2bOrderId;
			rescueCollectionModel.category = _FlashRes.Category;
			rescueCollectionModel.romMatchType = Convert.ToInt32(_MatchRes.matchInfo.matchType);
			return rescueCollectionModel;
		}

		private void RescueResultClick(bool success)
		{
			string category = _FlashRes.Category;
			string text = (_FlashRes.Brand + category).ToLowerInvariant();
			int count = FlashFailedGuideHelper.GetCount(HostProxy.User.user.UserId, DeviceInfo.modelName, success);
			if (success)
			{
				LogHelper.LogInstance.Debug($"{DeviceInfo.modelName} successcount: {count}", false);
				if (count != 5)
				{
					return;
				}
				RescueSuccessSubmitView vv = null;
				((DispatcherObject)Application.Current).Dispatcher.Invoke<RescueSuccessSubmitView>((Func<RescueSuccessSubmitView>)delegate
				{
					RescueSuccessSubmitView obj = new RescueSuccessSubmitView(DeviceInfo.modelName)
					{
						CloseAction = delegate(bool? r)
						{
							Message.Close(r, (Action<bool?>)null);
						}
					};
					RescueSuccessSubmitView result = obj;
					vv = obj;
					return result;
				});
				Message.ShowCustom((IMessageViewV6)(object)vv).Wait();
				if (vv.Result.HasValue)
				{
					Message.Show("K0711", (vv.Result == true) ? "K0733" : "K0734", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false).Wait();
				}
				return;
			}
			LogHelper.LogInstance.Debug($"{DeviceInfo.modelName} failedcount: {count}, brandcategory: {text}", false);
			switch (count)
			{
			case 3:
			{
				string categorycv = ((text == "motorolaphone") ? "motoPhone" : ((text == "lenovophone") ? "lenovoPhone" : "lenovoTablet"));
				RescueFailedSubmitView vv3 = null;
				((DispatcherObject)Application.Current).Dispatcher.Invoke<RescueFailedSubmitView>((Func<RescueFailedSubmitView>)delegate
				{
					RescueFailedSubmitView obj = new RescueFailedSubmitView(categorycv)
					{
						CloseAction = delegate(bool? r)
						{
							Message.Close(r, (Action<bool?>)null);
						}
					};
					RescueFailedSubmitView result = obj;
					vv3 = obj;
					return result;
				});
				Message.ShowCustom((IMessageViewV6)(object)vv3).Wait();
				break;
			}
			case 10:
			{
				if (!(LMSAContext.CurrentLanguage == "en-US"))
				{
					break;
				}
				RescueFailedForFreedbackView vv2 = null;
				((DispatcherObject)Application.Current).Dispatcher.Invoke<RescueFailedForFreedbackView>((Func<RescueFailedForFreedbackView>)delegate
				{
					RescueFailedForFreedbackView obj = new RescueFailedForFreedbackView
					{
						CloseAction = delegate(bool? r)
						{
							Message.Close(r, (Action<bool?>)null);
						}
					};
					RescueFailedForFreedbackView result = obj;
					vv2 = obj;
					return result;
				});
				Message.ShowCustom((IMessageViewV6)(object)vv2).Wait();
				break;
			}
			}
		}

		protected void ChangeRescueBtn(FlashStatusV6 status, object data = null)
		{
			switch (status)
			{
			case FlashStatusV6.Download:
				DownloadImage = DownloadImageIcon;
				FlashBtnText = "K0100";
				FlashBtnEnable = true;
				ForceReMatch = false;
				ModelNameMatch = true;
				break;
			case FlashStatusV6.Ready:
				DownloadImage = null;
				FlashBtnText = "K0102";
				FlashBtnEnable = true;
				DegradeInfos = null;
				_RescueFinished = false;
				_IsSetCountryCode = false;
				ForceReMatch = false;
				ModelNameMatch = true;
				break;
			case FlashStatusV6.Rescuing:
				FlashBtnText = "K0103";
				deleteResources.Clear();
				fileLostMessage = null;
				RescueFrame = new RescueFrameV6(this);
				View.RescueView = (FrameworkElement)(object)RescueFrame;
				RescueFrame.ChangeView(status, delegate(FrameworkElement view)
				{
					RescuingViewV6 rescuingViewV = view as RescuingViewV6;
					if (Plugin.SupportMulti)
					{
						rescuingViewV.Init(ModelName, IMEI);
					}
				});
				MainFrameV6.Instance.ChangeContainerHorizontalAlignment(falshing: true);
				MainFrameV6.Instance.VM.CurrentView = View.RescueView;
				break;
			case FlashStatusV6.PASS:
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					RescueFrame.ChangeView(status, delegate(FrameworkElement view)
					{
						RescuingSuccessViewV6 obj = view as RescuingSuccessViewV6;
						obj.OkAction = delegate
						{
							Task.Run(delegate
							{
								string romFile = _FlashRes.RomResources.Name;
								if (!Plugin.SupportMulti && !string.IsNullOrEmpty(romFile) && ConfigurationManager.AppSettings["NotShowDeleteRom"]?.ToString() != "true")
								{
									DelRomView vv = null;
									((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
									{
										vv = new DelRomView();
										vv.Init(romFile);
										vv.CloseAction = delegate(bool? r)
										{
											Message.Close(r, (Action<bool?>)null);
										};
									});
									Message.ShowCustom((IMessageViewV6)(object)vv).Wait();
								}
								if (!Plugin.SupportMulti && Category != DevCategory.Smart && !(Configurations.BackupLastDateTime < DateTime.Now.AddDays(-1.0)))
								{
									RescueRestoreView rrv = null;
									((DispatcherObject)Application.Current).Dispatcher.Invoke<RescueRestoreView>((Func<RescueRestoreView>)delegate
									{
										RescueRestoreView obj2 = new RescueRestoreView
										{
											CloseAction = delegate(bool? r)
											{
												Message.Close(r, (Action<bool?>)null);
											}
										};
										RescueRestoreView result = obj2;
										rrv = obj2;
										return result;
									});
									if (Message.ShowCustom((IMessageViewV6)(object)rrv).Result == true)
									{
										((DispatcherObject)Application.Current).Dispatcher.BeginInvoke((Delegate)(Action)delegate
										{
											HostProxy.HostNavigation.SwitchTo("13f79fe4cfc98747c78794a943886bcd");
										}, Array.Empty<object>());
									}
								}
								RescueResultClick(success: true);
								((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
								{
									Free();
									if (Category == DevCategory.Phone)
									{
										MainFrameV6.Instance.RemoveDevice(_MatchRes.Id);
									}
									else
									{
										MainFrameV6.Instance.FormRescueSuccessViewToPrevView(View);
									}
									ChangeRescueBtn(FlashStatusV6.Ready);
								});
							});
						};
						obj.Init(usedMinutes: (int)Math.Floor(DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")).Subtract(DateTime.Parse(startRescueTime.ToString("yyyy-MM-dd HH:mm:ss"))).TotalMinutes), mesage: data as string, modelName: ModelName, imei: DeviceInfo.imei);
					});
				});
				break;
			case FlashStatusV6.FAIL:
			case FlashStatusV6.QUIT:
				if (RescueFrame == null)
				{
					break;
				}
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					RescueFrame.ChangeView(status, delegate(FrameworkElement view)
					{
						RescuingFailViewV6 obj = view as RescuingFailViewV6;
						obj.ClickAction = delegate(int opType)
						{
							Task.Run(delegate
							{
								if (status != FlashStatusV6.QUIT)
								{
									RescueResultClick(success: false);
								}
								bool? delete = null;
								if (deleteResources.Count > 0)
								{
									delete = Message.Show("K0071", fileLostMessage, "K0327", "K0208", false, (MessageBoxImage)48, (string)null, false, false).Result;
									((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
									{
										if (delete == true)
										{
											GlobalCmdHelper.Instance.Execute((object)new
											{
												type = (GlobalCmdType)4,
												data = deleteResources
											});
										}
									});
								}
								((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
								{
									Free(opType != 1);
									MainFrameV6.Instance.ChangeContainerHorizontalAlignment();
									if (delete == false)
									{
										ChangeRescueBtn(FlashStatusV6.Ready);
										if (Category == DevCategory.Phone)
										{
											MainFrameV6.Instance.RemoveDevice(_MatchRes.Id);
										}
										else
										{
											MainFrameV6.Instance.FormRescueSuccessViewToPrevView(View);
										}
									}
									else
									{
										MainFrameV6.Instance.VM.ChangeDeviceEnable();
										MainFrameViewModeV6 vM = MainFrameV6.Instance.VM;
										IAMatchView view2 = View;
										vM.CurrentView = (FrameworkElement)((view2 is FrameworkElement) ? view2 : null);
										if (delete == true)
										{
											IsReady = false;
											ChangeRescueBtn(FlashStatusV6.Download);
										}
										else if (opType == 1)
										{
											ChangeRescueBtn(FlashStatusV6.Ready);
											if (HostProxy.HostNavigation.CurrentPluginID == "8ab04aa975e34f1ca4f9dc3a81374e2c")
											{
												OnRescue();
											}
										}
										else
										{
											ChangeRescueBtn(FlashStatusV6.Ready);
										}
									}
								});
							});
						};
						Dictionary<string, object> dictionary = data as Dictionary<string, object>;
						obj.Init(status, ModelName, IMEI, dictionary["msg"] as string, dictionary["normal"] as bool?, (bool)dictionary["retry"], Category);
					});
				});
				break;
			}
			if (!ForceReMatch)
			{
				MainFrameV6.Instance.ChangeStatus(_MatchRes.Id, status);
			}
		}

		private void ForceReAutoMatch(string Identifer, bool isFree = true)
		{
			if (string.IsNullOrEmpty(Identifer))
			{
				return;
			}
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				Free();
				MainFrameV6.Instance.ChangeContainerHorizontalAlignment();
				ChangeRescueBtn(FlashStatusV6.Ready);
				ForceReMatch = true;
				MainFrameV6.Instance.RemoveDevice(_MatchRes.Id, ForceReMatch);
				MainFrameV6.Instance.ChangeView(PageIndex.PHONE_ENTRANCE);
				DeviceEx device = HostProxy.deviceManager.ConntectedDevices.FirstOrDefault((DeviceEx n) => n.Identifer == Identifer);
				MainFrameV6.Instance.AutoMatch(device);
			});
		}

		protected void UpdateRescuingView(string message, double percentage = 0.0)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				percentage /= 100.0;
				if (percentage > 1.0)
				{
					percentage = 1.0;
				}
				if (percentage > 0.0)
				{
					MainFrameV6.Instance.VM.ChangeRescuingPercentage(_MatchRes.Id, percentage);
				}
				if (RescueFrame != null && RescueFrame.View is RescuingViewV6 rescuingViewV)
				{
					rescuingViewV.ChangeData(message, percentage);
				}
			});
		}

		protected void ReSelectCommandHandler(object args)
		{
			MainFrameV6.Instance.FromRescueViewToPreviousView();
		}

		public void Free(bool freeWorkType = true)
		{
			UcDevice.Locked = false;
			UcDevice.RealFlash = false;
			if (UcDevice.Device != null && freeWorkType)
			{
				UcDevice.Device.WorkType = (DeviceWorkType)1;
			}
			RescueFrame = null;
			View.RescueView = null;
			MainFrameV6.Instance.VM.ChangeRescuingPercentage(_MatchRes.Id, 0.0);
		}

		protected void CopyCommandHandler(object args)
		{
			DeviceInfoModel data = (DeviceInfoModel)((args is DeviceInfoModel) ? args : null);
			Clipboard.SetDataObject((object)data.Item2);
			data.Item5 = true;
			Task.Run(delegate
			{
				Thread.Sleep(800);
			}).ContinueWith((Task s) => HostProxy.CurrentDispatcher.Invoke<bool>((Func<bool>)(() => data.Item5 = false)));
		}

		static AutoMatchViewModel()
		{
			object obj = Application.Current.Resources[(object)"v6_download_icon"];
			DownloadImageIcon = (ImageSource)((obj is ImageSource) ? obj : null);
			object obj2 = Application.Current.Resources[(object)"v6_downloading_icon"];
			DownloadingImageIcon = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
		}
	}
	public class TabletEntranceViewV6 : UserControl, IComponentConnector
	{
		internal Button btnFastboot;

		internal Border bdFastboot;

		internal Button btnSN;

		private bool _contentLoaded;

		public TabletEntranceViewV6()
		{
			InitializeComponent();
		}

		public void UpdateGridLayout()
		{
			if (MainFrameV6.Instance.IsChinaUs())
			{
				Grid.SetRow((UIElement)(object)btnFastboot, 1);
				Grid.SetRow((UIElement)(object)btnSN, 3);
				((UIElement)bdFastboot).Visibility = (Visibility)0;
				((Control)btnSN).TabIndex = ((!MainFrameV6.Instance.IsChinaUs(isOnlyChina: true)) ? 2 : 0);
			}
			else
			{
				((Control)btnSN).TabIndex = 1;
				Grid.SetRow((UIElement)(object)btnSN, 1);
				Grid.SetRow((UIElement)(object)btnFastboot, 3);
				((UIElement)bdFastboot).Visibility = (Visibility)2;
			}
		}

		private void OnBtnUSBConnection(object sender, RoutedEventArgs e)
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Expected O, but got Unknown
			//IL_0033: Expected O, but got Unknown
			if (!DeviceConnectedCheck())
			{
				IMessageWindowV6 win = (IMessageWindowV6)new WifiConnectHelpWindowV6(false, "K1066", (WifiTutorialsType)1)
				{
					DataContext = (object)new WifiConnectHelpWindowModelV6((WifiTutorialsType)4)
				};
				GlobalCmdHelper.Instance.TabletOpenUsbDebugCallback = delegate
				{
					UsbOpenCallback(win);
				};
				MessageWindowHelper.Instance.Show(win, (bool?)true);
			}
		}

		private void OnBtnWifiConnection(object sender, RoutedEventArgs e)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Expected O, but got Unknown
			//IL_0021: Expected O, but got Unknown
			if (!DeviceConnectedCheck())
			{
				IMessageWindowV6 val = (IMessageWindowV6)new WifiConnectHelpWindowV6(false, "", (WifiTutorialsType)1)
				{
					DataContext = (object)new WifiConnectHelpWindowModelV6((WifiTutorialsType)5)
				};
				MessageWindowHelper.Instance.Show(val, (bool?)true);
			}
		}

		private bool DeviceConnectedCheck()
		{
			DeviceEx val = HostProxy.deviceManager.ConntectedDevices.FirstOrDefault((DeviceEx n) => (int)n.SoftStatus == 2 && n.Property.Category == "tablet");
			if (val != null)
			{
				MainFrameV6.Instance.AutoMatch(val);
				return true;
			}
			return false;
		}

		private void OnBtnInputSN(object sender, RoutedEventArgs e)
		{
			if (((Control)((sender is Button) ? sender : null)).TabIndex != 0)
			{
				MainFrameV6.Instance.ChangeView(PageIndex.TABLET_SEARCH);
			}
		}

		private void UsbOpenCallback(IMessageWindowV6 win)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				try
				{
					if (win != null)
					{
						IMessageWindowV6 obj = win;
						Window val = (Window)(object)((obj is Window) ? obj : null);
						if (val != null)
						{
							val.Close();
							win = null;
						}
					}
				}
				catch (Exception)
				{
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/tabletentranceviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_004c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			//IL_007c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnFastboot = (Button)target;
				((ButtonBase)btnFastboot).Click += new RoutedEventHandler(OnBtnUSBConnection);
				break;
			case 2:
				bdFastboot = (Border)target;
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnWifiConnection);
				break;
			case 4:
				btnSN = (Button)target;
				((ButtonBase)btnSN).Click += new RoutedEventHandler(OnBtnInputSN);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class PhoneEntranceViewV6 : UserControl, IComponentConnector
	{
		internal Button btnFastboot;

		internal Border bdFastboot;

		internal Button btnImei;

		private bool _contentLoaded;

		public PhoneEntranceViewV6()
		{
			InitializeComponent();
		}

		public void UpdateGridLayout()
		{
			if (MainFrameV6.Instance.IsChinaUs())
			{
				Grid.SetRow((UIElement)(object)btnFastboot, 1);
				Grid.SetRow((UIElement)(object)btnImei, 3);
				((UIElement)bdFastboot).Visibility = (Visibility)0;
				((Control)btnImei).TabIndex = ((!MainFrameV6.Instance.IsChinaUs(isOnlyChina: true)) ? 2 : 0);
			}
			else
			{
				((Control)btnImei).TabIndex = 1;
				Grid.SetRow((UIElement)(object)btnImei, 1);
				Grid.SetRow((UIElement)(object)btnFastboot, 3);
				((UIElement)bdFastboot).Visibility = (Visibility)2;
			}
		}

		private void OnBtnFastboot(object sender, RoutedEventArgs e)
		{
			Task.Factory.StartNew(delegate
			{
				string text = default(string);
				DriversHelper.CheckAndInstallInfDriver((DriverType)2, (Action)null, ref text);
				DriversHelper.CheckMotorolaDriverExeInstalled((Action<string>)delegate(string _arg)
				{
					MainFrameV6.Instance.IMsgManager.SetDriverButtonStatus(_arg);
				});
			});
			((DispatcherObject)this).Dispatcher.BeginInvoke((Delegate)(Action)delegate
			{
				MainFrameV6.Instance.ShowGifGuideSteps(_showTextDetect: true, null);
			}, Array.Empty<object>());
		}

		private void OnBtnWifiConnection(object sender, RoutedEventArgs e)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Expected O, but got Unknown
			//IL_0019: Expected O, but got Unknown
			IMessageWindowV6 val = (IMessageWindowV6)new WifiConnectHelpWindowV6(false, "", (WifiTutorialsType)1)
			{
				DataContext = (object)new WifiConnectHelpWindowModelV6((WifiTutorialsType)1)
			};
			MessageWindowHelper.Instance.Show(val, (bool?)true);
		}

		private void OnBtnInputImei(object sender, RoutedEventArgs e)
		{
			if (((Control)((sender is Button) ? sender : null)).TabIndex != 0)
			{
				MainFrameV6.Instance.ChangeView(PageIndex.PHONE_SEARCH);
			}
		}

		private void OnBtnManualSelection(object sender, RoutedEventArgs e)
		{
			MainFrameV6.Instance.ChangeView(PageIndex.PHONE_MANUAL);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/phoneentranceviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Expected O, but got Unknown
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Expected O, but got Unknown
			//IL_006c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0076: Expected O, but got Unknown
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Expected O, but got Unknown
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_009b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnFastboot = (Button)target;
				((ButtonBase)btnFastboot).Click += new RoutedEventHandler(OnBtnFastboot);
				break;
			case 2:
				bdFastboot = (Border)target;
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnWifiConnection);
				break;
			case 4:
				btnImei = (Button)target;
				((ButtonBase)btnImei).Click += new RoutedEventHandler(OnBtnInputImei);
				break;
			case 5:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnManualSelection);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class PhoneMMatchViewV6 : UserControl, IComponentConnector
	{
		internal RadioButton rbtn;

		internal StackPanel DownloadPanel;

		internal StackPanel confirm;

		private bool _contentLoaded;

		public PhoneMMatchViewModelV6 VM { get; private set; }

		public PhoneMMatchViewV6()
		{
			InitializeComponent();
			((FrameworkElement)this).Tag = PageIndex.PHONE_MANUAL;
			VM = new PhoneMMatchViewModelV6(this);
			((FrameworkElement)this).DataContext = VM;
		}

		public void ChangeConfirmVisibile(Visibility visibile)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			((DispatcherObject)this).Dispatcher.Invoke<Visibility>((Func<Visibility>)(() => ((UIElement)confirm).Visibility = visibile));
		}

		private void OnBtnPrevious(object sender, RoutedEventArgs e)
		{
			VM.Previous();
		}

		private void OnBtnNext(object sender, RoutedEventArgs e)
		{
			VM.Next();
		}

		private void OnRbtnChecked(object sender, RoutedEventArgs e)
		{
			if (VM != null)
			{
				object originalSource = e.OriginalSource;
				RadioButton val = (RadioButton)((originalSource is RadioButton) ? originalSource : null);
				VM.ShowTutorial(Convert.ToBoolean(((FrameworkElement)val).Tag));
			}
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			MainFrameV6.Instance.ShowTutoiral(DevCategory.Phone);
		}

		private void OnBtnConfirm(object sender, RoutedEventArgs e)
		{
			VM.GotoRescueView();
		}

		private void OnReselectRom(object sender, MouseButtonEventArgs e)
		{
			VM.ReSelectRom();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/phonemmatchviewv6.xaml", UriKind.Relative);
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
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Expected O, but got Unknown
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_006c: Expected O, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Unknown result type (might be due to invalid IL or missing references)
			//IL_009c: Expected O, but got Unknown
			//IL_009e: Unknown result type (might be due to invalid IL or missing references)
			//IL_00aa: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Expected O, but got Unknown
			//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c1: Expected O, but got Unknown
			//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d9: Expected O, but got Unknown
			//IL_00dc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e6: Expected O, but got Unknown
			//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fe: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				rbtn = (RadioButton)target;
				((ToggleButton)rbtn).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			case 2:
				((ToggleButton)(RadioButton)target).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnPrevious);
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnNext);
				break;
			case 5:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 6:
				DownloadPanel = (StackPanel)target;
				break;
			case 7:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnReselectRom);
				break;
			case 8:
				confirm = (StackPanel)target;
				break;
			case 9:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnConfirm);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class PhoneMMatchViewModelV6 : ManualMatchViewModel
	{
		private int _Current;

		private readonly PhoneMMatchViewV6 _View;

		private bool _IsBtnPreEnable;

		private bool _IsBtnNextEnable;

		private string _StepTitle;

		public bool IsBtnPreEnable
		{
			get
			{
				return _IsBtnPreEnable;
			}
			set
			{
				_IsBtnPreEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsBtnPreEnable");
			}
		}

		public bool IsBtnNextEnable
		{
			get
			{
				return _IsBtnNextEnable;
			}
			set
			{
				_IsBtnNextEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsBtnNextEnable");
			}
		}

		public string StepTitle
		{
			get
			{
				return _StepTitle;
			}
			set
			{
				_StepTitle = value;
				((NotifyBase)this).OnPropertyChanged("StepTitle");
			}
		}

		public PhoneMMatchViewModelV6(PhoneMMatchViewV6 ui)
			: base((FrameworkElement)(object)ui, DevCategory.Phone)
		{
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Expected O, but got Unknown
			//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b0: Expected O, but got Unknown
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d3: Expected O, but got Unknown
			//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d8: Expected O, but got Unknown
			//IL_00f1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fb: Expected O, but got Unknown
			//IL_00f6: Unknown result type (might be due to invalid IL or missing references)
			//IL_0100: Expected O, but got Unknown
			//IL_0119: Unknown result type (might be due to invalid IL or missing references)
			//IL_0123: Expected O, but got Unknown
			//IL_011e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0128: Expected O, but got Unknown
			_View = ui;
			base.CbxModelNameVM.DropDownOpenedChanged = delegate(bool isOpen)
			{
				//IL_0057: Unknown result type (might be due to invalid IL or missing references)
				if (!(base.CbxModelNameVM.StepComboBoxItemSource == null || isOpen) && (base.CbxModelNameVM.ComboBoxSelectedValue == null || !(base.CbxModelNameVM.ComboBoxSelectedValue as ManualComboboxViewModel).IsMore))
				{
					base.CbxModelNameVM.ComboBoxFilter = ModelNameInitFilter;
					base.CbxModelNameVM.ComboBoxMoreButtonVisibility = _ModelMoreBtnVisible;
				}
			};
			_ModelNameTipsArr = new List<Tuple<string, int, string>>
			{
				new Tuple<string, int, string>("K1084", 1, "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/ModelName1.png"),
				new Tuple<string, int, string>("K1004", 2, "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/ModelName2.png"),
				new Tuple<string, int, string>("K1005", 3, "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/ModelName3.png"),
				new Tuple<string, int, string>("K1259", 0, "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/phonepoweroff.png")
			};
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.MouseEnterCommand, new ExecutedRoutedEventHandler(OnMouseEnter)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.SetTopClickCommand, new ExecutedRoutedEventHandler(OnSetTopClicked)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.ComboBoxTextChangedCommand, new ExecutedRoutedEventHandler(OnModelNameTextChanged)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.ComboBoxMoreButtonCommand, new ExecutedRoutedEventHandler(base.OnModelNameMoreBtnClicked)));
			ShowTutorial();
			Task.Run(delegate
			{
				LoadModelName();
			}).ContinueWith(delegate
			{
				if (((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => ((FrameworkElement)_View).IsLoaded)))
				{
					if (_CoditionMap == null)
					{
						if (base.CbxModelNameVM.StepComboBoxItemSource != null && base.CbxModelNameVM.StepComboBoxItemSource.Count != 0)
						{
							MainFrameV6.Instance.IMsgManager.SelRegistedDevIfExist($"{_Category}", (Action<string>)delegate(string modelName)
							{
								if (!string.IsNullOrEmpty(modelName))
								{
									ManualComboboxViewModel manualComboboxViewModel = base.CbxModelNameVM.StepComboBoxItemSource?.FirstOrDefault((ManualComboboxViewModel n) => (n.Tag as DeviceModelInfoModel).ModelName.Equals(modelName));
									if (manualComboboxViewModel == null)
									{
										MessageWindowHelper.Instance.Show((string)null, "K0098", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
									}
									else
									{
										base.CbxModelNameVM.ComboBoxFilter = DefaultFilter;
										base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
										base.CbxModelNameVM.IsDropDownEnabled = false;
										base.CbxModelNameVM.ComboBoxSelectedValue = manualComboboxViewModel;
									}
								}
							});
						}
					}
					else
					{
						AutoMatchByCoditonMap();
					}
				}
			});
		}

		public override void ChangeConfirmVisibile(Visibility visibile)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			_View.ChangeConfirmVisibile(visibile);
		}

		public void MatchFromDownloadCenter(Dictionary<string, string> data)
		{
			_CoditionMap = data;
			if (base.CbxModelNameVM.StepComboBoxItemSource != null)
			{
				AutoMatchByCoditonMap();
			}
		}

		private async void AutoMatchByCoditonMap()
		{
			if (_CoditionMap.ContainsKey("modelName"))
			{
				ManualComboboxViewModel manualComboboxViewModel = base.CbxModelNameVM.StepComboBoxItemSource?.FirstOrDefault((ManualComboboxViewModel p) => (p.Tag as DeviceModelInfoModel).ModelName == _CoditionMap["modelName"]);
				if (manualComboboxViewModel == null)
				{
					_CoditionMap = null;
					await MessageWindowHelper.Instance.Show("K0071", "K0098", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
					ResetCoditionSelUi();
				}
				else
				{
					ResetCoditionSelUi();
					base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
					base.CbxModelNameVM.ComboBoxFilter = DefaultFilter;
					base.CbxModelNameVM.IsDropDownEnabled = false;
					base.CbxModelNameVM.ComboBoxSelectedValue = manualComboboxViewModel;
				}
			}
		}

		public void Previous()
		{
			if (--_Current <= 0)
			{
				IsBtnPreEnable = false;
			}
			IsBtnNextEnable = true;
			SetTutorial(_Current);
		}

		public void Next()
		{
			if (++_Current >= 2)
			{
				IsBtnNextEnable = false;
			}
			IsBtnPreEnable = true;
			SetTutorial(_Current);
		}

		public void ShowTutorial(bool isModelName = true)
		{
			_Current = 0;
			IsBtnPreEnable = false;
			IsBtnNextEnable = true;
			SetTutorial((!isModelName) ? 3 : 0);
		}

		private void SetTutorial(int index)
		{
			base.HelpImage = _ModelNameTipsArr[index].Item3;
			if (_ModelNameTipsArr[index].Item2 > 0)
			{
				StepTitle = $"Step{_ModelNameTipsArr[index].Item2}:";
			}
			else
			{
				StepTitle = null;
			}
			base.AndroidSettingText = _ModelNameTipsArr[index].Item1;
		}

		protected void OnModelNameTextChanged(object sender, ExecutedRoutedEventArgs e)
		{
			base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			if (base.CbxModelNameVM.ComboBoxSelectedValue == null && base.CbxModelNameVM.ComboBoxSelectedIndex == -1)
			{
				base.CbxModelNameVM.ComboBoxFilter = SearchFilter;
			}
			else
			{
				base.CbxModelNameVM.ComboBoxFilter = DefaultFilter;
			}
		}

		protected override void ResetForModelName()
		{
			_ReqParams.Clear();
			base.ResetForModelName();
		}

		private void OnMouseEnter(object sender, ExecutedRoutedEventArgs e)
		{
		}

		private void OnSetTopClicked(object sender, ExecutedRoutedEventArgs e)
		{
			ManualComboboxViewModel unStop = e.Parameter as ManualComboboxViewModel;
			unStop.IsUsed = false;
			List<ManualComboboxViewModel> list = LoadRescuedDevice($"$.modelname{_Category}");
			int num = list.FindIndex((ManualComboboxViewModel n) => n.ItemText == unStop.ItemText);
			if (num != -1)
			{
				list.RemoveAt(num);
				FileHelper.WriteJsonWithAesEncrypt(Configurations.RescueManualMatchFile, $"modelname{_Category}", (object)list, true);
			}
		}
	}
	public class ManualMatchViewModel : ViewModelBase
	{
		private readonly FrameworkElement _Ui;

		private string _HelpImage;

		private string _RomFileName;

		private string _AndroidSettingText;

		private Visibility _ConfirmVisible;

		protected DevCategory _Category;

		protected Visibility _ModelMoreBtnVisible;

		protected ResourceRequestModel _ReqParams;

		protected ResourceResponseModel MatchResource;

		protected RescueDeviceInfoModel MatchDeviceInfo;

		protected DeviceEx MatchDevice;

		protected lenovo.mbg.service.lmsa.flash.ModelV6.MatchType MatchType;

		private readonly RedoIfFailedTimer _ModelNameTimer;

		protected BusinessType businessMatchType;

		protected Dictionary<string, string> _CoditionMap;

		protected Dictionary<string, int> _FastbootDevUnMatchArr;

		protected List<Tuple<string, int, string>> _ModelNameTipsArr;

		protected RecipeMessageImpl Message;

		protected Stopwatch sw;

		protected string recipeName;

		protected string androidVer;

		protected BusinessData businessData;

		protected UseCaseDevice UcDevice;

		protected int fCode;

		public string HelpImage
		{
			get
			{
				return _HelpImage;
			}
			set
			{
				_HelpImage = value;
				((NotifyBase)this).OnPropertyChanged("HelpImage");
			}
		}

		public string RomFileName
		{
			get
			{
				return _RomFileName;
			}
			set
			{
				_RomFileName = value;
				((NotifyBase)this).OnPropertyChanged("RomFileName");
			}
		}

		public string AndroidSettingText
		{
			get
			{
				return _AndroidSettingText;
			}
			set
			{
				_AndroidSettingText = value;
				((NotifyBase)this).OnPropertyChanged("AndroidSettingText");
			}
		}

		public Visibility ConfirmVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _ConfirmVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_ConfirmVisible = value;
				((NotifyBase)this).OnPropertyChanged("ConfirmVisible");
			}
		}

		public LComboBoxViewModelV6 CbxModelNameVM { get; set; }

		public ObservableCollection<LComboBoxViewModelV6> CbxConditionArr { get; set; }

		public ObservableCollection<ResourceResponseModel> ReselRomArr { get; set; }

		public virtual void ChangeConfirmVisibile(Visibility visibile)
		{
		}

		public ManualMatchViewModel(FrameworkElement ui, DevCategory category)
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected O, but got Unknown
			//IL_0091: Unknown result type (might be due to invalid IL or missing references)
			//IL_009b: Expected O, but got Unknown
			//IL_009c: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a6: Expected O, but got Unknown
			//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b1: Expected O, but got Unknown
			//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bc: Expected O, but got Unknown
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Expected O, but got Unknown
			_Ui = ui;
			Message = new RecipeMessageImpl(new MessageViewHelper((ViewModelBase)(object)MainFrameV6.Instance.VM));
			_Category = category;
			_ModelNameTimer = new RedoIfFailedTimer(delegate
			{
				try
				{
					LoadModelName();
				}
				finally
				{
					CbxModelNameVM.IsDataLoading = false;
				}
			});
			_ReqParams = new ResourceRequestModel();
			_FastbootDevUnMatchArr = new Dictionary<string, int>();
			ReselRomArr = new ObservableCollection<ResourceResponseModel>();
			CbxConditionArr = new ObservableCollection<LComboBoxViewModelV6>();
			CbxModelNameVM = new LComboBoxViewModelV6
			{
				IsEditable = true,
				ComboBoxSelectedIndex = -1,
				ComboBoxWatermark = "K0725",
				SetTopClickCommand = (ICommand)new RoutedCommand(),
				MouseEnterCommand = (ICommand)new RoutedCommand(),
				SelectionChangedCommand = (ICommand)new RoutedCommand(),
				ComboBoxTextChangedCommand = (ICommand)new RoutedCommand(),
				ComboBoxMoreButtonCommand = (ICommand)new RoutedCommand(),
				ItemSelChangedActon = OnModelNameSelected
			};
			ConfirmVisible = (Visibility)2;
		}

		public void GotoRescueView()
		{
			AutoMatchResource data = new AutoMatchResource(MatchDevice, MatchDeviceInfo, MatchResource, new MatchInfo(MatchType, _ReqParams.RequestParams, MatchDeviceInfo));
			MainFrameV6.Instance.JumptoRescueView(_Category, data, null, _Ui);
		}

		public void LoadModelName()
		{
			//IL_01f2: Unknown result type (might be due to invalid IL or missing references)
			//IL_0212: Unknown result type (might be due to invalid IL or missing references)
			//IL_024a: Unknown result type (might be due to invalid IL or missing references)
			if (CbxModelNameVM.IsDataLoading)
			{
				return;
			}
			CbxModelNameVM.IsDataLoading = true;
			_ReqParams.AddParameter("country", GlobalFun.GetRegionInfo().EnglishName);
			_ReqParams.AddParameter("category", $"{_Category}");
			ResponseModel<DeviceModelInfoListModel> obj = FlashContext.SingleInstance.service.Request<DeviceModelInfoListModel>(WebServicesContext.GET_ALLMODELNAMES, (object)_ReqParams.ParamsMapping, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
			_ReqParams.Clear();
			DeviceModelInfoListModel content = obj.content;
			if (obj.code != "0000")
			{
				_ModelNameTimer.RegisterLoadDataTimer();
				_ModelNameTimer.IsLoadFailed = true;
			}
			else
			{
				_ModelNameTimer.DestoryLoadDataTimer();
				_ModelNameTimer.IsLoadFailed = false;
			}
			List<ManualComboboxViewModel> remote = new List<ManualComboboxViewModel>();
			if (content != null)
			{
				if (_Category == DevCategory.Smart)
				{
					content.ModelList?.ForEach(delegate(DeviceModelInfoModel p)
					{
						remote.Add(new ManualComboboxViewModel
						{
							ItemText = p.ModelName,
							Tag = p,
							IsMore = false
						});
					});
					content.MoreModelList?.ForEach(delegate(DeviceModelInfoModel p)
					{
						remote.Add(new ManualComboboxViewModel
						{
							ItemText = p.ModelName,
							Tag = p,
							IsMore = true
						});
					});
				}
				else
				{
					content.ModelList?.ForEach(delegate(DeviceModelInfoModel p)
					{
						remote.Add(new ManualComboboxViewModel
						{
							ItemText = p.MarketName + "\u3000" + p.ModelName,
							Tag = p,
							IsMore = false
						});
					});
					content.MoreModelList?.ForEach(delegate(DeviceModelInfoModel p)
					{
						remote.Add(new ManualComboboxViewModel
						{
							ItemText = p.MarketName + "\u3000" + p.ModelName,
							Tag = p,
							IsMore = true
						});
					});
				}
			}
			foreach (ManualComboboxViewModel item in LoadRescuedDevice($"$.modelname{_Category}"))
			{
				ManualComboboxViewModel manualComboboxViewModel = remote.FirstOrDefault((ManualComboboxViewModel p) => p.ItemText.Contains(item.ItemText));
				if (manualComboboxViewModel != null)
				{
					manualComboboxViewModel.IsUsed = true;
				}
			}
			if (_Category == DevCategory.Smart)
			{
				_ModelMoreBtnVisible = (Visibility)2;
			}
			else
			{
				List<DeviceModelInfoModel> moreModelList = content.MoreModelList;
				if (moreModelList != null && moreModelList.Count > 0)
				{
					_ModelMoreBtnVisible = (Visibility)0;
				}
				else
				{
					_ModelMoreBtnVisible = (Visibility)((remote.FirstOrDefault((ManualComboboxViewModel p) => p.IsMore) == null) ? 2 : 0);
				}
			}
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					//IL_004e: Unknown result type (might be due to invalid IL or missing references)
					CbxModelNameVM.ComboBoxFilter = ModelNameInitFilter;
					CbxModelNameVM.StepComboBoxItemSource = new ObservableCollection<ManualComboboxViewModel>(remote);
					CbxModelNameVM.ComboBoxMoreButtonVisibility = _ModelMoreBtnVisible;
				});
			}
			CbxModelNameVM.IsDataLoading = false;
		}

		protected virtual void OnModelNameSelected(object ob)
		{
			//IL_0113: Unknown result type (might be due to invalid IL or missing references)
			//IL_011a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0121: Unknown result type (might be due to invalid IL or missing references)
			//IL_012b: Expected O, but got Unknown
			ResetForModelName();
			if (!(ob is ManualComboboxViewModel manualComboboxViewModel))
			{
				CbxModelNameVM.IsDataLoading = false;
				return;
			}
			DeviceModelInfoModel deviceModelInfoModel = manualComboboxViewModel.Tag as DeviceModelInfoModel;
			CbxModelNameVM.IsDataLoading = true;
			DriverInstall(deviceModelInfoModel);
			LogHelper.LogInstance.Info("Model name selected, modelName:[" + deviceModelInfoModel.ModelName + "] marketName:[" + deviceModelInfoModel.MarketName + "].", false);
			if (deviceModelInfoModel.ReadSupport)
			{
				_ReqParams.AddParameter("modelName", deviceModelInfoModel.ModelName);
				_ReqParams.AddParameter("marketName", deviceModelInfoModel.MarketName);
				LoadFastbootData(_ReqParams.ParamsMapping);
				return;
			}
			_ReqParams.AddParameter("modelName", deviceModelInfoModel.ModelName);
			_ReqParams.AddParameter("marketName", deviceModelInfoModel.MarketName);
			businessMatchType = (BusinessType)((_Category == DevCategory.Tablet) ? 3077 : ((_Category == DevCategory.Phone) ? 3076 : 3078));
			businessData = new BusinessData(businessMatchType, (DeviceEx)null, (BusinessStatus)0);
			sw = new Stopwatch();
			sw.Start();
			ResourceMatching(CbxModelNameVM);
		}

		protected void OnSubCbxSelected(LComboBoxViewModelV6 cbx, object ob)
		{
			ResetForSubSel();
			int num = CbxConditionArr.IndexOf(cbx);
			for (int num2 = CbxConditionArr.Count - 1; num2 > num; num2--)
			{
				_ReqParams.RemoveParameter(CbxConditionArr[num2].Tag);
				CbxConditionArr.RemoveAt(num2);
			}
			if (ob != null)
			{
				ManualComboboxViewModel manualComboboxViewModel = ob as ManualComboboxViewModel;
				_ReqParams.AddParameter(cbx.Tag, manualComboboxViewModel.ItemText);
				ResourceMatching(cbx);
			}
		}

		protected void MatchSuccess(ResourceResponseModel res, RescueDeviceInfoModel deviceInfo = null, DeviceEx device = null)
		{
			_CoditionMap = null;
			ChangeConfirmVisibile((Visibility)0);
			MatchResource = res;
			MatchDeviceInfo = deviceInfo;
			MatchDevice = device;
			MatchType = ((device == null) ? lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.MANUAL : lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.MANUAL_FASTBOOT);
			if (MatchDeviceInfo == null)
			{
				MatchDeviceInfo = new RescueDeviceInfoModel
				{
					category = $"{_Category}",
					romMatchId = MatchResource.romMatchId,
					marketName = _ReqParams.GetParameter("marketName"),
					modelName = _ReqParams.GetParameter("modelName"),
					hwCode = _ReqParams.GetParameter("hwCode"),
					country = _ReqParams.GetParameter("country"),
					simCount = _ReqParams.GetParameter("simCount"),
					memory = _ReqParams.GetParameter("memory")
				};
			}
			LogHelper.LogInstance.Info("match device info:[" + JsonHelper.SerializeObject2Json((object)MatchDeviceInfo) + "]", false);
			RomFileName = res.RomResources?.Name;
			ConfirmVisible = (Visibility)0;
			_CoditionMap = null;
		}

		protected void ResourceMatching(LComboBoxViewModelV6 model)
		{
			Task.Run(delegate
			{
				//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
				//IL_0398: Unknown result type (might be due to invalid IL or missing references)
				//IL_0207: Unknown result type (might be due to invalid IL or missing references)
				//IL_0211: Expected O, but got Unknown
				model.IsDataLoading = true;
				string empty = string.Empty;
				ResponseModel<List<ResourceResponseModel>> val = FlashContext.SingleInstance.service.Request<List<ResourceResponseModel>>(WebServicesContext.RESUCE_MANUAL_GETROM, (object)_ReqParams.ParamsMapping, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				List<ResourceResponseModel> arr = val.content;
				model.IsDataLoading = false;
				List<ResourceResponseModel> list = arr;
				if (list != null && list.Count == 1)
				{
					ResourceResponseModel resourceResponseModel = arr.First();
					if (resourceResponseModel.ParamProperty == null && resourceResponseModel.ParamValues == null)
					{
						sw.Stop();
						Dictionary<string, string> dictionary = new Dictionary<string, string>(_ReqParams.ParamsMapping) { ["romMatchId"] = resourceResponseModel.romMatchId };
						HostProxy.BehaviorService.Collect(businessMatchType, businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)((resourceResponseModel.RomResources != null) ? 10 : 20), _ReqParams.GetParameter("modelName"), (object)dictionary));
						if (resourceResponseModel.RomResources == null)
						{
							MessageWindowHelper.Instance.Show((string)null, FlashStaticResources.RESUCE_CONDITION_UNMATCHED_EX, "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
						}
						else
						{
							MatchSuccess(resourceResponseModel);
						}
					}
					else
					{
						LComboBoxViewModelV6 cbx = new LComboBoxViewModelV6
						{
							IsEditable = false,
							ComboBoxSelectedIndex = -1,
							ComboBoxWatermark = resourceResponseModel.ParamProperty?.PropertyName,
							ComboBoxFilter = (object sender, string e) => 0
						};
						cbx.SelectionChangedCommand = (ICommand)new RoutedCommand(((object)cbx).GetHashCode().ToString(), ((object)_Ui).GetType());
						cbx.ComboBoxMoreButtonVisibility = (Visibility)2;
						cbx.Tag = resourceResponseModel.ParamProperty.PropertyValue;
						cbx.ItemSelChangedActon = delegate(object ob)
						{
							OnSubCbxSelected(cbx, ob);
						};
						cbx.StepComboBoxItemSource = new ObservableCollection<ManualComboboxViewModel>();
						resourceResponseModel.ParamValues.ForEach(delegate(string p)
						{
							cbx.StepComboBoxItemSource.Add(new ManualComboboxViewModel
							{
								ItemText = p,
								Tag = p
							});
						});
						((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
						{
							CbxConditionArr.Add(cbx);
						});
						string key = resourceResponseModel.ParamProperty.PropertyValue;
						Dictionary<string, string> coditionMap = _CoditionMap;
						if (coditionMap != null && coditionMap.ContainsKey(key))
						{
							ManualComboboxViewModel manualComboboxViewModel = cbx.StepComboBoxItemSource.FirstOrDefault((ManualComboboxViewModel p) => p.ItemText == _CoditionMap[key]);
							if (manualComboboxViewModel == null)
							{
								_CoditionMap = null;
								Task.Run(delegate
								{
									MessageWindowHelper.Instance.Show("K0071", "K0098", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
								}).ContinueWith(delegate
								{
									((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
									{
										ResetCoditionSelUi();
									});
								});
							}
							else
							{
								cbx.ComboBoxSelectedValue = manualComboboxViewModel;
							}
						}
					}
				}
				else
				{
					List<ResourceResponseModel> list2 = arr;
					if (list2 != null && list2.Count > 1)
					{
						Task.Run(delegate
						{
							//IL_007b: Unknown result type (might be due to invalid IL or missing references)
							ResourceResponseModel resource = MultiRomsSelView.SelectOneFormRomArr(arr);
							sw.Stop();
							Dictionary<string, string> dictionary2 = new Dictionary<string, string>(_ReqParams.ParamsMapping) { ["romMatchId"] = resource?.romMatchId };
							HostProxy.BehaviorService.Collect(businessMatchType, businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)((resource != null) ? 10 : 20), _ReqParams.GetParameter("modelName"), (object)dictionary2));
							((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
							{
								if (resource == null)
								{
									_CoditionMap = null;
									CbxModelNameVM.ComboBoxSelectedIndex = -1;
								}
								else
								{
									arr.ForEach(delegate(ResourceResponseModel p)
									{
										ReselRomArr.Add(p);
									});
									MatchSuccess(resource);
								}
							});
						});
					}
					else
					{
						sw.Stop();
						HostProxy.BehaviorService.Collect(businessMatchType, businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)20, _ReqParams.GetParameter("modelName"), (object)_ReqParams.ParamsMapping));
						if (empty == "4000" || empty == "4010")
						{
							MessageWindowHelper.Instance.Show((string)null, "K1459", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
						}
						else if (val.success)
						{
							MessageWindowHelper.Instance.Show((string)null, FlashStaticResources.DEVICE_NOT_SUPPORT, "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
						}
						CbxModelNameVM.ComboBoxSelectedIndex = -1;
					}
				}
			});
		}

		protected void ResetForSubSel()
		{
			RomFileName = null;
			ReselRomArr.Clear();
			ConfirmVisible = (Visibility)2;
			ChangeConfirmVisibile((Visibility)2);
		}

		protected virtual void ResetForModelName()
		{
			ResetForSubSel();
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				CbxConditionArr.Clear();
			});
		}

		protected virtual void ResetCoditionSelUi()
		{
			CbxModelNameVM.ComboBoxSelectedValue = null;
		}

		public void ReSelectRom()
		{
			if (ReselRomArr.Count < 2)
			{
				return;
			}
			Task.Run(delegate
			{
				ResourceResponseModel resourceResponseModel = MultiRomsSelView.SelectOneFormRomArr(ReselRomArr.ToList());
				if (resourceResponseModel == null)
				{
					((DispatcherObject)Application.Current).Dispatcher.Invoke<int>((Func<int>)(() => CbxModelNameVM.ComboBoxSelectedIndex = -1));
				}
				else
				{
					MatchSuccess(resourceResponseModel);
				}
			});
		}

		protected void ResetModelName(string modelName)
		{
			string format = HostProxy.LanguageService.Translate(FlashStaticResources.RESUCE_FASTBOOT_DEVICE_CONFIRM);
			if (MessageWindowHelper.Instance.Show((string)null, string.Format(format, modelName), FlashStaticResources.FASTBOOT_MODELNAME_UNMATCH, (string)null, true, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Result == true)
			{
				ManualComboboxViewModel manualComboboxViewModel = CbxModelNameVM.StepComboBoxItemSource.FirstOrDefault((ManualComboboxViewModel p) => (p.Tag as DeviceModelInfoModel).ModelName == modelName);
				if (manualComboboxViewModel == null)
				{
					MessageWindowHelper.Instance.Show((string)null, FlashStaticResources.RESUCE_FASTBOOT_CONDITION_UNMATCHED, "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
					CbxModelNameVM.ComboBoxSelectedIndex = -1;
				}
				else
				{
					CbxModelNameVM.IsDropDownEnabled = false;
					CbxModelNameVM.ComboBoxSelectedValue = manualComboboxViewModel;
				}
			}
			else
			{
				CbxModelNameVM.ComboBoxSelectedIndex = -1;
				CbxModelNameVM.IsDataLoading = false;
			}
		}

		protected void OnModelNameMoreBtnClicked(object sender, ExecutedRoutedEventArgs e)
		{
			CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			CbxModelNameVM.ComboBoxFilter = DefaultFilter;
		}

		public virtual void RegisterDeviceAsync()
		{
			try
			{
				List<ManualComboboxViewModel> list = LoadRescuedDevice($"$.modelname{_Category}");
				ManualComboboxViewModel model = CbxModelNameVM.ComboBoxSelectedValue as ManualComboboxViewModel;
				model.IsUsed = true;
				int num = list.FindIndex((ManualComboboxViewModel n) => n.ItemText == model.ItemText);
				if (num != -1)
				{
					list.RemoveAt(num);
				}
				list.Insert(0, model);
				FileHelper.WriteJsonWithAesEncrypt(Configurations.RescueManualMatchFile, $"modelname{_Category}", (object)list, true);
			}
			catch (Exception)
			{
			}
		}

		public virtual void SaveDownloadUri2LocalFile()
		{
			Dictionary<string, string> downloadInfo = new Dictionary<string, string>
			{
				{
					"category",
					$"{_Category}"
				},
				{
					"FileUrl",
					MatchResource.RomResources.URI.Split(new char[1] { '?' })[0]
				}
			};
			foreach (KeyValuePair<string, string> item in _ReqParams.ParamsMapping)
			{
				downloadInfo.Add(item.Key, item.Value);
			}
			List<Dictionary<string, string>> list = JsonHelper.DeserializeJson2ListFromFile<Dictionary<string, string>>(Configurations.DownloadedMatchPath);
			if (list == null)
			{
				list = new List<Dictionary<string, string>> { downloadInfo };
			}
			else if (list.FindIndex((Dictionary<string, string> n) => n.Values.Contains(downloadInfo["FileUrl"])) < 0)
			{
				list.Add(downloadInfo);
			}
			JsonHelper.SerializeObject2File(Configurations.DownloadedMatchPath, (object)list);
		}

		public void LoadFastbootData(Dictionary<string, string> aparams)
		{
			Task.Run(() => FlashContext.SingleInstance.service.RequestContent<DeviceModelInfoModel>(WebServicesContext.GET_FASTBOOTDATA_RECIPE, (object)aparams, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false)).ContinueWith(delegate(Task<DeviceModelInfoModel> r)
			{
				//IL_002b: Unknown result type (might be due to invalid IL or missing references)
				//IL_0031: Expected O, but got Unknown
				//IL_00fc: Unknown result type (might be due to invalid IL or missing references)
				//IL_0106: Expected O, but got Unknown
				if (r.Result != null)
				{
					sw = new Stopwatch();
					sw.Start();
					RecipeResources val = new RecipeResources();
					val.Add(RecipeResources.ModelName, r.Result.ModelName);
					val.Add(RecipeResources.RealModelName, r.Result.ModelName);
					val.Add(RecipeResources.RecipeUrl, r.Result.Recipe);
					recipeName = Path.GetFileName(r.Result.Recipe).Split(new char[1] { '?' })[0];
					LogHelper.LogInstance.Info("load fastboot data, model name:[" + r.Result.ModelName + "] recipe name:[" + recipeName + "].", false);
					UcDevice = new UseCaseDevice((DeviceEx)null, r.Result.ModelName);
					UcDevice.Register(val, (IRecipeMessage)(object)Message, (Func<RecipeMessageType, object, object>)FastbootResultMonitor);
					UseCaseRunner.Run((UseCase)2, UcDevice);
				}
			});
		}

		private object FastbootResultMonitor(RecipeMessageType messageType, object content)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Invalid comparison between I4 and Unknown
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Invalid comparison between I4 and Unknown
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Invalid comparison between Unknown and I4
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0065: Invalid comparison between Unknown and I4
			RecipeMessage val = (RecipeMessage)content;
			if (4 == (int)messageType)
			{
				FireData(val);
			}
			else if (6 == (int)messageType)
			{
				if (UcDevice.Device != null)
				{
					UcDevice.Device.WorkType = (DeviceWorkType)1;
				}
				if ((int)val.OverallResult == 1)
				{
					UcDevice.MessageBox.SetMainWindowDriverBtnStatus("installed");
				}
				else if ((int)val.OverallResult == 0 || (int)val.OverallResult == 2)
				{
					CbxModelNameVM.ComboBoxSelectedIndex = -1;
					((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => CbxModelNameVM.IsDataLoading = false));
				}
			}
			return true;
		}

		private void FireData(RecipeMessage msg)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_007e: Unknown result type (might be due to invalid IL or missing references)
			SortedList<string, string> sortedList = null;
			sortedList = ((msg.Message is SortedList<string, string>) ? (msg.Message as SortedList<string, string>) : ((msg.Info == null) ? new SortedList<string, string>() : msg.Info));
			RescueDeviceInfoModel rescueDeviceInfoModel = FlashBusiness.ConvertFastbootDeviceInfo(sortedList);
			rescueDeviceInfoModel.category = _Category.ToString();
			sortedList.TryGetValue("androidVer", out androidVer);
			if (IsFastbootModelNameMatch(rescueDeviceInfoModel.modelName))
			{
				JObject parmas = GetParmas(rescueDeviceInfoModel, sortedList);
				OnFastbootConditionMatched(parmas, rescueDeviceInfoModel, msg.Device);
			}
		}

		private JObject GetParmas(RescueDeviceInfoModel deviceInfo, SortedList<string, string> infos)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Expected O, but got Unknown
			//IL_014c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0151: Unknown result type (might be due to invalid IL or missing references)
			//IL_0167: Unknown result type (might be due to invalid IL or missing references)
			//IL_017d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0193: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ba: Unknown result type (might be due to invalid IL or missing references)
			//IL_01d1: Expected O, but got Unknown
			ResourceRequestModel resourceRequestModel = new ResourceRequestModel();
			JObject val = new JObject();
			val.Add("modelName", JToken.op_Implicit(deviceInfo.modelName));
			object obj = FlashContext.SingleInstance.service.RequestContent(WebServicesContext.RESUCE_AUTOMATCH_GETPARAMS_MAPPING, (object)val, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
			if (obj != null)
			{
				val = JObject.Parse(obj?.ToString());
			}
			if (val != null && ((JToken)val).HasValues)
			{
				infos.TryGetValue("androidVer", out var value);
				int.TryParse(value, out var result);
				bool flag = result >= 10;
				JArray val2 = ((JToken)val).Value<JArray>((object)"params");
				if (val2 != null)
				{
					foreach (JToken item in val2)
					{
						string text = ((object)item).ToString();
						string value2 = null;
						if (!(text == "blurVersion" && flag) && FlashBusiness.FastbootParamsToValue.ContainsKey(text))
						{
							infos.TryGetValue(FlashBusiness.FastbootParamsToValue[text], out value2);
							if (string.IsNullOrEmpty(value2))
							{
								value2 = ((!(text == "simCount")) ? "-1" : "Lack");
							}
							resourceRequestModel.AddParameter(text, value2);
						}
					}
				}
			}
			resourceRequestModel.ParamsMapping.Add("category", deviceInfo.category);
			JObject val3 = new JObject();
			val3.Add("modelName", JToken.op_Implicit(deviceInfo.modelName));
			val3.Add("imei", JToken.op_Implicit(deviceInfo.imei));
			val3.Add("sn", JToken.op_Implicit(deviceInfo.sn));
			val3.Add("params", (JToken)(object)JObject.FromObject((object)resourceRequestModel.ParamsMapping));
			val3.Add("matchType", JToken.op_Implicit(0));
			val3.Add("channelId", JToken.op_Implicit(deviceInfo.channelId));
			return val3;
		}

		private bool IsFastbootModelNameMatch(string modelname)
		{
			if (string.IsNullOrEmpty(modelname) || Regex.IsMatch(modelname, "^[0]+$"))
			{
				MessageWindowHelper.Instance.Show("K0071", "K1478", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					CbxModelNameVM.IsDataLoading = false;
					CbxModelNameVM.ComboBoxSelectedIndex = -1;
				});
				return false;
			}
			string parameter = _ReqParams.GetParameter("modelName");
			if (modelname != parameter)
			{
				ResetModelName(modelname);
				return false;
			}
			return true;
		}

		private void OnFastbootConditionMatched(JObject param, RescueDeviceInfoModel devInfo, DeviceEx device)
		{
			//IL_00e3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ea: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fb: Expected O, but got Unknown
			//IL_0102: Unknown result type (might be due to invalid IL or missing references)
			try
			{
				LogHelper.LogInstance.Info(string.Format("Fastboot condition match modelName:{0}, fdrallowed:{1}，securestate:{2}, cid:{3}.", new object[4] { devInfo.modelName, devInfo.rescueMark, devInfo.securestate, devInfo.cid }), false);
				if (devInfo.securestate == "flashing_locked" || (!string.IsNullOrEmpty(devInfo.cid) && MainFrameV6.Instance.FastbootErrorStatusArr.Contains(devInfo.cid)))
				{
					ResetCoditionSelUi();
					MessageWindowHelper.Instance.Show("K0071", "K1478", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
					return;
				}
				ResponseModel<List<ResourceResponseModel>> val = FlashContext.SingleInstance.service.Request<List<ResourceResponseModel>>(WebServicesContext.RESUCE_AUTOMATCH_GETROM, (object)param, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				List<ResourceResponseModel> content = val.content;
				businessMatchType = (BusinessType)3075;
				businessData = new BusinessData(businessMatchType, (DeviceEx)null, (BusinessStatus)0);
				businessData.connectType = ((object)(ConnectType)2/*cast due to .constrained prefix*/).ToString();
				businessData.androidVersion = androidVer;
				if (val.code == "0000")
				{
					ResourceResponseModel resourceResponseModel = null;
					if (content.Count > 1)
					{
						resourceResponseModel = MultiRomsSelView.SelectOneFormRomArr(content);
						if (resourceResponseModel == null)
						{
							CbxModelNameVM.ComboBoxSelectedValue = null;
							return;
						}
					}
					else
					{
						resourceResponseModel = content[0];
					}
					devInfo.cid = devInfo.cid;
					devInfo.channelId = devInfo.channelId;
					CollectFastbootMatchAsync(resourceResponseModel, param);
					FastbootCheckForDwonload(resourceResponseModel, devInfo, device);
				}
				else if (val.code == "3010")
				{
					CollectFastbootMatchAsync(null, param);
					OnFastbootConditionUnMatch(devInfo.modelName, devInfo.imei);
				}
				else
				{
					LogHelper.LogInstance.Info("Manual fastboot match return code:" + val.code + "!", false);
				}
			}
			finally
			{
				((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => CbxModelNameVM.IsDataLoading = false));
			}
		}

		public void OnFastbootConditionUnMatch(string modelName, string imei = "")
		{
			if (string.IsNullOrEmpty(modelName))
			{
				DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
				modelName = ((masterDevice != null) ? masterDevice.Property.ModelName : null);
			}
			string key = modelName;
			if (!_FastbootDevUnMatchArr.ContainsKey(key))
			{
				_FastbootDevUnMatchArr.Add(key, 1);
			}
			else if (string.IsNullOrEmpty(modelName))
			{
				_FastbootDevUnMatchArr[key] = 1;
			}
			else
			{
				_FastbootDevUnMatchArr[key]++;
			}
			if (_FastbootDevUnMatchArr[key] > 1)
			{
				if (string.IsNullOrEmpty(imei))
				{
					DeviceEx masterDevice2 = HostProxy.deviceManager.MasterDevice;
					imei = ((masterDevice2 != null) ? masterDevice2.Property.IMEI1 : null);
				}
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					Match3010View match3010View = new Match3010View(DevCategory.Phone, modelName, imei, null);
					MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)match3010View, (bool?)true);
				});
			}
			else
			{
				MessageWindowHelper.Instance.Show("K0711", FlashStaticResources.FASTBOOT_MANUALMATCH_FAILED_FIRST, "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
			}
			CbxModelNameVM.ComboBoxSelectedValue = null;
			ResetForModelName();
		}

		private void CollectFastbootMatchAsync(ResourceResponseModel res, object aparams)
		{
			Task.Run(delegate
			{
				//IL_0064: Unknown result type (might be due to invalid IL or missing references)
				sw.Stop();
				JObject val = JObject.FromObject(aparams);
				val["recipeName"] = JToken.op_Implicit(recipeName);
				val["romMatchId"] = JToken.op_Implicit(res?.romMatchId);
				HostProxy.BehaviorService.Collect(businessMatchType, businessData.Update(sw.ElapsedMilliseconds, (BusinessStatus)((res != null) ? 10 : 20), ((JToken)val).Value<string>((object)"modelName"), (object)val));
			});
		}

		private void FastbootCheckForDwonload(ResourceResponseModel res, RescueDeviceInfoModel devInfo, DeviceEx device)
		{
			Dictionary<string, string> aparams = new Dictionary<string, string>
			{
				{ "modelName", devInfo.modelName },
				{ "romFingerPrint", res.fingerprint },
				{ "romMatchId", res.romMatchId }
			};
			if (new CheckFingerPrintVersion().Check(devInfo.softwareVersion, res.fingerprint, aparams))
			{
				MatchSuccess(res, devInfo, device);
				return;
			}
			CbxModelNameVM.ComboBoxSelectedValue = null;
			ResetForModelName();
			MessageWindowHelper.Instance.Show("K0071", "K1119", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
		}

		protected virtual int ModelNameInitFilter(object source, string keywords)
		{
			ManualComboboxViewModel manualComboboxViewModel = source as ManualComboboxViewModel;
			if (!manualComboboxViewModel.IsMore || manualComboboxViewModel.IsUsed)
			{
				return 0;
			}
			return 1;
		}

		protected virtual int SearchFilter(object source, string keywords)
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			ManualComboboxViewModel manualComboboxViewModel = source as ManualComboboxViewModel;
			if (string.IsNullOrEmpty(keywords))
			{
				CbxModelNameVM.ComboBoxMoreButtonVisibility = _ModelMoreBtnVisible;
				if (!manualComboboxViewModel.IsMore || manualComboboxViewModel.IsUsed)
				{
					return 0;
				}
				return 1;
			}
			CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			return (!manualComboboxViewModel.ItemText.ToLowerInvariant().Contains(keywords.ToLowerInvariant())) ? 1 : 0;
		}

		protected virtual int DefaultFilter(object source, string keywords)
		{
			return 0;
		}

		protected List<ManualComboboxViewModel> LoadRescuedDevice(string token)
		{
			JArray val = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.RescueManualMatchFile, token, false);
			if (val != null && ((JToken)val).HasValues)
			{
				List<ManualComboboxViewModel> list = JsonHelper.DeserializeJson2List<ManualComboboxViewModel>(((object)val).ToString());
				if (list == null)
				{
					return new List<ManualComboboxViewModel>();
				}
				list.ForEach(delegate(ManualComboboxViewModel n)
				{
					n.Tag = JsonHelper.DeserializeJson2Object<DeviceModelInfoModel>(n.Tag.ToString());
				});
				return list;
			}
			return new List<ManualComboboxViewModel>();
		}

		private void DriverInstall(DeviceModelInfoModel device)
		{
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
			Action action = delegate
			{
				MainFrameV6.Instance.ShowOkWindow("K0711", FlashStaticResources.DRIVER_INSTALL_CONFIRM, "K0295");
			};
			DriverType val = (DriverType)3;
			if (device.ReadSupport)
			{
				val = (DriverType)2;
			}
			else if ("MTK".Equals(device.PlatForm, StringComparison.CurrentCultureIgnoreCase))
			{
				val = (DriverType)1;
			}
			else if ("Unisoc".Equals(device.PlatForm, StringComparison.CurrentCultureIgnoreCase))
			{
				val = ((string.IsNullOrEmpty(device.ModelName) || !Regex.IsMatch(device.ModelName, "L19111", RegexOptions.IgnoreCase)) ? ((DriverType)4) : ((DriverType)7));
			}
			if (!string.IsNullOrEmpty(device.ModelName))
			{
				if (Regex.IsMatch(device.ModelName, "SP101FU", RegexOptions.IgnoreCase))
				{
					val = (DriverType)9;
				}
				else if (Regex.IsMatch(device.ModelName, "CD-17302F", RegexOptions.IgnoreCase))
				{
					val = (DriverType)12;
				}
			}
			string text = null;
			DriversHelper.CheckAndInstallInfDriver(val, action, ref text);
			if (!string.IsNullOrEmpty(text))
			{
				LogHelper.LogInstance.Info(text, false);
			}
		}
	}
	public class RedoIfFailedTimer
	{
		private System.Timers.Timer timer;

		protected long loaddtalocker;

		public volatile bool IsLoadFailed;

		public Action RedoProAction { get; set; }

		public RedoIfFailedTimer(Action callBack)
		{
			loaddtalocker = 0L;
			IsLoadFailed = false;
			RedoProAction = callBack;
			timer = new System.Timers.Timer(5000.0);
			timer.Elapsed += LoopDataHandler;
		}

		public void RegisterLoadDataTimer()
		{
			timer.Enabled = true;
		}

		public void DestoryLoadDataTimer()
		{
			if (timer != null)
			{
				timer.Enabled = false;
				timer.Dispose();
				timer = null;
			}
		}

		private void LoopDataHandler(object sender, ElapsedEventArgs e)
		{
			if (Interlocked.Read(in loaddtalocker) == 0L)
			{
				Interlocked.Exchange(ref loaddtalocker, 1L);
				if (IsLoadFailed && !string.IsNullOrEmpty(GlobalFun.GetStringFromUrl(WebApiUrl.NETWORK_CONNECT_CHECK)))
				{
					RedoProAction?.Invoke();
				}
				Interlocked.Exchange(ref loaddtalocker, 0L);
			}
		}
	}
	public class PhoneQueryViewV6 : UserControl, IComponentConnector
	{
		private Button _BtnDel;

		private SolidColorBrush _NormalBorderBrush;

		private SolidColorBrush _ErrorBorderBrush;

		internal TextBox txtSearch;

		internal Path icon;

		internal Popup PART_Popup;

		private bool _contentLoaded;

		public PhoneQueryViewModelV6 VM { get; private set; }

		public PhoneQueryViewV6()
		{
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_0068: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Expected O, but got Unknown
			InitializeComponent();
			((FrameworkElement)this).Tag = PageIndex.PHONE_SEARCH;
			object obj = ((FrameworkElement)this).TryFindResource((object)"V6_BorderBrushKey");
			_NormalBorderBrush = (SolidColorBrush)((obj is SolidColorBrush) ? obj : null);
			object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_WarnningBrushKey");
			_ErrorBorderBrush = (SolidColorBrush)((obj2 is SolidColorBrush) ? obj2 : null);
			((FrameworkElement)txtSearch).Loaded += (RoutedEventHandler)delegate
			{
				//IL_0040: Unknown result type (might be due to invalid IL or missing references)
				//IL_0045: Unknown result type (might be due to invalid IL or missing references)
				//IL_004c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0057: Unknown result type (might be due to invalid IL or missing references)
				//IL_0061: Expected O, but got Unknown
				//IL_0061: Unknown result type (might be due to invalid IL or missing references)
				//IL_006d: Expected O, but got Unknown
				//IL_00aa: Unknown result type (might be due to invalid IL or missing references)
				//IL_00b4: Expected O, but got Unknown
				object obj3 = ((FrameworkTemplate)((Control)txtSearch).Template).FindName("PART_Toggle", (FrameworkElement)(object)txtSearch);
				ToggleButton val = (ToggleButton)((obj3 is ToggleButton) ? obj3 : null);
				if (val != null)
				{
					((FrameworkElement)val).SetBinding(UIElement.VisibilityProperty, "ToggleButtonVisibility");
				}
				((FrameworkElement)PART_Popup).SetBinding(Popup.IsOpenProperty, (BindingBase)new Binding
				{
					Source = val,
					Path = new PropertyPath("IsChecked", Array.Empty<object>()),
					Mode = (BindingMode)0
				});
				object obj4 = ((FrameworkTemplate)((Control)txtSearch).Template).FindName("PART_Empty", (FrameworkElement)(object)txtSearch);
				_BtnDel = (Button)((obj4 is Button) ? obj4 : null);
				if (_BtnDel != null)
				{
					((ButtonBase)_BtnDel).Click += (RoutedEventHandler)delegate
					{
						VM.SearchKeyText = string.Empty;
					};
				}
			};
			((UIElement)txtSearch).GotFocus += (RoutedEventHandler)delegate
			{
				VM.SearchWarnText = string.Empty;
			};
			VM = new PhoneQueryViewModelV6(this);
			((FrameworkElement)this).DataContext = VM;
		}

		private void OnPreviewKeyDown(object sender, KeyEventArgs e)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Invalid comparison between Unknown and I4
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Invalid comparison between Unknown and I4
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Invalid comparison between Unknown and I4
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Invalid comparison between Unknown and I4
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Invalid comparison between Unknown and I4
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Invalid comparison between Unknown and I4
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Invalid comparison between Unknown and I4
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Invalid comparison between Unknown and I4
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Invalid comparison between Unknown and I4
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Invalid comparison between Unknown and I4
			if ((int)((KeyboardEventArgs)e).KeyboardDevice.Modifiers == 4)
			{
				((RoutedEventArgs)e).Handled = true;
			}
			else if ((int)e.Key == 2)
			{
				((RoutedEventArgs)e).Handled = false;
			}
			else if (((int)e.Key >= 34 && (int)e.Key <= 43) || ((int)e.Key >= 74 && (int)e.Key <= 83) || (int)e.Key == 23 || (int)e.Key == 25 || ((int)((KeyboardEventArgs)e).KeyboardDevice.Modifiers == 2 && (int)e.Key == 65))
			{
				TextBox val = (TextBox)((sender is TextBox) ? sender : null);
				if (val.Text.Length >= 18 && val.SelectionLength == 0)
				{
					((RoutedEventArgs)e).Handled = true;
				}
				else
				{
					((RoutedEventArgs)e).Handled = false;
				}
			}
			else
			{
				((RoutedEventArgs)e).Handled = true;
			}
		}

		private void Txt_TextChanged(object sender, TextChangedEventArgs e)
		{
			if (_BtnDel != null)
			{
				TextBox val = (TextBox)((sender is TextBox) ? sender : null);
				val.Text = val.Text.Trim();
				((UIElement)_BtnDel).Visibility = (Visibility)(string.IsNullOrEmpty(val.Text) ? 2 : 0);
				if (string.IsNullOrEmpty(val.Text) || VM.ValidateImei(val.Text))
				{
					VM.SearchWarnText = string.Empty;
					VM.IsBtnEnable = !string.IsNullOrEmpty(val.Text);
					((Control)txtSearch).BorderBrush = (Brush)(object)_NormalBorderBrush;
				}
				else if (val.Text.Length < 15)
				{
					VM.SearchWarnText = "K1157";
					VM.IsBtnEnable = false;
					((Control)txtSearch).BorderBrush = (Brush)(object)_ErrorBorderBrush;
				}
				else
				{
					VM.SearchWarnText = "K0989";
					VM.IsBtnEnable = false;
					((Control)txtSearch).BorderBrush = (Brush)(object)_ErrorBorderBrush;
				}
			}
		}

		private void OnSelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			object originalSource = ((RoutedEventArgs)e).OriginalSource;
			if (((Selector)((originalSource is ListBox) ? originalSource : null)).SelectedIndex != -1)
			{
				PART_Popup.IsOpen = false;
			}
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Plugin.OperateTracker("HowToFindImeiBtnClick", "User clicked how to find imei help button.");
			FindIMEIView wnd = new FindIMEIView();
			Task.Run(() => MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)wnd, (bool?)true));
		}

		private void OnBtnSearch(object sender, RoutedEventArgs e)
		{
			VM.PhoneMatchByIemi();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/phoneqmatchviewv6.xaml", UriKind.Relative);
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
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0077: Expected O, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Unknown result type (might be due to invalid IL or missing references)
			//IL_009c: Expected O, but got Unknown
			//IL_009f: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a9: Expected O, but got Unknown
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c1: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				txtSearch = (TextBox)target;
				((UIElement)txtSearch).PreviewKeyDown += new KeyEventHandler(OnPreviewKeyDown);
				((TextBoxBase)txtSearch).TextChanged += new TextChangedEventHandler(Txt_TextChanged);
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnSearch);
				break;
			case 3:
				icon = (Path)target;
				break;
			case 4:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 5:
				PART_Popup = (Popup)target;
				break;
			case 6:
				((Selector)(ListBox)target).SelectionChanged += new SelectionChangedEventHandler(OnSelectionChanged);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class PhoneQueryViewModelV6 : NotifyBase
	{
		private PhoneQueryViewV6 _View;

		private string _SearchKeyText;

		private string _SearchWarnText;

		private bool _IsBtnEnable;

		private Visibility _ToggleButtonVisibility;

		public string SearchKeyText
		{
			get
			{
				return _SearchKeyText;
			}
			set
			{
				_SearchKeyText = value;
				((NotifyBase)this).OnPropertyChanged("SearchKeyText");
			}
		}

		public string SearchWarnText
		{
			get
			{
				return _SearchWarnText;
			}
			set
			{
				_SearchWarnText = value;
				((NotifyBase)this).OnPropertyChanged("SearchWarnText");
			}
		}

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

		public Visibility ToggleButtonVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _ToggleButtonVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_ToggleButtonVisibility = value;
				((NotifyBase)this).OnPropertyChanged("ToggleButtonVisibility");
			}
		}

		public ObservableCollection<Tuple<string, string>> ImeiArr { get; set; }

		public PhoneQueryViewModelV6(PhoneQueryViewV6 ui)
		{
			_View = ui;
			ImeiArr = new ObservableCollection<Tuple<string, string>>();
			List<Tuple<string, string>> registerDeviceImei = GetRegisterDeviceImei();
			registerDeviceImei?.ForEach(delegate(Tuple<string, string> p)
			{
				ImeiArr.Add(p);
			});
			ToggleButtonVisibility = (Visibility)((registerDeviceImei == null || registerDeviceImei.Count <= 0) ? 2 : 0);
		}

		public bool ValidateImei(string strImei)
		{
			if (string.IsNullOrEmpty(strImei))
			{
				return false;
			}
			if (Regex.IsMatch(strImei, "^[1-9][0-9]{13,14}$"))
			{
				if (Regex.IsMatch(strImei, "(\\d)\\1{5,15}"))
				{
					return false;
				}
				if (IsOrderNumber(strImei))
				{
					return false;
				}
				string text = strImei;
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
				foreach (char item in list)
				{
					num += int.Parse(item.ToString());
				}
				num %= 10;
				if (num != 0)
				{
					num = 10 - num;
				}
				text += num;
				return text.ToLowerInvariant() == strImei.ToLowerInvariant();
			}
			return false;
		}

		private bool IsOrderNumber(string imei)
		{
			int num = 0;
			int num2 = 0;
			int num3 = 0;
			for (int i = 1; i < imei.Length; i++)
			{
				num3 = imei[i] - imei[i - 1];
				num = ((num2 != num3) ? num++ : 0);
				num2 = num3;
				if (num >= 4)
				{
					return true;
				}
			}
			return false;
		}

		public void PhoneMatchByIemi()
		{
			if (!ValidateImei(SearchKeyText))
			{
				SearchWarnText = "K0938";
				return;
			}
			object wModel = null;
			IsBtnEnable = false;
			SearchWarnText = string.Empty;
			Plugin.OperateTracker("ImeiSearchBtnClick", "User search phone firmware by IMEI");
			LogHelper.LogInstance.Info("search phone firmware by IMEI:[" + SearchKeyText + "].", false);
			Dictionary<string, object> aparams = new Dictionary<string, object>();
			aparams.Add("imei", SearchKeyText);
			Task<object> task = MessageWindowHelper.Instance.Loading("K1006", (Func<object>)delegate
			{
				//IL_0040: Unknown result type (might be due to invalid IL or missing references)
				//IL_004f: Unknown result type (might be due to invalid IL or missing references)
				//IL_00ee: Unknown result type (might be due to invalid IL or missing references)
				Stopwatch stopwatch = new Stopwatch();
				stopwatch.Start();
				ResponseModel<List<ResourceResponseModel>> val = FlashContext.SingleInstance.service.Request<List<ResourceResponseModel>>(WebServicesContext.GET_RESOURCES_BY_IMEI, (object)aparams, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				stopwatch.Stop();
				List<ResourceResponseModel> content = val.content;
				BusinessStatus status = (BusinessStatus)20;
				if (content != null && content.Count > 0)
				{
					status = (BusinessStatus)10;
					aparams.Add("romMatchId", content[0].romMatchId);
				}
				if (val.code == "0000" || val.code == "3010" || val.code == "3020" || val.code == "3030" || val.code == "3040")
				{
					wModel = MainFrameV6.Instance.LoadWarranty(SearchKeyText);
				}
				return new
				{
					code = val.code,
					resp = content,
					time = stopwatch.ElapsedMilliseconds,
					status = status
				};
			}, false);
			Task.Run(delegate
			{
				//IL_0243: Unknown result type (might be due to invalid IL or missing references)
				//IL_02a0: Expected O, but got Unknown
				//IL_0719: Unknown result type (might be due to invalid IL or missing references)
				//IL_0776: Expected O, but got Unknown
				//IL_0dbe: Unknown result type (might be due to invalid IL or missing references)
				//IL_0e22: Expected O, but got Unknown
				//IL_10ff: Unknown result type (might be due to invalid IL or missing references)
				//IL_0980: Unknown result type (might be due to invalid IL or missing references)
				//IL_1247: Expected O, but got Unknown
				//IL_0ac8: Expected O, but got Unknown
				//IL_18fe: Unknown result type (might be due to invalid IL or missing references)
				//IL_24cc: Unknown result type (might be due to invalid IL or missing references)
				//IL_2529: Expected O, but got Unknown
				//IL_1a46: Expected O, but got Unknown
				//IL_1da9: Unknown result type (might be due to invalid IL or missing references)
				//IL_1e06: Expected O, but got Unknown
				//IL_21a5: Unknown result type (might be due to invalid IL or missing references)
				//IL_224e: Expected O, but got Unknown
				dynamic result = task.Result;
				Task.Run(delegate
				{
					if (!Plugin.SupportMulti)
					{
						MainFrameV6.Instance.IMsgManager.CallMotoCare(SearchKeyText, wModel);
					}
				});
				((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => IsBtnEnable = true));
				Dictionary<string, object> dictionary = new Dictionary<string, object>(aparams);
				if (result.code == "3000")
				{
					HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)20, dictionary));
					MessageWindowHelper.Instance.Show(FlashStaticResources.IMEI_INVALIDATE_TITLE, FlashStaticResources.IMEI_INVALIDATE_CONTENT, "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
				}
				else if (result.code == "3010")
				{
					if (result.resp == null || result.resp.Count == 0)
					{
						HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)20, dictionary));
						MessageWindowHelper.Instance.Show("K0711", "K0113", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
					}
					else
					{
						dictionary["romMatchId"] = (object)result.resp[0].romMatchId;
						HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, result.resp[0].ModelName, dictionary));
						((DispatcherObject)Application.Current).Dispatcher.Invoke<Task<bool?>>((Func<Task<bool?>>)(() => MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)new Match3010View(DevCategory.Phone, result.resp[0].ModelName, SearchKeyText, wModel), (bool?)true)));
					}
				}
				else if (result.code == "3020")
				{
					ResourceResponseModel resourceResponseModel = result.resp[0];
					MainFrameV6.Instance.RomMatchId = resourceResponseModel.romMatchId;
					dictionary["romMatchId"] = resourceResponseModel.romMatchId;
					HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, resourceResponseModel.ModelName, dictionary));
					MainFrameV6.Instance.ShowGifGuideSteps(_showTextDetect: true, resourceResponseModel.ModelName);
				}
				else if (result.code == "3030")
				{
					dictionary["romMatchId"] = (object)result.resp[0].romMatchId;
					HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, result.resp[0].ModelName, dictionary));
					Match3030View.ProcMatch3030(null, null, _View, result.resp[0], SearchKeyText, DevCategory.Phone, null, wModel);
				}
				else if (result.code == "3040" || result.code == "0000")
				{
					dynamic val = result.resp[0];
					if (true != Match3040View.ProcMatch3040(val, SearchKeyText, DevCategory.Phone, wModel))
					{
						dictionary["romMatchId"] = (object)val.romMatchId;
						HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, result.resp[0].ModelName, dictionary));
					}
					else
					{
						if (result.resp.Count != 1)
						{
							val = MultiRomsSelView.SelectOneFormRomArr(result.resp);
							if (val == null)
							{
								HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, dictionary));
								return;
							}
						}
						RescueDeviceInfoModel rescueDeviceInfoModel = new RescueDeviceInfoModel
						{
							modelName = val.ModelName,
							imei = SearchKeyText,
							marketName = val.marketName,
							romMatchId = val.romMatchId,
							saleModel = val.SalesModel
						};
						dictionary["romMatchId"] = (object)val.romMatchId;
						HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, val.ModelName, dictionary));
						AutoMatchResource data = new AutoMatchResource(null, rescueDeviceInfoModel, val, new MatchInfo(lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.IMEI, aparams, rescueDeviceInfoModel));
						MainFrameV6.Instance.JumptoRescueView(DevCategory.Phone, data, wModel, (FrameworkElement)(object)_View);
					}
				}
				else if (result.code == "1000")
				{
					HostProxy.BehaviorService.Collect((BusinessType)3010, new BusinessData((BusinessType)3010, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, dictionary));
					InvalidView win = null;
					((DispatcherObject)Application.Current).Dispatcher.Invoke<InvalidView>((Func<InvalidView>)(() => win = new InvalidView(DevCategory.Phone, 1)));
					MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)win, (bool?)true).Wait();
					if (win.Result == true)
					{
						if (win.IsManualModel)
						{
							MainFrameV6.Instance.ChangeView(PageIndex.PHONE_MANUAL);
						}
						else
						{
							((DispatcherObject)_View).Dispatcher.BeginInvoke((Delegate)(Action)delegate
							{
								MainFrameV6.Instance.ShowGifGuideSteps(_showTextDetect: true, null);
							}, Array.Empty<object>());
						}
					}
				}
			});
		}

		private List<Tuple<string, string>> GetRegisterDeviceImei()
		{
			if (HostProxy.User.user != null)
			{
				JArray val = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.DefaultOptionsFileName, "$.devices[?(@.userId =='" + HostProxy.User.user.UserId + "')].registeredModels", false);
				if (val != null && ((JToken)val).HasValues)
				{
					List<JToken> list = ((IEnumerable<JToken>)val).OrderBy((JToken n) => n.Value<string>((object)"modelName")).ToList();
					if (list == null)
					{
						return null;
					}
					List<Tuple<string, string>> list2 = new List<Tuple<string, string>>();
					string empty = string.Empty;
					{
						foreach (JToken item2 in list)
						{
							string item = item2.Value<string>((object)"modelName");
							string text = item2.Value<string>((object)"category");
							if (!string.IsNullOrEmpty(text) && text.Equals("phone", StringComparison.CurrentCultureIgnoreCase))
							{
								empty = item2.Value<string>((object)"imei");
								if (string.IsNullOrEmpty(empty))
								{
									empty = item2.Value<string>((object)"imei2");
								}
								if (!string.IsNullOrEmpty(empty))
								{
									list2.Add(new Tuple<string, string>(item, empty));
								}
							}
						}
						return list2;
					}
				}
			}
			return null;
		}
	}
	public class RescueHomeViewV6 : UserControl, IComponentConnector
	{
		private bool _contentLoaded;

		public RescueHomeViewModelV6 VM { get; private set; }

		public RescueHomeViewV6()
		{
			InitializeComponent();
			VM = new RescueHomeViewModelV6(this);
			((FrameworkElement)this).DataContext = VM;
		}

		private void OnBtnPhone(object sender, RoutedEventArgs e)
		{
			ChangeView(PageIndex.PHONE_ENTRANCE);
		}

		private void OnBtnTablet(object sender, RoutedEventArgs e)
		{
			ChangeView(PageIndex.TABLET_ENTRANCE);
		}

		private void OnBtnSmart(object sender, RoutedEventArgs e)
		{
			ChangeView(PageIndex.SMART_SEARCH);
		}

		private void ChangeView(PageIndex page)
		{
			MainFrameV6.Instance.ChangeView(page);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/rescuehomeviewv6.xaml", UriKind.Relative);
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
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnPhone);
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnTablet);
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnSmart);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescueHomeViewModelV6 : NotifyBase
	{
		public RescueHomeViewModelV6(RescueHomeViewV6 ui)
		{
		}
	}
	public class RescueFrameV6 : UserControl, IComponentConnector
	{
		internal RescuingViewV6 rescuing;

		internal RescuingSuccessViewV6 success;

		internal RescuingFailViewV6 fail;

		private bool _contentLoaded;

		public FrameworkElement View { get; private set; }

		public RescueFrameV6(AutoMatchViewModel vm)
		{
			InitializeComponent();
			((FrameworkElement)this).DataContext = vm;
		}

		public void ChangeView(FlashStatusV6 statusV6, Action<FrameworkElement> viewInitAction = null)
		{
			switch (statusV6)
			{
			case FlashStatusV6.Rescuing:
				viewInitAction((FrameworkElement)(object)rescuing);
				((UIElement)rescuing).Visibility = (Visibility)0;
				View = (FrameworkElement)(object)rescuing;
				break;
			case FlashStatusV6.PASS:
				rescuing.Dispose();
				viewInitAction((FrameworkElement)(object)success);
				((UIElement)success).Visibility = (Visibility)0;
				View = (FrameworkElement)(object)success;
				break;
			default:
				rescuing.Dispose();
				viewInitAction((FrameworkElement)(object)fail);
				((UIElement)fail).Visibility = (Visibility)0;
				View = (FrameworkElement)(object)fail;
				break;
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/rescueframev6.xaml", UriKind.Relative);
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
			switch (connectionId)
			{
			case 1:
				rescuing = (RescuingViewV6)target;
				break;
			case 2:
				success = (RescuingSuccessViewV6)target;
				break;
			case 3:
				fail = (RescuingFailViewV6)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescueFrameModel : ViewModelBase
	{
		private string viewName = "RESCUING";

		public string ViewName
		{
			get
			{
				return viewName;
			}
			set
			{
				viewName = value;
				((NotifyBase)this).OnPropertyChanged("ViewName");
			}
		}

		public void ChangeView(string viewName)
		{
			((DispatcherObject)Application.Current).Dispatcher.Invoke<string>((Func<string>)(() => ViewName = viewName));
		}
	}
	public class RescuingFailViewV6 : UserControl, IComponentConnector
	{
		protected int operatorType;

		internal Image img;

		internal LangTextBlock titleMessage;

		internal StackPanel modelnameimeistp;

		internal TextBlock modelnamectrl;

		internal StackPanel imeistap;

		internal TextBlock imeictrl;

		internal Grid warn;

		internal LangTextBlock txtMessage;

		internal TextBlock txtNote;

		internal Border rightPanel;

		internal Button btnCancel;

		internal Button btnTroubleshooting;

		internal Button btnOk;

		private bool _contentLoaded;

		public Action<int> ClickAction { get; set; }

		public RescuingFailViewV6()
		{
			InitializeComponent();
		}

		public void Init(FlashStatusV6 status, string modelName, string imei, string message, bool? isNormalNotice, bool isRetry = false, DevCategory category = DevCategory.Phone)
		{
			//IL_0116: Unknown result type (might be due to invalid IL or missing references)
			//IL_0120: Expected O, but got Unknown
			//IL_0168: Unknown result type (might be due to invalid IL or missing references)
			//IL_0172: Expected O, but got Unknown
			((UIElement)btnCancel).Visibility = (Visibility)2;
			if (Plugin.SupportMulti)
			{
				((UIElement)modelnameimeistp).Visibility = (Visibility)0;
				modelnamectrl.Text = modelName;
				if (!string.IsNullOrEmpty(imei))
				{
					((UIElement)imeistap).Visibility = (Visibility)0;
					imeictrl.Text = imei;
				}
			}
			if (category == DevCategory.Phone)
			{
				if (isRetry)
				{
					((ContentControl)btnOk).Content = "K0636";
					((UIElement)rightPanel).Visibility = (Visibility)0;
				}
				else
				{
					((ContentControl)btnOk).Content = "K2040";
					((UIElement)rightPanel).Visibility = (Visibility)2;
				}
			}
			else
			{
				((ContentControl)btnOk).Content = (isRetry ? "K0636" : "K2040");
				((UIElement)rightPanel).Visibility = (Visibility)2;
			}
			operatorType = (isRetry ? 1 : 0);
			txtMessage.LangKey = message;
			string text = "K1241";
			if (status == FlashStatusV6.QUIT)
			{
				((UIElement)btnTroubleshooting).Visibility = (Visibility)2;
			}
			else
			{
				((UIElement)btnTroubleshooting).Visibility = (Visibility)0;
			}
			if (status == FlashStatusV6.FAIL)
			{
				titleMessage.LangKey = "K0391";
				img.Source = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/failed.png"));
			}
			else
			{
				isNormalNotice = true;
				((UIElement)warn).Visibility = (Visibility)(string.IsNullOrEmpty(message) ? 2 : 0);
				titleMessage.LangKey = "K1652";
				text = "K1657";
				img.Source = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/quit.png"));
			}
			if (!isNormalNotice.HasValue)
			{
				((UIElement)txtNote).Visibility = (Visibility)2;
			}
			else if (isNormalNotice == true)
			{
				txtNote.Text = HostProxy.LanguageService.Translate(text);
			}
		}

		private void OkClick(object sender, RoutedEventArgs e)
		{
			ClickAction(operatorType);
		}

		private void CancelClick(object sender, RoutedEventArgs e)
		{
			ClickAction(2);
		}

		private void btnTroubleshooting_Click(object sender, RoutedEventArgs e)
		{
			TroubleshootingStepsView win = new TroubleshootingStepsView();
			Task.Run(() => MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)win, (bool?)true));
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/rescuingfailviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Expected O, but got Unknown
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Expected O, but got Unknown
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0067: Expected O, but got Unknown
			//IL_006a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0074: Expected O, but got Unknown
			//IL_0077: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Expected O, but got Unknown
			//IL_0084: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Expected O, but got Unknown
			//IL_0091: Unknown result type (might be due to invalid IL or missing references)
			//IL_009b: Expected O, but got Unknown
			//IL_009e: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a8: Expected O, but got Unknown
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b5: Expected O, but got Unknown
			//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c2: Expected O, but got Unknown
			//IL_00c5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00cf: Expected O, but got Unknown
			//IL_00dc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e6: Expected O, but got Unknown
			//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f3: Expected O, but got Unknown
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			//IL_010a: Expected O, but got Unknown
			//IL_010d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0117: Expected O, but got Unknown
			//IL_0124: Unknown result type (might be due to invalid IL or missing references)
			//IL_012e: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				img = (Image)target;
				break;
			case 2:
				titleMessage = (LangTextBlock)target;
				break;
			case 3:
				modelnameimeistp = (StackPanel)target;
				break;
			case 4:
				modelnamectrl = (TextBlock)target;
				break;
			case 5:
				imeistap = (StackPanel)target;
				break;
			case 6:
				imeictrl = (TextBlock)target;
				break;
			case 7:
				warn = (Grid)target;
				break;
			case 8:
				txtMessage = (LangTextBlock)target;
				break;
			case 9:
				txtNote = (TextBlock)target;
				break;
			case 10:
				rightPanel = (Border)target;
				break;
			case 11:
				btnCancel = (Button)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(CancelClick);
				break;
			case 12:
				btnTroubleshooting = (Button)target;
				((ButtonBase)btnTroubleshooting).Click += new RoutedEventHandler(btnTroubleshooting_Click);
				break;
			case 13:
				btnOk = (Button)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OkClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescuingSuccessViewV6 : UserControl, IComponentConnector
	{
		internal StackPanel modelnameimeistp;

		internal TextBlock modelnamectrl;

		internal StackPanel imeistap;

		internal TextBlock imeictrl;

		internal LangTextBlock successTips;

		internal DockPanel panelNotify;

		internal LangTextBlock message;

		private bool _contentLoaded;

		public Action OkAction { get; set; }

		public RescuingSuccessViewV6()
		{
			InitializeComponent();
		}

		public void Init(string mesage, string modelName, string imei, int usedMinutes)
		{
			if (!string.IsNullOrEmpty(mesage))
			{
				((UIElement)panelNotify).Visibility = (Visibility)0;
				message.LangKey = mesage;
			}
			successTips.LangKey = string.Format(HostProxy.LanguageService.Translate("K2142"), usedMinutes);
			if (Plugin.SupportMulti)
			{
				((UIElement)modelnameimeistp).Visibility = (Visibility)0;
				modelnamectrl.Text = modelName;
				if (!string.IsNullOrEmpty(imei))
				{
					((UIElement)imeistap).Visibility = (Visibility)0;
					imeictrl.Text = imei;
				}
			}
		}

		private void OkClick(object sender, RoutedEventArgs e)
		{
			OkAction();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/rescuingsuccessviewv6.xaml", UriKind.Relative);
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
			//IL_0039: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Expected O, but got Unknown
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_0050: Expected O, but got Unknown
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_005d: Expected O, but got Unknown
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Expected O, but got Unknown
			//IL_006d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0077: Expected O, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Unknown result type (might be due to invalid IL or missing references)
			//IL_009c: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				modelnameimeistp = (StackPanel)target;
				break;
			case 2:
				modelnamectrl = (TextBlock)target;
				break;
			case 3:
				imeistap = (StackPanel)target;
				break;
			case 4:
				imeictrl = (TextBlock)target;
				break;
			case 5:
				successTips = (LangTextBlock)target;
				break;
			case 6:
				panelNotify = (DockPanel)target;
				break;
			case 7:
				message = (LangTextBlock)target;
				break;
			case 8:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OkClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescuingViewV6 : UserControl, IDisposable, IComponentConnector
	{
		internal StackPanel modelnameimeistp;

		internal TextBlock modelnamectrl;

		internal StackPanel imeistap;

		internal TextBlock imeictrl;

		internal Border msgBoder;

		private bool _contentLoaded;

		private RescuingViewModel VM { get; }

		public RescuingViewV6()
		{
			InitializeComponent();
			VM = new RescuingViewModel();
			((FrameworkElement)this).DataContext = VM;
			VidPidMonitorHandler.Instance.DeviceInfoUpdated += delegate(object s, DeviceInfoUpdatedEventArgs e)
			{
				((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
				{
					((UIElement)msgBoder).Visibility = (Visibility)0;
					VM.DeviceInfo = e.MonitorDevice;
				});
			};
		}

		public void Init(string modelName, string imei)
		{
			((UIElement)modelnameimeistp).Visibility = (Visibility)0;
			modelnamectrl.Text = modelName;
			if (!string.IsNullOrEmpty(imei))
			{
				((UIElement)imeistap).Visibility = (Visibility)0;
				imeictrl.Text = imei;
			}
		}

		public void ChangeData(string message, double percentage)
		{
			VM.FlashInfoText = message;
			if (percentage > 0.0)
			{
				VM.Percentage = percentage;
			}
		}

		public void Dispose()
		{
			VM.TickTimer.Stop();
			VM.TickTimer.Dispose();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/rescuingviewv6.xaml", UriKind.Relative);
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
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Expected O, but got Unknown
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				modelnameimeistp = (StackPanel)target;
				break;
			case 2:
				modelnamectrl = (TextBlock)target;
				break;
			case 3:
				imeistap = (StackPanel)target;
				break;
			case 4:
				imeictrl = (TextBlock)target;
				break;
			case 5:
				msgBoder = (Border)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescuingViewModel : ViewModelBase
	{
		private TimeSpan costTime;

		private double percentage;

		private string flashInfoText;

		private MonitorDeviceModel _deviceInfo;

		public System.Timers.Timer TickTimer { get; }

		public TimeSpan CostTime
		{
			get
			{
				return costTime;
			}
			set
			{
				costTime = value;
				((NotifyBase)this).OnPropertyChanged("CostTime");
			}
		}

		public double Percentage
		{
			get
			{
				return percentage;
			}
			set
			{
				percentage = value;
				((NotifyBase)this).OnPropertyChanged("Percentage");
			}
		}

		public string FlashInfoText
		{
			get
			{
				return flashInfoText;
			}
			set
			{
				if (!string.IsNullOrEmpty(value))
				{
					flashInfoText = value;
					((NotifyBase)this).OnPropertyChanged("FlashInfoText");
				}
			}
		}

		public MonitorDeviceModel DeviceInfo
		{
			get
			{
				return _deviceInfo;
			}
			set
			{
				if (_deviceInfo != value)
				{
					_deviceInfo = value;
					((NotifyBase)this).OnPropertyChanged("DeviceInfo");
				}
			}
		}

		public RescuingViewModel()
		{
			RescuingViewModel rescuingViewModel = this;
			DateTime start = DateTime.Now;
			Percentage = 0.0;
			TickTimer = new System.Timers.Timer(1000.0);
			TickTimer.Elapsed += delegate
			{
				rescuingViewModel.CostTime = DateTime.Now - start;
			};
			TickTimer.Start();
		}
	}
	public class ErrorHighlightConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Expected O, but got Unknown
			string text = value as string;
			if (!string.IsNullOrEmpty(text) && text.IndexOf("error", StringComparison.OrdinalIgnoreCase) >= 0)
			{
				return (object)new SolidColorBrush(Colors.Red);
			}
			return (object)new SolidColorBrush(Colors.Black);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotSupportedException();
		}
	}
	public class SmartAMatchViewV6 : UserControl, IAMatchView, IComponentConnector
	{
		private bool _contentLoaded;

		public AutoMatchViewModel VM { get; private set; }

		public FrameworkElement ParentView { get; private set; }

		public FrameworkElement RescueView { get; set; }

		public SmartAMatchViewV6()
		{
			InitializeComponent();
			VM = new SmartAMatchViewModel(this);
			((FrameworkElement)this).DataContext = VM;
		}

		public void Init(AutoMatchResource data, object wModel, FrameworkElement parentView)
		{
			ParentView = parentView;
			VM.Init(data, (WarrantyInfoBaseModel)((wModel is WarrantyInfoBaseModel) ? wModel : null));
		}

		private void OnBtnCopy(object sender, RoutedEventArgs e)
		{
			object originalSource = e.OriginalSource;
			Clipboard.SetText(((FrameworkElement)((originalSource is Button) ? originalSource : null)).Tag.ToString());
		}

		private void OnBtnFlash(object sender, RoutedEventArgs e)
		{
			VM.OnRescue();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/smartamatchviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(ListBox)target).AddHandler(ButtonBase.ClickEvent, (Delegate)new RoutedEventHandler(OnBtnCopy));
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnFlash);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class SmartAMatchViewModel : AutoMatchViewModel
	{
		public SmartAMatchViewModel(SmartAMatchViewV6 ui)
			: base(ui, DevCategory.Smart)
		{
		}
	}
	public class SmartMMatchViewV6 : UserControl, IComponentConnector
	{
		internal StackPanel DownloadPanel;

		internal StackPanel confirm;

		private bool _contentLoaded;

		public SmartMMatchViewModel VM { get; set; }

		public SmartMMatchViewV6()
		{
			InitializeComponent();
			((FrameworkElement)this).Tag = PageIndex.SMART_MANUAL;
			VM = new SmartMMatchViewModel((UserControl)(object)this, DevCategory.Smart);
			((FrameworkElement)this).DataContext = VM;
		}

		public void ChangeConfirmVisibile(Visibility visibile)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			((DispatcherObject)this).Dispatcher.Invoke<Visibility>((Func<Visibility>)(() => ((UIElement)confirm).Visibility = visibile));
		}

		private void OnBtnConfirm(object sender, RoutedEventArgs e)
		{
			VM.GotoRescueView();
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			MainFrameV6.Instance.ShowTutoiral(DevCategory.Smart);
		}

		private void OnReselectRom(object sender, MouseButtonEventArgs e)
		{
			VM.ReSelectRom();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/smartmmatchviewv6.xaml", UriKind.Relative);
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
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Expected O, but got Unknown
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Expected O, but got Unknown
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0067: Expected O, but got Unknown
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Unknown result type (might be due to invalid IL or missing references)
			//IL_007f: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 2:
				DownloadPanel = (StackPanel)target;
				break;
			case 3:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnReselectRom);
				break;
			case 4:
				confirm = (StackPanel)target;
				break;
			case 5:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnConfirm);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class SmartMMatchViewModel : ManualMatchViewModel
	{
		protected bool _IsModelFirst;

		protected UserControl _View;

		protected RedoIfFailedTimer _Timer;

		private Visibility _ProductMoreBtnVisible;

		private Dictionary<string, List<ManualComboboxViewModel>> _CategoryArr;

		private ImageSource _SmartImage;

		private SmartCategoryModel _SelSmartCategory;

		public LComboBoxViewModelV6 CbxMarketNameVM { get; protected set; }

		public ObservableCollection<SmartCategoryModel> SmartArr { get; set; }

		public ImageSource SmartImage
		{
			get
			{
				return _SmartImage;
			}
			set
			{
				_SmartImage = value;
				((NotifyBase)this).OnPropertyChanged("SmartImage");
			}
		}

		public SmartCategoryModel SelSmartCategory
		{
			get
			{
				return _SelSmartCategory;
			}
			set
			{
				_SelSmartCategory = value;
				((NotifyBase)this).OnPropertyChanged("SelSmartCategory");
				if (value == null)
				{
					return;
				}
				((DispatcherObject)_View).Dispatcher.Invoke((Action)delegate
				{
					CbxMarketNameVM.StepComboBoxItemSource.Clear();
					_CategoryArr[value.name].ForEach(delegate(ManualComboboxViewModel p)
					{
						CbxMarketNameVM.StepComboBoxItemSource.Add(p);
					});
					base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
					base.CbxModelNameVM.ComboBoxFilter = ModelBySmartCategoryFilter;
				});
			}
		}

		public SmartMMatchViewModel(UserControl ui, DevCategory category)
			: base((FrameworkElement)(object)ui, category)
		{
			//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b6: Expected O, but got Unknown
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Expected O, but got Unknown
			//IL_00cc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d6: Expected O, but got Unknown
			//IL_00ee: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f8: Expected O, but got Unknown
			//IL_00f3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fd: Expected O, but got Unknown
			//IL_0117: Unknown result type (might be due to invalid IL or missing references)
			//IL_0121: Expected O, but got Unknown
			//IL_011c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0126: Expected O, but got Unknown
			//IL_013f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0149: Expected O, but got Unknown
			//IL_0144: Unknown result type (might be due to invalid IL or missing references)
			//IL_014e: Expected O, but got Unknown
			//IL_0168: Unknown result type (might be due to invalid IL or missing references)
			//IL_0172: Expected O, but got Unknown
			//IL_016d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0177: Expected O, but got Unknown
			//IL_0190: Unknown result type (might be due to invalid IL or missing references)
			//IL_019a: Expected O, but got Unknown
			//IL_0195: Unknown result type (might be due to invalid IL or missing references)
			//IL_019f: Expected O, but got Unknown
			_View = ui;
			_Category = category;
			_Timer = new RedoIfFailedTimer(delegate
			{
				try
				{
					LoadProductName();
				}
				finally
				{
					CbxMarketNameVM.IsDataLoading = false;
				}
			});
			base.CbxModelNameVM.DropDownOpenedChanged = delegate(bool isOpen)
			{
				//IL_0030: Unknown result type (might be due to invalid IL or missing references)
				if (!isOpen)
				{
					if (CbxMarketNameVM.ComboBoxSelectedValue == null)
					{
						base.CbxModelNameVM.ComboBoxFilter = ModelNameInitFilter;
						base.CbxModelNameVM.ComboBoxMoreButtonVisibility = _ModelMoreBtnVisible;
					}
					else
					{
						base.CbxModelNameVM.ComboBoxFilter = ModelByProductFilter;
						base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
					}
				}
			};
			CbxMarketNameVM = new LComboBoxViewModelV6();
			CbxMarketNameVM.IsEditable = true;
			CbxMarketNameVM.ComboBoxSelectedIndex = -1;
			CbxMarketNameVM.ComboBoxWatermark = "K0846";
			CbxMarketNameVM.ItemSelChangedActon = OnMarketNameSelected;
			CbxMarketNameVM.DropDownOpenedChanged = delegate(bool isOpen)
			{
				if (!(CbxMarketNameVM.StepComboBoxItemSource == null || isOpen) && (CbxMarketNameVM.ComboBoxSelectedValue == null || !(CbxMarketNameVM.ComboBoxSelectedValue as ManualComboboxViewModel).IsMore))
				{
					CbxMarketNameVM.ComboBoxFilter = ProductInitFilter;
				}
			};
			CbxMarketNameVM.SetTopClickCommand = (ICommand)new RoutedCommand();
			CbxMarketNameVM.ComboBoxMoreButtonCommand = (ICommand)new RoutedCommand();
			CbxMarketNameVM.ComboBoxTextChangedCommand = (ICommand)new RoutedCommand();
			((UIElement)ui).CommandBindings.Add(new CommandBinding(CbxMarketNameVM.ComboBoxMoreButtonCommand, new ExecutedRoutedEventHandler(OnMarketNameMoreBtnClicked)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(CbxMarketNameVM.ComboBoxTextChangedCommand, new ExecutedRoutedEventHandler(OnMarketNameTextChanged)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(CbxMarketNameVM.SetTopClickCommand, new ExecutedRoutedEventHandler(OnSetTopClicked)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.ComboBoxTextChangedCommand, new ExecutedRoutedEventHandler(OnModelNameTextChanged)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.ComboBoxMoreButtonCommand, new ExecutedRoutedEventHandler(base.OnModelNameMoreBtnClicked)));
			Task.Run(delegate
			{
				LoadProductName();
				LoadModelName();
			}).ContinueWith(delegate
			{
				if (((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => ((FrameworkElement)_View).IsLoaded)))
				{
					if (_CoditionMap == null)
					{
						if (base.CbxModelNameVM.StepComboBoxItemSource != null && base.CbxModelNameVM.StepComboBoxItemSource.Count != 0)
						{
							MainFrameV6.Instance.IMsgManager.SelRegistedDevIfExist($"{_Category}", (Action<string>)delegate(string modelName)
							{
								if (!string.IsNullOrEmpty(modelName))
								{
									ManualComboboxViewModel manualComboboxViewModel = base.CbxModelNameVM.StepComboBoxItemSource?.FirstOrDefault((ManualComboboxViewModel p) => (p.Tag as DeviceModelInfoModel).ModelName == modelName);
									if (manualComboboxViewModel == null)
									{
										MessageWindowHelper.Instance.Show((string)null, "K0098", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
									}
									else
									{
										base.CbxModelNameVM.ComboBoxFilter = DefaultFilter;
										base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
										base.CbxModelNameVM.IsDropDownEnabled = false;
										base.CbxModelNameVM.ComboBoxSelectedValue = manualComboboxViewModel;
									}
								}
							});
						}
					}
					else
					{
						AutoMatchByCoditonMap();
					}
				}
			});
			SmartArr = new ObservableCollection<SmartCategoryModel>();
			base.CbxModelNameVM.DropDownOpenedChanged = null;
			CbxMarketNameVM.DropDownOpenedChanged = null;
			((NotifyBase)CbxMarketNameVM).PropertyChanged += delegate(object sender, PropertyChangedEventArgs e)
			{
				if (!(e.PropertyName != "ComboBoxSelectedValue"))
				{
					if (sender is LComboBoxViewModelV6 { ComboBoxSelectedValue: not null } lComboBoxViewModelV)
					{
						ManualComboboxViewModel manualComboboxViewModel = lComboBoxViewModelV.ComboBoxSelectedValue as ManualComboboxViewModel;
						SmartImage = (manualComboboxViewModel.Tag as SmartMarketNameModel).Image;
					}
					else
					{
						SmartImage = null;
					}
				}
			};
			_CategoryArr = new Dictionary<string, List<ManualComboboxViewModel>>();
		}

		protected virtual void LoadProductName()
		{
			ResponseModel<List<SmartCategoryModel>> val = FlashContext.SingleInstance.service.Request<List<SmartCategoryModel>>(WebApiUrl.LOAD_SMART_DEVICE, (object)null, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
			if (!val.success)
			{
				_Timer.RegisterLoadDataTimer();
				_Timer.IsLoadFailed = true;
				return;
			}
			_Timer.DestoryLoadDataTimer();
			_Timer.IsLoadFailed = false;
			List<SmartCategoryModel> categoryArr = val.content;
			if (categoryArr == null || categoryArr.Count <= 0)
			{
				return;
			}
			List<ManualComboboxViewModel> list = new List<ManualComboboxViewModel>();
			foreach (SmartCategoryModel item2 in categoryArr)
			{
				if (item2.marketNames.Count == 0)
				{
					continue;
				}
				_CategoryArr.Add(item2.name, new List<ManualComboboxViewModel>());
				foreach (SmartMarketNameModel marketName in item2.marketNames)
				{
					ManualComboboxViewModel item = new ManualComboboxViewModel
					{
						ItemText = marketName.MarketName,
						Tag = marketName
					};
					_CategoryArr[item2.name].Add(item);
					list.Add(item);
				}
			}
			list = list.OrderBy((ManualComboboxViewModel p) => p.ItemText).ToList();
			SetProductCbxItems(list, isMore: false);
			((DispatcherObject)_View).Dispatcher.Invoke((Action)delegate
			{
				categoryArr.ForEach(delegate(SmartCategoryModel p)
				{
					if (p.marketNames.Count > 0)
					{
						SmartArr.Add(p);
					}
				});
			});
		}

		public void MatchFromDownloadCenter(Dictionary<string, string> data)
		{
			_CoditionMap = data;
			if (CbxMarketNameVM.StepComboBoxItemSource != null)
			{
				AutoMatchByCoditonMap();
			}
		}

		private async void AutoMatchByCoditonMap()
		{
			if (!_CoditionMap.ContainsKey("marketName"))
			{
				return;
			}
			ManualComboboxViewModel manualComboboxViewModel = CbxMarketNameVM.StepComboBoxItemSource?.FirstOrDefault((ManualComboboxViewModel p) => p.ItemText == _CoditionMap["marketName"]);
			if (manualComboboxViewModel == null)
			{
				_CoditionMap = null;
				await MessageWindowHelper.Instance.Show("K0071", "K0098", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
				ResetCoditionSelUi();
				return;
			}
			ResetCoditionSelUi();
			CbxMarketNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			CbxMarketNameVM.ComboBoxFilter = [DebuggerHidden] (object source, string keywords) => base.DefaultFilter(source, keywords);
			CbxMarketNameVM.IsDropDownEnabled = false;
			CbxMarketNameVM.ComboBoxSelectedValue = manualComboboxViewModel;
		}

		private void OnSetTopClicked(object sender, ExecutedRoutedEventArgs e)
		{
			ManualComboboxViewModel unStop = e.Parameter as ManualComboboxViewModel;
			unStop.IsUsed = false;
			List<ManualComboboxViewModel> list = LoadRescuedDevice($"$.product{_Category}");
			int num = list.FindIndex((ManualComboboxViewModel n) => n.ItemText == unStop.ItemText);
			if (num != -1)
			{
				list.RemoveAt(num);
				FileHelper.WriteJsonWithAesEncrypt(Configurations.RescueManualMatchFile, $"product{_Category}", (object)list, true);
			}
		}

		protected void SetProductCbxItems(List<ManualComboboxViewModel> remote, bool isMore)
		{
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bf: Unknown result type (might be due to invalid IL or missing references)
			foreach (ManualComboboxViewModel item in LoadRescuedDevice($"$.product{_Category}"))
			{
				ManualComboboxViewModel manualComboboxViewModel = remote.FirstOrDefault((ManualComboboxViewModel p) => p.ItemText == item.ItemText);
				if (manualComboboxViewModel != null)
				{
					manualComboboxViewModel.IsUsed = true;
				}
			}
			if (isMore)
			{
				_ProductMoreBtnVisible = (Visibility)0;
			}
			else if (remote.FirstOrDefault((ManualComboboxViewModel p) => p.IsMore) == null)
			{
				_ProductMoreBtnVisible = (Visibility)2;
			}
			else
			{
				_ProductMoreBtnVisible = (Visibility)0;
			}
			Dispatcher currentDispatcher = HostProxy.CurrentDispatcher;
			if (currentDispatcher != null)
			{
				currentDispatcher.Invoke((Action)delegate
				{
					//IL_004d: Unknown result type (might be due to invalid IL or missing references)
					CbxMarketNameVM.ComboBoxFilter = ProductInitFilter;
					CbxMarketNameVM.StepComboBoxItemSource = new ObservableCollection<ManualComboboxViewModel>(remote);
					CbxMarketNameVM.ComboBoxMoreButtonVisibility = _ProductMoreBtnVisible;
				});
			}
			CbxMarketNameVM.IsDataLoading = false;
		}

		protected virtual void OnModelNameTextChanged(object sender, ExecutedRoutedEventArgs e)
		{
			if (CbxMarketNameVM.ComboBoxSelectedValue == null)
			{
				base.CbxModelNameVM.ComboBoxFilter = SearchFilter;
				base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			}
			else
			{
				base.CbxModelNameVM.ComboBoxFilter = ModelByProductFilter;
				base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			}
		}

		protected virtual void OnMarketNameTextChanged(object sender, ExecutedRoutedEventArgs e)
		{
			if (e.Parameter != null && e.Parameter as string == (CbxMarketNameVM.ComboBoxSelectedValue as ManualComboboxViewModel)?.ItemText)
			{
				CbxMarketNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
				CbxMarketNameVM.ComboBoxFilter = base.DefaultFilter;
			}
			else
			{
				CbxMarketNameVM.ComboBoxFilter = ProductSearchFilter;
			}
		}

		protected virtual async void OnMarketNameSelected(object ob)
		{
			_ReqParams.Clear();
			if (!(ob is ManualComboboxViewModel manualComboboxViewModel))
			{
				_IsModelFirst = false;
				base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)((_Category != DevCategory.Tablet) ? 2 : 0);
				base.CbxModelNameVM.ComboBoxFilter = ModelNameInitFilter;
				base.CbxModelNameVM.ComboBoxSelectedValue = null;
				return;
			}
			base.ResetForModelName();
			if (!_IsModelFirst)
			{
				base.CbxModelNameVM.ComboBoxSelectedValue = null;
			}
			dynamic tag = manualComboboxViewModel.Tag;
			if (tag.ReadSupport)
			{
				Dictionary<string, string> dictionary = new Dictionary<string, string>();
				dictionary.Add("marketName", tag.MarketName);
				LoadFastbootData(dictionary);
			}
			else
			{
				_ReqParams.AddParameter("marketName", tag.MarketName);
				base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
				base.CbxModelNameVM.ComboBoxFilter = ModelByProductFilter;
				if (_CoditionMap?.ContainsKey("modelName") ?? false)
				{
					ManualComboboxViewModel manualComboboxViewModel2 = base.CbxModelNameVM.StepComboBoxItemSource.FirstOrDefault((ManualComboboxViewModel p) => p.ItemText == _CoditionMap["modelName"]);
					if (manualComboboxViewModel2 == null)
					{
						_CoditionMap = null;
						await MessageWindowHelper.Instance.Show("K0071", "K0098", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
						ResetCoditionSelUi();
					}
					else
					{
						base.CbxModelNameVM.IsDropDownEnabled = false;
						base.CbxModelNameVM.ComboBoxSelectedValue = manualComboboxViewModel2;
					}
				}
			}
			_IsModelFirst = false;
		}

		protected override void OnModelNameSelected(object obj)
		{
			if (obj != null && CbxMarketNameVM.ComboBoxSelectedValue == null)
			{
				SetSelectedProductByModelName(obj as ManualComboboxViewModel);
			}
			base.OnModelNameSelected(obj);
		}

		private void OnMarketNameMoreBtnClicked(object sender, ExecutedRoutedEventArgs e)
		{
			CbxMarketNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			CbxMarketNameVM.ComboBoxFilter = base.DefaultFilter;
		}

		public void SetSelectedProductByModelName(ManualComboboxViewModel model)
		{
			_IsModelFirst = true;
			DeviceModelInfoModel info = model.Tag as DeviceModelInfoModel;
			ManualComboboxViewModel comboBoxSelectedValue = CbxMarketNameVM.StepComboBoxItemSource.FirstOrDefault((ManualComboboxViewModel p) => p.ItemText == info.MarketName);
			CbxMarketNameVM.IsDropDownEnabled = false;
			CbxMarketNameVM.ComboBoxFilter = base.DefaultFilter;
			CbxMarketNameVM.ComboBoxSelectedValue = comboBoxSelectedValue;
			CbxMarketNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			base.CbxModelNameVM.ComboBoxFilter = ModelByProductFilter;
			base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
		}

		protected override void ResetForModelName()
		{
			string parameter = _ReqParams.GetParameter("marketName");
			_ReqParams.Clear();
			_ReqParams.AddParameter("marketName", parameter);
			_ReqParams.AddParameter("countryCode", GlobalFun.GetRegionInfo().TwoLetterISORegionName);
			base.ResetForModelName();
		}

		protected override void ResetCoditionSelUi()
		{
			CbxMarketNameVM.ComboBoxSelectedValue = null;
		}

		public override void RegisterDeviceAsync()
		{
			try
			{
				List<ManualComboboxViewModel> list = LoadRescuedDevice($"$.product{_Category}");
				ManualComboboxViewModel cur = CbxMarketNameVM.ComboBoxSelectedValue as ManualComboboxViewModel;
				cur.IsUsed = true;
				int num = list.FindIndex((ManualComboboxViewModel n) => n.ItemText == cur.ItemText);
				if (num != -1)
				{
					list.RemoveAt(num);
				}
				list.Insert(0, cur);
				FileHelper.WriteJsonWithAesEncrypt(Configurations.RescueManualMatchFile, $"product{_Category}", (object)list, true);
			}
			catch (Exception)
			{
			}
		}

		public string GetMarktNameByModelName(string modelname)
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			dictionary.Add("modelName", modelname);
			return FlashContext.SingleInstance.service.RequestContent<DeviceModelInfoModel>(WebServicesContext.GET_FASTBOOTDATA_RECIPE, (object)dictionary, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false)?.MarketName;
		}

		protected int ModelByProductFilter(object source, string product)
		{
			ManualComboboxViewModel obj = source as ManualComboboxViewModel;
			ManualComboboxViewModel manualComboboxViewModel = CbxMarketNameVM.ComboBoxSelectedValue as ManualComboboxViewModel;
			return (!((obj.Tag as DeviceModelInfoModel).MarketName == manualComboboxViewModel.ItemText)) ? 1 : 0;
		}

		protected int ProductInitFilter(object source, string keywords)
		{
			return 0;
		}

		protected int ProductSearchFilter(object source, string keywords)
		{
			ManualComboboxViewModel manualComboboxViewModel = source as ManualComboboxViewModel;
			if (string.IsNullOrEmpty(keywords))
			{
				return 0;
			}
			return (!manualComboboxViewModel.ItemText.ToLowerInvariant().Contains(keywords.ToLowerInvariant())) ? 1 : 0;
		}

		protected override int ModelNameInitFilter(object source, string keywords)
		{
			return ModelBySmartCategoryFilter(source, keywords);
		}

		protected override int SearchFilter(object source, string keywords)
		{
			ManualComboboxViewModel manualComboboxViewModel = source as ManualComboboxViewModel;
			if (string.IsNullOrEmpty(keywords))
			{
				return ModelBySmartCategoryFilter(source, keywords);
			}
			if (manualComboboxViewModel.ItemText.ToLowerInvariant().Contains(keywords.ToLowerInvariant()))
			{
				return ModelBySmartCategoryFilter(manualComboboxViewModel, keywords);
			}
			return 1;
		}

		protected override int DefaultFilter(object source, string keywords)
		{
			return ModelBySmartCategoryFilter(source, keywords);
		}

		protected int ModelBySmartCategoryFilter(object source, string product)
		{
			ManualComboboxViewModel manualComboboxViewModel = source as ManualComboboxViewModel;
			string marketName = (manualComboboxViewModel.Tag as DeviceModelInfoModel).MarketName;
			return (CbxMarketNameVM.StepComboBoxItemSource.FirstOrDefault((ManualComboboxViewModel p) => p.ItemText == marketName) == null) ? 1 : 0;
		}
	}
	public class SmartQMatchViewV6 : UserControl, IComponentConnector
	{
		private Button _BtnDel;

		private readonly SolidColorBrush _NormalBorderBrush;

		private readonly SolidColorBrush _ErrorBorderBrush;

		public SmartQMatchViewModel _VM;

		internal TextBox txtSearch;

		internal Path icon;

		internal Popup PART_Popup;

		private bool _contentLoaded;

		public SmartQMatchViewV6()
		{
			//IL_006a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0074: Expected O, but got Unknown
			//IL_0081: Unknown result type (might be due to invalid IL or missing references)
			//IL_008b: Expected O, but got Unknown
			InitializeComponent();
			((FrameworkElement)this).Tag = PageIndex.SMART_SEARCH;
			_VM = new SmartQMatchViewModel(this);
			((FrameworkElement)this).DataContext = _VM;
			object obj = ((FrameworkElement)this).TryFindResource((object)"V6_BorderBrushKey");
			_NormalBorderBrush = (SolidColorBrush)((obj is SolidColorBrush) ? obj : null);
			object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_WarnningBrushKey");
			_ErrorBorderBrush = (SolidColorBrush)((obj2 is SolidColorBrush) ? obj2 : null);
			((FrameworkElement)txtSearch).Loaded += (RoutedEventHandler)delegate
			{
				//IL_0040: Unknown result type (might be due to invalid IL or missing references)
				//IL_0045: Unknown result type (might be due to invalid IL or missing references)
				//IL_004c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0057: Unknown result type (might be due to invalid IL or missing references)
				//IL_0061: Expected O, but got Unknown
				//IL_0066: Expected O, but got Unknown
				//IL_009a: Unknown result type (might be due to invalid IL or missing references)
				//IL_00a4: Expected O, but got Unknown
				object obj3 = ((FrameworkTemplate)((Control)txtSearch).Template).FindName("PART_Toggle", (FrameworkElement)(object)txtSearch);
				ToggleButton val = (ToggleButton)((obj3 is ToggleButton) ? obj3 : null);
				if (val != null)
				{
					((FrameworkElement)val).SetBinding(UIElement.VisibilityProperty, "ToggleButtonVisibility");
				}
				((FrameworkElement)PART_Popup).SetBinding(Popup.IsOpenProperty, (BindingBase)new Binding
				{
					Source = val,
					Path = new PropertyPath("IsChecked", Array.Empty<object>())
				});
				object obj4 = ((FrameworkTemplate)((Control)txtSearch).Template).FindName("PART_Empty", (FrameworkElement)(object)txtSearch);
				_BtnDel = (Button)((obj4 is Button) ? obj4 : null);
				((ButtonBase)_BtnDel).Click += (RoutedEventHandler)delegate
				{
					_VM.SearchKeyText = string.Empty;
				};
			};
			((UIElement)txtSearch).GotFocus += (RoutedEventHandler)delegate
			{
				_VM.SearchWarnText = string.Empty;
			};
		}

		private void OnPreviewKeyDown(object sender, KeyEventArgs e)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Invalid comparison between Unknown and I4
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Invalid comparison between Unknown and I4
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Invalid comparison between Unknown and I4
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Invalid comparison between Unknown and I4
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Invalid comparison between Unknown and I4
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Invalid comparison between Unknown and I4
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Invalid comparison between Unknown and I4
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Invalid comparison between Unknown and I4
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Invalid comparison between Unknown and I4
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Invalid comparison between Unknown and I4
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Invalid comparison between Unknown and I4
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Invalid comparison between Unknown and I4
			if ((int)((KeyboardEventArgs)e).KeyboardDevice.Modifiers == 4)
			{
				((RoutedEventArgs)e).Handled = true;
			}
			else if ((int)e.Key == 2)
			{
				((RoutedEventArgs)e).Handled = false;
			}
			else if (((int)e.Key >= 34 && (int)e.Key <= 43) || ((int)e.Key >= 74 && (int)e.Key <= 83) || ((int)e.Key >= 44 && (int)e.Key <= 69) || (int)e.Key == 23 || (int)e.Key == 25 || ((int)((KeyboardEventArgs)e).KeyboardDevice.Modifiers == 2 && (int)e.Key == 65))
			{
				TextBox val = (TextBox)((sender is TextBox) ? sender : null);
				if (val.Text.Length >= 8 && val.SelectionLength == 0)
				{
					((RoutedEventArgs)e).Handled = true;
				}
				else
				{
					((RoutedEventArgs)e).Handled = false;
				}
			}
			else
			{
				((RoutedEventArgs)e).Handled = true;
			}
		}

		private void Txt_TextChanged(object sender, TextChangedEventArgs e)
		{
			TextBox val = (TextBox)((sender is TextBox) ? sender : null);
			val.Text = val.Text.Trim();
			((UIElement)_BtnDel).Visibility = (Visibility)(string.IsNullOrEmpty(val.Text) ? 2 : 0);
			if (string.IsNullOrEmpty(val.Text) || _VM.ValidateSN(val.Text))
			{
				_VM.SearchWarnText = string.Empty;
				_VM.IsBtnEnable = !string.IsNullOrEmpty(val.Text);
				((Control)txtSearch).BorderBrush = (Brush)(object)_NormalBorderBrush;
			}
			else if (val.Text.Length < 8)
			{
				_VM.SearchWarnText = "K1182";
				_VM.IsBtnEnable = false;
				((Control)txtSearch).BorderBrush = (Brush)(object)_ErrorBorderBrush;
			}
			else
			{
				_VM.SearchWarnText = "K1183";
				_VM.IsBtnEnable = false;
				((Control)txtSearch).BorderBrush = (Brush)(object)_ErrorBorderBrush;
			}
		}

		private void OnSelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			object originalSource = ((RoutedEventArgs)e).OriginalSource;
			if (((Selector)((originalSource is ListBox) ? originalSource : null)).SelectedIndex != -1)
			{
				PART_Popup.IsOpen = false;
			}
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Task.Run(delegate
			{
				IMessageWindowV6 win = null;
				((DispatcherObject)Application.Current).Dispatcher.Invoke<IMessageWindowV6>((Func<IMessageWindowV6>)(() => win = (IMessageWindowV6)(object)new FindSmartSNView()));
				if (MessageWindowHelper.Instance.Show(win, (bool?)true).Result == true)
				{
					MainFrameV6.Instance.ChangeView(PageIndex.SMART_MANUAL);
				}
			});
		}

		private void OnBtnSearch(object sender, RoutedEventArgs e)
		{
			_VM.SmartMatchBySN();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/smartqmatchviewv6.xaml", UriKind.Relative);
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
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0077: Expected O, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0084: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Unknown result type (might be due to invalid IL or missing references)
			//IL_009c: Expected O, but got Unknown
			//IL_009f: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a9: Expected O, but got Unknown
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c1: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				txtSearch = (TextBox)target;
				((UIElement)txtSearch).PreviewKeyDown += new KeyEventHandler(OnPreviewKeyDown);
				((TextBoxBase)txtSearch).TextChanged += new TextChangedEventHandler(Txt_TextChanged);
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnSearch);
				break;
			case 3:
				icon = (Path)target;
				break;
			case 4:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 5:
				PART_Popup = (Popup)target;
				break;
			case 6:
				((Selector)(ListBox)target).SelectionChanged += new SelectionChangedEventHandler(OnSelectionChanged);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class SmartQMatchViewModel : NotifyBase
	{
		private SmartQMatchViewV6 _View;

		private string _SearchKeyText;

		private string _SearchWarnText;

		private bool _IsBtnEnable;

		private Visibility _ToggleButtonVisibility;

		public string SearchKeyText
		{
			get
			{
				return _SearchKeyText;
			}
			set
			{
				_SearchKeyText = value;
				((NotifyBase)this).OnPropertyChanged("SearchKeyText");
			}
		}

		public string SearchWarnText
		{
			get
			{
				return _SearchWarnText;
			}
			set
			{
				_SearchWarnText = value;
				((NotifyBase)this).OnPropertyChanged("SearchWarnText");
			}
		}

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

		public Visibility ToggleButtonVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _ToggleButtonVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_ToggleButtonVisibility = value;
				((NotifyBase)this).OnPropertyChanged("ToggleButtonVisibility");
			}
		}

		public ObservableCollection<Tuple<string, string>> SnArr { get; set; }

		public SmartQMatchViewModel(SmartQMatchViewV6 ui)
		{
			_View = ui;
			List<Tuple<string, string>> registerDevInfo = GetRegisterDevInfo();
			registerDevInfo?.ForEach(delegate(Tuple<string, string> p)
			{
				SnArr.Add(p);
			});
			ToggleButtonVisibility = (Visibility)((registerDevInfo == null || registerDevInfo.Count <= 0) ? 2 : 0);
		}

		public void SmartMatchBySN()
		{
			if (!ValidateSN(SearchKeyText))
			{
				SearchWarnText = "K1184";
				return;
			}
			SearchWarnText = string.Empty;
			object wModel = null;
			IsBtnEnable = false;
			Plugin.OperateTracker("SNSearchBtnClick", "User search smart firmware by SN");
			Dictionary<string, object> aparams = new Dictionary<string, object>();
			aparams.Add("sn", SearchKeyText);
			LogHelper.LogInstance.Info("search smart firmware by SN:[" + SearchKeyText + "].", false);
			Task<object> task = MessageWindowHelper.Instance.Loading("K1006", (Func<object>)delegate
			{
				//IL_0040: Unknown result type (might be due to invalid IL or missing references)
				//IL_004f: Unknown result type (might be due to invalid IL or missing references)
				//IL_00dc: Unknown result type (might be due to invalid IL or missing references)
				Stopwatch stopwatch = new Stopwatch();
				stopwatch.Start();
				ResponseModel<List<ResourceResponseModel>> val = FlashContext.SingleInstance.service.Request<List<ResourceResponseModel>>(WebServicesContext.GET_RESOURCES_BY_SN, (object)aparams, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				stopwatch.Stop();
				List<ResourceResponseModel> content = val.content;
				BusinessStatus status = (BusinessStatus)20;
				if (content != null && content.Count > 0)
				{
					status = (BusinessStatus)10;
					aparams.Add("romMatchId", content[0].romMatchId);
				}
				if (val.code == "0000" || val.code == "3010" || val.code == "3030" || val.code == "3040")
				{
					wModel = MainFrameV6.Instance.LoadWarranty(SearchKeyText);
				}
				return new
				{
					code = val.code,
					resp = content,
					time = stopwatch.ElapsedMilliseconds,
					status = status
				};
			}, false);
			Task.Run(delegate
			{
				dynamic result = task.Result;
				Task.Run(delegate
				{
					//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
					//IL_0188: Expected O, but got Unknown
					HostProxy.BehaviorService.Collect((BusinessType)3020, new BusinessData((BusinessType)3020, (DeviceEx)null, (BusinessStatus)0).Update(result.time, result.status, aparams));
				});
				IsBtnEnable = true;
				if (result.code == "3010")
				{
					if (result.resp == null || result.resp.Count == 0)
					{
						MessageWindowHelper.Instance.Show("K0711", "K0113", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
					}
					else
					{
						DevCategory realCategory = ((result.resp[0].Category?.ToLower() == "tablet") ? DevCategory.Tablet : DevCategory.Smart);
						((DispatcherObject)Application.Current).Dispatcher.Invoke<Task<bool?>>((Func<Task<bool?>>)(() => MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)new Match3010View(realCategory, result.resp[0].ModelName, SearchKeyText, wModel), (bool?)true)));
					}
				}
				else if (result.code == "3030")
				{
					DevCategory devCategory = ((result.resp[0].Category?.ToLower() == "tablet") ? DevCategory.Tablet : DevCategory.Smart);
					Match3030View.ProcMatch3030(null, null, _View, result.resp[0], SearchKeyText, devCategory, null, wModel);
				}
				else if (result.code == "3040" || result.code == "0000")
				{
					dynamic val = result.resp[0];
					DevCategory devCategory2 = ((result.resp[0].Category?.ToLower() == "tablet") ? DevCategory.Tablet : DevCategory.Smart);
					if (Match3040View.ProcMatch3040(val, SearchKeyText, devCategory2, wModel) == true)
					{
						if (result.resp.Count != 1)
						{
							val = MultiRomsSelView.SelectOneFormRomArr(result.resp);
							if (val == null)
							{
								return;
							}
						}
						RescueDeviceInfoModel rescueDeviceInfoModel = new RescueDeviceInfoModel
						{
							modelName = val.ModelName,
							sn = SearchKeyText,
							marketName = val.marketName,
							romMatchId = val.romMatchId
						};
						AutoMatchResource data = new AutoMatchResource(null, rescueDeviceInfoModel, val, new MatchInfo(lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.SN, aparams, rescueDeviceInfoModel));
						MainFrameV6.Instance.JumptoRescueView(devCategory2, data, wModel, (FrameworkElement)(object)_View);
					}
				}
				else if (result.code == "1000")
				{
					InvalidView win = null;
					((DispatcherObject)Application.Current).Dispatcher.Invoke<InvalidView>((Func<InvalidView>)(() => win = new InvalidView(DevCategory.Smart, 0)));
					MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)win, (bool?)true).Wait();
					if (win.Result == true)
					{
						if (win.IsManualModel)
						{
							MainFrameV6.Instance.ChangeView(PageIndex.SMART_MANUAL);
						}
						else
						{
							((DispatcherObject)Application.Current).Dispatcher.Invoke<Task<bool?>>((Func<Task<bool?>>)(() => MessageWindowHelper.Instance.Show((IMessageWindowV6)new DeviceTutorialsDialogViewV6(true), (bool?)true)));
						}
					}
				}
			});
		}

		public bool ValidateSN(string sn)
		{
			return Regex.IsMatch(sn, "^([a-zA-Z]{1}[a-hj-np-zA-HJ-NP-Z0-9]{7})$");
		}

		private List<Tuple<string, string>> GetRegisterDevInfo()
		{
			if (HostProxy.User.user != null)
			{
				JArray val = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.DefaultOptionsFileName, "$.devices[?(@.userId =='" + HostProxy.User.user.UserId + "')].registeredModels", false);
				if (val != null && ((JToken)val).HasValues)
				{
					string empty = string.Empty;
					List<Tuple<string, string>> list = new List<Tuple<string, string>>();
					List<JToken> list2 = ((IEnumerable<JToken>)val).OrderBy((JToken n) => n.Value<string>((object)"modelName")).ToList();
					if (list2 == null)
					{
						return null;
					}
					{
						foreach (JToken item2 in list2)
						{
							string item = item2.Value<string>((object)"modelName");
							string text = item2.Value<string>((object)"category");
							if (!string.IsNullOrEmpty(text) && text.Equals("Smart", StringComparison.CurrentCultureIgnoreCase))
							{
								empty = item2.Value<string>((object)"sn");
								if (!string.IsNullOrEmpty(empty))
								{
									list.Add(new Tuple<string, string>(item, empty));
								}
							}
						}
						return list;
					}
				}
			}
			return null;
		}
	}
	public class TabletAMatchViewV6 : UserControl, IAMatchView, IComponentConnector
	{
		private bool _contentLoaded;

		public AutoMatchViewModel VM { get; private set; }

		public FrameworkElement ParentView { get; private set; }

		public FrameworkElement RescueView { get; set; }

		public TabletAMatchViewV6()
		{
			InitializeComponent();
			VM = new TabletAMatchViewModel(this);
			((FrameworkElement)this).DataContext = VM;
		}

		public void Init(AutoMatchResource data, object wModel, FrameworkElement parentView)
		{
			ParentView = parentView;
			(VM as TabletAMatchViewModel).LoadYoutubeInfo(data.deviceInfo.modelName ?? data.resource.ModelName);
			VM.Init(data, (WarrantyInfoBaseModel)((wModel is WarrantyInfoBaseModel) ? wModel : null));
		}

		private void OnBtnCopy(object sender, RoutedEventArgs e)
		{
			object originalSource = e.OriginalSource;
			Clipboard.SetText(((FrameworkElement)((originalSource is Button) ? originalSource : null)).Tag.ToString());
		}

		private void OnBtnFlash(object sender, RoutedEventArgs e)
		{
			VM.OnRescue();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/tabletamatchviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(ListBox)target).AddHandler(ButtonBase.ClickEvent, (Delegate)new RoutedEventHandler(OnBtnCopy));
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnFlash);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class TabletAMatchViewModel : AutoMatchViewModel
	{
		private Visibility youTubeVisibile = (Visibility)2;

		private string youTubeText;

		protected string YouTubeUrl;

		public Visibility YouTubeVisibile
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return youTubeVisibile;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				youTubeVisibile = value;
				((NotifyBase)this).OnPropertyChanged("YouTubeVisibile");
			}
		}

		public string YouTubeText
		{
			get
			{
				return youTubeText;
			}
			set
			{
				youTubeText = value;
				((NotifyBase)this).OnPropertyChanged("YouTubeText");
			}
		}

		public ReplayCommand YouTubeClickCommand { get; }

		public TabletAMatchViewModel(TabletAMatchViewV6 ui)
			: base(ui, DevCategory.Tablet)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			YouTubeClickCommand = new ReplayCommand((Action<object>)delegate
			{
				GlobalFun.OpenUrlByBrowser(YouTubeUrl);
			});
		}

		public void LoadYoutubeInfo(string modelName)
		{
			Task.Run(delegate
			{
				//IL_0029: Unknown result type (might be due to invalid IL or missing references)
				((DispatcherObject)Application.Current).Dispatcher.Invoke<Visibility>((Func<Visibility>)delegate
				{
					//IL_0008: Unknown result type (might be due to invalid IL or missing references)
					//IL_000e: Unknown result type (might be due to invalid IL or missing references)
					TabletAMatchViewModel tabletAMatchViewModel = this;
					Visibility result = (Visibility)2;
					tabletAMatchViewModel.YouTubeVisibile = (Visibility)2;
					return result;
				});
				Dictionary<string, string> dictionary = new Dictionary<string, string> { { "modelName", modelName } };
				return FlashContext.SingleInstance.service.RequestContent<JObject>(WebApiUrl.LOAD_YOUTUBE_INFO, (object)dictionary, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
			}).ContinueWith(delegate(Task<JObject> ar)
			{
				JObject jobj = ar.Result;
				if (jobj != null)
				{
					YouTubeUrl = ((JToken)jobj).Value<string>((object)"videoLink");
					if (((JToken)jobj).Value<bool>((object)"clientShow") && !string.IsNullOrEmpty(YouTubeUrl))
					{
						((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
						{
							YouTubeText = ((JToken)jobj).Value<string>((object)"videoDesc");
							YouTubeVisibile = (Visibility)0;
						});
					}
				}
			});
		}
	}
	public class TabletMMatchViewV6 : UserControl, IComponentConnector
	{
		internal RadioButton rbtn;

		internal StackPanel DownloadPanel;

		internal StackPanel confirm;

		private bool _contentLoaded;

		public TabletMMatchViewModel VM { get; private set; }

		public TabletMMatchViewV6()
		{
			InitializeComponent();
			((FrameworkElement)this).Tag = PageIndex.TABLET_MANUAL;
			VM = new TabletMMatchViewModel((FrameworkElement)(object)this, DevCategory.Tablet);
			((FrameworkElement)this).DataContext = VM;
		}

		public void ChangeConfirmVisibile(Visibility visibile)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			((DispatcherObject)this).Dispatcher.Invoke<Visibility>((Func<Visibility>)(() => ((UIElement)confirm).Visibility = visibile));
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			MainFrameV6.Instance.ShowTutoiral(DevCategory.Tablet);
		}

		private void OnRbtnChecked(object sender, RoutedEventArgs e)
		{
			if (VM != null)
			{
				object originalSource = e.OriginalSource;
				RadioButton val = (RadioButton)((originalSource is RadioButton) ? originalSource : null);
				VM.ShowTutorial(Convert.ToBoolean(((FrameworkElement)val).Tag));
			}
		}

		private void OnBtnConfirm(object sender, RoutedEventArgs e)
		{
			VM.GotoRescueView();
		}

		private void OnReselectRom(object sender, MouseButtonEventArgs e)
		{
			VM.ReSelectRom();
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/tabletmmatchviewv6.xaml", UriKind.Relative);
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
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_004c: Expected O, but got Unknown
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Expected O, but got Unknown
			//IL_0066: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Expected O, but got Unknown
			//IL_007f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0089: Expected O, but got Unknown
			//IL_008b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0097: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a1: Expected O, but got Unknown
			//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ae: Expected O, but got Unknown
			//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				rbtn = (RadioButton)target;
				((ToggleButton)rbtn).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			case 2:
				((ToggleButton)(RadioButton)target).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			case 3:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 4:
				DownloadPanel = (StackPanel)target;
				break;
			case 5:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnReselectRom);
				break;
			case 6:
				confirm = (StackPanel)target;
				break;
			case 7:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnConfirm);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class TabletMMatchViewModel : ManualMatchViewModel
	{
		protected bool _IsModelFirst;

		protected FrameworkElement _View;

		public LComboBoxViewModelV6 CbxMarketNameVM { get; protected set; }

		public TabletMMatchViewModel(FrameworkElement ui, DevCategory category)
			: base(ui, category)
		{
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Expected O, but got Unknown
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Expected O, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Expected O, but got Unknown
			//IL_0073: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Expected O, but got Unknown
			//IL_0096: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a0: Expected O, but got Unknown
			//IL_009b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Expected O, but got Unknown
			_View = ui;
			_Category = category;
			base.CbxModelNameVM.DropDownOpenedChanged = delegate(bool isOpen)
			{
				//IL_0057: Unknown result type (might be due to invalid IL or missing references)
				if (!(base.CbxModelNameVM.StepComboBoxItemSource == null || isOpen) && (base.CbxModelNameVM.ComboBoxSelectedValue == null || !(base.CbxModelNameVM.ComboBoxSelectedValue as ManualComboboxViewModel).IsMore))
				{
					base.CbxModelNameVM.ComboBoxFilter = ModelNameInitFilter;
					base.CbxModelNameVM.ComboBoxMoreButtonVisibility = _ModelMoreBtnVisible;
				}
			};
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.SetTopClickCommand, new ExecutedRoutedEventHandler(OnSetTopClicked)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.ComboBoxTextChangedCommand, new ExecutedRoutedEventHandler(OnModelNameTextChanged)));
			((UIElement)ui).CommandBindings.Add(new CommandBinding(base.CbxModelNameVM.ComboBoxMoreButtonCommand, new ExecutedRoutedEventHandler(base.OnModelNameMoreBtnClicked)));
			ShowTutorial(isModelName: true);
			Task.Run(delegate
			{
				LoadModelName();
			}).ContinueWith(delegate
			{
				if (((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => _View.IsLoaded)))
				{
					if (_CoditionMap == null)
					{
						if (base.CbxModelNameVM.StepComboBoxItemSource != null && base.CbxModelNameVM.StepComboBoxItemSource.Count != 0)
						{
							MainFrameV6.Instance.IMsgManager.SelRegistedDevIfExist($"{_Category}", (Action<string>)delegate(string modelName)
							{
								if (!string.IsNullOrEmpty(modelName))
								{
									ManualComboboxViewModel manualComboboxViewModel = base.CbxModelNameVM.StepComboBoxItemSource?.FirstOrDefault((ManualComboboxViewModel p) => (p.Tag as DeviceModelInfoModel).ModelName == modelName);
									if (manualComboboxViewModel == null)
									{
										MessageWindowHelper.Instance.Show((string)null, "K0098", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
									}
									else
									{
										base.CbxModelNameVM.ComboBoxFilter = DefaultFilter;
										base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
										base.CbxModelNameVM.IsDropDownEnabled = false;
										base.CbxModelNameVM.ComboBoxSelectedValue = manualComboboxViewModel;
									}
								}
							});
						}
					}
					else
					{
						AutoMatchByCoditonMap();
					}
				}
			});
		}

		public void MatchFromDownloadCenter(Dictionary<string, string> data)
		{
			_CoditionMap = data;
			if (base.CbxModelNameVM.StepComboBoxItemSource != null)
			{
				AutoMatchByCoditonMap();
			}
		}

		private async void AutoMatchByCoditonMap()
		{
			if (_CoditionMap.ContainsKey("modelName"))
			{
				ManualComboboxViewModel manualComboboxViewModel = base.CbxModelNameVM.StepComboBoxItemSource?.FirstOrDefault((ManualComboboxViewModel p) => (p.Tag as DeviceModelInfoModel).ModelName == _CoditionMap["modelName"]);
				if (manualComboboxViewModel == null)
				{
					_CoditionMap = null;
					await MessageWindowHelper.Instance.Show("K0071", "K0098", "K0327", (string)null, false, (MessageBoxImage)48, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
					ResetCoditionSelUi();
				}
				else
				{
					ResetCoditionSelUi();
					base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
					base.CbxModelNameVM.ComboBoxFilter = DefaultFilter;
					base.CbxModelNameVM.IsDropDownEnabled = false;
					base.CbxModelNameVM.ComboBoxSelectedValue = manualComboboxViewModel;
				}
			}
		}

		public override void ChangeConfirmVisibile(Visibility visibile)
		{
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			if (_View is TabletMMatchViewV6 tabletMMatchViewV)
			{
				tabletMMatchViewV.ChangeConfirmVisibile(visibile);
			}
			else
			{
				(_View as SmartMMatchViewV6).ChangeConfirmVisibile(visibile);
			}
		}

		public void ShowTutorial(bool isModelName)
		{
			if (isModelName)
			{
				base.HelpImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/tModelName.png";
				base.AndroidSettingText = "K1086";
			}
			else
			{
				base.HelpImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/tPowerOff.png";
				base.AndroidSettingText = "K1259";
			}
		}

		protected virtual void OnModelNameTextChanged(object sender, ExecutedRoutedEventArgs e)
		{
			base.CbxModelNameVM.ComboBoxMoreButtonVisibility = (Visibility)2;
			if (base.CbxModelNameVM.ComboBoxSelectedValue == null && base.CbxModelNameVM.ComboBoxSelectedIndex == -1)
			{
				base.CbxModelNameVM.ComboBoxFilter = SearchFilter;
			}
			else
			{
				base.CbxModelNameVM.ComboBoxFilter = DefaultFilter;
			}
		}

		private void OnSetTopClicked(object sender, ExecutedRoutedEventArgs e)
		{
			ManualComboboxViewModel unStop = e.Parameter as ManualComboboxViewModel;
			unStop.IsUsed = false;
			List<ManualComboboxViewModel> list = LoadRescuedDevice($"$.modelname{_Category}");
			int num = list.FindIndex((ManualComboboxViewModel n) => n.ItemText == unStop.ItemText);
			if (num != -1)
			{
				list.RemoveAt(num);
				FileHelper.WriteJsonWithAesEncrypt(Configurations.RescueManualMatchFile, $"modelname{_Category}", (object)list, true);
			}
		}

		protected override void ResetForModelName()
		{
			_ReqParams.Clear();
			_ReqParams.AddParameter("countryCode", GlobalFun.GetRegionInfo().TwoLetterISORegionName);
			base.ResetForModelName();
		}
	}
	public class TabletQMatchViewV6 : UserControl, IComponentConnector
	{
		private Button _BtnDel;

		private SolidColorBrush _NormalBorderBrush;

		private SolidColorBrush _ErrorBorderBrush;

		private int CurrentIndex = 1;

		private readonly Dictionary<int, string> ConnectTutorialsMap = new Dictionary<int, string>
		{
			{ 1, "K1879" },
			{ 2, "K1880" },
			{ 3, "K1881" }
		};

		internal TextBox txtSearch;

		internal Path icon;

		internal Grid textgrid;

		internal Button prevbtn;

		internal LangTextBlock steptext;

		internal Button nextbtn;

		internal Popup PART_Popup;

		private bool _contentLoaded;

		public TabletQMatchViewModelV6 VM { get; private set; }

		public TabletQMatchViewV6()
		{
			//IL_0093: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Expected O, but got Unknown
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00af: Expected O, but got Unknown
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Expected O, but got Unknown
			InitializeComponent();
			((FrameworkElement)this).Tag = PageIndex.TABLET_SEARCH;
			VM = new TabletQMatchViewModelV6(this);
			object obj = ((FrameworkElement)this).TryFindResource((object)"V6_BorderBrushKey");
			_NormalBorderBrush = (SolidColorBrush)((obj is SolidColorBrush) ? obj : null);
			object obj2 = ((FrameworkElement)this).TryFindResource((object)"V6_WarnningBrushKey");
			_ErrorBorderBrush = (SolidColorBrush)((obj2 is SolidColorBrush) ? obj2 : null);
			((FrameworkElement)txtSearch).Loaded += (RoutedEventHandler)delegate
			{
				//IL_0040: Unknown result type (might be due to invalid IL or missing references)
				//IL_0045: Unknown result type (might be due to invalid IL or missing references)
				//IL_004c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0057: Unknown result type (might be due to invalid IL or missing references)
				//IL_0061: Expected O, but got Unknown
				//IL_0066: Expected O, but got Unknown
				//IL_009a: Unknown result type (might be due to invalid IL or missing references)
				//IL_00a4: Expected O, but got Unknown
				object obj3 = ((FrameworkTemplate)((Control)txtSearch).Template).FindName("PART_Toggle", (FrameworkElement)(object)txtSearch);
				ToggleButton val = (ToggleButton)((obj3 is ToggleButton) ? obj3 : null);
				if (val != null)
				{
					((FrameworkElement)val).SetBinding(UIElement.VisibilityProperty, "ToggleButtonVisibility");
				}
				((FrameworkElement)PART_Popup).SetBinding(Popup.IsOpenProperty, (BindingBase)new Binding
				{
					Source = val,
					Path = new PropertyPath("IsChecked", Array.Empty<object>())
				});
				object obj4 = ((FrameworkTemplate)((Control)txtSearch).Template).FindName("PART_Empty", (FrameworkElement)(object)txtSearch);
				_BtnDel = (Button)((obj4 is Button) ? obj4 : null);
				((ButtonBase)_BtnDel).Click += (RoutedEventHandler)delegate
				{
					VM.SearchKeyText = string.Empty;
				};
			};
			((FrameworkElement)this).Loaded += new RoutedEventHandler(TabletQMatchViewV6_Loaded);
			((UIElement)txtSearch).GotFocus += (RoutedEventHandler)delegate
			{
				VM.SearchWarnText = string.Empty;
			};
			((FrameworkElement)this).DataContext = VM;
		}

		private void TabletQMatchViewV6_Loaded(object sender, RoutedEventArgs e)
		{
			CurrentIndex = 1;
			((UIElement)nextbtn).IsEnabled = true;
			((UIElement)prevbtn).IsEnabled = false;
			steptext.LangKey = ConnectTutorialsMap[CurrentIndex];
		}

		private void OnPreviewKeyDown(object sender, KeyEventArgs e)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Invalid comparison between Unknown and I4
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Invalid comparison between Unknown and I4
			//IL_0028: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Invalid comparison between Unknown and I4
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Invalid comparison between Unknown and I4
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Invalid comparison between Unknown and I4
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Invalid comparison between Unknown and I4
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Invalid comparison between Unknown and I4
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Invalid comparison between Unknown and I4
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Invalid comparison between Unknown and I4
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Invalid comparison between Unknown and I4
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Invalid comparison between Unknown and I4
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Invalid comparison between Unknown and I4
			if ((int)((KeyboardEventArgs)e).KeyboardDevice.Modifiers == 4)
			{
				((RoutedEventArgs)e).Handled = true;
			}
			else if ((int)e.Key == 2)
			{
				((RoutedEventArgs)e).Handled = false;
			}
			else if (((int)e.Key >= 34 && (int)e.Key <= 43) || ((int)e.Key >= 74 && (int)e.Key <= 83) || ((int)e.Key >= 44 && (int)e.Key <= 69) || (int)e.Key == 23 || (int)e.Key == 25 || ((int)((KeyboardEventArgs)e).KeyboardDevice.Modifiers == 2 && (int)e.Key == 65))
			{
				TextBox val = (TextBox)((sender is TextBox) ? sender : null);
				if (val.Text.Length >= 8 && val.SelectionLength == 0)
				{
					((RoutedEventArgs)e).Handled = true;
				}
				else
				{
					((RoutedEventArgs)e).Handled = false;
				}
			}
			else
			{
				((RoutedEventArgs)e).Handled = true;
			}
		}

		private void Txt_TextChanged(object sender, TextChangedEventArgs e)
		{
			if (_BtnDel != null)
			{
				TextBox val = (TextBox)((sender is TextBox) ? sender : null);
				val.Text = val.Text.Trim();
				((UIElement)_BtnDel).Visibility = (Visibility)(string.IsNullOrEmpty(val.Text) ? 2 : 0);
				if (string.IsNullOrEmpty(val.Text) || VM.ValidateSN(val.Text))
				{
					VM.SearchWarnText = string.Empty;
					VM.IsBtnEnable = !string.IsNullOrEmpty(val.Text);
					((Control)txtSearch).BorderBrush = (Brush)(object)_NormalBorderBrush;
				}
				else if (val.Text.Length < 8)
				{
					VM.SearchWarnText = "K1182";
					VM.IsBtnEnable = false;
					((Control)txtSearch).BorderBrush = (Brush)(object)_ErrorBorderBrush;
				}
				else
				{
					VM.SearchWarnText = "K1183";
					VM.IsBtnEnable = false;
					((Control)txtSearch).BorderBrush = (Brush)(object)_ErrorBorderBrush;
				}
			}
		}

		private void OnSelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			object originalSource = ((RoutedEventArgs)e).OriginalSource;
			if (((Selector)((originalSource is ListBox) ? originalSource : null)).SelectedIndex != -1)
			{
				PART_Popup.IsOpen = false;
			}
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Task.Run(delegate
			{
				if (MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)((DispatcherObject)Application.Current).Dispatcher.Invoke<FindTabletSNView>((Func<FindTabletSNView>)(() => new FindTabletSNView())), (bool?)true).Result == true)
				{
					MainFrameV6.Instance.ChangeView(PageIndex.TABLET_MANUAL);
				}
			});
		}

		private void OnBtnSearch(object sender, RoutedEventArgs e)
		{
			VM.TabletMatchBySN();
		}

		private void prevbtn_Click(object sender, RoutedEventArgs e)
		{
			CurrentIndex--;
			steptext.LangKey = ConnectTutorialsMap[CurrentIndex];
			((UIElement)nextbtn).IsEnabled = CurrentIndex < ConnectTutorialsMap.Count;
			((UIElement)prevbtn).IsEnabled = CurrentIndex > 1;
		}

		private void nextbtn_Click(object sender, RoutedEventArgs e)
		{
			CurrentIndex++;
			steptext.LangKey = ConnectTutorialsMap[CurrentIndex];
			((UIElement)nextbtn).IsEnabled = CurrentIndex < ConnectTutorialsMap.Count;
			((UIElement)prevbtn).IsEnabled = CurrentIndex > 1;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/tabletqmatchviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Expected O, but got Unknown
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Expected O, but got Unknown
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0087: Expected O, but got Unknown
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0094: Expected O, but got Unknown
			//IL_0096: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Expected O, but got Unknown
			//IL_00af: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Expected O, but got Unknown
			//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c6: Expected O, but got Unknown
			//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00dd: Expected O, but got Unknown
			//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ea: Expected O, but got Unknown
			//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f7: Expected O, but got Unknown
			//IL_0104: Unknown result type (might be due to invalid IL or missing references)
			//IL_010e: Expected O, but got Unknown
			//IL_0111: Unknown result type (might be due to invalid IL or missing references)
			//IL_011b: Expected O, but got Unknown
			//IL_011d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0129: Unknown result type (might be due to invalid IL or missing references)
			//IL_0133: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				txtSearch = (TextBox)target;
				((UIElement)txtSearch).PreviewKeyDown += new KeyEventHandler(OnPreviewKeyDown);
				((TextBoxBase)txtSearch).TextChanged += new TextChangedEventHandler(Txt_TextChanged);
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnSearch);
				break;
			case 3:
				icon = (Path)target;
				break;
			case 4:
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 5:
				textgrid = (Grid)target;
				break;
			case 6:
				prevbtn = (Button)target;
				((ButtonBase)prevbtn).Click += new RoutedEventHandler(prevbtn_Click);
				break;
			case 7:
				steptext = (LangTextBlock)target;
				break;
			case 8:
				nextbtn = (Button)target;
				((ButtonBase)nextbtn).Click += new RoutedEventHandler(nextbtn_Click);
				break;
			case 9:
				PART_Popup = (Popup)target;
				break;
			case 10:
				((Selector)(ListBox)target).SelectionChanged += new SelectionChangedEventHandler(OnSelectionChanged);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class TabletQMatchViewModelV6 : NotifyBase
	{
		private TabletQMatchViewV6 _View;

		private string _SearchKeyText;

		private string _SearchWarnText;

		private bool _IsBtnEnable;

		private Visibility _ToggleButtonVisibility;

		public string SearchKeyText
		{
			get
			{
				return _SearchKeyText;
			}
			set
			{
				_SearchKeyText = value;
				((NotifyBase)this).OnPropertyChanged("SearchKeyText");
			}
		}

		public string SearchWarnText
		{
			get
			{
				return _SearchWarnText;
			}
			set
			{
				_SearchWarnText = value;
				((NotifyBase)this).OnPropertyChanged("SearchWarnText");
			}
		}

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

		public Visibility ToggleButtonVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _ToggleButtonVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_ToggleButtonVisibility = value;
				((NotifyBase)this).OnPropertyChanged("ToggleButtonVisibility");
			}
		}

		public ObservableCollection<Tuple<string, string>> SnArr { get; set; }

		public TabletQMatchViewModelV6(TabletQMatchViewV6 ui)
		{
			_View = ui;
			SnArr = new ObservableCollection<Tuple<string, string>>();
			List<Tuple<string, string>> registerDevInfo = GetRegisterDevInfo();
			registerDevInfo?.ForEach(delegate(Tuple<string, string> p)
			{
				SnArr.Add(p);
			});
			ToggleButtonVisibility = (Visibility)((registerDevInfo == null || registerDevInfo.Count <= 0) ? 2 : 0);
		}

		public void TabletMatchBySN()
		{
			if (!ValidateSN(SearchKeyText))
			{
				SearchWarnText = "K1184";
				return;
			}
			object wModel = null;
			IsBtnEnable = false;
			SearchWarnText = string.Empty;
			Plugin.OperateTracker("SNSearchBtnClick", "User search tablet firmware by SN");
			Dictionary<string, object> aparams = new Dictionary<string, object>();
			aparams.Add("sn", SearchKeyText);
			LogHelper.LogInstance.Info("search tablet firmware by SN:[" + SearchKeyText + "].", false);
			Task<object> task = MessageWindowHelper.Instance.Loading("K1006", (Func<object>)delegate
			{
				//IL_0039: Unknown result type (might be due to invalid IL or missing references)
				//IL_004f: Unknown result type (might be due to invalid IL or missing references)
				//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
				Stopwatch stopwatch = new Stopwatch();
				stopwatch.Start();
				ResponseModel<List<ResourceResponseModel>> val = FlashContext.SingleInstance.service.Request<List<ResourceResponseModel>>(WebServicesContext.GET_RESOURCES_BY_SN, (object)aparams, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				stopwatch.Stop();
				BusinessStatus status = (BusinessStatus)20;
				List<ResourceResponseModel> content = val.content;
				if (content != null && content.Count > 0)
				{
					status = (BusinessStatus)10;
				}
				if (val.code == "0000" || val.code == "3010" || val.code == "3030" || val.code == "3040")
				{
					wModel = MainFrameV6.Instance.LoadWarranty(SearchKeyText);
				}
				return new
				{
					code = val.code,
					resp = content,
					time = stopwatch.ElapsedMilliseconds,
					status = status
				};
			}, false);
			Task.Run(delegate
			{
				//IL_0498: Unknown result type (might be due to invalid IL or missing references)
				//IL_0543: Expected O, but got Unknown
				//IL_0db1: Unknown result type (might be due to invalid IL or missing references)
				//IL_0ef9: Expected O, but got Unknown
				//IL_074d: Unknown result type (might be due to invalid IL or missing references)
				//IL_2551: Unknown result type (might be due to invalid IL or missing references)
				//IL_25ae: Expected O, but got Unknown
				//IL_08e3: Expected O, but got Unknown
				//IL_1a14: Unknown result type (might be due to invalid IL or missing references)
				//IL_1b5c: Expected O, but got Unknown
				//IL_1ebf: Unknown result type (might be due to invalid IL or missing references)
				//IL_1f1c: Expected O, but got Unknown
				//IL_2229: Unknown result type (might be due to invalid IL or missing references)
				//IL_22d2: Expected O, but got Unknown
				dynamic result = task.Result;
				((DispatcherObject)Application.Current).Dispatcher.Invoke<bool>((Func<bool>)(() => IsBtnEnable = true));
				Dictionary<string, object> dictionary = new Dictionary<string, object>(aparams);
				if (result.code == "3010")
				{
					if (result.resp == null || result.resp.Count == 0)
					{
						HostProxy.BehaviorService.Collect((BusinessType)3020, new BusinessData((BusinessType)3020, (DeviceEx)null, (BusinessStatus)0).Update(result.time, result.status, dictionary));
						MessageWindowHelper.Instance.Show("K0711", "K0113", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Wait();
					}
					else
					{
						dictionary["romMatchId"] = (object)result.resp[0].romMatchId;
						HostProxy.BehaviorService.Collect((BusinessType)3020, new BusinessData((BusinessType)3020, (DeviceEx)null, (BusinessStatus)0).Update(result.time, result.status, result.resp[0].ModelName, dictionary));
						DevCategory realCategory = ((!((result.resp[0].Category?.ToLower() == "smart") ? true : false)) ? DevCategory.Tablet : DevCategory.Smart);
						((DispatcherObject)Application.Current).Dispatcher.Invoke<Task<bool?>>((Func<Task<bool?>>)(() => MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)new Match3010View(realCategory, result.resp[0].ModelName, SearchKeyText, wModel), (bool?)true)));
					}
				}
				else if (result.code == "3030")
				{
					dictionary["romMatchId"] = (object)result.resp[0].romMatchId;
					HostProxy.BehaviorService.Collect((BusinessType)3020, new BusinessData((BusinessType)3020, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, result.resp[0].ModelName, dictionary));
					DevCategory devCategory = ((!((result.resp[0].Category?.ToLower() == "smart") ? true : false)) ? DevCategory.Tablet : DevCategory.Smart);
					Match3030View.ProcMatch3030(null, null, _View, result.resp[0], SearchKeyText, devCategory, null, wModel);
				}
				else if (result.code == "3040" || result.code == "0000")
				{
					dynamic val = result.resp[0];
					DevCategory devCategory2 = ((!((result.resp[0].Category?.ToLower() == "smart") ? true : false)) ? DevCategory.Tablet : DevCategory.Smart);
					if (true != Match3040View.ProcMatch3040(val, SearchKeyText, devCategory2, wModel))
					{
						dictionary["romMatchId"] = (object)result.resp[0].romMatchId;
						HostProxy.BehaviorService.Collect((BusinessType)3020, new BusinessData((BusinessType)3020, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, result.resp[0].ModelName, dictionary));
					}
					else
					{
						if (result.resp.Count != 1)
						{
							val = MultiRomsSelView.SelectOneFormRomArr(result.resp);
							if (val == null)
							{
								HostProxy.BehaviorService.Collect((BusinessType)3020, new BusinessData((BusinessType)3020, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, dictionary));
								return;
							}
						}
						RescueDeviceInfoModel rescueDeviceInfoModel = new RescueDeviceInfoModel
						{
							modelName = val.ModelName,
							sn = SearchKeyText,
							marketName = val.marketName,
							romMatchId = val.romMatchId
						};
						dictionary["romMatchId"] = (object)val.romMatchId;
						HostProxy.BehaviorService.Collect((BusinessType)3020, new BusinessData((BusinessType)3020, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, val.ModelName, dictionary));
						AutoMatchResource data = new AutoMatchResource(null, rescueDeviceInfoModel, val, new MatchInfo(lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.SN, aparams, rescueDeviceInfoModel));
						MainFrameV6.Instance.JumptoRescueView(devCategory2, data, wModel, (FrameworkElement)(object)_View);
					}
				}
				else if (result.code == "1000")
				{
					HostProxy.BehaviorService.Collect((BusinessType)3020, new BusinessData((BusinessType)3020, (DeviceEx)null, (BusinessStatus)0).Update(result.time, (BusinessStatus)10, dictionary));
					InvalidView win = null;
					((DispatcherObject)Application.Current).Dispatcher.Invoke<InvalidView>((Func<InvalidView>)(() => win = new InvalidView(DevCategory.Tablet, 1)));
					if (MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)win, (bool?)true).Result == true)
					{
						if (win.IsManualModel)
						{
							MainFrameV6.Instance.ChangeView(PageIndex.TABLET_MANUAL);
						}
						else
						{
							((DispatcherObject)Application.Current).Dispatcher.Invoke<Task<bool?>>((Func<Task<bool?>>)(() => MessageWindowHelper.Instance.Show((IMessageWindowV6)new DeviceTutorialsDialogViewV6(true), (bool?)true)));
						}
					}
				}
			});
		}

		public bool ValidateSN(string sn)
		{
			return Regex.IsMatch(sn, "^([a-zA-Z]{1}[a-hj-np-zA-HJ-NP-Z0-9]{7})$");
		}

		private List<Tuple<string, string>> GetRegisterDevInfo()
		{
			if (HostProxy.User.user != null)
			{
				JArray val = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.DefaultOptionsFileName, "$.devices[?(@.userId =='" + HostProxy.User.user.UserId + "')].registeredModels", false);
				if (val != null && ((JToken)val).HasValues)
				{
					string empty = string.Empty;
					List<Tuple<string, string>> list = new List<Tuple<string, string>>();
					List<JToken> list2 = ((IEnumerable<JToken>)val).OrderBy((JToken n) => n.Value<string>((object)"modelName")).ToList();
					if (list2 == null)
					{
						return null;
					}
					{
						foreach (JToken item2 in list2)
						{
							string item = item2.Value<string>((object)"modelName");
							string text = item2.Value<string>((object)"category");
							if (!string.IsNullOrEmpty(text) && text.Equals("tablet", StringComparison.CurrentCultureIgnoreCase))
							{
								empty = item2.Value<string>((object)"sn");
								if (!string.IsNullOrEmpty(empty))
								{
									list.Add(new Tuple<string, string>(item, empty));
								}
							}
						}
						return list;
					}
				}
			}
			return null;
		}
	}
}
namespace lenovo.mbg.service.lmsa.flash.ViewV6.Dialog
{
	public class BackupConfirmView : UserControl, IMessageViewV6, IComponentConnector
	{
		internal Image img;

		internal Button btnCancel;

		internal Button btnOk;

		internal Button btnClose;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public BackupConfirmView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			FireClose(null);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			FireClose(true);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/backupconfirmview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Expected O, but got Unknown
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007b: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				img = (Image)target;
				break;
			case 2:
				btnCancel = (Button)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 3:
				btnOk = (Button)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 4:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class DataCollectionAndBackConfirm : UserControl, IMessageViewV6, IComponentConnector
	{
		internal Image img;

		internal Button btnCancel;

		internal Button btnOk;

		internal Button btnClose;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public DataCollectionAndBackConfirm()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			FireClose(null);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			FireClose(true);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/datacollectionandbackconfirm.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Expected O, but got Unknown
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007b: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				img = (Image)target;
				break;
			case 2:
				btnCancel = (Button)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 3:
				btnOk = (Button)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 4:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class DelRomView : UserControl, IMessageViewV6, IComponentConnector
	{
		protected string Rom;

		internal LangTextBlock tbkTitle;

		internal CheckBox cbx;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public DelRomView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		public void Init(string rom)
		{
			Rom = rom;
		}

		public bool IsNotNotShowDeleteRomMore()
		{
			return ((ToggleButton)cbx).IsChecked == true;
		}

		public void DeleteRomFile(string fileName)
		{
			GlobalCmdHelper.Instance.Execute((object)new
			{
				type = (GlobalCmdType)3,
				data = fileName
			});
		}

		public void SetNotShowDeleteRom()
		{
			Configuration val = ConfigurationManager.OpenExeConfiguration((ConfigurationUserLevel)0);
			if (Enumerable.Contains(val.AppSettings.Settings.AllKeys, "NotShowDeleteRom"))
			{
				val.AppSettings.Settings.Remove("NotShowDeleteRom");
			}
			val.AppSettings.Settings.Add("NotShowDeleteRom", "true");
			val.Save((ConfigurationSaveMode)0);
			ConfigurationManager.RefreshSection("appSettings");
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			FireClose(true);
			DeleteRomFile(Rom);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
			if (IsNotNotShowDeleteRomMore())
			{
				SetNotShowDeleteRom();
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/delromview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Expected O, but got Unknown
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Expected O, but got Unknown
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007b: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				tbkTitle = (LangTextBlock)target;
				break;
			case 2:
				cbx = (CheckBox)target;
				break;
			case 3:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 4:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class EraseDataView : UserControl, IMessageViewV6, IComponentConnector
	{
		internal Image img;

		internal Path IconPath;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public EraseDataView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			FireClose(true);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/erasedataview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Expected O, but got Unknown
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Expected O, but got Unknown
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007b: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				img = (Image)target;
				break;
			case 2:
				IconPath = (Path)target;
				break;
			case 3:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 4:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class GoogleAccountPromptView : UserControl, IMessageViewV6, IComponentConnector
	{
		internal Button BtnClose;

		internal LangTextBlock txtDevice;

		internal CheckBox CbUnderstand;

		internal LangButton BtnCancel;

		internal LangButton BtnContinue;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; } = new AutoResetEvent(initialState: false);

		public bool? Result { get; set; }

		public GoogleAccountPromptView()
		{
			InitializeComponent();
		}

		private void BtnClose_Click(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void CbUnderstand_Checked(object sender, RoutedEventArgs e)
		{
			((UIElement)BtnContinue).IsEnabled = true;
		}

		private void CbUnderstand_Unchecked(object sender, RoutedEventArgs e)
		{
			((UIElement)BtnContinue).IsEnabled = false;
		}

		private void BtnCancel_Click(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void BtnContinue_Click(object sender, RoutedEventArgs e)
		{
			FireClose(true);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/googleaccountpromptview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Expected O, but got Unknown
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Expected O, but got Unknown
			//IL_0082: Unknown result type (might be due to invalid IL or missing references)
			//IL_008c: Expected O, but got Unknown
			//IL_008f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0099: Expected O, but got Unknown
			//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b0: Expected O, but got Unknown
			//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bd: Expected O, but got Unknown
			//IL_00ca: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d4: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				BtnClose = (Button)target;
				((ButtonBase)BtnClose).Click += new RoutedEventHandler(BtnClose_Click);
				break;
			case 2:
				txtDevice = (LangTextBlock)target;
				break;
			case 3:
				CbUnderstand = (CheckBox)target;
				((ToggleButton)CbUnderstand).Checked += new RoutedEventHandler(CbUnderstand_Checked);
				((ToggleButton)CbUnderstand).Unchecked += new RoutedEventHandler(CbUnderstand_Unchecked);
				break;
			case 4:
				BtnCancel = (LangButton)target;
				((ButtonBase)BtnCancel).Click += new RoutedEventHandler(BtnCancel_Click);
				break;
			case 5:
				BtnContinue = (LangButton)target;
				((ButtonBase)BtnContinue).Click += new RoutedEventHandler(BtnContinue_Click);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class TroubleshootingStepsView : Window, IMessageWindowV6, IComponentConnector
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

		public TroubleshootingStepsView()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnBack(object sender, RoutedEventArgs e)
		{
		}

		private void OnBtnNext(object sender, RoutedEventArgs e)
		{
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Result = true;
			((Window)this).Close();
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/troubleshootingstepsview.xaml", UriKind.Relative);
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
	public class FindIMEIView : Window, IMessageWindowV6, IComponentConnector
	{
		internal Grid moreImg;

		internal StackPanel morePanel;

		internal StackPanel backPanel;

		internal Grid backImg;

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

		public FindIMEIView()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnBack(object sender, RoutedEventArgs e)
		{
			((UIElement)moreImg).Visibility = (Visibility)0;
			((UIElement)morePanel).Visibility = (Visibility)0;
			((UIElement)backImg).Visibility = (Visibility)2;
			((UIElement)backPanel).Visibility = (Visibility)2;
		}

		private void OnBtnNext(object sender, RoutedEventArgs e)
		{
			((UIElement)moreImg).Visibility = (Visibility)2;
			((UIElement)morePanel).Visibility = (Visibility)2;
			((UIElement)backImg).Visibility = (Visibility)0;
			((UIElement)backPanel).Visibility = (Visibility)0;
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Result = true;
			((Window)this).Close();
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/findimeiview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Expected O, but got Unknown
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Expected O, but got Unknown
			//IL_007e: Unknown result type (might be due to invalid IL or missing references)
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0094: Expected O, but got Unknown
			//IL_0097: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a1: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				moreImg = (Grid)target;
				break;
			case 3:
				morePanel = (StackPanel)target;
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnNext);
				break;
			case 5:
				backPanel = (StackPanel)target;
				break;
			case 6:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnBack);
				break;
			case 7:
				backImg = (Grid)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class FindSmartSNView : Window, IMessageWindowV6, IComponentConnector
	{
		internal Button btnPrev;

		internal Grid PanelPrev;

		internal Grid PanelNext;

		internal Button btnNext;

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

		public FindSmartSNView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnBack(object sender, RoutedEventArgs e)
		{
			((UIElement)PanelPrev).Visibility = (Visibility)0;
			((UIElement)btnNext).Visibility = (Visibility)0;
			((UIElement)btnPrev).Visibility = (Visibility)2;
			((UIElement)PanelNext).Visibility = (Visibility)2;
		}

		private void OnBtnNext(object sender, RoutedEventArgs e)
		{
			((UIElement)PanelPrev).Visibility = (Visibility)2;
			((UIElement)btnNext).Visibility = (Visibility)2;
			((UIElement)btnPrev).Visibility = (Visibility)0;
			((UIElement)PanelNext).Visibility = (Visibility)0;
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Result = true;
			((Window)this).Close();
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/findsmartsnview.xaml", UriKind.Relative);
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
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Expected O, but got Unknown
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0087: Expected O, but got Unknown
			//IL_0094: Unknown result type (might be due to invalid IL or missing references)
			//IL_009e: Expected O, but got Unknown
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b6: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				btnPrev = (Button)target;
				((ButtonBase)btnPrev).Click += new RoutedEventHandler(OnBtnBack);
				break;
			case 3:
				PanelPrev = (Grid)target;
				break;
			case 4:
				PanelNext = (Grid)target;
				break;
			case 5:
				btnNext = (Button)target;
				((ButtonBase)btnNext).Click += new RoutedEventHandler(OnBtnNext);
				break;
			case 6:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class FindTabletSNView : Window, IMessageWindowV6, IComponentConnector
	{
		internal Grid moreImg;

		internal StackPanel morePanel;

		internal StackPanel backPanel;

		internal Grid backImg;

		internal TextBlock goManual;

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

		public FindTabletSNView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Owner = Application.Current.MainWindow;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			Result = false;
			((Window)this).Close();
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Result = true;
			Plugin.OperateTracker("TabletManualSelectLinkClick", "User clicked tablet manual select link!");
			((Window)this).Close();
		}

		private void OnBtnBack(object sender, RoutedEventArgs e)
		{
			((UIElement)moreImg).Visibility = (Visibility)0;
			((UIElement)morePanel).Visibility = (Visibility)0;
			((UIElement)backImg).Visibility = (Visibility)2;
			((UIElement)backPanel).Visibility = (Visibility)2;
		}

		private void OnBtnNext(object sender, RoutedEventArgs e)
		{
			((UIElement)moreImg).Visibility = (Visibility)2;
			((UIElement)morePanel).Visibility = (Visibility)2;
			((UIElement)backImg).Visibility = (Visibility)0;
			((UIElement)backPanel).Visibility = (Visibility)0;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/findtabletsnview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Expected O, but got Unknown
			//IL_004b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Expected O, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Expected O, but got Unknown
			//IL_007d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0087: Expected O, but got Unknown
			//IL_0089: Unknown result type (might be due to invalid IL or missing references)
			//IL_0095: Unknown result type (might be due to invalid IL or missing references)
			//IL_009f: Expected O, but got Unknown
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Expected O, but got Unknown
			//IL_00af: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Expected O, but got Unknown
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d1: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				moreImg = (Grid)target;
				break;
			case 3:
				morePanel = (StackPanel)target;
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnNext);
				break;
			case 5:
				backPanel = (StackPanel)target;
				break;
			case 6:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnBack);
				break;
			case 7:
				backImg = (Grid)target;
				break;
			case 8:
				goManual = (TextBlock)target;
				break;
			case 9:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class GuidStepsView : Window, IMessageWindowV6, IComponentConnector
	{
		internal ContentControl content;

		private bool _contentLoaded;

		public BaseGuidStepsViewModelV6 VM { get; private set; }

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

		public GuidStepsView(string modelName, UseCase useCase = (UseCase)2, bool autoPlay = false)
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Expected O, but got Unknown
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_004b: Invalid comparison between Unknown and I4
			InitializeComponent();
			((FrameworkElement)this).SizeChanged += new SizeChangedEventHandler(GuidStepsView_SizeChanged);
			((Window)this).Owner = Application.Current.MainWindow;
			WaitHandler = new AutoResetEvent(initialState: false);
			GuidStepsViewV6 guidStepsViewV = new GuidStepsViewV6();
			BaseGuidStepsViewModelV6 viewModel = new GuidStepsViewModelV6(guidStepsViewV, autoPlay).Init(modelName, (int)useCase != 1);
			guidStepsViewV.Init(viewModel);
			guidStepsViewV.CloseAction = delegate
			{
				((Window)this).Close();
			};
			content.Content = guidStepsViewV;
			VM = guidStepsViewV.VM;
			GlobalCmdHelper.Instance.CloseGuidStepDlgEvent = delegate
			{
				((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
				{
					((Window)this).Close();
				});
				GlobalCmdHelper.Instance.CloseGuidStepDlgEvent = null;
			};
		}

		protected override void OnClosed(EventArgs e)
		{
			Result = true;
			((ViewModelBase)VM).Dispose();
			((Window)this).OnClosed(e);
		}

		private void GuidStepsView_SizeChanged(object sender, SizeChangedEventArgs e)
		{
			Rectangle windowRectangle = GetWindowRectangle();
			double left = ((double)windowRectangle.Width - ((FrameworkElement)this).ActualWidth) / 2.0 + (double)windowRectangle.Left;
			double top = ((double)windowRectangle.Height - ((FrameworkElement)this).ActualHeight) / 2.0 + (double)windowRectangle.Top;
			((Window)this).Left = left;
			((Window)this).Top = top;
		}

		private Rectangle GetWindowRectangle()
		{
			Window mainWindow = Application.Current.MainWindow;
			return new Rectangle((int)mainWindow.Left, (int)mainWindow.Top, (int)((FrameworkElement)mainWindow).ActualWidth, (int)((FrameworkElement)mainWindow).ActualHeight);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/guidstepsview.xaml", UriKind.Relative);
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
				content = (ContentControl)target;
			}
			else
			{
				_contentLoaded = true;
			}
		}
	}
	public class GuidStepsViewV6 : UserControl, IMessageViewV6, IComponentConnector, IStyleConnector
	{
		internal GuidStepsViewV6 guidstepviewv6;

		internal ContentControl contentControl;

		internal Button closeButton;

		internal PopupEx pop;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public BaseGuidStepsViewModelV6 VM { get; private set; }

		protected List<string> ModelNames { get; set; }

		public GuidStepsViewV6()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		public void Init(BaseGuidStepsViewModelV6 viewModel)
		{
			VM = viewModel;
			ModelNames = new List<string>();
			string text = HostProxy.LanguageService.Translate("K1453");
			if (!string.IsNullOrEmpty(text))
			{
				IEnumerator<string> enumerator = (from n in text.Split(new char[2] { ',', '，' }, StringSplitOptions.RemoveEmptyEntries)
					where !string.IsNullOrWhiteSpace(n)
					select n).GetEnumerator();
				while (enumerator.MoveNext())
				{
					ModelNames.Add(enumerator.Current.Trim());
				}
			}
			((FrameworkElement)this).DataContext = VM;
		}

		public void Close()
		{
			Result = null;
			WaitHandler.Set();
			CloseAction?.Invoke(null);
		}

		private void Option2ClickHere(object sender, RoutedEventArgs e)
		{
			((ItemsControl)ConnectStepsDataTemplateSelector.FindControl<ListView>((DependencyObject)(object)contentControl, "listview")).ItemsSource = ModelNames;
			((UIElement)ConnectStepsDataTemplateSelector.FindControl<Grid>((DependencyObject)(object)contentControl, "pop1")).Visibility = (Visibility)0;
		}

		private void CloseOption2ClickHere(object sender, RoutedEventArgs e)
		{
			((UIElement)ConnectStepsDataTemplateSelector.FindControl<Grid>((DependencyObject)(object)contentControl, "pop1")).Visibility = (Visibility)2;
		}

		private void CloseClick(object sender, RoutedEventArgs e)
		{
			Close();
			MainFrameV6.Instance.ChangeView(PageIndex.PHONE_SEARCH);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/guidstepsviewv6.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			//IL_003f: Expected O, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_005a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Expected O, but got Unknown
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				guidstepviewv6 = (GuidStepsViewV6)target;
				break;
			case 4:
				contentControl = (ContentControl)target;
				break;
			case 5:
				((Hyperlink)target).Click += new RoutedEventHandler(CloseClick);
				break;
			case 6:
				closeButton = (Button)target;
				break;
			case 7:
				pop = (PopupEx)target;
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
			//IL_000a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Expected O, but got Unknown
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Expected O, but got Unknown
			switch (connectionId)
			{
			case 2:
				((Hyperlink)target).Click += new RoutedEventHandler(Option2ClickHere);
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(CloseOption2ClickHere);
				break;
			}
		}
	}
	public class BaseGuidStepsViewModelV6 : ViewModelBase
	{
		private readonly GuidStepsViewV6 _View;

		private static readonly string GifBasePath = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/Conn/{0}";

		protected System.Timers.Timer AutoPlayTimer;

		private ConnectStepsModel currentStep;

		private bool isAutoPlay;

		private bool showPlayControl;

		private string guideTitle;

		private Visibility checkingTxtVisibility = (Visibility)2;

		private Visibility replayBtnVisibility = (Visibility)1;

		private Visibility xt2Visibility = (Visibility)2;

		private bool preBtnEnabled;

		private bool nextBtnEnabled = true;

		private string noteText;

		public ReplayCommand CloseWinCommand { get; }

		public ReplayCommand PreviousCommand { get; }

		public ReplayCommand NextCommand { get; }

		public ReplayCommand PlayAgainCommand { get; }

		public ReplayCommand PopCancelClick { get; }

		public ReplayCommand PopOkClick { get; }

		public ReplayCommand OkCommand { get; }

		public bool ClosePopup { get; set; }

		public ConnectStepsModel Steps { get; set; }

		private static IGoogleAnalyticsTracker GoogleAnalytics => HostProxy.GoogleAnalyticsTracker;

		private double TimerInterval { get; }

		protected List<ConnectStepsModel> StepModelList { get; set; }

		protected int MinIndex => StepModelList.Min((ConnectStepsModel n) => n.Index);

		protected int MaxIndex => StepModelList.Max((ConnectStepsModel n) => n.Index);

		public ConnectStepsModel CurrentStep
		{
			get
			{
				return currentStep;
			}
			set
			{
				currentStep = value;
				((NotifyBase)this).OnPropertyChanged("CurrentStep");
			}
		}

		public bool IsAutoPlay
		{
			get
			{
				return isAutoPlay;
			}
			set
			{
				isAutoPlay = value;
				((NotifyBase)this).OnPropertyChanged("IsAutoPlay");
			}
		}

		public bool ShowPlayControl
		{
			get
			{
				return showPlayControl;
			}
			set
			{
				showPlayControl = value;
				((NotifyBase)this).OnPropertyChanged("ShowPlayControl");
			}
		}

		public bool ShowCloseBtn { get; set; }

		public string GuideTitle
		{
			get
			{
				return guideTitle;
			}
			set
			{
				guideTitle = value;
				((NotifyBase)this).OnPropertyChanged("GuideTitle");
			}
		}

		public Visibility CheckingTxtVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return checkingTxtVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				checkingTxtVisibility = value;
				((NotifyBase)this).OnPropertyChanged("CheckingTxtVisibility");
			}
		}

		public Visibility ReplayBtnVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return replayBtnVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				replayBtnVisibility = value;
				((NotifyBase)this).OnPropertyChanged("ReplayBtnVisibility");
			}
		}

		public Visibility XT2Visibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return xt2Visibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				xt2Visibility = value;
				((NotifyBase)this).OnPropertyChanged("XT2Visibility");
			}
		}

		public bool PreBtnEnabled
		{
			get
			{
				return preBtnEnabled;
			}
			set
			{
				preBtnEnabled = value;
				((NotifyBase)this).OnPropertyChanged("PreBtnEnabled");
			}
		}

		public bool NextBtnEnabled
		{
			get
			{
				return nextBtnEnabled;
			}
			set
			{
				nextBtnEnabled = value;
				((NotifyBase)this).OnPropertyChanged("NextBtnEnabled");
			}
		}

		public string NoteText
		{
			get
			{
				return noteText;
			}
			set
			{
				noteText = value;
				((NotifyBase)this).OnPropertyChanged("NoteText");
			}
		}

		protected static string ConvertImageUrl(string image)
		{
			return string.Format(GifBasePath, image, UriKind.Absolute);
		}

		public BaseGuidStepsViewModelV6(GuidStepsViewV6 ui, bool autoPlay = false, double interval = 5000.0, bool showPlayControl = true, bool showClose = true, bool popupWhenClose = false, string noteText = null)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Expected O, but got Unknown
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a7: Expected O, but got Unknown
			//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00be: Expected O, but got Unknown
			//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d5: Expected O, but got Unknown
			//IL_00e2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ec: Expected O, but got Unknown
			//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
			//IL_0103: Expected O, but got Unknown
			//IL_0110: Unknown result type (might be due to invalid IL or missing references)
			//IL_011a: Expected O, but got Unknown
			_View = ui;
			IsAutoPlay = autoPlay;
			if (interval == 0.0)
			{
				interval = 5000.0;
			}
			NoteText = noteText;
			TimerInterval = interval;
			ShowPlayControl = showPlayControl;
			ShowCloseBtn = showClose;
			ClosePopup = popupWhenClose;
			StepModelList = new List<ConnectStepsModel>();
			CloseWinCommand = new ReplayCommand((Action<object>)CloseWinCommandHandler);
			PreviousCommand = new ReplayCommand((Action<object>)delegate
			{
				FirePrevCommand();
			});
			NextCommand = new ReplayCommand((Action<object>)delegate
			{
				FireNextCommand();
			});
			PlayAgainCommand = new ReplayCommand((Action<object>)delegate
			{
				FirePlayAgainCommand();
			});
			PopCancelClick = new ReplayCommand((Action<object>)PopCancelClickHandler);
			PopOkClick = new ReplayCommand((Action<object>)PopOkClickHandler);
			OkCommand = new ReplayCommand((Action<object>)OkCommandHandler);
		}

		public virtual BaseGuidStepsViewModelV6 InitSteps(string title, JArray steps)
		{
			List<ConnectStepsModel> list = new List<ConnectStepsModel>();
			for (int i = 0; i < ((JContainer)steps).Count; i++)
			{
				list.Add(new ConnectStepsModel
				{
					Index = i,
					Layout = "V",
					Title = (title ?? steps[i].Value<string>((object)"Title")),
					Image = ConvertImageUrl(steps[i].Value<string>((object)"Image")),
					Content = steps[i].Value<string>((object)"Content")
				});
			}
			StepModelList = list;
			return this;
		}

		public BaseGuidStepsViewModelV6 Ready()
		{
			CurrentStep = StepModelList.First();
			ChangeTitle();
			InitAutoPlay();
			return this;
		}

		protected virtual void FirePrevCommand()
		{
			int idx = CurrentStep.Index;
			CurrentStep = StepModelList.First((ConnectStepsModel n) => n.Index == idx - 1);
			ChangeWindowSize();
			ChangeTitle();
			PreBtnEnabled = CurrentStep.Index > MinIndex;
			NextBtnEnabled = CurrentStep.Index < MaxIndex;
			GoogleAnalytics.Send(HitBuilder.CreateCustomEvent("lmsa-plugin-flash", "ConnectDevGifPrev", "Connect device tutorial gif previous button clicked!", 0L).Build());
		}

		protected virtual void FireNextCommand()
		{
			int idx = CurrentStep.Index;
			CurrentStep = StepModelList.First((ConnectStepsModel n) => n.Index == idx + 1);
			ChangeWindowSize();
			ChangeTitle();
			PreBtnEnabled = CurrentStep.Index > MinIndex;
			NextBtnEnabled = CurrentStep.Index < MaxIndex;
			if (IsAutoPlay && !NextBtnEnabled)
			{
				AutoPlayStop();
			}
			GoogleAnalytics.Send(HitBuilder.CreateCustomEvent("lmsa-plugin-flash", "ConnectDevGifNext", "Connect device tutorial gif next button clicked!", 0L).Build());
		}

		protected virtual void FirePlayAgainCommand()
		{
			CurrentStep = StepModelList.First();
			ChangeTitle();
			AutoPlayStart();
		}

		protected virtual void ChangeTitle()
		{
			GuideTitle = CurrentStep.Title;
		}

		protected virtual void InitAutoPlay()
		{
			if (IsAutoPlay)
			{
				AutoPlayTimer = new System.Timers.Timer
				{
					Interval = TimerInterval
				};
				AutoPlayTimer.Elapsed += delegate
				{
					FireNextCommand();
				};
				AutoPlayStart();
			}
		}

		protected virtual void AutoPlayStart()
		{
			AutoPlayTimer.Start();
			ReplayBtnVisibility = (Visibility)1;
		}

		private void AutoPlayStop()
		{
			AutoPlayTimer.Stop();
			ReplayBtnVisibility = (Visibility)0;
		}

		private void PopCancelClickHandler(object args)
		{
			((Popup)_View.pop).IsOpen = false;
			_View.Close();
		}

		private void PopOkClickHandler(object args)
		{
			((Popup)_View.pop).IsOpen = false;
		}

		private void CloseWinCommandHandler(object args)
		{
			if (ClosePopup)
			{
				((Popup)_View.pop).IsOpen = true;
			}
			else
			{
				_View.Close();
			}
		}

		private void OkCommandHandler(object args)
		{
			if (CurrentStep.Index == MaxIndex)
			{
				_View.Close();
				return;
			}
			int idx = CurrentStep.Index;
			CurrentStep = StepModelList.First((ConnectStepsModel n) => n.Index == idx + 1);
			ChangeTitle();
		}

		protected void ChangeWindowSize()
		{
			if (CurrentStep.Layout == "E")
			{
				((FrameworkElement)_View).Width = 961.0;
				((FrameworkElement)_View).Height = 596.0;
				ShowXt2Link(show: true);
			}
			else
			{
				((FrameworkElement)_View).Width = 800.0;
				((FrameworkElement)_View).Height = 500.0;
				ShowXt2Link(show: false);
			}
		}

		public override void Dispose()
		{
			if (AutoPlayTimer != null)
			{
				AutoPlayTimer.Stop();
				AutoPlayTimer.Dispose();
				AutoPlayTimer = null;
			}
		}

		protected void ShowXt2Link(bool show)
		{
			XT2Visibility = (Visibility)((!show || MainFrameV6.Instance.IsChinaUs(isOnlyChina: true)) ? 2 : 0);
		}
	}
	public class GuidStepsViewModelV6 : BaseGuidStepsViewModelV6
	{
		private bool ExistsStartPage;

		private bool LinkClick;

		private string Title;

		private List<ConnectStepsModel> CacheList;

		private Visibility notifyTextVisible = (Visibility)2;

		public static Dictionary<string, List<ConnectStepsModel>> DefalutStepMapp = new Dictionary<string, List<ConnectStepsModel>>
		{
			{
				"FASTBOOT_DEFALUT",
				new List<ConnectStepsModel>
				{
					new ConnectStepsModel
					{
						Index = 1,
						Layout = "V",
						Image = BaseGuidStepsViewModelV6.ConvertImageUrl("fastboot-guide-01.gif"),
						Content = "K0913"
					},
					new ConnectStepsModel
					{
						Index = 2,
						Layout = "V",
						Image = BaseGuidStepsViewModelV6.ConvertImageUrl("fastboot-guide-02.gif"),
						Content = "K0914"
					}
				}
			},
			{
				"XT2",
				new List<ConnectStepsModel>
				{
					new ConnectStepsModel
					{
						Index = 1,
						Layout = "V",
						Image = BaseGuidStepsViewModelV6.ConvertImageUrl("fastboot-guide-01.gif"),
						Content = "K0913"
					},
					new ConnectStepsModel
					{
						Index = 2,
						Layout = "V",
						Image = BaseGuidStepsViewModelV6.ConvertImageUrl("fastboot-guide-05.gif"),
						Content = "K1764"
					}
				}
			}
		};

		public static ConnectStepsModel DefaultStartPage = new ConnectStepsModel
		{
			Index = 0,
			Layout = "S",
			Image = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/ConnFastboot.png",
			Content = "K1585"
		};

		public static ConnectStepsModel DefaultEndPage = new ConnectStepsModel
		{
			Index = 3,
			Layout = "V",
			Image = BaseGuidStepsViewModelV6.ConvertImageUrl("fastboot-guide-0304.gif"),
			Content = "K2120"
		};

		public static ConnectStepsModel DefaultEndChoosePage = new ConnectStepsModel
		{
			Index = 3,
			Layout = "E",
			Image = null,
			Title = "K2037",
			Content = null
		};

		public string LinkeModelName { get; set; }

		public ReplayCommand LinkCommand { get; }

		public Visibility NotifyTextVisible
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return notifyTextVisible;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				notifyTextVisible = value;
				((NotifyBase)this).OnPropertyChanged("NotifyTextVisible");
			}
		}

		public GuidStepsViewModelV6(GuidStepsViewV6 ui, bool autoPlay = false, bool popupWhenClose = false)
			: base(ui, autoPlay, 5000.0, showPlayControl: true, showClose: true, popupWhenClose)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0048: Expected O, but got Unknown
			LinkeModelName = HostProxy.LanguageService.Translate("K1453");
			LinkCommand = new ReplayCommand((Action<object>)delegate
			{
				FireLinkCommand();
			});
		}

		public BaseGuidStepsViewModelV6 Init(string modelname, bool showStartPage)
		{
			NotifyTextVisible = (Visibility)(MainFrameV6.Instance.IsChinaUs() ? 2 : 0);
			if (showStartPage)
			{
				ExistsStartPage = true;
				base.StepModelList.Add(DefaultStartPage);
			}
			bool flag = false;
			bool flag2 = false;
			if (!string.IsNullOrEmpty(modelname) && !modelname.Equals("UnKnown", StringComparison.CurrentCultureIgnoreCase))
			{
				flag2 = true;
				string[] array = modelname.Split(new char[1] { '#' }, StringSplitOptions.RemoveEmptyEntries);
				foreach (string item in array)
				{
					if (Regex.Matches(LinkeModelName, "(?is)(?<=\\()[^\\)]+(?=\\))").Cast<Match>().Count((Match n) => item.Contains(n.Value)) > 0)
					{
						flag = true;
						break;
					}
				}
			}
			if (flag)
			{
				base.StepModelList.AddRange(DefalutStepMapp["XT2"]);
			}
			else
			{
				base.StepModelList.AddRange(DefalutStepMapp["FASTBOOT_DEFALUT"]);
				base.StepModelList.Add(flag2 ? DefaultEndPage : DefaultEndChoosePage);
			}
			Title = (ExistsStartPage ? "K1584" : "K1013");
			return Ready();
		}

		protected override void FirePrevCommand()
		{
			if (ExistsStartPage && base.CurrentStep.Index - 1 == base.MinIndex)
			{
				Title = "K1584";
			}
			base.FirePrevCommand();
			if (LinkClick && base.CurrentStep.Index == base.MinIndex)
			{
				base.StepModelList.Clear();
				base.StepModelList = CacheList;
				LinkClick = false;
			}
		}

		protected override void FireNextCommand()
		{
			if (ExistsStartPage && base.CurrentStep.Index + 1 > base.MinIndex)
			{
				Title = "K1014";
			}
			base.FireNextCommand();
		}

		protected virtual void FireLinkCommand()
		{
			LinkClick = true;
			CacheList = new List<ConnectStepsModel>(base.StepModelList);
			base.StepModelList.Clear();
			base.StepModelList.Add(base.CurrentStep);
			base.StepModelList.AddRange(DefalutStepMapp["XT2"]);
			FireNextCommand();
		}

		protected override void FirePlayAgainCommand()
		{
			if (LinkClick)
			{
				base.StepModelList.Clear();
				base.StepModelList = CacheList;
				LinkClick = false;
			}
			Title = (ExistsStartPage ? "K1584" : "K1013");
			base.FirePlayAgainCommand();
		}

		protected override void ChangeTitle()
		{
			base.GuideTitle = base.CurrentStep.Title ?? Title;
		}
	}
	public class ConnectStepsDataTemplateSelector : DataTemplateSelector
	{
		public DataTemplate StartPageTemplate { get; set; }

		public DataTemplate VerticalAlignmentTemplate { get; set; }

		public DataTemplate EndPageTemplate { get; set; }

		public override DataTemplate SelectTemplate(object item, DependencyObject container)
		{
			if (item is ConnectStepsModel connectStepsModel)
			{
				if (connectStepsModel.Layout == "S")
				{
					return StartPageTemplate;
				}
				if (connectStepsModel.Layout == "V")
				{
					return VerticalAlignmentTemplate;
				}
				if (connectStepsModel.Layout == "E")
				{
					return EndPageTemplate;
				}
			}
			return ((DataTemplateSelector)this).SelectTemplate(item, container);
		}

		public static T FindControl<T>(DependencyObject container, string name) where T : FrameworkElement
		{
			return GetAllChildren(container).OfType<T>().FirstOrDefault((T c) => ((FrameworkElement)c).Name == name);
		}

		public static IEnumerable<DependencyObject> GetAllChildren(DependencyObject parent)
		{
			int childCount = VisualTreeHelper.GetChildrenCount(parent);
			for (int i = 0; i < childCount; i++)
			{
				DependencyObject child = VisualTreeHelper.GetChild(parent, i);
				yield return child;
				foreach (DependencyObject allChild in GetAllChildren(child))
				{
					yield return allChild;
				}
			}
		}
	}
	public class InvalidView : Window, IMessageWindowV6, IComponentConnector
	{
		private int _Model;

		private DevCategory _Category;

		private InvalidViewModel _VM;

		internal LangTextBlock lblInfo;

		internal StackPanel p1;

		internal RadioButton btn1;

		internal RadioButton btn2;

		internal StackPanel p2;

		internal LangTextBlock LeftMark;

		internal StackPanel RightPanel;

		internal LangTextBlock RightMark;

		private bool _contentLoaded;

		public bool IsManualModel { get; set; }

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

		public InvalidView(DevCategory category, int model, string modelname = null)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			_Model = model;
			_Category = category;
			_VM = new InvalidViewModel();
			((Window)this).Owner = Application.Current.MainWindow;
			if (category == DevCategory.Smart)
			{
				((UIElement)btn2).Visibility = (Visibility)2;
				((UIElement)RightPanel).Visibility = (Visibility)2;
				LeftMark.LangKey = "K0998";
				_VM.LeftBtnText = "K1010";
				_VM.LeftLabelText = "K1332";
				_VM.LeftBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/tInvalid2.png";
			}
			else if (category == DevCategory.Tablet && model == 1)
			{
				((TextBlock)RightMark).Text = "";
				LeftMark.LangKey = "K0998";
				_VM.LeftBtnText = "K1010";
				_VM.RightBtnText = "K1009";
				_VM.LeftLabelText = "K1000";
				_VM.RightLabelText = "K2177";
				_VM.LeftBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/tInvalid2.png";
				_VM.RightBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/tInvalid1.png";
			}
			else if (category == DevCategory.Tablet && model == 2)
			{
				RightMark.LangKey = "K0998";
				((TextBlock)LeftMark).Text = "";
				_VM.LeftBtnText = "K1010";
				_VM.RightBtnText = "K1134";
				_VM.LeftLabelText = "K1000";
				_VM.RightLabelText = "K1332";
				_VM.LeftBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/tInvalid2.png";
				_VM.RightBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/inputImei.png";
			}
			else if (category == DevCategory.Phone && model == 1)
			{
				((TextBlock)RightMark).Text = "";
				LeftMark.LangKey = "K0998";
				_VM.LeftBtnText = "K1009";
				_VM.RightBtnText = "K1010";
				_VM.LeftLabelText = "K2178";
				_VM.RightLabelText = "K1000";
				_VM.LeftBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/usbConn.png";
				_VM.RightBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/phsearch.png";
			}
			else if (category == DevCategory.Phone && model == 2)
			{
				RightMark.LangKey = "K0998";
				((TextBlock)LeftMark).Text = "";
				_VM.LeftBtnText = "K1010";
				_VM.RightBtnText = "K1134";
				_VM.LeftLabelText = "K1000";
				_VM.RightLabelText = "K1332";
				_VM.LeftBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/phsearch.png";
				_VM.RightBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/inputImei.png";
			}
			else if (category == DevCategory.Phone && model == 3)
			{
				((UIElement)btn2).Visibility = (Visibility)2;
				((UIElement)RightPanel).Visibility = (Visibility)2;
				((TextBlock)LeftMark).Text = "";
				_VM.LeftBtnText = "K1010";
				_VM.LeftLabelText = "K1000";
				_VM.LeftBtnImage = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/phsearch.png";
			}
			_VM.IsShowWarn = (Visibility)(category != DevCategory.Tablet);
			if (!string.IsNullOrEmpty(modelname))
			{
				ResponseModel<object> val = ((ApiBaseService)FlashContext.SingleInstance.service).RequestBase(WebApiUrl.GET_SUPPORT_FASTBOOT_BY_MODELNAME, (object)new Dictionary<string, string> { { "modelName", modelname } }, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				if (val != null && val.content != null && !bool.Parse(val.content.ToString()))
				{
					lblInfo.LangKey = string.Format(HostProxy.LanguageService.Translate("K1765"), modelname);
					((TextBlock)RightMark).Text = "";
					LeftMark.LangKey = "K0998";
				}
			}
			((FrameworkElement)this).DataContext = _VM;
		}

		private void OnWndClose(object sender, RoutedEventArgs e)
		{
			Result = false;
			((Window)this).Close();
		}

		private void OnRbtnChecked(object sender, RoutedEventArgs e)
		{
			object originalSource = e.OriginalSource;
			RadioButton val = (RadioButton)((originalSource is RadioButton) ? originalSource : null);
			if (_Category == DevCategory.Phone)
			{
				if (_Model == 1)
				{
					IsManualModel = ((FrameworkElement)val).Name == "btn2";
				}
				else
				{
					IsManualModel = ((FrameworkElement)val).Name == "btn1";
				}
			}
			else if (_Category == DevCategory.Tablet)
			{
				IsManualModel = ((FrameworkElement)val).Name == "btn1";
			}
			else
			{
				IsManualModel = true;
			}
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/invalidview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Expected O, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Expected O, but got Unknown
			//IL_007b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0085: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Expected O, but got Unknown
			//IL_0095: Unknown result type (might be due to invalid IL or missing references)
			//IL_009f: Expected O, but got Unknown
			//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Expected O, but got Unknown
			//IL_00af: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Expected O, but got Unknown
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d1: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(Grid)target).AddHandler(ToggleButton.CheckedEvent, (Delegate)new RoutedEventHandler(OnRbtnChecked));
				break;
			case 2:
				lblInfo = (LangTextBlock)target;
				break;
			case 3:
				p1 = (StackPanel)target;
				break;
			case 4:
				btn1 = (RadioButton)target;
				break;
			case 5:
				btn2 = (RadioButton)target;
				break;
			case 6:
				p2 = (StackPanel)target;
				break;
			case 7:
				LeftMark = (LangTextBlock)target;
				break;
			case 8:
				RightPanel = (StackPanel)target;
				break;
			case 9:
				RightMark = (LangTextBlock)target;
				break;
			case 10:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnWndClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class InvalidViewModel : NotifyBase
	{
		private string _LeftBtnImage;

		public Visibility _isShowWarn = (Visibility)1;

		private string _RightBtnImage;

		private string _LeftBtnText;

		private string _RightBtnText;

		private string _LeftLabelText;

		private string _RightLabelText;

		public string LeftBtnImage
		{
			get
			{
				return _LeftBtnImage;
			}
			set
			{
				_LeftBtnImage = value;
				((NotifyBase)this).OnPropertyChanged("LeftBtnImage");
			}
		}

		public Visibility IsShowWarn
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _isShowWarn;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_isShowWarn = value;
				((NotifyBase)this).OnPropertyChanged("IsShowWarn");
			}
		}

		public string RightBtnImage
		{
			get
			{
				return _RightBtnImage;
			}
			set
			{
				_RightBtnImage = value;
				((NotifyBase)this).OnPropertyChanged("RightBtnImage");
			}
		}

		public string LeftBtnText
		{
			get
			{
				return _LeftBtnText;
			}
			set
			{
				_LeftBtnText = value;
				((NotifyBase)this).OnPropertyChanged("LeftBtnText");
			}
		}

		public string RightBtnText
		{
			get
			{
				return _RightBtnText;
			}
			set
			{
				_RightBtnText = value;
				((NotifyBase)this).OnPropertyChanged("RightBtnText");
			}
		}

		public string LeftLabelText
		{
			get
			{
				return _LeftLabelText;
			}
			set
			{
				_LeftLabelText = value;
				((NotifyBase)this).OnPropertyChanged("LeftLabelText");
			}
		}

		public string RightLabelText
		{
			get
			{
				return _RightLabelText;
			}
			set
			{
				_RightLabelText = value;
				((NotifyBase)this).OnPropertyChanged("RightLabelText");
			}
		}
	}
	public class Match3030View : Window, IMessageWindowV6, IComponentConnector
	{
		private bool _contentLoaded;

		public Match3030ViewModel VM { get; private set; }

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

		public Match3030View(DeviceEx device, RescueDeviceInfoModel deviceInfo, FrameworkElement parentView, ResourceResponseModel response, string matchText, DevCategory category, BusinessData businessData, object wModel, bool jumpToMatchView)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Owner = Application.Current.MainWindow;
			VM = new Match3030ViewModel(this, device, deviceInfo, parentView, response, matchText, category, businessData, wModel, jumpToMatchView);
			((FrameworkElement)this).DataContext = VM;
		}

		public void CloseWnd(bool? isOk)
		{
			Result = Convert.ToBoolean(isOk);
			((Window)this).Close();
		}

		private void OnBtnClick(object sender, RoutedEventArgs e)
		{
			bool flag = Convert.ToBoolean(((FrameworkElement)((sender is Button) ? sender : null)).Tag);
			CloseWnd(flag);
			if (flag)
			{
				VM.OnConfirmMatched();
			}
		}

		public static Task<bool?> ProcMatch3030(DeviceEx device, RescueDeviceInfoModel deviceInfo, FrameworkElement parentView, ResourceResponseModel response, string matchText, DevCategory category, BusinessData businessData, object wModel, bool jumpToMatchView = false)
		{
			return ((DispatcherObject)Application.Current).Dispatcher.Invoke<Task<bool?>>((Func<Task<bool?>>)delegate
			{
				Match3030View match3030View = new Match3030View(device, deviceInfo, parentView, response, matchText, category, businessData, wModel, jumpToMatchView);
				return MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)match3030View, (bool?)true);
			});
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/match3030view.xaml", UriKind.Relative);
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
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClick);
				break;
			case 2:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(OnBtnClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class Match3030ViewModel : NotifyBase
	{
		private Match3030View _View;

		private FrameworkElement ParentView;

		private DevCategory _Category;

		private bool jumpToMatchView;

		private ResourceRequestModel _ReqParams;

		private List<ResourceResponseModel> _MatchedResArr;

		public Stopwatch sw;

		protected bool LoadWarrantyFinished;

		protected bool LoadDataFinished;

		protected DeviceEx Device;

		protected RescueDeviceInfoModel deviceInfo;

		private string _Informaiton;

		private string _InformaitonEx;

		private bool _IsOkBtnEnable;

		public ImageSource DevImagePath { get; set; }

		public WarrantyInfoViewModelV6 WarrantyVm { get; set; }

		public WarrantyInfoBaseModel warrantyInfo { get; private set; }

		public lenovo.mbg.service.lmsa.flash.ModelV6.MatchType matchType
		{
			get
			{
				if (_Category != DevCategory.Phone)
				{
					return lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.SN;
				}
				return lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.IMEI;
			}
		}

		public BusinessType businessType
		{
			get
			{
				if (matchType == lenovo.mbg.service.lmsa.flash.ModelV6.MatchType.IMEI)
				{
					return (BusinessType)3073;
				}
				return (BusinessType)3074;
			}
		}

		public BusinessData businessData { get; private set; }

		public string MatchKeyText { get; set; }

		public string Information
		{
			get
			{
				return _Informaiton;
			}
			set
			{
				_Informaiton = value;
				((NotifyBase)this).OnPropertyChanged("Information");
			}
		}

		public string InformationEx
		{
			get
			{
				return _InformaitonEx;
			}
			set
			{
				_InformaitonEx = value;
				((NotifyBase)this).OnPropertyChanged("InformationEx");
			}
		}

		public bool IsOkBtnEnable
		{
			get
			{
				return _IsOkBtnEnable;
			}
			set
			{
				_IsOkBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsOkBtnEnable");
			}
		}

		public ObservableCollection<LComboBoxViewModelV6> CbxConditionArr { get; set; }

		public Match3030ViewModel(Match3030View ui, DeviceEx device, RescueDeviceInfoModel deviceInfo, FrameworkElement parentView, ResourceResponseModel response, string number, DevCategory category, BusinessData businessData, object wModel, bool jumpToMatchView)
		{
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Expected O, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Expected O, but got Unknown
			warrantyInfo = (WarrantyInfoBaseModel)((wModel is WarrantyInfoBaseModel) ? wModel : null);
			WarrantyVm = new WarrantyInfoViewModelV6(warrantyInfo);
			Device = device;
			this.deviceInfo = deviceInfo ?? new RescueDeviceInfoModel();
			ParentView = parentView;
			_Category = category;
			this.jumpToMatchView = jumpToMatchView;
			sw = new Stopwatch();
			sw.Start();
			if (businessData == null)
			{
				businessData = new BusinessData(businessType, (DeviceEx)null, (BusinessStatus)0);
			}
			this.businessData = businessData;
			_View = ui;
			IsOkBtnEnable = false;
			CbxConditionArr = new ObservableCollection<LComboBoxViewModelV6>();
			Initialize(response, number, category);
			switch (category)
			{
			case DevCategory.Tablet:
			{
				object obj3 = Application.Current.Resources[(object)"v6_warranty_tabletnew"];
				DevImagePath = (ImageSource)((obj3 is ImageSource) ? obj3 : null);
				break;
			}
			case DevCategory.Smart:
			{
				object obj2 = Application.Current.Resources[(object)"v6_warranty_smartnew"];
				DevImagePath = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
				break;
			}
			default:
			{
				object obj = Application.Current.Resources[(object)"v6_warranty_phonenew"];
				DevImagePath = (ImageSource)((obj is ImageSource) ? obj : null);
				break;
			}
			}
			LoadWarrantyFinished = true;
		}

		public void Initialize(ResourceResponseModel response, string matchText, DevCategory category)
		{
			MatchKeyText = matchText;
			_ReqParams = new ResourceRequestModel();
			_ReqParams.AddParameter("modelName", response.ModelName);
			_ReqParams.AddParameter("marketName", response.marketName);
			_ReqParams.AddParameter("romMatchId", response.romMatchId);
			string str = ((category == DevCategory.Phone) ? "K0079" : "K0082");
			Information = HostProxy.LanguageService.Translate("K0931") + ": " + response.marketName + "\n" + HostProxy.LanguageService.Translate("K0087") + ": " + response.ModelName + "\n" + HostProxy.LanguageService.Translate(str) + ": " + matchText;
			WarrantyInfoBaseModel obj = warrantyInfo;
			if (!string.IsNullOrEmpty((obj != null) ? obj.ShipLocation : null))
			{
				Information = Information + "\n" + HostProxy.LanguageService.Translate("K0270") + ": " + warrantyInfo.ShipLocation;
			}
			str = string.Empty;
			List<ParamPropertyWithValues> paramProperties = response.ParamProperties;
			if (paramProperties != null && paramProperties.Count > 0)
			{
				response.ParamProperties.ForEach(delegate(ParamPropertyWithValues n)
				{
					if (n.ParamValues.Count == 1)
					{
						_ReqParams.AddParameter(n.ParamProperty.PropertyValue, n.ParamValues.First());
						string text = n.ParamProperty.PropertyValue?.ToLower();
						if (text != null && (text != "imei" || text != "sn"))
						{
							str = str + HostProxy.LanguageService.Translate(n.ParamProperty.PropertyName) + ": " + n.ParamValues.First() + "\n";
						}
					}
				});
			}
			InformationEx = str.Trim(new char[1] { '\n' });
			ResourceProc(response, isDef: true);
		}

		public void CreateNextNode(ResourceResponseModel resource)
		{
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00af: Expected O, but got Unknown
			LComboBoxViewModelV6 cbx = new LComboBoxViewModelV6();
			cbx.IsEditable = false;
			cbx.ComboBoxSelectedIndex = -1;
			cbx.ComboBoxWatermark = HostProxy.LanguageService.Translate(resource.ParamProperty?.PropertyName);
			cbx.ComboBoxFilter = (object sender, string e) => 0;
			cbx.SelectionChangedCommand = (ICommand)new RoutedCommand(((object)cbx).GetHashCode().ToString(), ((object)_View).GetType());
			cbx.ComboBoxMoreButtonVisibility = (Visibility)2;
			cbx.Tag = HostProxy.LanguageService.Translate(resource.ParamProperty.PropertyValue);
			cbx.ItemSelChangedActon = delegate(object ob)
			{
				OnSubCbxSelected(cbx, ob);
			};
			cbx.StepComboBoxItemSource = new ObservableCollection<ManualComboboxViewModel>();
			resource.ParamValues.ForEach(delegate(string p)
			{
				cbx.StepComboBoxItemSource.Add(new ManualComboboxViewModel
				{
					ItemText = p,
					Tag = p
				});
			});
			((DispatcherObject)_View).Dispatcher.Invoke((Action)delegate
			{
				CbxConditionArr.Add(cbx);
			});
		}

		public void CreateNextNode(ParamPropertyWithValues pro)
		{
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_00af: Expected O, but got Unknown
			LComboBoxViewModelV6 cbx = new LComboBoxViewModelV6();
			cbx.IsEditable = false;
			cbx.ComboBoxSelectedIndex = -1;
			cbx.ComboBoxWatermark = HostProxy.LanguageService.Translate(pro.ParamProperty?.PropertyName);
			cbx.ComboBoxFilter = (object sender, string e) => 0;
			cbx.SelectionChangedCommand = (ICommand)new RoutedCommand(((object)cbx).GetHashCode().ToString(), ((object)_View).GetType());
			cbx.ComboBoxMoreButtonVisibility = (Visibility)2;
			cbx.Tag = pro.ParamProperty.PropertyValue;
			cbx.ItemSelChangedActon = delegate(object ob)
			{
				OnSubCbxSelected(cbx, ob);
			};
			cbx.StepComboBoxItemSource = new ObservableCollection<ManualComboboxViewModel>();
			pro.ParamValues.ForEach(delegate(string p)
			{
				cbx.StepComboBoxItemSource.Add(new ManualComboboxViewModel
				{
					ItemText = p,
					Tag = p
				});
			});
			((DispatcherObject)_View).Dispatcher.Invoke((Action)delegate
			{
				CbxConditionArr.Add(cbx);
			});
		}

		private void OnSubCbxSelected(LComboBoxViewModelV6 cbx, object ob)
		{
			IsOkBtnEnable = false;
			int num = CbxConditionArr.IndexOf(cbx);
			for (int num2 = CbxConditionArr.Count - 1; num2 > num; num2--)
			{
				_ReqParams.RemoveParameter(CbxConditionArr[num2].Tag);
				CbxConditionArr.RemoveAt(num2);
			}
			if (ob != null)
			{
				ManualComboboxViewModel manualComboboxViewModel = ob as ManualComboboxViewModel;
				_ReqParams.AddParameter(cbx.Tag, manualComboboxViewModel.ItemText);
				QueryMatchResource(cbx);
			}
		}

		private void ResourceProc(ResourceResponseModel resource, bool isDef = false)
		{
			ParamPropertyWithValues paramPropertyWithValues = resource.ParamProperties?.FirstOrDefault((ParamPropertyWithValues p) => p.ParamValues.Count != 1);
			if (paramPropertyWithValues != null)
			{
				CreateNextNode(paramPropertyWithValues);
			}
			else
			{
				QueryMatchResource(null);
			}
		}

		private void QueryMatchResource(LComboBoxViewModelV6 model)
		{
			LoadDataFinished = false;
			MessageWindowHelper.Instance.Loading("K0348", (Func<object>)delegate
			{
				if (_Category == DevCategory.Tablet)
				{
					_ReqParams.AddParameter("countryCode", GlobalFun.GetRegionInfo().TwoLetterISORegionName);
				}
				return FlashContext.SingleInstance.service.Request<List<ResourceResponseModel>>(WebServicesContext.RESUCE_MANUAL_GETROM, (object)_ReqParams.ParamsMapping, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
			}, true).ContinueWith(delegate(Task<object> ar)
			{
				//IL_0184: Unknown result type (might be due to invalid IL or missing references)
				//IL_0189: Unknown result type (might be due to invalid IL or missing references)
				//IL_01a3: Unknown result type (might be due to invalid IL or missing references)
				//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
				//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
				//IL_00ec: Unknown result type (might be due to invalid IL or missing references)
				string parameter = _ReqParams.GetParameter("modelName");
				ResponseModel<List<ResourceResponseModel>> val = ar.Result as ResponseModel<List<ResourceResponseModel>>;
				List<ResourceResponseModel> content = val.content;
				if (content != null && content.Count > 0)
				{
					ResourceResponseModel resource = val.content.First();
					if (resource.ParamProperty == null && resource.ParamValues == null)
					{
						LoadDataFinished = true;
						sw.Stop();
						string value = _ReqParams.ParamsMapping["romMatchId"];
						_ReqParams.ParamsMapping["romMatchId"] = resource.romMatchId;
						BusinessData val2 = BusinessData.Clone(businessData);
						val2.useCaseStep = ((object)businessType/*cast due to .constrained prefix*/).ToString();
						HostProxy.BehaviorService.Collect(businessType, val2.Update(sw.ElapsedMilliseconds, (BusinessStatus)10, parameter, (object)_ReqParams.ParamsMapping));
						_ReqParams.ParamsMapping["romMatchId"] = value;
						IsOkBtnEnable = LoadWarrantyFinished;
						_MatchedResArr = val.content;
					}
					else
					{
						((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
						{
							CreateNextNode(resource);
						});
					}
				}
				else
				{
					sw.Stop();
					BusinessData val3 = BusinessData.Clone(businessData);
					val3.useCaseStep = ((object)businessType/*cast due to .constrained prefix*/).ToString();
					HostProxy.BehaviorService.Collect(businessType, val3.Update(sw.ElapsedMilliseconds, (BusinessStatus)20, parameter, (object)_ReqParams.ParamsMapping));
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						_View.CloseWnd(false);
					});
					sw.Reset();
					if (val.code == "4000" || val.code == "4010")
					{
						MessageWindowHelper.Instance.Show((string)null, "K1459", "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
					}
					else
					{
						MessageWindowHelper.Instance.Show((string)null, FlashStaticResources.DEVICE_NOT_SUPPORT, "K0327", (string)null, false, (MessageBoxImage)64, (string)null, false, false, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false);
					}
				}
				return true;
			});
		}

		public void OnConfirmMatched()
		{
			Task.Run(delegate
			{
				ResourceResponseModel resourceResponseModel = null;
				if (_MatchedResArr.Count > 1)
				{
					resourceResponseModel = MultiRomsSelView.SelectOneFormRomArr(_MatchedResArr);
					if (resourceResponseModel == null)
					{
						return;
					}
				}
				else
				{
					resourceResponseModel = _MatchedResArr.First();
				}
				_ReqParams.ParamsMapping["romMatchId"] = resourceResponseModel.romMatchId;
				deviceInfo.romMatchId = resourceResponseModel.romMatchId;
				deviceInfo.marketName = _ReqParams.GetParameter("marketName");
				deviceInfo.modelName = _ReqParams.GetParameter("modelName");
				if (_Category == DevCategory.Phone)
				{
					deviceInfo.imei = MatchKeyText;
				}
				else
				{
					deviceInfo.sn = MatchKeyText;
				}
				FlashBusiness.ConvertDeviceInfo(_ReqParams.ParamsMapping, deviceInfo);
				AutoMatchResource data = new AutoMatchResource(Device, deviceInfo, resourceResponseModel, new MatchInfo(matchType, _ReqParams.RequestParams, deviceInfo));
				MainFrameV6.Instance.JumptoRescueView(_Category, data, warrantyInfo, ParentView, jumpToMatchView);
			});
		}
	}
	public class Match3040View : Window, IMessageWindowV6, IComponentConnector
	{
		private Match3040ViewModel _VM;

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

		public Match3040View(ResourceResponseModel response, string matchText, DevCategory category, object wModel)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			((Window)this).Owner = Application.Current.MainWindow;
			_VM = new Match3040ViewModel(this, response, matchText, category, wModel);
			((FrameworkElement)this).DataContext = _VM;
		}

		private void OnBtnClick(object sender, RoutedEventArgs e)
		{
			Button val = (Button)((sender is Button) ? sender : null);
			Result = Convert.ToBoolean(((FrameworkElement)val).Tag);
			((Window)this).Close();
		}

		public static bool? ProcMatch3040(ResourceResponseModel response, string matchText, DevCategory category, object wModel)
		{
			Match3040View wnd = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke<Match3040View>((Func<Match3040View>)(() => wnd = new Match3040View(response, matchText, category, wModel)));
			return MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)wnd, (bool?)true).Result;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/match3040view.xaml", UriKind.Relative);
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
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClick);
				break;
			case 2:
				((ButtonBase)(LangButton)target).Click += new RoutedEventHandler(OnBtnClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class Match3040ViewModel : NotifyBase
	{
		private string _Informaiton;

		private string _InformaitonEx;

		private bool _IsOkBtnEnable;

		public string MatchKeyText { get; set; }

		public string Information
		{
			get
			{
				return _Informaiton;
			}
			set
			{
				_Informaiton = value;
				((NotifyBase)this).OnPropertyChanged("Information");
			}
		}

		public string InformationEx
		{
			get
			{
				return _InformaitonEx;
			}
			set
			{
				_InformaitonEx = value;
				((NotifyBase)this).OnPropertyChanged("InformationEx");
			}
		}

		public bool IsOkBtnEnable
		{
			get
			{
				return _IsOkBtnEnable;
			}
			set
			{
				_IsOkBtnEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsOkBtnEnable");
			}
		}

		public ImageSource DevImagePath { get; set; }

		public WarrantyInfoViewModelV6 WarrantyVm { get; set; }

		public Match3040ViewModel(Match3040View ui, ResourceResponseModel response, string number, DevCategory category, object wModel)
		{
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Expected O, but got Unknown
			WarrantyInfoBaseModel val = (WarrantyInfoBaseModel)((wModel is WarrantyInfoBaseModel) ? wModel : null);
			WarrantyVm = new WarrantyInfoViewModelV6(val);
			string text = ((category == DevCategory.Phone) ? "K0079" : "K0082");
			List<ParamPropertyWithValues> paramProperties = response.ParamProperties;
			if (paramProperties != null && paramProperties.Count >= 3)
			{
				Information = HostProxy.LanguageService.Translate("K0931") + ": " + response.marketName + "\n" + HostProxy.LanguageService.Translate("K0087") + ": " + response.ModelName + "\n" + HostProxy.LanguageService.Translate(text) + ": " + number;
				InformationEx = string.Empty;
			}
			else
			{
				Information = HostProxy.LanguageService.Translate("K0931") + ": " + response.marketName + "\n" + HostProxy.LanguageService.Translate("K0087") + ": " + response.ModelName;
				InformationEx = HostProxy.LanguageService.Translate(text) + ": " + number + "\n";
			}
			if (!string.IsNullOrEmpty((val != null) ? val.ShipLocation : null))
			{
				Information = Information + "\n" + HostProxy.LanguageService.Translate("K0270") + ": " + val.ShipLocation;
			}
			List<ParamPropertyWithValues> paramProperties2 = response.ParamProperties;
			if (paramProperties2 != null && paramProperties2.Count > 0)
			{
				string temp = string.Empty;
				response.ParamProperties.ForEach(delegate(ParamPropertyWithValues n)
				{
					temp = temp + HostProxy.LanguageService.Translate(n.ParamProperty.PropertyName) + ": " + n.ParamValues.First() + "\n";
				});
				InformationEx += temp.Trim(new char[1] { '\n' });
			}
			switch (category)
			{
			case DevCategory.Tablet:
			{
				object obj3 = Application.Current.Resources[(object)"v6_warranty_tabletnew"];
				DevImagePath = (ImageSource)((obj3 is ImageSource) ? obj3 : null);
				break;
			}
			case DevCategory.Smart:
			{
				object obj2 = Application.Current.Resources[(object)"v6_warranty_smartnew"];
				DevImagePath = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
				break;
			}
			default:
			{
				object obj = Application.Current.Resources[(object)"v6_warranty_phonenew"];
				DevImagePath = (ImageSource)((obj is ImageSource) ? obj : null);
				break;
			}
			}
			IsOkBtnEnable = true;
		}
	}
	public class MessageWithLinkerView : UserControl, IMessageViewV6, IComponentConnector, IStyleConnector
	{
		internal LangTextBlock tbkTitle;

		internal LangTextBlock txtInfo;

		internal ListBox LinkList;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		internal Button btnClose;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public MessageWithLinkerView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		public void Init(string title, string message, string btnOkTitle, string btnCancelTitle, List<Tuple<string, string>> LinkerArr, bool isCloseBtn = false)
		{
			tbkTitle.LangKey = title;
			txtInfo.LangKey = message;
			((ItemsControl)LinkList).ItemsSource = LinkerArr;
			((UIElement)btnOk).Visibility = (Visibility)(string.IsNullOrEmpty(btnOkTitle) ? 2 : 0);
			btnOk.LangKey = btnOkTitle;
			((UIElement)btnCancel).Visibility = (Visibility)(string.IsNullOrEmpty(btnCancelTitle) ? 2 : 0);
			btnCancel.LangKey = btnCancelTitle;
			((UIElement)btnClose).Visibility = (Visibility)((!isCloseBtn) ? 2 : 0);
		}

		private void OnLBtnDown(object sender, MouseButtonEventArgs e)
		{
			object obj = ((sender is TextBlock) ? sender : null);
			string text = ((obj != null) ? ((FrameworkElement)obj).Tag : null) as string;
			if (!string.IsNullOrEmpty(text))
			{
				Process.Start(text);
			}
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			FireClose(null);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			FireClose(true);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/messagewithlinkerview.xaml", UriKind.Relative);
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
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Expected O, but got Unknown
			//IL_0089: Unknown result type (might be due to invalid IL or missing references)
			//IL_0093: Expected O, but got Unknown
			//IL_0096: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a0: Expected O, but got Unknown
			//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b7: Expected O, but got Unknown
			switch (connectionId)
			{
			case 2:
				tbkTitle = (LangTextBlock)target;
				break;
			case 3:
				txtInfo = (LangTextBlock)target;
				break;
			case 4:
				LinkList = (ListBox)target;
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

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IStyleConnector.Connect(int connectionId, object target)
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Expected O, but got Unknown
			if (connectionId == 1)
			{
				((UIElement)(LangTextBlock)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLBtnDown);
			}
		}
	}
	public class MultiRomsSelView : Window, IMessageWindowV6, IComponentConnector
	{
		internal Grid panel1;

		internal Grid panel2;

		private bool _contentLoaded;

		public MultiRomsSelViewModel VM { get; private set; }

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

		public MultiRomsSelView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			VM = new MultiRomsSelViewModel(this);
			((FrameworkElement)this).DataContext = VM;
			((Window)this).Owner = Application.Current.MainWindow;
		}

		private void OnBtnBack(object sender, RoutedEventArgs e)
		{
			((UIElement)panel1).Visibility = (Visibility)0;
			((UIElement)panel2).Visibility = (Visibility)2;
		}

		private void OnBtnNext(object sender, RoutedEventArgs e)
		{
			((UIElement)panel1).Visibility = (Visibility)2;
			((UIElement)panel2).Visibility = (Visibility)0;
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			Task.Run(delegate
			{
				if (MessageWindowHelper.Instance.Show((string)null, "K0969", "K0327", "K0208", false, (MessageBoxImage)64, (string)null, false, true, false, (Action<IMessageWindowV6>)null, (Predicate<object>)null, (Predicate<object>)null, (Func<bool>)null, (bool?)true, false).Result == true)
				{
					Result = false;
					((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
					{
						((Window)this).Close();
					});
				}
			});
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			Result = true;
			((Window)this).Close();
		}

		public static ResourceResponseModel SelectOneFormRomArr(List<ResourceResponseModel> arr)
		{
			MultiRomsSelView win = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				win = new MultiRomsSelView();
				win.VM.RomArr.AddRange(arr);
			});
			if (MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)win, (bool?)true).Result != true)
			{
				return null;
			}
			return win.VM.SelectedRom;
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/multiromsselview.xaml", UriKind.Relative);
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
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Expected O, but got Unknown
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Expected O, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Expected O, but got Unknown
			//IL_006d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Expected O, but got Unknown
			//IL_0085: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Unknown result type (might be due to invalid IL or missing references)
			//IL_009b: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				panel1 = (Grid)target;
				break;
			case 2:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnNext);
				break;
			case 3:
				panel2 = (Grid)target;
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnBack);
				break;
			case 5:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 6:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class MultiRomsSelViewModel : NotifyBase
	{
		private bool _IsNextEnable;

		private ResourceResponseModel _SelectedRom;

		public bool IsNextEnable
		{
			get
			{
				return _IsNextEnable;
			}
			set
			{
				_IsNextEnable = value;
				((NotifyBase)this).OnPropertyChanged("IsNextEnable");
			}
		}

		public ResourceResponseModel SelectedRom
		{
			get
			{
				return _SelectedRom;
			}
			set
			{
				_SelectedRom = value;
				IsNextEnable = true;
				((NotifyBase)this).OnPropertyChanged("SelectedRom");
			}
		}

		public List<ResourceResponseModel> RomArr { get; set; }

		public MultiRomsSelViewModel(MultiRomsSelView ui)
		{
			RomArr = new List<ResourceResponseModel>();
		}
	}
	public class PhoneEnterySelView : Window, IMessageWindowV6, IComponentConnector
	{
		internal RadioButton rbtn1;

		internal RadioButton rbtn2;

		internal RadioButton rbtn3;

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

		public PhoneEnterySelView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			Result = false;
			((Window)this).Close();
		}

		private void OnRbtnChecked(object sender, RoutedEventArgs e)
		{
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected O, but got Unknown
			//IL_0049: Expected O, but got Unknown
			OnBtnClose(null, null);
			RadioButton val = (RadioButton)((sender is RadioButton) ? sender : null);
			if (((FrameworkElement)val).Name == "rbtn1")
			{
				MessageWindowHelper.Instance.Show((IMessageWindowV6)new WifiConnectHelpWindowV6(false, "", (WifiTutorialsType)1)
				{
					DataContext = (object)new WifiConnectHelpWindowModelV6((WifiTutorialsType)1)
				}, (bool?)true);
			}
			else if (((FrameworkElement)val).Name == "rbtn2")
			{
				Plugin.OperateTracker("ManuallyEntertheIMEI", "User clicked manually enter the imei");
				FindIMEIView wnd = new FindIMEIView();
				Task.Run(delegate
				{
					if (MessageWindowHelper.Instance.Show((IMessageWindowV6)(object)wnd, (bool?)true).Result == true)
					{
						MainFrameV6.Instance.ShowGifGuideSteps(_showTextDetect: true, null);
					}
					else
					{
						MainFrameV6.Instance.ChangeView(PageIndex.PHONE_SEARCH);
					}
				});
			}
			else if (((FrameworkElement)val).Name == "rbtn3")
			{
				Plugin.OperateTracker("Select your model", "User clicked Select your model");
				MainFrameV6.Instance.ChangeView(PageIndex.PHONE_MANUAL);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/phoneenteryselview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Expected O, but got Unknown
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_0041: Expected O, but got Unknown
			//IL_004e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Expected O, but got Unknown
			//IL_005b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0065: Expected O, but got Unknown
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_007c: Expected O, but got Unknown
			//IL_007f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0089: Expected O, but got Unknown
			//IL_0096: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a0: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				rbtn1 = (RadioButton)target;
				((ToggleButton)rbtn1).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			case 3:
				rbtn2 = (RadioButton)target;
				((ToggleButton)rbtn2).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			case 4:
				rbtn3 = (RadioButton)target;
				((ToggleButton)rbtn3).Checked += new RoutedEventHandler(OnRbtnChecked);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescueFailedForFreedbackView : UserControl, IMessageViewV6, IComponentConnector
	{
		internal LangTextBlock tbkTitle;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		internal Button btnClose;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public RescueFailedForFreedbackView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnFeedback(object sender, MouseButtonEventArgs e)
		{
			HostProxy.HostOperationService.ShowFeedBack();
			FireClose(true);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			FireClose(null);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			FireClose(true);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/rescuefailedforfreedbackview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected O, but got Unknown
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Expected O, but got Unknown
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Expected O, but got Unknown
			//IL_006c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0076: Expected O, but got Unknown
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Expected O, but got Unknown
			//IL_0090: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Expected O, but got Unknown
			//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b1: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				tbkTitle = (LangTextBlock)target;
				break;
			case 2:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnFeedback);
				break;
			case 3:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 4:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 5:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescueFailedSubmitView : UserControl, IMessageViewV6, IComponentConnector
	{
		private string _Category;

		private bool _IsSupportedMoliLena;

		internal TextBlock VirtualAgent;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public RescueFailedSubmitView(string category)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			_Category = category;
			object obj = HostProxy.GlobalCache.Get("countrySupportedMoliLenaList");
			JObject val = (JObject)((obj is JObject) ? obj : null);
			if (val != null)
			{
				string empty = string.Empty;
				try
				{
					JToken obj2 = ((JToken)val).SelectToken("$.*[?(@.deviceType == '" + category + "')].url", false);
					empty = ((obj2 != null) ? Extensions.Value<string>((IEnumerable<JToken>)obj2) : null);
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("support cache data" + ((object)val).ToString() + " ,error info:" + ex, false);
					empty = string.Empty;
				}
				_IsSupportedMoliLena = !string.IsNullOrEmpty(empty);
			}
			else
			{
				_IsSupportedMoliLena = false;
			}
			if (_IsSupportedMoliLena || "motoPhone".Equals(category))
			{
				((UIElement)VirtualAgent).Visibility = (Visibility)0;
			}
			else
			{
				((UIElement)VirtualAgent).Visibility = (Visibility)2;
			}
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			FireClose(true);
		}

		private void OnVirtualAgent(object sender, MouseButtonEventArgs e)
		{
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			if (_IsSupportedMoliLena)
			{
				JObject val = new JObject();
				val.Add("action", JToken.op_Implicit("SelectMoliLena"));
				val.Add("category", JToken.op_Implicit(_Category));
				JObject jobj = val;
				FireClose(true, jobj);
			}
			else if ("motoPhone".Equals(_Category))
			{
				Process.Start("https://moli.lenovo.com/callcenter/moli");
			}
		}

		private void OnforumClicked(object sender, MouseButtonEventArgs e)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Expected O, but got Unknown
			JObject val = new JObject();
			val.Add("action", JToken.op_Implicit("SelectForum"));
			val.Add("category", JToken.op_Implicit(_Category));
			JObject jobj = val;
			FireClose(true, jobj);
		}

		private void FireClose(bool? result, JObject jobj = null)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
			if (jobj != null)
			{
				HostProxy.HostNavigation.SwitchTo("a6099126929a4e74ac86f1c2405dcb32", (object)jobj);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/rescuefailedsubmitview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Expected O, but got Unknown
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Expected O, but got Unknown
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Expected O, but got Unknown
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0068: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Expected O, but got Unknown
			//IL_0074: Unknown result type (might be due to invalid IL or missing references)
			//IL_0080: Unknown result type (might be due to invalid IL or missing references)
			//IL_008a: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnforumClicked);
				break;
			case 2:
				VirtualAgent = (TextBlock)target;
				break;
			case 3:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnVirtualAgent);
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 5:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescueFailedView : UserControl, IComponentConnector
	{
		internal LangTextBlock txtContent;

		internal LangTextBlock txtNote;

		internal Border bd;

		internal Image picture;

		private bool _contentLoaded;

		public RescueFailedView(string message, bool isNormalNote, string image = null)
		{
			InitializeComponent();
			txtContent.LangKey = message;
			if (string.IsNullOrEmpty(image))
			{
				((UIElement)bd).Visibility = (Visibility)2;
			}
			else
			{
				Image obj = picture;
				object obj2 = Application.Current.Resources[(object)image];
				obj.Source = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
			}
			if (isNormalNote)
			{
				SetNormalText();
			}
			else
			{
				SetEffectsText();
			}
		}

		public void SetEffectsText()
		{
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_005e: Unknown result type (might be due to invalid IL or missing references)
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Expected O, but got Unknown
			//IL_008c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Unknown result type (might be due to invalid IL or missing references)
			//IL_009c: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Expected O, but got Unknown
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ce: Expected O, but got Unknown
			string text = LangTranslation.Translate("K1200");
			string text2 = LangTranslation.Translate("K1201");
			string text3 = string.Format(LangTranslation.Translate("K1199"), text, text2);
			((TextBlock)txtNote).Text = text3;
			((TextBlock)txtNote).TextEffects.Add(new TextEffect
			{
				Foreground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2")),
				PositionStart = text3.IndexOf(text),
				PositionCount = text.ToString().Length
			});
			((TextBlock)txtNote).TextEffects.Add(new TextEffect
			{
				Foreground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString("#43B5E2")),
				PositionStart = text3.IndexOf(text2),
				PositionCount = text2.ToString().Length
			});
		}

		public void SetNormalText()
		{
			((TextBlock)txtNote).Text = HostProxy.LanguageService.Translate("K1241");
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/rescuefailedview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Expected O, but got Unknown
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Expected O, but got Unknown
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				txtContent = (LangTextBlock)target;
				break;
			case 2:
				txtNote = (LangTextBlock)target;
				break;
			case 3:
				bd = (Border)target;
				break;
			case 4:
				picture = (Image)target;
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescueMessageView : UserControl, IMessageViewV6, IComponentConnector
	{
		private bool _IsPopup;

		private string _UrlLink;

		internal LangTextBlock txtTitle;

		internal TextBlock txtContent;

		internal Border imgborder;

		internal Image img;

		internal LangTextBlock txtLink;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		internal Button btnClose;

		internal PopupEx pop;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public RescueMessageView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		public void Init(string title, string content, ImageSource image, string okBtn, string cancelBtn, string link, bool canClose, bool isPopup, bool format)
		{
			//IL_0170: Unknown result type (might be due to invalid IL or missing references)
			//IL_0175: Unknown result type (might be due to invalid IL or missing references)
			//IL_0185: Expected O, but got Unknown
			//IL_018e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0198: Expected O, but got Unknown
			//IL_0163: Unknown result type (might be due to invalid IL or missing references)
			//IL_016d: Expected O, but got Unknown
			//IL_0147: Unknown result type (might be due to invalid IL or missing references)
			//IL_0151: Expected O, but got Unknown
			txtTitle.LangKey = title;
			content = LangTranslation.Translate(content);
			if (image != null)
			{
				((UIElement)imgborder).Visibility = (Visibility)0;
				img.Source = image;
			}
			if (!string.IsNullOrEmpty(content))
			{
				content = content.Replace("&#x0a;", "\n");
				content = content.Replace("\\n", "\n");
				content = LangTranslation.Translate(content);
			}
			_UrlLink = link;
			_IsPopup = isPopup;
			object obj = Application.Current.TryFindResource((object)"V6_TitleBrushKey");
			SolidColorBrush val = (SolidColorBrush)((obj is SolidColorBrush) ? obj : null);
			object obj2 = Application.Current.TryFindResource((object)"V6_ContentBrushKey");
			SolidColorBrush normalBrush = (SolidColorBrush)((obj2 is SolidColorBrush) ? obj2 : null);
			string[] array = content.Split(new string[3] { "\n\n", "\n", " - " }, StringSplitOptions.RemoveEmptyEntries);
			if (array.Length > 1 && format)
			{
				List<Inline> list = new List<Inline>();
				for (int i = 0; i < array.Length; i++)
				{
					List<Inline> list2 = ParseCustomTagsWithLineBreak(array[i], normalBrush, val, txtContent.FontSize);
					if (i == 0)
					{
						foreach (Inline item in list2)
						{
							Run val2 = (Run)(object)((item is Run) ? item : null);
							if (val2 != null)
							{
								((TextElement)val2).Foreground = (Brush)(object)val;
							}
							list.Add(item);
						}
						list.Add((Inline)new LineBreak());
					}
					else if (i % 2 == 1)
					{
						list.AddRange(list2);
						list.Add((Inline)new LineBreak());
					}
					else
					{
						list.Add((Inline)new Run
						{
							Text = " - "
						});
						list.AddRange(list2);
						list.Add((Inline)new LineBreak());
					}
				}
				((TextElementCollection<Inline>)(object)txtContent.Inlines).AddRange((IEnumerable)list);
			}
			else
			{
				((TextElementCollection<Inline>)(object)txtContent.Inlines).Clear();
				List<Inline> list3 = ParseCustomTagsWithLineBreak(content, normalBrush, val, txtContent.FontSize);
				((TextElementCollection<Inline>)(object)txtContent.Inlines).AddRange((IEnumerable)list3);
			}
			((UIElement)txtLink).Visibility = (Visibility)(string.IsNullOrEmpty(link) ? 2 : 0);
			((UIElement)btnClose).Visibility = (Visibility)((!canClose) ? 2 : 0);
			btnOk.LangKey = okBtn;
			((UIElement)btnOk).Visibility = (Visibility)(string.IsNullOrEmpty(okBtn) ? 2 : 0);
			btnCancel.LangKey = cancelBtn;
			((UIElement)btnCancel).Visibility = (Visibility)(string.IsNullOrEmpty(cancelBtn) ? 2 : 0);
		}

		private List<Inline> ParseCustomTagsWithLineBreak(string text, SolidColorBrush normalBrush, SolidColorBrush boldBrush, double fontsize)
		{
			//IL_0087: Unknown result type (might be due to invalid IL or missing references)
			//IL_008c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0094: Unknown result type (might be due to invalid IL or missing references)
			//IL_009b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a5: Expected O, but got Unknown
			List<Inline> list = new List<Inline>();
			if (string.IsNullOrEmpty(text))
			{
				return list;
			}
			Regex regex = new Regex("\\[(b|c|h|bc|bh|ch|bch)([^\\]]*?)\\](.*?)\\[/\\1\\]", RegexOptions.IgnoreCase);
			int num = 0;
			foreach (Match item in regex.Matches(text))
			{
				if (item.Index > num)
				{
					string text2 = text.Substring(num, item.Index - num);
					AddTextWithLineBreaks(text2, normalBrush, list, fontsize);
				}
				string value = item.Groups[2].Value;
				string value2 = item.Groups[3].Value;
				Run val = new Run
				{
					Text = value2,
					Foreground = (Brush)(object)boldBrush,
					FontSize = fontsize
				};
				ApplyCustomStyle(val, value);
				AddTextWithLineBreaks(value2, boldBrush, list, fontsize, val);
				num = item.Index + item.Length;
			}
			if (num < text.Length)
			{
				string text3 = text.Substring(num);
				AddTextWithLineBreaks(text3, normalBrush, list, fontsize);
			}
			return list;
		}

		private void AddTextWithLineBreaks(string text, SolidColorBrush brush, List<Inline> inlines, double fontsize, Run baseRun = null)
		{
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0077: Unknown result type (might be due to invalid IL or missing references)
			//IL_007e: Unknown result type (might be due to invalid IL or missing references)
			//IL_008b: Expected O, but got Unknown
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Expected O, but got Unknown
			//IL_0094: Unknown result type (might be due to invalid IL or missing references)
			//IL_009e: Expected O, but got Unknown
			if (string.IsNullOrEmpty(text))
			{
				return;
			}
			string[] array = text.Split(new char[1] { '\n' });
			for (int i = 0; i < array.Length; i++)
			{
				if (baseRun != null && i == 0)
				{
					Run item = new Run
					{
						Text = array[i],
						Foreground = ((TextElement)baseRun).Foreground,
						FontWeight = ((TextElement)baseRun).FontWeight,
						FontSize = ((TextElement)baseRun).FontSize
					};
					inlines.Add((Inline)(object)item);
				}
				else
				{
					inlines.Add((Inline)new Run
					{
						Text = array[i],
						Foreground = (Brush)(object)brush,
						FontSize = fontsize
					});
				}
				if (i < array.Length - 1)
				{
					inlines.Add((Inline)new LineBreak());
				}
			}
		}

		private void ApplyCustomStyle(Run run, string attr)
		{
			//IL_004c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected O, but got Unknown
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			if (string.IsNullOrEmpty(attr))
			{
				return;
			}
			Match match = Regex.Match(attr, "color\\s*=\\s*['\"]?(#[0-9a-fA-F]{6,8})['\"]?");
			Match match2 = Regex.Match(attr, "weight\\s*=\\s*['\"]?(\\d+)['\"]?");
			Match match3 = Regex.Match(attr, "size\\s*=\\s*['\"]?(\\d+)['\"]?");
			if (match.Success)
			{
				try
				{
					((TextElement)run).Foreground = (Brush)new SolidColorBrush((Color)ColorConverter.ConvertFromString(match.Groups[1].Value));
				}
				catch
				{
				}
			}
			if (match2.Success && int.TryParse(match2.Groups[1].Value, out var result))
			{
				result = ((result < 100) ? 100 : result);
				result = ((result > 900) ? 900 : result);
				((TextElement)run).FontWeight = FontWeight.FromOpenTypeWeight(result);
			}
			if (match3.Success && int.TryParse(match3.Groups[1].Value, out var result2))
			{
				((TextElement)run).FontSize = result2;
			}
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			Uri uri = new Uri(_UrlLink);
			if (!string.IsNullOrEmpty(uri.Host))
			{
				Process.Start(new ProcessStartInfo(uri.AbsoluteUri));
			}
			else if (File.Exists(_UrlLink))
			{
				Process.Start(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Windows), "explorer.exe"), _UrlLink);
			}
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			FireClose(true);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			if (_IsPopup)
			{
				((Popup)pop).IsOpen = true;
			}
			else
			{
				FireClose(null);
			}
		}

		private void OnPopCancel(object sender, RoutedEventArgs e)
		{
			((Popup)pop).IsOpen = false;
			FireClose(null);
		}

		private void OnPopOk(object sender, RoutedEventArgs e)
		{
			((Popup)pop).IsOpen = false;
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/rescuemessageview.xaml", UriKind.Relative);
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
			//IL_006f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0079: Expected O, but got Unknown
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Expected O, but got Unknown
			//IL_0093: Unknown result type (might be due to invalid IL or missing references)
			//IL_009d: Expected O, but got Unknown
			//IL_00aa: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b4: Expected O, but got Unknown
			//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c1: Expected O, but got Unknown
			//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d8: Expected O, but got Unknown
			//IL_00db: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e5: Expected O, but got Unknown
			//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fc: Expected O, but got Unknown
			//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
			//IL_0109: Expected O, but got Unknown
			//IL_010b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0117: Unknown result type (might be due to invalid IL or missing references)
			//IL_0121: Expected O, but got Unknown
			//IL_0123: Unknown result type (might be due to invalid IL or missing references)
			//IL_012f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0139: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				txtTitle = (LangTextBlock)target;
				break;
			case 2:
				txtContent = (TextBlock)target;
				break;
			case 3:
				imgborder = (Border)target;
				break;
			case 4:
				img = (Image)target;
				break;
			case 5:
				txtLink = (LangTextBlock)target;
				((UIElement)txtLink).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
				break;
			case 6:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 7:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 8:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 9:
				pop = (PopupEx)target;
				break;
			case 10:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnPopCancel);
				break;
			case 11:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnPopOk);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class Rescue3ColumnView : UserControl, IMessageViewV6, IComponentConnector
	{
		internal Button btnClose;

		internal PopupEx pop;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public Rescue3ColumnView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			ColumnViewModel obj = ((FrameworkElement)this).DataContext as ColumnViewModel;
			if (obj != null && !obj.IsClosePopup)
			{
				OnPopCancel(null, null);
			}
			else
			{
				((Popup)pop).IsOpen = true;
			}
		}

		private void OnPopCancel(object sender, RoutedEventArgs e)
		{
			((Popup)pop).IsOpen = false;
			Result = null;
			WaitHandler.Set();
			CloseAction?.Invoke(null);
		}

		private void OnPopOk(object sender, RoutedEventArgs e)
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/rescue3columnview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_004c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Expected O, but got Unknown
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 2:
				pop = (PopupEx)target;
				break;
			case 3:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnPopCancel);
				break;
			case 4:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnPopOk);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class ColumnViewModel : NotifyBase
	{
		private string _StepNoteText;

		private string _StepTitle;

		private string _stepContext1;

		private string _stepContext2;

		private string _stepContext3;

		private GridLength _widthRatio1;

		private GridLength _widthRatio2;

		private GridLength _widthRatio3;

		public bool IsClosePopup { get; set; }

		public string StepNoteText
		{
			get
			{
				return _StepNoteText;
			}
			set
			{
				_StepNoteText = value;
				((NotifyBase)this).OnPropertyChanged("StepNoteText");
			}
		}

		public Visibility StepNoteVisibility
		{
			get
			{
				if (string.IsNullOrEmpty(_StepNoteText))
				{
					return (Visibility)2;
				}
				return (Visibility)0;
			}
		}

		public string StepTitle
		{
			get
			{
				return _StepTitle;
			}
			set
			{
				_StepTitle = value;
				((NotifyBase)this).OnPropertyChanged("StepTitle");
			}
		}

		public string StepContext1
		{
			get
			{
				return _stepContext1;
			}
			set
			{
				_stepContext1 = value;
				((NotifyBase)this).OnPropertyChanged("StepContext1");
			}
		}

		public string StepImage1 { get; set; }

		public string StepContext2
		{
			get
			{
				return _stepContext2;
			}
			set
			{
				_stepContext2 = value;
				((NotifyBase)this).OnPropertyChanged("StepContext2");
			}
		}

		public string StepImage2 { get; set; }

		public string StepContext3
		{
			get
			{
				return _stepContext3;
			}
			set
			{
				_stepContext3 = value;
				((NotifyBase)this).OnPropertyChanged("StepContext3");
			}
		}

		public string StepImage3 { get; set; }

		public GridLength WidthRatio1
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _widthRatio1;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_widthRatio1 = value;
				((NotifyBase)this).OnPropertyChanged("WidthRatio1");
			}
		}

		public GridLength WidthRatio2
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _widthRatio2;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_widthRatio2 = value;
				((NotifyBase)this).OnPropertyChanged("WidthRatio2");
			}
		}

		public GridLength WidthRatio3
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _widthRatio3;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				_widthRatio3 = value;
				((NotifyBase)this).OnPropertyChanged("WidthRatio3");
			}
		}

		public ColumnViewModel()
		{
			IsClosePopup = true;
		}
	}
	public class RescueRestoreView : UserControl, IMessageViewV6, IComponentConnector
	{
		internal Image img;

		internal LangButton btnCancel;

		internal LangButton btnOk;

		internal Button btnClose;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public RescueRestoreView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		private void OnBtnCancel(object sender, RoutedEventArgs e)
		{
			FireClose(false);
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			FireClose(true);
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

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/rescuerestoreview.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Expected O, but got Unknown
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Expected O, but got Unknown
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected O, but got Unknown
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Expected O, but got Unknown
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Expected O, but got Unknown
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_007b: Expected O, but got Unknown
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_0092: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				img = (Image)target;
				break;
			case 2:
				btnCancel = (LangButton)target;
				((ButtonBase)btnCancel).Click += new RoutedEventHandler(OnBtnCancel);
				break;
			case 3:
				btnOk = (LangButton)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			case 4:
				btnClose = (Button)target;
				((ButtonBase)btnClose).Click += new RoutedEventHandler(OnBtnClose);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class RescuingView : Window, IUserMsgControl, IComponentConnector
	{
		private bool _contentLoaded;

		public bool? Result { get; set; }

		public Action<bool?> CloseAction { get; set; }

		public Action<bool?> CallBackAction { get; set; }

		public RescuingView()
		{
			InitializeComponent();
			((Window)this).Owner = Application.Current.MainWindow;
		}

		public Window GetMsgUi()
		{
			return (Window)(object)this;
		}

		protected override void OnClosed(EventArgs e)
		{
			((Window)this).OnClosed(e);
			CloseAction?.Invoke(true);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/rescuingview.xaml", UriKind.Relative);
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
	public class RescueSuccessSubmitView : UserControl, IMessageViewV6, IComponentConnector
	{
		private readonly ResuceSuccessSubmitViewModel _VM;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public RescueSuccessSubmitView(string modelName)
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			_VM = new ResuceSuccessSubmitViewModel(modelName);
			((FrameworkElement)this).DataContext = _VM;
		}

		private void OnLButtonDown(object sender, MouseButtonEventArgs e)
		{
			GlobalFun.OpenUrlByBrowser("www.lenovo.com/privacy/");
		}

		private void OnBtnSubmit(object sender, RoutedEventArgs e)
		{
			_VM.Submit().ContinueWith(delegate(Task<bool?> task)
			{
				if (task.Result.HasValue)
				{
					FireClose(task.Result == true);
				}
			});
		}

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			_VM.ReleaseLocker();
			FireClose(null);
		}

		private void FireClose(bool? result)
		{
			Result = result;
			WaitHandler.Set();
			CloseAction?.Invoke(result);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/rescuesuccesssubmitview.xaml", UriKind.Relative);
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
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnSubmit);
				break;
			case 2:
				((ContentElement)(LangRun)target).MouseLeftButtonDown += new MouseButtonEventHandler(OnLButtonDown);
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
	public class ResuceSuccessSubmitViewModel : NotifyBase
	{
		private Brush normalBrush;

		private Brush errorBrush;

		private long interlocker;

		private string modelName;

		private string beforeText;

		private string afterText;

		private bool uplodaLogs = true;

		private bool submitButtonIsEnabled = true;

		private Brush beforeBorderBrush;

		private Brush afterBorderBrush;

		public string BeforeText
		{
			get
			{
				return beforeText;
			}
			set
			{
				beforeText = value;
				if (!string.IsNullOrEmpty(value))
				{
					BeforeBorderBrush = normalBrush;
				}
				((NotifyBase)this).OnPropertyChanged("BeforeText");
			}
		}

		public string AfterText
		{
			get
			{
				return afterText;
			}
			set
			{
				afterText = value;
				if (!string.IsNullOrEmpty(value))
				{
					AfterBorderBrush = normalBrush;
				}
				((NotifyBase)this).OnPropertyChanged("AfterText");
			}
		}

		public bool UplodaLogs
		{
			get
			{
				return uplodaLogs;
			}
			set
			{
				uplodaLogs = value;
				((NotifyBase)this).OnPropertyChanged("UplodaLogs");
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
				submitButtonIsEnabled = value;
				((NotifyBase)this).OnPropertyChanged("SubmitButtonIsEnabled");
			}
		}

		public Brush BeforeBorderBrush
		{
			get
			{
				return beforeBorderBrush;
			}
			set
			{
				beforeBorderBrush = value;
				((NotifyBase)this).OnPropertyChanged("BeforeBorderBrush");
			}
		}

		public Brush AfterBorderBrush
		{
			get
			{
				return afterBorderBrush;
			}
			set
			{
				afterBorderBrush = value;
				((NotifyBase)this).OnPropertyChanged("AfterBorderBrush");
			}
		}

		public ResuceSuccessSubmitViewModel(string modelName)
		{
			this.modelName = modelName;
			object obj = Application.Current.TryFindResource((object)"V6_BorderBrushKey");
			normalBrush = (Brush)((obj is SolidColorBrush) ? obj : null);
			object obj2 = Application.Current.TryFindResource((object)"V6_WarnningBrushKey");
			errorBrush = (Brush)((obj2 is SolidColorBrush) ? obj2 : null);
			beforeBorderBrush = normalBrush;
			afterBorderBrush = normalBrush;
		}

		public void ReleaseLocker()
		{
			if (Interlocked.Read(in interlocker) != 0L)
			{
				Interlocked.Exchange(ref interlocker, 0L);
			}
		}

		public async Task<bool?> Submit()
		{
			if (Interlocked.Read(in interlocker) != 0L)
			{
				return null;
			}
			try
			{
				Interlocked.Exchange(ref interlocker, 1L);
				HostProxy.CurrentDispatcher.Invoke((Action)delegate
				{
					if (string.IsNullOrEmpty(BeforeText))
					{
						BeforeBorderBrush = errorBrush;
					}
					if (string.IsNullOrEmpty(AfterText))
					{
						AfterBorderBrush = errorBrush;
					}
				});
				if (string.IsNullOrEmpty(BeforeText) || string.IsNullOrEmpty(AfterText))
				{
					return null;
				}
				List<string> files = new List<string>();
				string logPath = null;
				if (UplodaLogs)
				{
					logPath = GetLogs();
					GetBrowserLog(ref files);
					files.Add(logPath);
				}
				bool value = await SubmitAsync(files);
				GlobalFun.TryDeleteFile(logPath);
				return value;
			}
			catch
			{
				return false;
			}
			finally
			{
				Interlocked.Exchange(ref interlocker, 0L);
			}
		}

		private string GetLogs()
		{
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "logs");
			string text = DateTime.Now.ToString("yyyy-MM-dd");
			string text2 = Path.Combine(path, text + ".log.dpapi");
			LogAesDecrypt val = new LogAesDecrypt();
			string text3 = Path.Combine(path, text + ".decrpyt.log");
			if (val.Decrypt2File(text2, text3))
			{
				return text3;
			}
			return null;
		}

		private void GetBrowserLog(ref List<string> files)
		{
			string text = Path.Combine(Path.GetTempPath(), "lmsatemp");
			if (!Directory.Exists(text))
			{
				Directory.CreateDirectory(text);
			}
			else
			{
				GlobalFun.DeleteFileInDirectory(text);
			}
			string chromiumLogFilePath = Configurations.ChromiumLogFilePath;
			if (File.Exists(chromiumLogFilePath))
			{
				string text2 = Path.Combine(text, DateTime.Now.ToString("yyyy-MM-dd") + "-browser.log");
				File.Copy(chromiumLogFilePath, text2, overwrite: true);
				files.Add(text2);
			}
		}

		public async Task<bool> SubmitAsync(List<string> files, int tryIndex = 0)
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			dictionary["clientVersion"] = WebApiContext.CLIENT_VERSION;
			dictionary.Add("rescueBeforeDesc", BeforeText);
			dictionary.Add("rescueAfterDesc", AfterText);
			dictionary.Add("modelName", modelName);
			dictionary.Add("windowsInfo", WebApiContext.WINDOWS_VERSION);
			return await ((ApiBaseService)new ApiService()).UploadAsync(WebApiUrl.COLLECTION_RESCUE_SUCCESS_LOG_UPLOAD, files, dictionary, false, true);
		}
	}
	public class TabletTurnOffView : UserControl, IMessageViewV6, IComponentConnector
	{
		internal LangTextBlock tbkTitle;

		internal TextBlock txtInfo;

		internal TextBlock txtInfo2;

		internal Image img;

		internal Button btnOk;

		private bool _contentLoaded;

		public UserControl View => (UserControl)(object)this;

		public Action<bool?> CloseAction { get; set; }

		public AutoResetEvent WaitHandler { get; }

		public bool? Result { get; set; }

		public TabletTurnOffView()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
		}

		public void Init(string title, string message, string image, string note)
		{
			//IL_0148: Unknown result type (might be due to invalid IL or missing references)
			//IL_014d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0155: Unknown result type (might be due to invalid IL or missing references)
			//IL_015b: Unknown result type (might be due to invalid IL or missing references)
			//IL_016a: Expected O, but got Unknown
			//IL_01b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_01be: Unknown result type (might be due to invalid IL or missing references)
			//IL_01cb: Expected O, but got Unknown
			//IL_0182: Unknown result type (might be due to invalid IL or missing references)
			//IL_0187: Unknown result type (might be due to invalid IL or missing references)
			//IL_018f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0195: Unknown result type (might be due to invalid IL or missing references)
			//IL_019f: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ac: Expected O, but got Unknown
			//IL_02c7: Unknown result type (might be due to invalid IL or missing references)
			//IL_02cc: Unknown result type (might be due to invalid IL or missing references)
			//IL_02d9: Expected O, but got Unknown
			//IL_0298: Unknown result type (might be due to invalid IL or missing references)
			//IL_029d: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a5: Unknown result type (might be due to invalid IL or missing references)
			//IL_02ab: Unknown result type (might be due to invalid IL or missing references)
			//IL_02ba: Expected O, but got Unknown
			((TextBlock)tbkTitle).Text = HostProxy.LanguageService.Translate(title);
			message = HostProxy.LanguageService.Translate(message);
			MatchCollection matchCollection = Regex.Matches(message, "_#[\\s\\S]*?_#");
			MatchCollection matchCollection2 = Regex.Matches(message, "__[\\s\\S]*?__");
			string[] array = message.Split(new string[2] { "_#", "__" }, StringSplitOptions.RemoveEmptyEntries);
			List<string> list = new List<string>();
			foreach (Match item in matchCollection)
			{
				list.Add(item.Value.Replace("_#", string.Empty));
			}
			List<string> list2 = new List<string>();
			foreach (Match item2 in matchCollection2)
			{
				list2.Add(item2.Value.Replace("__", string.Empty));
			}
			object obj = ((FrameworkElement)this).TryFindResource((object)"V6_HighLightBkgBrushKey");
			SolidColorBrush foreground = (SolidColorBrush)((obj is SolidColorBrush) ? obj : null);
			string[] array2 = array;
			foreach (string text in array2)
			{
				if (list.Contains(text))
				{
					((TextElementCollection<Inline>)(object)txtInfo.Inlines).Add((Inline)new Run
					{
						Text = text,
						FontWeight = FontWeight.FromOpenTypeWeight(500)
					});
				}
				else if (list2.Contains(text))
				{
					((TextElementCollection<Inline>)(object)txtInfo.Inlines).Add((Inline)new Run
					{
						Text = text,
						FontWeight = FontWeight.FromOpenTypeWeight(500),
						Foreground = (Brush)(object)foreground
					});
				}
				else
				{
					((TextElementCollection<Inline>)(object)txtInfo.Inlines).Add((Inline)new Run
					{
						Text = text
					});
				}
			}
			if (!string.IsNullOrEmpty(note))
			{
				note = HostProxy.LanguageService.Translate(note);
				matchCollection = Regex.Matches(note, "_#[\\s\\S]*?_#");
				array = note.Split(new string[1] { "_#" }, StringSplitOptions.RemoveEmptyEntries);
				list.Clear();
				foreach (Match item3 in matchCollection)
				{
					list.Add(item3.Value.Replace("_#", string.Empty));
				}
				array2 = array;
				foreach (string text2 in array2)
				{
					if (list.Contains(text2))
					{
						((TextElementCollection<Inline>)(object)txtInfo2.Inlines).Add((Inline)new Run
						{
							Text = text2,
							FontWeight = FontWeight.FromOpenTypeWeight(600)
						});
					}
					else
					{
						((TextElementCollection<Inline>)(object)txtInfo2.Inlines).Add((Inline)new Run
						{
							Text = text2
						});
					}
				}
			}
			if (!string.IsNullOrEmpty(image))
			{
				Image obj2 = img;
				object obj3 = Application.Current.Resources[(object)image];
				obj2.Source = (ImageSource)((obj3 is ImageSource) ? obj3 : null);
			}
		}

		private void OnBtnOk(object sender, RoutedEventArgs e)
		{
			Result = true;
			WaitHandler.Set();
			CloseAction?.Invoke(true);
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		public void InitializeComponent()
		{
			if (!_contentLoaded)
			{
				_contentLoaded = true;
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/tabletturnoffview.xaml", UriKind.Relative);
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
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Expected O, but got Unknown
			//IL_0047: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Expected O, but got Unknown
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected O, but got Unknown
			//IL_006b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				tbkTitle = (LangTextBlock)target;
				break;
			case 2:
				txtInfo = (TextBlock)target;
				break;
			case 3:
				txtInfo2 = (TextBlock)target;
				break;
			case 4:
				img = (Image)target;
				break;
			case 5:
				btnOk = (Button)target;
				((ButtonBase)btnOk).Click += new RoutedEventHandler(OnBtnOk);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
	public class Match3010View : Window, IMessageWindowV6, IComponentConnector
	{
		internal Image image;

		internal WarrantyInfoDetailV6 warranty;

		internal TextBlock txtLeft;

		internal TextBlock txtRight;

		internal LangButton btnok;

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

		public Match3010View(DevCategory category, string modelName, string number, object wModel)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Expected O, but got Unknown
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			WarrantyInfoBaseModel val = (WarrantyInfoBaseModel)((wModel is WarrantyInfoBaseModel) ? wModel : null);
			((FrameworkElement)warranty).DataContext = (object)new WarrantyInfoViewModelV6(val);
			switch (category)
			{
			case DevCategory.Tablet:
			{
				Image obj5 = image;
				object obj6 = Application.Current.Resources[(object)"v6_warranty_tabletnew"];
				obj5.Source = (ImageSource)((obj6 is ImageSource) ? obj6 : null);
				break;
			}
			case DevCategory.Smart:
			{
				Image obj3 = image;
				object obj4 = Application.Current.Resources[(object)"v6_warranty_smartnew"];
				obj3.Source = (ImageSource)((obj4 is ImageSource) ? obj4 : null);
				break;
			}
			default:
			{
				Image obj = image;
				object obj2 = Application.Current.Resources[(object)"v6_warranty_phonenew"];
				obj.Source = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
				break;
			}
			}
			string text = ((category == DevCategory.Phone) ? "K0079" : "K0082");
			txtLeft.Text = HostProxy.LanguageService.Translate("K0087") + ": " + modelName;
			txtRight.Text = HostProxy.LanguageService.Translate(text) + ": " + number;
			if (!string.IsNullOrEmpty((val != null) ? val.ShipLocation : null))
			{
				TextBlock val2 = txtLeft;
				val2.Text = val2.Text + "\n" + HostProxy.LanguageService.Translate("K0270") + ": " + val.ShipLocation;
			}
			((UIElement)btnok).IsEnabled = true;
		}

		private void OnBtnClick(object sender, RoutedEventArgs e)
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/dialog/match3010view.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Expected O, but got Unknown
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Expected O, but got Unknown
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Expected O, but got Unknown
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_006d: Expected O, but got Unknown
			//IL_0070: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Expected O, but got Unknown
			//IL_0087: Unknown result type (might be due to invalid IL or missing references)
			//IL_0091: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClick);
				break;
			case 2:
				image = (Image)target;
				break;
			case 3:
				warranty = (WarrantyInfoDetailV6)target;
				break;
			case 4:
				txtLeft = (TextBlock)target;
				break;
			case 5:
				txtRight = (TextBlock)target;
				break;
			case 6:
				btnok = (LangButton)target;
				((ButtonBase)btnok).Click += new RoutedEventHandler(OnBtnClick);
				break;
			default:
				_contentLoaded = true;
				break;
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.flash.ViewV6.Control
{
	public class RescueMatchComboBox : UserControl, IComponentConnector
	{
		public static readonly DependencyProperty IsSearchableProperty = DependencyProperty.Register("IsSearchable", typeof(bool), typeof(RescueMatchComboBox), (PropertyMetadata)new UIPropertyMetadata((object)true));

		private bool _contentLoaded;

		[DefaultValue(true)]
		public bool IsSearchable
		{
			get
			{
				return (bool)((DependencyObject)this).GetValue(IsSearchableProperty);
			}
			set
			{
				((DependencyObject)this).SetValue(IsSearchableProperty, (object)value);
			}
		}

		public RescueMatchComboBox()
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/viewv6/control/rescuematchcombobox.xaml", UriKind.Relative);
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
namespace lenovo.mbg.service.lmsa.flash.UserModelV2
{
	[Serializable]
	public class ConnectStepsModel
	{
		public int Index { get; set; }

		public string Title { get; set; }

		public string Layout { get; set; }

		public string Image { get; set; }

		public string Content { get; set; }
	}
	public class DeviceInfoItemViewModel : ViewModelBase
	{
		private string title;

		private string content = "K0470".ToString();

		private Visibility copyButtonVisibility = (Visibility)2;

		private bool isOddRow;

		private Visibility itemVisibility;

		private bool copiedVisibility;

		private ReplayCommand copyCommand;

		public string DateTemplateTag { get; set; }

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
					((NotifyBase)this).OnPropertyChanged("Title");
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
				if (string.IsNullOrEmpty(value) || value.Equals("unknown", StringComparison.CurrentCultureIgnoreCase))
				{
					ItemVisibility = (Visibility)2;
					content = "K0470".ToString();
				}
				else
				{
					ItemVisibility = (Visibility)0;
					content = value;
				}
				((NotifyBase)this).OnPropertyChanged("Content");
			}
		}

		public Visibility CopyVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return copyButtonVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (copyButtonVisibility != value)
				{
					copyButtonVisibility = value;
					((NotifyBase)this).OnPropertyChanged("CopyVisibility");
				}
			}
		}

		public bool IsOddRow
		{
			get
			{
				return isOddRow;
			}
			set
			{
				if (isOddRow != value)
				{
					isOddRow = value;
					((NotifyBase)this).OnPropertyChanged("IsOddRow");
				}
			}
		}

		public Visibility ItemVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return itemVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (itemVisibility != value)
				{
					itemVisibility = value;
					((NotifyBase)this).OnPropertyChanged("ItemVisibility");
				}
			}
		}

		public bool CopiedVisibility
		{
			get
			{
				return copiedVisibility;
			}
			set
			{
				if (copiedVisibility != value)
				{
					copiedVisibility = value;
					((NotifyBase)this).OnPropertyChanged("CopiedVisibility");
				}
			}
		}

		public ReplayCommand CopyCommand
		{
			get
			{
				return copyCommand;
			}
			set
			{
				if (copyCommand != value)
				{
					copyCommand = value;
					((NotifyBase)this).OnPropertyChanged("CopyCommand");
				}
			}
		}

		public DeviceInfoItemViewModel()
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Expected O, but got Unknown
			CopyCommand = new ReplayCommand((Action<object>)CopyCommandHandler);
		}

		public virtual void Clear()
		{
			Content = string.Empty;
		}

		protected virtual void CopyCommandHandler(object args)
		{
			try
			{
				Clipboard.SetDataObject((object)Content);
				CopiedVisibility = true;
				Task.Factory.StartNew(delegate
				{
					Thread.Sleep(800);
					CopiedVisibility = false;
				});
			}
			catch
			{
			}
		}
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
	}
	[Serializable]
	public class DeviceModelInfoListModel
	{
		[JsonProperty("models")]
		public List<DeviceModelInfoModel> ModelList { get; set; }

		[JsonProperty("moreModels")]
		public List<DeviceModelInfoModel> MoreModelList { get; set; }
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
	public class DeviceViewModel : ViewModelBase
	{
		private string id;

		private string modelName;

		private string imei;

		private string status;

		private string statusKey;

		private bool isMotorola;

		private bool isSelected;

		private bool isEnabled;

		private double opacity = 1.0;

		private double percentage;

		private bool isRescuing;

		private bool needOperator;

		private IAMatchView view;

		private bool showTip;

		public DevCategory Category { get; set; }

		public string Id
		{
			get
			{
				return id;
			}
			set
			{
				id = value;
				((NotifyBase)this).OnPropertyChanged("Id");
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
				modelName = value;
				((NotifyBase)this).OnPropertyChanged("ModelName");
			}
		}

		public string IMEI
		{
			get
			{
				return imei;
			}
			set
			{
				imei = value;
				((NotifyBase)this).OnPropertyChanged("IMEI");
			}
		}

		public string StatusKey
		{
			get
			{
				return statusKey;
			}
			set
			{
				statusKey = value;
				((NotifyBase)this).OnPropertyChanged("StatusKey");
			}
		}

		public string Status
		{
			get
			{
				return status;
			}
			set
			{
				status = value;
				((NotifyBase)this).OnPropertyChanged("Status");
			}
		}

		public bool IsMotorola
		{
			get
			{
				return isMotorola;
			}
			set
			{
				isMotorola = value;
				((NotifyBase)this).OnPropertyChanged("IsMotorola");
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
				((NotifyBase)this).OnPropertyChanged("IsEnabled");
			}
		}

		public bool ShowTip
		{
			get
			{
				return showTip;
			}
			set
			{
				showTip = value;
				((NotifyBase)this).OnPropertyChanged("ShowTip");
			}
		}

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

		public IAMatchView View
		{
			get
			{
				return view;
			}
			set
			{
				view = value;
				((NotifyBase)this).OnPropertyChanged("View");
			}
		}

		public double Opacity
		{
			get
			{
				return opacity;
			}
			set
			{
				opacity = value;
				((NotifyBase)this).OnPropertyChanged("Opacity");
			}
		}

		public double Percentage
		{
			get
			{
				return percentage;
			}
			set
			{
				percentage = value;
				((NotifyBase)this).OnPropertyChanged("Percentage");
			}
		}

		public bool IsRescuing
		{
			get
			{
				return isRescuing;
			}
			set
			{
				isRescuing = value;
				((NotifyBase)this).OnPropertyChanged("IsRescuing");
			}
		}

		public bool NeedOperator
		{
			get
			{
				return needOperator;
			}
			set
			{
				needOperator = value;
				((NotifyBase)this).OnPropertyChanged("NeedOperator");
			}
		}
	}
	public class HelperInfoModel : ViewModelBase
	{
		private bool _IsSelected;

		public string ItemText { get; set; }

		public string SelectionText { get; set; }

		public List<ImageSource> HelperImage { get; set; }

		public string Tips { get; set; }

		public bool IsSelected
		{
			get
			{
				return _IsSelected;
			}
			set
			{
				_IsSelected = value;
				((NotifyBase)this).OnPropertyChanged("IsSelected");
			}
		}
	}
	public class MatchInfo
	{
		[JsonConverter(typeof(StringEnumConverter))]
		public lenovo.mbg.service.lmsa.flash.ModelV6.MatchType matchType { get; set; }

		public object matchParams { get; set; }

		public object matchDevice { get; set; }

		public MatchInfo(lenovo.mbg.service.lmsa.flash.ModelV6.MatchType matchType, object matchParams, object matchDevice)
		{
			this.matchType = matchType;
			this.matchParams = matchParams;
			this.matchDevice = matchDevice;
		}

		public override string ToString()
		{
			return JsonHelper.SerializeObject2Json((object)this);
		}
	}
	public class RescueCollectionModel : RescueDeviceInfoModel
	{
		public string startRescueTime { get; set; }

		public string rescueTime { get; set; }

		public int rescueResult { get; set; }

		public string clientUuid { get; set; }

		public bool automatched { get; set; }

		public string errorMsg { get; set; }

		public int romMatchType { get; set; }

		public string version { get; set; }

		public string description { get; set; }

		public string resultDescription { get; set; }

		public string failureCode { get; set; }

		public int? orderId { get; set; }

		public RescueCollectionModel()
		{
		}

		public RescueCollectionModel(RescueDeviceInfoModel deviceInfo)
		{
			if (deviceInfo != null)
			{
				base.brand = deviceInfo.brand;
				base.category = deviceInfo.category;
				base.sn = deviceInfo.sn;
				base.imei = deviceInfo.imei;
				base.memory = deviceInfo.memory;
				base.country = deviceInfo.country;
				base.simCount = deviceInfo.simCount;
				base.hwCode = deviceInfo.hwCode;
				base.modelName = deviceInfo.modelName;
				base.fingerPrint = deviceInfo.fingerPrint;
				base.roCarrier = deviceInfo.roCarrier;
				base.fsgVersion = deviceInfo.fsgVersion;
				base.blurVersion = deviceInfo.blurVersion;
				base.softwareVersion = deviceInfo.softwareVersion;
				base.rescueMark = deviceInfo.rescueMark;
				base.channelId = deviceInfo.channelId;
				base.cid = deviceInfo.cid;
			}
		}
	}
	public class RescueDeviceInfoModel
	{
		public string brand { get; set; }

		public string category { get; set; }

		public string sn { get; set; }

		public string imei { get; set; }

		public string memory { get; set; }

		public string country { get; set; }

		public string simCount { get; set; }

		public string hwCode { get; set; }

		[JsonIgnore]
		public string marketName { get; set; }

		public string modelName { get; set; }

		public string fingerPrint { get; set; }

		public string roCarrier { get; set; }

		public string fsgVersion { get; set; }

		public string blurVersion { get; set; }

		public string softwareVersion { get; set; }

		public int rescueMark { get; set; }

		[JsonIgnore]
		public string securestate { get; set; }

		public string cid { get; set; }

		public string channelId { get; set; }

		public string romMatchId { get; set; }

		public string trackId { get; set; }

		public string fdr_allowed { get; set; }

		public string erase_personal_data { get; set; }

		[JsonIgnore]
		public string saleModel { get; set; }
	}
	[Serializable]
	public class ResourceRequestModel
	{
		private readonly Dictionary<string, string> _parametersMapping;

		public Dictionary<string, string> ParamsMapping => _parametersMapping;

		public string RequestParams => JsonHelper.SerializeObject2Json((object)_parametersMapping);

		public ResourceRequestModel()
		{
			_parametersMapping = new Dictionary<string, string>();
		}

		public void AddParameter(string key, string value)
		{
			_parametersMapping[key] = value;
		}

		public void Clear()
		{
			_parametersMapping.Clear();
		}

		public void RemoveParameter(string key)
		{
			if (_parametersMapping.ContainsKey(key))
			{
				_parametersMapping.Remove(key);
			}
		}

		public string GetParameter(string key)
		{
			if (_parametersMapping.ContainsKey(key))
			{
				return _parametersMapping[key];
			}
			return null;
		}
	}
	[Serializable]
	public class ResourceResponseModel
	{
		[JsonProperty("category")]
		public string Category { get; set; }

		[JsonProperty("brand")]
		public string Brand { get; set; }

		[JsonProperty("hwcode")]
		public string HWCode { get; set; }

		[JsonProperty("modelName")]
		public string ModelName { get; set; }

		[JsonProperty("realModelName")]
		public string RealModelName { get; set; }

		[JsonProperty("saleModel")]
		public string SalesModel { get; set; }

		[JsonProperty("flashFlow")]
		public string RecipeResource { get; set; }

		[JsonProperty("paramProperty")]
		public ParamProperty ParamProperty { get; set; }

		[JsonProperty("paramValues")]
		public List<string> ParamValues { get; set; }

		[JsonProperty("iconResource")]
		public ResourceModel IconResource { get; set; }

		[JsonProperty("toolResource")]
		public ResourceModel ToolResource { get; set; }

		[JsonProperty("romResource")]
		public ResourceModel RomResources { get; set; }

		[JsonProperty("countryCodeResource")]
		public ResourceModel CountryCode { get; set; }

		[JsonProperty("backUpPopup")]
		public bool IsShowBackupTip { get; set; }

		[JsonProperty("platform")]
		public string Platform { get; set; }

		public string fingerprint { get; set; }

		public string marketName { get; set; }

		public bool latest { get; set; }

		public string latestDesc { get; set; }

		public string comments { get; set; }

		public string romMatchId { get; set; }

		public bool fastboot { get; set; }

		[JsonProperty("paramProperties")]
		public List<ParamPropertyWithValues> ParamProperties { get; set; }
	}
	[Serializable]
	public class ResourceModel
	{
		[JsonProperty("name")]
		public string Name { get; set; }

		[JsonProperty("uri")]
		public string URI { get; set; }

		[JsonProperty("type")]
		public string Type { get; set; }

		[JsonProperty("unZip")]
		public bool UnZip { get; set; }

		[JsonProperty("md5")]
		public string MD5 { get; set; }

		[JsonProperty("clientBehavior")]
		public string ClientBehavior { get; set; }

		[JsonProperty("description")]
		public string Description { get; set; }

		public string UseExplan { get; set; }

		public int id { get; set; }

		public bool latest { get; set; }
	}
	[Serializable]
	public class ParamProperty
	{
		[JsonProperty("label")]
		public string PropertyName { get; set; }

		[JsonProperty("property")]
		public string PropertyValue { get; set; }
	}
	[Serializable]
	public class ParamPropertyWithValues
	{
		[JsonProperty("paramProperty")]
		public ParamProperty ParamProperty { get; set; }

		[JsonProperty("paramValues")]
		public List<string> ParamValues { get; set; }
	}
	public class SmartCategoryModel
	{
		public int id { get; set; }

		public string name { get; set; }

		public string imgPath { get; set; }

		public List<SmartMarketNameModel> marketNames { get; set; }

		public ImageSource Image
		{
			get
			{
				//IL_000d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				//IL_0018: Unknown result type (might be due to invalid IL or missing references)
				//IL_002a: Unknown result type (might be due to invalid IL or missing references)
				//IL_0031: Expected O, but got Unknown
				if (!string.IsNullOrEmpty(imgPath))
				{
					BitmapImage val = new BitmapImage();
					val.BeginInit();
					val.UriSource = new Uri(imgPath, UriKind.Absolute);
					val.EndInit();
					return (ImageSource)val;
				}
				return null;
			}
		}
	}
	public class SmartMarketNameModel
	{
		[JsonProperty("marketName")]
		public string MarketName { get; set; }

		public string marketImgPath { get; set; }

		[JsonProperty("readSupport")]
		public bool ReadSupport { get; set; }

		public ImageSource Image
		{
			get
			{
				//IL_000d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0012: Unknown result type (might be due to invalid IL or missing references)
				//IL_0018: Unknown result type (might be due to invalid IL or missing references)
				//IL_002a: Unknown result type (might be due to invalid IL or missing references)
				//IL_0031: Expected O, but got Unknown
				if (!string.IsNullOrEmpty(marketImgPath))
				{
					BitmapImage val = new BitmapImage();
					val.BeginInit();
					val.UriSource = new Uri(marketImgPath, UriKind.Absolute);
					val.EndInit();
					return (ImageSource)val;
				}
				return null;
			}
		}
	}
	[Serializable]
	public class StepTipsResponseModel
	{
		[JsonProperty("key")]
		public string TipsKey { get; set; }

		[JsonProperty("value")]
		public string TipsContent { get; set; }

		[JsonProperty("description")]
		public string TipsTitle { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.flash.UserConverters
{
	public class DetailButtonVisibleConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			Visibility val = (Visibility)0;
			if (value != null && "-1" == value.ToString())
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
	public class IntToVisibleConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			bool flag = true;
			if (value != null && "-1" == value.ToString())
			{
				flag = false;
			}
			return flag;
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
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
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
	public class SmartDeviceImageConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Expected O, but got Unknown
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_001b: Expected O, but got Unknown
			if (value != null && (bool)value)
			{
				return (object)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Resources/icSmartdevice-check.png"));
			}
			return (object)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Resources/icSmartdevice-un-check.png"));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public sealed class IsReadlyToVisibilityConvert : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			try
			{
				bool flag = (bool)value;
				string[] array = parameter.ToString().Split(new char[1] { ':' });
				return (bool.Parse(array[0]) == flag) ? array[1] : array[2];
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
	public class ProgressBarPercentMultivalueConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values == null || values.Length != 3)
			{
				return "0 %";
			}
			for (int i = 0; i < values.Length; i++)
			{
				if (values[i] == values)
				{
					return "0 %";
				}
			}
			double result = 0.0;
			if (!double.TryParse(values[0].ToString(), out result))
			{
				return "0 %";
			}
			double result2 = 0.0;
			if (!double.TryParse(values[1].ToString(), out result2))
			{
				return "0 %";
			}
			double result3 = 0.0;
			if (!double.TryParse(values[2].ToString(), out result3))
			{
				return "0 %";
			}
			if (result3 >= result)
			{
				return "100 %";
			}
			double num = result - result2;
			if (num == 0.0)
			{
				return "0 %";
			}
			return $"{Math.Round(result3 / num * 100.0)} %";
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class ProgressPercentMarginConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
			double result = 0.0;
			double result2 = 0.0;
			double num = 0.0;
			if (values != null && values.Length == 2)
			{
				double.TryParse(values[0].ToString(), out result);
				double.TryParse(values[1].ToString(), out result2);
			}
			num = ((result2 != 1.0) ? (result * result2 - 13.0) : (result - 22.0));
			if (num >= result - 22.0)
			{
				num = result - 22.0;
			}
			return (object)new Thickness(num, 0.0, 0.0, 0.0);
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	public class RescueBool2VisibileConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return (object)(Visibility)2;
			}
			bool flag = (bool)value;
			if (parameter != null)
			{
				string[] array = parameter.ToString().Split(new char[1] { ':' });
				if (!bool.Parse(array[0]))
				{
					_ = array[2];
				}
				else
				{
					_ = array[1];
				}
				if (!value.ToString().Equals(array[0], StringComparison.InvariantCultureIgnoreCase))
				{
					return array[2];
				}
				return array[1];
			}
			return (object)(Visibility)((!flag) ? 2 : 0);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
}
namespace lenovo.mbg.service.lmsa.flash.Tutorials
{
	public class TutorialsWindow : Window, IMessageWindowV6, IComponentConnector, IStyleConnector
	{
		private bool isWifiTutorial;

		internal LangTextBlock txtTitle;

		internal ListView lv;

		internal Image qrCode;

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

		public TutorialsWindow()
		{
			InitializeComponent();
			WaitHandler = new AutoResetEvent(initialState: false);
			isWifiTutorial = false;
			((Window)this).WindowStartupLocation = (WindowStartupLocation)2;
			((Window)this).Owner = Application.Current.MainWindow;
			((FrameworkElement)lv).Tag = HostProxy.LanguageService.IsChinaRegionAndLanguage();
		}

		private void MouseLeftButtonDownHandler(object sender, MouseButtonEventArgs e)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Invalid comparison between Unknown and I4
			if ((int)((MouseEventArgs)e).LeftButton == 1)
			{
				((Window)this).DragMove();
			}
		}

		public void SetWifiTutorial()
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002d: Expected O, but got Unknown
			isWifiTutorial = true;
			txtTitle.LangKey = "K1464";
			HostProxy.deviceManager.WifiMonitoringEndPointChanged += new WirelessMornitoringAddressChangedHandler(OnWifiMonitoringEndPointChanged);
			OnWifiMonitoringEndPointChanged(HostProxy.deviceManager.WirelessWaitForConnectEndPoints);
			GlobalCmdHelper.Instance.CloseWifiTutorialEvent = delegate
			{
				((DispatcherObject)this).Dispatcher.Invoke((Action)delegate
				{
					OnBtnClose(null, null);
					GlobalCmdHelper.Instance.CloseWifiTutorialEvent = null;
				});
			};
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
					qrCode.Source = (ImageSource)(object)val;
				}, Array.Empty<object>());
			}
			catch
			{
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

		private void OnBtnClose(object sender, RoutedEventArgs e)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Expected O, but got Unknown
			HostProxy.deviceManager.WifiMonitoringEndPointChanged -= new WirelessMornitoringAddressChangedHandler(OnWifiMonitoringEndPointChanged);
			Result = true;
			((Window)this).Close();
		}

		private void OnSelectedChanged(object sender, SelectionChangedEventArgs e)
		{
			ListView val = (ListView)((sender is ListView) ? sender : null);
			if (isWifiTutorial)
			{
				if (((Selector)val).SelectedIndex == 3)
				{
					((UIElement)qrCode).Visibility = (Visibility)0;
				}
				else
				{
					((UIElement)qrCode).Visibility = (Visibility)2;
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
				Uri uri = new Uri("/lenovo.mbg.service.lmsa.flash;component/tutorials/tutorialswindow.xaml", UriKind.Relative);
				Application.LoadComponent((object)this, uri);
			}
		}

		[DebuggerNonUserCode]
		[GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		void IComponentConnector.Connect(int connectionId, object target)
		{
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_002f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0039: Expected O, but got Unknown
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Expected O, but got Unknown
			//IL_0049: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Expected O, but got Unknown
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Expected O, but got Unknown
			//IL_006c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0078: Unknown result type (might be due to invalid IL or missing references)
			//IL_0082: Expected O, but got Unknown
			//IL_0085: Unknown result type (might be due to invalid IL or missing references)
			//IL_008f: Expected O, but got Unknown
			switch (connectionId)
			{
			case 1:
				((UIElement)(Border)target).MouseLeftButtonDown += new MouseButtonEventHandler(MouseLeftButtonDownHandler);
				break;
			case 2:
				txtTitle = (LangTextBlock)target;
				break;
			case 3:
				lv = (ListView)target;
				((Selector)lv).SelectionChanged += new SelectionChangedEventHandler(OnSelectedChanged);
				break;
			case 5:
				((ButtonBase)(Button)target).Click += new RoutedEventHandler(OnBtnClose);
				break;
			case 6:
				qrCode = (Image)target;
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
			if (connectionId == 4)
			{
				EventSetter val = new EventSetter();
				val.Event = ListBoxItem.SelectedEvent;
				val.Handler = (Delegate)new RoutedEventHandler(ListViewItemSelected);
				((Collection<SetterBase>)(object)((Style)target).Setters).Add((SetterBase)(object)val);
			}
		}
	}
	public class TutorialsWindowViewModel : ViewModelBase
	{
		private TutorialDefineModel m_StartModel;

		private TutorialDefineModel currentModel;

		private bool _IsPrevBtnEnable;

		private bool _IsNextBtnEnable = true;

		private bool nextEnable;

		public object Tag { get; private set; }

		public TutorialDefineModel CurrentModel
		{
			get
			{
				return currentModel;
			}
			set
			{
				currentModel = value;
				((NotifyBase)this).OnPropertyChanged("CurrentModel");
			}
		}

		public ReplayCommand CloseCommand { get; private set; }

		public ReplayCommand NextCommand { get; private set; }

		public ReplayCommand PreviousCommand { get; private set; }

		public ReplayCommand RadioClickCommand { get; private set; }

		public ReplayCommand GoBackCommand { get; private set; }

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

		public bool NextEnable
		{
			get
			{
				return nextEnable;
			}
			set
			{
				nextEnable = value;
				((NotifyBase)this).OnPropertyChanged("NextEnable");
			}
		}

		private Action<object> customerNextCommand { get; set; }

		private Action<object> customerPrevCommand { get; set; }

		public TutorialsWindowViewModel()
			: this(null, null)
		{
		}

		public TutorialsWindowViewModel(Action<object> customerNextCommand, Action<object> customerPrevCommand)
		{
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Expected O, but got Unknown
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Expected O, but got Unknown
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Expected O, but got Unknown
			//IL_005f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Expected O, but got Unknown
			//IL_0076: Unknown result type (might be due to invalid IL or missing references)
			//IL_0080: Expected O, but got Unknown
			CloseCommand = new ReplayCommand((Action<object>)CloseCommandHandler);
			NextCommand = new ReplayCommand((Action<object>)NextCommandHandler);
			PreviousCommand = new ReplayCommand((Action<object>)PreviousCommandHandler);
			RadioClickCommand = new ReplayCommand((Action<object>)RadioClickCommandHandler);
			GoBackCommand = new ReplayCommand((Action<object>)GoBackCommandHandler);
			this.customerNextCommand = customerNextCommand ?? new Action<object>(NextCommandAction);
			this.customerPrevCommand = customerPrevCommand ?? new Action<object>(PrevCommandAction);
		}

		public TutorialsWindowViewModel Inititalize(TutorialDefineModel currentModel, object tag)
		{
			Tag = tag;
			CurrentModel = currentModel;
			m_StartModel = currentModel;
			if (CurrentModel is StartTutorial)
			{
				IsNextBtnEnable = false;
			}
			else
			{
				IsNextBtnEnable = true;
			}
			return this;
		}

		private void NextCommandAction(object data)
		{
			//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d5: Invalid comparison between Unknown and I4
			if (data == null)
			{
				return;
			}
			TutorialsBaseModel tutorialsBaseModel = data as TutorialsBaseModel;
			if (tutorialsBaseModel.NextModel != null)
			{
				tutorialsBaseModel.NextModel.Steps.ForEach(delegate(TutorialsBaseModel n)
				{
					n.IsSelected = false;
				});
				tutorialsBaseModel.NextModel.Steps[0].IsSelected = true;
				CurrentModel = tutorialsBaseModel.NextModel;
				IsPrevBtnEnable = false;
				return;
			}
			int index = CurrentModel.Steps.IndexOf(tutorialsBaseModel);
			TutorialsBaseModel nextStep = CurrentModel.GetNextStep(index);
			if (nextStep != null)
			{
				int num = CurrentModel.Steps.IndexOf(nextStep);
				if (nextStep.IsManual)
				{
					IsNextBtnEnable = false;
				}
				else
				{
					IsNextBtnEnable = num < CurrentModel.Steps.Count - 1;
				}
				if ((int)nextStep.RadioTitleVisibility == 2)
				{
					IsPrevBtnEnable = true;
					tutorialsBaseModel.IsSelected = false;
					nextStep.IsSelected = true;
				}
			}
		}

		private void PrevCommandAction(object data)
		{
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0093: Invalid comparison between Unknown and I4
			TutorialsBaseModel tutorialsBaseModel = data as TutorialsBaseModel;
			int index = CurrentModel.Steps.IndexOf(tutorialsBaseModel);
			TutorialsBaseModel prevStep = CurrentModel.GetPrevStep(index);
			if (prevStep == null)
			{
				if (CurrentModel.PreviousModel != null)
				{
					CurrentModel = CurrentModel.PreviousModel;
				}
				return;
			}
			int num = CurrentModel.Steps.IndexOf(prevStep);
			IsPrevBtnEnable = num != 0 || CurrentModel.PreviousModel != null;
			if (prevStep.IsManual)
			{
				IsNextBtnEnable = false;
			}
			else
			{
				IsNextBtnEnable = true;
			}
			if ((int)prevStep.RadioTitleVisibility == 2)
			{
				tutorialsBaseModel.IsSelected = false;
				prevStep.IsSelected = true;
			}
		}

		private void RadioClickCommandHandler(object data)
		{
			if (data != null)
			{
				TutorialsBaseModel tutorialsBaseModel = data as TutorialsBaseModel;
				int num = CurrentModel.Steps.IndexOf(tutorialsBaseModel);
				IsPrevBtnEnable = num != 0 || CurrentModel.PreviousModel != null;
				if (tutorialsBaseModel.IsManual && num == 0)
				{
					IsNextBtnEnable = false;
				}
				else if (!tutorialsBaseModel.IsManual && num == CurrentModel.Steps.Count - 1)
				{
					IsNextBtnEnable = false;
				}
				else
				{
					IsNextBtnEnable = true;
				}
			}
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
			customerNextCommand(data);
		}

		private void PreviousCommandHandler(object data)
		{
			customerPrevCommand(data);
		}

		private void GoBackCommandHandler(object data)
		{
			CurrentModel = m_StartModel;
			IsPrevBtnEnable = true;
			IsNextBtnEnable = true;
		}
	}
}
namespace lenovo.mbg.service.lmsa.flash.Tutorials.Resources
{
	public static class TutorialsResources
	{
		[StructLayout(LayoutKind.Sequential, Size = 1)]
		public struct StringResource
		{
			public static string First_Title_1 = "1.";

			public static string First_Title_2 = "2.";

			public static string First_Title_3 = "3.";

			public static string First_Title_4 = "4.";

			public static string First_Title_5 = "5.";

			public static string First_Title_6 = "6.";

			public static string First_Title_7 = "7.";

			public static string First_Title_8 = "8.";

			public static string First_Title_9 = "9.";

			public static string First_Title_10 = "10.";

			public static string First_Title_11 = "11.";

			public static string Start_01 = "K0954";

			public static string Start_02 = "K0928";

			public static string Start_03 = "K0930";

			public static string Start_04 = "K0961";

			public static string Start_05 = "K0955";

			public static string Start_06 = "K0956";

			public static string Start_07 = "K0957";

			public static string Start_08 = "K0958";

			public static string Start_09 = "K0956";

			public static string Start_10 = "K0959";

			public static string Start_11 = "K0960";

			public static string Start_12 = "K0956";
		}

		[StructLayout(LayoutKind.Sequential, Size = 1)]
		public struct ImageResources
		{
			public static ImageSource rescue_start_tutorials1
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials1"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials2
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials2"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials3
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials3"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials4
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials4"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials5
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials5"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials6
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials6"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials7
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials7"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials8
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials8"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials9
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials9"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials10
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials10"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials11
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials11"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials12
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials12"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials13
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials13"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials14
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials14"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials15
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials15"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials16
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials16"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials17
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials17"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials18
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials18"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials19
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials19"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials20
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials20"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials21
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials21"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials22
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials22"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials23
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials23"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials24
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials24"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials25
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials25"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials26
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials26"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials27
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials27"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials28
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials28"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials29
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials29"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials30
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials30"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials31
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials31"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials32
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials32"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials33
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials33"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials34
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials34"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials35
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials35"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials36
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials36"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}

			public static ImageSource rescue_start_tutorials37
			{
				get
				{
					object obj = Application.Current.Resources[(object)"rescue_start_tutorials37"];
					return (ImageSource)((obj is ImageSource) ? obj : null);
				}
			}
		}
	}
}
namespace lenovo.mbg.service.lmsa.flash.Tutorials.RescueTutorials
{
	public class RescueTutorial : TutorialDefineModel
	{
		public RescueTutorial(DevCategory category, Visibility backBtnVisibility = (Visibility)2)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_02c8: Unknown result type (might be due to invalid IL or missing references)
			//IL_02d2: Expected O, but got Unknown
			//IL_030a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0314: Expected O, but got Unknown
			//IL_0345: Unknown result type (might be due to invalid IL or missing references)
			//IL_034f: Expected O, but got Unknown
			//IL_0380: Unknown result type (might be due to invalid IL or missing references)
			//IL_038a: Expected O, but got Unknown
			//IL_03bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_03c5: Expected O, but got Unknown
			//IL_01d0: Unknown result type (might be due to invalid IL or missing references)
			//IL_01da: Expected O, but got Unknown
			//IL_01e5: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ef: Expected O, but got Unknown
			//IL_0227: Unknown result type (might be due to invalid IL or missing references)
			//IL_0231: Expected O, but got Unknown
			//IL_023c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0246: Expected O, but got Unknown
			//IL_0277: Unknown result type (might be due to invalid IL or missing references)
			//IL_0281: Expected O, but got Unknown
			//IL_028c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0296: Expected O, but got Unknown
			base.BackBtnVisbility = backBtnVisibility;
			base.Steps = new List<TutorialsBaseModel>();
			switch (category)
			{
			case DevCategory.Phone:
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_1,
					Content = "K1176",
					TipImage = TutorialsResources.ImageResources.rescue_start_tutorials16,
					TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials17,
					IsSelected = true
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_2,
					Content = "K0955",
					TipImage = TutorialsResources.ImageResources.rescue_start_tutorials18,
					TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials19
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_3,
					Content = TutorialsResources.StringResource.Start_12,
					TipImage = TutorialsResources.ImageResources.rescue_start_tutorials20,
					TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials21
				});
				break;
			case DevCategory.Tablet:
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_1,
					Content = "K1176",
					TipImage = TutorialsResources.ImageResources.rescue_start_tutorials22,
					TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials23,
					IsSelected = true
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_2,
					Content = "K0960",
					TipImage = TutorialsResources.ImageResources.rescue_start_tutorials24,
					TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials25
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_3,
					Content = TutorialsResources.StringResource.Start_12,
					TipImage = TutorialsResources.ImageResources.rescue_start_tutorials26,
					TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials27
				});
				break;
			case DevCategory.Smart:
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_1,
					Content = "K1176",
					TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Tutorials/Themes/Images/guide-smart-01.png")),
					TipImagePartDetail = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Tutorials/Themes/Images/guide-smart-01b.png")),
					IsSelected = true
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_2,
					Content = "K1291",
					TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Tutorials/Themes/Images/guide-smart-02.png")),
					TipImagePartDetail = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Tutorials/Themes/Images/guide-smart-02b.png"))
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = TutorialsResources.StringResource.First_Title_3,
					Content = TutorialsResources.StringResource.Start_12,
					TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Tutorials/Themes/Images/guide-smart-03.png")),
					TipImagePartDetail = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Tutorials/Themes/Images/guide-smart-03b.png"))
				});
				break;
			default:
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = "1.",
					Content = "K1455",
					TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/Wifi1.png")),
					IsSelected = true
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = "2.",
					Content = "K1456",
					TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/Wifi2.png"))
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = "3.",
					Content = "K1457",
					TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/Wifi3.png"))
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = "4.",
					Content = "K1458",
					TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/Wifi4.png"))
				});
				base.Steps.Add(new TutorialsBaseModel
				{
					FirstTitle = "5.",
					Content = "K1461",
					TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/ResourceV6/Wifi5.png"))
				});
				break;
			}
		}
	}
	internal class StartTutorial : TutorialDefineModel
	{
		public StartTutorial()
		{
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Expected O, but got Unknown
			//IL_0098: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a2: Expected O, but got Unknown
			base.Steps = new List<TutorialsBaseModel>();
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_1,
				Content = TutorialsResources.StringResource.Start_01,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials1,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials2,
				IsManual = true,
				IsSelected = true
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				RadioTitleVisibility = (Visibility)0,
				Content = TutorialsResources.StringResource.Start_02,
				TipImage = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Tutorials/Themes/Images/5.png")),
				TipImagePartDetail = (ImageSource)new BitmapImage(new Uri("pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Tutorials/Themes/Images/5b.png")),
				IsManual = true,
				NextModel = new RescueTutorial(DevCategory.Phone, (Visibility)0)
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				RadioTitleVisibility = (Visibility)0,
				Content = TutorialsResources.StringResource.Start_03,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials10,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials11,
				IsManual = true,
				NextModel = new RescueTutorial(DevCategory.Tablet, (Visibility)0)
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				RadioTitleVisibility = (Visibility)0,
				Content = "K1290",
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials32,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials33,
				IsManual = true,
				NextModel = new RescueTutorial(DevCategory.Smart, (Visibility)0)
			});
		}
	}
	public class PhoneRescueTutorial : TutorialDefineModel
	{
		public PhoneRescueTutorial(TutorialDefineModel pre)
		{
			PreviousModel = pre;
			base.Steps = new List<TutorialsBaseModel>();
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_1,
				Content = TutorialsResources.StringResource.Start_04,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials3,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials4,
				IsSelected = true
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_2,
				Content = TutorialsResources.StringResource.Start_05,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials6,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials7
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_3,
				Content = TutorialsResources.StringResource.Start_06,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials8,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials9
			});
		}
	}
	public class TabletRescueTutorial : TutorialDefineModel
	{
		public TabletRescueTutorial(TutorialDefineModel pre)
		{
			PreviousModel = pre;
			base.Steps = new List<TutorialsBaseModel>();
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_1,
				Content = TutorialsResources.StringResource.Start_10,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials10,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials11,
				IsSelected = true
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_2,
				Content = TutorialsResources.StringResource.Start_11,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials12,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials13
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_3,
				Content = TutorialsResources.StringResource.Start_12,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials14,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials15
			});
		}
	}
	public class SmartDeviceRescueTutorial : TutorialDefineModel
	{
		public SmartDeviceRescueTutorial(TutorialDefineModel pre)
		{
			PreviousModel = pre;
			base.Steps = new List<TutorialsBaseModel>();
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_1,
				Content = "K1292",
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials32,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials33,
				IsSelected = true
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_2,
				Content = "K1291",
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials34,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials35
			});
			base.Steps.Add(new TutorialsBaseModel
			{
				FirstTitle = TutorialsResources.StringResource.First_Title_3,
				Content = TutorialsResources.StringResource.Start_12,
				TipImage = TutorialsResources.ImageResources.rescue_start_tutorials36,
				TipImagePartDetail = TutorialsResources.ImageResources.rescue_start_tutorials37
			});
		}
	}
}
namespace lenovo.mbg.service.lmsa.flash.Tutorials.Model
{
	public class TutorialDefineModel
	{
		public TutorialDefineModel NextModel;

		public TutorialDefineModel PreviousModel;

		public Visibility BackBtnVisbility { get; set; } = (Visibility)2;

		public List<TutorialsBaseModel> Steps { get; set; }

		public TutorialsBaseModel GetNextStep(int index)
		{
			TutorialsBaseModel result = null;
			if (index < Steps.Count - 1)
			{
				result = Steps[++index];
			}
			return result;
		}

		public TutorialsBaseModel GetPrevStep(int index)
		{
			TutorialsBaseModel result = null;
			if (index > 0)
			{
				result = Steps.Take(index).LastOrDefault((TutorialsBaseModel n) => (int)n.RadioTitleVisibility == 2);
			}
			return result;
		}
	}
	public class TutorialsBaseModel : ViewModelBase
	{
		private bool isSelected;

		private string firstTitle;

		private string secondTitle;

		private string content;

		private Visibility radioTitleVisibility = (Visibility)2;

		public ImageSource tipImage;

		public ImageSource tipImagePartDetail;

		public bool isMagnifyingGlass;

		private bool isManual;

		private bool haveSecondTitle;

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

		public string SecondTitle
		{
			get
			{
				return secondTitle;
			}
			set
			{
				secondTitle = value;
				if (!string.IsNullOrEmpty(value))
				{
					HaveSecondTitle = true;
				}
				((NotifyBase)this).OnPropertyChanged("SecondTitle");
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

		public Visibility RadioTitleVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return radioTitleVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0002: Unknown result type (might be due to invalid IL or missing references)
				radioTitleVisibility = value;
				((NotifyBase)this).OnPropertyChanged("RadioTitleVisibility");
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

		public ImageSource TipImagePartDetail
		{
			get
			{
				return tipImagePartDetail;
			}
			set
			{
				tipImagePartDetail = value;
				((NotifyBase)this).OnPropertyChanged("TipImagePartDetail");
			}
		}

		public bool IsMagnifyingGlass
		{
			get
			{
				return isMagnifyingGlass;
			}
			set
			{
				isMagnifyingGlass = value;
				((NotifyBase)this).OnPropertyChanged("IsMagnifyingGlass");
			}
		}

		public bool IsManual
		{
			get
			{
				return isManual;
			}
			set
			{
				isManual = value;
			}
		}

		public bool HaveSecondTitle
		{
			get
			{
				return haveSecondTitle;
			}
			set
			{
				haveSecondTitle = value;
				((NotifyBase)this).OnPropertyChanged("HaveSecondTitle");
			}
		}

		public TutorialDefineModel NextModel { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.flash.ModelV6
{
	public class DevCategoryModel : NotifyBase
	{
		private bool _IsSelected;

		private FrameworkElement _UiElement;

		public string CategoryName { get; set; }

		public DrawingImage NormalIcon { get; set; }

		public DrawingImage HoverIcon { get; set; }

		public DevCategory Category { get; set; }

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
				((NotifyBase)this).OnPropertyChanged("IsSelected");
			}
		}

		public PageIndex Index { get; set; }

		public FrameworkElement UiElement
		{
			get
			{
				return _UiElement;
			}
			set
			{
				_UiElement = value;
				((NotifyBase)this).OnPropertyChanged("UiElement");
			}
		}
	}
	public enum DevCategory
	{
		Phone,
		Tablet,
		Smart
	}
	public enum PageIndex
	{
		RESCUE_HOME,
		RESCUE_FLASH,
		PHONE_ENTRANCE,
		PHONE_SEARCH,
		PHONE_MANUAL,
		TABLET_ENTRANCE,
		TABLET_SEARCH,
		TABLET_MANUAL,
		TABLET_AUTO,
		SMART_SEARCH,
		SMART_MANUAL,
		SMART_AUTO
	}
	public enum MatchType
	{
		FASTBOOT,
		MANUAL,
		IMEI,
		ADB,
		SN,
		MANUAL_FASTBOOT,
		WIFI
	}
	public class LComboBoxViewModelV6 : NotifyBase
	{
		private Func<object, string, int> _ComboBoxFilter;

		private Visibility _ComboBoxMoreButtonVisibility;

		private bool _IsDropDownOpened;

		private ObservableCollection<ManualComboboxViewModel> _StepComboBoxItemSource;

		private bool _IsDropDownEnabled = true;

		private bool _IsDataLoading;

		private int _ComboBoxSelectedIndex;

		private object _ComboBoxSelectedValue;

		private string _ComboBoxWatermark;

		private bool _IsCanShow;

		public bool IsEditable { get; set; }

		public dynamic Tag { get; set; }

		public ICommand SetTopClickCommand { get; set; }

		public ICommand MouseEnterCommand { get; set; }

		public ICommand ComboBoxMoreButtonCommand { get; set; }

		public ICommand SelectionChangedCommand { get; set; }

		public ICommand ComboBoxTextChangedCommand { get; set; }

		public Action<object> ItemSelChangedActon { get; set; }

		public Action<bool> DropDownOpenedChanged { get; set; }

		public Func<object, string, int> ComboBoxFilter
		{
			get
			{
				return _ComboBoxFilter;
			}
			set
			{
				_ComboBoxFilter = value;
				((NotifyBase)this).OnPropertyChanged("ComboBoxFilter");
			}
		}

		public Visibility ComboBoxMoreButtonVisibility
		{
			get
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				return _ComboBoxMoreButtonVisibility;
			}
			set
			{
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_000b: Unknown result type (might be due to invalid IL or missing references)
				//IL_000c: Unknown result type (might be due to invalid IL or missing references)
				if (_ComboBoxMoreButtonVisibility != value)
				{
					_ComboBoxMoreButtonVisibility = value;
					((NotifyBase)this).OnPropertyChanged("ComboBoxMoreButtonVisibility");
				}
			}
		}

		public bool IsDropDownOpened
		{
			get
			{
				return _IsDropDownOpened;
			}
			set
			{
				if (_IsDropDownOpened != value)
				{
					_IsDropDownOpened = value;
					((NotifyBase)this).OnPropertyChanged("IsDropDownOpened");
					DropDownOpenedChanged?.Invoke(value);
				}
			}
		}

		public ObservableCollection<ManualComboboxViewModel> StepComboBoxItemSource
		{
			get
			{
				return _StepComboBoxItemSource;
			}
			set
			{
				_StepComboBoxItemSource = value;
				((NotifyBase)this).OnPropertyChanged("StepComboBoxItemSource");
			}
		}

		public bool IsDropDownEnabled
		{
			get
			{
				return _IsDropDownEnabled;
			}
			set
			{
				if (_IsDropDownEnabled != value)
				{
					_IsDropDownEnabled = value;
					((NotifyBase)this).OnPropertyChanged("IsDropDownEnabled");
				}
			}
		}

		public bool IsDataLoading
		{
			get
			{
				return _IsDataLoading;
			}
			set
			{
				_IsDataLoading = value;
				((NotifyBase)this).OnPropertyChanged("IsDataLoading");
			}
		}

		public int ComboBoxSelectedIndex
		{
			get
			{
				return _ComboBoxSelectedIndex;
			}
			set
			{
				_ComboBoxSelectedIndex = value;
				((NotifyBase)this).OnPropertyChanged("ComboBoxSelectedIndex");
			}
		}

		public object ComboBoxSelectedValue
		{
			get
			{
				return _ComboBoxSelectedValue;
			}
			set
			{
				IsDropDownOpened = false;
				if (_ComboBoxSelectedValue != value)
				{
					_ComboBoxSelectedValue = value;
					((NotifyBase)this).OnPropertyChanged("ComboBoxSelectedValue");
					ItemSelChangedActon?.Invoke(value);
				}
			}
		}

		public string ComboBoxWatermark
		{
			get
			{
				return _ComboBoxWatermark;
			}
			set
			{
				_ComboBoxWatermark = value;
				((NotifyBase)this).OnPropertyChanged("ComboBoxWatermark");
			}
		}

		public bool IsCanShow
		{
			get
			{
				return _IsCanShow;
			}
			set
			{
				_IsCanShow = value;
				((NotifyBase)this).OnPropertyChanged("IsCanShow");
			}
		}
	}
	public class ManualComboboxViewModel : NotifyBase
	{
		private string itemText;

		private object tab;

		private bool isUsed;

		public string ItemText
		{
			get
			{
				return itemText;
			}
			set
			{
				if (!(itemText == value))
				{
					itemText = value;
					((NotifyBase)this).OnPropertyChanged("ItemText");
				}
			}
		}

		public object Tag
		{
			get
			{
				return tab;
			}
			set
			{
				if (tab != value)
				{
					tab = value;
					((NotifyBase)this).OnPropertyChanged("Tag");
				}
			}
		}

		public bool IsUsed
		{
			get
			{
				return isUsed;
			}
			set
			{
				isUsed = value;
				((NotifyBase)this).OnPropertyChanged("IsUsed");
			}
		}

		public bool IsMore { get; set; }
	}
}
namespace lenovo.mbg.service.lmsa.flash.Common
{
	public class CheckFingerPrintVersion : ICheckVersion
	{
		public bool Check(string device, string config, Dictionary<string, string> aparams)
		{
			bool num = Process(device, config);
			if (!num && aparams != null)
			{
				CollectionDegradeInfo(aparams);
			}
			return num;
		}

		public void CollectionDegradeInfo(Dictionary<string, string> aparams)
		{
			FlashContext.SingleInstance.service.RequestContent(WebServicesContext.COLLECTION_DOWNGRADE_INFO, (object)aparams, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
		}

		private bool Process(string device, string config)
		{
			if (string.IsNullOrEmpty(device) || string.IsNullOrEmpty(config))
			{
				return true;
			}
			string text = ParseVersion(device);
			string text2 = ParseVersion(config);
			if (string.IsNullOrEmpty(text) || string.IsNullOrEmpty(text2))
			{
				return true;
			}
			LogHelper.LogInstance.Info("check fingerprint version, device version: " + device + ", config version: " + config, true);
			char c = text.ToUpperInvariant()[0];
			char c2 = text2.ToUpperInvariant()[0];
			if (c2 != c)
			{
				if (c2 < c)
				{
					LogHelper.LogInstance.Debug($"check fingerprint version, device version '{c}' is downgrade from config version '{c2}'", true);
					return false;
				}
				return true;
			}
			string alphas;
			List<int> device2 = PullVersionNumbers(text, out alphas);
			string alphas2;
			List<int> config2 = PullVersionNumbers(text2, out alphas2);
			if (alphas.Length < 3 || alphas2.Length < 3 || alphas.Substring(1, 2).ToLowerInvariant() != alphas2.Substring(1, 2).ToLowerInvariant())
			{
				return true;
			}
			if (text.Replace(alphas, string.Empty) == text2.Replace(alphas2, string.Empty))
			{
				if (text.Length > text2.Length)
				{
					LogHelper.LogInstance.Debug($"check fingerprint version, device version '{c}' is downgrade from config version '{c2}'", true);
					return false;
				}
				return true;
			}
			if (IsDownGrade(device2, config2))
			{
				LogHelper.LogInstance.Debug("check fingerprint version, device version '" + device + "' is downgrade from config version '" + config + "'", true);
				return false;
			}
			return true;
		}

		private string ParseVersion(string input)
		{
			string[] array = input.Split(new char[1] { '/' });
			if (array.Length > 3)
			{
				input = array[3].Trim();
			}
			Regex regex = new Regex("^[a-z]{3,4}[0-9]{2,3}\\.[a-z]?[0-9]+[a-z]?([-.][a-z]?[0-9]+)*", RegexOptions.IgnoreCase);
			string[] array2 = input.Split(new char[1] { ' ' });
			foreach (string text in array2)
			{
				if (regex.IsMatch(text))
				{
					return text;
				}
			}
			return null;
		}

		private List<int> PullVersionNumbers(string parsed, out string alphas)
		{
			List<char> list = new List<char>();
			list.Add('.');
			list.Add('-');
			alphas = string.Empty;
			string text = string.Empty;
			List<int> list2 = new List<int>();
			for (int i = 0; i < parsed.Length; i++)
			{
				char c = parsed[i];
				if (char.IsLetter(c))
				{
					alphas += c;
				}
				else if (char.IsDigit(c))
				{
					text += c;
				}
				else if (list.Contains(c) && text.Length > 0)
				{
					int item = int.Parse(text);
					list2.Add(item);
					text = string.Empty;
				}
			}
			if (text.Length > 0)
			{
				int item2 = int.Parse(text);
				list2.Add(item2);
				text = string.Empty;
			}
			alphas = alphas.Trim();
			return list2;
		}

		private bool IsDownGrade(List<int> device, List<int> config)
		{
			int count = device.Count;
			for (int i = 0; i < count; i++)
			{
				if (i >= config.Count)
				{
					return true;
				}
				int num = device[i];
				int num2 = config[i];
				if (num2 < num)
				{
					return true;
				}
				if (num2 > num)
				{
					return false;
				}
			}
			return false;
		}
	}
	public class DownloadResourcesManager
	{
		private readonly Dictionary<string, PackageDownloadModel> DownloadTasks = new Dictionary<string, PackageDownloadModel>();

		private static DownloadResourcesManager _resourceManager;

		public static DownloadResourcesManager SingleInstance
		{
			get
			{
				if (_resourceManager == null)
				{
					_resourceManager = new DownloadResourcesManager();
				}
				return _resourceManager;
			}
		}

		private DownloadResourcesManager()
		{
			HostProxy.DownloadServerV6.OnRemoteDownloadStatusChanged += delegate(object s, RemoteDownloadStatusEventArgs e)
			{
				HandleDownloadResult(e);
			};
		}

		public bool ResourceReadly(List<DownloadInfo> resources)
		{
			try
			{
				foreach (DownloadInfo resource in resources)
				{
					DownloadInfo downloadedResource = HostProxy.DownloadServerV6.GetDownloadedResource(resource.FileUrl);
					if (downloadedResource == null)
					{
						return false;
					}
					if (downloadedResource.FileType == "TOOL")
					{
						string text = Path.Combine(downloadedResource.LocalPath, Path.GetFileName(downloadedResource.FileName));
						if (!SevenZipHelper.Instance.CheckExtractorWithPwd(text, downloadedResource.ZipPwd))
						{
							LogHelper.LogInstance.Debug("check zip file failed. Will delete [" + text + "].", false);
							GlobalFun.TryDeleteFile(text);
							return false;
						}
					}
				}
				return true;
			}
			catch (Exception arg)
			{
				LogHelper.LogInstance.Error($"resource readly exception:[{arg}].", false);
				return false;
			}
		}

		public void PrepareFlashingResources(string modelname, List<DownloadInfo> resourceinfos, Action<string, DownloadStatus> callBack)
		{
			List<DownloadInfo> list = new List<DownloadInfo>();
			foreach (DownloadInfo resourceinfo in resourceinfos)
			{
				if (HostProxy.DownloadServerV6.GetDownloadedResource(resourceinfo.FileUrl) == null)
				{
					list.Add(resourceinfo);
				}
			}
			if (list.Count == 0)
			{
				callBack(modelname, (DownloadStatus)5);
				return;
			}
			if (!DownloadTasks.ContainsKey(modelname))
			{
				PackageDownloadModel value = new PackageDownloadModel(modelname);
				DownloadTasks.Add(modelname, value);
			}
			DownloadTasks[modelname].CallbackAction = callBack;
			DownloadTasks[modelname].Status.Clear();
			list.ForEach(delegate(DownloadInfo n)
			{
				//IL_0022: Unknown result type (might be due to invalid IL or missing references)
				DownloadTasks[modelname].Status.Add(n.FileUrl, n.Status);
				HostProxy.DownloadServerV6.Add(n, true);
			});
		}

		private void HandleDownloadResult(RemoteDownloadStatusEventArgs resource)
		{
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			foreach (KeyValuePair<string, PackageDownloadModel> downloadTask in DownloadTasks)
			{
				if (downloadTask.Value.Status.ContainsKey(resource.FileUrl))
				{
					LogHelper.LogInstance.Debug($"rescue download {resource.FileUrl}: {resource.Status}", false);
					downloadTask.Value.Status[resource.FileUrl] = resource.Status;
					int num = downloadTask.Value.Status.Count((KeyValuePair<string, DownloadStatus> n) => (int)n.Value == 1);
					int num2 = downloadTask.Value.Status.Count((KeyValuePair<string, DownloadStatus> n) => (int)n.Value == 8);
					int num3 = downloadTask.Value.Status.Count((KeyValuePair<string, DownloadStatus> n) => (int)n.Value == 5 || (int)n.Value == 6 || (int)n.Value == 9);
					if (num > 0)
					{
						downloadTask.Value.CallbackAction(downloadTask.Key, (DownloadStatus)1);
					}
					else if (num2 > 0)
					{
						downloadTask.Value.CallbackAction(downloadTask.Key, (DownloadStatus)8);
					}
					else if (num3 == downloadTask.Value.Status.Count)
					{
						downloadTask.Value.CallbackAction(downloadTask.Key, (DownloadStatus)5);
					}
					else
					{
						downloadTask.Value.CallbackAction(downloadTask.Key, (DownloadStatus)4);
					}
				}
			}
		}
	}
	public class FlashBusiness
	{
		public const string SIMTAG_SINGLE = "Single";

		public const string SIMTAG_DUAL = "Dual";

		public const string Sku = "modelName";

		public const string BlurVersion = "blurVersion";

		public const string FingerPrint = "fingerPrint";

		public const string RoCarrier = "roCarrier";

		public const string FsgVersionQCOM = "fsgVersion.qcom";

		public const string FsgVersionMTK = "fsgVersion.mtk";

		public const string FsgVersionSAMSUNG = "fsgVersion.samsung";

		public const string SimCount = "simCount";

		public const string softwareVersion = "softwareVersion";

		public const string hwCode = "hwCode";

		public const string memory = "memory";

		public const string country = "country";

		public static Dictionary<ConnectType, Dictionary<string, string>> ConnectTypeToValue = new Dictionary<ConnectType, Dictionary<string, string>>
		{
			{
				(ConnectType)1,
				AdbParamsToValue
			},
			{
				(ConnectType)2,
				FastbootParamsToValue
			}
		};

		public static Dictionary<string, string> AdbParamsToValue = new Dictionary<string, string>
		{
			{ "modelName", "ro.boot.hardware.sku|ro.product.model" },
			{ "hwCode", "" },
			{ "softwareVersion", "ro.build.display.id" },
			{ "roCarrier", "ro.carrier" },
			{ "fsgVersion.qcom", "ril.baseband.config.version" },
			{ "fsgVersion.mtk", "ro.build.version.incremental" },
			{ "fsgVersion.samsung", "gsm.version.baseband" },
			{ "fingerPrint", "ro.build.fingerprint" },
			{ "blurVersion", "ro.build.version.full" },
			{ "simCount", "persist.radio.multisim.config" }
		};

		public static Dictionary<string, string> FastbootParamsToValue = new Dictionary<string, string>
		{
			{ "modelName", "sku" },
			{ "roCarrier", "ro.carrier" },
			{ "fsgVersion.qcom", "version-baseband" },
			{ "fsgVersion.mtk", "version-baseband" },
			{ "fsgVersion.samsung", "version-baseband" },
			{ "fingerPrint", "ro.build.fingerprint" },
			{ "softwareVersion", "softwareVersion" },
			{ "blurVersion", "ro.build.version.full" },
			{ "simCount", "oem hw dualsim" }
		};

		public static RescueDeviceInfoModel ConvertFastbootDeviceInfo(SortedList<string, string> infos)
		{
			RescueDeviceInfoModel rescueDeviceInfoModel = new RescueDeviceInfoModel();
			infos.TryGetValue("sku", out var value);
			if (string.IsNullOrEmpty(value))
			{
				infos.TryGetValue("ro.boot.hardware.sku", out value);
			}
			rescueDeviceInfoModel.modelName = value;
			infos.TryGetValue("imei", out value);
			rescueDeviceInfoModel.imei = value;
			infos.TryGetValue("ro.build.fingerprint", out value);
			rescueDeviceInfoModel.fingerPrint = value;
			infos.TryGetValue("ro.carrier", out value);
			rescueDeviceInfoModel.roCarrier = value;
			infos.TryGetValue("ro.build.version.full", out value);
			rescueDeviceInfoModel.blurVersion = value;
			infos.TryGetValue("softwareVersion", out value);
			rescueDeviceInfoModel.softwareVersion = value;
			infos.TryGetValue("ram", out value);
			rescueDeviceInfoModel.memory = value;
			infos.TryGetValue("oem hw dualsim", out value);
			rescueDeviceInfoModel.simCount = value;
			infos.TryGetValue("serialno", out value);
			rescueDeviceInfoModel.sn = value;
			rescueDeviceInfoModel.brand = "Motorola";
			infos.TryGetValue("version-baseband", out value);
			rescueDeviceInfoModel.fsgVersion = value;
			infos.TryGetValue("fdr-allowed", out value);
			rescueDeviceInfoModel.fdr_allowed = value;
			if (!string.IsNullOrEmpty(value) && value.ToLower().Equals("no"))
			{
				rescueDeviceInfoModel.rescueMark = 1;
			}
			else
			{
				rescueDeviceInfoModel.rescueMark = 0;
			}
			infos.TryGetValue("rescuemark", out value);
			if (!string.IsNullOrEmpty(value) && int.TryParse(value, out var result) && result > 0)
			{
				rescueDeviceInfoModel.rescueMark = result;
			}
			infos.TryGetValue("erase_personal_data", out value);
			rescueDeviceInfoModel.erase_personal_data = value;
			infos.TryGetValue("securestate", out value);
			rescueDeviceInfoModel.securestate = value;
			infos.TryGetValue("channelid", out value);
			rescueDeviceInfoModel.channelId = value;
			infos.TryGetValue("cid", out value);
			rescueDeviceInfoModel.cid = value;
			infos.TryGetValue("trackId", out value);
			rescueDeviceInfoModel.trackId = value;
			return rescueDeviceInfoModel;
		}

		public static void ConvertDeviceInfo(Dictionary<string, string> infos, RescueDeviceInfoModel deviceInfo)
		{
			foreach (KeyValuePair<string, string> info in infos)
			{
				if (info.Key == "blurVersion")
				{
					deviceInfo.blurVersion = info.Value;
				}
				else if (info.Key == "fingerPrint")
				{
					deviceInfo.fingerPrint = info.Value;
				}
				else if (info.Key == "roCarrier")
				{
					deviceInfo.roCarrier = info.Value;
				}
				else if (info.Key == "fsgVersion.qcom" || info.Key == "fsgVersion.mtk" || info.Key == "fsgVersion.samsung")
				{
					deviceInfo.fsgVersion = info.Value;
				}
				else if (info.Key == "simCount")
				{
					deviceInfo.simCount = info.Value;
				}
				else if (info.Key == "softwareVersion")
				{
					deviceInfo.softwareVersion = info.Value;
				}
				else if (info.Key == "hwCode")
				{
					deviceInfo.hwCode = info.Value;
				}
				else if (info.Key == "memory")
				{
					deviceInfo.memory = info.Value;
				}
				else if (info.Key == "country")
				{
					deviceInfo.country = info.Value;
				}
			}
		}

		public static T Copy<T>(T source, T target) where T : class
		{
			Type type = target.GetType();
			PropertyInfo[] properties = source.GetType().GetProperties();
			foreach (PropertyInfo propertyInfo in properties)
			{
				try
				{
					object value = propertyInfo.GetValue(source, null);
					object value2 = propertyInfo.GetValue(target, null);
					if (value != null && (value2 == null || string.IsNullOrEmpty(value2.ToString())) && (!propertyInfo.PropertyType.Equals(typeof(string)) || !string.IsNullOrEmpty(value.ToString())))
					{
						type.GetProperty(propertyInfo.Name).SetValue(target, value, null);
					}
				}
				catch (Exception)
				{
				}
			}
			return target;
		}

		public static Dictionary<string, string> GetParams(JArray aparams, DeviceEx device)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Invalid comparison between Unknown and I4
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			if ((int)device.ConnectType == 2)
			{
				foreach (JToken aparam in aparams)
				{
					string text = ((object)aparam).ToString();
					string text2 = null;
					if (Enumerable.Contains(FastbootParamsToValue.Keys, text))
					{
						text2 = device.Property.GetPropertyValue(FastbootParamsToValue[text]);
						if (text == "fsgVersion.qcom" && !string.IsNullOrEmpty(text2))
						{
							if (text2.Contains("not found"))
							{
								text2 = null;
							}
							else
							{
								string[] array = Regex.Split(text2, "\\s");
								if (array.Length == 2)
								{
									text2 = array[1];
								}
							}
						}
						if (text == "blurVersion")
						{
							int.TryParse(device.Property.AndroidVersion, out var result);
							if (result >= 10)
							{
								continue;
							}
						}
					}
					if (string.IsNullOrEmpty(text2))
					{
						text2 = ((!(text == "simCount")) ? "-1" : "Lack");
					}
					dictionary.Add(text, text2?.Trim());
				}
			}
			else
			{
				string empty = string.Empty;
				foreach (JToken aparam2 in aparams)
				{
					string text3 = ((object)aparam2).ToString();
					if (text3 == "blurVersion")
					{
						int.TryParse(device.Property.AndroidVersion, out var result2);
						if (result2 >= 10)
						{
							continue;
						}
					}
					switch (text3)
					{
					case "hwCode":
						empty = device.Property.HWCode;
						break;
					case "modelName":
						empty = device.Property.ModelName;
						break;
					case "fsgVersion.qcom":
						empty = device.Property.GetPropertyValue(AdbParamsToValue[text3]);
						if (!string.IsNullOrWhiteSpace(empty))
						{
							break;
						}
						empty = device.Property.GetPropertyValue("gsm.version.baseband");
						if (!string.IsNullOrWhiteSpace(empty))
						{
							int.TryParse(device.Property.AndroidVersion, out var result3);
							string[] array2 = Regex.Split(empty, "\\s");
							if (array2.Length == 2)
							{
								empty = array2[1];
							}
							else if (result3 >= 15)
							{
								empty = device.Property.GetPropertyValue("vendor.ril.baseband.config.version");
							}
						}
						else
						{
							empty = device.Property.GetPropertyValue("vendor.ril.baseband.config.version");
						}
						break;
					case "simCount":
						empty = device.Property.GetPropertyValue(AdbParamsToValue[text3]);
						empty = ((!string.IsNullOrEmpty(empty) && !"SS".Equals(empty?.Trim(), StringComparison.CurrentCultureIgnoreCase) && !"ssss".Equals(empty?.Trim(), StringComparison.CurrentCultureIgnoreCase)) ? "Dual" : "Single");
						break;
					default:
						empty = device.Property.GetPropertyValue(AdbParamsToValue[text3]);
						break;
					}
					if (string.IsNullOrEmpty(empty))
					{
						empty = "-1";
					}
					dictionary.Add(text3, empty?.Trim());
				}
			}
			return dictionary;
		}

		public static Dictionary<string, object> GetAutoMatchParams(DeviceEx device)
		{
			//IL_0054: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Expected O, but got Unknown
			//IL_01c1: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c7: Invalid comparison between Unknown and I4
			if (device != null)
			{
				string modelName = device.Property.ModelName;
				if (string.IsNullOrEmpty(modelName))
				{
					LogHelper.LogInstance.Info("device model name is Empty!", false);
					return null;
				}
				Dictionary<string, object> dictionary = new Dictionary<string, object>();
				dictionary.Add("modelName", modelName);
				LogHelper.LogInstance.Info("get match params by model name: " + modelName, false);
				JObject val = new JObject();
				ResponseModel<object> val2 = ((ApiBaseService)FlashContext.SingleInstance.service).RequestBase(WebServicesContext.RESUCE_AUTOMATCH_GETPARAMS_MAPPING, (object)dictionary, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				dictionary.Add("code", val2.code);
				if (val2.code != "0000")
				{
					LogHelper.LogInstance.Info("error match resource on the server! :" + val2.code, false);
					return dictionary;
				}
				if (val2.content == null)
				{
					LogHelper.LogInstance.Info("no match resource on the server!", false);
					return null;
				}
				val = JsonHelper.DeserializeJson2Object<JObject>(val2.content.ToString());
				if (((JContainer)((JToken)val).Value<JArray>((object)"params")).Count > 0)
				{
					Dictionary<string, string> dictionary2 = GetParams(((JToken)val).Value<JArray>((object)"params"), device);
					dictionary2.Add("category", device.Property.Category);
					LogHelper.LogInstance.Info("match rescue resource params: " + JsonHelper.SerializeObject2Json((object)dictionary2), false);
					dictionary.Add("params", dictionary2);
					dictionary.Add("imei", device.Property.IMEI1);
					dictionary.Add("imei2", device.Property.IMEI2);
					dictionary.Add("sn", device.Property.SN);
					string propertyValue = device.Property.GetPropertyValue("channelid");
					if (!string.IsNullOrEmpty(propertyValue))
					{
						dictionary.Add("channelId", propertyValue);
					}
					dictionary.Add("matchType", ((int)device.ConnectType != 2) ? 1 : 0);
					if (MainFrameV6.Instance.RomMatchId != null)
					{
						dictionary.Add("romMatchId", MainFrameV6.Instance.RomMatchId);
						MainFrameV6.Instance.RomMatchId = null;
					}
					return dictionary;
				}
			}
			return null;
		}
	}
	public class AutoMatchResource
	{
		public DeviceEx device { get; set; }

		public RescueDeviceInfoModel deviceInfo { get; set; }

		public ResourceResponseModel resource { get; set; }

		public MatchInfo matchInfo { get; set; }

		public string Id { get; set; }

		public AutoMatchResource(DeviceEx device, RescueDeviceInfoModel deviceInfo, ResourceResponseModel resource, MatchInfo matchInfo)
		{
			this.device = device;
			this.deviceInfo = deviceInfo;
			this.resource = resource;
			this.matchInfo = matchInfo;
			if (device != null)
			{
				Id = device.Identifer;
				return;
			}
			if (!string.IsNullOrEmpty(deviceInfo.imei))
			{
				Id = deviceInfo.imei;
				return;
			}
			if (!string.IsNullOrEmpty(deviceInfo.sn))
			{
				Id = deviceInfo.sn;
				return;
			}
			string text = DateTime.Now.ToString("MMddHHmmss") + "#";
			if (!string.IsNullOrEmpty(deviceInfo.marketName))
			{
				text = text + deviceInfo.marketName + "#";
			}
			if (!string.IsNullOrEmpty(deviceInfo.modelName))
			{
				text = text + deviceInfo.modelName + "#";
			}
			if (!string.IsNullOrEmpty(deviceInfo.hwCode))
			{
				text = text + deviceInfo.hwCode + "#";
			}
			if (!string.IsNullOrEmpty(deviceInfo.country))
			{
				text = text + deviceInfo.country + "#";
			}
			if (!string.IsNullOrEmpty(deviceInfo.simCount))
			{
				text = text + deviceInfo.simCount + "#";
			}
			if (!string.IsNullOrEmpty(deviceInfo.memory))
			{
				text = text + deviceInfo.memory + "#";
			}
			Id = text.TrimEnd(new char[1] { '#' });
		}
	}
	public class FlashContext
	{
		private static FlashContext _singleInstance;

		public ApiService service { get; private set; }

		public static FlashContext SingleInstance
		{
			get
			{
				if (_singleInstance == null)
				{
					_singleInstance = new FlashContext();
				}
				return _singleInstance;
			}
		}

		public ILanguage LanuageService { get; private set; }

		public Action<object> TutorialClickAction { get; set; }

		private FlashContext()
		{
		}

		public void Initialize()
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Expected O, but got Unknown
			service = new ApiService();
			LanuageService = HostProxy.LanguageService;
		}
	}
	public class FlashFailedGuideHelper
	{
		public static FlashDeviceData CollectFalshResult(string customerid, string modelname, bool success)
		{
			if (string.IsNullOrEmpty(customerid) || string.IsNullOrEmpty(modelname))
			{
				return new FlashDeviceData
				{
					failed = 0,
					success = 0
				};
			}
			JArray val = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.RescueRecordsFile, "$.flash", false);
			List<CustomerFlashData> list = new List<CustomerFlashData>();
			if (val != null && ((JToken)val).HasValues)
			{
				list = JsonHelper.DeserializeJson2List<CustomerFlashData>(((object)val).ToString());
			}
			CustomerFlashData customerFlashData = list.Where((CustomerFlashData n) => n.customerid == customerid)?.FirstOrDefault();
			if (customerFlashData == null)
			{
				customerFlashData = new CustomerFlashData
				{
					customerid = customerid,
					devices = new List<FlashDeviceData>()
				};
				list.Add(customerFlashData);
			}
			FlashDeviceData flashDeviceData = customerFlashData.devices.FirstOrDefault((FlashDeviceData n) => !string.IsNullOrEmpty(n.modelname) && n.modelname.Equals(modelname, StringComparison.CurrentCultureIgnoreCase));
			DateTime now = DateTime.Now;
			if (flashDeviceData == null)
			{
				flashDeviceData = new FlashDeviceData
				{
					modelname = modelname,
					failed = 0,
					success = 0
				};
				if (success)
				{
					flashDeviceData.successfirst = now;
					flashDeviceData.successlast = now;
				}
				else
				{
					flashDeviceData.failedfirst = now;
					flashDeviceData.failedlast = now;
				}
				customerFlashData.devices.Add(flashDeviceData);
			}
			else if (success)
			{
				flashDeviceData.successlast = now;
				if (flashDeviceData.successminutes >= FlashDeviceData.RESET_MINUTES)
				{
					flashDeviceData.success = 0;
					flashDeviceData.successfirst = now;
				}
			}
			else
			{
				flashDeviceData.failedlast = now;
				if (flashDeviceData.failedminutes >= FlashDeviceData.RESET_MINUTES)
				{
					flashDeviceData.failed = 0;
					flashDeviceData.failedfirst = now;
				}
			}
			if (success)
			{
				flashDeviceData.success++;
			}
			else
			{
				flashDeviceData.failed++;
			}
			FileHelper.WriteJsonWithAesEncrypt(Configurations.RescueRecordsFile, "flash", (object)list, false);
			return flashDeviceData;
		}

		public static int GetCount(string customerid, string modelname, bool success)
		{
			JObject val = FileHelper.ReadJtokenWithAesDecrypt<JObject>(Configurations.RescueRecordsFile, "$.flash[?(@.customerid=='" + customerid + "')].devices[?(@.modelname=='" + modelname + "')]", false);
			if (val == null || !((JToken)val).HasValues)
			{
				return 0;
			}
			try
			{
				if (success)
				{
					return ((JToken)val).Value<int>((object)"success");
				}
				return ((JToken)val).Value<int>((object)"failed");
			}
			catch
			{
				return 0;
			}
		}

		public static void Show(string category, bool success)
		{
		}
	}
	public class CustomerFlashData
	{
		public string customerid { get; set; }

		public List<FlashDeviceData> devices { get; set; }
	}
	public class FlashDeviceData
	{
		public static double RESET_MINUTES = 2880.0;

		public DateTime failedfirst { get; set; }

		public DateTime failedlast { get; set; }

		public DateTime successfirst { get; set; }

		public DateTime successlast { get; set; }

		public int success { get; set; }

		public int failed { get; set; }

		public string modelname { get; set; }

		public double failedminutes
		{
			get
			{
				_ = failedfirst;
				_ = failedlast;
				return failedlast.Subtract(failedfirst).TotalMinutes;
			}
		}

		public double successminutes
		{
			get
			{
				_ = successfirst;
				_ = successlast;
				return successlast.Subtract(successfirst).TotalMinutes;
			}
		}
	}
	[StructLayout(LayoutKind.Sequential, Size = 1)]
	public struct FlashStaticResources
	{
		public static string RESUCE_FASTBOOT_DEVICE_CONFIRM = "K0112";

		public static string RESUCE_AUTO_MATCH_FASTBOOT_DEVICE_CONFIRM = "K1070";

		public static string FASTBOOT_MODELNAME_UNMATCH = "K0170";

		public static string RESUCE_FASTBOOT_CONDITION_UNMATCHED = "K0098";

		public static string RESUCE_FASTBOOT_CONDITION_UNMATCHED_EX = "K0830";

		public static string RESUCE_CONDITION_UNMATCHED_EX = "K0943";

		public static string DEVICE_NOT_SUPPORT = "K0113";

		public static string RESCUE_DOWNLOAD_FAILED = "K0324";

		public static string AUTO_DEVICECOUNT_CHECK = "K0962";

		public static string MANUAL_DEVICECOUNT_CHECK = "K0942";

		public static string MANUAL_EMULATOR_DEVICECOUNT_CHECK = "K0820";

		public static string FLASH_INFORMATION_COLLECTION_CONFIRM_TITLE = "K0939";

		public static string FLASH_INFORMATION_COLLECTION_CONFIRM_CONTENT = "K0940";

		public static string FLASH_LESSSFREESPACE = "K0110";

		public static string RESCUE_BACKUP_FILE_TITLE = "K0108";

		public static string RESCUE_BACKUP_FILE_CONTENT = "K0107";

		public static string COUNTRYCODE_SETTING_SUCCESS_TITLE = "K0106";

		public static string COUNTRYCODE_SETTING_FAILED_TITLE = "K0105";

		public static string RESCUE_SUCCESS_TITLE = "K0111";

		public static string FASTBOOT_AUTOMATCH_FAILED_FIRST = "K0935";

		public static string FASTBOOT_AUTOMATCH_FAILED_GREATER_FIRST = "K0937";

		public static string FASTBOOT_MANUALMATCH_FAILED_FIRST = "K0935";

		public static string FASTBOOT_MANUALMATCH_FAILED_GREATER_FIRST = "K0937";

		public static string IMEI_MATCH_TITLE_FORMAT = "K0936";

		public static string IMEI_MATCH_FORMAT = "K0952";

		public static string IMEI_MATCH_FAILED_TITLE = "K0933";

		public static string IMEI_INVALIDATE_TITLE = "IMEI invalid";

		public static string IMEI_MATCH_FAILED_CONTENT = "K0934";

		public static string IMEI_INVALIDATE_CONTENT = "K0979";

		public static string USBDEVICE_AUTOMATCH_FAILED_TITLE = "K0933";

		public static string USBDEVICE_AUTOMATCH_FAILED_CONTENT = "K1046";

		public static string AUTO_MATCH_CONTENT = "K1045";

		public static string MODELNAME_NULL_TITLE = "K1093";

		public static string MODELNAME_NULL_CONTENT = "K1092";

		public static string DRIVER_INSTALL_CONFIRM = "K1094";
	}
	public enum FlashStatusV6
	{
		Download,
		Ready,
		Rescuing,
		PASS,
		FAIL,
		QUIT
	}
	public enum FlashDownStatus
	{
		UNDOWNLOAD = 1,
		DOWNLOADING,
		DOWNLOADPAUSE,
		DOWNLOADFAILED,
		DOWNLOADSUCCESS
	}
	public enum FlashStatus
	{
		NoStart,
		Readly,
		Flashing,
		FinishedWithNormal,
		FinishedWithError,
		FinishedWithAbort
	}
	[Serializable]
	public class HwDetection
	{
		[JsonProperty("startTime")]
		public string StartTime { get; set; }

		[JsonProperty("finishTime")]
		public string FinishTime { get; set; }

		[JsonProperty("result")]
		public int Result { get; set; }

		[JsonProperty("model")]
		public string Model { get; set; }

		[JsonProperty("sn")]
		public string SN { get; set; }

		[JsonProperty("imei1")]
		public string Imei1 { get; set; }

		[JsonProperty("imei2")]
		public string Imei2 { get; set; }

		[JsonProperty("androidVersion")]
		public string AndroidVersion { get; set; }

		[JsonProperty("errorMessage")]
		public string ErrorMessage { get; set; }

		[JsonProperty("hwDetectionItems")]
		public List<HwDetectionItem> Items { get; set; }

		public string clientUuid { get; set; }
	}
	[Serializable]
	public class HwDetectionItem
	{
		[JsonProperty("name")]
		public string Name { get; set; }

		[JsonProperty("result")]
		public int Result { get; set; }

		[JsonProperty("errorMessage")]
		public string ErrorMessage { get; set; }
	}
	public class HwDetectionDataCollect
	{
		public void BeginCollect()
		{
			Task.Factory.StartNew(delegate
			{
				try
				{
					Dictionary<string, string> dictionary = ExportFileFromDevice();
					if (dictionary != null)
					{
						Dictionary<string, HwDetection> dictionary2 = ParsingXmlFile(dictionary);
						if (dictionary2 != null)
						{
							Dictionary<string, string> dictionary3 = SubmitData(dictionary2);
							if (dictionary3 != null)
							{
								DeleteFileFromDevice(dictionary3);
							}
						}
					}
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("Hw data collect throw exception:" + ex.ToString(), false);
				}
			});
		}

		private Dictionary<string, string> ExportFileFromDevice()
		{
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (((val != null) ? val.MessageManager : null) == null)
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
				IFileTransferManager fileTransferManager = val.FileTransferManager;
				ISequence sequence = HostProxy.Sequence;
				long num = sequence.New();
				if (!val2.TryEnterLock(10000))
				{
					return null;
				}
				try
				{
					List<string> list = null;
					if (val2.Send<object>("getHwDetectionFilePaths", (List<object>)null, num = sequence.New()) && val2.Receive<string>("getHwDetectionFilePathsResponse", ref list, 15000) && list != null)
					{
						if (list == null || list.Count == 0)
						{
							return null;
						}
						num = sequence.New();
						val2.Send<string>("exportHwDetectionFiles", list, num);
						string text = Path.Combine(new string[1] { Configurations.TempDir });
						Dictionary<string, string> dictionary = new Dictionary<string, string>();
						FileTransferWrapper val3 = fileTransferManager.CreateFileTransfer(num);
						try
						{
							if (val3 != null)
							{
								TransferFileInfo val4 = null;
								foreach (string item in list)
								{
									_ = item;
									if (val3.ReceiveFile(text, ref val4))
									{
										dictionary[val4.FilePath] = val4.localFilePath;
										val3.NotifyFileReceiveComplete();
										continue;
									}
									return dictionary;
								}
							}
						}
						finally
						{
							((IDisposable)val3)?.Dispose();
						}
						List<PropItem> list2 = null;
						val2.Receive<PropItem>("exportHwDetectionFilesResponse", ref list2, 15000);
						return dictionary;
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
			return null;
		}

		private Dictionary<string, HwDetection> ParsingXmlFile(Dictionary<string, string> fileMapping)
		{
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Expected O, but got Unknown
			//IL_00da: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e1: Expected O, but got Unknown
			if (fileMapping == null)
			{
				return null;
			}
			Dictionary<string, HwDetection> dictionary = new Dictionary<string, HwDetection>();
			foreach (KeyValuePair<string, string> item in fileMapping)
			{
				try
				{
					if (!new FileInfo(item.Value).Exists)
					{
						continue;
					}
					XmlDocument val = new XmlDocument();
					val.Load(item.Value);
					HwDetection hwDetection = new HwDetection();
					hwDetection.StartTime = ((XmlNode)val).SelectSingleNode("/hwDetection/startTime").InnerText;
					hwDetection.FinishTime = ((XmlNode)val).SelectSingleNode("/hwDetection/finishTime").InnerText;
					int result = 0;
					int.TryParse(((XmlNode)val).SelectSingleNode("/hwDetection/hwDetectionResult").InnerText, out result);
					hwDetection.Result = result;
					hwDetection.ErrorMessage = ((XmlNode)val).SelectSingleNode("/hwDetection/errorMessage").InnerText;
					List<HwDetectionItem> list = new List<HwDetectionItem>();
					foreach (XmlNode item2 in ((XmlNode)val).SelectNodes("/hwDetection/testItem"))
					{
						XmlNode val2 = item2;
						HwDetectionItem hwDetectionItem = new HwDetectionItem();
						hwDetectionItem.Name = val2.SelectSingleNode("itemName").InnerText;
						result = 0;
						int.TryParse(val2.SelectSingleNode("itemResult").InnerText, out result);
						hwDetectionItem.Result = result;
						hwDetectionItem.ErrorMessage = val2.SelectSingleNode("errorMessage").InnerText;
						list.Add(hwDetectionItem);
					}
					hwDetection.Items = list;
					dictionary[item.Key] = hwDetection;
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error($"Parsing hw detection file[{item.Value}] throw exception{ex.ToString()}", false);
				}
			}
			return dictionary;
		}

		private Dictionary<string, string> SubmitData(Dictionary<string, HwDetection> datasMapping)
		{
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d0: Expected O, but got Unknown
			DeviceEx masterDevice = HostProxy.deviceManager.MasterDevice;
			TcpAndroidDevice val = (TcpAndroidDevice)(object)((masterDevice is TcpAndroidDevice) ? masterDevice : null);
			if (val == null)
			{
				return null;
			}
			IAndroidDevice property = ((DeviceEx)val).Property;
			_ = string.Empty;
			string modelName = property.ModelName;
			string sN = property.SN;
			string iMEI = property.IMEI1;
			string iMEI2 = property.IMEI2;
			string androidVersion = property.AndroidVersion;
			string clientUUID = GlobalFun.GetClientUUID();
			foreach (KeyValuePair<string, HwDetection> item in datasMapping)
			{
				item.Value.Model = modelName;
				item.Value.SN = sN;
				item.Value.Imei1 = iMEI;
				item.Value.Imei2 = iMEI2;
				item.Value.AndroidVersion = androidVersion;
				item.Value.clientUuid = clientUUID;
			}
			ApiService val2 = new ApiService();
			string uPLOAD_HW_DETECTION = WebServicesContext.UPLOAD_HW_DETECTION;
			ResponseModel<object> val3 = null;
			_ = string.Empty;
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			foreach (KeyValuePair<string, HwDetection> item2 in datasMapping)
			{
				val3 = ((ApiBaseService)val2).RequestBase(uPLOAD_HW_DETECTION, (object)item2.Value, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false);
				if (val3 != null)
				{
					dictionary[item2.Key] = val3.code;
				}
				else
				{
					dictionary[item2.Key] = null;
				}
			}
			return dictionary;
		}

		private void DeleteFileFromDevice(Dictionary<string, string> resultMapping)
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
				if (val2 != null)
				{
					_ = val.FileTransferManager;
					long num = HostProxy.Sequence.New();
					List<PropItem> list = null;
					val2.SendAndReceiveSync<string, PropItem>("deleteHwDetecionFiles", "deleteHwDetecionFilesResponse", (from m in resultMapping
						where "0000".Equals(m.Value)
						select m.Key).ToList(), num, ref list);
				}
			}
			finally
			{
				((IDisposable)val2)?.Dispose();
			}
		}
	}
	public class MessageViewSafeStack
	{
		public Task<bool?> Show()
		{
			return Task.Run(() => (bool?)null);
		}
	}
	public class PackageDownloadModel
	{
		public string ModelName { get; set; }

		public Dictionary<string, DownloadStatus> Status { get; set; }

		public Action<string, DownloadStatus> CallbackAction { get; set; }

		public PackageDownloadModel(string modelName)
		{
			ModelName = modelName;
			Status = new Dictionary<string, DownloadStatus>();
		}
	}
	public class RecipeMessageImpl : IRecipeMessage
	{
		protected MessageViewHelper Mh { get; }

		public RecipeMessageImpl(MessageViewHelper mh)
		{
			Mh = mh;
		}

		public Task<bool?> Show(string title, string message, string ok = "K0327", string cancel = null, bool showClose = false, MessageBoxImage icon = (MessageBoxImage)64, string notifyText = null, bool isPrivacy = false, bool isWarnYellow = false)
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			return Mh.Show(title, message, ok, cancel, showClose, icon, notifyText, isPrivacy, isWarnYellow, (Action<bool?>)null);
		}

		public Task<bool?> ShowCustom(IMessageViewV6 view)
		{
			return Mh.ShowCustom(view);
		}

		public Task<bool?> WaitByAdb(string title, string message, string image)
		{
			return Mh.ShowRightPic(title, message, Strring2ImageSource(image), (string)null, (string)null, "K0104", false, false, (Action<bool?>)null);
		}

		public Task<bool?> WaitByFastboot(UseCase _usecase, string modelname)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			GuidStepsViewV6 lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				//IL_001f: Unknown result type (might be due to invalid IL or missing references)
				//IL_0025: Invalid comparison between Unknown and I4
				lv = new GuidStepsViewV6();
				BaseGuidStepsViewModelV6 viewModel = new GuidStepsViewModelV6(lv, autoPlay: false, popupWhenClose: true).Init(modelname, (int)_usecase != 1);
				lv.Init(viewModel);
				lv.VM.CheckingTxtVisibility = (Visibility)0;
				lv.CloseAction = delegate(bool? r)
				{
					Close(r);
				};
			});
			return Mh.ShowCustom((IMessageViewV6)(object)lv);
		}

		public Task<bool?> Linker(string title, string message, object data)
		{
			List<Tuple<string, string>> LinkArr = new List<Tuple<string, string>>();
			if (data is JArray)
			{
				foreach (JToken item in (JArray)((data is JArray) ? data : null))
				{
					LinkArr.Add(new Tuple<string, string>(item.Value<string>((object)"text"), item.Value<string>((object)"url")));
				}
			}
			MessageWithLinkerView lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				lv = new MessageWithLinkerView();
				lv.Init(title, message, "K0397", "K0208", LinkArr);
				lv.CloseAction = delegate(bool? r)
				{
					Close(r);
				};
			});
			return Mh.ShowCustom((IMessageViewV6)(object)lv);
		}

		public Task<bool?> RightPic(string title, string message, string image, string ok = "K0327", string cancel = null, string tips = null, bool showClose = false, bool popupWhenClose = false)
		{
			return Mh.ShowRightPic(title, message, Strring2ImageSource(image), ok, cancel, tips, showClose, popupWhenClose, (Action<bool?>)null);
		}

		public bool? AutoClose(string title, string message, string image, List<string> buttons = null, int milliseconds = -1, string link = null, bool showClose = false, bool popupWhenClose = false, bool format = true, bool? autoCloseResult = true)
		{
			string ok = null;
			string cancel = null;
			if (buttons != null && buttons.Count == 1)
			{
				ok = buttons[0];
			}
			else if (buttons != null && buttons.Count == 2)
			{
				ok = buttons[0];
				cancel = buttons[1];
			}
			RescueMessageView lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				lv = new RescueMessageView();
				lv.Init(title, message, Strring2ImageSource(image), ok, cancel, link, showClose, popupWhenClose, format);
				lv.CloseAction = delegate(bool? r)
				{
					Close(r);
				};
			});
			Task<bool?> task = Mh.ShowCustom((IMessageViewV6)(object)lv);
			if (milliseconds > 0 && !task.Wait(milliseconds))
			{
				Close(autoCloseResult);
			}
			return task.Result;
		}

		public bool? AutoCloseMoreStep(string title, ConnectStepInfo stepArr, int milliseconds = -1, bool popupWhenClose = false)
		{
			string[] ratioArr = stepArr.WidthRatio.Split(new char[1] { ':' });
			if (stepArr.Steps.Count == 0)
			{
				return null;
			}
			Rescue3ColumnView lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				//IL_006c: Unknown result type (might be due to invalid IL or missing references)
				//IL_0081: Unknown result type (might be due to invalid IL or missing references)
				//IL_0096: Unknown result type (might be due to invalid IL or missing references)
				//IL_0214: Unknown result type (might be due to invalid IL or missing references)
				//IL_022d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0246: Unknown result type (might be due to invalid IL or missing references)
				//IL_0128: Unknown result type (might be due to invalid IL or missing references)
				//IL_0141: Unknown result type (might be due to invalid IL or missing references)
				//IL_0156: Unknown result type (might be due to invalid IL or missing references)
				ColumnViewModel columnViewModel = new ColumnViewModel
				{
					IsClosePopup = popupWhenClose,
					StepTitle = title,
					StepNoteText = stepArr.NoteText
				};
				if (stepArr.Steps.Count == 1)
				{
					columnViewModel.StepContext1 = stepArr.Steps[0].StepContent;
					columnViewModel.WidthRatio1 = new GridLength(1.0, (GridUnitType)2);
					columnViewModel.WidthRatio2 = new GridLength(0.0, (GridUnitType)2);
					columnViewModel.WidthRatio3 = new GridLength(0.0, (GridUnitType)2);
					columnViewModel.StepImage1 = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Resources/connect_new/" + stepArr.Steps[0].StepImage;
				}
				else if (stepArr.Steps.Count == 2)
				{
					columnViewModel.StepContext1 = stepArr.Steps[0].StepContent;
					columnViewModel.StepContext2 = stepArr.Steps[1].StepContent;
					columnViewModel.WidthRatio1 = new GridLength(Convert.ToDouble(ratioArr[0]), (GridUnitType)2);
					columnViewModel.WidthRatio2 = new GridLength(Convert.ToDouble(ratioArr[1]), (GridUnitType)2);
					columnViewModel.WidthRatio3 = new GridLength(0.0, (GridUnitType)2);
					columnViewModel.StepImage1 = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Resources/connect_new/" + stepArr.Steps[0].StepImage;
					columnViewModel.StepImage2 = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Resources/connect_new/" + stepArr.Steps[1].StepImage;
				}
				else
				{
					columnViewModel.StepContext1 = stepArr.Steps[0].StepContent;
					columnViewModel.StepContext2 = stepArr.Steps[1].StepContent;
					columnViewModel.StepContext3 = stepArr.Steps[2].StepContent;
					columnViewModel.WidthRatio1 = new GridLength(Convert.ToDouble(ratioArr[0]), (GridUnitType)2);
					columnViewModel.WidthRatio2 = new GridLength(Convert.ToDouble(ratioArr[1]), (GridUnitType)2);
					columnViewModel.WidthRatio3 = new GridLength(Convert.ToDouble(ratioArr[2]), (GridUnitType)2);
					columnViewModel.StepImage1 = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Resources/connect_new/" + stepArr.Steps[0].StepImage;
					columnViewModel.StepImage2 = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Resources/connect_new/" + stepArr.Steps[1].StepImage;
					columnViewModel.StepImage3 = "pack://application:,,,/lenovo.mbg.service.lmsa.flash;component/Resources/connect_new/" + stepArr.Steps[2].StepImage;
				}
				Rescue3ColumnView rescue3ColumnView = new Rescue3ColumnView();
				((FrameworkElement)rescue3ColumnView).DataContext = columnViewModel;
				rescue3ColumnView.CloseAction = delegate(bool? r)
				{
					Close(r);
				};
				lv = rescue3ColumnView;
			});
			Task<bool?> task = Mh.ShowCustom((IMessageViewV6)(object)lv);
			if (milliseconds > 0 && !task.Wait(milliseconds))
			{
				Close(true);
			}
			return task.Result;
		}

		public bool? AutoCloseConnectTutorials(string title, JArray steps, int milliseconds = -1, bool autoPlay = false, double interval = 5000.0, bool showPlayControl = true, bool showClose = true, bool popupWhenClose = true, string noteText = null)
		{
			GuidStepsViewV6 lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				lv = new GuidStepsViewV6();
				BaseGuidStepsViewModelV6 viewModel = new BaseGuidStepsViewModelV6(lv, autoPlay, interval, showPlayControl, showClose, popupWhenClose, noteText).InitSteps(title, steps).Ready();
				lv.Init(viewModel);
				lv.CloseAction = delegate(bool? r)
				{
					Close(r);
				};
			});
			Task<bool?> task = Mh.ShowCustom((IMessageViewV6)(object)lv);
			if (milliseconds > 0 && !task.Wait(milliseconds))
			{
				Close(true);
			}
			return task.Result;
		}

		public Task<bool?> TabletTurnoff(string title, string message, string image, string note)
		{
			TabletTurnOffView lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
			{
				lv = new TabletTurnOffView();
				lv.Init(title, message, image, note);
				lv.CloseAction = delegate(bool? r)
				{
					Close(r);
				};
			});
			return Mh.ShowCustom((IMessageViewV6)(object)lv);
		}

		public Task<bool?> BackConfirm(string title, string message, string ok = "K0327", string cancel = null, bool showClose = false, bool isNotifyText = false)
		{
			BackupConfirmView lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke<BackupConfirmView>((Func<BackupConfirmView>)delegate
			{
				BackupConfirmView obj = new BackupConfirmView
				{
					CloseAction = delegate(bool? r)
					{
						Close(r);
					}
				};
				BackupConfirmView result = obj;
				lv = obj;
				return result;
			});
			return Mh.ShowCustom((IMessageViewV6)(object)lv);
		}

		public Task<bool?> DataCollectionAndBackConfirm()
		{
			DataCollectionAndBackConfirm lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke<DataCollectionAndBackConfirm>((Func<DataCollectionAndBackConfirm>)delegate
			{
				DataCollectionAndBackConfirm obj = new DataCollectionAndBackConfirm
				{
					CloseAction = delegate(bool? r)
					{
						Close(r);
					}
				};
				DataCollectionAndBackConfirm result = obj;
				lv = obj;
				return result;
			});
			return Mh.ShowCustom((IMessageViewV6)(object)lv);
		}

		public Task<bool?> EraseData()
		{
			EraseDataView lv = null;
			((DispatcherObject)Application.Current).Dispatcher.Invoke<EraseDataView>((Func<EraseDataView>)delegate
			{
				EraseDataView obj = new EraseDataView
				{
					CloseAction = delegate(bool? r)
					{
						Close(r);
					}
				};
				EraseDataView result = obj;
				lv = obj;
				return result;
			});
			return Mh.ShowCustom((IMessageViewV6)(object)lv);
		}

		public void ShowDownloadCenter(bool show)
		{
			MainFrameV6.Instance.IMsgManager.ShowDownloadCenter(show);
		}

		public void Close(bool? result, Action<bool?> closeCallback = null)
		{
			Mh.Close(result, closeCallback);
		}

		private ImageSource Strring2ImageSource(string encodeImage)
		{
			ImageSource result = null;
			if (!string.IsNullOrEmpty(encodeImage))
			{
				string image = GlobalFun.DecodeBase64(encodeImage);
				((DispatcherObject)Application.Current).Dispatcher.Invoke((Action)delegate
				{
					try
					{
						object obj = XamlReader.Parse(image);
						result = (ImageSource)((obj is ImageSource) ? obj : null);
					}
					catch (Exception)
					{
						object obj2 = Application.Current.Resources[(object)encodeImage];
						result = (ImageSource)((obj2 is ImageSource) ? obj2 : null);
					}
				});
			}
			return result;
		}

		public void SetMainWindowDriverBtnStatus(string _code)
		{
			MainFrameV6.Instance.IMsgManager.SetDriverButtonStatus(_code);
		}
	}
	public class RescueSubmitManager
	{
		private List<Tuple<string, RescueCollectionModel, Dictionary<string, string>>> SubmitTaskList = new List<Tuple<string, RescueCollectionModel, Dictionary<string, string>>>();

		private Dictionary<string, Task> SubmitTasks = new Dictionary<string, Task>();

		private Dictionary<string, List<ResultLogger>> LogDic = new Dictionary<string, List<ResultLogger>>();

		public static RescueSubmitManager Instance { get; } = new RescueSubmitManager();

		public void CreateSubmitTask(string resultLoggerId, RescueCollectionModel data, BusinessType businessType, BusinessData businessData, string recipeName, Dictionary<string, string> degradeInfos)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			Task value = new Task(delegate(object o)
			{
				//IL_002d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0032: Unknown result type (might be due to invalid IL or missing references)
				//IL_02f0: Unknown result type (might be due to invalid IL or missing references)
				//IL_02f9: Unknown result type (might be due to invalid IL or missing references)
				//IL_0343: Unknown result type (might be due to invalid IL or missing references)
				//IL_0349: Unknown result type (might be due to invalid IL or missing references)
				//IL_0304: Unknown result type (might be due to invalid IL or missing references)
				Tuple<string, RescueCollectionModel, BusinessType, BusinessData, string, Dictionary<string, string>> tuple = o as Tuple<string, RescueCollectionModel, BusinessType, BusinessData, string, Dictionary<string, string>>;
				string logId = tuple.Item1;
				RescueCollectionModel item = tuple.Item2;
				Dictionary<string, string> degradeinfo = tuple.Item6;
				BusinessType item2 = tuple.Item3;
				BusinessData item3 = tuple.Item4;
				string item4 = tuple.Item5;
				double totalMilliseconds = DateTime.Parse(item.rescueTime).Subtract(DateTime.Parse(item.startRescueTime)).TotalMilliseconds;
				int rescueResult = item.rescueResult;
				List<ResultLogger> list = new List<ResultLogger>();
				List<ResultLogger> list2 = LogDic[logId];
				if (list2.Count == 1)
				{
					list.Add(list2.First());
				}
				else
				{
					long minStartTimestamp = list2.Min((ResultLogger n) => n.StartTimestamp);
					list = UseCaseRunner.Loggers.Values.Where((ResultLogger n) => n.EndTimestamp < minStartTimestamp).ToList();
				}
				if (data.rescueResult == 0)
				{
					List<ResultLogger> list3 = list2.Where((ResultLogger n) => n.ClassGuid != logId).ToList();
					if (list3 != null && list3.Count > 0)
					{
						foreach (ResultLogger item5 in list3)
						{
							item.errorMsg = item.errorMsg + Environment.NewLine + item5.UploadLogs;
						}
					}
				}
				LogDic.Remove(logId);
				if (list.Count > 0)
				{
					foreach (ResultLogger item6 in list)
					{
						item6.LogClear();
						UseCaseRunner.Loggers.Remove(item6.ClassGuid);
					}
				}
				ResponseModel<object> val = ((ApiBaseService)FlashContext.SingleInstance.service).RequestBase(WebServicesContext.UPLOAD_WHEN_FLASH_FINISHED, (object)item, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, true);
				LogHelper.LogInstance.WriteLogForUser(JsonHelper.SerializeObject2Json((object)item), item.rescueResult);
				long flashId = 0L;
				if (val.content != null)
				{
					long.TryParse(val.content.ToString(), out flashId);
				}
				if (flashId > 0 && degradeinfo != null)
				{
					degradeinfo.Add("rescueFlashId", flashId.ToString());
					Task.Run(() => FlashContext.SingleInstance.service.RequestContent(WebServicesContext.COLLECTION_DOWNGRADE_INFO, (object)degradeinfo, 3, (Dictionary<string, string>)null, (HttpMethod)0, "application/json", true, false));
				}
				string directory = Path.Combine(Path.GetTempPath(), "lmsatemp");
				List<string> logfiles = GlobalFun.GetAllFiles(directory, "*");
				if (logfiles != null && logfiles.Count > 0)
				{
					Task.Run(() => ((ApiBaseService)FlashContext.SingleInstance.service).UploadAsync(WebApiUrl.UPLOAD_RESCUE_TOOL_LOG, logfiles, new Dictionary<string, string> { 
					{
						"flashId",
						flashId.ToString()
					} }, true, true)).ContinueWith((Task<bool> s) => GlobalFun.DeleteDirectoryEx(directory));
				}
				BusinessStatus val2 = (BusinessStatus)10;
				switch (rescueResult)
				{
				case 2:
					val2 = (BusinessStatus)30;
					break;
				default:
					val2 = (BusinessStatus)20;
					break;
				case 1:
					break;
				}
				JObject val3 = JsonHelper.DeserializeJson2Jobjcet(JsonHelper.SerializeObject2JsonExceptNull((object)item), false);
				val3["flashId"] = JToken.op_Implicit(flashId);
				val3["recipeName"] = JToken.op_Implicit(item4);
				HostProxy.BehaviorService.Collect(item2, item3.Update((long)totalMilliseconds, val2, item.modelName, (object)val3));
			}, new Tuple<string, RescueCollectionModel, BusinessType, BusinessData, string, Dictionary<string, string>>(resultLoggerId, data, businessType, businessData, recipeName, degradeInfos));
			SubmitTasks.Add(resultLoggerId, value);
			ScanTask();
		}

		private void ScanTask()
		{
			//IL_0093: Unknown result type (might be due to invalid IL or missing references)
			List<string> list = new List<string>();
			foreach (KeyValuePair<string, Task> submitTask in SubmitTasks)
			{
				ResultLogger logger = UseCaseRunner.Loggers[submitTask.Key];
				List<ResultLogger> list2 = UseCaseRunner.Loggers.Values.Where((ResultLogger n) => HasInterval(logger.StartTimestamp, logger.EndTimestamp, n.StartTimestamp, n.EndTimestamp)).ToList();
				bool flag = list2.Exists((ResultLogger n) => n.EndTimestamp == long.MaxValue);
				if ((int)logger.OverallResult != 0 || !flag)
				{
					LogDic.Add(submitTask.Key, list2);
					list.Add(submitTask.Key);
					submitTask.Value.Start();
				}
			}
			foreach (string item in list)
			{
				SubmitTasks.Remove(item);
			}
		}

		private bool HasInterval(long start1, long end1, long start2, long end2)
		{
			long num = Math.Max(start1, start2);
			long num2 = Math.Min(end1, end2);
			return num < num2;
		}
	}
	[StructLayout(LayoutKind.Sequential, Size = 1)]
	public struct WebServicesContext
	{
		public static string GET_MARKETNAMES = BaseUri + "/rescueDevice/getRescueModelNames.jhtml";

		public static string GET_ALLMODELNAMES = BaseUri + "/rescueDevice/getModelNames.jhtml";

		public static string GET_FASTBOOTDATA_RECIPE = BaseUri + "/rescueDevice/getRescueModelRecipe.jhtml";

		public static string GET_MODELS_BY_MARKETNAME = BaseUri + "/rescueDevice/modelListByMarketName.jhtml";

		public static string RESUCE_AUTOMATCH_GETPARAMS_MAPPING = BaseUri + "/rescueDevice/getRomMatchParams.jhtml";

		public static string RESUCE_AUTOMATCH_GETROM = BaseUri + "/rescueDevice/getNewResource.jhtml";

		public static string RESUCE_MANUAL_GETROM = BaseUri + "/rescueDevice/getResource.jhtml";

		public static string RESUCE_MANUAL_GETSTEPTIPS = BaseUri + "/rescueDevice/getXamlList.jhtml";

		public static string UPLOAD_WHEN_FLASH_FINISHED = BaseUri + "/dataCollection/RescueflashInfo.jhtml";

		public static string UPLOAD_HW_DETECTION = BaseUri + "/dataCollection/HwDetectionInfo.jhtml";

		public static string GET_RESOURCES_BY_IMEI = BaseUri + "/rescueDevice/getNewResourceByImei.jhtml";

		public static string GET_RESOURCES_BY_SN = BaseUri + "/rescueDevice/getNewResourceBySN.jhtml";

		public static string COLLECTION_DOWNGRADE_INFO = BaseUri + "/dataCollection/rescueDegradeInfo.jhtml";

		public static string COLLECTION_SHARE_RESCUE_RESULT = BaseUri + "/dataCollection/rescueSocialShare.jhtml";

		public static string SURVEY_RESCUE_REASON = BaseUri + "/survey/saveRescueSuccessRecord.jhtml";

		public static string GET_B2B_ALL_ORDER_INFO = BaseUri + "/vip/getB2BInfo.jhtml";

		public static string GET_B2B_AVAILABLE_ORDER_INFO = BaseUri + "/vip/getB2BInfo.jhtml";

		private static string BaseUri => Configurations.ServiceInterfaceUrl;
	}
}
