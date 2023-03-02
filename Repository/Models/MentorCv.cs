using System;
using System.Collections.Generic;

namespace Repository.Models
{
    public partial class MentorCv
    {
        public int Id { get; set; }
        public int? Mentorid { get; set; }
        public string Profession { get; set; }
        public string Achievement { get; set; }
        public string Job { get; set; }
        public string Introduction { get; set; }
        public string Service { get; set; }

        public virtual Account Mentor { get; set; }
    }
}
