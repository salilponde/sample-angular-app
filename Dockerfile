FROM node:18.17-alpine3.17 AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.25.2-alpine
COPY --from=build /usr/src/app/dist/sample-angular-app /usr/share/nginx/html
