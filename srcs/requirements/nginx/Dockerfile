FROM debian:buster

RUN apt-get update
RUN apt-get install -y openssl nginx

COPY nginx.conf /etc/nginx/conf.d/
COPY run_nginx.sh .

EXPOSE 443

CMD ["bash", "run_nginx.sh"]