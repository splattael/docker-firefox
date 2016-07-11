VERSION=$(cat VERSION)

build:
	docker build -t firefox:$VERSION .

test: build
	docker run --rm -it \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		firefox:$VERSION
