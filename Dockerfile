FROM debian:jessie

RUN apt-get update && apt-get install -y wget bzip2 libgtk-3-0 pulseaudio libdbus-glib-1-2 libxt6 &&  apt-get clean

ENV FIREFOX_VERSION 45.0.2
ENV FIREFOX_DOWNLOAD https://download.mozilla.org/?product=firefox-$FIREFOX_VERSION-SSL&os=linux64

RUN wget -O - -q "$FIREFOX_DOWNLOAD" > foo.tar
RUN tar xvjf foo.tar

WORKDIR /firefox

ENTRYPOINT ["./firefox"]
