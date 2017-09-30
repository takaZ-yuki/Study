using NLog;

namespace web_app.Service.Abstractions
{
    /// <summary>
    /// サービスの基盤クラス
    /// </summary>
    public abstract class BaseSarvice
    {
        protected static Logger _logger = LogManager.GetCurrentClassLogger();
    }
}
