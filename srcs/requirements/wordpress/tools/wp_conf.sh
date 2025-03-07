#!/bin/bash
#---------------------------------------------------wp installation---------------------------------------------------#
echo "Downloading WP-CLI..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/wordpress

echo "Setting permissions for /var/www/wordpress..."
chmod -R 755 /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "wp-config.php not found. Proceeding with WordPress installation..."
    wp core download --allow-root

    echo "Configuring WordPress database settings..."
    wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass=$(cat /run/secrets/MYSQL_PASSWORD) --allow-root

    echo "Installing WordPress..."
    ln -s /bin/true /usr/sbin/sendmail
    wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password=$(cat /run/secrets/WP_ADMIN_P) --admin_email="$WP_ADMIN_E" --allow-root

    echo "Creating WordPress user..."
    wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass=$(cat /run/secrets/WP_U_PASS) --role="$WP_U_ROLE" --allow-root

else
    echo "wp-config.php already exists. Skipping WordPress installation."
fi
#---------------------------------------------------php config---------------------------------------------------#
echo "Configuring PHP-FPM..."
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf

echo "Creating /run/php directory..."
mkdir -p /run/php

echo "Starting PHP-FPM..."
/usr/sbin/php-fpm7.4 -F
