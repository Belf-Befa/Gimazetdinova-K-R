-- 1. Фильтр и сортировка
SELECT number, serial_number, status, created_at
FROM assembly
WHERE status = 1 -- (ID статуса New, так как у нас связь по ID)
ORDER BY created_at DESC;

-- 2. JOIN (Показать название заказчика вместо его ID)
SELECT a.number, em.name AS equipment, c.name AS customer, s.name AS status
FROM assembly AS a
JOIN customers AS c ON c.id = a.customer
JOIN equipment_models AS em ON em.id = a.equipment_name
JOIN statuses AS s ON s.id = a.status
ORDER BY a.created_at DESC;

-- 3. GROUP BY (Сколько заказов в каждом статусе)
SELECT s.name AS status, COUNT(*) AS count
FROM assembly AS a
JOIN statuses AS s ON s.id = a.status
GROUP BY s.name
ORDER BY s.name;

-- 4. Проверка CHECK (должна быть ошибка)
-- Попытка вставить статус, которого нет в списке
INSERT INTO statuses (name) VALUES ('Done'); 
