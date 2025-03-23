FROM system:v1 AS app

WORKDIR /app

COPY --from=build:v1 /app/node_modules ./node_modules
COPY --from=build:v1 /app/package*.json ./
COPY --from=build:v1 /app/dist ./dist
COPY --from=build:v1 /app/src/prisma ./src/prisma

EXPOSE 3000

# Работа с prisma и запуск приложения
CMD npx prisma db push && npx prisma generate && yarn start:prod