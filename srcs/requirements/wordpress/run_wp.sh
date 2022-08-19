#!/bin/ash

# Check if initial setup is done using temp file
if [ -e .install_done ]
	then
		echo "Wordpress is already installed"
	else
		# Wait MARIADB container
		sleep 5;
		# Check la connection avec mysqladmin ping
		if ! mysqladmin --host=$MARIADB_HOST \
						--user=$MARIADB_USER \
						--password=$MARIADB_USER_PWD \
						--wait=30 ping > /dev/null ; then
			echo "ERROR : SQL not connected"
			exit 1;
		else
			# Installation Wordpress
			wp core install --path=${WP_DIR}/html \
			--url=${WP_URL} \
			--title=Inception \
			--admin_user=${WP_ADMIN} \
			--admin_password=${WP_ADMIN_PWD} \
			--admin_email=${WP_ADMIN_EMAIL} \
			--skip-email
			# Creer 2eme user
			wp user create --path=${WP_DIR}/html ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PWD}
			# create a temp file
			touch .install_done
		fi
fi

# Start PHP-FPM
php-fpm7