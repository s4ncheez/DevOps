FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

# Установка openssl для корректной работы Prisma (prisma generate)
RUN apk add --no-cache openssl

# Установка зависимостей
RUN yarn install

COPY . .

# Генерация Prisma клиента
RUN npx prisma generate

# Сборка приложения
RUN yarn build

FROM node:18-alpine

# Установка openssl для корректной работы Prisma (prisma db push)
RUN apk add --no-cache openssl

# Установка bash для выполнения необходимых скриптов
RUN apk add --no-cache bash

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/src/prisma ./src/prisma

EXPOSE 3000

COPY wait-for-db.sh /app/wait-for-db.sh
RUN chmod +x /app/wait-for-db.sh

# Запуск скрипта
CMD ["/bin/bash", "/app/wait-for-db.sh"]