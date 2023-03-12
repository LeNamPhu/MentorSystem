using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repository.Models;

namespace MentorSystem.Pages.ViewClass
{
    public class ViewStudentClassModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;

        public ViewStudentClassModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }

        public IList<Class> Class { get; set; } = default!;
        public async Task<IActionResult> OnGetAsync()
        {
            var id = Int32.Parse(HttpContext.Session.GetString("Id"));
            if (id == null || _context.ClassInfos == null)
            {
                return NotFound();
            }
            var classList = new List<Class>();
            var classInfoList = _context.ClassInfos.Where(m => m.Studentid == id);
            foreach (var item in classInfoList)
            {
                var stClass = _context.Classes.FirstOrDefault(m => m.Id == item.Classid);
                classList.Add(stClass);
            }

            if (classList == null)
            {
                return NotFound();
            }
            else
            {
                Class = classList;
            }
            return Page();
        }
    }
}
