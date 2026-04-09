using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Cache;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Xml;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Math;
using Org.BouncyCastle.Pkcs;
using Org.BouncyCastle.Security;
using Org.BouncyCastle.X509;
using lenovo.mbg.service.common.log;
using lenovo.mbg.service.common.utilities;
using lenovo.mbg.service.common.webservices.Properties;
using lenovo.mbg.service.common.webservices.WebApiModel;
using lenovo.mbg.service.common.webservices.WebApiServices;

[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
[assembly: AssemblyTitle("lenovo.mbg.service.common.webservices")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("lenovo.mbg.service.common.webservices")]
[assembly: AssemblyCopyright("Copyright (c) Lenovo 2019")]
[assembly: AssemblyTrademark("")]
[assembly: ComVisible(false)]
[assembly: Guid("6e875dfb-b169-4ee8-9ea3-c4dcf8e0b76d")]
[assembly: AssemblyFileVersion("1.1.0.0")]
[assembly: TargetFramework(".NETFramework,Version=v4.7.2", FrameworkDisplayName = ".NET Framework 4.7.2")]
[assembly: AssemblyVersion("1.1.0.0")]
namespace lenovo.mbg.service.common.webservices
{
	public class RsaHelper
	{
		public static bool RSAPrivateKeyJava2DotNet(string privateKey, out string key)
		{
			bool result = true;
			try
			{
				RsaPrivateCrtKeyParameters rsaPrivateCrtKeyParameters = (RsaPrivateCrtKeyParameters)PrivateKeyFactory.CreateKey(Convert.FromBase64String(privateKey));
				key = string.Format("<RSAKeyValue><Modulus>{0}</Modulus><Exponent>{1}</Exponent><P>{2}</P><Q>{3}</Q><DP>{4}</DP><DQ>{5}</DQ><InverseQ>{6}</InverseQ><D>{7}</D></RSAKeyValue>", new object[8]
				{
					Convert.ToBase64String(rsaPrivateCrtKeyParameters.Modulus.ToByteArrayUnsigned()),
					Convert.ToBase64String(rsaPrivateCrtKeyParameters.PublicExponent.ToByteArrayUnsigned()),
					Convert.ToBase64String(rsaPrivateCrtKeyParameters.P.ToByteArrayUnsigned()),
					Convert.ToBase64String(rsaPrivateCrtKeyParameters.Q.ToByteArrayUnsigned()),
					Convert.ToBase64String(rsaPrivateCrtKeyParameters.DP.ToByteArrayUnsigned()),
					Convert.ToBase64String(rsaPrivateCrtKeyParameters.DQ.ToByteArrayUnsigned()),
					Convert.ToBase64String(rsaPrivateCrtKeyParameters.QInv.ToByteArrayUnsigned()),
					Convert.ToBase64String(rsaPrivateCrtKeyParameters.Exponent.ToByteArrayUnsigned())
				});
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("RsaHelper.RSAPrivateKeyJava2DotNet(string privateKey) occur an excception", exception);
				key = string.Empty;
			}
			return result;
		}

		public static bool RSAPrivateKeyDotNet2Java(string privateKey, out string key)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Expected O, but got Unknown
			bool result = true;
			try
			{
				XmlDocument val = new XmlDocument();
				val.LoadXml(privateKey);
				BigInteger modulus = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("Modulus")[0].InnerText));
				BigInteger publicExponent = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("Exponent")[0].InnerText));
				BigInteger privateExponent = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("D")[0].InnerText));
				BigInteger p = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("P")[0].InnerText));
				BigInteger q = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("Q")[0].InnerText));
				BigInteger dP = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("DP")[0].InnerText));
				BigInteger dQ = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("DQ")[0].InnerText));
				BigInteger qInv = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("InverseQ")[0].InnerText));
				byte[] encoded = PrivateKeyInfoFactory.CreatePrivateKeyInfo(new RsaPrivateCrtKeyParameters(modulus, publicExponent, privateExponent, p, q, dP, dQ, qInv)).ToAsn1Object().GetEncoded();
				key = Convert.ToBase64String(encoded);
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("RsaHelper.RSAPrivateKeyDotNet2Java(string privateKey) occur an excception", exception);
				key = string.Empty;
			}
			return result;
		}

		public static bool RSAPublicKeyJava2DotNet(string publicKey, out string key)
		{
			bool result = true;
			try
			{
				RsaKeyParameters rsaKeyParameters = (RsaKeyParameters)PublicKeyFactory.CreateKey(Convert.FromBase64String(publicKey));
				key = $"<RSAKeyValue><Modulus>{Convert.ToBase64String(rsaKeyParameters.Modulus.ToByteArrayUnsigned())}</Modulus><Exponent>{Convert.ToBase64String(rsaKeyParameters.Exponent.ToByteArrayUnsigned())}</Exponent></RSAKeyValue>";
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("RsaHelper.RSAPublicKeyJava2DotNet(string publicKey) occur an excception", exception);
				key = string.Empty;
			}
			return result;
		}

		public static bool RSAPublicKeyDotNet2Java(string publicKey, out string key)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Expected O, but got Unknown
			bool result = true;
			try
			{
				XmlDocument val = new XmlDocument();
				val.LoadXml(publicKey);
				BigInteger modulus = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("Modulus")[0].InnerText));
				BigInteger exponent = new BigInteger(1, Convert.FromBase64String(val.DocumentElement.GetElementsByTagName("Exponent")[0].InnerText));
				byte[] derEncoded = SubjectPublicKeyInfoFactory.CreateSubjectPublicKeyInfo(new RsaKeyParameters(isPrivate: false, modulus, exponent)).ToAsn1Object().GetDerEncoded();
				key = Convert.ToBase64String(derEncoded);
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("RsaHelper.RSAPublicKeyDotNet2Java(string publicKey) occur an excception", exception);
				key = string.Empty;
			}
			return result;
		}

		public static RSAKey GenerateRsaKey()
		{
			RSAKey rSAKey = new RSAKey();
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSAKey.PrivateKey = rSACryptoServiceProvider.ToXmlString(includePrivateParameters: true);
			rSAKey.PublicKey = rSACryptoServiceProvider.ToXmlString(includePrivateParameters: false);
			return rSAKey;
		}

		public static string RSAEncrypt(string xmlPublicKey, string encryptString)
		{
			if (string.IsNullOrEmpty(encryptString))
			{
				return string.Empty;
			}
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(xmlPublicKey);
			byte[] bytes = Encoding.UTF8.GetBytes(encryptString);
			return Convert.ToBase64String(rSACryptoServiceProvider.Encrypt(bytes, fOAEP: false));
		}

		public static string RSAEncrypt(string xmlPublicKey, byte[] EncryptString)
		{
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(xmlPublicKey);
			return Convert.ToBase64String(rSACryptoServiceProvider.Encrypt(EncryptString, fOAEP: false));
		}

		public static string RSADecrypt(string xmlPrivateKey, string encryptString)
		{
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(xmlPrivateKey);
			byte[] rgb = Convert.FromBase64String(encryptString);
			byte[] bytes = rSACryptoServiceProvider.Decrypt(rgb, fOAEP: false);
			return Encoding.UTF8.GetString(bytes);
		}

		public static string RSADecrypt(string xmlPrivateKey, byte[] encryptString)
		{
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(xmlPrivateKey);
			byte[] bytes = rSACryptoServiceProvider.Decrypt(encryptString, fOAEP: false);
			return Encoding.UTF8.GetString(bytes);
		}

		public static string RSADecryptByPublicKey(string xmlPublicKey, string encryptString)
		{
			if (string.IsNullOrEmpty(encryptString))
			{
				return string.Empty;
			}
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(xmlPublicKey);
			byte[] input = Convert.FromBase64String(encryptString);
			RsaKeyParameters rsaPublicKey = DotNetUtilities.GetRsaPublicKey(rSACryptoServiceProvider);
			IBufferedCipher cipher = CipherUtilities.GetCipher("RSA");
			cipher.Init(forEncryption: false, rsaPublicKey);
			byte[] bytes = cipher.DoFinal(input);
			return Encoding.UTF8.GetString(bytes);
		}

		public static bool SignatureFormatter(string p_strKeyPrivate, byte[] HashbyteSignature, ref byte[] EncryptedSignatureData)
		{
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(p_strKeyPrivate);
			RSAPKCS1SignatureFormatter rSAPKCS1SignatureFormatter = new RSAPKCS1SignatureFormatter(rSACryptoServiceProvider);
			rSAPKCS1SignatureFormatter.SetHashAlgorithm("MD5");
			EncryptedSignatureData = rSAPKCS1SignatureFormatter.CreateSignature(HashbyteSignature);
			return true;
		}

		public static bool SignatureFormatter(string p_strKeyPrivate, byte[] HashbyteSignature, ref string m_strEncryptedSignatureData)
		{
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(p_strKeyPrivate);
			RSAPKCS1SignatureFormatter rSAPKCS1SignatureFormatter = new RSAPKCS1SignatureFormatter(rSACryptoServiceProvider);
			rSAPKCS1SignatureFormatter.SetHashAlgorithm("MD5");
			byte[] inArray = rSAPKCS1SignatureFormatter.CreateSignature(HashbyteSignature);
			m_strEncryptedSignatureData = Convert.ToBase64String(inArray);
			return true;
		}

		public static bool SignatureFormatter(string p_strKeyPrivate, string m_strHashbyteSignature, ref byte[] EncryptedSignatureData)
		{
			byte[] rgbHash = Convert.FromBase64String(m_strHashbyteSignature);
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(p_strKeyPrivate);
			RSAPKCS1SignatureFormatter rSAPKCS1SignatureFormatter = new RSAPKCS1SignatureFormatter(rSACryptoServiceProvider);
			rSAPKCS1SignatureFormatter.SetHashAlgorithm("MD5");
			EncryptedSignatureData = rSAPKCS1SignatureFormatter.CreateSignature(rgbHash);
			return true;
		}

		public static bool SignatureFormatter(string p_strKeyPrivate, string m_strHashbyteSignature, ref string m_strEncryptedSignatureData)
		{
			byte[] rgbHash = Convert.FromBase64String(m_strHashbyteSignature);
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(p_strKeyPrivate);
			RSAPKCS1SignatureFormatter rSAPKCS1SignatureFormatter = new RSAPKCS1SignatureFormatter(rSACryptoServiceProvider);
			rSAPKCS1SignatureFormatter.SetHashAlgorithm("MD5");
			byte[] inArray = rSAPKCS1SignatureFormatter.CreateSignature(rgbHash);
			m_strEncryptedSignatureData = Convert.ToBase64String(inArray);
			return true;
		}

		public static bool SignatureDeformatter(string p_strKeyPublic, byte[] HashbyteDeformatter, byte[] DeformatterData)
		{
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(p_strKeyPublic);
			RSAPKCS1SignatureDeformatter rSAPKCS1SignatureDeformatter = new RSAPKCS1SignatureDeformatter(rSACryptoServiceProvider);
			rSAPKCS1SignatureDeformatter.SetHashAlgorithm("MD5");
			if (rSAPKCS1SignatureDeformatter.VerifySignature(HashbyteDeformatter, DeformatterData))
			{
				return true;
			}
			return false;
		}

		public static bool SignatureDeformatter(string p_strKeyPublic, string p_strHashbyteDeformatter, byte[] DeformatterData)
		{
			byte[] rgbHash = Convert.FromBase64String(p_strHashbyteDeformatter);
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(p_strKeyPublic);
			RSAPKCS1SignatureDeformatter rSAPKCS1SignatureDeformatter = new RSAPKCS1SignatureDeformatter(rSACryptoServiceProvider);
			rSAPKCS1SignatureDeformatter.SetHashAlgorithm("MD5");
			if (rSAPKCS1SignatureDeformatter.VerifySignature(rgbHash, DeformatterData))
			{
				return true;
			}
			return false;
		}

		public static bool SignatureDeformatter(string p_strKeyPublic, byte[] HashbyteDeformatter, string p_strDeformatterData)
		{
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(p_strKeyPublic);
			RSAPKCS1SignatureDeformatter rSAPKCS1SignatureDeformatter = new RSAPKCS1SignatureDeformatter(rSACryptoServiceProvider);
			rSAPKCS1SignatureDeformatter.SetHashAlgorithm("MD5");
			byte[] rgbSignature = Convert.FromBase64String(p_strDeformatterData);
			if (rSAPKCS1SignatureDeformatter.VerifySignature(HashbyteDeformatter, rgbSignature))
			{
				return true;
			}
			return false;
		}

		public static bool SignatureDeformatter(string p_strKeyPublic, string p_strHashbyteDeformatter, string p_strDeformatterData)
		{
			byte[] rgbHash = Convert.FromBase64String(p_strHashbyteDeformatter);
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider();
			rSACryptoServiceProvider.FromXmlString(p_strKeyPublic);
			RSAPKCS1SignatureDeformatter rSAPKCS1SignatureDeformatter = new RSAPKCS1SignatureDeformatter(rSACryptoServiceProvider);
			rSAPKCS1SignatureDeformatter.SetHashAlgorithm("MD5");
			byte[] rgbSignature = Convert.FromBase64String(p_strDeformatterData);
			if (rSAPKCS1SignatureDeformatter.VerifySignature(rgbHash, rgbSignature))
			{
				return true;
			}
			return false;
		}
	}
	public static class WebApiContext
	{
		public static string GUID = Guid.NewGuid().ToString();

		public const string REQUEST_CODE_ERROR = "ERROR";

		public const string REQUEST_CODE_0000 = "0000";

		public const string REQUEST_CODE_3010 = "3010";

		public const string REQUEST_CODE_3020 = "3020";

		public const string REQUEST_CODE_3030 = "3030";

		public const string REQUEST_CODE_3040 = "3040";

		public const string REQUEST_CODE_4000 = "4000";

		public const string REQUEST_CODE_4010 = "4010";

		public const string REQUEST_CODE_TOKENTIMEOUT = "402";

		public const string ProxyAuthenticationRequired = "407";

		private static string rsa_public_key = null;

		private static string language = null;

		private static string windows_version = null;

		public static string windows_version64 = null;

		private static string client_version = null;

		private static string client_uuid = null;

		public static string JWT_TOKEN { get; set; }

		public static string RSA_PUBLIC_KEY
		{
			get
			{
				if (string.IsNullOrEmpty(rsa_public_key))
				{
					rsa_public_key = RsaService.InitPublicKey();
				}
				return rsa_public_key;
			}
		}

		public static string LANGUAGE
		{
			get
			{
				if (language == null)
				{
					language = LMSAContext.CurrentLanguage;
				}
				return language;
			}
		}

		public static string WINDOWS_VERSION
		{
			get
			{
				if (windows_version == null)
				{
					windows_version = LMSAContext.OsVersionName;
				}
				return windows_version;
			}
		}

		public static string WINDOWS_VERSION_BASE64
		{
			get
			{
				if (windows_version64 == null)
				{
					windows_version64 = Convert.ToBase64String(Encoding.UTF8.GetBytes(WINDOWS_VERSION));
				}
				return windows_version64;
			}
		}

		public static string CLIENT_UUID
		{
			get
			{
				if (client_uuid == null)
				{
					client_uuid = GlobalFun.GetClientUUID();
				}
				return client_uuid;
			}
		}

		public static string CLIENT_VERSION
		{
			get
			{
				if (client_version == null)
				{
					client_version = LMSAContext.MainProcessVersion;
				}
				return client_version;
			}
		}

		public static Dictionary<string, string> REQUEST_AUTHOR_HEADERS
		{
			get
			{
				Dictionary<string, string> dictionary = new Dictionary<string, string>();
				if (!string.IsNullOrEmpty(JWT_TOKEN))
				{
					dictionary.Add("Authorization", "Bearer " + JWT_TOKEN);
				}
				if (!string.IsNullOrEmpty(CLIENT_UUID))
				{
					dictionary.Add("clientUUID", CLIENT_UUID);
				}
				return dictionary;
			}
		}
	}
	public enum HttpMethod
	{
		POST,
		GET
	}
	public class RsaWebClient : WebClient
	{
		public int TimeOut { get; set; } = 5000;

		protected override WebRequest GetWebRequest(Uri address)
		{
			WebRequest webRequest = base.GetWebRequest(address);
			webRequest.Timeout = TimeOut;
			return webRequest;
		}
	}
	public class WebApiHttpRequest
	{
		private static long interlocker = 0L;

		private static long windowShowTime;

		private static bool windowIsShow;

		public static readonly Dictionary<string, string> CodeToMessage = new Dictionary<string, string>
		{
			["402"] = "token timeout.",
			["403"] = "Invalid token.",
			["404"] = "token authentication failure.",
			["405"] = "Invalid identifier.",
			["406"] = "token verification failure.",
			["407"] = "Invalid GUID.",
			["408"] = "This token has no permissions."
		};

		public static Func<string, object, object> WebApiCallback { get; set; }

		public static ResponseModel<string> RequestBase(string url, string body, Dictionary<string, string> headers = null, HttpMethod method = HttpMethod.POST, string contentType = "application/json", bool addAuthorizationHeader = false)
		{
			HttpWebRequest httpWebRequest = null;
			HttpStatusCode httpStatusCode = HttpStatusCode.Continue;
			try
			{
				GC.Collect();
				ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
				ServicePointManager.DefaultConnectionLimit = 200;
				LogHelper.LogInstance.Debug("Request " + url + ", params: " + body);
				httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
				httpWebRequest.CachePolicy = new RequestCachePolicy(RequestCacheLevel.NoCacheNoStore);
				httpWebRequest.UseDefaultCredentials = true;
				httpWebRequest.ServicePoint.ConnectionLimit = 200;
				httpWebRequest.ProtocolVersion = HttpVersion.Version11;
				httpWebRequest.UserAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36";
				httpWebRequest.Method = method.ToString();
				httpWebRequest.ContentType = contentType;
				httpWebRequest.KeepAlive = false;
				httpWebRequest.Timeout = 120000;
				httpWebRequest.ReadWriteTimeout = 600000;
				httpWebRequest.ContentLength = 0L;
				httpWebRequest.Headers.Add("Cache-Control", "no-cache");
				httpWebRequest.Headers.Add("Request-Tag: lmsa");
				if (addAuthorizationHeader)
				{
					foreach (KeyValuePair<string, string> rEQUEST_AUTHOR_HEADER in WebApiContext.REQUEST_AUTHOR_HEADERS)
					{
						httpWebRequest.Headers.Add(rEQUEST_AUTHOR_HEADER.Key, rEQUEST_AUTHOR_HEADER.Value);
					}
				}
				if (headers != null)
				{
					foreach (KeyValuePair<string, string> header in headers)
					{
						httpWebRequest.Headers.Add(header.Key, header.Value);
					}
				}
				if (httpWebRequest.Headers["clientVersion"] == null)
				{
					httpWebRequest.Headers.Add("clientVersion", WebApiContext.CLIENT_VERSION);
				}
				if (httpWebRequest.Headers["windowsInfo"] == null)
				{
					httpWebRequest.Headers.Add("windowsInfo", WebApiContext.WINDOWS_VERSION_BASE64);
				}
				if (httpWebRequest.Headers["language"] == null)
				{
					httpWebRequest.Headers.Add("language", WebApiContext.LANGUAGE);
				}
				if (!string.IsNullOrEmpty(body))
				{
					byte[] bytes = Encoding.UTF8.GetBytes(body);
					httpWebRequest.ContentLength = bytes.Length;
					using Stream stream = httpWebRequest.GetRequestStream();
					stream.Write(bytes, 0, bytes.Length);
				}
				string text = null;
				using (HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse())
				{
					httpStatusCode = httpWebResponse.StatusCode;
					if (httpWebResponse.StatusCode == HttpStatusCode.OK)
					{
						using Stream stream2 = httpWebResponse.GetResponseStream();
						using MemoryStream memoryStream = new MemoryStream();
						byte[] array = new byte[10240];
						for (int num = stream2.Read(array, 0, array.Length); num > 0; num = stream2.Read(array, 0, array.Length))
						{
							memoryStream.Write(array, 0, num);
						}
						memoryStream.Seek(0L, SeekOrigin.Begin);
						using StreamReader streamReader = new StreamReader(memoryStream);
						text = streamReader.ReadToEnd();
					}
				}
				if (url == WebApiUrl.LENOVOID_LOGIN_CALLBACK)
				{
					LogHelper.LogInstance.AnalyzeUnsafeText(text);
				}
				LogHelper.LogInstance.Debug($"Response {url}, result: {text} ,statusCode: {(int)httpStatusCode}");
				return new ResponseModel<string>
				{
					code = "0000",
					success = true,
					content = text
				};
			}
			catch (WebException ex)
			{
				WebException ex2 = ex;
				WebException ex3 = ex2;
				if (url.Contains(Configurations.BaseHttpUrl))
				{
					LogHelper.LogInstance.Error($"Get Context From Url: [{url}] WebException:{ex3}");
					Task.Delay(new Random().Next(100)).ContinueWith(delegate
					{
						if (Interlocked.Read(in interlocker) == 0L)
						{
							Interlocked.Exchange(ref interlocker, 1L);
							long num2 = GlobalFun.ToUtcTimeStamp(DateTime.Now);
							if (!windowIsShow && windowShowTime + 60000 < num2)
							{
								windowIsShow = true;
								WebApiCallback?.Invoke("NONETWORK", ex3.Status == WebExceptionStatus.NameResolutionFailure);
								windowShowTime = num2;
								windowIsShow = false;
							}
							Interlocked.Exchange(ref interlocker, 0L);
						}
					});
				}
				else
				{
					LogHelper.LogInstance.Error("Get Context From Third Url: [" + url + "] WebException:" + ex3.Message);
				}
				if (ex3.Response is HttpWebResponse { StatusCode: HttpStatusCode.ProxyAuthenticationRequired })
				{
					return new ResponseModel<string>
					{
						success = false,
						code = "407",
						desc = ex3.Message
					};
				}
				return new ResponseModel<string>
				{
					code = "ERROR",
					desc = ex3.Message
				};
			}
			catch (Exception ex4)
			{
				LogHelper.LogInstance.Error("Get Context From Url: [" + url + "] Exception:" + ex4.Message);
				return new ResponseModel<string>
				{
					code = "ERROR",
					desc = ex4.Message
				};
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
		}

		public static ResponseModel<object> Request(string url, string body, Dictionary<string, string> headers = null, HttpMethod method = HttpMethod.POST, string contentType = "application/json", bool addAuthorizationHeader = false)
		{
			ResponseModel<string> responseModel = RequestBase(url, body, headers, method, contentType, addAuthorizationHeader);
			if (responseModel.success)
			{
				ResponseModel<object> responseModel2 = JsonHelper.DeserializeJson2Object<ResponseModel<object>>(responseModel.content);
				if (!string.IsNullOrEmpty(responseModel2.code) && CodeToMessage.ContainsKey(responseModel2.code))
				{
					Task.Delay(new Random().Next(100)).ContinueWith(delegate
					{
						if (Interlocked.Read(in interlocker) == 0L)
						{
							Interlocked.Exchange(ref interlocker, 1L);
							WebApiCallback?.Invoke("TOKEN_EXPRIED", null);
							Interlocked.Exchange(ref interlocker, 0L);
						}
					});
				}
				responseModel2.success = responseModel.success;
				return responseModel2;
			}
			return new ResponseModel<object>
			{
				code = responseModel.code,
				content = responseModel.content,
				desc = responseModel.desc,
				success = responseModel.success
			};
		}

		public static async Task<bool> UploadAsync(string url, List<string> files, Dictionary<string, string> headers, bool extraHeader = false, bool addAuthorizationHeader = false)
		{
			if (headers == null)
			{
				headers = new Dictionary<string, string>();
			}
			if (extraHeader)
			{
				headers.Add("clientVersion", WebApiContext.CLIENT_VERSION);
				headers.Add("language", WebApiContext.LANGUAGE);
				headers.Add("windowsInfo", WebApiContext.WINDOWS_VERSION);
			}
			LogHelper.LogInstance.Debug("Request " + url + ", params: " + JsonHelper.SerializeObject2Json(headers));
			HttpClient httpClient = new HttpClient();
			try
			{
				MultipartFormDataContent formData = new MultipartFormDataContent("_-_-_-_-_");
				try
				{
					_ = 1;
					try
					{
						if (addAuthorizationHeader)
						{
							foreach (KeyValuePair<string, string> rEQUEST_AUTHOR_HEADER in WebApiContext.REQUEST_AUTHOR_HEADERS)
							{
								((HttpHeaders)httpClient.DefaultRequestHeaders).Add(rEQUEST_AUTHOR_HEADER.Key, rEQUEST_AUTHOR_HEADER.Value);
							}
						}
						foreach (KeyValuePair<string, string> header in headers)
						{
							string text = header.Value;
							if (string.IsNullOrEmpty(text))
							{
								text = string.Empty;
							}
							formData.Add((HttpContent)new StringContent(text, Encoding.UTF8), header.Key);
						}
						if (files != null && files.Count > 0)
						{
							files.ForEach(delegate(string n)
							{
								//IL_000e: Unknown result type (might be due to invalid IL or missing references)
								//IL_0014: Expected O, but got Unknown
								if (!string.IsNullOrEmpty(n))
								{
									HttpContent val2 = (HttpContent)new ByteArrayContent(File.ReadAllBytes(n));
									val2.Headers.ContentType = MediaTypeHeaderValue.Parse("application/octet-stream");
									formData.Add(val2, "file", Path.GetFileName(n));
								}
							});
						}
						HttpResponseMessage val = await httpClient.PostAsync(url, (HttpContent)(object)formData);
						((object)val)?.ToString();
						if (val.StatusCode == HttpStatusCode.OK)
						{
							string text2 = await val.Content.ReadAsStringAsync();
							LogHelper.LogInstance.Debug("Request " + url + ", Response whole result: " + text2);
							if (!string.IsNullOrEmpty(text2))
							{
								return JsonHelper.DeserializeJson2Object<ResponseModel<object>>(text2)?.code == "0000";
							}
						}
					}
					catch (Exception exception)
					{
						LogHelper.LogInstance.Error("upload file error:", exception);
					}
				}
				finally
				{
					if (formData != null)
					{
						((IDisposable)formData).Dispose();
					}
				}
			}
			finally
			{
				((IDisposable)httpClient)?.Dispose();
			}
			return false;
		}

		public static string GetRecipeContent(string url)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Expected O, but got Unknown
			HttpClient val = new HttpClient();
			try
			{
				HttpResponseMessage result = val.GetAsync(url).Result;
				result.EnsureSuccessStatusCode();
				string result2 = result.Content.ReadAsStringAsync().Result;
				LogHelper.LogInstance.Debug(result2);
				return result2;
			}
			catch (Exception ex)
			{
				LogHelper.LogInstance.Debug("HttpClient request failed: " + ex.Message);
				Thread.Sleep(500);
			}
			finally
			{
				((IDisposable)val)?.Dispose();
			}
			using (WebClient webClient = new RsaWebClient())
			{
				webClient.UseDefaultCredentials = true;
				try
				{
					string text = webClient.DownloadString(url);
					LogHelper.LogInstance.Debug(text);
					return text;
				}
				catch (Exception ex2)
				{
					LogHelper.LogInstance.Debug("WebClient request failed: " + ex2.Message);
					Thread.Sleep(500);
				}
			}
			return RequestBase(url, null, null, HttpMethod.GET).content;
		}
	}
	public static class WebApiUrl
	{
		public static string GET_PUBLIC_KEY = Configurations.ServiceInterfaceUrl + "/common/rsa.jhtml";

		public static string INIT_TOKEN = Configurations.ServiceInterfaceUrl + "/client/initToken.jhtml";

		public static string GET_DEVICE_INFO = Configurations.ServiceInterfaceUrl + "/device/getDeviceInfo.jhtml";

		public static string GET_DEVICE_ICON = Configurations.ServiceInterfaceUrl + "/device/getDeviceIcon.jhtml";

		public static string POST_UPGRADE_FLASH_INFO = Configurations.ServiceInterfaceUrl + "/dataCollection/UpgradeFlashInfo.jhtml";

		public static string DISPOSE_TOKEN = Configurations.ServiceInterfaceUrl + "/client/deleteToken.jhtml";

		public static string USER_GUIDE = Configurations.ServiceInterfaceUrl + "/client/getUserGuide.jhtml";

		public static string HELP_URI = Configurations.ServiceInterfaceUrl + "/client/clientHelp.jhtml";

		public static string CLIENT_VERSION = Configurations.ServiceInterfaceUrl + "/client/getNextUpdateClient.jhtml";

		public static string UPDATE_VERSION = Configurations.ServiceInterfaceUrl + "/client/getPluginCategoryList.jhtml";

		public static string PLUGIN_VERSION = Configurations.ServiceInterfaceUrl + "/client/getClientPlugins.jhtml";

		public static string SHOW_FEEDBACK = Configurations.BaseHttpUrl + "/Tips/feedback.html";

		public static string Webwervice_Get_RomResources = Configurations.ServiceInterfaceUrl + "/priv/getRomList.jhtml";

		public static string SURVEY_URL = Configurations.ServiceInterfaceUrl + "/survey/getIsNeedTrigger.jhtml";

		public static string UPLOAD_USER_DEVICE = Configurations.ServiceInterfaceUrl + "/registeredModel/addModels.jhtml";

		public static string DELETE_USER_DEVICE = Configurations.ServiceInterfaceUrl + "/registeredModel/models.jhtml";

		public static string LENOVOID_LOGIN_CALLBACK = Configurations.ServiceInterfaceUrl + "/user/getSFUserInfo.jhtml";

		public static string UPDATE_DOWNLOAD_URL = Configurations.ServiceInterfaceUrl + "/client/renewFileLink.jhtml";

		public static string NOTICE_URL = Configurations.ServiceInterfaceUrl + "/notice/getNoticeInfo.jhtml";

		public static string NOTICE_BROADCAST_URL = Configurations.ServiceInterfaceUrl + "/notice/getBroadcast.jhtml";

		public static string GET_UPGRADEFLASH_MATCH_TYPES = Configurations.ServiceInterfaceUrl + "/rescueDevice/getParamType.jhtml";

		public static string RESUCE_AUTOMATCH_GETPARAMS_MAPPING = Configurations.ServiceInterfaceUrl + "/rescueDevice/getRomMatchParams.jhtml";

		public static string RESUCE_AUTOMATCH_GETROM = Configurations.ServiceInterfaceUrl + "/rescueDevice/getNewResource.jhtml";

		public static string RESUCE_CHECK_SUPPORT_FASTBOOT_MODE = Configurations.ServiceInterfaceUrl + "/rescueDevice/getMarketSupport.jhtml";

		public static string RESUCE_CHECK_MODEL_NAME_DRIVERS = Configurations.ServiceInterfaceUrl + "/model/getDriverSpecialConfig.jhtml";

		public static string LOAD_YOUTUBE_INFO = Configurations.ServiceInterfaceUrl + "/model/getYoutubeVideo.jhtml";

		public static string GET_MOLI_REQUEST_URL = Configurations.ServiceInterfaceUrl + "/moli/getMoliUrl.jhtml";

		public static string MODEL_READ_CONFIG = Configurations.ServiceInterfaceUrl + "/rescueDevice/modelReadConfigration.jhtml";

		public static string NETWORK_CONNECT_CHECK = "https://lsa.lenovo.com/lmsa-web/index.jsp";

		public static string TOKEN_URL = string.Empty;

		public static string LOGIN_TOKEN = string.Empty;

		public static string LOAD_SMART_DEVICE = Configurations.ServiceInterfaceUrl + "/rescueDevice/smartMarketNames.jhtml";

		public static string LOAD_WARRANTY_BANNER = Configurations.ServiceInterfaceUrl + "/client/motoCare.jhtml";

		public static string LOAD_COUPON = Configurations.ServiceInterfaceUrl + "/client/discountCoupon.jhtml";

		public static string CALL_API_URL = Configurations.ServiceInterfaceUrl + "/dictionary/getApiInfo.jhtml";

		public static string CALL_B2B_ORDERS_URL = Configurations.ServiceInterfaceUrl + "/vip/getB2BInfo.jhtml";

		public static string CALL_B2B_ACTIVE_ORDERS_URL = Configurations.ServiceInterfaceUrl + "/vip/getActiveB2BInfos.jhtml";

		public static string CALL_B2B_QUERY_ORDER_URL = Configurations.ServiceInterfaceUrl + "/vip/getEnableB2BOrder.jhtml";

		public static string CALL_B2B_GET_ORDERID_URL = Configurations.ServiceInterfaceUrl + "/vip/getOrderNum.jhtml";

		public static string CALL_B2B_ORDER_BUY_URL = Configurations.ServiceInterfaceUrl + "/vip/buy.jhtml";

		public static string CALL_B2B_GET_PRICE_URL = Configurations.ServiceInterfaceUrl + "/vip/card.jhtml";

		public static string ROMFILE_CHECK_RULES = Configurations.ServiceInterfaceUrl + "/model/rules.jhtml";

		public static string GET_SUPPORT_FASTBOOT_BY_MODELNAME = Configurations.ServiceInterfaceUrl + "/model/isReadSupport.jhtml";

		public static string GET_MUTIL_TUTORIALS_QUESTIONS = Configurations.ServiceInterfaceUrl + "/guide/getGuideQuestion.jhtml";

		public static string USER_LOGOUT = Configurations.ServiceInterfaceUrl + "/user/logout.jhtml";

		public static string USER_FORGOT_PASSWORD = Configurations.ServiceInterfaceUrl + "/user/forgotPassword.jhtml";

		public static string USER_CHANGE_PASSWORD = Configurations.ServiceInterfaceUrl + "/user/changePassword.jhtml";

		public static string USER_LOGIN = Configurations.ServiceInterfaceUrl + "/user/login.jhtml";

		public static string USER_GUEST_LOGIN = Configurations.ServiceInterfaceUrl + "/user/guestLogin.jhtml";

		public static string USER_RECORD_LOGIN = Configurations.ServiceInterfaceUrl + "/user/recordLogin.jhtml";

		public static string PRIV_GET_PRIV_INFO = Configurations.ServiceInterfaceUrl + "/priv/getPrivInfo.jhtml";

		public static string GET_IS_NEED_TRIGGER_SURVER = Configurations.ServiceInterfaceUrl + "/survey/getIsNeedTriggerSurvey.jhtml";

		public static string SURVEY_REFRESH = Configurations.ServiceInterfaceUrl + "/survey/refreshTrigger.jhtml";

		public static string SURVEY_GET_QUESTIONS = Configurations.ServiceInterfaceUrl + "/survey/getAllQuestions.jhtml";

		public static string SURVEY_RECORD = Configurations.ServiceInterfaceUrl + "/survey/record.jhtml";

		public static string FEEDBACK_GET_LIST = Configurations.ServiceInterfaceUrl + "/feedback/getFeedbackList.jhtml";

		public static string FEEDBACK_GET_INFO = Configurations.ServiceInterfaceUrl + "/feedback/getFeedbackInfo.jhtml";

		public static string FEEDBACK_FILE_SINGNATURE = Configurations.ServiceInterfaceUrl + "/feedback/fileSignatureUrl.jhtml";

		public static string FEEDBACK_GET_HELPFUL = Configurations.ServiceInterfaceUrl + "/feedback/replyHelpful.jhtml";

		public static string FEEDBACK_GET_UPLOAD = Configurations.ServiceInterfaceUrl + "/feedback/postFeedbackInfo.jhtml";

		public static string FEEDBACK_GET_UPLOAD_GUEST = Configurations.ServiceInterfaceUrl + "/feedback/guestPostFeedbackInfo.jhtml";

		public static string FEEDBACK_GET_ISSUE_INFO = Configurations.ServiceInterfaceUrl + "/feedback/getFeedbackIssueInfo.jhtml";

		public static string FEEDBACK_BACKUP_RESTORE = Configurations.ServiceInterfaceUrl + "/dataCollection/addBackupRestore.jhtml";

		public static string GET_FASTBOOTDATA_RECIPE = Configurations.ServiceInterfaceUrl + "/rescueDevice/getRescueModelRecipe.jhtml";

		public static string UPLOAD_DOWNLOAD_SPEEDINFO = Configurations.ServiceInterfaceUrl + "/dataCollection/romDownloadInfo.jhtml";

		public static string RESUCE_FAILED_UPLOAD = Configurations.ServiceInterfaceUrl + "/dataCollection/uploadFile.jhtml";

		public static string FEEDBACK_NO_TRANSLATE = Configurations.ServiceInterfaceUrl + "/dataCollection/untranslatedSentences.jhtml";

		public static string USER_BEHAVIOR_COLLECTION = Configurations.ServiceInterfaceUrl + "/dataCollection/addUserBehavior.jhtml";

		public static string UPLOAD_RESCUE_TOOL_LOG = Configurations.ServiceInterfaceUrl + "/dataCollection/nativeToolLog.jhtml";

		public static string COLLECTION_RESCUE_SUCCESS_LOG_UPLOAD = Configurations.ServiceInterfaceUrl + "/dataCollection/rescueSuccessLog.jhtml";

		public static string COLLECTION_ASSISTANTAPP = Configurations.ServiceInterfaceUrl + "/dataCollection/assistantApp.jhtml";

		public static string MOLI_INFO = Configurations.ServiceInterfaceUrl + "/moli/moliAndLena.jhtml";

		public static string CHECK_MA_VERSION = Configurations.ServiceInterfaceUrl + "/apk/download.jhtml";

		public static string FORMAT_LENOVOID_ACCOUNT = "https://passport.lenovo.com/interserver/authen/1.2/getaccountid?lpsust={0}&realm=lmsaclient";
	}
}
namespace lenovo.mbg.service.common.webservices.WebApiServices
{
	public class WarrantyService : ApiService
	{
		public static string SupportUrl = "https://supportapi.lenovo.com/v3/warranty/";

