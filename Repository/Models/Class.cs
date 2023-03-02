using System;
using System.Collections.Generic;

namespace Repository.Models
{
    public partial class Class
    {
        public Class()
        {
            Requests = new HashSet<Request>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int? Mentorid { get; set; }
        public string Schedule { get; set; }

        public virtual Account Mentor { get; set; }
        public virtual ICollection<Request> Requests { get; set; }
    }
}
