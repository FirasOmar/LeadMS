using System;

namespace CRM.Web.Models
{
    public class GeneralSearchViewModel
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Url { get; set; }
        public string ImageUrl { get; set; }
        public string Name { get; set; }
        public string Details { get; set; }
        public DateTime? Date { get; set; }
    }
}