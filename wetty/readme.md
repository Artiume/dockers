# Wetty

Terminal over HTTP ~and HTTPS~. Wetty is an alternative to ajaxterm/anyterm but much better than them because wetty uses ChromeOS' terminal emulator (hterm) which is a full fledged implementation of terminal emulation written entirely in Javascript. Also it uses websockets instead of Ajax and hence better response time.

## Supported tags

* `0.2.0`, `latest`

## How to use this image

### Mounting project

`$ docker run --name some-name -d xylphid/wetty:latest`

### Exposing external port

`$ docker run --name some-name -p 80:3000 -d xylphid/wetty:latest`
Then you can hit `http://localhost/` or `http://host-ip`in your browser and log in with user *wetty* and password *wetty*.



## How to compose with this image

    version: "3"
    services:
      app:
        image: xylphid/wetty:latest
        port:
          - "80:3000"
        restart: always

### Traefik configuration

    version: "3"
    services:
      app:
        image: xylphid/wetty:latest
        labels:
          - "traefik.backend=my-project"
          - "traefik.frontend.rule=Host:my-project.domain.tld"
          - "traefik.port=3000"
        restart: always

## Configure your own wetty

It is possible to configure your wetty (shell, group, user, password) when building the image.

### Build with docker

`$ docker build --build-arg USER=some_user --build-arg PASS=some_password -t xylphid/wetty .`

### Build with compose

    version: "3"
    services:
      wetty:
        build:
          context: .
          args:
            USER: some_user
            PASS: some_password
        port:
          - "80:3000"
        restart: always

## Quick reference

* [Wetty project](https://github.com/krishnasrinivas/wetty)

## Image inheritance

This docker image inherits from [nodejs:latest](https://hub.docker.com/r/google/nodejs/) image.