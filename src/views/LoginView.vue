<script setup lang="ts">
import Login from '../components/Login.vue'
</script>

<template>
  <main>
    <div class="about">
      <Login />
    </div>
  </main>
</template>

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>
