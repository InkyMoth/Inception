#!/bin/sh


if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]; then
	echo "==Database already exists, skipping creation=="
else
	echo "==Database does not exist, ensuring MariaDB is setup=="

	echo "==Loading database in temporary init mode=="
	service mariadb start;

	mariadb-secure-installation <<-EOF
		
		y
		y
		${SQL_ROOT_PASSWORD}
		${SQL_ROOT_PASSWORD}
		y
		y
		y
		y
	EOF

	echo "==Creating database=="
	mysql -u root -p${SQL_ROOT_PASSWORD} -e \
		"CREATE DATABASE ${SQL_DATABASE};"

	echo "==Creating user=="
	mysql -u root -p${SQL_ROOT_PASSWORD} -e \
		"CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

	echo "==Granting privileges=="
	mysql -u root -p${SQL_ROOT_PASSWORD} -e \
		"GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"

	echo "==Flushing privileges=="
	mysql -u root -p${SQL_ROOT_PASSWORD} -e \
		"FLUSH PRIVILEGES;"

	echo "==Stopping temporary Database=="
	service mariadb stop;
fi

echo "==Launching MariaDB=="
exec "$@"
