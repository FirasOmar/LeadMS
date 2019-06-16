using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CRM.DataEntity.Models;
using CRM.Web.Models;

namespace CRM.Web.Controllers.APIs
{
    public class CampaignController : ApiController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public HttpResponseMessage Post(CampaignViewModel campaign)
        {
            try
            {
                var data = new Campaign()
                {
                    Name = campaign.Name,
                    StartDate = campaign.StartDate,
                    EndDate = campaign.EndDate
                   
                
                };
                _db.Campaigns.Add(data);
                _db.SaveChanges();
                var msg = Request.CreateResponse(HttpStatusCode.Created, data);
                return msg;
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}