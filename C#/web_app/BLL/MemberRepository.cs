using Microsoft.EntityFrameworkCore;
using web_app.DAL.Abstractions;
using web_app.Models;

namespace web_app.DAL
{
    public class MemberRepository :
        GenericRepository<Member>
    {
        public MemberRepository(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
