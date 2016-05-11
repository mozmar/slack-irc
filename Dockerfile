FROM node:6

RUN adduser --uid 1000 --disabled-password --gecos '' --no-create-home webdev
WORKDIR /app
CMD ["node", "ee-index.js"]

COPY package.json ./
RUN npm install

COPY . ./
RUN npm run build

# Change User
RUN chown webdev.webdev -R .
USER webdev
