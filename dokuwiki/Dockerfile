FROM nginx:1.13.5-alpine

ENV PHP_VERSION "7.1.9"
ENV PHP_SOURCES "http://fr2.php.net/distributions/php-7.1.9.tar.gz"
ENV WIKI_VERSION "2017-02-19e"
ENV WIKI_SOURCES "https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz"

LABEL maintainer.name="Anthony PERIQUET"
LABEL maintainer.email="anthony@periquet.net"
LABEL version=${DOKUWIKI_VERSION}
LABEL description="DokuWiki 2017-02-19e -Frusterick Manners-"

# Install and configure PHP
RUN apk add --no-cache --quiet curl g++ gcc make libxml2-dev libpng-dev openssl-dev && \
    curl --fail --silent --show-error --location --remote-name ${PHP_SOURCES} && \
    tar -xf php-${PHP_VERSION}.tar.gz && \
    rm php-${PHP_VERSION}.tar.gz && \
    cd php-${PHP_VERSION} && \
    ./configure \
        --prefix=/opt/php \
        --with-config-file-path=/opt/php/etc \
        --with-jpeg-dir=/usr \
        --with-png-dir=/usr \
        --with-libxml-dir=/usr \
        --with-fpm-user=nginx \
        --with-fpm-group=nginx \
        --with-openssl \
        --with-pcre-regex \
        --with-zlib \
        --enable-exif \
        --enable-fpm \
        --enable-gd-native-ttf \
        --enable-zip && \
    make -j4 && \
    make install

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Configure PHP
RUN cp /opt/php/etc/php-fpm.conf.default /opt/php/etc/php-fpm.conf && \
    cp /opt/php/etc/php-fpm.d/www.conf.default /opt/php/etc/php-fpm.d/www.conf && \
    cp php-${PHP_VERSION}/php.ini-production /opt/php/etc/ && \
    rm -rf php-${PHP_VERSION} && \
    sed -i '/^;access.log/s/^;\(access.log\)\(.*\)$/\1 = \/dev\/stdout/' /opt/php/etc/php-fpm.conf && \
    sed -i '/^;error_log/s/^;\(error_log\)\(.*\)$/\1 = \/dev\/stderr/' /opt/php/etc/php-fpm.conf

# Install DokuWiki
RUN curl --fail --silent --show-error --location --remote-name ${WIKI_SOURCES} && \
    tar -xf dokuwiki-stable.tgz && \
    mv dokuwiki-${WIKI_VERSION}/* /usr/share/nginx/html && \
    chown -R nginx:nginx /usr/share/nginx/html && \
    rm /usr/share/nginx/html/index.html

VOLUME /usr/share/nginx/html/data/attic
VOLUME /usr/share/nginx/html/data/conf
VOLUME /usr/share/nginx/html/data/media
VOLUME /usr/share/nginx/html/data/media_attic
VOLUME /usr/share/nginx/html/data/media_meta
VOLUME /usr/share/nginx/html/data/meta
VOLUME /usr/share/nginx/html/data/pages
VOLUME /usr/share/nginx/html/lib/plugins
VOLUME /usr/share/nginx/html/lib/tpl

EXPOSE 80

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh # backwards compat

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
