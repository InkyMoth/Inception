FROM debian:bookworm


RUN apt-get update -y
RUN apt-get upgrade -y

# INSTALLING WGET AND PHP + DEPENDNECIES
RUN apt-get install wget -y
RUN apt-get install -y php7.3 \
	php-fpm php-mysql mariadb-client


# INSTALLING AND EXTRACTING WORDPRESS FR
RUN mkdir -p /var/www/html
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www \
	&& tar -xzf wordpress-6.0-fr_FR.tar.gz \
	&& rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/html

# INSTALLING WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp
# RUN echo "source /home/$USER/wp-completion.bash" >> ~/.bashrc

# SETTING UP CONFIGS
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html
RUN wp core download --path="/var/www/html" --allow-root


COPY tools/init.sh /bin/init.sh
RUN chmod +x /bin/init.sh

ENTRYPOINT ["/bin/init.sh"]
