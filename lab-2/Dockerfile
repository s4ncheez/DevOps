FROM node:18-alpine

# Установка openssl для корректной работы Prisma
RUN apk add --no-cache openssl

# Установка bash для выполнения необходимых скриптов
RUN apk add --no-cache bash

WORKDIR /app

COPY package*.json ./

# Установка зависимостей
RUN yarn install

COPY . .

# Генерация Prisma клиента
RUN npx prisma generate

# Сборка приложения
RUN yarn build

EXPOSE 3000

COPY wait-for-db.sh /app/wait-for-db.sh
RUN chmod +x /app/wait-for-db.sh

# Запуск скрипта
CMD ["/bin/bash", "/app/wait-for-db.sh"]