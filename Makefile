
build:
	docker build --build-arg FIREFOX_VERSION=$(shell cat VERSION) -t firefox:$(shell cat VERSION) .

test: build
	docker run --rm -it \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		firefox:$(shell cat VERSION)
