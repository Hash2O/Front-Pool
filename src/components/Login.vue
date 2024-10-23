<template>
  <v-container>
    <v-form @submit.prevent="login">
      <v-text-field
        label="Name"
        v-model="name"
        type="name"
        required
      ></v-text-field>
      <v-text-field label="E-mail" v-model="email" required></v-text-field>

      <v-btn type="submit" color="primary">Log In</v-btn>
    </v-form>
  </v-container>
</template>

<script lang="ts">
export default {
  name: 'login-component',
  data() {
    return {
      name: '',
      email: '',
    }
  },
  methods: {
    login() {
      // Ajouter la logique de connexion ici
      console.log(`Name: ${this.name}, Email: ${this.email}`)
    },
  },
}
</script>
