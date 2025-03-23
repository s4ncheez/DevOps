FROM alpine:3.21 AS system

# Установка nodejs, yarn, npm и npx
RUN apk add --update yarn && apk add --update npm

# Установка openssl
RUN apk add --no-cache openssl

# Очистка кеша
RUN apk cache clean