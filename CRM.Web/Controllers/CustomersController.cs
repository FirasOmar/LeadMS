//using CRM.DataEntity.Models;
//using CRM.Web.Helpers;
//using CRM.Web.Models;
//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Net;
//using System.Web;
//using System.Web.Mvc;
//using System.Web.Script.Services;
//using System.Web.Services;
////using CRM.Core;

//namespace CRM.Web.Controllers
//{
//    public class CustomersController : Controller
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();
//        // GET: Customers
//        public ActionResult Index()
//        {
//            var LeadList = _db.Customers.ToList();
//            var LeadList_result = LeadList.Select(r =>
//             new CustomerViewModel
//             {
//                 Id = r.Id,
//                 Status =(int) r.Status,
//                 Email = r.Email,    
//                 Name = r.Name,
//                 Mobile = r.Mobile
//             }
//           );
//            var list = new List<SelectListItem>
//                 {
//                new SelectListItem{ Text="New", Value = "1", Selected = true},
//                new SelectListItem{ Text="Qualified", Value = "2" },
//                new SelectListItem{ Text="Won", Value = "3"},
//                 new SelectListItem{ Text="Lost", Value = "4"}
//                  };

//            ViewData["LeadStatusList"] = list;
//            return View(LeadList_result);
//        }
//        public ActionResult LeadStatus()
//        {
            
//            return View();
//        }
//        // GET: Customers/Details/5
//        public ActionResult Details( int id)
//        {
//            //if (!formId.IsNotNullOrEmpty())
//            //{
//            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            //}
//         //   var formData = _db.Customers.Where(t => t.Id == id);

//            return View();
//        }

//        // GET: Customers/Create
//        public ActionResult Create()
//        {
//            return View();
//        }

//        // POST: Customers/Create
//        [HttpPost]
//        public ActionResult Create(CustomerViewModel customer)
//        {
//            try
//            {
//            //    // TODO: Add insert logic here
//            //    var cust = new Customer()
//            //    {
//            //    Language = customer.Language,
//            //    Mobile = customer.Mobile,
//            //    Name = customer.Name,
//            //    Status = customer.Status,
//            //    Phone = customer.Phone,
//            //    Website = customer.Website,
//            //    Address = customer.Address,
//            //    Email = customer.Email
//            //};
//            //    _db.Customers.Add(cust);
//            //    _db.SaveChanges();
//                return RedirectToAction("Index");
//            }
//            catch
//            {
//                return View();
//            }
//        }

//        // GET: Customers/Edit/5
//        public ActionResult Edit(int id)
//        {
//            var formData = _db.Customers.Where(t => t.Id == id).FirstOrDefault();
//            return View(formData);
//        }

//        // POST: Customers/Edit/5
//        [HttpPost]
//        public ActionResult Edit(CustomerViewModel customer)
//        {
//            try
//            {
//                // TODO: Add update logic here
//                var cust = _db.Customers.Find(customer.Id);
//                if (cust != null)
//                {
//                    cust.Language =customer.Language;
//                    cust.Mobile =customer.Mobile;
//                    cust.Name =customer.Name;
//                    cust.Status =customer.Status;
//                    cust.Phone =customer.Phone;
//                    cust.Website =customer.Website;
//                    cust.Address =customer.Address;
//                    cust.Email = customer.Email;
//                    _db.SaveChanges();
//                }
               
//                return RedirectToAction("Index");
//            }
//            catch(Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Lead (Post)");
//                return null;
//            }
//        }

//        // GET: Customers/Delete/5
//        public ActionResult Delete(int id)
//        {
//            return View();
//        }

//        // POST: Customers/Delete/5
//        [HttpPost]
//        public ActionResult Delete(int id, FormCollection collection)
//        {
//            try
//            {
//                // TODO: Add delete logic here

//                return RedirectToAction("Index");
//            }
//            catch
//            {
//                return View();
//            }
//        }

//        [HttpPost]
//        public JsonResult UpdateCustomer(CustomerViewModel customer)
//        {
//            try
//            {
//                var cust = _db.Customers.Find(customer.Id);
//                if(cust != null)
//                {
//                    cust.Status = customer.Status;
//                    _db.SaveChanges();
//                }
//                return Json(customer, JsonRequestBehavior.AllowGet);
//            }
//            catch(Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Department (Post)");
//                return null;
//            }
//        }
//    }
//}
