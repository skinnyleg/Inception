FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install curl vim -y

RUN apt-get install -y php-fpm php-cli php-common php-curl php-gd php-json php-mbstring php-mysql php-xml

WORKDIR /var/www/html

COPY /requirements/wordpress/script.sh .

COPY ./.env .

RUN chmod +x script.sh

RUN ./script.sh

CMD [ "/usr/sbin/php-fpm7.3", "-F"]