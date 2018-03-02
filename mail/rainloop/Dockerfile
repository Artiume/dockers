FROM richarvey/nginx-php-fpm:1.4.0

LABEL maintainer.name="Anthony PERIQUET"
LABEL maintainer.email="anthony@periquet.net"
LABEL version="1.11.3"
LABEL description="Simple, modern & fast web-based email client"

ARG RAINLOOP_SRC=http://www.rainloop.net/repository/webmail/rainloop-community-latest.zip

ENV RAINLOOP_VERSION	1.11.3
ENV WEBROOT	 			/var/www/html
# ENV RAINLOOP_ADMIN_USER	admin
# ENV RAINLOOP_ADMIN_PASS	12345

# Rainloop installation
RUN apk add --no-cache --quiet curl && \
	# Download rainloop
	curl --fail --silent --show-error --location --remote-name ${RAINLOOP_SRC} && \
	# Extract and clean sources
	unzip -oq rainloop-community-latest.zip -d ${WEBROOT} && \
	rm rainloop-community-latest.zip

WORKDIR ${WEBROOT}