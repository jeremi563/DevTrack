FROM node:26.12-alpine3.23
WORKDIR /app
COPY . .
RUN npm install
ENV API_URL=http://api.myapp.com