// Начальные данные
let mockDb = [
  { id: 1, number: 'A-101', title: 'ТРМ-1', siteId: 2, description: 'Сборка линии розлива', status: 'New' },
  { id: 2, number: 'A-102', title: 'А-500', siteId: 1, description: 'Проверка электрики', status: 'New' }
]

let nextId = 3

// Функция для создания задержки
const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms))

export async function mockGetTickets() {
  await delay(500)
  
  return { ok: true, status: 200, data: [...mockDb] }
}

export async function mockCreateTicket(body) {
  await delay(500)

  // Имитация ошибки 500
  if (body.force500) {
    return { ok: false, status: 500, data: { message: 'Сервер не смог обработать запрос' } }
  }

  // Имитация ошибки 400
  if (!body.title || body.title.trim().length < 5) {
    return { ok: false, status: 400, data: { message: 'Проверьте поля. Тема слишком короткая' } }
  }

  // Успешное создание
  const newTicket = {
    id: nextId,
    number: `A-${100 + nextId}`,
    title: body.title,
    siteId: body.siteId,
    description: body.description,
    status: 'New'
  }
  
  mockDb.push(newTicket)
  nextId++
  
  return { ok: true, status: 201, data: newTicket }
}