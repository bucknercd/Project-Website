NGINX_IMAGE_NAME=ng
NGINX_CONTAINER_NAME=ng_container
WEBSERVER_IMAGE_NAME=webserver
WEBSERVER_CONTAINER_NAME=webserver_container
WEBSERVER_CONTAINER_NAME_2=webserver_container
WEBSERVER_CONTAINER_NAME_3=webserver_container
API_IMAGE_NAME=api
API_CONTAINER_NAME=api_container

help:
	echo "\n*** Makefile Commands ***\nbuild-nginx\\nrun-nginx\nshell-nginx\nkill-nginx\n\n\
build-webserver\nrun-webserver\nrun-webserver-2\nshell-webserver\nshellwebserver-2\nkill-webserver\nkill-webserver-2\n"

build-nginx:
	docker build -t $(NGINX_IMAGE_NAME) -f nginx.dockerfile .
run-nginx:
	docker run -p 8080:80 -d --rm --name $(NGINX_CONTAINER_NAME) $(NGINX_IMAGE_NAME)
shell-nginx:
	docker exec -it $(NGINX_CONTAINER_NAME) bash
test-nginx:
	docker run -it --rm --name $(NGINX_CONTAINER_NAME) $(NGINX_IMAGE_NAME) /bash/bin
kill-nginx:
	docker rm $(NGINX_CONTAINER_NAME) -f

# need to get the below working ...

build-webserver:
	docker build -t $(WEBSERVER_IMAGE_NAME) -f webserver.dockerfile .
run-webserver:
	docker run -p 9000:80 -d --rm --name $(WEBSERVER_CONTAINER_NAME) $(WEBSERVER_IMAGE_NAME)
run-webserver-2:
	docker run -p 9001:80 -d --rm --name $(WEBSERVER_CONTAINER_NAME) $(WEBSERVER_IMAGE_NAME_2)
shell-webserver:
	docker exec -it $(WEBSERVER_CONTAINER_NAME) bash
shell-webserver-2:
	docker exec -it $(WEBSERVER_CONTAINER_NAME_2) bash
test-webserver:
	docker run -it $(WEBSERVER_IMAGE_NAME) /bin/bash
kill-webserver:
	docker rm $(WEBSERVER_CONTAINER_NAME) -f

clean:
	docker system prune
	make kill-webserver
	make kill-nginx

blah:
	docker run --name some-nginx -d -p 8080:80 some-content-nginx
