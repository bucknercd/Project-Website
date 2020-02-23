FROM ubuntu:18.04
LABEL maintainer="Chris Buckner<christopher.d.buckner@gmail.com>"

# set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

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
	fastapi[all]
	gunicorn \
	uvicorn \
	jinja2 \
	aiofiles
	

# Add demo app
COPY web-app/Project/ /Project
WORKDIR /Project
#ENTRYPOINT ["python3", "app.py", "0.0.0.0:80"]
# gunicorn example:app -w 4 -k uvicorn.workers.UvicornWorker
