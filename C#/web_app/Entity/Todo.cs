using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using web_app.DAL.Models;

namespace web_app.Models
{
    [Table("todos")]
    public class Todo: BaseEntity
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("member_id")]
        public string MemberId { get; set; }

        [Required]
        [Column("content")]
        public string Content { get; set; }

        [Column("due")]
        public DateTime Due { get; set; }

        [Column("done")]
        public bool Done { get; set; }

        public virtual Member Member { get; set; }
    }
}
