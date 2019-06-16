//using System;
//using System.Data.Entity;
//using System.Linq;
//using System.Web.Mvc;
//using CRM.Core;
//using CRM.Core.Helpers;
//using CRM.Core.SystemEnums;
//using CRM.DataEntity.Models;
//using CRM.Web.Filters;
//using CRM.Web.Helpers;
//using CRM.Web.Models;
//using PagedList;

//namespace CRM.Web.Controllers
//{
//    public class ContactUsController : BaseController
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();

//        // GET: ContactUs
//        [CustomAuthentication(PageName = "ContactUs", PermissionKey = "View")]
//        public ActionResult Index(int? page, string searchText, int resetTo = 0)
//        {


//            if (resetTo == 1)
//            {
//                page = 1;
//            }

//            var status = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
//            ViewBag.Status = new SelectList(status, "Id", "Name");
//            ViewBag.StatusEdit = new SelectList(status, "Id", "Name");

          
//            var contactUsList = _db.ContactUs.Where(r =>
//                                      r.Status != (int)GeneralEnums.StatusEnum.Deleted);

//            if (!string.IsNullOrWhiteSpace(searchText))
//            {
//                contactUsList = contactUsList.Where(r => r.Email.Contains(searchText) || r.Name.Contains(searchText));
//                ViewBag.searchText = searchText;
//            }

//            var result = contactUsList.ToList().Select(r =>
//              new ContactUsViewModel
//              {
//                  Id = r.Id,
//                  Status = r.Status,
//                  Email = r.Email,
//                  CreatedBy = r.CreatedBy,
//                  CreatedOn = r.CreatedOn,
//                  DeletedOn = r.DeletedOn,
//                  Address = r.Address,
//                  InsertDate = r.InsertDate,
//                  Message = r.Message,
//                  Name = r.Name,
//                  Mobile = r.Mobile
//              }
//            );

//            var pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);


//            return View(result.OrderByDescending(r => r.Id).ToPagedList(pageNumber, pageSize));
//        }


//        [HttpGet]
//        [CustomAuthentication(PageName = "ContactUs", PermissionKey = "Edit")]
//        public ActionResult EditContactUs(int id)
//        {

//            try
//            {
//                var contactUs = _db.ContactUs.Find(id);
//                if (contactUs != null && contactUs.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    var contactUsViewModel = new ContactUsViewModel()
//                    {
//                        Id = contactUs.Id,
//                        Email = contactUs.Email,
//                        Status = contactUs.Status,
//                        Name=contactUs.Name,
//                        Mobile=contactUs.Mobile,
//                        Address= contactUs.Address,
//                        Message=contactUs.Message,

//                    };

//                    return Json(contactUsViewModel, JsonRequestBehavior.AllowGet);
//                }
//                return Json(null, JsonRequestBehavior.AllowGet);

//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While Editing Contact Us (Get)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "ContactUs", PermissionKey = "Edit")]
//        public ActionResult EditContactUs(ContactUsViewModel contactUsViewModel)
//        {
//            try
//            {
//                var contactUs = _db.ContactUs.Find(contactUsViewModel.Id);
//                if (contactUs != null && contactUs.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
                    
//                    contactUs.Name = contactUsViewModel.Name;
//                    contactUs.Email = contactUsViewModel.Email;
//                    contactUs.Address = contactUsViewModel.Address;
//                    contactUs.Message = contactUsViewModel.Message;
//                    contactUs.Mobile = contactUsViewModel.Mobile;
//                    contactUs.Status = contactUsViewModel.Status;

//                    _db.Entry(contactUs).State = EntityState.Modified;
//                    _db.SaveChanges();
//                }
//                return Json(contactUsViewModel, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While Editing Contact Us (Post)");
//                return null;
//            }

//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "ContactUs", PermissionKey = "Delete")]
//        public ActionResult DeleteContactUs(int id)
//        {
//            try
//            {
//                var contactUs = _db.ContactUs.Find(id);
//                if (contactUs != null && contactUs.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    contactUs.Status = (int)GeneralEnums.StatusEnum.Deleted;
//                    contactUs.DeletedOn = DateTime.Now;
//                    _db.Entry(contactUs).State = EntityState.Modified;
//                    _db.SaveChanges();


//                    return Json(new ContactUsViewModel()
//                    {
//                        Id = contactUs.Id,
//                        Status = contactUs.Status,
//                        CreatedBy = contactUs.CreatedBy,
//                        CreatedOn = contactUs.CreatedOn,
//                        DeletedOn = contactUs.DeletedOn,
//                        Email = contactUs.Email,
//                        Address = contactUs.Address,
//                        InsertDate = contactUs.InsertDate,
//                        Message = contactUs.Message,
//                        Name = contactUs.Name,
//                        Mobile = contactUs.Mobile

//                    }, JsonRequestBehavior.AllowGet);
//                }
//                return Json(null, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {

//                LogHelper.LogException(User.Identity.Name, ex, "Error While Delete Contact Us");
//                return null;
//            }

//        }

//        protected override void Dispose(bool disposing)
//        {
//            if (disposing)
//            {
//                _db.Dispose();
//            }
//            base.Dispose(disposing);
//        }
//    }
//}
