
up:
	@-mkdir -p /home/hmoubal/data/wordpress /home/hmoubal/data/website /home/hmoubal/data/adminer /home/hmoubal/data/mariadb
	cd srcs && sudo docker-compose up --build -d

down:
	cd srcs && sudo docker-compose down

re: down up

clean:
	sudo docker rm -f $(shell sudo docker ps -a -q)

fclean : clean
	sudo docker rmi -f $(shell sudo docker images -a -q)

vol:
	@sudo docker volume rm $(shell sudo docker volume ls -q)

del : down
	@-rm -rf /home/hmoubal/data
	@sudo docker system prune -af
	@sudo docker volume rm $(shell sudo docker volume ls -q)