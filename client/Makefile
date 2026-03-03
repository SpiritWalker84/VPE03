SHELL := powershell

REGISTRY ?= 85.198.96.71:5000
IMAGE_NAME ?= fastapi-demo
TAG ?= latest
IMAGE := $(REGISTRY)/$(IMAGE_NAME):$(TAG)

.PHONY: bp build push login

bp: build push

build:
	docker build -t $(IMAGE) .

push: login
	docker push $(IMAGE)

login:
	docker login $(REGISTRY)

