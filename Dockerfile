FROM debian:jessie
MAINTAINER Matthew Vance

LABEL caddy_version="0.9.1" architecture="amd64"

ARG plugins=

RUN \
    BUILD_DEPS='ca-certificates curl' && \
    set -x && \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
      $BUILD_DEPS && \
    rm -rf /var/lib/apt/lists/* && \
    addgroup --system caddy && \
    adduser --disabled-password --system --no-create-home --shell /sbin/nologin --group caddy && \
    curl --silent --show-error --fail --location \
          --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
          "https://caddyserver.com/download/build?os=linux&arch=amd64&features=${plugins}" \
        | tar --no-same-owner -C /usr/bin/ -xz caddy && \
     chmod 0755 /usr/bin/caddy && \
     setcap cap_net_bind_service=+ep /usr/bin/caddy && \
     /usr/bin/caddy -version && \
    apt-get purge -y --auto-remove $BUILD_DEPS && \
    rm -fr /tmp/* /var/tmp/*

EXPOSE 80 443 2015
WORKDIR /srv

ADD Caddyfile /etc/Caddyfile
ADD index.html /srv/index.html

USER caddy

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
