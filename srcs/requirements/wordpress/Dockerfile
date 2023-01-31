FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install curl -y

RUN apt-get install -y php-fpm php-mysql 

COPY /requirements/wordpress/script.sh .

CMD [ "./script.sh" ]