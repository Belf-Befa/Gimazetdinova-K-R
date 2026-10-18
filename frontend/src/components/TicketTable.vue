<script setup>
defineProps({
  items: { type: Array, required: true }
})
</script>

<template>
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
      <tr v-for="order in items" :key="order.id">
        <td>{{ order.number }}</td>
        <td>{{ order.title }}</td>
        <td>{{ order.siteId }}</td>
        <td>{{ order.status }}</td>
      </tr>
    </tbody>
  </table>
</template>

<style scoped>
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
</style>