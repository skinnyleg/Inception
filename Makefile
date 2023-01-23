
up: 
	mkdir wordpress
	mkdir mariadb
	cd srcs && docker-compose up --build -d

down:
	rm -rf wordpress
	rm -rf mariadb
	cd srcs && docker-compose down

re: down up

clean:
	docker rm -f $(shell docker ps -a -q)

fclean : clean
	docker rmi -f $(shell docker images -a -q)

del :
	cd srcs && docker-compose down && docker system prune -f
	docker volume rm $(shell docker volume ls -q)
	# docker network rm $(shell docker network ls -q) 2>/dev/null