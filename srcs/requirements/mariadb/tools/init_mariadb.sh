FROM debian:bullseye

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld \
    && mkdir -p /var/lib/mysql && chmod 777 /var/lib/mysql

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install mariadb-server -y

RUN chown mysql:mysql /var/lib/mysql

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./init_mariadb.sh /
RUN chmod +x /init_mariadb.sh

EXPOSE 3306

CMD ["/init_mariadb.sh"]
