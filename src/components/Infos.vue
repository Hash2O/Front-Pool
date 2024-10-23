<template>
  <v-container>
    <h1>Users List</h1>

    <!-- Vérifie si les données sont en train d'être chargées -->
    <v-progress-circular
      v-if="loading"
      indeterminate
      color="primary"
    ></v-progress-circular>

    <!-- Affichage de la liste des utilisateurs -->
    <v-list v-else>
      <v-list-item-group>
        <v-list-item v-for="user in users" :key="user.id">
          <v-list-item-content>
            <v-list-item-title>Name : {{ user.name }}</v-list-item-title>
            <v-list-item-subtitle
              >Email : {{ user.email }}</v-list-item-subtitle
            >
            <v-list-item-subtitle
              >Last Post's Title :
              {{ user.posts[0].title }}</v-list-item-subtitle
            >
            <v-list-item-subtitle
              >Last Post's Content :
              {{ user.posts[0].body }}</v-list-item-subtitle
            >
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>

    <!-- Message si aucune donnée n'est trouvée -->
    <v-alert v-if="!users.length && !loading" type="info">
      Aucun utilisateur trouvé.
    </v-alert>
  </v-container>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

// Définition de l'interface pour typer les objets utilisateurs
interface User {
  id: number
  name: string
  email: string
  posts: string
  title: string
  body: string
}

export default defineComponent({
  name: 'infos-component',
  data() {
    return {
      users: [] as User[], // Typage explicite : users est un tableau d'objets de type User
      loading: true as boolean, // Typage explicite : loading est un booléen
    }
  },
  created() {
    this.fetchUsers()
  },
  methods: {
    async fetchUsers(): Promise<void> {
      // La méthode renvoie une promesse vide (Promise<void>)
      try {
        const response = await fetch('http://localhost:4001/api/users')
        if (!response.ok) {
          throw new Error('Erreur lors de la récupération des utilisateurs.')
        }
        //Stockage dans variable intermédiaire pour faciliter les traitements ultérieurs
        const result = (await response.json()).data
        // Typage explicite de la réponse JSON : tableau de User
        const data: User[] = result
        // console.log(JSON.stringify(data))
        // console.log(data)
        this.users = data
      } catch (error) {
        console.error('Erreur :', error)
      } finally {
        this.loading = false
      }
    },
  },
})
</script>

<style scoped>
h1 {
  margin-bottom: 20px;
}
</style>
