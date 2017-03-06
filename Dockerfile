FROM node:6

WORKDIR /app
CMD ["node", "ee-index.js"]
ENV PATH=/app/node_modules/.bin:$PATH

COPY package.json ./
RUN npm install

COPY . ./
RUN npm run build
