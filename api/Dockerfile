FROM node:18-alpine
ARG JWT_SECRET
ENV JWT_SECRET=$JWT_SECRET
WORKDIR /api
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]
