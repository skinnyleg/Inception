
up: 
	cd srcs && docker-compose up --build -d

down:
	cd srcs && docker-compose down

re: down up

clean:
	docker rm -f $(shell docker ps -a -q)

fclean : clean
	docker rmi -f $(shell docker images -a -q)

del :
	cd srcs && docker-compose down && docker system prune -f
	docker rmi $(shell docker images -q) 2>/dev/null