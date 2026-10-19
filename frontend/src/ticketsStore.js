import { ref } from 'vue'

export const items = ref([
  { id: 1, number: 101, title: 'ТРМ-1', siteId: 'ООО Ромашка', description: 'Сборка линии', status: 'Сборка' },
  { id: 2, number: 102, title: 'А-500', siteId: 'АО Пиво', description: 'Электрика', status: 'Электрика' }
])

let nextId = 3

export function addItem(title, siteId, description) {
  items.value.push({
    id: nextId,
    number: nextId,
    title: title,
    siteId: siteId,
    description: description,
    status: 'New'
  })
  nextId++
}