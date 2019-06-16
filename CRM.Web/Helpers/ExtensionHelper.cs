using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace CRM.Web.Helpers
{
    public static class ExtensionHelper
    {

        public static bool IsNotNullOrEmpty(this string s)
        {
            return !(string.IsNullOrEmpty(s) || string.IsNullOrWhiteSpace(s));
        }

        public static DateTime ConvertToDateTime(this string input)
        {
            var tmp = DateTime.MinValue;
            DateTime.TryParseExact(input, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out tmp);
            return tmp;
        }
        public static TimeSpan ConvertToTimeSpan(this string input)
        {
            DateTime dateTime = DateTime.ParseExact(input,
                                   "hh:mm", CultureInfo.InvariantCulture);
            return dateTime.TimeOfDay;
        }

        public static string RemoveSpecialCharacters(this string str)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char c in str)
            {
                if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '.' || c == '_')
                {
                    sb.Append(c);
                }
            }
            return sb.ToString();
        }

        public static IEnumerable<List<T>> splitList<T>(List<T> locations, int nSize = 30)
        {
            for (int i = 0; i < locations.Count; i += nSize)
            {
                yield return locations.GetRange(i, Math.Min(nSize, locations.Count - i));
            }
        }
    }
}