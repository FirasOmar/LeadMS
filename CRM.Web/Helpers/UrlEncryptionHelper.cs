using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using CRM.Core.Helpers;

namespace CRM.Web.Helpers
{
    public static class UrlEncryption
    {
        public static string Encrypt(string stringToEncrypt)
        {
            var inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
            byte[] rgbIv = { 0x21, 0x43, 0x56, 0x87, 0x10, 0xfd, 0xea, 0x1c };
            try
            {
                var setting = SettingHelper.GetOrCreate("SystemDefaults_UrlEncryption_Password", "Fur$c@1A$D");
                var key = Encoding.UTF8.GetBytes(setting.Value);
                var des = new DESCryptoServiceProvider();
                var ms = new MemoryStream();
                var cs = new CryptoStream(ms, des.CreateEncryptor(key, rgbIv), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                return Convert.ToBase64String(ms.ToArray());
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public static string EncryptPhoto(String input)
        {
            var encoding = Encoding.Unicode;
            var stringBytes = encoding.GetBytes(input);
            var sbBytes = new StringBuilder(stringBytes.Length * 2);
            foreach (byte b in stringBytes)
            {
                sbBytes.AppendFormat("{0:X2}", b);
            }
            return sbBytes.ToString();
        }

        public static string Decrypt(string encryptedText)
        {
            byte[] rgbIv = { 0x21, 0x43, 0x56, 0x87, 0x10, 0xfd, 0xea, 0x1c };

            try
            {
                var setting = SettingHelper.GetOrCreate("SystemDefaults_UrlEncryption_Password", "Fur$c@1A$D");
                var key = Encoding.UTF8.GetBytes(setting.Value);
                var des = new DESCryptoServiceProvider();
                var inputByteArray = Convert.FromBase64String(encryptedText);
                var ms = new MemoryStream();
                var cs = new CryptoStream(ms, des.CreateDecryptor(key, rgbIv), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                var encoding = Encoding.UTF8;
                return encoding.GetString(ms.ToArray());
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
    }
}