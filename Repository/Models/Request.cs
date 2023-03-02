using System;
using System.Collections.Generic;

namespace Repository.Models
{
    public partial class Request
    {
        public int Id { get; set; }
        public int? Studentid { get; set; }
        public int? Mentorid { get; set; }
        public int? Classid { get; set; }
        public string Status { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }

        public virtual Class Class { get; set; }
        public virtual Account Mentor { get; set; }
        public virtual Account Student { get; set; }
    }
}
