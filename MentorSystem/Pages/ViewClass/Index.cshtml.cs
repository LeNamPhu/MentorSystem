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
        
        public IList<Account> Accounts { get; set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Classes != null)
            {
                if (HttpContext.Session.GetString("Role") == "Mentor")
                {
                    Class = await _context.Classes.Where(m => m.Mentorid == Int32.Parse(HttpContext.Session.GetString("Id"))).ToListAsync();
                }
                else
                {
                    Class = await _context.Classes.ToListAsync();
                }
            }
            if (_context.Accounts != null)
            {
                Accounts = await _context.Accounts.ToListAsync();
            }
        }
    }
}
