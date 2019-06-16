using System;
using CRM.Workflow;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using CRM.DataEntity.Models;

namespace Crm.Wrokflow.Test
{
    [TestClass]
    public class ComplaintTest
    {
        [TestMethod]
        public void FlowTest()
        {
            var complaint = new Complaint(
                new SystemCas()
                {
                    Title = "test title",
                    AssigneeId = 1
                },
                new UserProfile()
                {
                    Email = "salam-cs@hotmail.com"
                });

            complaint.Assign("Joe");
            complaint.Reject();
            complaint.Assign("Harry");
            complaint.Assign("Fred");
            complaint.Close();

            Console.WriteLine();
            Console.WriteLine("State machine:");

            Console.ReadKey(false);
        }
    }
}
