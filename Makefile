DOCKER_IMAGE?=techzealot/ubuntu20.04-devsuite

DOCKER_NAME?=ubuntu20.04-devsuite

MOUNT_DIR?=/Users/techzealot/CLionProjects

SSHD_PORT?=2222

.PHONY: clean all docker build-docker exec-docker

all: 

clean:

exec-docker:
	docker exec -it ${DOCKER_NAME} bash

docker:
	-docker stop ubuntu20.04-devsuite-debug
	docker run --rm -d --cap-add sys_ptrace -p127.0.0.1:${SSHD_PORT}:22 --mount type=bind,source=${MOUNT_DIR},destination=/mnt --name ${DOCKER_NAME} ${DOCKER_IMAGE}

build-docker:
	docker build -t ${DOCKER_IMAGE} .