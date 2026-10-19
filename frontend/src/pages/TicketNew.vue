<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { addItem } from '../ticketsStore.js'

const router = useRouter()

// Данные формы
const form = ref({
  title: '',
  siteId: '',
  description: ''
})

// Объект для хранения ошибок
const errors = ref({
  title: '',
  siteId: '',
  description: ''
})

// Функция сохранения
function onCreate() {
  errors.value = { title: '', siteId: '', description: '' }
  
  let isValid = true

  // Проверка темы
  const cleanTitle = form.value.title.trim()
  if (cleanTitle.length < 5 || cleanTitle.length > 80) {
    errors.value.title = 'Тема: от 5 до 80 символов'
    isValid = false
  }

  // Проверка номера/заказчика
  if (!form.value.siteId || form.value.siteId <= 0) {
    errors.value.siteId = 'Номер должен быть больше 0'
    isValid = false
  }

  // Проверка описания
  const cleanDescription = form.value.description.trim()
  if (cleanDescription.length < 10 || cleanDescription.length > 500) {
    errors.value.description = 'Описание: от 10 до 500 символов'
    isValid = false
  }

  if (!isValid) return

  addItem(cleanTitle, Number(form.value.siteId), cleanDescription)

  form.value = { title: '', siteId: '', description: '' }

  router.push('/')
}
</script>

<template>
  <section>
    <h2>Добавление нового оборудования</h2>
    
    <!-- @submit.prevent не дает странице перезагрузиться -->
    <form class="form" @submit.prevent="onCreate">
      
      <label for="title">Наименование оборудования (5-80 символов)</label>
      <input id="title" name="title" v-model="form.title" autofocus>
      <span class="error" v-if="errors.title">{{ errors.title }}</span>

      <label for="siteId">Заказчик (номер)</label>
      <!-- .number гарантирует, что в переменную попадет число, а не строка -->
      <input id="siteId" name="siteId" type="number" v-model.number="form.siteId">
      <span class="error" v-if="errors.siteId">{{ errors.siteId }}</span>

      <label for="description">Примечания / Описание (10-500 символов)</label>
      <textarea id="description" name="description" v-model="form.description"></textarea>
      <span class="error" v-if="errors.description">{{ errors.description }}</span>

      <button type="submit">Сохранить</button>
    </form>
  </section>
</template>

<style scoped>
.form { display: flex; flex-direction: column; max-width: 400px; gap: 6px; }
.form label { font-weight: 500; margin-top: 10px; }
.form input, .form textarea { padding: 8px 12px; border: 1px solid #E0E0E0; border-radius: 4px; font-family: inherit; }
.form textarea { min-height: 80px; resize: vertical; }
.form button { margin-top: 16px; padding: 10px; background: #C92627; color: #FEFEFE; border: none; border-radius: 4px; cursor: pointer; }

.error {
    color: #C92627;
    font-size: 12px;
    margin-top: -2px;
}
</style>