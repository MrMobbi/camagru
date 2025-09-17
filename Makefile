
all:
	docker compose -f docker-compose.yaml up --build -d
	
build:
	docker compose build

up:
	docker compose up -d

mig:
	docker compose run --rm backend sh -c "python manage.py makemigrations"
	docker compose run --rm backend sh -c "python manage.py migrate"

db:
	docker compose run --rm backend sh -c "python manage.py dbshell"

down:
	docker compose down --remove-orphans

clean:
	docker compose down --remove-orphans --rmi all

fclean: clean
	docker volime ls -q | grep 

ls:
	docker image ls
	docker ps
	docker volume ls

logs:
	docker compose logs
