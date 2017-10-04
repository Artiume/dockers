# DokuWiki

## Supported tags

* `2017-02-19e`, `latest` ([Dockerfile](https://github.com/xylphid/dockers/blob/master/dokuwiki/Dockerfile)))
## How to use this image

### Mounting project

`$ docker run --name some-name -d xylphid/dokuwiki:latest`

### Exposing external port

`$ docker run --name some-name -p 80:80 -d xylphid/dokuwiki:latest`
Then you can hit `http://localhost/` or `http://host-ip`in your browser.

## How to compose with this image

    version: "3"
    services:
      app:
        image: xylphid/dokuwiki:latest
        port:
          - "80:80"
        restart: always

### Traefik configuration

    version: "3"
    services:
      app:
        image: xylphid/dokuwiki:latest
        labels:
          - "traefik.backend=my-project"
          - "traefik.frontend.rule=Host:my-project.domain.ldt"
          - "traefik.port=80"
        restart: always

## Image inheritance

This docker image inherits from [nginx:1.13.5-alpine](https://hub.docker.com/_/nginx/) image.