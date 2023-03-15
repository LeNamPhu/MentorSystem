using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;

namespace MentorSystem.Pages.ViewMentor
{
    public class ViewCVModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;

        public ViewCVModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }

        public MentorCv MentorCv { get; set; }
        public List<Class> MentorClassList { get; set; }
        public Account MentorAccount { get; set; }
        public List<Rating> MentorRating { get; set; }
        public List<Account> StudentAccount { get; set; }
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.MentorCvs == null)
            {
                return NotFound();
            }
            StudentAccount = await _context.Accounts.ToListAsync();
            MentorRating = await _context.Ratings.Where(r => r.Mentorid == id).ToListAsync();
            MentorAccount = await _context.Accounts.FirstOrDefaultAsync(m => m.Id == id);
            MentorClassList = await _context.Classes.Where(m => m.Mentorid == id).ToListAsync();
            var mentorCv = await _context.MentorCvs.FirstOrDefaultAsync(m => m.Mentorid == id);
            if (mentorCv == null)
            {
                return NotFound();
            }
            else
            {
                MentorCv = mentorCv;
            }
            return Page();
        }
    }
}
