# Таблица API:

| Метод и путь | Тело | Успех | Возможная ошибка |
|--------------|------|-------|------------------|
| `GET /api/assembly` | — | `200`, массив или `[]` | — |
| `GET /api/assembly/{id}` | — | `200`, объект | `404` |
| `POST /api/assembly` | `equipment_name`, `customer`, `status` | `201`, `id`, `number` | `400` |
| `PATCH /api/assembly/{id}/assemblers` | `assembler_ids[]` | `200` | `404` |
| `PATCH /api/assembly/{id}/electrician` | `electricianId` | `200` | `404` |
| `PATCH /api/assembly/{id}/status` | `status` | `200` | `404`, `409` |
| `DELETE /api/assembly/{id}` | — | `204` | `404` |
| `GET /api/references/{type}` | — | `200`, массив | `400` |
| `POST /api/references/{type}` | `name` | `201`, `id`, `name` | `400`, `409` |
| `PATCH /api/references/{type}/{id}` | `name`, `color_id` | `200` | `404` |
| `DELETE /api/references/{type}/{id}` | — | `204` | `404` |

Клиент не присылает при создании `id`, `number` и `color_id` - их определяет сервер.
