FROM debian:bullseye-slim

RUN apt update -y && apt upgrade -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mdb-conf.sh /

RUN chmod +x mdb-conf.sh

ENTRYPOINT ["./mdb-conf.sh"]