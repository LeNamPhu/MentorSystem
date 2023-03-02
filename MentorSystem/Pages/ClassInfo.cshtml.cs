using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using NuGet.Protocol.Core.Types;
using Repository.Models;
using Repository.Repository;

namespace MentorSystem.Pages
{
    public class ClassInfoModel : PageModel
    {
        private readonly ClassInfoRepository _classinforepository;

        private readonly AccountRepository _accountrepository;
        public ClassInfoModel(AccountRepository accountrepository, ClassInfoRepository classinforepository)
        {
            _accountrepository = accountrepository;
            _classinforepository = classinforepository;
           
        }
        public List<ClassInfo> ClassInfo { get; set; } = default!;
        public IList<Account> Account { get; set; } = default!;   
        public IActionResult OnGet(string id)
        {
            //kiem tra login bang session
            if (HttpContext.Session.GetString("Email") == null)
            {
                return RedirectToPage("Login");
            }

            ClassInfo = _classinforepository.GetAll().Where(p => p.Classid.Equals(Int32.Parse(id))).ToList();
            foreach (ClassInfo classinfo in ClassInfo)
            {
                Account = _accountrepository.GetAll().Where(p => p.Id.Equals(3)).ToList();
                Repository.Models.Account acc = _accountrepository.GetById(classinfo.Studentid.ToString());
                Account.Add( acc);
            }


            return Page();
        }
    }
}
