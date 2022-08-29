FROM node:16-alpine AS builder

WORKDIR '/react-app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build


# NEW PHASE
FROM nginx
EXPOSE 80
COPY --from=builder /react-app/build /usr/share/nginx/html
