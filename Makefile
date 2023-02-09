
up: 
	cd srcs && docker-compose up --build -d

down:
	cd srcs && docker-compose down

re: down up

clean:
	docker rm -f $(shell docker ps -a -q)

fclean : clean
	docker rmi -f $(shell docker images -a -q)

del : down
	@rm -rf wordpress website adminer mariadb
	@docker system prune -af
	@docker volume rm $(shell docker volume ls -q)