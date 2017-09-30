using Microsoft.AspNetCore.Mvc;
using NLog;

namespace web_app.Controllers.Abstractions
{
    /// <summary>
    /// コントローラの基盤クラス
    /// </summary>
    public abstract class BaseController : Controller
    {
        protected static Logger _logger = LogManager.GetCurrentClassLogger();
    }
}
