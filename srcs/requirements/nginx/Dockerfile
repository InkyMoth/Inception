FROM debian:bookworm


RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y

RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=gaasseli.42.fr/UID=gaasseli"

RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html


COPY tools/init.sh /
RUN chmod +x /init.sh
CMD ["nginx", "-g", "daemon off;"]

# ENTRYPOINT ["/init.sh"]
