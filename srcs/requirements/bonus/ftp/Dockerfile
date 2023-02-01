FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install vsftpd ftp vim -y

COPY ./requirements/bonus/ftp/script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh" ]