FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget vim -y

RUN apt-get install -y php-fpm php-cli php-common php-curl php-gd php-json php-mbstring php-mysql php-xml

RUN wget http://wordpress.org/latest.tar.gz

RUN tar xfz latest.tar.gz

RUN rm -f latest.tar.gz

RUN mkdir -p /var/www/html

RUN mv wordpress /var/www/html/myblog

WORKDIR /var/www/html/myblog

RUN cp wp-config-sample.php wp-config.php

COPY /requirements/wordpress/script.sh .

# COPY . .

RUN chmod +x script.sh

# CMD [ "sleep", "100000" ]