FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install redis-server -y

CMD [ "redis-server" ]