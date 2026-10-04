# syntax=docker/dockerfile:1

ARG BASE=node:20-slim
FROM ${BASE} AS base

# Install dependencies only when needed
WORKDIR /app

# Install dependencies based on the preferred package manager
COPY package.json pnpm-lock.yaml* ./
RUN corepack enable pnpm && pnpm i --frozen-lockfile

# Rebuild the source code only when needed
FROM base AS builder
WORKDIR /app
COPY --from=base /app/node_modules ./node_modules
COPY . .

# Production image, copy all the files and run next
FROM base AS loopit-production
WORKDIR /app

ENV NODE_ENV=production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 remix

COPY --from=builder /app/public ./public
COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/bindings.sh ./bindings.sh
COPY --from=builder /app/wrangler.toml ./wrangler.toml

USER remix

EXPOSE 5173

ENV PORT=5173

CMD ["pnpm", "run", "dockerstart"]

FROM base AS loopit-development
WORKDIR /app

COPY --from=base /app/node_modules ./node_modules
COPY . .

EXPOSE 5173

CMD ["pnpm", "run", "dev"]