		public static string SdeToken = "https://microapi-us-sde.lenovo.com/token";

		public static string SdeUrl = "https://microapi-us-sde.lenovo.com/v1.0/service/poi_request";

		public static string IbaseUrl = "https://ibase.lenovo.com/POIRequest.aspx";

		protected static string Brand_Lenovo = "Lenovo";

		protected static string Brand_Motorola = "Motorola";

		public string GetSupportWarranty(string data)
		{
			if (string.IsNullOrEmpty(data))
			{
				return null;
			}
			return RequestContent(WebApiUrl.CALL_API_URL, new
			{
				key = "WARRANTY_URL",
				param = data
			})?.ToString();
		}

		public string GetSdeWarranty(string data)
		{
			if (string.IsNullOrEmpty(data))
			{
				return null;
			}
			data = ((data.Length > 10) ? "IMEI" : "") + data.Trim();
			object obj = RequestContent(WebApiUrl.CALL_API_URL, new
			{
				key = "POI_V1_URL",
				param = data
			});
			if (obj == null)
			{
				return null;
			}
			string text = obj.ToString();
			if (!text.Contains("errorCode"))
			{
				return text;
			}
			return string.Empty;
		}

		public string GetIbaseWarranty(string data)
		{
			if (string.IsNullOrEmpty(data))
			{
				return null;
			}
			data = ((data.Length > 10) ? "IMEI" : "") + data.Trim();
			return RequestContent(WebApiUrl.CALL_API_URL, new
			{
				key = "POI_URL",
				param = data
			})?.ToString();
		}

