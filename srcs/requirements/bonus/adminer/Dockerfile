FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    php-mysql \
    php-fpm

RUN mkdir -p /var/www/adminer

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/adminer/index.php

RUN service php7.3-fpm start

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:100/g' /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

CMD [ "/usr/sbin/php-fpm7.3" , "-F" ]