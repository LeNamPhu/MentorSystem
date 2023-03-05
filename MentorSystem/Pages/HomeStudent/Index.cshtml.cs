using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGeneration.EntityFrameworkCore;
using Repository.Models;
using Repository.Repository;

namespace MentorSystem.Pages.HomeStudent
{
    public class IndexModel : PageModel
    {
        
        private readonly ClassRepository _classrepository ;
        
        public IndexModel( ClassRepository classrepository)
        {
            _classrepository = classrepository;
        }
        

        public IList<Class> Class { get;set; } = default!;
        
        public IActionResult OnGet()
        {
            //kiem tra login bang session
            if (HttpContext.Session.GetString("Email") == null)
            {
                return RedirectToPage("Login");
            }
           
            Class = _classrepository.GetAll().Where(p => p.Mentorid.Equals(Int32.Parse(HttpContext.Session.GetString("Id")))).ToList();
            

            
            return Page();
        }
        
    }   
}

