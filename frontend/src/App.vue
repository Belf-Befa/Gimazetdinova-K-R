<script setup>
import AppHeader from './components/AppHeader.vue'
</script>

<template>
  <AppHeader />
  <main class="main">
    <router-view />
  </main>
</template>

<style>
body { margin: 0; font-family: sans-serif; background: #F5F5F5; }
.main { padding: 20px 60px; }
</style>