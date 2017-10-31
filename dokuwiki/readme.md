# DokuWiki

## Supported tags

* `2017-02-19e`, `latest` ([Dockerfile](https://github.com/xylphid/dockers/blob/master/dokuwiki/Dockerfile))
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

## Persistent data

To make your data persistent, you will need to mount those volumes :
* `/usr/share/nginx/html/data/attic` : all the old versions of your pages
* `/usr/share/nginx/html/data/conf` : the configuration settings
* `/usr/share/nginx/html/data/media` : contains your current media (images, PDFs, …)
* `/usr/share/nginx/html/data/media_attic` : all the old versions of your media
* `/usr/share/nginx/html/data/media_meta` : meta data for the media
* `/usr/share/nginx/html/data/meta` : contains meta information about your pages (like who created it originally, who subscribed to it, …)
* `/usr/share/nginx/html/data/pages` : contains your current pages

If you want to use named volumes for all of these it would look like this :

    $ docker run -d --name some-name \
      -p 80:80 \
      -v attic:/usr/share/nginx/html/data/attic \
      -v conf:/usr/share/nginx/html/data/conf \
      -v media:/usr/share/nginx/html/data/media \
      -v media_attic:/usr/share/nginx/html/data/media_attic \
      -v media_meta:/usr/share/nginx/html/data/media_meta \
      -v meta:/usr/share/nginx/html/data/meta \
      -v pages:/usr/share/nginx/html/data/pages \
      xylphid/dokuwiki:latest

## Image inheritance

This docker image inherits from [nginx:1.13.5-alpine](https://hub.docker.com/_/nginx/) image.