FROM system:v1 AS build

WORKDIR /app

COPY package*.json ./

# Установка зависимостей
RUN yarn install

COPY . .

# Сборка приложения
RUN yarn build