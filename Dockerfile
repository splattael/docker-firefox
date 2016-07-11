FROM debian:jessie

ARG FIREFOX_VERSION=47.0.1
ARG FIREFOX_LANG=en-US

RUN wget -O - -q "$FIREFOX_DOWNLOAD" > foo.tar
RUN tar xvjf foo.tar
ENV FIREFOX_DOWNLOAD="http://ftp.mozilla.org/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2" \
    FIREFOX_HOME="/firefox" \

RUN apt-get update && apt-get install -y \
  wget bzip2 libgtk-3-0 pulseaudio libdbus-glib-1-2 libxt6 \
  && apt-get clean

WORKDIR ${FIREFOX_HOME}

ENTRYPOINT ["./firefox"]
