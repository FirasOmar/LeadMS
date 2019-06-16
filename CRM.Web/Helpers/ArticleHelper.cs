//using System.Linq;
//using System.Web;
//using CRM.Web.Models;
//using System.Security.Principal;
//using CRM.Core.Helpers;
//using Crm.Sms.Requests;
//using System.Collections.Generic;
//using CRM.Core.SystemEnums;
//using CRM.DataEntity.Models;
//using System;
//using CRM.Core;
//namespace CRM.Web.Helpers
//{
//    public class ArticleHelper
//    {
//        public static void AddOrUpdateArticleMappingData(IPrincipal userData, int tableId, int tableValue, int articleId)
//        {
//            using (var db = new CrmSystemEntities())
//            {
//                try
//                {
//                    var oldMappingData = db.Mapping_Article.Where(t => (t.TableId == tableId
//                                           && t.TableValue == tableValue)).SingleOrDefault();

//                    if (oldMappingData != null)
//                    {
//                        oldMappingData.ArticleId = articleId;
//                        oldMappingData.TableId = tableId;
//                        oldMappingData.TableValue = tableValue;
//                        db.Entry(oldMappingData).State = System.Data.Entity.EntityState.Modified;
//                    }
//                    else
//                    {
//                        var newMappingData = new Mapping_Article()
//                        {
//                            ArticleId = articleId,
//                            TableId = tableId,
//                            TableValue = tableValue,
//                            CreatedBy = userData.Identity.Name,
//                            CreatedOn = DateTime.Now,
//                        };
//                        db.Mapping_Article.Add(newMappingData);
//                    }

//                    var oldArticleData = db.Mapping_Article.Where(t => t.ArticleId == articleId).SingleOrDefault();
//                    if(oldArticleData != null)
//                    {
//                        oldArticleData.ArticleId = 0;
//                        db.Entry(oldArticleData).State = System.Data.Entity.EntityState.Modified;
//                    }
//                    db.SaveChanges();
//                }
//                catch (Exception ex)
//                {
//                    LogHelper.LogException(userData.Identity.Name, ex, "Error While adding new article mapping data");
//                }
//            }
//        }
        

//        public static int GetArticleMappingData(int tableId,int tableValue)
//        {
//            using(var db= new CrmSystemEntities())
//            {
//                var data = db.Mapping_Article.Where(t => t.TableId == tableId && t.TableValue == tableValue).FirstOrDefault();
//                if(data != null)
//                {
//                    return data.ArticleId;
//                }
//                return 0;
//            }
//        }

//    }
//}