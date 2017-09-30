using System;

namespace web_app.DAL.Models
{
    /// <summary>
    /// モデルの基盤クラス
    /// </summary>
    public abstract class BaseEntity
    {
        internal void Add(object item)
        {
            throw new NotImplementedException();
        }
    }
}