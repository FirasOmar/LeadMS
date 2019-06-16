//using System;
//using System.Collections.Generic;
//using System.Data.Entity.Core.Objects;
//using System.IO;
//using System.Linq;
//using System.Text;
//using System.Web.Mvc;
//using CRM.Core;
//using CRM.Core.Helpers;
//using CRM.Core.SystemEnums;
//using CRM.DataEntity.Models;
//using CRM.Web.Controllers.APIs.Responses;
//using CRM.Web.Filters;
//using CRM.Web.Helpers;
//using CRM.Web.Models;
//using CRM.Web.Models.Reports;
//using CsvHelper;
//using PagedList;
//using Microsoft.Ajax.Utilities;
//using System.Data.Entity;

//namespace CRM.Web.Controllers
//{
//    public class ReportsController : BaseController
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();
//        // GET: Reports
//        [CustomAuthentication(PageName = "Reports", PermissionKey = "View")]
//        public ActionResult Index()
//        {
//            return View();
//        }

//        // GET: Reports/CasesByCategory
//        [CustomAuthentication(PageName = "Reports", PermissionKey = "View")]
//        public ActionResult CasesByCategory()
//        {
//            var result = ReportHelper.CasesByCategory(Request.Cookies["_culture"]);
//            return View(result);
//        }

//        // GET: Reports/CasesByStatus
//        [CustomAuthentication(PageName = "Reports", PermissionKey = "View")]
//        public ActionResult CasesByStatus()
//        {
//            var result = ReportHelper.CasesByStatus(Request.Cookies["_culture"]);
//            return View(result);
//        }

//        // GET: Reports/CasesSeverityByCategory
//        [CustomAuthentication(PageName = "Reports", PermissionKey = "View")]
//        public ActionResult CasesSeverityByCategory()
//        {
//            var result = ReportHelper.CasesSeverityByCategory(Request.Cookies["_culture"]);
//            return View(result);
//        }

//        // GET: Reports/CasesPriorityByCategory
//        [CustomAuthentication(PageName = "Reports", PermissionKey = "View")]
//        public ActionResult CasesPriorityByCategory()
//        {
//            var result = ReportHelper.CasesPriorityByCategory(Request.Cookies["_culture"]);
//            return View(result);
//        }

//        // GET: Reports/CreatedVsResolvedCasesPerWeek
//        [CustomAuthentication(PageName = "Reports", PermissionKey = "View")]
//        public ActionResult CreatedVsResolvedCasesPerWeek()
//        {
//            var result = ReportHelper.CreatedVsResolvedCasesPerWeek(Request.Cookies["_culture"]);
//            return View(result);
//        }


//        [CustomAuthentication(PageName = "Reports", PermissionKey = "View")]
//        public ActionResult UnresolvedCaseStatisticReport()
//        {
//            var result = ReportHelper.UnresolvedCaseStatisticReport(Request.Cookies["_culture"]);
//            return View(result);
//        }

//        // GET: Reports/ClosedCasesReport
//        [CustomAuthentication(PageName = "ClosedCasesReport", PermissionKey = "View")]
//        public ActionResult ClosedCasesReport(int? page, string searchText, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }

//            var closedCases = _db.StateHistories.Where(r => r.CurrentState == (int)GeneralEnums.StateEnum.Closed)
//                .Select(r => r.SystemCas);
//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                closedCases = closedCases.Where(r =>
//                    r.Title.Contains(searchText) || r.Tags.Contains(searchText) || r.Description.Contains(searchText));
//                ViewBag.searchText = searchText;
//            }
//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);
//            return View(closedCases.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
//        }

//        // GET: Reports/FullCasesReport
//        [CustomAuthentication(PageName = "FullCaseReport", PermissionKey = "View")]
//        public ActionResult FullCasesReport(int? page, string searchText, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }

//            var cases = _db.StateHistories.Select(r => r.SystemCas);
//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                cases = cases.Where(r =>
//                    r.Title.Contains(searchText) || r.Tags.Contains(searchText) || r.Description.Contains(searchText));
//                ViewBag.searchText = searchText;
//            }
//            Session["FullCasesReportSearchText"] = searchText;
//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);
//            return View(cases.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
//        }

//        // GET: Reports/FullCasesReport
//        [CustomAuthentication(PageName = "FullCaseReport", PermissionKey = "ExportToExcel")]
//        public FileStreamResult FullCasesReportDownload()
//        {
//            string searchText = Session["FullCasesReportSearchText"]?.ToString() ?? string.Empty;
//            var cases = _db.StateHistories.Select(r => r.SystemCas);
//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                cases = cases.Where(r =>
//                    r.Title.Contains(searchText) || r.Tags.Contains(searchText) || r.Description.Contains(searchText));
//                ViewBag.searchText = searchText;
//            }

