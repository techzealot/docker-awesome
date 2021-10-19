DOCKER_IMAGE_UBUNTU?=techzealot/ubuntu20.04-devsuite

DOCKER_NAME_UBUNTU?=ubuntu20.04-devsuite

USER_HOME=/Users/techzealot

MOUNT_DIR?=${USER_HOME}/CLionProjects

SSHD_PORT?=22222

.PHONY: clean all 

all: 

clean:

exec-ubuntu:
	docker exec -it --user 1000 -w /mnt ${DOCKER_NAME_UBUNTU} bash

run-ubuntu:
	-docker stop ${DOCKER_NAME_UBUNTU}
	docker run --rm -d --cap-add sys_ptrace -p127.0.0.1:${SSHD_PORT}:22 --mount type=bind,source=${MOUNT_DIR},destination=/mnt --name ${DOCKER_NAME_UBUNTU} ${DOCKER_NAME_UBUNTU}

build-ubuntu:
	docker build -f Dockerfile -t ${DOCKER_NAME_UBUNTU} .

# docker cp mysql8-test:/etc/mysql/conf/my.cnf ~/docker/mysql8/conf 
run-mysql8:
	docker run --rm --name mysql8 \
	-p 3306:3306 -e MYSQL_ROOT_PASSWORD=root \
	--mount type=bind,src=${USER_HOME}/docker/mysql8/conf/my.cnf,dst=/etc/mysql/my.cnf \
	--mount type=bind,src=${USER_HOME}/docker/mysql8/data,dst=/var/lib/mysql \
	-d mysql:8.0.26

mysql8:
	docker run --rm --name mysql8-test \
	-p 3306:3306 -e MYSQL_ROOT_PASSWORD=root \
	-d mysql:8.0.26

run-mysql5.7:
	docker run --rm --name mysql5.7 \
	-p 3307:3306 -e MYSQL_ROOT_PASSWORD=root \
	--mount type=bind,src=${USER_HOME}/docker/mysql5.7,dst=/mnt \
	-d mysql:5.7.35
