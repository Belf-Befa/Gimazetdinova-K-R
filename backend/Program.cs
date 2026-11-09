using Microsoft.EntityFrameworkCore;
using backend.Data;

var builder = WebApplication.CreateBuilder(args);

// Подключение к PostgreSQL
var connectionString = builder.Configuration.GetConnectionString("Default");
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(connectionString));

builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.MapGet("/health", () => Results.Ok("ok"));

app.MapGet("/info", () => Results.Ok(new
{
    name = "Учёт сборки оборудования API",
    environment = app.Environment.EnvironmentName,
    version = "ЛР7"
}));


app.MapControllers();

app.Run();