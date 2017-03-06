FROM node:6

RUN adduser --disabled-password --gecos '' --no-create-home webdev
WORKDIR /app
CMD ["node", "ee-index.js"]
ENV PATH=/app/node_modules/.bin:$PATH

COPY package.json ./
RUN npm install

COPY . ./
RUN npm run build

# Change User
RUN chown webdev.webdev -R .
USER webdev
