using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Repository.Models;

namespace MentorSystem.Pages
{
    public class CreateModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;

        public CreateModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public Account Account { get; set; }

        public string Message { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid)
            {
                return Page();
            }
            DateTime date;
            if (Account.Email == null || Account.Password == null || Account.Fullname == null || Account.Phone == null || Account.Address == null)
            {
                Message = "All field required";
                return Page();
            }
            if (!DateTime.TryParse(Account.Dateofbirth, out date))
            {
                Message = "Invalid date";
                return Page();
            }

            _context.Accounts.Add(Account);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
