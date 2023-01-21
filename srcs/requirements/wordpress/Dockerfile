FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget vim -y

RUN apt-get install -y php-fpm php-cli php-common php-curl php-gd php-json php-mbstring php-mysql php-xml

RUN wget http://wordpress.org/latest.tar.gz

RUN tar xfz latest.tar.gz

RUN rm -f latest.tar.gz

RUN mkdir -p /var/www/html

RUN mv wordpress/* /var/www/html

WORKDIR /var/www/html

RUN cp wp-config-sample.php wp-config.php

COPY /requirements/wordpress/script.sh .

COPY ./.env .

# COPY . .

RUN chmod +x script.sh

RUN ./script.sh

CMD [ "/usr/sbin/php-fpm7.3", "-F"]