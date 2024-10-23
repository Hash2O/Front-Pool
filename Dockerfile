# Étape 1 : Construction de l'application Vue.js
# Utilisation de l'image node pour builder l'application
FROM node:18-alpine AS build-stage

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copier le fichier package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances de l'application
RUN npm install

# Copier le reste des fichiers de l'application dans le conteneur
COPY . .

# Construire l'application Vue.js pour la production
RUN npm run build

# Étape 2 : Configuration du serveur pour servir les fichiers de l'application
# Utilisation de l'image nginx pour servir les fichiers statiques
FROM nginx:alpine AS production-stage

# Copier les fichiers de build générés dans le répertoire de nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Copier la configuration nginx personnalisée (facultatif)
# COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80
EXPOSE 80

# Lancer nginx (le conteneur démarrera avec Nginx)
CMD ["nginx", "-g", "daemon off;"]
