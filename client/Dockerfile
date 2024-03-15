# Build stage
FROM node:18-alpine as build
ARG VITE_API_BASE_URL, VITE_FIREBASE_API_KEY
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL
ENV VITE_FIREBASE_API_KEY=$VITE_FIREBASE_API_KEY
WORKDIR /client
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM nginx:stable-alpine as runtime
COPY --from=build /client/dist /usr/share/nginx/html

EXPOSE $REACT_DOCKER_PORT
CMD ["nginx", "-g", "daemon off;"]
