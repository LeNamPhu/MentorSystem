using System;
using System.Collections.Generic;

namespace Repository.Models
{
    public partial class Account
    {
        public Account()
        {
            Classes = new HashSet<Class>();
            MentorCvs = new HashSet<MentorCv>();
            RatingMentors = new HashSet<Rating>();
            RatingStudents = new HashSet<Rating>();
            RequestMentors = new HashSet<Request>();
            RequestStudents = new HashSet<Request>();
        }

        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Dateofbirth { get; set; }
        public string Sex { get; set; }

        public virtual ICollection<Class> Classes { get; set; }
        public virtual ICollection<MentorCv> MentorCvs { get; set; }
        public virtual ICollection<Rating> RatingMentors { get; set; }
        public virtual ICollection<Rating> RatingStudents { get; set; }
        public virtual ICollection<Request> RequestMentors { get; set; }
        public virtual ICollection<Request> RequestStudents { get; set; }
    }
}
