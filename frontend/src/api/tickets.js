import { mockGetTickets, mockCreateTicket } from './mockTickets.js'

const USE_MOCK = true
const baseUrl = import.meta.env.VITE_API_BASE_URL || 'http://localhost:5000'

export async function getTickets() {
  if (USE_MOCK) {
    const response = await mockGetTickets()
    if (!response.ok) throw new Error('Ошибка загрузки')
    return response.data
  }

  const response = await fetch(`${baseUrl}/api/assembly`)
  if (!response.ok) throw new Error(`Ошибка HTTP: ${response.status}`)
  return await response.json()
}

export async function createTicket(body) {
  if (USE_MOCK) {
    const response = await mockCreateTicket(body)
    if (!response.ok) {
      throw new Error(response.data.message || `Ошибка HTTP: ${response.status}`)
    }
    return response.data
  }

  const response = await fetch(`${baseUrl}/api/assembly`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body)
  })
  if (!response.ok) {
    throw new Error(`Ошибка HTTP: ${response.status}`)
  }
  return await response.json()
}