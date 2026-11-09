using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using backend.Models;
using backend.Data;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/assembly")]
    public class AssemblyController : ControllerBase
    {
        private readonly AppDbContext _context;

        public AssemblyController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/assembly
        [HttpGet]
        public async Task<IActionResult> GetList()
        {
            var items = await _context.Assemblies.OrderByDescending(a => a.CreatedAt).ToListAsync();
            return Ok(items);
        }

        // GET: api/assembly/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var item = await _context.Assemblies.FindAsync(id);
            if (item == null) return NotFound();
            return Ok(item);
        }

        // POST: api/assembly
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Assembly newItem)
        {
            newItem.CreatedAt = DateTime.UtcNow;
            _context.Assemblies.Add(newItem);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = newItem.Id }, newItem);
        }
    }
}