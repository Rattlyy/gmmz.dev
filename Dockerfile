FROM node:20.9.0 as build
LABEL org.opencontainers.image.source=https://github.com/Rattlyy/gmmz.dev

WORKDIR /usr/src/app

COPY package.json ./
RUN --mount=type=cache,target=~/.npm --mount=type=cache,target=./node_modules/ npm install --loglevel verbose

COPY . .
RUN --mount=type=cache,target=./node_modules/ npm run build

FROM --platform=linux/arm64 arm64v8/nginx:stable-alpine
COPY --from=build /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80
