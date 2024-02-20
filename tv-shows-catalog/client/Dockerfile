# Créer un Dockerfile pour cette application en mode production
FROM node:lts

ENV API_BASE_URL=http://nodejs-srv:3000

WORKDIR /usr/src/app

COPY . .

RUN npm install

RUN npm run build

EXPOSE 3000

CMD ["node", "build"]