#!/bin/sh

echo "Initialize cozy-core"

# Initialize Database
curl --fail --silent --show-error -X PUT ${COZY_COUCHDB_URL}_users
curl --fail --silent --show-error -X PUT ${COZY_COUCHDB_URL}_replicator
curl --fail --silent --show-error -X PUT ${COZY_COUCHDB_URL}_global_changes

if [ ! -z "${DEBUG}" ]; then
	echo "Debug configuration :"
	echo " .Couchdb URL : ${COZY_COUCHDB_URL}"
	echo " .Cozy port : ${COZY_PORT}"
	echo " .Cozy domain : ${COZY_DOMAIN}"
	echo " .Cozy apps : ${COZY_APPS}"
	echo " .Cozy passphrase : ${COZY_ADMIN_PASSPHRASE}"
	echo
fi

# Run server
echo "Run server"
su cozy -c "cozy-stack serve  --config /etc/cozy/cozy.yml" &
	# --log-level info \
 #    --host 0.0.0.0 \
 #    --port ${COZY_PORT} \
	# --couchdb-url ${COZY_COUCHDB_URL} \
	 # >> /var/log/cozy/cozy.log \
	 # 2>> /var/log/cozy/cozy-err.log &

sleep 10

# Create instance and install applications
echo "Create instance and install applications"
su cozy -c "cozy-stack instances add --host 0.0.0.0 --apps ${COZY_APPS} --passphrase ${COZY_ADMIN_PASSPHRASE} ${COZY_DOMAIN}" &

# Monitor logs
rsyslogd -n