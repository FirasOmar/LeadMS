using System.Collections.Generic;
using System.Linq;
using CRM.Core.Helpers;
using CRM.DataEntity.Models;
using Microsoft.Ajax.Utilities;
using Stateless;

namespace CRM.Workflow
{
    public class Complaint
    {
        private enum State
        {
            New = 34,
            InProgress = 35,
            Rejected = 36,
            Duplicated = 37,
            Resolved = 38,
            Closed = 39,
            Na = 40
        }


        private enum Trigger { New, InProgress, Reject, Duplicate, Resolve, Close }

        private readonly StateMachine<State, Trigger> _machine;
        // The TriggerWithParameters object is used when a trigger requires a payload.
        private readonly StateMachine<State, Trigger>.TriggerWithParameters<string> _assignTrigger;

        private readonly SystemCas _sysCse;
        private readonly UserProfile _userProfile;
        private string _assignee;
        private readonly List<string> _departmentEmails;


        /// <summary>
        /// Constructor for the Complaint class
        /// </summary>
        public Complaint(SystemCas sysCse, UserProfile userProfile)
        {
            _sysCse = sysCse;
            _userProfile = userProfile;

            using (var db = new CrmSystemEntities())
            {
                var assignee = db.UserProfiles.Find(_sysCse.AssigneeId);
                if (assignee != null)
                {
                    _departmentEmails = new List<string>() { assignee.Email };
                }
            }

            // Instantiate a new state machine in the Open state
            _machine = new StateMachine<State, Trigger>(State.New);

            // Instantiate a new trigger with a parameter. 
            _assignTrigger = _machine.SetTriggerParameters<string>(Trigger.New);

            // Configure the Open state
            _machine.Configure(State.New)
                .Permit(Trigger.New, State.InProgress);

            // Configure the Assigned state
            _machine.Configure(State.InProgress)
                .SubstateOf(State.InProgress)
                //.OnEntryFrom(_assignTrigger, InPorgress)  // This is where the TriggerWithParameters is used. Note that the TriggerWithParameters object is used, not something from the enum
                .PermitReentry(Trigger.InProgress)
                .Permit(Trigger.Close, State.Closed)
                .Permit(Trigger.Reject, State.Rejected)
                .Permit(Trigger.Resolve, State.Resolved)
                .Permit(Trigger.Duplicate, State.Duplicated)
                .OnExit(OnDeassigned);

            // Configure the Rejected state
            _machine.Configure(State.Rejected)
                .OnEntry(() => _assignee = null)
                .Permit(Trigger.InProgress, State.Closed);
        }

        public void Assign(string assignee)
        {
            // This is how a trigger with parameter is used, the parameter is supplied to the state machine as a parameter to the Fire method.
            // _machine.Fire(_assignTrigger, assignee);
            SendEmailToAssignee($"Case ({_sysCse.Title}) assigned to you. Please follow it");
        }

        public bool CanAssign => _machine.CanFire(Trigger.InProgress);

        public void Reject()
        {
            // _machine.Fire(Trigger.Reject);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                    $"Case ({_sysCse.Title}) rejected from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) rejected from System.");

            }
        }

        public void Resolve()
        {
            //_machine.Fire(Trigger.Resolve);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Resolved from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
                            $"Case ({_sysCse.Title}) marked as Resolved from System");

            }
        }

        public void Close()
        {
            //_machine.Fire(Trigger.Close);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Closed from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as Closed from System");

            }
        }

        public void InProgress()
        {
            //_machine.Fire(Trigger.InProgress);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as InProgress from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as InProgress from System");

            }
        }

        public void Duplicate()
        {
            // _machine.Fire(Trigger.Duplicate);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as duplicated from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
            $"Case ({_sysCse.Title}) marked as duplicated from System");

            }
        }
        /// <summary>
        /// This method is called automatically when the Assigned state is entered, but only when the trigger is _assignTrigger.
        /// </summary>
        private void InPorgress()
        {
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as InPorgress from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as InPorgress from System.");

            }
        }
        /// <summary>
        /// This method is called when the state machinie exits the Assigned state
        /// </summary>

        public void TenderNew()
        {
            //_machine.Fire(Trigger.InProgress);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as New from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as New from System");

            }
        }

        public void TenderRecieved()
        {
            //_machine.Fire(Trigger.InProgress);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Recieved from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as Recieved from System");

            }
        }

        public void TenderInProgress()
        {
            //_machine.Fire(Trigger.InProgress);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Inprogress from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as Inprogress from System");

            }
        }

        public void TenderWinner()
        {
            //_machine.Fire(Trigger.InProgress);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Winner from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as Winner from System");

            }
        }

        public void TenderLoser()
        {
            //_machine.Fire(Trigger.InProgress);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Not Winner from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as Not Winner from System");

            }
        }

        public void JobNew()
        {
            //_machine.Fire(Trigger.InProgress);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as New from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as New from System");

            }
        }

        public void JobRecieved()
        {
            //_machine.Fire(Trigger.InProgress);
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Recieved from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as Recieved from System");

            }
        }

        public void JobInProgress()
        {
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Inprogress from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as Inprogress from System");

            }
        }

        public void JobWinner()
        {
            if (_userProfile != null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) marked as Winner from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
            else
            {
                SendEmailToAssignee(
             $"Case ({_sysCse.Title}) marked as Winner from System");

            }
        }

        public void OnDeassigned()
        {
            if (_userProfile == null)
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) assigned to anther department from System).");
            }
            else
            {
                SendEmailToAssignee(
                $"Case ({_sysCse.Title}) assigned to anther department from ({_userProfile.UserProfileTranslations.FirstOrDefault()?.FullName}:{_userProfile.Email}).");
            }
        }

        private void SendEmailToAssignee(string message)
        {
            var emailHelper = new EmailHelper();
            var email = _userProfile?.Email ?? string.Empty;
            var name = _userProfile?.UserProfileTranslations?.FirstOrDefault()?.FullName ?? string.Empty;

            if (_departmentEmails != null && _departmentEmails.Count > 0)
            {
                emailHelper.SendCaseEmail(message, _sysCse.Title, email,
               name, _departmentEmails);
            }
        }
    }
}