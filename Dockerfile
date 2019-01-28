## Stage 1: Build Angular application ##
FROM node:latest as node
COPY . .
WORKDIR /frontend
RUN yarn install
RUN npm run build --prod

## Stage 2: run nginx to serve application ##
FROM nginx
COPY --from=node /frontend/dist/frontendnew /usr/share/nginx/html/

EXPOSE 80
