FROM debian:bullseye

RUN  apt-get update && apt-get install -y nginx openssl curl

RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/server.key\
	-out    /etc/nginx/ssl/server.crt\
	-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/CN=qdo" 
# rm -rf /var/lib/apt/lists/*

# openssl x509 -in /etc/nginx/ssl/server.crt  -text -noout -to see subj

EXPOSE 443

COPY tools/default.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]