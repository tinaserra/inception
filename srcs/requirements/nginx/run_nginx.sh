mkdir -p /var/logs
mkdir -p /etc/nginx/ssl

sed -i '1 s/user nginx/user www-data/' /etc/nginx/nginx.conf

openssl req -newkey rsa:2048 -x509 -sha256 -nodes -out /etc/nginx/ssl/default.pem -keyout /etc/nginx/ssl/default.key -subj "/C=FR/ST=Paris/L=Paris/O=42 Paris/OU=vserra/CN=localhost"

nginx -g "daemon off;"