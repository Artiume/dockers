# ![Rainloop](./documentation/rainloop.png)

Simple, modern & fast web-based email client

Modest system requirements, decent performance, simple installation and upgrade,
**no database required** - all these make **RainLoop Webmail** a perfect choice for your email solution. 

## Supported tags

* `1`, `1.11`, `1.11.3`, `latest`

## How to use this image

`$ docker run --name rainloop -p 80:80 -d xylphid/rainloop:1.11.3`

Then you can hit _http://localhost_ or _http://host-ip_ in your browser.

## How to compose with thid image

    version: "3"
    services:
      rainloop:
        image: xylphid/rainloop:1.11.3
        port:
          - 80:80
        restart: always

### Traefik configuration

    version: "3"
    services:
      rainloop:
        image: xylphid/rainloop:1.11.3
        labels:
          traefik.enable: "true"
          traefik.backend: "Rainloop"
          traefik.frontend.rule: "Host:rainloop.domain.ltd"
          traefik.port: "80"
        restart: always

## Quick references

* [Rainloop](https://www.rainloop.net/)
* [Documentation](https://www.rainloop.net/docs/)

## Image inheritance

This docker image inherits from [richarvey/nginx-php-fpm:1.4.0](https://hub.docker.com/r/richarvey/nginx-php-fpm/) image.