		public static int GetBuyedWarranty(string region, string imei)
		{
			string key = "grant_type";
			string value = "client_credentials";
			if (RequestPostFormData("https://api-pre-mds-us.lenovo.com/auth/oauth/token", out var result, new Dictionary<string, string> { { key, value } }, Resources.Name, Resources.Code) && !string.IsNullOrEmpty(result))
			{
				string text = JsonHelper.DeserializeJson2Jobjcet(result).Value<string>("access_token");
				string body = JsonHelper.SerializeObject2Json(new Dictionary<string, object>
				{
					{ "country", region },
					{ "entitlement_flag", "ALL_ENTITLEMENTS" },
					{ "service_channel", 2 },
					{ "unit_identifier", imei },
					{ "warranty_flag", "Y" }
				});
				Dictionary<string, string> headers = new Dictionary<string, string> { 
				{
					"Authorization",
					"Bearer " + text
				} };
				JObject jObject = JsonHelper.DeserializeJson2Jobjcet(WebApiHttpRequest.Request("https://api-pre-mds-us.lenovo.com/order/order/rnt/getUnit", body, headers).content?.ToString());
				if (jObject != null)
				{
					JToken jToken = jObject.SelectToken("$.data.entitlement.device_service_contract");
					if (jToken != null && jToken is JArray)
					{
						return (JArray.FromObject(jToken).Count > 0) ? 1 : 0;
					}
				}
			}
			return -1;
		}

