-- Удаляем старые таблицы, если они есть (для пересоздания)
DROP TABLE IF EXISTS assembly_assemblers CASCADE;
DROP TABLE IF EXISTS assembly CASCADE;
DROP TABLE IF EXISTS equipment_models CASCADE;
DROP TABLE IF EXISTS equipment_categories CASCADE;
DROP TABLE IF EXISTS assemblers CASCADE;
DROP TABLE IF EXISTS electricians CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS statuses CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- 1. Пользователи
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'editor', 'reader')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Справочник (категории оборудования)
CREATE TABLE equipment_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    color_id INT DEFAULT 1
);

-- 3. Модели оборудования
CREATE TABLE equipment_models (
    id SERIAL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES equipment_categories(id) ON DELETE CASCADE,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 4. Статусы (по требованию ЛР9)
CREATE TABLE statuses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL CHECK (name IN ('New', 'InProgress', 'Closed', 'Cancelled'))
);

-- 5. Заказчики
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- 6. Сборщики
CREATE TABLE assemblers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 7. Электрики
CREATE TABLE electricians (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 8. Главная таблица (Заказы/Сборки)
CREATE TABLE assembly (
    id SERIAL PRIMARY KEY,
    number INT,
    equipment_name INT REFERENCES equipment_models(id),
    order_date DATE,
    customer INT REFERENCES customers(id),
    status INT REFERENCES statuses(id),
    planned_start DATE,
    actual_start DATE,
    actual_end DATE,
    planned_shipment DATE,
    actual_shipment DATE,
    electrician INT REFERENCES electricians(id),
    serial_number INT,
    notes TEXT,
    packaging_info VARCHAR(255),
    disassembly_info VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by_user_id INT REFERENCES users(id),
    assignee_user_id INT REFERENCES users(id) -- Может быть NULL
);

-- 9. Связь заказов и сборщиков (многие ко многим)
CREATE TABLE assembly_assemblers (
    assembly_id INT REFERENCES assembly(id) ON DELETE CASCADE,
    assembler_id INT REFERENCES assemblers(id) ON DELETE CASCADE,
    PRIMARY KEY (assembly_id, assembler_id)
);

-- ИНДЕКСЫ (по требованию ЛР9)
-- Ускоряет фильтрацию по статусу (WHERE status = ...)
CREATE INDEX assembly_status_idx ON assembly (status);
-- Ускоряет фильтрацию по заказчику (JOIN customers)
CREATE INDEX assembly_customer_idx ON assembly (customer);
