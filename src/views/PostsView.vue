<script setup lang="ts">
import Posts from '../components/Posts.vue'
</script>

<template>
  <main>
    <div class="about">
      <Posts />
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
