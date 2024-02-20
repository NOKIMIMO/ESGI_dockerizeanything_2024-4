# Créer un Dockerfile pour cette application en mode production
# S1
FROM node:lts AS builder

ENV API_BASE_URL=http://nodejs-srv:3000

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build


# S2
FROM node:lts AS deployer

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

EXPOSE 3000

CMD ["node", "build"]