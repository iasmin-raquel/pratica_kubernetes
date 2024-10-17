# construção
FROM node:22.9.0 AS builder
WORKDIR /app

# copiar arquivos de configurações e dependencias 
COPY package*.json ./
RUN npm install
COPY . .

# produção 
FROM node:22.9.0-alpine
WORKDIR /app
COPY --from=builder /app .

# porta que a aplicaçao estara usando 
EXPOSE 3001

# comando para rodar a aplicaçao 
CMD ["node", "hello.js"]