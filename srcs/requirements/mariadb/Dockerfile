FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY .env .

COPY /requirements/mariadb/script.sh .

RUN chmod +x script.sh

RUN ./script.sh

CMD [ "mysqld" ]
