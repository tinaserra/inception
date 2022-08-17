#!/bin/ash

# on check si le setup est good
if [ -e .install_done ]
	then
		echo "[Wordpress] is already installed"
	else
		# Wait MARIADB
		sleep 5;
		# on check la connection avec mysqladmin ping
		if ! mysqladmin --host=$MARIADB_HOST --user=$MARIADB_USER \
						--password=$MARIADB_USER_PWD --wait=30 ping > /dev/null ; 
        then
			echo "[ERROR] : SQL not connected"
			exit 1;
		else
			# on install et init wordpress avec CLI
			wp core install --path=${WP_DIR}/html --url=${WP_URL} \
			--title=Inception --admin_user=${WP_ADMIN} \
			--admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} \
			--skip-email
			# creation 2eme user & tmp file
			wp user create --path=${WP_DIR}/html ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PWD}
			touch .install_done
		fi
fi

# on start
php-fpm7