		public Task<T> GetSupportWarrantyInfoAsync<T>(string data) where T : class, new()
		{
			return Task.Run(delegate
			{
				string supportWarranty = GetSupportWarranty(data);
				if (!string.IsNullOrEmpty(supportWarranty) && !supportWarranty.Contains("Duplicated"))
				{
					JObject jObject = JsonHelper.DeserializeJson2Jobjcet(supportWarranty);
					JToken jToken = jObject.SelectToken("$.Warranties")?.OrderByDescending((JToken n) => n.Value<string>("End")).FirstOrDefault();
					string value = jObject.SelectToken("$.Serial")?.ToString();
					if (jToken != null)
					{
						string value2 = null;
						JToken jToken2 = jObject.SelectToken("$.Countries");
						if (jToken2 != null && jToken2.HasValues)
						{
							List<string> values = (from n in JArray.FromObject(jToken2)
								select n.Value<string>("Name")).ToList();
							value2 = string.Join(", ", values);
						}
						try
						{
							DateTime dateTime = DateTime.Parse(jToken.Value<string>("End"));
							DateTime dateTime2 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd"));
							string value3 = DateTime.Parse(jToken.Value<string>("Start")).ToString("yyyy-MM-dd");
							string value4 = dateTime.ToString("yyyy-MM-dd");
							int num = (dateTime.Year - dateTime2.Year) * 12 + dateTime.Month - dateTime2.Month;
							int days = dateTime.Subtract(dateTime2).Days;
							string value5 = dateTime2.ToString("MMM.yyyy", new CultureInfo("en-US"));
							string value6 = dateTime.ToString("MMM.yyyy", new CultureInfo("en-US"));
							return JsonHelper.DeserializeJson2Object<T>(JsonHelper.SerializeObject2Json(new Dictionary<string, object>
							{
								{ "Start", value5 },
								{ "End", value6 },
								{ "MonthDiff", num },
								{ "ExpriedMonth", num },
								{ "ExpriedDays", days },
								{
									"InWarranty",
									dateTime2 <= dateTime
								},
								{ "ShipLocation", value2 },
								{ "Brand", Brand_Lenovo },
								{ "WarrantyStartDate", value3 },
								{ "WarrantyEndDate", value4 },
								{ "msn", value }
							}));
						}
						catch
						{
							return (T)null;
						}
					}
				}
				return (T)null;
			});
		}

