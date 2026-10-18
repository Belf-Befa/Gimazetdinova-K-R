<template>
  <header class="header">
    <h1>Учёт сборки оборудования</h1>
    <nav class="actions">
      <router-link to="/">Список</router-link>
      <router-link to="/new">Создать</router-link>
      <router-link to="/login">Вход</router-link>
    </nav>
  </header>
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
.actions a {
    color: #FEFEFE;
    text-decoration: none;
    font-size: 14px;
    text-transform: uppercase;
    margin-left: 20px;
}
.actions a:hover {
    text-decoration: underline;
}
</style>