# Utiliser une image de base Node.js
FROM node:18-slim

# Installer Chromium et les dépendances nécessaires
RUN apt-get update && apt-get install -y chromium libnss3 libgconf-2-4 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances et les installer
COPY package*.json ./
RUN npm install

# Copier le reste de votre code
COPY . .

# Définir le chemin de Chromium pour votre code
ENV CHROMIUM_PATH="/usr/bin/chromium"

# Exposer le port et démarrer le serveur
EXPOSE 3000
CMD [ "npm", "start" ]
