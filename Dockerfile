FROM node:8.12.0

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

COPY .npmrc /root/.npmrc

COPY package.json /usr/src/app/package.json
COPY package-lock.json /usr/src/app/package-lock.json
RUN npm i

COPY . .

EXPOSE 3001

CMD npm start
