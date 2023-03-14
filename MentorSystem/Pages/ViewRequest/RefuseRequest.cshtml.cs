using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;

namespace MentorSystem.Pages.ViewRequest
{
    public class RefuseRequestModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;

        public RefuseRequestModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Request Request { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Requests == null)
            {
                return NotFound();
            }

            var Request = await _context.Requests.FirstOrDefaultAsync(m => m.Id == id);

            if (Request == null)
            {
                return NotFound();
            }
            else
            {
                Request = Request;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.Requests == null)
            {
                return NotFound();
            }
            Request.Status = "Refused";
            _context.Attach(Request).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RequestExists(Request.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }
        private bool RequestExists(int id)
        {
            return _context.Requests.Any(e => e.Id == id);
        }
    }
}
