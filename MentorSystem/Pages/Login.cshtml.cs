using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repository.Models;
using Repository.Repository;

namespace MentorSystem.Pages
{
    public class LoginModel : PageModel
    {
        [BindProperty]
        public Account account { get; set; }
        [BindProperty]
    public string Message { get; set; }
        private readonly AccountRepository _repository;
        public LoginModel (AccountRepository repository)
        {
            _repository = repository;
        }
        public void OnGet()
        {
        }
        public IActionResult OnPost()
        {
            var check = _repository.GetAll().Where(p => p.Email.Equals(account.Email) && p.Password.Equals(account.Password)).FirstOrDefault();
            if (check != null)
            {

                HttpContext.Session.SetString("Email", check.Email);
                HttpContext.Session.SetString("Role", check.Role);
                HttpContext.Session.SetString("Id", check.Id.ToString());
                if (check.Role == "Student")
                {
                    return RedirectToPage("/ViewClass/Index");
                }
                else
                {
                    return RedirectToPage("/ViewRequest/Index");
                }
            }
            else
            {
                Message = "Wrong Username or Password";
                return Page();
            }
        }
    }
}
