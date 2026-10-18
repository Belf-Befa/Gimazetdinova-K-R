<script setup>
import { items } from '../ticketsStore.js'
import TicketTable from '../components/TicketTable.vue'
</script>

<template>
  <section>
    <h2>Заказы на сборку</h2>
    <TicketTable :items="items" />
  </section>
</template>