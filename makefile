NGINX_IMAGE_NAME=ng
NGINX_CONTAINER_NAME=ng_container
WEBAPP_IMAGE_NAME=web-app
WEBAPP_CONTAINER_NAME=web-app_container
WEBAPP_CONTAINER_NAME_2=web-app_container
WEBAPP_CONTAINER_NAME_3=web-app_container
API_IMAGE_NAME=api
API_CONTAINER_NAME=api_container

help:
	echo "\n*** Makefile Commands ***\nbuild-nginx\\nrun-nginx\nshell-nginx\nkill-nginx\n\n\
build-web-app\nrun-web-app\ntest-web-app\nrun-web-app-2\nshell-web-app\nshellweb-app-2\nkill-web-app\nkill-web-app-2\n"

build-nginx:
	docker build -t $(NGINX_IMAGE_NAME) -f nginx.dockerfile .
run-nginx:
	docker run -p 8081:80 -d --rm --name $(NGINX_CONTAINER_NAME) $(NGINX_IMAGE_NAME)
shell-nginx:
	docker exec -it $(NGINX_CONTAINER_NAME) bash
test-nginx:
	docker run -p 8081:80 --rm --name $(NGINX_CONTAINER_NAME) $(NGINX_IMAGE_NAME)
kill-nginx:
	docker rm $(NGINX_CONTAINER_NAME) -f

# need to get the below working ...

build-web-app:
	docker build -t $(WEBAPP_IMAGE_NAME) -f web-app.dockerfile .
run-web-app:
	docker run -p 9000:80 -d --rm --name $(WEBAPP_CONTAINER_NAME) $(WEBAPP_IMAGE_NAME)
run-web-app-2:
	docker run -p 9001:80 -d --rm --name $(WEBAPP_CONTAINER_NAME_2) $(WEBAPP_IMAGE_NAME_2)
shell-web-app:
	docker exec -it $(WEBAPP_CONTAINER_NAME) bash
shell-web-app-2:
	docker exec -it $(WEBAPP_CONTAINER_NAME_2) bash
test-web-app:
	docker run -it -p 9000:80 --rm --name $(WEBAPP_CONTAINER_NAME) $(WEBAPP_IMAGE_NAME) --entrypoint /bin/bash
kill-web-app:
	docker rm $(WEBAPP_CONTAINER_NAME) -f

clean:
	docker system prune
	make kill-nginx
	make kill-web-app

blah:
	docker run --name some-nginx -d -p 8080:80 some-content-nginx
