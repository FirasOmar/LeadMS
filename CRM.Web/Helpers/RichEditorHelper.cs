using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RTE;

namespace CRM.Web.Helpers
{
    public class RichEditorHelper
    {
        [ValidateInput(false)]
        public static Editor PrepairEditorWithName(Action<Editor> oninit, string name, bool isajax)
        {
            Editor editor = new Editor(System.Web.HttpContext.Current, name);

            editor.ClientFolder = "/richtexteditor/";
            //editor.ClientFolder = "/Content/richtexteditor/";
            //editor.ClientFolder = "/Scripts/richtexteditor/";

            editor.Text = "";

            var urlHelper = new System.Web.Mvc.UrlHelper(HttpContext.Current.Request.RequestContext);

            editor.AjaxPostbackUrl = urlHelper.Action("EditorAjaxHandler", "EditorAjax");

            if (oninit != null) oninit(editor);

            //try to handle the upload/ajax requests


            if (isajax)
                return editor;

            //load the form data if any
            if (HttpContext.Current.Request.HttpMethod == "POST")
            {
                try
                {
                    string formdata = HttpContext.Current.Request.Form[editor.Name];
                    if (formdata != null)
                        editor.LoadFormData(formdata);
                }
                catch (Exception ex)
                {

                }
            }

            return editor;
        }

    }
}