#!/bin/bash

#--------------mariadb start--------------#

mysqld_safe --nowatch

echo "Waiting for MariaDB to start..."

sleep 5

#--------------mariadb config--------------#
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"

mariadb -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
mysqladmin -u root shutdown

exec mysqld_safe
