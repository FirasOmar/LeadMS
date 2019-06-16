using CRM.DataEntity.Models;
using CRM.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using static CRM.Core.SystemEnums.GeneralEnums;

namespace CRM.Web.Controllers.APIs
{
    public class LeadsController : ApiController
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

        // POST api/LeadController
        public HttpResponseMessage Post(LeadViewModel lead)
        {
            try
            {
                var data = new Lead()
                {
                    Name = lead.Name,
                    Email = lead.Email,
                    Address = lead.Address,
                    Status = (int)LeadStatusEnum.New,                    
                    Phone_Number = lead.Phone_Number,
                    Notes = lead.Notes,
                    Created_Date = DateTime.Now
                };
                _db.Leads.Add(data);
                _db.SaveChanges();
                var msg = Request.CreateResponse(HttpStatusCode.Created, data);
                return msg;
            }
            catch(Exception ex)
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