using System.Collections.Generic;
using System.Web.Mvc;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Web.Models;
using CRM.DataEntity.Models;

namespace CRM.Web.Controllers
{
    public class SearchController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        // GET: Search
        public ActionResult GeneralSearch(string generalSearchTxt)
        {
            int langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
            var result = new List<GeneralSearchViewModel>();

            IEnumerable<GeneralSearchViewModel> pages = null;
            if (!(User.IsInRole(Constants.Roles.Administrator) || User.IsInRole(Constants.Roles.ContentAdmin)))
            {
                
            }
            else
            {
                
            }
            
            return View(result);
        }

        [HttpPost]
        public ActionResult General(string generalSearchTxt)
        {
            return RedirectToAction("GeneralSearch", new { generalSearchTxt = generalSearchTxt });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}