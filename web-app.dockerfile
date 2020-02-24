FROM ubuntu:18.04
LABEL maintainer="Chris Buckner<christopher.d.buckner@gmail.com>"

EXPOSE 80

RUN apt-get update && apt-get install -y \
	python3 \
	python3-pip \
	libev-dev \
	net-tools \
	telnet \
	curl \
	vim

RUN pip3 install \
	fastapi[all] \
	gunicorn \
	uvicorn \
	jinja2 \
	aiofiles
	
# set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# required for fastapi to run
ENV LANG=C.UTF-8

# Add demo app
COPY web-app/Project/ /Project
WORKDIR /Project
#CMD ['/usr/local/bin/uvicorn', 'app:app', '--host', '0.0.0.0', '--port', '80']
ENTRYPOINT ["uvicorn", "app:app"]
# gunicorn example:app -w 4 -k uvicorn.workers.UvicornWorker
