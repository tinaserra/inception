# Image de base
FROM	alpine:3.15

# Prerequis
RUN		apk update
RUN		apk add --update mariadb mariadb-client gettext
RUN		mkdir -p /var/lib/mysql/run
RUN		mkdir -p /run/mysqld
RUN		mkdir -p /var/log/mysql
RUN		mariadb-install-db  --user=mysql --datadir=/var/lib/mysql --skip-test-db
RUN		chown -R mysql:mysql /var/lib/mysql
RUN		chown -R mysql:mysql /var/log/mysql
RUN		chown -R mysql:mysql /run/mysqld

# Copy conf
COPY	mariadb.conf /etc/my.cnf.d/mariadb-server.cnf


# Config MariaDB
COPY	run_mariadb.sh		/run_mariadb.sh
COPY	init_var.sql	    /init_var.sql
RUN		chmod +x run_mariadb.sh

# EXPOSE 3306

ENTRYPOINT ["./run_mariadb.sh"]
