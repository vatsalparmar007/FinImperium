# syntax=docker/dockerfile:1
# Multi-stage build for FinImperium (Next.js + Prisma).
#   deps    -> install npm packages (cached until package files change)
#   builder -> generate Prisma client and build the app
#   runner  -> small final image with only the standalone server, run as non-root
ARG NODE_IMAGE=node:22-alpine

# ---------- deps ----------
FROM ${NODE_IMAGE} AS deps
# openssl: needed by Prisma. libc6-compat: some native modules expect glibc.
RUN apk add --no-cache libc6-compat openssl
WORKDIR /app
COPY package.json package-lock.json ./
# "postinstall" runs "prisma generate", which needs the schema.
COPY prisma ./prisma
RUN npm ci --no-audit --no-fund

# ---------- builder ----------
FROM ${NODE_IMAGE} AS builder
RUN apk add --no-cache libc6-compat openssl
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
# The Clerk publishable key is public (it ends up in the browser), but Next.js
# bakes NEXT_PUBLIC_* values into the bundle at build time, so it is a build arg.
# Secret keys are NOT build args: they are passed only when the container starts.
ARG NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY
ENV NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=${NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY} \
    NEXT_TELEMETRY_DISABLED=1
RUN npx prisma generate && npm run build

# ---------- runner ----------
FROM ${NODE_IMAGE} AS runner
RUN apk add --no-cache openssl
WORKDIR /app
ARG GIT_SHA=dev
ARG BUILD_TIME=unknown
ENV NODE_ENV=production \
    NEXT_TELEMETRY_DISABLED=1 \
    PORT=3000 \
    HOSTNAME=0.0.0.0 \
    APP_VERSION=${GIT_SHA} \
    BUILD_TIME=${BUILD_TIME}
LABEL org.opencontainers.image.source="https://github.com/vatsalparmar007/FinImperium" \
      org.opencontainers.image.revision="${GIT_SHA}"

# Run as an unprivileged user, never as root.
RUN addgroup -S -g 1001 nodejs && adduser -S -u 1001 -G nodejs nextjs
COPY --from=builder --chown=nextjs:nodejs /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static
USER nextjs

EXPOSE 3000
# Docker marks the container unhealthy if /api/health stops answering.
HEALTHCHECK --interval=15s --timeout=3s --start-period=30s --retries=3 \
  CMD wget -qO- http://127.0.0.1:3000/api/health >/dev/null || exit 1
CMD ["node", "server.js"]
