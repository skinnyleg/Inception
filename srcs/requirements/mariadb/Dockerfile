FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server -y

# COPY .env .

# COPY /requirements/mariadb/script.sh .

COPY . .

RUN chmod +x script.sh

CMD [ "./script.sh" ]