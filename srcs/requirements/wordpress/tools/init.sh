#!/bin/sh


echo "===Gimme a sec, I'm making sure MariaDB is done...==="
sleep 10


if [ -f "/var/www/html/wp-config.php" ];
then
	echo "==config already exists=="
else
	echo "==No config, creating one...=="

	echo "==creating config=="
	wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/html' --skip-check

	echo "==installing core=="
	wp core install --allow-root --path='/var/www/html' \
	--url='gaasseli.42.fr' \
	--title='Evil Lair' \
	--admin_user='Admin' \
	--admin_email='admin@email.com'

	echo "==creating user=="
	wp user create ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASS} \
	--allow-root --path='/var/www/html' --role=contributor
fi


echo "==launching thingy=="
exec /usr/sbin/php-fpm8.2 -F
