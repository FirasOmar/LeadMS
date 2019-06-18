using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRM.Web.Helpers
{
    public static class SessionHelper
    {


        public static void SetCompanyId(int companyId)
        {
            HttpContext.Current.Session["CompanyId"] = companyId;

        }

        public static int GetCompanyId()
        {
            return (int)HttpContext.Current.Session["CompanyId"];

        }


        public static bool CheckSessionCompanyId()
        {
            var flag = HttpContext.Current.Session["CompanyId"] != null;
            return flag;
        }



    }
}