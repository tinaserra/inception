FROM debian:buster

RUN apt-get update
RUN apt-get install -y openssl nginx
RUN mkdir -p /var/logs
RUN mkdir -p /etc/nginx/ssl

# Create a self signed certificate using OpenSSL
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx-self-signed.key -out /etc/nginx/nginx-self-signed.crt -subj "/C=FR/L=Paris/O=42/CN=vserra.42.fr/UID=vserra"

COPY nginx.conf /etc/nginx/


# standard port for SSL
EXPOSE 443

CMD	["nginx", "-g", "daemon off;"]