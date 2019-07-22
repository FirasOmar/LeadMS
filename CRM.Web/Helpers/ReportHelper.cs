using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using Chart.Mvc.ComplexChart;
using Chart.Mvc.SimpleChart;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Models;
//using CRM.Web.Models.Reports;
using CRM.Core.Helpers;
using System.IO;
using CsvHelper;
using System.Text;
using System.Web.Http.Results;
using System.Web.Mvc;
using System.Data;
using System.Web.WebPages;
using System.Data.Entity;

namespace CRM.Web.Helpers
{
    public static class ReportHelper
    {
        private static readonly List<string> Colors = new List<string> { "#F7464A", "#46BFBD", "#FDB45C", "#B48EAD", "#949FB1", "#4D5360", "#3B5323", "#FF4D00" };
        private static readonly List<string> Highlight = new List<string> { "#FF5A5E", "#5AD3D1", "#FFC870", "#C69CBE", "#A8B3C5", "#616774", "#78AB46", "#FF9466" };

        //public static ReportViewModel CasesByCategory(HttpCookie cookie)
        //{
        //    using (var db = new CrmSystemEntities())
        //    {
        //        ReportViewModel result;
        //        try
        //        {
        //            var dataset = new ComplexDataset();
        //            var data = new List<double>();
        //            var labels = new List<string>();
        //            var complaintCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.CaseCategory, cookie);
        //            var emergencyCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.EmergencyCategories, cookie);
        //            var formCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.FormCategories, cookie);
        //            var jobCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.JobCategories, cookie);
        //            var tenderCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.TenderCategories, cookie);
        //            var categories = complaintCategories;
        //            categories = complaintCategories;
        //            categories.AddRange(formCategories);
        //            categories.AddRange(jobCategories);
        //            categories.AddRange(tenderCategories);
        //            categories.AddRange(emergencyCategories);
        //            var chartData = new ComplexData();
        //            int i = 0;
        //            foreach (var item in categories)
        //            {
        //                int catCount = db.SystemCases.Count(r => r.CategoryId == item.Id);
        //                if (catCount > 0)
        //                {
        //                    if (i >= Colors.Count)
        //                    {
        //                        i = 0;
        //                    }

        //                    labels.Add(item.Name);
        //                    data.Add(catCount);
        //                    dataset.Label = item.Name;
        //                    dataset.FillColor = Colors[i];
        //                    dataset.StrokeColor = Colors[i];
        //                    dataset.PointColor = Highlight[i];
        //                    dataset.PointStrokeColor = "#fff";
        //                    dataset.PointHighlightFill = "#fff";
        //                    dataset.PointHighlightStroke = Highlight[i];
        //                }
        //                i++;
        //            }

        //            dataset.Data = data;
        //            chartData.Datasets = new List<ComplexDataset> { dataset };
        //            chartData.Labels = labels;

        //            result = new ReportViewModel
        //            {
        //                Data = new JavaScriptSerializer().Serialize(chartData.Datasets).ToLower(),
        //                Labels = new JavaScriptSerializer().Serialize(chartData.Labels).ToLower()
        //            };

        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CasesByCategory Report");
        //            return new ReportViewModel();
        //        }
        //        return result;
        //    }
        //}

        //public static ReportViewModel CitizenNumberCasesResolved(HttpCookie cookie, DateTime fromDate, DateTime toDate)
        //{
        //    using (var db = new CrmSystemEntities())
        //    {
        //        ReportViewModel result;
        //        try
        //        {
        //            var dataset = new ComplexDataset();
        //            var data = new List<double>();
        //            var labels = new List<string>();
        //            var complaintCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.CaseCategory, cookie);
        //            var emergencyCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.EmergencyCategories, cookie);
        //            var formCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.FormCategories, cookie);
        //            var jobCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.JobCategories, cookie);
        //            var tenderCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.TenderCategories, cookie);
        //            var categories = complaintCategories;
        //            categories = complaintCategories;
        //            categories.AddRange(formCategories);
        //            categories.AddRange(jobCategories);
        //            categories.AddRange(tenderCategories);
        //            categories.AddRange(emergencyCategories);
        //            var chartData = new ComplexData();
        //            int i = 0;
        //            foreach (var item in categories)
        //            {
        //                int catCount = db.SystemCases.Count(r => r.CategoryId == item.Id);
        //                if (catCount > 0)
        //                {
        //                    if (i >= Colors.Count)
        //                    {
        //                        i = 0;
        //                    }

