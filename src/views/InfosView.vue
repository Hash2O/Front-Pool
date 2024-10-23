<script setup lang="ts">
import Infos from '../components/Infos.vue'
</script>

<template>
  <main>
    <div class="about">
      <Infos />
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
