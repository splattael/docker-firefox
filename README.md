# Dockerized firefox based on Debian jessie

:warning: :construction: :construction: :construction: :warning:

## Run

```bash
  xhost +local:
  docker run --rm -it \
    -e DISPLAY=${DISPLAY} \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    firefox ./firefox
```

## TODO

* [ ] Run as non-root
* [ ] Pass audio (pulseaudio)
* [ ] Enable persistence via volumes

## Inspiration

https://github.com/urzds/firefox-docker/
