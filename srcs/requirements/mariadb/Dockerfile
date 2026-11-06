FROM debian:bookworm


RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN chmod 777 /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
CMD ["mariadb"]