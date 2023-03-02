using System;
using System.Collections.Generic;

namespace Repository.Models
{
    public partial class ClassInfo
    {
        public int? Classid { get; set; }
        public int? Studentid { get; set; }

        public virtual Class Class { get; set; }
        public virtual Account Student { get; set; }
    }
}
