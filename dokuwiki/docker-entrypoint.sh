#!/bin/sh

# Run php-fpm
echo "Starting PHP-FPM ..."
/opt/php/sbin/php-fpm

# Run nginx
echo "Starting nginx ..."
exec "$@"
