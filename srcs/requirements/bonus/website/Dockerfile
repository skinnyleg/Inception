FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install git -y

RUN git clone https://github.com/skinnyleg/demo-website.git website

RUN apt-get install supervisor -y

COPY ./requirements/bonus/website/script.py /app/script.py

COPY ./requirements/bonus/website/supervisord.conf /etc/supervisor/conf.d/

CMD ["supervisord"]