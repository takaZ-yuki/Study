using System.Collections.Generic;
using web_app.DAL.Models;

namespace web_app.DAL.Abstractions
{
    /// <summary>
    /// Repository ジェネリクス インターフェース
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IGenericRepository<T> where T : BaseEntity
    {
        void Add(T item);
        void Remove(params object[] keys);
        void Update(T item);
        T FindByID(params object[] keys);
        IEnumerable<T> GetAll();
    }
}
