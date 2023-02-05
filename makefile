IMAGE_NAME=my-angular-app
DOCKERFILE_PATH=Docker/Dockerfile

build:
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE_PATH) .

run:
	docker run -p 4200:4200 $(IMAGE_NAME)

.PHONY: build run