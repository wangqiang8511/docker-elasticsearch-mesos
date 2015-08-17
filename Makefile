VERSION_FILE=VERSION
VERSION_TAG=`cat ${VERSION_FILE}`

all: docker

docker:
	docker build -t mesos_elasticsearch:$(VERSION_TAG) .
