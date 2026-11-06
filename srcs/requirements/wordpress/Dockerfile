FROM debian:bookworm


RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install wget -y
RUN apt-get install -y php7.3 \
	php-fpm php-mysql mariadb-client

# RUN mkdir -p /home/gaasseli/data/wordpress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www \
	&& tar -xzf wordpress-6.0-fr_FR.tar.gz \
	&& rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
# RUN echo "source /home/$USER/wp-completion.bash" >> ~/.bashrc


COPY tools/init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]