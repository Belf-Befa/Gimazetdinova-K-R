<script setup>
import { ref } from 'vue'
const newOrder = ref({ title: '', siteId: '', description: '' })

function createOrder() {
  console.log('Создать:', newOrder.value)
}
</script>

<template>
  <section>
    <h2>Добавление нового оборудования</h2>
    <form class="form" @submit.prevent="createOrder">
      <label for="title">Наименование оборудования</label>
      <input id="title" name="title" v-model="newOrder.title" autofocus>

      <label for="siteId">Заказчик</label>
      <input id="siteId" name="siteId" v-model="newOrder.siteId">

      <label for="description">Статус</label>
      <input id="description" name="description" v-model="newOrder.description">

      <button type="submit">Сохранить</button>
    </form>
  </section>
</template>

<style scoped>
.form { display: flex; flex-direction: column; max-width: 400px; gap: 6px; }
.form label { font-weight: 500; margin-top: 10px; }
.form input { padding: 8px 12px; border: 1px solid #E0E0E0; border-radius: 4px; }
.form button { margin-top: 16px; padding: 10px; background: #C92627; color: #FEFEFE; border: none; border-radius: 4px; cursor: pointer; }
</style>