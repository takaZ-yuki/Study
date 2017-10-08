using System.Data.Entity;

namespace study_mvc.Models
{
    public class MvcBasicContext :DbContext
    {
        public DbSet<Member> Members { get; set; }
    }
}