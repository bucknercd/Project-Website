NGINX_IMAGE_NAME=ng
NGINX_CONTAINER_NAME=ng_container
FALCON_IMAGE_NAME=falcon
FALCON_CONTAINER_NAME=falcon_container
FALCON_CONTAINER_NAME_2=falcon_container
FALCON_CONTAINER_NAME_3=falcon_container

help:
	echo "\n*** Makefile Commands ***\nbuild-nginx\\nrun-nginx\nshell-nginx\nkill-nginx\n\n\
build-falcon\nrun-falcon\nrun-falcon-1\nshell-falcon\nshellfalcon-2\ntest-falcon\nkill-falcon\n"

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

build-falcon:
	docker build -t $(FALCON_IMAGE_NAME) -f falcon.dockerfile .
run-falcon:
	docker run -p 9000:80 -d --rm --name $(FALCON_CONTAINER_NAME) $(FALCON_IMAGE_NAME)
run-falcon-2:
	docker run -p 9001:80 -d --rm --name $(FALCON_CONTAINER_NAME) $(FALCON_IMAGE_NAME_2)
shell-falcon:
	docker exec -it $(FALCON_CONTAINER_NAME) bash
shell-falcon-2:
	docker exec -it $(FALCON_CONTAINER_NAME_2) bash
test-falcon:
	docker run -it $(FALCON_IMAGE_NAME) /bin/bash
kill-falcon:
	docker rm $(FALCON_CONTAINER_NAME) -f

clean:
	docker system prune
	make kill-falcon
	make kill-nginx

blah:
	docker run --name some-nginx -d -p 8080:80 some-content-nginx