		public Task<T> GetSdeWarrantyInfoAsync<T>(string data) where T : class, new()
		{
			return Task.Run(delegate
			{
				string sdeWarranty = GetSdeWarranty(data);
				if (!string.IsNullOrEmpty(sdeWarranty))
				{
					JObject jObject = JsonHelper.DeserializeJson2Jobjcet(sdeWarranty);
					JToken jToken = jObject.SelectToken("$.serviceInfoList[0]");
					string text = jObject.SelectToken("$.machineInfo.productName")?.ToString();
					string value = jObject.SelectToken("$.machineInfo.serialNumber")?.ToString();
					string value2 = Brand_Lenovo;
					if (!string.IsNullOrEmpty(text) && Regex.IsMatch(text, "moto", RegexOptions.IgnoreCase))
					{
						value2 = Brand_Motorola;
					}
					if (jToken != null)
					{
						try
						{
							string value3 = jToken.Value<string>("countryName");
							string value4 = jToken.Value<string>("warrantyStartDate");
							string text2 = jToken.Value<string>("warrantyEndDate");
							DateTime dateTime = DateTime.Parse(text2);
							DateTime dateTime2 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd"));
							int num = (dateTime.Year - dateTime2.Year) * 12 + dateTime.Month - dateTime2.Month;
							int days = dateTime.Subtract(dateTime2).Days;
							string value5 = dateTime2.ToString("MMM.yyyy", new CultureInfo("en-US"));
							string value6 = dateTime.ToString("MMM.yyyy", new CultureInfo("en-US"));
							return JsonHelper.DeserializeJson2Object<T>(JsonHelper.SerializeObject2Json(new Dictionary<string, object>
							{
								{ "Start", value5 },
								{ "End", value6 },
								{ "MonthDiff", num },
								{ "ExpriedMonth", num },
								{ "ExpriedDays", days },
								{
									"InWarranty",
									dateTime2 <= dateTime
								},
								{ "ShipLocation", value3 },
								{ "Brand", value2 },
								{ "WarrantyStartDate", value4 },
								{ "WarrantyEndDate", text2 },
								{ "msn", value }
							}));
						}
						catch
						{
							return (T)null;
						}
					}
				}
				return (T)null;
			});
		}

