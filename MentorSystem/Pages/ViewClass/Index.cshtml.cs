using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;

namespace MentorSystem.Pages.ViewClass
{
    public class IndexModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;


        public IndexModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }

        public IList<Class> Class { get; set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Accounts != null)
            {
                Class = await _context.Classes.ToListAsync();
            }
        }
    }
}
