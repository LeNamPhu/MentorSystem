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
        public IList<Account> Accounts { get; set; } = default!;

        public MentorCv MentorCv { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.MentorCvs == null)
            {
                return NotFound();
            }
            if (_context.Accounts != null)
            {
                Accounts = await _context.Accounts.ToListAsync();
            }
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
