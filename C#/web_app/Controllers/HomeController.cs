using Microsoft.AspNetCore.Mvc;
using web_app.Controllers.Abstractions;
using web_app.Service;

namespace web_app.Controllers
{
    /// <summary>
    /// サンプルコントローラ
    /// </summary>
    public class HomeController : BaseController
    {
        // サンプルサービス
        private IHelloService helloService = null;

        // コンストラクタでインジェクションされる
        public HomeController(IHelloService helloService)
        {
            this.helloService = helloService;
        }

        public IActionResult Index()
        {
            // インジェクションされているので、関数を実行できる
            helloService.Hi();

            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
