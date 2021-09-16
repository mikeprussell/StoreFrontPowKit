using StoreFrontPowKit.UI.MVC.Models;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;
using System.Web.Mvc;

namespace StoreFrontPowKit.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult About()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AllProducts()
        {
            return View();
        }

        [HttpGet]
        public ActionResult IndividualProduct()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            string body = $"Message received from PowKit. From {cvm.Name} - Subject {cvm.Subject}<br />Message:" +
                $"{cvm.Message}";

            string emailUser = WebConfigurationManager.AppSettings["EmailUser"];
            string emailToAddress = WebConfigurationManager.AppSettings["EmailToAddress"];
            string emailServer = WebConfigurationManager.AppSettings["EmailServer"];
            string emailPassword = WebConfigurationManager.AppSettings["EmailPassword"];

            MailMessage msg = new MailMessage(emailUser, emailToAddress, "Message from your contact form", body);

            msg.IsBodyHtml = true;

            SmtpClient client = new SmtpClient(emailServer);
            client.Credentials = new NetworkCredential(emailUser, emailPassword);

            try
            {
                client.Send(msg);
                return View("EmailConfirmation", cvm);

            }
            catch (System.Exception ex)
            {
                ViewBag.ErrorMessage = "Oops. Something went wrong - try again or contact an administrator.";

            }

            return View();

        }

    }

}
