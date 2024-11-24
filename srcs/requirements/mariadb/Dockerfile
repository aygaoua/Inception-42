# FROM debian:bullseye

# RUN apt-get update && apt-get upgrade -y

# RUN apt-get install -y mariadb-server netcat

# COPY ./tools/mdb-conf.sh /

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN chmod +x mdb-conf.sh

# CMD ["./mdb-conf.sh"]

FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install vim -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mdb-conf.sh /

RUN chmod +x mdb-conf.sh

CMD ["./mdb-conf.sh"]