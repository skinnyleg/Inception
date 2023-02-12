FROM debian:buster


RUN apt-get update && apt-get upgrade -y

RUN apt-get install python3 python3-pip -y

RUN pip3 install Flask

COPY ./requirements/bonus/flask/app.py .

COPY ./requirements/bonus/flask/script.sh .

RUN chmod +x ./script.sh

CMD ["./script.sh"]