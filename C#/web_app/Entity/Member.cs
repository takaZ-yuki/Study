using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using web_app.DAL.Models;

namespace web_app.Models
{
    [Table("members")]
    public class Member : BaseEntity
    {
        [Key]
        [Column("id")]
        public string Id { get; set; }

        [Required]
        [Column("name")]
        public string Name { get; set; }

        public virtual ICollection<Todo> Todos { get; set; }
    }
}
