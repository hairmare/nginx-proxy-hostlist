# nginx proxy web discovery

A simple companion service to [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) that publishes a list of all running services behind the proxy as a simple JSON micro service.

This consists of an alpine based docker-gen container that generates a list of hosts and an nginx machine that serves those to the world.

## Configuration

See the `docker-compose.yml` for how this is intended to be set up. You will certainly will want to change the `VIRTUAL_HOST` entry in the file to match you deploy.

## Run from Docker Hub

```
docker-compose up -d
```

## Build and run locally

```
docker-compose -f dev.yml build
docker-compose -f dev.yml up -d
```

## Run without using docker-compose

```
docker run -d --name hostlist -v /var/run/docker.sock:/var/run/docker.sock:ro hairmare/nginx-proxy-hostlist
docker run -d --volumes-from hostlist -e VIRTUAL_HOST=hostlist.vcap.me hairmare/nginx-proxy-hostlist-web
```
