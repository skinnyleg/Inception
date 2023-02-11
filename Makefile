
up: 
	@mkdir wordpress website adminer mariadb
	cd srcs && docker-compose up --build -d

down:
	cd srcs && docker-compose down

down-cl:
	cd srcs && docker-compose down
	@rm -rf wordpress website adminer mariadb
	@docker volume rm $(shell docker volume ls -q)

re: down up

recl: down-cl up

clean:
	docker rm -f $(shell docker ps -a -q)

fclean : clean
	docker rmi -f $(shell docker images -a -q)

del : down
	@rm -rf wordpress website adminer mariadb
	@docker system prune -af
	@docker volume rm $(shell docker volume ls -q)