        //                    labels.Add(item.Name);
        //                    data.Add(catCount);
        //                    dataset.Label = item.Name;
        //                    dataset.FillColor = Colors[i];
        //                    dataset.StrokeColor = Colors[i];
        //                    dataset.PointColor = Highlight[i];
        //                    dataset.PointStrokeColor = "#fff";
        //                    dataset.PointHighlightFill = "#fff";
        //                    dataset.PointHighlightStroke = Highlight[i];
        //                }
        //                i++;
        //            }

        //            dataset.Data = data;
        //            chartData.Datasets = new List<ComplexDataset> { dataset };
        //            chartData.Labels = labels;

        //            result = new ReportViewModel
        //            {
        //                Data = new JavaScriptSerializer().Serialize(chartData.Datasets).ToLower(),
        //                Labels = new JavaScriptSerializer().Serialize(chartData.Labels).ToLower()
        //            };

        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CasesByCategory Report");
        //            return new ReportViewModel();
        //        }
        //        return result;
        //    }
        //}

        //public static ReportViewModel CasesByStatus(HttpCookie cookie)
        //{
        //    ReportViewModel result;
        //    using (var db = new CrmSystemEntities())
        //    {
        //        try
        //        {
        //            var pieChartData = new List<SimpleData>();
        //            int count = 0;
        //            var states =
        //                LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.WorkFlowStates,
        //                    cookie);
        //            foreach (var item in states)
        //            {
        //                var caseCount = db.StateHistories.Where(r => r.CurrentState == item.Id).GroupBy(r => r.CaseId)
        //                    .Count();
        //                SimpleData pieData = new SimpleData
        //                {
        //                    Color = Colors[count],
        //                    Highlight = Highlight[count],
        //                    Label = item.Name,
        //                    Value = caseCount
        //                };
        //                pieChartData.Add(pieData);

        //                count++;
        //                if (Colors.Count <= count)
        //                    count = 0;
        //            }

        //            result = new ReportViewModel()
        //            {
        //                Data = new JavaScriptSerializer().Serialize(pieChartData).ToLower(),
        //                Labels = ""
        //            };
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CasesByStatus Report");
        //            return new ReportViewModel();
        //        }
        //    }

        //    return result;
        //}

        //public static ReportViewModel CasesSeverityByCategory(HttpCookie cookie)
        //{
        //    ReportViewModel result;
        //    using (var db = new CrmSystemEntities())
        //    {
        //        try
        //        {
        //            var pieChartData = new List<SimpleData>();
        //            int count = 0;
        //            var severities = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.CaseSeverity,
        //                cookie);
        //            foreach (var item in severities)
        //            {
        //                var caseCount = db.SystemCases.Count(r => r.SeverityId == item.Id);
        //                SimpleData pieData = new SimpleData
        //                {
        //                    Color = Colors[count],
        //                    Highlight = Highlight[count],
        //                    Label = item.Name,
        //                    Value = caseCount
        //                };
        //                pieChartData.Add(pieData);

        //                count++;
        //                if (Colors.Count <= count)
        //                    count = 0;
        //            }

        //            result = new ReportViewModel()
        //            {
        //                Data = new JavaScriptSerializer().Serialize(pieChartData).ToLower(),
        //                Labels = ""
        //            };
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CasesSeverityByCategory Report");
        //            return new ReportViewModel();
        //        }
        //    }

        //    return result;
        //}

