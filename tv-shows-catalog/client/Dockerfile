# Créer un Dockerfile pour cette application en mode production
FROM node:lts AS builder

ENV API_BASE_URL=http://nodejs-srv:3000

WORKDIR /usr/src/app

COPY .env.example .env

COPY package*.json ./

RUN npm install

COPY . .


RUN npm run build

EXPOSE 3000

CMD ["node", "build"]