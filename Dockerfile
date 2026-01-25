# Build stage
FROM hugomods/hugo:debian-nightly AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# Runtime stage
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html