        //public static ReportViewModel CasesPriorityByCategory(HttpCookie cookie)
        //{
        //    ReportViewModel result;
        //    using (var db = new CrmSystemEntities())
        //    {
        //        try
        //        {
        //            var pieChartData = new List<SimpleData>();
        //            int count = 0;
        //            var priorities = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.CasePriority,
        //                cookie);
        //            foreach (var item in priorities)
        //            {
        //                var caseCount = db.SystemCases.Count(r => r.PriorityId == item.Id);
        //                SimpleData pieData = new SimpleData
        //                {
        //                    Color = Colors[count],
        //                    Highlight = Highlight[count],
        //                    Label = item.Name,
        //                    Value = caseCount
        //                };
        //                pieChartData.Add(pieData);

        //                count++;
        //                if (Colors.Count <= count)
        //                    count = 0;
        //            }
        //            result = new ReportViewModel()
        //            {
        //                Data = new JavaScriptSerializer().Serialize(pieChartData).ToLower(),
        //                Labels = ""
        //            };
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CasesPriorityByCategory Report");
        //            return new ReportViewModel();
        //        }
        //    }

        //    return result;
        //}

        //public static ReportViewModel CasesSlaByCategory(HttpCookie cookie)
        //{
        //    ReportViewModel result;
        //    using (var db = new CrmSystemEntities())
        //    {
        //        try
        //        {
        //            var pieChartData = new List<SimpleData>();
        //            int count = 0;
        //            var complaintCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.CaseCategory, cookie);
        //            var emergencyCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.EmergencyCategories, cookie);
        //            var formCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.FormCategories, cookie);
        //            var jobCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.JobCategories, cookie);
        //            var tenderCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.TenderCategories, cookie);
        //            var categories = complaintCategories;
        //            categories = complaintCategories;
        //            categories.AddRange(formCategories);
        //            categories.AddRange(jobCategories);
        //            categories.AddRange(tenderCategories);
        //            categories.AddRange(emergencyCategories);
        //            foreach (var item in categories)
        //            {
        //                var caseCount = db.SlaCaseCounts.Count(r => r.SystemCas.CategoryId == item.Id);
        //                SimpleData pieData = new SimpleData
        //                {
        //                    Color = Colors[count],
        //                    Highlight = Highlight[count],
        //                    Label = item.Name,
        //                    Value = caseCount
        //                };
        //                pieChartData.Add(pieData);

        //                count++;
        //                if (Colors.Count <= count)
        //                    count = 0;
        //            }
        //            result = new ReportViewModel()
        //            {
        //                Data = new JavaScriptSerializer().Serialize(pieChartData).ToLower(),
        //                Labels = ""
        //            };
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CasesSlaByCategory Report");
        //            return new ReportViewModel();
        //        }
        //    }

        //    return result;
        //}

        //public static ReportViewModel CreatedVsResolvedCasesPerWeek(HttpCookie cookie)
        //{
        //    ReportViewModel result;
        //    using (var db = new CrmSystemEntities())
        //    {
        //        try
        //        {
        //            var dataset = new ComplexDataset();
        //            var data = new List<double>();
        //            var labels = new List<string>();
        //            var states = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.WorkFlowStates,
        //                cookie).Where(r => (r.Id == (int)GeneralEnums.StateEnum.Closed
        //                                                         || r.Id == (int)GeneralEnums.StateEnum.Resolved));
        //            var chartData = new ComplexData();
        //            int i = 0;
        //            foreach (var item in states)
        //            {
        //                var caseCount = db.StateHistories.Where(r => r.CurrentState == item.Id).GroupBy(r => r.CaseId).Count(r => r.Key == item.Id);
        //                if (caseCount > 0)
        //                {
        //                    if (i >= Colors.Count)
        //                    {
        //                        i = 0;
        //                    }
        //                    labels.Add(item.Name);
        //                    data.Add(caseCount);
        //                    dataset.Label = item.Name;
        //                    dataset.FillColor = Colors[i];
        //                    dataset.StrokeColor = Colors[i];
        //                    dataset.PointColor = Highlight[i];
        //                    dataset.PointStrokeColor = "#fff";
        //                    dataset.PointHighlightFill = "#fff";
        //                    dataset.PointHighlightStroke = Highlight[i];
        //                }

        //                i++;
        //            }
        //            dataset.Data = data;
        //            chartData.Datasets = new List<ComplexDataset>() { dataset };
        //            chartData.Labels = labels;

