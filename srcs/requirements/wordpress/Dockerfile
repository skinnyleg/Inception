FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install php php-mysql wget -y
RUN wget http://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz
RUN cd /var/www/html
RUN mv wordpress/* ./
RUN rm -f latest.tar.gz

# CMD [ "tail", "-f" ]