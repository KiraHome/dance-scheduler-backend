FROM node:8.12.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/
COPY .npmrc .npmrc
COPY .npmrc /usr/src/app/.npmrc

RUN npm install

RUN rm -f .npmrc

COPY . /usr/src/app

EXPOSE 3001

CMD npm start
