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
interface UsersList {
  id: number
  name: string
  email: string
}

export default {
  name: 'login-component',
  data() {
    return {
      name: '',
      email: '',
      usersList: [] as UsersList[],
    }
  },
  methods: {
    async GetUsersList(
      nameToCheck: string,
      emailToCheck: string,
    ): Promise<void> {
      try {
        const response = await fetch('http://localhost:4001/api/users')
        if (!response.ok) {
          throw new Error('Erreur lors de la récupération des utilisateurs.')
        }
        const result = (await response.json()).data
        const data: UsersList[] = result
        this.usersList = data
        for (let i = 0; i < data.length; i++) {
          console.log(data[i].name + ' ' + data[i].email)
          if (nameToCheck == data[i].name && emailToCheck == data[i].email) {
            console.log('User found !')
            this.$router.push({ path: '/useraccount' })
            break
          }
        }
      } catch (error) {
        console.error('Erreur :', error)
      }
    },
    login() {
      // Ajouter la logique de connexion ici
      console.log(`Name: ${this.name}, Email: ${this.email}`)
      this.GetUsersList(this.name, this.email)
      //this.$router.push({ path: '/useraccount' })

      //hard coded authorization system for test
      // if (this.name == 'admin' && this.email == 'admin') {
      //   this.$router.push({ path: '/useraccount' })
      // } else {
      //   alert(
      //     'Sorry, wrong name or email ; we cannot let you in. Please try again',
      //   )
      // }
    },
  },
}
</script>
