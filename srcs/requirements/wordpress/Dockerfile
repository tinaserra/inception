# Image de base
FROM alpine:3.15

# Prerequis
RUN apk update
RUN apk add --update mariadb-client wget
RUN apk add --update php php-fpm php-mysqli php-common php-cli php-phar
RUN apk add --update php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-json php-openssl

# CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod u+x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
ARG WP_DIR
RUN mkdir -p ${WP_DIR}/html
RUN wp core download --locale=en_US --path=${WP_DIR}/html
COPY ./conf/php-fpm.conf	/etc/php7/php-fpm.conf
COPY ./conf/www.conf		/etc/php7/php-fpm.d/www.conf

# Creation user (adduser)
RUN adduser -H -D -S nginx && addgroup nginx && chown -R nginx:nginx ${WP_DIR}

# Config wordpress
COPY ./conf/wp-config.php	${WP_DIR}/html/wp-config.php

COPY run_wp.sh		/run_wp.sh
RUN chmod 750 run_wp.sh

ENTRYPOINT [ "sh", "run_wp.sh" ]