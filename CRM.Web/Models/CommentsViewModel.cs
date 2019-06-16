
using CRM.Core.Models;
using CRM.Web.Controllers.APIs.Responses;
using System;
using System.Collections.Generic;

namespace CRM.Web.Models
{
    public class CommentsViewModel
    {
        public int Id { get; set; }
        public string Comment { get; set; }
        public int CaseId { get; set; }
        public string CaseName { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public int Status { get; set; }
        public DateTime? DeletedOn { get; set; }
        public bool ForCitizen { get; set; }
        public string FilePath { set; get; }
        public ProfileViewModel CreatedByProfile { set; get; }
    }
}