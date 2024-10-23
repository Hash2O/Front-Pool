<template>
  <v-app>
    <!-- Contenu principal de la page d'accueil -->
    <v-main>
      <v-container class="text-center">
        <!-- <h1>Welcome !</h1> -->

        <img
          alt="Swimming Pool logo"
          class="logo"
          src="/src/assets/images/236226355-scuba-diving.jpg"
          width="350"
          height="350"
        />

        <p style="text-align: justify">
          Scuba diving is a mode of underwater diving whereby divers use
          breathing equipment that is completely independent of a surface
          breathing gas supply, and therefore has a limited but variable
          endurance. The name SCUBA is an acronym for "<span
            style="font-weight: bold"
            >Self-Contained Underwater Breathing Apparatus</span
          >" and was coined by Christian J. Lambertsen in a patent submitted in
          1952.
        </p>
        <br />
        <!-- Lien vers le formulaire de connexion -->
        <v-btn color="primary" @click="goToLogin">Log In</v-btn>
      </v-container>
    </v-main>
  </v-app>
</template>

<script lang="ts">
export default {
  name: 'home-component',
  methods: {
    goToLogin() {
      this.$router.push({ path: '/login' })
    },
  },
}
</script>

<style scoped>
h1,
img {
  margin-top: 75px;
}
</style>
