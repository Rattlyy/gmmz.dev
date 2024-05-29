FROM node:16 as build

WORKDIR /usr/src/app

COPY package.json ./
RUN --mount=type=cache,target=~/.npm npm install --loglevel verbose

COPY . .
RUN --mount=type=cache,target=./node_modules/.cache/webpack npm run build

FROM nginx:alpine
COPY --from=build /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80
