
# Description: Wordpress Dockerfile

# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client

# copy the wordpress configuration script to the root directory in the container
COPY ./tools/wp_conf.sh .

# change the permission of the script to make it executable
RUN  chmod +x wp_conf.sh

# define the entrypoint command to run when the container starts
CMD ["./wp_conf.sh"]


# FROM debian:bullseye

# RUN apt-get update

# RUN apt install curl -y

# RUN apt-get -y install wget

# RUN apt-get install -y php php-fpm php-mysql mariadb-client

# #PHP7.3.31

# COPY tools/wp_conf.sh .

# RUN chmod +x wp_conf.sh

# CMD ["./wp_conf.sh"]