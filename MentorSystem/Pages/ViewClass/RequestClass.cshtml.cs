using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;

namespace MentorSystem.Pages.ViewClass
{
    public class RequestClassModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;

        public RequestClassModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Class Class { get; set; }
        public IList<Account> Accounts { get; set; } = default!;
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Classes == null)
            {
                return NotFound();
            }
            if (_context.Accounts != null)
            {
                Accounts = await _context.Accounts.ToListAsync();
            }
            var stClass = await _context.Classes.FirstOrDefaultAsync(m => m.Id == id);

            if (stClass == null)
            {
                return NotFound();
            }
            else
            {
                Class = stClass;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.Classes == null)
            {
                return NotFound();
            }
            var stClass = await _context.Classes.FirstOrDefaultAsync(m => m.Id == id);
            if (stClass != null)
            {
                Request request = new Request()
                {
                    Studentid = Int32.Parse(HttpContext.Session.GetString("Id")),
                    Mentorid = stClass.Mentorid,
                    Classid = id,
                    Status = "Pending",
                    Title = "",
                    Content = ""
                };

                _context.Requests.Add(request);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
