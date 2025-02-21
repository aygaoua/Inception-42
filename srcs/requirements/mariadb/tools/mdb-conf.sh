#!/bin/bash

#--------------mariadb start--------------#
service mariadb start

#--------------mariadb config--------------#
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"

mariadb -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld_safe