//            var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//            var list = cases.ToList().Select(x =>
//                   new CaseViewModel()
//                   {
//                       Id = x.Id,
//                       Status = x.Status,
//                       Description = x.Description,
//                       CreatedOn = x.CreatedOn,
//                       DeletedOn = x.DeletedOn,
//                       CreatedBy = x.CreatedBy,
//                       Tags = x.Tags,
//                       Title = x.Title,
//                       Address = x.Address,
//                       Location = x.Location,
//                       TypeId = x.TypeId,
//                       AssigneeId = x.AssigneeId,
//                       AssigneeName = x.AssigneeId != null ?
//                           LanguageFallbackHelper.GetUserProfile((int)x.AssigneeId, langId)?.FullName ??
//                           string.Empty : string.Empty,
//                       CategoryId = x.CategoryId,
//                       CategoryName = x.CategoryId != null ? LookupHelper.GetLookupDetailsById((int)x.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                       PriorityId = x.PriorityId,
//                       PriorityName = x.PriorityId != null ? LookupHelper.GetLookupDetailsById((int)x.PriorityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                       SeverityId = x.SeverityId,
//                       SeverityName = x.SeverityId != null ? LookupHelper.GetLookupDetailsById((int)x.SeverityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                       UniqueId = x.UniqueId,
//                       Files = x.SystemCaseAttachments.Select(r => new FileResponse()
//                       {
//                           Id = r.SystemFile.Id,
//                           DisplayName = r.SystemFile.SystemFileTranslations.FirstOrDefault()?.DisplayName,
//                           FileUrl = r.SystemFile.FileUrl
//                       }).ToList(),
//                       Comments = x.SysCaseComments.Select(r => new CommentsViewModel()
//                       {
//                           Id = r.Id,
//                           Comment = r.Comment,
//                           CreatedBy = r.CreatedBy,
//                           CaseId = r.CaseId,
//                           CaseName = r.SystemCas.Title,
//                           Status = r.Status,
//                           CreatedOn = r.CreatedOn
//                       }).ToList()
//                   });
//            var result = WriteCsvToMemory(list);
//            var memoryStream = new MemoryStream(result);
//            return new FileStreamResult(memoryStream, "text/csv") { FileDownloadName = $"FullCasesReport-{DateTime.Now}.csv" };
//        }


//        // GET: Reports/CasesDaysByCategory
//        [CustomAuthentication(PageName = "CasesDaysByCategory", PermissionKey = "View")]
//        public ActionResult CasesDaysByCategory(int? page, string searchText, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }

//            var histories = _db.StateHistories
//                .Where(r => r.PreviousState == (int)GeneralEnums.StateEnum.Na ||
//                            r.CurrentState == (int)GeneralEnums.StateEnum.Closed);
//            var casesDaysByCategoryResult = new List<CasesDaysByCategoryViewModel>();
//            foreach (var history in histories.GroupBy(r => r.CaseId))
//            {
//                var caselist = history.OrderByDescending(c => c.Id).ToList();
//                if (caselist.Any(c => c.PreviousState == (int)GeneralEnums.StateEnum.Na) && caselist.Any(c => c.CurrentState == (int)GeneralEnums.StateEnum.Closed))
//                {
//                    var naState = caselist.FirstOrDefault(r => r.PreviousState == (int)GeneralEnums.StateEnum.Na);
//                    var closedState = caselist.LastOrDefault(r => r.PreviousState == (int)GeneralEnums.StateEnum.Closed);
//                    var casesDaysByCategory = new CasesDaysByCategoryViewModel()
//                    {
//                        CaseId = history.Key,
//                        CategoryId = naState?.SystemCas?.CategoryId ?? 0,
//                        CategoryName = LookupHelper.GetLookupDetailsById(naState?.SystemCas?.CategoryId ?? 0, Request.Cookies["_culture"])?.Name,
//                        CaseName = naState?.SystemCas?.Title ?? string.Empty,
//                        FormDate = naState?.CreatedOn,
//                        ToDate = closedState?.CreatedOn,
//                        Days = (closedState?.CreatedOn - naState?.CreatedOn)?.TotalDays ?? 0
//                    };
//                    casesDaysByCategoryResult.Add(casesDaysByCategory);
//                }
//            }

//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                casesDaysByCategoryResult = casesDaysByCategoryResult.Where(r =>
//                    r.CaseName.Contains(searchText) || r.CategoryName.Contains(searchText)).ToList();
//                ViewBag.searchText = searchText;
//            }
//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);
//            return View(casesDaysByCategoryResult.OrderByDescending(r => r.CategoryId).ToList().ToPagedList(pageNumber, pageSize));
//        }


