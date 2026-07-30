#!/bin/sh
set -e

echo "Running Prisma DB push..."
npx prisma db push

echo "Starting NestJS app..."
exec node dist/main.js
