<template>
  <main>
    <h2>User Account</h2>

    <p>Click here to return to Home Page</p>
    <br />
    <v-btn color="primary" @click="goToHome">Return to Home</v-btn>
  </main>
</template>

<script lang="ts">
export default {
  name: 'useraccount-component',
  methods: {
    goToHome() {
      this.$router.push({ path: '/' })
    },
  },
}
</script>
