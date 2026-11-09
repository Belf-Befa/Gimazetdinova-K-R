-- Добавляем пользователей
INSERT INTO users (email, password_hash, name, role) VALUES 
('admin@example.com', 'hash', 'Администратор', 'admin'),
('editor@example.com', 'hash', 'Редактор', 'editor');

-- Добавляем категории и модели
INSERT INTO equipment_categories (name, color_id) VALUES 
('ТРМ', 1),
('Автомат выдува', 2);

INSERT INTO equipment_models (category_id, name) VALUES 
(1, 'ТРМ-1'),
(1, 'ТРМ-2'),
(2, 'А-500');

-- Заказчики
INSERT INTO customers (name) VALUES 
('ООО Ромашка'),
('АО Пиво');

-- Сборщики и Электрики
INSERT INTO assemblers (name) VALUES ('Иванов Иван'), ('Петров Петр');
INSERT INTO electricians (name) VALUES ('Сидоров Сидор');

-- Статусы (ровно 4 штуки по ТЗ)
INSERT INTO statuses (name) VALUES 
('New'), 
('InProgress'), 
('Closed'), 
('Cancelled');

-- Заказы (assembly)
INSERT INTO assembly (number, equipment_name, order_date, customer, status, created_by_user_id) VALUES 
(101, 1, '2026-10-01', 1, 1, 1), -- Статус New
(102, 3, '2026-10-02', 2, 2, 1); -- Статус InProgress

-- Привязка сборщиков к заказам
INSERT INTO assembly_assemblers (assembly_id, assembler_id) VALUES 
(1, 1),
(1, 2),
(2, 1);
