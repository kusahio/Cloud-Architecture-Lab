# ---- Base ----
FROM node:20-alpine AS base
WORKDIR /usr/src/app
RUN npm install -g pnpm

# ---- Dependencies ----
FROM base AS dependencies
ENV CI=true
COPY package.json pnpm-lock.yaml ./
RUN echo 'onlyBuiltDependencies[]=bcrypt' >> .npmrc
RUN echo 'onlyBuiltDependencies[]=@prisma/engines' >> .npmrc
RUN pnpm install --frozen-lockfile

# ---- Build ----
FROM base AS build
ENV CI=true
COPY --from=dependencies /usr/src/app/node_modules ./node_modules
COPY . .
RUN npx prisma generate
RUN npx tsc --outDir ./dist

# ---- Production ----
FROM base AS production
ENV NODE_ENV=production
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/prisma ./prisma
COPY --from=build /usr/src/app/prisma.config.ts ./prisma.config.ts
COPY --from=build /usr/src/app/tsconfig.json ./tsconfig.json
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
EXPOSE 3000
CMD ["docker-entrypoint.sh"]
