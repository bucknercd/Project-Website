NGINX_IMAGE_NAME=ng
NGINX_CONTAINER_NAME=ng_container
WEBAPP_IMAGE_NAME=web-app
WEBAPP_CONTAINER_NAME=web-app_container
WEBAPP_CONTAINER_NAME_2=web-app_container_2
WEBAPP_CONTAINER_NAME_3=web-app_container_3
API_IMAGE_NAME=api
API_CONTAINER_NAME=api_container

help:
	echo "\n*** Makefile Commands ***\nbuild-nginx\\nrun-nginx\nshell-nginx\nkill-nginx\n\n\
build-web-app\nrun-web-app\ntest-web-app\nrun-web-app-2\nrun-web-app-3\nshell-web-app\nshellweb-app-2\nkill-web-app\nkill-web-app-2\n"

build-nginx:
	docker build -t $(NGINX_IMAGE_NAME) -f nginx.dockerfile .
run-nginx:
	docker run -p 8080:80 -d --rm --name $(NGINX_CONTAINER_NAME) $(NGINX_IMAGE_NAME)
shell-nginx:
	docker exec -it $(NGINX_CONTAINER_NAME) bash
test-nginx:
	docker run -p 8080:80 --rm --name $(NGINX_CONTAINER_NAME) $(NGINX_IMAGE_NAME)
kill-nginx:
	docker rm $(NGINX_CONTAINER_NAME) -f

# need to get the below working ...

build-web-app:
	docker build -t $(WEBAPP_IMAGE_NAME) -f web-app.dockerfile .
run-web-app:
	docker run -p 9000:80 -d --rm --name $(WEBAPP_CONTAINER_NAME) $(WEBAPP_IMAGE_NAME)
run-web-app-2:
	docker run -p 9001:80 -d --rm --name $(WEBAPP_CONTAINER_NAME_2) $(WEBAPP_IMAGE_NAME)
run-web-app-3:
	docker run -p 9002:80 -d --rm --name $(WEBAPP_CONTAINER_NAME_3) $(WEBAPP_IMAGE_NAME)
shell-web-app:
	docker exec -it $(WEBAPP_CONTAINER_NAME) bash
shell-web-app-2:
	docker exec -it $(WEBAPP_CONTAINER_NAME_2) bash
test-web-app:
	docker run -it -p 9000:80 --rm --name $(WEBAPP_CONTAINER_NAME) $(WEBAPP_IMAGE_NAME) /bin/bash
kill-web-app:
	docker rm $(WEBAPP_CONTAINER_NAME) -f
kill-web-app-2:
	docker rm $(WEBAPP_CONTAINER_NAME_2) -f
kill-web-app-3:
	docker rm $(WEBAPP_CONTAINER_NAME_3) -f
clean:
	docker system prune
	make kill-nginx
	make kill-web-app
	make kill-web-app-2
	make kill-web-app-3
project:
	make build-nginx
	make build-web-app
	make run-nginx
	make run-web-app
	make run-web-app-2
	make run-web-app-3
