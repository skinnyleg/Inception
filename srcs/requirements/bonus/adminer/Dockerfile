FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    php

# RUN apt-get install -y supervisor

RUN mkdir -p /var/www/html


RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adminer.php

WORKDIR /var/www/html

CMD ["php" , "-S", "0.0.0.0:8080"]