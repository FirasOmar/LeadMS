using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using CRM.Web.App_GlobalResources.SystemCases;
using CRM.Web.Controllers.APIs.Responses;
using System.Web.Mvc;
using CRM.Core.Models;

namespace CRM.Web.Models
{
    public class CaseViewModel
    {
        public int Id { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "UniqueId")]
        public Guid UniqueId { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "CategoryName")]
        public int? CategoryId { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "CategoryName")]
        public string CategoryName { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "SeverityName")]
        public int? SeverityId { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "SeverityName")]
        public string SeverityName { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "PriorityName")]
        public int? PriorityId { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "PriorityName")]
        public string PriorityName { get; set; }

        [Display(ResourceType = typeof(SystemCases), Name = "Title")]
        public string Title { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "Tags")]
        public string Tags { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "Address")]
        public string Address { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "Location")]
        public string Location { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "AssigneeUserName")]
        public int? AssigneeId { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "AssigneeUserName")]
        public string AssigneeName { get; set; }
        [AllowHtml]
        [Display(ResourceType = typeof(SystemCases), Name = "TxtDescription")]
        public string Description { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "TxtCreatedOn")]
        public DateTime CreatedOn { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "TxtCreatedBy")]
        public string CreatedBy { get; set; }
        [Display(ResourceType = typeof(SystemCases), Name = "TxtStatus")]
        public int Status { get; set; }
        public int CurrentStatus { set; get; }
        public string CurrentStatusName { set; get; }
        public int? SeverityValue { get; set; }
        public int? PriorityValue { get; set; }
        public string CaseType { get; set; }
        public int? FlowStatus { get; set; }
        public string FlowStatusName { get; set; }
        public string FormId { get; set; }
        public string FormName { set; get; }
        public DateTime? DeletedOn { get; set; }
        public List<FileResponse> Files { get; set; } = new List<FileResponse>();
        public List<string> FilePathes { get; set; } = new List<string>();
        public List<CommentsViewModel> Comments { get; set; } = new List<CommentsViewModel>();
        public int? TypeId { get; set; }
        public DateTime? PublishDate { set; get; }
        public DateTime? EndDate { set; get; }
        public ProfileViewModel UserProfile { get; set; }
        public ProfileViewModel CreatedByProfile { get; set; }
        public string FormWinner { set; get; }
    }

    public class DynamicChartsFilters
    {
        public bool FromAdvanceSearch { set; get; }
        public int CategoryIdSearch { set; get; }
        public int EmployeeIdSearch { set; get; }
        public int PriorityIdSearch { set; get; }
        public string TitleSearch { set; get; }
        public string TagsSearch { set; get; }
        public int SeverityIdSearch { set; get; }
        public int? ComplainId { set; get; }
        public int CitizenId { set; get; }
        public string CitizenSearch { set; get; }
        public int StatusId { set; get; }
        public string FromDate { set; get; }
        public string ToDate { set; get; }
        public string FromTime { set; get; }
        public string ToTime { set; get; }
        public double? ElapseTimeFrom { set; get; }
        public double? ElapseTimeTo { set; get; }
    }

    public class Dashboard_Report_Specific_Fields
    {
        public string Title { set; get; }
        public string Description { set; get; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public string AssigneeName { set; get; }
        public string CategoryName { set; get; }
        public string PriorityName { set; get; }
        public string SeverityName { set; get; }
        public string CurrentStatus { set; get; }
    }

    public class CaseFormViewModel
    {
        public int CaseId { set; get; }
        public string FormId { set; get; }
        public string FormName { set; get; }
        public DateTime CreateOn { set; get; }
        public ProfileViewModel CreatedByProfile { set; get; }
    }

    public class FormsViewModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int? TypeId { get; set; }
        public string Tags { get; set; }
        [AllowHtml]
        public string Description { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public string FormWinner { set; get; }
        public int Status { get; set; }
        public int CurrentStatus { set; get; }
        public string CurrentStatusName { set; get; }
        public DateTime? DeletedOn { get; set; }
        public DateTime? PublishDate { set; get; }
        public DateTime? EndDate { set; get; }
        public int NumberOfApplicant { set; get; }
        public ProfileViewModel CreatedByProfile { get; set; }
    }

    public class FormsDynamicFilters
    {
        public bool FromAdvanceSearch { set; get; }
        public string TitleSearch { set; get; }
        public string TagsSearch { set; get; }
        public int? ComplainId { set; get; }
        public int StatusId { set; get; }
        public string FromDate { set; get; }
        public string ToDate { set; get; }
        public string FromTime { set; get; }
        public string ToTime { set; get; }
        public string PublishDateFrom { set; get; }
        public string PublishDateTo { set; get; }
        public string EndDateFrom { set; get; }
        public string EndDateTo { set; get; }

    }


    public class CaseTemplateAsEmailViewModel
    {
        public string HtmlContent { get; set; }
        public string FormName { get; set; }
        public int FormId { get; set; }
        public int UserFormId { get; set; }
        public bool HaveTemplate { get; set; }
    }
    
}