		public Task<T> GetWarrantyInfo<T>(string data) where T : class, new()
		{
			Task<T>[] array = new Task<T>[2]
			{
				GetSupportWarrantyInfoAsync<T>(data),
				GetSdeWarrantyInfoAsync<T>(data)
			};
			Task[] tasks = array;
			Task.WaitAll(tasks);
			return array.FirstOrDefault((Task<T> p) => p.Result != null) ?? array[0];
		}

		private static bool RequestPostFormData(string url, out string result, Dictionary<string, string> formdata, string username, string password)
		{
			//IL_0003: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Expected O, but got Unknown
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Expected O, but got Unknown
			//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ba: Expected O, but got Unknown
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Expected O, but got Unknown
			result = null;
			try
			{
				HttpClient val = new HttpClient();
				try
				{
					MultipartFormDataContent val2 = new MultipartFormDataContent();
					try
					{
						((HttpHeaders)((HttpContent)val2).Headers).Add("ContentType", "multipart/form-data;charset=UTF-8");
						if (formdata != null && formdata.Count > 0)
						{
							foreach (KeyValuePair<string, string> formdatum in formdata)
							{
								val2.Add((HttpContent)new StringContent(formdatum.Value ?? ""), formdatum.Key);
							}
						}
						if (!string.IsNullOrEmpty(username))
						{
							string text = Convert.ToBase64String(Encoding.UTF8.GetBytes(username + ":" + password));
							val.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", text);
						}
						Task<HttpResponseMessage> task = val.PostAsync(url, (HttpContent)(object)val2);
						task.Wait();
						if (task.Result.IsSuccessStatusCode)
						{
							Task<string> task2 = task.Result.Content.ReadAsStringAsync();
							task2.Wait();
							result = task2.Result;
							return true;
						}
						return false;
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
			}
			catch (Exception exception)
			{
				LogHelper.LogInstance.Error("request url: " + url, exception);
				return false;
			}
		}
	}
	public class ApiService : ApiBaseService
	{
		public object RequestContent(string url, object parameter, int tryCount = 3, Dictionary<string, string> headers = null, HttpMethod method = HttpMethod.POST, string contentType = "application/json", bool author = true, bool failedSave = false)
		{
			return RequestBase(url, parameter, tryCount, headers, method, contentType, author, failedSave).content;
		}

		public T RequestContent<T>(string url, object parameter, int tryCount = 3, Dictionary<string, string> headers = null, HttpMethod method = HttpMethod.POST, string contentType = "application/json", bool author = true, bool failedSave = false) where T : class, new()
		{
			ResponseModel<object> responseModel = RequestBase(url, parameter, tryCount, headers, method, contentType, author, failedSave);
			if (responseModel.content != null)
			{
				return JsonHelper.DeserializeJson2Object<T>(responseModel.content.ToString());
			}
			return null;
		}

		public ResponseModel<T> Request<T>(string url, object parameter, int tryCount = 3, Dictionary<string, string> headers = null, HttpMethod method = HttpMethod.POST, string contentType = "application/json", bool author = true, bool failedSave = false) where T : class, new()
		{
			ResponseModel<object> responseModel = RequestBase(url, parameter, tryCount, headers, method, contentType, author, failedSave);
			ResponseModel<T> responseModel2 = new ResponseModel<T>
			{
				code = responseModel.code,
				desc = responseModel.desc,
				success = responseModel.success
			};
			if (responseModel.content != null)
			{
				responseModel2.content = JsonHelper.DeserializeJson2Object<T>(responseModel.content.ToString());
			}
			return responseModel2;
		}

		public ResponseModel<string> Request(string url, object parameter, int tryCount = 3, Dictionary<string, string> headers = null, HttpMethod method = HttpMethod.POST, string contentType = "application/json", bool author = true, bool failedSave = false)
		{
			ResponseModel<object> responseModel = RequestBase(url, parameter, tryCount, headers, method, contentType, author, failedSave);
			return new ResponseModel<string>
			{
				code = responseModel.code,
				desc = responseModel.desc,
				success = responseModel.success,
				content = responseModel.content?.ToString()
			};
		}
	}
	public class ApiBaseService
	{
		public virtual ResponseModel<object> RequestBase(string url, object aparams, int tryCount = 3, Dictionary<string, string> headers = null, HttpMethod method = HttpMethod.POST, string contentType = "application/json", bool author = true, bool failedSave = false)
		{
			ResponseModel<object> responseModel;
			do
			{
				responseModel = func(url, aparams);
				if (responseModel.success)
				{
					break;
				}
				Thread.Sleep(new Random().Next(1000));
			}
			while (--tryCount > 0);
			if (failedSave && !responseModel.success)
			{
				AsyncSaveData(url, aparams);
			}
			return responseModel;
			ResponseModel<object> func(string uri, object data)
			{
				return WebApiHttpRequest.Request(uri, (method == HttpMethod.POST) ? new RequestModel(data).ToString() : null, headers, method, contentType, author);
			}
		}

		public virtual async Task<bool> UploadAsync(string url, List<string> files, Dictionary<string, string> headers, bool extraHeader = false, bool author = true)
		{
			return await WebApiHttpRequest.UploadAsync(url, files, headers, extraHeader, author);
		}

		private void AsyncSaveData(string url, object data)
		{
			Task.Factory.StartNew(delegate
			{
				JArray jArray = FileHelper.ReadJtokenWithAesDecrypt<JArray>(Configurations.UserRequestRecordsFile, "$.content", isDateAsStr: true);
				if (jArray == null)
				{
					jArray = JArray.Parse("[]");
				}
				JToken jToken = jArray.FirstOrDefault((JToken n) => n.Value<string>("url") == url);
				if (jToken == null)
				{
					jToken = new JObject
					{
						{ "url", url },
						{
							"datas",
							JArray.Parse("[]")
						}
					};
					jArray.Add(jToken);
				}
				JArray jArray2 = jToken.SelectToken("$.datas") as JArray;
				if (jArray2 == null)
				{
					jArray2 = (JArray)(jToken["datas"] = JArray.Parse("[]"));
				}
				try
				{
					jArray2.Add(JToken.FromObject(data));
				}
				catch (Exception ex)
				{
					LogHelper.LogInstance.Error("BaseService.AsyncSaveData Exception: " + ex.ToString());
				}
				FileHelper.WriteJsonWithAesEncrypt(Configurations.UserRequestRecordsFile, "content", jArray);
			});
		}
	}
	internal class RsaService
	{
		public static string InitPublicKey()
		{
			new RSAKey();
			_ = string.Empty;
			ResponseModel<object> responseModel = WebApiHttpRequest.Request(WebApiUrl.GET_PUBLIC_KEY, null, null, HttpMethod.POST, "application/json", addAuthorizationHeader: true);
			if (responseModel.success && !string.IsNullOrEmpty(responseModel.desc) && RsaHelper.RSAPublicKeyJava2DotNet(responseModel.desc, out var key))
			{
				return key;
			}
			return null;
		}
	}
}
namespace lenovo.mbg.service.common.webservices.Properties
{
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "16.0.0.0")]
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
					resourceMan = new ResourceManager("lenovo.mbg.service.common.webservices.Properties.Resources", typeof(Resources).Assembly);
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

