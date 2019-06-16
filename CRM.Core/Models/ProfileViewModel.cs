
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;



namespace CRM.Core.Models
{
    public class ProfileViewModel
    {
        public int Id { get; set; }
        public int LanguageId { get; set; }
        [EmailAddress]

        public string Email { get; set; }

        public string Username { get; set; }

        public string IdNumber { get; set; }

        public string FullName { get; set; }

        public string StatusEditDescription { set; get; }

        public string Address { get; set; }

        public string PhoneNumber { get; set; }

        public string Mobile { get; set; }

        public string Fax { get; set; }

        public DateTime? BirthDay { get; set; }

        public int? GenderLookupId { get; set; }
        public string GenderLookupName { get; set; }

        public int? ProvinceId { get; set; }
        public string ProvinceName { get; set; }

        public int? CityId { get; set; }
        public string CityName { get; set; }


        public int? RegionId { get; set; }

        public string RegionName { get; set; }


        public int? MartialStatusLookupId { get; set; }

        public string MartialStatusLookupName { get; set; }



        [DataType(DataType.Password)]
        public string Password { get; set; }


        public string ConfirmPassword { get; set; }
        public int Status { get; set; }

        public DateTime? LastLogin { get; set; }

        public string ProfilePath { get; set; }

        public int? PrefferdLanguage { get; set; }
        public string PrefferdLanguageName { get; set; }

        public int? Department { get; set; }

        public string DepartmentName { get; set; }

        public int? ManagerId { get; set; }

        public string ManagerName { get; set; }

        public List<RoleViewModel> Roles { get; set; }

        public List<int> WeekDaysOff { get; set; }
        public List<UserHoliydayviewModel> UserHolidays { get; set; }

        public string CustomerId { get; set; }

        /* Add Columns for Intergration*/
        public string CityCode { get; set; }
        public string ProvinceCode { get; set; }
        public string GenderCode { get; set; }
        public string MartialStatusCode { get; set; }
    }

}
