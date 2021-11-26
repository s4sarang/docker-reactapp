#Prod environment Dockerfile
FROM node:lts-alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
EXPOSE 80

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
