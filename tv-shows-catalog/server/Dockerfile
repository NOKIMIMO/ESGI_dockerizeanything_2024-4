# Créer un Dockerfile pour cette application en mode production
FROM node:21-alpine3.18

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

RUN npm run build

CMD ["node", "dist/main.js"]