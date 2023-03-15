using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;

namespace MentorSystem.Pages.ViewRequest
{
    public class IndexModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;


        public IndexModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }

        public IList<Request> Request { get; set; } = default!;

        public IList<Class> Class { get; set; } = default!;

        public IList<Account> Accounts { get; set; } = default!;
        public async Task OnGetAsync()
        {
            if (_context.Requests != null)
            {
                Request = await _context.Requests.ToListAsync();
            }
            if (_context.Classes != null)
            {
                Class = await _context.Classes.ToListAsync();
            }
            if (_context.Accounts != null)
            {
                Accounts = await _context.Accounts.ToListAsync();
            }
        }
    }
}
