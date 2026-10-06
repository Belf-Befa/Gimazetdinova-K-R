# Матрица соответствия

| Требование | Поле или сущность | Запрос | Критерий |
|------------|-------------------|--------|----------|
| Создать заказ | `assembly`, `equipment_name`, `customer`, `status` | `POST /api/assembly` | 1 |
| Назначить исполнителей | `assembler_ids[]` | `PATCH /api/assembly/{id}/assemblers` | 2 |
| Перевести в работу | `status` | `PATCH /api/assembly/{id}/status` | 3 |
