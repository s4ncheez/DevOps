FROM build:v1 AS app

EXPOSE 3000

# Работа с prisma и запуск приложения
CMD npx prisma db push && npx prisma generate && yarn start:prod