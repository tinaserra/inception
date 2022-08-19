# FROM debian:buster

# #Install necessary package

# RUN apt-get update && apt-get -y install mariadb-server mariadb-client \
# && rm -rf /var/lib/apt/lists/* \
# # purge and re-create /var/lib/mysql with appropriate ownership
# && mkdir -p /var/run/mysqld \
# && chown -R mysql:mysql /var/run/mysqld \
# # ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
# && chmod 777 /var/run/mysqld

# EXPOSE 3306

# COPY ./tools/create_db.sh /usr/local/bin/
# COPY ./conf/wordpress.sql /usr/local/bin/
# ENTRYPOINT ["create_db.sh"]

# #Command to launch mariadb and enable the database to listen globally

# CMD ["mysqld", "--bind-address=0.0.0.0"]

# MARIADB CONTAINER

FROM	alpine:3.15

# Install and update MariaDB
RUN		apk update
RUN		apk add --update mariadb mariadb-client gettext
RUN		mkdir -p /var/lib/mysql/run
RUN		mkdir -p /run/mysqld
RUN		mkdir -p /var/log/mysql
RUN		mariadb-install-db  --user=mysql --datadir=/var/lib/mysql --skip-test-db
RUN		chown -R mysql:mysql /var/lib/mysql
RUN		chown -R mysql:mysql /var/log/mysql
RUN		chown -R mysql:mysql /run/mysqld

# Copy conf and init files to server
COPY	mariadb.conf /etc/my.cnf.d/mariadb-server.cnf

# Database setup
COPY	run_mariadb.sh		/run_mariadb.sh
COPY	init_var.sql	    /init_var.sql
RUN		chmod +x run_mariadb.sh

# EXPOSE 3306

ENTRYPOINT ["./run_mariadb.sh"]

