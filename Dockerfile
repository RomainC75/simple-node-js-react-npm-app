# First stage: build the application
FROM node:20.11.0-alpine3.19 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Second stage: create the final Docker image
FROM alpine:3.19
WORKDIR /app
COPY --from=build /app/build /app