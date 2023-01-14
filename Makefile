


up: 
	cd srcs && docker-compose up --build -d

down:
	cd srcs && docker-compose down

re: down up
clean:
	docker rm $(shell docker ps -a -q)

fclean : clean
	docker rmi $(shell docker images -a -q)

del :
	docker system prune -a