		internal static string Code => ResourceManager.GetString("Code", resourceCulture);

		internal static string IbaseParam => ResourceManager.GetString("IbaseParam", resourceCulture);

		internal static string Name => ResourceManager.GetString("Name", resourceCulture);

		internal static string SdeParam => ResourceManager.GetString("SdeParam", resourceCulture);

		internal Resources()
		{
		}
	}
}
namespace lenovo.mbg.service.common.webservices.WebApiModel
{
	public class RespOrders
	{
		public string id { get; set; }

		public string username { get; set; }

		public string email { get; set; }

		public string vipName { get; set; }

		public int freeAmount { get; set; }

		public int usedFreeAmount { get; set; }

		public bool multiDevice { get; set; }

		public List<OrderItem> enableOrderDtos { get; set; }

		public List<OrderItem> unableOrderDtos { get; set; }

		public bool popUp { get; set; }

		public int popMode { get; set; }
	}
	public class OrderItem
	{
		public int orderId { get; set; }

		public string rid { get; set; }

		public string orderStatus { get; set; }

		public string type { get; set; }

		public long? usingDate { get; set; }

		public int? purchaseAmount { get; set; }

		public long? effectiveDate { get; set; }

		public long? expiredDate { get; set; }

		public int? imeiCount { get; set; }

