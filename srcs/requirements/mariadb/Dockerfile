FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY /requirements/mariadb/tools/script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh" ]
