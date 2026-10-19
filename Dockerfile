# Stage 1: Build static Astro application
FROM node:20-alpine AS builder
WORKDIR /app

# Install dependencies using package-lock.json
COPY package.json package-lock.json ./
RUN npm ci

# Copy configuration, source files, and public assets
COPY astro.config.mjs tsconfig.json ./
COPY src/ ./src/
COPY public/ ./public/

# Build static production bundle into /app/dist
RUN npm run build

# Stage 2: Ultra-lightweight high-performance Nginx production server
FROM nginx:alpine AS runner

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built site from builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose HTTP port for Dokploy / Traefik
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
