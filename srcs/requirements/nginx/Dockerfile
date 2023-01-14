FROM debian:buster
COPY . /etc/nginx/
RUN	apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt-get -y install openssl
RUN chmod +x /etc/nginx/script.sh
RUN ./etc/nginx/script.sh
CMD ["nginx", "-g", "daemon off;"]
