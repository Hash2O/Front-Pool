<script setup lang="ts">
import Home from '../components/Home.vue'
</script>

<template>
  <main>
    <div class="about">
      <Home />
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
