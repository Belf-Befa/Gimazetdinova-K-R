<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { addItem } from '../ticketsStore.js'

const router = useRouter()

// Объект формы
const newOrder = ref({
  title: '',
  siteId: '',
  description: ''
})

// Объект для ошибок
const errors = ref({
  title: '',
  siteId: '',
  description: ''
})

// Функция отправки формы
function createOrder() {
  // Сброс старых ошибок
  errors.value = { title: '', siteId: '', description: '' }
  let isValid = true

  // Валидация темы
  const cleanTitle = newOrder.value.title.trim()
  if (cleanTitle.length < 5 || cleanTitle.length > 80) {
    errors.value.title = 'Тема должна быть от 5 до 80 символов'
    isValid = false
  }

  // Валидация siteId 
  const siteIdNum = Number(newOrder.value.siteId)
  if (isNaN(siteIdNum) || siteIdNum <= 0 || !Number.isInteger(siteIdNum)) {
    errors.value.siteId = 'ID должен быть целым числом больше 0'
    isValid = false
  }

  // Валидация описания
  const cleanDesc = newOrder.value.description.trim()
  if (cleanDesc.length < 10 || cleanDesc.length > 500) {
    errors.value.description = 'Описание должно быть от 10 до 500 символов'
    isValid = false
  }

  if (!isValid) return

  addItem(cleanTitle, siteIdNum, cleanDesc)

  newOrder.value = { title: '', siteId: '', description: '' }

  router.push('/')
}
</script>

<template>
  <section>
    <h2>Добавление нового оборудования</h2>
    
    <form class="form" @submit.prevent="createOrder">
      
      <label for="title">Наименование оборудования (5–80 символов)</label>
      <input 
        id="title" 
        name="title" 
        v-model="newOrder.title" 
        autofocus
      >
      <!-- Вывод ошибки под полем -->
      <span class="error" v-if="errors.title">{{ errors.title }}</span>

      <label for="siteId">Заказчик (ID, число > 0)</label>
      <!-- v-model.number -->
      <input 
        id="siteId" 
        name="siteId" 
        type="number" 
        v-model.number="newOrder.siteId"
      >
      <span class="error" v-if="errors.siteId">{{ errors.siteId }}</span>

      <label for="description">Описание (10–500 символов)</label>
      <textarea 
        id="description" 
        name="description" 
        v-model="newOrder.description"
      ></textarea>
      <span class="error" v-if="errors.description">{{ errors.description }}</span>

      <button type="submit">Сохранить</button>
    </form>
  </section>
</template>

<style scoped>
.form {
  display: flex;
  flex-direction: column;
  max-width: 400px;
  gap: 6px;
}

.form label {
  font-weight: 500;
  margin-top: 10px;
}

.form input, 
.form textarea {
  padding: 8px 12px;
  border: 1px solid #E0E0E0;
  border-radius: 4px;
  font-family: inherit;
  font-size: 14px;
}

.form textarea {
  min-height: 80px;
  resize: vertical;
}

.form button {
  margin-top: 16px;
  padding: 10px;
  background: #C92627;
  color: #FEFEFE;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
}

.form button:hover {
  background: #a81f20;
}

.error {
  color: #C92627;
  font-size: 13px;
  margin-top: -2px;
  margin-bottom: 5px;
}
</style>
