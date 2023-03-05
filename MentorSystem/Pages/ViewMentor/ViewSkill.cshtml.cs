using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;

namespace MentorSystem.Pages.ViewMentor
{
    public class ViewSkillModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;
        
        public ViewSkillModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }

        public IList<Skill> MentorSkills { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.MentorSkills == null)
            {
                return NotFound();
            }
            var skillList = new List<Skill>();
            var mentorSkill = _context.MentorSkills.Where(m => m.Mentorid == id);
            foreach (var item in mentorSkill)
            {
                var skill = _context.Skills.FirstOrDefault(m => m.Id == item.Skillid);
                skillList.Add(skill);
            }
            
            if (skillList == null)
            {
                return NotFound();
            }
            else
            {
                MentorSkills = skillList;
            }
            return Page();
        }
    }
}
