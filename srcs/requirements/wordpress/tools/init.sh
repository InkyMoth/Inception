#!/bin/sh

echo "===Gimme a sec, I'm making sure MariaDB is done...==="
sleep 5

# echo "\nREADING /var/www/wordpress:"
# ls /var/www/wordpress

# echo "\nREADING /var/www/html:"
# ls /var/www/html

if [ ! -f /var/www/wordpress/wp-config.php ];
then
	echo "No config, creating one..."

	echo "creating config"
	wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

	echo "installing core"
	wp core install --allow-root --path='/var/www/wordpress' \
	--url='gaasseli.42.fr' \
	--title='Evil Lair' \
	--admin_user='Admin' \
	--admin_email='admin@email.com'

	echo "creating user"
	wp user create ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASS} \
	--allow-root --path='/var/www/wordpress'
fi

echo "launching thingy"
/usr/sbin/php-fpm8.2 -F