        //            result = new ReportViewModel()
        //            {
        //                Data = new JavaScriptSerializer().Serialize(chartData.Datasets).ToLower(),
        //                Labels = new JavaScriptSerializer().Serialize(chartData.Labels).ToLower()
        //            };
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CreatedVsResolvedCasesPerWeek Report");
        //            return new ReportViewModel();
        //        }
        //    }

        //    return result;
        //}

        //public static List<CaseStatisticReport> UnresolvedCaseStatisticReport(HttpCookie cookie)
        //{
        //    var result = new List<CaseStatisticReport>();
        //    var langId = CultureHelper.GetCurrentLanguageId(cookie);
        //    using (var db = new CrmSystemEntities())
        //    {
        //        try
        //        {
        //            var history = db.StateHistories.Where(r => r.CurrentState != (int)GeneralEnums.StateEnum.Closed
        //            && r.CurrentState != (int)GeneralEnums.StateEnum.Resolved).GroupBy(r => r.SystemCas);
        //            var casesbyAssignee = history.GroupBy(r => r.Key.UserProfile);
        //            var caseTotalCount = history.Count();
        //            foreach (var item in casesbyAssignee)
        //            {
        //                var assigneeCasesCount = item.Count();
        //                result.Add(new CaseStatisticReport()
        //                {
        //                    Assignee = item.Key != null ? LanguageFallbackHelper.GetUserProfile(item.Key.Id, langId)?.FullName ?? LanguageFallbackHelper.GetUserProfile(item.Key.Id, CultureHelper.GetDefaultLanguageId())?.FullName : "Unassigned",
        //                    Count = item.Count(),
        //                    Precent = assigneeCasesCount / caseTotalCount
        //                });
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating UnresolvedCaseStatistic Report");
        //            return new List<CaseStatisticReport>();
        //        }
        //    }

        //    return result;
        //}

        //public static ReportViewModel PrepareCasesByStatusChartForSearch(HttpCookie cookie, List<CaseViewModel> searchedData)
        //{
        //    ReportViewModel result;
        //    using (var db = new CrmSystemEntities())
        //    {
        //        try
        //        {
        //            var pieChartData = new List<SimpleData>();
        //            int count = 0;
        //            var casesIds = searchedData.Select(t => t.Id).ToList();
        //            var states =
        //                LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.WorkFlowStates,
        //                    cookie);
        //            foreach (var item in states)
        //            {
        //                var caseCount = db.StateHistories
        //                    .GroupBy(t => t.CaseId).ToList().Select(t => new
        //                    {
        //                        casesId = t.LastOrDefault().CaseId,
        //                        CurrentStatus = t.LastOrDefault().CurrentState
        //                    }).ToDictionary(a => a.casesId, a => a.CurrentStatus)
        //                    .Where(t => t.Value == item.Id
        //                && casesIds.Contains(t.Key)).Count();
        //                if (caseCount > 0)
        //                {
        //                    SimpleData pieData = new SimpleData
        //                    {
        //                        Color = Colors[count],
        //                        Highlight = Highlight[count],
        //                        Label = item.Name,
        //                        Value = caseCount
        //                    };
        //                    pieChartData.Add(pieData);

        //                    count++;
        //                }
        //                if (Colors.Count <= count)
        //                    count = 0;
        //            }

        //            result = new ReportViewModel()
        //            {
        //                Data = new JavaScriptSerializer().Serialize(pieChartData).ToLower(),
        //                Labels = ""
        //            };
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CasesByStatus Report (Dashboard Advance Search)");
        //            return new ReportViewModel();
        //        }
        //    }

        //    return result;
        //}

