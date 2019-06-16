using System;
using System.ServiceProcess;
using System.Timers;

namespace CRM.Cla
{
    public partial class Service1 : ServiceBase
    {
        private readonly Timer _timer = new Timer();
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            _timer.Elapsed += OnElapsedTime;
            _timer.Interval = 600000; // number in milisecinds  (600000 = 10 min)
            _timer.Enabled = true;
        }

        protected override void OnStop()
        {
            SlaHelper.WriteToFile("Service is stopped at " + DateTime.Now);
        }
        private void OnElapsedTime(object source, ElapsedEventArgs e)
        {
            SlaHelper.WriteToFile("Service is recall at " + DateTime.Now);
            SlaHelper.SendNotificationEmails();
        }                
    }
}
