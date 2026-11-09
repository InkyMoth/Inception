SRCDIR = srcs/
ENVS = srcs/.env


all: build run

build:
	mkdir -p /home/${USER}/data/mariadb /home/${USER}/data/wordpress
	docker-compose -f $(SRCDIR)docker-compose.yml build

run:
	docker-compose -f $(SRCDIR)docker-compose.yml --env-file $(ENVS) up
clean:
	docker-compose -f $(SRCDIR)docker-compose.yml down
fclean:
	docker-compose -f $(SRCDIR)docker-compose.yml down -v

start:
	docker-compose -f $(SRCDIR)docker-compose.yml start
stop:
	docker-compose -f $(SRCDIR)docker-compose.yml stop

re: stop fclean all


.PHONY: all build run clean fclean start stop re