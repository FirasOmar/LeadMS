using System.Collections.Generic;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Linq;
using System.Text;

namespace CRM.Core.Helpers
{
    /// <summary>
    /// JSON Serialization and Deserialization Assistant Class
    /// </summary>
    public class JsonHelper
    {
        /// <summary>
        /// JSON Serialization
        /// </summary>
        public static string JsonSerializer<T>(T t)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
            MemoryStream ms = new MemoryStream();
            ser.WriteObject(ms, t);
            string jsonString = Encoding.UTF8.GetString(ms.ToArray());
            ms.Close();
            return jsonString;
        }
        /// <summary>
        /// JSON Deserialization
        /// </summary>
        public static T JsonDeserialize<T>(string jsonString)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString));
            T obj = (T)ser.ReadObject(ms);
            return obj;
        }
        static string EscapeForJson(string s)
        {
            string quoted = System.Web.Helpers.Json.Encode(s);
            return quoted.Substring(1, quoted.Length - 2);
        }

        private string DicToJson(Dictionary<string, string> dict)
        {
            var entries = dict.Select(d =>
                $"\"{d.Key}\": {d.Value}");
            return "{" + string.Join(",", entries) + "}";
        }
    }
}
