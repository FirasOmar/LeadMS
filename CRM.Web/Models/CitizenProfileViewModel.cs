using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using CRM.Core.Models;
using CRM.Web.App_GlobalResources.Account;
using CRM.Web.App_GlobalResources.General;

namespace CRM.Web.Models
{
    public class CitizenProfileViewModel
    {
        public int Id { get; set; }
        public int LanguageId { get; set; }
        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [EmailAddress]
        [Display(ResourceType = typeof(Register), Name = "TxtEmail")]
        public string Email { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtUsername")]
        public string Username { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtIdNumber")]
        public string IdNumber { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtFullName")]
        public string FullName { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtAddress")]
        public string Address { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtPhoneNumber")]
        public string PhoneNumber { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtMobile")]
        public string Mobile { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtFax")]
        public string Fax { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtBirthDay")]
        public DateTime? BirthDay { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtGenderLookupId")]
        public int? GenderLookupId { get; set; }
        [Display(ResourceType = typeof(Register), Name = "TxtGenderLookupId")]
        public string GenderLookupName { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtProvinceId")]
        public int? ProvinceId { get; set; }
        [Display(ResourceType = typeof(Register), Name = "TxtProvinceId")]
        public string ProvinceName { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtCityId")]
        public int? CityId { get; set; }
        [Display(ResourceType = typeof(Register), Name = "TxtCityId")]
        public string CityName { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtRegionId")]
        public int? RegionId { get; set; }
        [Display(ResourceType = typeof(Register), Name = "TxtRegionId")]
        public string RegionName { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtMartialStatusLookupId")]
        public int? MartialStatusLookupId { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtMartialStatusLookupId")]
        public string MartialStatusLookupName { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtPassword")]
        [StringLength(100, ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = "ErrorInvalidPassword")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtConfirmPassword")]
        [Compare("Password", ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = "ErrorPasswordNotMatch")]
        public string ConfirmPassword { get; set; }
        [Display(ResourceType = typeof(Register), Name = "TxtStatus")]
        public int Status { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtLastLogin")]
        public DateTime? LastLogin { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtProfilePath")]
        public string ProfilePath { get; set; }

        [Display(ResourceType = typeof(UserProfile), Name = "PrefferdLanguage")]
        public int? PrefferdLanguage { get; set; }
        [Display(ResourceType = typeof(UserProfile), Name = "PrefferdLanguage")]
        public string PrefferdLanguageName { get; set; }

        [Display(ResourceType = typeof(UserProfile), Name = "Department")]
        public int? Department { get; set; }

        [Display(ResourceType = typeof(UserProfile), Name = "Department")]
        public string DepartmentName { get; set; }

        [Display(ResourceType = typeof(UserProfile), Name = "ManagerId")]
        public int? ManagerId { get; set; }

        [Display(ResourceType = typeof(UserProfile), Name = "ManagerId")]
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
        public List<CaseViewModel> Cases { get; set; }
    }
}