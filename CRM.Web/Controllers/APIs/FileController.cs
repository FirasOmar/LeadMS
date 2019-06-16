using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Controllers.APIs.Responses;
using CRM.Web.Helpers;

namespace CRM.Web.Controllers.APIs
{
    [Authorize]
    public class FileController : ApiController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        [HttpPost]
        public async Task<IHttpActionResult> UploadFile(int id)
        {
            if (!Request.Content.IsMimeMultipartContent())
            {
                return Content(HttpStatusCode.UnsupportedMediaType, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.UnsupportedMediaType,
                    Message = Constants.ApiMessages.UnSupported
                });
            }

            try
            {
                var provider = new MultipartMemoryStreamProvider();
                await Request.Content.ReadAsMultipartAsync(provider);
                var sysFiles = new List<FileResponse>();
                foreach (var file in provider.Contents)
                {
                    var dataStream = await file.ReadAsByteArrayAsync();
                    var sysFile = new SystemFile
                    {
                        CreatedBy = User.Identity.Name,
                        CreatedOn = DateTime.Now,
                        Status = (int)GeneralEnums.StatusEnum.Active,
                        TypeId = id,
                        FileUrl = string.Empty,
                        ModifiedBy = User.Identity.Name,
                        ModifiedOn = DateTime.Now
                    };
                    _db.SystemFiles.Add(sysFile);
                    _db.SaveChanges();

                    var extention = Path.GetExtension(file.Headers.ContentDisposition.FileName.Trim('"').Trim('/'));

                    File.WriteAllBytes(
                        HttpContext.Current.Server.MapPath($"~/Document/{id}/{sysFile.Id}{extention}"), dataStream);
                    var setting =
                        SettingHelper.GetOrCreate(Constants.SystemSettings.WebsiteUrl, "http://localhost:61712/");
                    var url = $"{setting.Value}/Document/{id}/{sysFile.Id}{extention}";
                    sysFiles.Add(new FileResponse()
                    {
                        Id = sysFile.Id,
                        CreatedOn = sysFile.CreatedOn,
                        TypeId = sysFile.TypeId,
                        FileUrl = url,
                        StatusCode = HttpStatusCode.OK,
                        Message = Constants.ApiMessages.Success
                    });
                    sysFile.FileUrl = url;
                    _db.Entry(sysFile).State = EntityState.Modified;
                    _db.SaveChanges();

                    var sysFileTrans = new SystemFileTranslation()
                    {
                        Description = string.Empty,
                        DisplayName = string.Empty,
                        IsDefault = true,
                        LanguageId = CultureHelper.GetDefaultLanguageId(),
                        SystemFileId = sysFile.Id
                    };
                    _db.SystemFileTranslations.Add(sysFileTrans);
                    _db.SaveChanges();

                }
                return Ok(sysFiles);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While uploading file!");
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Constants.ApiMessages.GeneralError
                });
            }
        }

        public byte[] ReadFully(Stream input)
        {
            var buffer = new byte[16 * 1024];
            using (var ms = new MemoryStream())
            {
                int read;
                while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
                {
                    ms.Write(buffer, 0, read);
                }
                return ms.ToArray();
            }
        }

        // DELETE: api/File/5
        [ResponseType(typeof(FileResponse))]
        public IHttpActionResult DeleteFile(int id)
        {
            var file = _db.SystemFiles.Find(id);
            if (file == null)
            {
                return NotFound();
            }

            var fileResult = new FileResponse
            {
                Id = file.Id,
                CreatedOn = file.CreatedOn,
                TypeId = file.TypeId,
                FileUrl = file.FileUrl,
                StatusCode = HttpStatusCode.OK,
                Message = Constants.ApiMessages.Success
            };

            _db.Entry(file).State = EntityState.Deleted;
            if (User.IsInRole(Constants.Roles.Administrator) || User.IsInRole(Constants.Roles.ContentAdmin) 
               || file.CreatedBy == User.Identity.Name)
            {
                _db.SaveChanges();
            }
            return Ok(fileResult);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
