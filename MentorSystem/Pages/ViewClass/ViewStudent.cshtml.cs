using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;

namespace MentorSystem.Pages.ViewClass
{
    public class ViewStudentModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;


        public ViewStudentModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }


        public IList<Account> Accounts { get; set; } = default!;
        public int? ClassId;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            var studentList = await _context.ClassInfos.Where(c => c.Classid == id).ToListAsync();
            if (_context.Accounts != null)
            {
                Accounts = new List<Account>();
                foreach (var student  in studentList)
                {
                    Accounts.Add(_context.Accounts.FirstOrDefault(a => a.Id == student.Studentid));
                }
                ClassId = id;
            }
            return Page();
        }
        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (_context.ClassInfos == null)
            {
                return NotFound();
            }
            var account = _context.ClassInfos.FirstOrDefault(c => c.Studentid == Int32.Parse(Request.Form["StudentId"]));

            if (account != null)
            {
                _context.ClassInfos.Remove(account);
                await _context.SaveChangesAsync();
            }
            ClassId = Int32.Parse(Request.Form["ClassId"]);
            return RedirectToAction("./ViewStudent", new { id = ClassId }); ;
        }
    }
}