		public int imeiUsedCount { get; set; }

		public string macAddressRsa { get; set; }

		public string unit { get; set; }

		public bool display { get; set; }

		public bool refund { get; set; }

		public bool enable { get; set; }

		public string orderLevelDesc { get; set; }

		public string serverOrderStatus { get; set; }

		public List<FlashedDevModel> imeiDtos { get; set; }
	}
	public class FlashedDevModel
	{
		[JsonProperty("imei")]
		public string Imei { get; set; }

		[JsonProperty("modelName")]
		public string ModelName { get; set; }

		[JsonProperty("category")]
		public string Category { get; set; }

		[JsonProperty("createDate")]
		public long? createDate { get; set; }

		public DateTime FlashDate => new DateTime(1970, 1, 1).AddMilliseconds(createDate.Value);
	}
	public class PriceInfo
	{
		public string sku { get; set; }

		public float price { get; set; }

		public string cardName { get; set; }

		public string cardDesc { get; set; }

		public string country { get; set; }

		public string monetaryUnit { get; set; }
	}
	public class RSAKey
	{
		public string PublicKey { get; set; }

		public string PrivateKey { get; set; }
	}
	[Serializable]
	public class ToolVersionModel
	{
		[JsonProperty("id")]
		public string Id { get; set; }

		[JsonProperty("clientVersion")]
		public string VersionNumber { get; set; }

		[JsonProperty("filePath")]
		public string FilePath { get; set; }

		[JsonProperty("fileSize")]
		public long FileSize { get; set; }

		[JsonProperty("md5")]
		public string MD5 { get; set; }

		[JsonProperty("forceUpdate")]
		public bool IsForce { get; set; }

		[JsonProperty("releaseDate")]
		public string ReleaseDate { get; set; }

		[JsonProperty("releaseNotes")]
		public string ReleaseNotes { get; set; }
	}
	public class BaseRequestModel
	{
		public override string ToString()
		{
			return JsonHelper.SerializeObject2Json(this);
		}
	}
	[Serializable]
	public class RequestModel : BaseRequestModel
	{
		public Dictionary<string, string> client { get; set; }

		public object dparams { get; set; }

		public string language { get; set; }

		public string windowsInfo { get; set; }

		public RequestModel(object aparams)
		{
			language = WebApiContext.LANGUAGE;
			windowsInfo = WebApiContext.WINDOWS_VERSION + ", " + GlobalFun.GetSystemType();
			client = new Dictionary<string, string> { 
			{
				"version",
				WebApiContext.CLIENT_VERSION
			} };
			dparams = aparams;
		}

		public override string ToString()
		{
			return base.ToString();
		}
	}
	[Serializable]
	public class ResponseModel<T>
	{
		public bool success { get; set; }

		public string code { get; set; }

		public string desc { get; set; }

		public T content { get; set; }
	}
}
