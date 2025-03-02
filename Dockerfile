# Etapa 1: Build da aplicação Vue.js
FROM node:20 AS build

WORKDIR /app

# Copia e instala dependências
COPY package.json package-lock.json ./
RUN npm install

# Copia todo o código-fonte
COPY . .

# Build da aplicação Vue.js (Vite)
RUN npm run build

# Etapa 2: Servidor leve para servir o frontend
FROM node:20

WORKDIR /app

# Instala um servidor HTTP simples para servir os arquivos
RUN npm install -g http-server

# Copia os arquivos de build
COPY --from=build /app/dist /app

# Expõe a porta 3000 para o proxy do Nginx
EXPOSE 1000

# Comando de inicialização
CMD ["http-server", "/app", "-p", "1000"]

