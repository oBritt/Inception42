FROM debian:bullseye

RUN apt update && apt upgrade && apt-get upgrade && apt install mariadb-server -y

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init_mariadb.sh /etc/mysql

EXPOSE 3306

CMD ["/etc/mysql/init_mariadb.sh"]
