<script setup>
import { ref } from 'vue'

const screen = ref('list')

// Данные повторяют структуру твоего PHP-сайта
const orders = [
  { id: 1, number: 101, equipment: 'ТРМ-1', customer: 'ООО Ромашка', status: 'Сборка' },
  { id: 2, number: 102, equipment: 'А-500', customer: 'АО Пиво', status: 'Электрика' }
]

const newOrder = ref({
  equipment: '',
  customer: '',
  status: ''
})

function createOrder() {
  console.log('Создать заказ:', newOrder.value)
}
</script>

<template>
  <header class="header">
    <h1>Учёт сборки оборудования</h1>
    <nav class="actions">
      <button type="button" @click="screen = 'list'">Список</button>
      <button type="button" @click="screen = 'new'">Создать</button>
      <button type="button" @click="screen = 'login'">Вход</button>
    </nav>
  </header>

  <main class="main">
    <!-- СПИСОК -->
    <section v-if="screen === 'list'">
      <h2>Заказы на сборку</h2>
      <table class="table">
        <thead>
          <tr>
            <th>№</th>
            <th>Оборудование</th>
            <th>Заказчик</th>
            <th>Статус</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="order in orders" :key="order.id">
            <td>{{ order.number }}</td>
            <td>{{ order.equipment }}</td>
            <td>{{ order.customer }}</td>
            <td>{{ order.status }}</td>
          </tr>
        </tbody>
      </table>
    </section>

    <!-- СОЗДАНИЕ -->
    <section v-else-if="screen === 'new'">
      <h2>Добавление нового оборудования</h2>
      <form class="form" @submit.prevent="createOrder">
        <label for="equipment">Наименование оборудования</label>
        <input id="equipment" name="equipment" v-model="newOrder.equipment" autofocus>

        <label for="customer">Заказчик</label>
        <input id="customer" name="customer" v-model="newOrder.customer">

        <label for="status">Статус</label>
        <input id="status" name="status" v-model="newOrder.status">

        <button type="submit">Сохранить</button>
      </form>
    </section>

    <!-- ВХОД -->
    <section v-else-if="screen === 'login'">
      <h2>Вход в систему</h2>
      <form class="form" @submit.prevent>
        <label for="email">Email</label>
        <input id="email" name="email" type="email" autofocus>

        <label for="password">Пароль</label>
        <input id="password" name="password" type="password">

        <button type="submit">Войти</button>
      </form>
    </section>
  </main>
</template>

<style scoped>
.header {
    background: #C92627;
    color: #FEFEFE;
    padding: 18px 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.actions button {
    background: none;
    border: none;
    color: #FEFEFE;
    font-size: 14px;
    text-transform: uppercase;
    cursor: pointer;
    margin-left: 20px;
}
.main {
    padding: 20px 60px;
}
.table {
    width: 100%;
    border-collapse: collapse;
    background: #FEFEFE;
}
.table th {
    background: #C92627;
    color: #FEFEFE;
    padding: 8px;
    text-align: left;
}
.table td {
    padding: 8px;
    border-bottom: 1px solid #E0E0E0;
}
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
.form input {
    padding: 8px 12px;
    border: 1px solid #E0E0E0;
    border-radius: 4px;
    font-size: 14px;
}
.form button {
    margin-top: 16px;
    padding: 10px;
    background: #C92627;
    color: #FEFEFE;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
</style>