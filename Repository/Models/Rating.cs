using System;
using System.Collections.Generic;

namespace Repository.Models
{
    public partial class Rating
    {
        public int Id { get; set; }
        public int? Rating1 { get; set; }
        public string Comment { get; set; }
        public int? Studentid { get; set; }
        public int? Mentorid { get; set; }

        public virtual Account Mentor { get; set; }
        public virtual Account Student { get; set; }
    }
}
