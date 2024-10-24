<template>
  <main>
    <v-container>
      <h1>Posts List</h1>

      <!-- Vérifie si les données sont en train d'être chargées -->
      <v-progress-circular
        v-if="loading"
        indeterminate
        color="primary"
      ></v-progress-circular>

      <!-- Affichage de la liste des utilisateurs -->
      <v-list v-else class="custom-list">
        <v-list-item-group>
          <v-list-item
            v-for="post in posts"
            :key="post.id"
            class="custom-list-item"
          >
            <v-list-item-content>
              <v-list-item-title>Title : {{ post.title }}</v-list-item-title>
              <v-list-item-subtitle
                >Content : {{ post.body }}</v-list-item-subtitle
              >
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>

      <!-- Message si aucune donnée n'est trouvée -->
      <v-alert v-if="!posts.length && !loading" type="info">
        Aucun post trouvé.
      </v-alert>
    </v-container>
  </main>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

// Définition de l'interface pour typer les objets utilisateurs
interface Post {
  id: number
  title: string
  body: string
  post_id: number
}

export default defineComponent({
  name: 'infos-component',
  data() {
    return {
      posts: [] as Post[], // Typage explicite : posts est un tableau d'objets de type post
      loading: true as boolean, // Typage explicite : loading est un booléen
    }
  },
  created() {
    this.fetchPosts()
  },
  methods: {
    async fetchPosts(): Promise<void> {
      // La méthode renvoie une promesse vide (Promise<void>)
      try {
        const response = await fetch('http://localhost:4001/api/posts')
        if (!response.ok) {
          throw new Error('Erreur lors de la récupération des utilisateurs.')
        }
        //Stockage dans variable intermédiaire pour faciliter les traitements ultérieurs
        const result = (await response.json()).allPosts
        // Typage explicite de la réponse JSON : tableau de post
        const data: Post[] = result
        // console.log(JSON.stringify(data))
        // console.log(data)
        this.posts = data
      } catch (error) {
        console.error('Erreur :', error)
      } finally {
        this.loading = false
      }
    },
  },
})
</script>

<style>
.custom-list {
  background-color: #f5f5f5;
  border-radius: 10px;
  margin-top: 20px;
  box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.custom-list-item {
  border-bottom: 1px solid #e0e0e0;
  padding: 20px;
  transition: background-color 0.3s ease;
}

.custom-list-item:hover {
  background-color: #e3f2fd;
}

.custom-list-item .v-icon {
  color: #1976d2;
}

.custom-list-item .v-list-item-title {
  font-weight: bold;
  color: #333;
}

.custom-list-item .v-list-item-subtitle {
  color: #666;
}
</style>
