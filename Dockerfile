FROM node:alpine as builder
WORKDIR '/aplikacija'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /aplikacija/build /usr/share/nginx/html
