FROM ubuntu:18.04
LABEL maintainer="Chris Buckner<christopher.d.buckner@gmail.com>"

# This is to support noninteractive apt-get installs
ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 80

RUN apt-get update && apt-get install -y \
	python3 \
	python3-pip \
	libev-dev \
	net-tools \
	telnet \
	curl \
	vim

RUN pip3 install --no-binary :all: falcon
RUN pip3 install cython \
	bjoern

# Add demo app
COPY falcon/Project/ /Project
WORKDIR /Project
#ENTRYPOINT ["python3", "app.py", "0.0.0.0:80"]

