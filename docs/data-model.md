| Термин курса | Термин моей темы |
|--------------|------------------|
| Ticket | сборка |
| Site | оборудование |
| User | руководитель |

## ER-диаграмма предметной области  
<img width="1786" height="1106" alt="image" src="https://github.com/user-attachments/assets/cb831dfe-a9dc-43dc-903b-cb23d22d7ad7" />
  
## Схема базы данных  
<img width="1448" height="1025" alt="image" src="https://github.com/user-attachments/assets/ae0aa577-e59e-4124-a815-d60591a82139" />

## Проверка 3 нормальной формы  
> Название оборудования хранится в сущности equipment_models один раз. Assembly содержит внешний ключ equipment_name. При переименовании оборудования меняется одна строка, поэтому текст названия не дублируется в сборке.
