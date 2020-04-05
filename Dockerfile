# DEV step to build the app
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second step for prod deployment only build folder from Dev step
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#No need of specific start, default is start