#!/bin/bash

#--------------mariadb start--------------#

mysqld_safe &

echo "Waiting for MariaDB to start..."

sleep 5

#--------------mariadb config--------------#

echo  "CREATE DATABASE IF NOT EXISTS $MYSQL_DB; GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" \
                   "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" "FLUSH PRIVILEGES;" | mysql -u root -p${MYSQL_ROOT_PASSWORD}

#--------------mariadb restart--------------#

mysqladmin shutdown -p${MYSQL_ROOT_PASSWORD}

exec mysqld_safe
