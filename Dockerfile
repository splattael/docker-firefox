FROM debian:jessie

ARG FIREFOX_VERSION=47.0.1
ARG FIREFOX_LANG=en-US

ENV FIREFOX_DOWNLOAD="http://ftp.mozilla.org/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2" \
    FIREFOX_HOME="/firefox" \
    REQUIRED_RUNTIME_PACKAGES="wget bzip2 libgtk-3-0 pulseaudio libdbus-glib-1-2 libxt6"

RUN apt-get update \
    && apt-get install --no-install-recommends -y ${REQUIRED_RUNTIME_PACKAGES} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget "$FIREFOX_DOWNLOAD"
RUN tar xvjf firefox-${FIREFOX_VERSION}.tar.bz2

WORKDIR ${FIREFOX_HOME}

ENTRYPOINT ["./firefox"]
