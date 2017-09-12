# Monitor

**Monitor** is an image for Raspberry PI used for docker containers, services or nodes monitoring. On swarm, it must be started on manager node.

## Supported tags

* `1-arm`, `1.0-arm`, `1.0.2-arm`, `latest` ([Dockerfile](https://github.com/xylphid/dockers/blob/master/monitor/1/Dockerfile))

## How to use this image

`$ docker run -d --name -device /dev/gpiomem:/dev/gpiomem -v /var/run/docker.sock:/var/run/docker.sock monitor xylphid/monitor`

* `/dev/gpiomem` is used to access GPIO leds if plugged in
* `/var/run/docker` is used to access docker API

## How to compose with this image

    version: "2"
    services:
       monitor:
         command: --monitor containers --delay 1
         devices:
           - /dev/gpiomem:/dev/gpiomem
         image: xylphid/monitor:1.0.2-arm
         volumes:
           - /var/run/docker.sock:/var/run/docker.sock

## How to stack this image

Not available yet due to device mount which is not possible in swarm stack.

## Configure monitoring

This image accept the following command arguments :
* --monitor, -m [containers, nodes, services] (Default is container)
* --delay, -d [n] (Second. Default is 1)

## Reporting bugs and contributing ![Github](http://iconshow.me/media/images/ui/ios7-icons/png/24/social-github.png)

* Want to report a bug or request a feature? Please open [an issue](https://github.com/xylphid/docker-monitor/issues).
* Want to help me build monitor ? Fork the project [repository](https://github.com/xylphid/docker-monitor/) 

## Image inheritance

This docker image inherits from [arm32v7/python:3.6.2](https://hub.docker.com/r/arm32v7/python/) image.