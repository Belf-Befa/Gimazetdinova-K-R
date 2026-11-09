Тема: Разработка web-приложения управления сборкой оборудования для промышленного предприятия  
ФИО: Гимазетдинова Камиля Равилевна  
Группа: ТРИС-1-23  
Стек: Vue 3 + ASP.NET Core + PostgreSQL  
Статус темы:  

## Запуск клиента (Vue 3)

```bash
cd frontend
npm install
npm run dev
```

Открыть адрес Vite, обычно http://localhost:5173

## Запуск сервера (C# ASP.NET Core)

```bash
cd backend
dotnet restore
dotnet run
```

API: http://localhost:5000  
Swagger: http://localhost:5000/swagger  
Health: http://localhost:5000/health  

## База данных (PostgreSQL)

Схема и данные лежат в папке `db/`.
Для применения выполните в pgAdmin или через psql:
psql -d course_assembly -f db/schema.sql
psql -d course_assembly -f db/seed.sql
psql -d course_assembly -f db/queries.sql
