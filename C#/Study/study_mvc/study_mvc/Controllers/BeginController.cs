using study_mvc.Models;
using System.Web.Mvc;

namespace study_mvc.Controllers
{
    public class BeginController : Controller
    {

        private MvcBasicContext db = new MvcBasicContext();

        // GET: Begin
        public ActionResult Index()
        {
            return Content("こんにちは、世界！");
        }

        // GET: Begin/Show
        public ActionResult Show()
        {
            ViewBag.Message = "こんにちは、世界！";

            return View();
        }

        public ActionResult List()
        {
            return View(db.Members);
        }
    }
}