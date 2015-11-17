IMAGE_TAG=$(shell git describe --abbrev=0)
IMAGE_NAME=nanit/config_server

all: build push

push:
	docker push $(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_NAME):latest

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	docker build -t $(IMAGE_NAME):latest .
