NGINX_IMAGE=ng
NGINX_CONTAINER=ng_container
WEBAPP_IMAGE=web-app
WEBAPP_CONTAINER=web-app_container
WEBAPP_CONTAINER_2=web-app_container_2
WEBAPP_CONTAINER_3=web-app_container_3
API_IMAGE=api
API_CONTAINER=api_container
MONGO_IMAGE=mongo
MONGO_CONTAINER=mongo_container

help:
	echo "\n*** Makefile Commands ***\nbuild-nginx\\nrun-nginx\nshell-nginx\nkill-nginx\n\n\
build-web-app\nrun-web-app\ntest-web-app\nrun-web-app-2\nrun-web-app-3\nshell-web-app\nkill-web-app\nkill-web-app-2\nkill-web-app-3\n\n\
build-mongo\nrun-mongo\n"

build-nginx:
	docker build -t $(NGINX_IMAGE) -f nginx.dockerfile .
run-nginx:
	docker run -p 443:443 -d --rm --name $(NGINX_CONTAINER) $(NGINX_IMAGE)
shell-nginx:
	docker exec -it $(NGINX_CONTAINER) bash
test-nginx:
	docker run -p 443:443 --rm --name $(NGINX_CONTAINER) $(NGINX_IMAGE)
kill-nginx:
	docker rm $(NGINX_CONTAINER) -f


build-web-app:
	docker build -t $(WEBAPP_IMAGE) -f web-app.dockerfile .
run-web-app:
	docker run -p 9000:80 -d --rm --name $(WEBAPP_CONTAINER) $(WEBAPP_IMAGE)
run-web-app-2:
	docker run -p 9001:80 -d --rm --name $(WEBAPP_CONTAINER_2) $(WEBAPP_IMAGE)
run-web-app-3:
	docker run -p 9002:80 -d --rm --name $(WEBAPP_CONTAINER_3) $(WEBAPP_IMAGE)
shell-web-app:
	docker exec -it $(WEBAPP_CONTAINER) bash
test-web-app:
	docker run -it -p 9000:80 --rm --name $(WEBAPP_CONTAINER) $(WEBAPP_IMAGE)
kill-web-app:
	docker rm $(WEBAPP_CONTAINER) -f
kill-web-app-2:
	docker rm $(WEBAPP_CONTAINER_2) -f
kill-web-app-3:
	docker rm $(WEBAPP_CONTAINER_3) -f


build-api:
	docker build -t $(API_IMAGE) -f api.dockerfile .
run-api:
	docker run -p 9100:80 -d --rm --name $(API_CONTAINER) $(API_IMAGE)
shell-api:
	docker exec -it $(API_CONTAINER) bash
test-api:
	docker run -p 9100:80 --rm --name $(API_CONTAINER) $(API_IMAGE)


build-mongo:
	docker build -t $(MONGO_IMAGE) -f mongodb.dockerfile .
test-mongo:
	docker run -it --rm --name $(MONGO_CONTAINER) $(MONGO_IMAGE) /bin/bash
run-mongo:
	docker run --rm --name $(MONGO_CONTAINER) $(MONGO_IMAGE)


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
