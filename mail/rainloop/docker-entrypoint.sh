#!/bin/sh

# Configure rainloop
sed -i "/^admin_login.*$/\(admin_login = \).*/\1\"$RAINLOOP_ADMIN_USER\"/g" $WEBROOT/data/_data_/_default_/configs/application.ini
sed -i "/^admin_password.*$/\(admin_password = \).*/\1\"$RAINLOOP_ADMIN_PASS\"/g" $WEBROOT/data/_data_/_default_/configs/application.ini

# Execute FROM entrypoint
/start.sh