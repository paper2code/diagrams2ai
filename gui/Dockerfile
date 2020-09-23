FROM mhart/alpine-node:14
MAINTAINER Michalski Luc <michalski.luc@gmail.com>

WORKDIR /opt/service
COPY package.json .
COPY yarn.lock .

RUN yarn install
COPY . . 

VOLUME /opt/service/build

EXPOSE 3000

ENTRYPOINT ["./docker-entrypoint.sh"]
