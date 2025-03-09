#!/bin/bash

until nc -z -v -w60 db 5432; do
  echo "Waiting for postgres database connection..."
  sleep 1
done

echo "Postgres Database is up, running prisma db push"
npx prisma db push

yarn start:prod