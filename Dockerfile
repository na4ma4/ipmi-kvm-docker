# syntax=docker/dockerfile:1
FROM alpine:3.21 AS firefox

WORKDIR /data

ADD https://ftp.mozilla.org/pub/firefox/releases/51.0/linux-x86_64/en-GB/firefox-51.0.tar.bz2 .

RUN apk add bzip2 \
 && tar x -vf firefox-51.0.tar.bz2

FROM solarkennedy/ipmi-kvm-docker:latest

RUN ( \
    echo "jdk.certpath.disabledAlgorithms="; \
    echo "jdk.jar.disabledAlgorithms="; \
    echo "jdk.tls.disabledAlgorithms=" \
    ) | \
    tee -a /etc/java-7-openjdk/security/java.security | \
    tee -a /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security

COPY --from=firefox /data/firefox/ /usr/local/firefox/

RUN apt-get install libdbus-glib-1-2 \
 && ln -s /usr/local/firefox/firefox /usr/local/bin/firefox \
 && ( echo '?package(procps):needs="x11" section="Applications/Internet" title="Firefox" description="Run Firefox Browser" command="/usr/local/bin/firefox"' ) | tee /etc/menu/firefox \
 && update-menus
