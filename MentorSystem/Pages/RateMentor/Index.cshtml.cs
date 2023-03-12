using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Repository.Models;

namespace MentorSystem.Pages.RateMentor
{
    public class IndexModel : PageModel
    {
        private readonly Repository.Models.MentorSystemContext _context;

        public IndexModel(Repository.Models.MentorSystemContext context)
        {
            _context = context;
        }
        [BindProperty]
        public string Message { get; set; }
        [BindProperty]
        public IList<Rating> Rating { get; set; }
        [BindProperty]
        public Rating RateMentor { get; set; }
        public int? MentorId { get; set; }
        public int Rate { get; set; }
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var rate = _context.Ratings.Where(m => m.Mentorid == id);

            if (rate == null)
            {
                Message = "This mentor has not been rated yet.";
                return Page();
            }
            else
            {
                MentorId = id;
                Rating = rate.ToList();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {

            Rating rating = new Rating()
            {
                Rating1 = Int32.Parse(Request.Form["Rating"]),
                Comment = RateMentor.Comment,
                Studentid = Int32.Parse(HttpContext.Session.GetString("Id")),
                Mentorid = id
            };

            _context.Ratings.Add(rating);
            await _context.SaveChangesAsync();
            

            return Page();
        }
    }
}
