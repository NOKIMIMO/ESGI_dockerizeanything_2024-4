# Créer un Dockerfile pour cette application en mode production
FROM node:lts AS builder

WORKDIR /usr/src/app

COPY package*.json ./

COPY .env.example /usr/share/nginx/html/.env

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "build"]