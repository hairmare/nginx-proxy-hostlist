# nginx proxy web discovery

A simple companion service to [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) that publishes a list of all running services behind the proxy as a simple JSON micro service.

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
