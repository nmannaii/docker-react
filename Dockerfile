# BUILD phase
FROM node:10.23.0-alpine3.9 as builder
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

# RUN phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html