//        // GET: Reports/PercentageOfResolvedCase
//        [CustomAuthentication(PageName = "PercentageOfResolvedCase", PermissionKey = "View")]
//        public ActionResult PercentageOfResolvedCase(int? page, DateTime? fromDate, DateTime? toDate, int? categoryId)
//        {
//            var result = new List<PercentageOfResolvedCaseViewModel>();

//            fromDate = fromDate != null ? fromDate : DateTime.Now.Date;
//            toDate = toDate != null ? toDate : DateTime.Now.Date;

//            var days = AllDatesBetween(fromDate, toDate);
//            ViewBag.fromDate = fromDate;
//            ViewBag.toDate = toDate;
//            ViewBag.categoryId = categoryId;
//            foreach (var day in days)
//            {
//                var count = _db.StateHistories
//                    .Count(r => r.PreviousState == (int)GeneralEnums.StateEnum.Resolved && r.Status == (int)GeneralEnums.StatusEnum.Active
//                           && r.SystemCas.CategoryId == categoryId && EntityFunctions.TruncateTime(r.CreatedOn) == EntityFunctions.TruncateTime(day));

//                var totalCount = _db.StateHistories
//                    .Count(r => EntityFunctions.TruncateTime(r.CreatedOn) == EntityFunctions.TruncateTime(day) && r.SystemCas.CategoryId == categoryId);
//                result.Add(new PercentageOfResolvedCaseViewModel()
//                {
//                    StateDate = day,
//                    Count = count / (totalCount == 0 ? 1.0 : totalCount)
//                });
//            }


//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);
//            return View(result.OrderByDescending(r => r.StateDate).ToList().ToPagedList(pageNumber, pageSize));
//        }

//        [CustomAuthentication(PageName = "CasesSentAsEmail", PermissionKey = "View")]
//        public ActionResult CasesSentByEmail(int? page, string fromDate, string toDate, int? createdById)
//        {
//            var result = _db.CasesByEmails.AsQueryable();
//            var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//            ViewBag.fromDate = fromDate;
//            ViewBag.toDate = toDate;

//            if (fromDate.IsNotNullOrEmpty())
//            {
//                var fromDateAsDateTime = fromDate.ConvertToDateTime();
//                result = result.Where(t => DbFunctions.TruncateTime(t.CreatedOn) >= DbFunctions.TruncateTime(fromDateAsDateTime));
//            }
//            if (toDate.IsNotNullOrEmpty())
//            {
//                var toDateAsDateTime = toDate.ConvertToDateTime();
//                result = result.Where(t => DbFunctions.TruncateTime(t.CreatedOn) <= DbFunctions.TruncateTime(toDateAsDateTime));
//            }

//            if (createdById.HasValue && createdById > 0)
//            {
//                var createdByProfile = LanguageFallbackHelper.GetUserProfile(createdById.Value, langId);
//                result = result.Where(t => t.CreatedBy == createdByProfile.Username);
//            }

//            var data = result.OrderByDescending(r => r.CreatedOn).ToList().Select(t => new CasesSentByEmailViewModel
//            {
//                Id = t.Id,
//                CreatedOn = t.CreatedOn,
//                CreatedBy = t.CreatedBy,
//                EmailDescription = t.EmailDescription,
//                SentTo = t.SentTo,
//                CreatedByProfile = LanguageFallbackHelper.GetUserProfileByUsername(t.CreatedBy, langId),
//                FilePath = t.FilePath
//            }).ToList();

//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);
//            return View(data.ToPagedList(pageNumber, pageSize));
//        }

//        // GET: Reports/CasesSlaByCategory
//        [CustomAuthentication(PageName = "CasesSlaByCategory", PermissionKey = "View")]
//        public ActionResult CasesSlaByCategory()
//        {
//            var result = ReportHelper.CasesSlaByCategory(Request.Cookies["_culture"]);
//            return View(result);
//        }

//        private IEnumerable<DateTime> AllDatesBetween(DateTime? start, DateTime? end)
//        {
//            for (var day = start.Value.Date; day <= end; day = day.AddDays(1))
//                yield return day;
//        }

//        public byte[] WriteCsvToMemory(IEnumerable<CaseViewModel> records)
//        {
//            using (var memoryStream = new MemoryStream())
//            using (var streamWriter = new StreamWriter(memoryStream, Encoding.UTF8))
//            using (var csvWriter = new CsvWriter(streamWriter))
//            {
//                csvWriter.WriteRecords(records);
//                streamWriter.Flush();
//                return memoryStream.ToArray();
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