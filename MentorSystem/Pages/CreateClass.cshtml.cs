using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;
using Repository.Repository;

namespace MentorSystem.Pages
{
    public class CreateClassModel : PageModel
    {
        private readonly ClassRepository _classrepository;

        public CreateClassModel(ClassRepository classrepository)
        {
            _classrepository = classrepository;
        }
        public IActionResult OnGet()
        {
            return Page();
        }
        [BindProperty]
        public Class Class { get; set; }


        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _classrepository.Create(Class);
            

            return RedirectToPage("./Index");
        }
    }
}