        //public static ReportViewModel PrepareCasesPriorityByCategoryForSearch(HttpCookie cookie, List<CaseViewModel> searchedData)
        //{
        //    ReportViewModel result;
        //    try
        //    {
        //        var pieChartData = new List<SimpleData>();
        //        int count = 0;
        //        var priorities = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.CasePriority,
        //            cookie);
        //        foreach (var item in priorities)
        //        {
        //            var caseCount = searchedData.Count(r => r.PriorityId == item.Id);
        //            if (caseCount > 0)
        //            {
        //                SimpleData pieData = new SimpleData
        //                {
        //                    Color = Colors[count],
        //                    Highlight = Highlight[count],
        //                    Label = item.Name,
        //                    Value = caseCount
        //                };
        //                pieChartData.Add(pieData);

        //                count++;
        //            }
        //            if (Colors.Count <= count)
        //                count = 0;
        //        }
        //        result = new ReportViewModel()
        //        {
        //            Data = new JavaScriptSerializer().Serialize(pieChartData).ToLower(),
        //            Labels = ""
        //        };
        //    }
        //    catch (Exception ex)
        //    {
        //        LogHelper.LogException("", ex, "Error While Generating CasesPriorityByCategory Report(Dashboard Advance Search)");
        //        return new ReportViewModel();
        //    }
        //    return result;
        //}

        //public static ReportViewModel PrepareCasesSeverityByCategoryForSearch(HttpCookie cookie, List<CaseViewModel> searchedData)
        //{
        //    ReportViewModel result;
        //    try
        //    {
        //        var pieChartData = new List<SimpleData>();
        //        int count = 0;
        //        var severities = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.CaseSeverity,
        //            cookie);
        //        foreach (var item in severities)
        //        {
        //            var caseCount = searchedData.Count(r => r.SeverityId == item.Id);
        //            if (caseCount > 0)
        //            {
        //                SimpleData pieData = new SimpleData
        //                {
        //                    Color = Colors[count],
        //                    Highlight = Highlight[count],
        //                    Label = item.Name,
        //                    Value = caseCount
        //                };
        //                pieChartData.Add(pieData);

        //                count++;
        //            }

        //            if (Colors.Count <= count)
        //                count = 0;
        //        }

        //        result = new ReportViewModel()
        //        {
        //            Data = new JavaScriptSerializer().Serialize(pieChartData).ToLower(),
        //            Labels = ""
        //        };
        //    }
        //    catch (Exception ex)
        //    {
        //        LogHelper.LogException("", ex, "Error While Generating CasesSeverityByCategory Report(Dashboard Advance Search)");
        //        return new ReportViewModel();
        //    }
        //    return result;
        //}

        //public static ReportViewModel PrepareCasesByCategoryForSearch(HttpCookie cookie, List<CaseViewModel> searchedData)
        //{
        //    ReportViewModel result;
        //    try
        //    {
        //        var dataset = new ComplexDataset();
        //        var data = new List<double>();
        //        var labels = new List<string>();
        //        var complaintCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.CaseCategory, cookie);
        //        var emergencyCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.EmergencyCategories, cookie);
        //        var formCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.FormCategories, cookie);
        //        var jobCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.JobCategories, cookie);
        //        var tenderCategories = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.TenderCategories, cookie);
        //        var categories = complaintCategories;
        //        categories = complaintCategories;
        //        categories.AddRange(formCategories);
        //        categories.AddRange(jobCategories);
        //        categories.AddRange(tenderCategories);
        //        categories.AddRange(emergencyCategories);
        //        var chartData = new ComplexData();
        //        int i = 0;
        //        foreach (var item in categories)
        //        {
        //            int catCount = searchedData.Count(r => r.CategoryId == item.Id);
        //            if (catCount > 0)
        //            {
        //                if (i >= Colors.Count)
        //                {
        //                    i = 0;
        //                }

        //                labels.Add(item.Name);
        //                data.Add(catCount);
        //                dataset.Label = item.Name;
        //                dataset.FillColor = Colors[i];
        //                dataset.StrokeColor = Colors[i];
        //                dataset.PointColor = Highlight[i];
        //                dataset.PointStrokeColor = "#fff";
        //                dataset.PointHighlightFill = "#fff";
        //                dataset.PointHighlightStroke = Highlight[i];
        //                i++;
        //            }
        //        }
        //        dataset.Data = data;
        //        chartData.Datasets = new List<ComplexDataset> { dataset };
        //        chartData.Labels = labels;

