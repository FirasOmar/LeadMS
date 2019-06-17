using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System;
using CRM.Web.App_GlobalResources.Account;
using CRM.Web.App_GlobalResources.General;

namespace CRM.Web.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [EmailAddress]
        [Display(ResourceType = typeof(Login), Name = "TxtEmail")]
        public string Email { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(Login), Name = "TxtPassword")]
        public string Password { get; set; }

        [Display(ResourceType = typeof(Login), Name = "TxtRememberMe")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [EmailAddress]
        [Display(ResourceType = typeof(Register), Name = "TxtEmail")]
        public string Email { get; set; }

        public int CompanyId { get; set; }
        [Display(ResourceType = typeof(Register), Name = "LblCompanyName")]
        public string CompanyName { get; set; }
        //[Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtIdNumber")]
        public string IdNumber { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtFullName")]
        public string FullName { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtAddress")]
        public string Address { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtPhoneNumber")]
        public string PhoneNumber { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtMobile")]
        public string Mobile { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtFax")]
        public string Fax { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtBirthDay")]
        public DateTime? BirthDay { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtGenderLookupId")]
        public int? GenderLookupId { get; set; }

        [Display(ResourceType = typeof(Register), Name = "TxtMartialStatusLookupId")]
        public int? MartialStatusLookupId { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtPassword")]
        [StringLength(100, ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = "ErrorInvalidPassword")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtConfirmPassword")]
        [Compare("Password", ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = "ErrorPasswordNotMatch")]
        public string ConfirmPassword { get; set; }
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
        [Display(ResourceType = typeof(UserProfile), Name = "PrefferdLanguage")]
        public int? PrefferdLanguage { get; set; }

    }

    public class ResetPasswordViewModel
    {
        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [EmailAddress]
        [Display(ResourceType = typeof(Register), Name = "TxtEmail")]
        public string Email { get; set; }

        [StringLength(100, ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = "ErrorInvalidPassword")]
        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Register), Name = "TxtPassword")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(Register), Name = "TxtConfirmPassword")]
        [Compare("Password", ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = "ErrorPasswordNotMatch")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [EmailAddress]
        [Display(ResourceType = typeof(Register), Name = "TxtEmail")]
        public string Email { get; set; }
    }
}

