using Microsoft.EntityFrameworkCore;
using NLog;
using System.Collections.Generic;
using System.Linq;
using web_app.DAL.Exceptions;
using web_app.DAL.Models;

namespace web_app.DAL.Abstractions
{
    /// <summary>
    /// Repository ジェネリクスクラス
    /// </summary>
    /// <typeparam name="T">Entity</typeparam>
    public abstract class GenericRepository<T> : IGenericRepository<T> where T : BaseEntity
    {
        protected static Logger _logger = LogManager.GetCurrentClassLogger();

        private DbContext _dbContext;
        private DbSet<T> entities;

        public GenericRepository(DbContext dbContext)
        {
            _dbContext = dbContext;
            entities = _dbContext.Set<T>();
        }

        /// <summary>
        /// 追加
        /// </summary>
        /// <param name="item">追加Entitys</param>
        public void Add(T item)
        {
            Add(item, true);
        }

        public void Add(T item, bool saveChanges)
        {
            entities.Add(item);
            if (saveChanges) _dbContext.SaveChanges();
        }

        /// <summary>
        /// キーで検索
        /// </summary>
        /// <param name="keys">キー項目</param>
        /// <returns></returns>
        public T FindByID(params object[] keys)
        {
            T result = entities.Find(keys);
            if (result == null)
                throw new ObjectNotFoundException();
            return result;
        }

        /// <summary>
        /// 全件検索
        /// </summary>
        /// <returns></returns>
        public IEnumerable<T> GetAll()
        {
            return entities.AsEnumerable();
        }

        /// <summary>
        /// 削除
        /// </summary>
        /// <param name="keys">キー項目</param>
        public void Remove(params object[] keys)
        {
            Remove(true, keys);
        }

        public void Remove(bool saveChanges, params object[] keys)
        {
            var item = FindByID(keys);
            entities.Remove(item);
            if (saveChanges) _dbContext.SaveChanges();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="item">更新対象項目</param>
        public void Update(T item)
        {
            Update(item, true);
        }

        public void Update(T item, bool saveChanges)
        {
            _dbContext.Entry(item).State = EntityState.Modified;
            if (saveChanges) _dbContext.SaveChanges();
        }

    }
}
