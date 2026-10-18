<template>
  <section>
    <h2>Вход в систему</h2>
    <form class="form" @submit.prevent>
      <label for="email">Email</label>
      <input id="email" name="email" type="email" autofocus>

      <label for="password">Пароль</label>
      <input id="password" name="password" type="password">

      <button type="submit">Войти</button>
    </form>
  </section>
</template>

<style scoped>
.form { display: flex; flex-direction: column; max-width: 400px; gap: 6px; }
.form label { font-weight: 500; margin-top: 10px; }
.form input { padding: 8px 12px; border: 1px solid #E0E0E0; border-radius: 4px; }
.form button { margin-top: 16px; padding: 10px; background: #C92627; color: #FEFEFE; border: none; border-radius: 4px; cursor: pointer; }
</style>