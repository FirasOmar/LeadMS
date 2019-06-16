using System.Linq;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;


namespace CRM.Web.Helpers
{
    public class WorkflowHelper
    {
        public static int GetAssignedUser(int fromState, int toState, int categoryId)
        {
            using (var db = new CrmSystemEntities())
            {
              var transition =  db.StateTransitionsConfigurations.FirstOrDefault(r =>
                    r.CategoryId == categoryId && r.StateFrom == fromState && r.StateTo == toState &&
                    r.Status == (int) GeneralEnums.StatusEnum.Active);
                if (transition != null)
                {
                    return transition.AssigneeId ?? 0;
                }
                else
                {
                    return 0;
                }

            }
        }

    }
}