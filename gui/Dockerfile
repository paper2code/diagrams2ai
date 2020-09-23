FROM mhart/alpine-node:14
MAINTAINER Michalski Luc <michalski.luc@gmail.com>

WORKDIR /opt/service
COPY package.json .

RUN yarn install
COPY . . 

RUN yarn build

VOLUME /opt/service/dist

EXPOSE 3000

CMD ["yarn, "start"]
