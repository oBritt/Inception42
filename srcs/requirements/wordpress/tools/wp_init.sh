#!/bin/bash

cd /var/www/html

if [ ! -f /var/www/html/wp-config.php ]; then
wp core download --allow-root
	sleep 5
	wp config create --force --url=$WP_URL --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_U --dbpass=$WORDPRESS_U_PASSWORD --dbhost=mariadb:3306 --allow-root
	wp core install --url=$WP_URL \
					--title=$WP_TITLE \
					--admin_user=$WORDPRESS_A_NAME \
					--admin_password=$WORDPRESS_A_PASSWORD \
					--admin_email=$WORDPRESS_A_EMAIL \
					--skip-email \
					--allow-root
	wp user create $WORDPRESS_U \
					$WORDPRESS_U_EMAIL \
					--user_pass=$WORDPRESS_U_PASSWORD \
					--allow-root

	wp option update home $WP_URL --allow-root
	wp option update siteurl  $WP_URL --allow-root

	chown -R www-data:www-data /var/www/html/*
fi

exec php-fpm7.4 -F
