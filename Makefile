

build:
	docker build -t firefox .

test: build
	docker run --rm -it \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		firefox ./firefox
