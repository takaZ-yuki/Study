using Microsoft.EntityFrameworkCore;
using web_app.Models;

namespace web_app.DbConnection
{
    // DB接続コンテキスト
    public class WevAppDbContext : DbContext
    {
        public WevAppDbContext(DbContextOptions<WevAppDbContext> options)
        : base(options)
        { }

        public DbSet<Member> Member { get; set; }
        public DbSet<Todo> Todo { get; set; }

    }
}
