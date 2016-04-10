FROM alpine

ENV DOCKER_GEN_VERSION=0.7.0

RUN apk update && apk add openssl \
    && wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
    && tar zxvf docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
    && mv docker-gen /usr/local/bin/ \
    && rm -rf docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /var/www/api

COPY templates /etc/docker-gen/templates
COPY web /usr/local/share/web
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY notify.sh /usr/local/bin/notify.sh

VOLUME "/var/www/"
VOLUME "/etc/nginx/conf.d/"
VOLUME "/usr/local/share/web"

ENTRYPOINT ["/usr/local/bin/docker-gen"]
CMD ["-watch", "-notify", "/usr/local/bin/notify.sh", "/etc/docker-gen/templates/hosts.tmpl", "/var/www/api/index.json"]
