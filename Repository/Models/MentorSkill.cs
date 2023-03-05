using System;
using System.Collections.Generic;

namespace Repository.Models
{
    public partial class MentorSkill
    {
        public int? Skillid { get; set; }
        public int? Mentorid { get; set; }

        public virtual Account Mentor { get; set; }
        public virtual Skill Skill { get; set; }

        public static implicit operator MentorSkill(List<Skill> v)
        {
            throw new NotImplementedException();
        }
    }
}