        //        result = new ReportViewModel
        //        {
        //            Data = new JavaScriptSerializer().Serialize(chartData.Datasets).ToLower(),
        //            Labels = new JavaScriptSerializer().Serialize(chartData.Labels).ToLower(),
        //        };

        //    }
        //    catch (Exception ex)
        //    {
        //        LogHelper.LogException("", ex, "Error While Generating CasesByCategory Report (Dashboard Advance Search)");
        //        return new ReportViewModel();
        //    }
        //    return result;
        //}

        public static byte[] WriteCsvToMemory(IEnumerable<dynamic> records)
        {
            using (var memoryStream = new MemoryStream())
            using (var streamWriter = new StreamWriter(memoryStream, Encoding.UTF8))
            using (var csvWriter = new CsvWriter(streamWriter))
            {
                csvWriter.WriteRecords(records);
                streamWriter.Flush();
                return memoryStream.ToArray();
            }
        }

        public static void WriteStream(Stream from, Stream to)
        {
            for (int a = from.ReadByte(); a != -1; a = from.ReadByte())
                to.WriteByte((byte)a);
        }

        //public static ReportViewModel PrepareCasesByStatusForDateLineChart(HttpCookie cookie, List<CaseViewModel> searchedData)
        //{
        //    using (var db = new CrmSystemEntities())
        //    {
        //        ReportViewModel result;
        //        try
        //        {
        //            searchedData = searchedData.OrderBy(t => t.CreatedOn).ToList();
        //            var allDatasets = new List<ComplexDataset>();
        //            var data = new List<double>();
        //            //int count = 0;
        //            var states = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.WorkFlowStates, cookie);

        //            var casesIds = searchedData.Select(t => t.Id).ToList();
        //            var distinctDate = searchedData.Select(t => t.CreatedOn.Date).Distinct().ToList();
        //            var labels = distinctDate.Select(t => t.ToString().AsDateTime().ToString("dd/MM/yyyy")).ToList();

        //            foreach (var item in states)
        //            {
        //                var dataset = new ComplexDataset();
        //                data = new List<double>();
        //                //if (count >= Colors.Count)
        //                //{
        //                //    count = 0;
        //                //}
        //                dataset.Label = item.Name;
        //                //dataset.FillColor = "rgba(220,220,220,0.2)";
        //                //dataset.StrokeColor = "rgba(220,220,220,0.2)";
        //                //dataset.PointColor = "rgba(220,220,220,0.2)";
        //                //dataset.PointStrokeColor = "rgba(220,220,220,0.2)";
        //                //dataset.PointHighlightFill = "rgba(220,220,220,0.2)";
        //                //dataset.PointHighlightStroke = "rgba(220,220,220,0.2)";
        //                //count++;
        //                foreach (var date in distinctDate)
        //                {
        //                    var caseCount = db.StateHistories.Where(t => DbFunctions.TruncateTime(t.CreatedOn) == DbFunctions.TruncateTime(date))
        //                        .GroupBy(t => t.CaseId).ToList().Select(t => new
        //                        {
        //                            casesId = t.LastOrDefault().CaseId,
        //                            CurrentStatus = t.LastOrDefault().CurrentState,
        //                        }).ToDictionary(a => a.casesId, a => a.CurrentStatus)
        //                       .Where(t => t.Value == item.Id
        //                        && casesIds.Contains(t.Key)).Count();
        //                    data.Add(caseCount);
        //                }
        //                dataset.Data = data;
        //                allDatasets.Add(dataset);
        //            }

        //            var chartData = new ComplexData();
        //            chartData.Datasets = allDatasets;
        //            chartData.Labels = labels;

        //            result = new ReportViewModel
        //            {
        //                Data = new JavaScriptSerializer().Serialize(chartData.Datasets).ToLower(),
        //                Labels = new JavaScriptSerializer().Serialize(chartData.Labels).ToLower(),
        //            };
        //            return result;
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Generating CasesByStatus Line Chart (Dashboard Advance Search)");
        //            return new ReportViewModel();
        //        }
        //    }
        //}

    }
}