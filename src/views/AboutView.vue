<template>
  <v-container>
    <!-- Liste stylisée -->
    <v-list dense shaped class="custom-list">
      <v-list-item-group>
        <v-list-item
          v-for="(item, index) in items"
          :key="index"
          class="custom-list-item"
        >
          <v-list-item-icon>
            <v-icon color="primary">{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title class="custom-list-title">{{
              item.title
            }}</v-list-item-title>
            <v-list-item-subtitle class="custom-list-subtitle">{{
              item.subtitle
            }}</v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
  </v-container>
</template>

<script lang="ts">
export default {
  data() {
    return {
      items: [
        {
          icon: 'mdi-home',
          title: 'Home',
          subtitle: 'Welcome to the homepage',
        },
        {
          icon: 'mdi-information',
          title: 'About',
          subtitle: 'Learn more about us',
        },
        {
          icon: 'mdi-contact-mail',
          title: 'Contact',
          subtitle: 'Get in touch',
        },
      ],
    }
  },
}
</script>

<style scoped>
.custom-list {
  background-color: #f5f5f5; /* Light grey background */
  border-radius: 10px; /* Rounded corners */
  padding: 20px; /* Padding around the list */
}

.custom-list-item {
  margin-bottom: 15px; /* Space between list items */
  transition: background-color 0.3s; /* Smooth hover transition */
}

.custom-list-item:hover {
  background-color: #e0e0e0; /* Change background on hover */
}

.custom-list-title {
  font-weight: bold;
  color: #1a73e8; /* Custom color for titles */
}

.custom-list-subtitle {
  color: #757575; /* Subtle grey for subtitles */
}

@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>
