# Description: Nginx Dockerfile

# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # install the required packages
RUN apt-get install -y nginx openssl

# create the ssl directory
RUN mkdir -p /etc/nginx/ssl

# generate the ssl certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=42/CN=azgaoua.fr/UID=azgaoua"

# copy the nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# create the wordpress directory
RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data
RUN chown -R www-data:www-data /var/www/wordpress

# define the command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]



# FROM debian:bullseye
# RUN apt update && apt install nginx -y

# RUN apt install vim -y

# RUN apt install curl -y

# RUN mkdir -p /etc/nginx/ssl

# RUN mkdir -p /var/www/wordpress

# RUN apt install openssl -y

# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=azgaoua.42.fr/UID=azgaoua"

# RUN mkdir -p /var/run/nginx

# COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# RUN chmod 755 /var/www/html

# RUN chown -R www-data:www-data /var/www/html

# CMD ["nginx", "-g", "daemon off;"]
