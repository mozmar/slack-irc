FROM node:5

WORKDIR /app

COPY package.json /app/package.json
RUN npm install

COPY . /app
RUN npm run build

CMD node ee-index.js
