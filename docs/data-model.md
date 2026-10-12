| Термин курса | Термин моей темы |
|--------------|------------------|
| Ticket | сборка |
| Site | оборудование |
| User | руководитель |

## ER-диаграмма предметной области  
<img width="1786" height="1106" alt="image" src="https://github.com/user-attachments/assets/cb831dfe-a9dc-43dc-903b-cb23d22d7ad7" />
  
## Схема базы данных  
<img width="1448" height="1025" alt="image" src="https://github.com/user-attachments/assets/ae0aa577-e59e-4124-a815-d60591a82139" />

### Таблица `assembly` — заказы на сборку

| Поле | Тип | Ключ | Ссылается на |
|------|-----|------|--------------|
| `id` | int | PK | — |
| `equipment_name` | int | FK | `equipment_models.id` |
| `customer` | int | FK | `customers.id` |
| `status` | int | FK | `statuses.id` |
| `electrician` | int | FK | `electricians.id` |

### Таблица `assembly_assemblers` — связь заказов и сборщиков

| Поле | Тип | Ключ | Ссылается на |
|------|-----|------|--------------|
| `id` | int | PK | — |
| `assembly_id` | int | FK | `assembly.id` |
| `assembler_id` | int | FK | `assemblers.id` |

### Таблица `equipment_models` — модели оборудования

| Поле | Тип | Ключ | Ссылается на |
|------|-----|------|--------------|
| `id` | int | PK | — |
| `category_id` | int | FK | `equipment_categories.id` |

### Таблица `equipment_categories` — категории оборудования

| Поле | Тип | Ключ | Ссылается на |
|------|-----|------|--------------|
| `id` | int | PK | — |

### Таблица `statuses` — статусы заказов

| Поле | Тип | Ключ | Ссылается на |
|------|-----|------|--------------|
| `id` | int | PK | — |

### Таблица `assemblers` — сборщики

| Поле | Тип | Ключ | Ссылается на |
|------|-----|------|--------------|
| `id` | int | PK | — |

### Таблица `customers` — заказчики

| Поле | Тип | Ключ | Ссылается на |
|------|-----|------|--------------|
| `id` | int | PK | — |

### Таблица `electricians` — электрики

| Поле | Тип | Ключ | Ссылается на |
|------|-----|------|--------------|
| `id` | int | PK | — |

### Сводка

| Таблица | Первичный ключ | Внешние ключи |
|---------|----------------|---------------|
| `assembly` | `id` | `equipment_name`, `customer`, `status`, `electrician` |
| `assembly_assemblers` | `id` | `assembly_id`, `assembler_id` |
| `equipment_models` | `id` | `category_id` |
| `equipment_categories` | `id` | — |
| `statuses` | `id` | — |
| `assemblers` | `id` | — |
| `customers` | `id` | — |
| `electricians` | `id` | — |

## Проверка 3 нормальной формы  
> Название оборудования хранится в сущности equipment_models один раз. Assembly содержит внешний ключ equipment_name. При переименовании оборудования меняется одна строка, поэтому текст названия не дублируется в сборке.
