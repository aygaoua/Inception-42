#!/bin/bash

#--------------mariadb start--------------#
service mariadb start # start mariadb

sleep 10

#--------------mariadb config--------------#
# Create database if not exists
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"

# Create user if not exists
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant privileges to user
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"

# Flush privileges to apply changes
mariadb -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
# Shutdown mariadb to restart with new config
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Restart mariadb with new config in the background to keep the container running
# exec mysqld_safe

#!/bin/bash

# service mariadb start

# sleep 10

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';"
# mysql -u root -p"$DB_ROOT_PWD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
# mysql -u root -p"$DB_ROOT_PWD" -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
# mysql -u root -p"$DB_ROOT_PWD" -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
# mysql -u root -p"$DB_ROOT_PWD" -e "FLUSH PRIVILEGES;"

# # echo "MySQL root password: $DB_ROOT_PWD"

# mysqladmin -u root -p"$DB_ROOT_PWD" shutdown
# echo "Database configuration completed."
# exec mysqld_safe