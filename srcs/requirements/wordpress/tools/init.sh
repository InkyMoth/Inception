#!/bin/sh

sleep 10
if [ ! -f /var/www/wordpress/wp-config.php ];
then
	wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install # --allow-root
	wp user create # --allow-root
fi

/usr/sbin/php-fpm8.2 -F