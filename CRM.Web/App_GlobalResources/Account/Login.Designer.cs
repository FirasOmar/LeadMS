﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CRM.Web.App_GlobalResources.Account {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class Login {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Login() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("CRM.Web.App_GlobalResources.Account.Login", typeof(Login).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to لا تملك حساب ؟.
        /// </summary>
        public static string DontHaveAccount {
            get {
                return ResourceManager.GetString("DontHaveAccount", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to خطأ اثناء تسجيل الدخول، الرجاء التاكد من كلمة المرور والبريد الالكتروني.
        /// </summary>
        public static string ErrorInvalidLoginAttempt {
            get {
                return ResourceManager.GetString("ErrorInvalidLoginAttempt", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to كلمة المرور يجب ان تكون 6 احرف على الاقل. مثال P@ssw0rd1.
        /// </summary>
        public static string ErrorInvalidPassword {
            get {
                return ResourceManager.GetString("ErrorInvalidPassword", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to كلمة المرور غير متطابقة.
        /// </summary>
        public static string ErrorPasswordNotMatch {
            get {
                return ResourceManager.GetString("ErrorPasswordNotMatch", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to نسيت كلمة المرور ؟.
        /// </summary>
        public static string ForgotPasswordLink {
            get {
                return ResourceManager.GetString("ForgotPasswordLink", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to تسجيل الدخول.
        /// </summary>
        public static string LoginBtn {
            get {
                return ResourceManager.GetString("LoginBtn", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to سجل الآن.
        /// </summary>
        public static string RegisterLink {
            get {
                return ResourceManager.GetString("RegisterLink", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to تسجيل الدخول.
        /// </summary>
        public static string Title {
            get {
                return ResourceManager.GetString("Title", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to هذا الحساب غير مفعل، الرجاء التواصل مع المشرف.
        /// </summary>
        public static string TxtAccountDeActivated {
            get {
                return ResourceManager.GetString("TxtAccountDeActivated", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to البريد الالكتروني.
        /// </summary>
        public static string TxtEmail {
            get {
                return ResourceManager.GetString("TxtEmail", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to كلمة المرور.
        /// </summary>
        public static string TxtPassword {
            get {
                return ResourceManager.GetString("TxtPassword", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to تذكرني.
        /// </summary>
        public static string TxtRememberMe {
            get {
                return ResourceManager.GetString("TxtRememberMe", resourceCulture);
            }
        }
    }
}
