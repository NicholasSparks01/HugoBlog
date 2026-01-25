# Build stage
FROM hugomods/hugo:debian-nightly AS builder

WORKDIR /src

COPY HugoBlog/ .

RUN hugo --minify

# Runtime stage
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /src/public /usr/share/nginx/html

