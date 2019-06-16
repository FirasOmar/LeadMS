using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Core.Models
{
   public class UserHoliydayviewModel
    {
        public int Id { get; set; }
        public DateTime? HolidayDate { get; set; }
        public string Description { get; set; }
        public int? UserProfileId { get; set; }
        public int Status { get; set; }

        public List<UserHoliydayviewModel> UserHolidays { get; set; }
    }
}
