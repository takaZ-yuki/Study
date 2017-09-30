using Microsoft.EntityFrameworkCore;
using web_app.DAL.Abstractions;
using web_app.Models;

namespace web_app.DAL
{
    public class TodoRepository :
        GenericRepository<Todo>
    {
        public TodoRepository(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
