<script setup>
import { ref, onMounted } from 'vue'
import { getTickets } from '../api/tickets.js'
import TicketTable from '../components/TicketTable.vue'

const items = ref([])
const screen = ref('loading') 
const errorMessage = ref('')

async function loadData() {
  screen.value = 'loading'
  try {
    const data = await getTickets()
    items.value = data
    if (data.length === 0) {
      screen.value = 'empty'
    } else {
      screen.value = 'data'
    }
  } catch (error) {
    errorMessage.value = error.message
    screen.value = 'error'
  }
}

onMounted(() => {
  loadData()
})
</script>

<template>
  <section>
    <h2>Заказы на сборку</h2>
    
    <div v-if="screen === 'loading'">Загрузка...</div>
    
    <div v-else-if="screen === 'empty'">Записей пока нет</div>
    
    <div v-else-if="screen === 'error'" class="error">
      {{ errorMessage }}
      <button @click="loadData" style="margin-left: 10px;">Повторить</button>
    </div>
    
    <div v-else-if="screen === 'data'">
      <TicketTable :items="items" />
    </div>
  </section>
</template>

<style scoped>
.error { color: #C92627; padding: 10px; background: #FDE8EA; border-radius: 4px; }
</style>