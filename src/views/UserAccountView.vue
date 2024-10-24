<script setup lang="ts">
import UserAccount from '../components/UserAccount.vue'
</script>

<template>
  <main>
    <div class="about">
      <UserAccount />
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
