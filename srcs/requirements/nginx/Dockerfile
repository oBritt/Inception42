FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get upgrade -y && apt install nginx -y

RUN apt-get install -y openssl && mkdir -p /etc/nginx/certs\
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/selfsigned.key\
    -out /etc/nginx/certs/selfsigned.crt\
    -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/CN=obrittne"


COPY tools/default /etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["/bin/bash"]