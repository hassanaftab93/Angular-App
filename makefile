IMAGE_NAME=my-angular-app
DOCKERFILE_PATH=Docker/Dockerfile

build:
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE_PATH) .

run:
	docker run -p 8080:80 $(IMAGE_NAME)

.PHONY: build run