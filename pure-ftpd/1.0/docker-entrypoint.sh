#!/bin/sh


if [ ! -d "${DEFAULT_ROOT}" ]; then
	echo "Create root dir : ${DEFAULT_ROOT}"
	mkdir -p ${DEFAULT_ROOT}
fi

if [ "${DEFAULT_USR}" != "username" ]; then
	# Create user root directory if not exists
	if [ ! -d ${DEFAULT_ROOT}${DEFAULT_USR} ]; then
		mkdir ${DEFAULT_ROOT}${DEFAULT_USR}
	fi
	
	# Create user
	echo "Create new user : ${DEFAULT_USR}"
	expect -c "
		spawn pure-pw useradd ${DEFAULT_USR} -u pure -d /opt/pure/datas/${DEFAULT_USR}
		expect {
			Password { 
				send \"${DEFAULT_PWD}\r\"
				exp_continue
			}
			again { 
				send \"${DEFAULT_PWD}\r\"
				exp_continue 
			}
		}
	"

	# Update puredb
	echo "Create puredb"
	pure-pw mkdb /opt/pure/secure/pureftpd.pdb
fi

# Option explanations :
#	-c <int> : Allow maximum of clients to be connected
#	-C <int> : Limit the number of simultaneous connections coming from the same IP address.
#	-E : Only allow authenticated users. Anonymous logins are prohibited.
#	-j : If the home directory of a user doesn't exist, automatically create it.
#	-l <puredb:path> : PureDB file
exec /usr/sbin/pure-ftpd -c 5 -C 5 -l puredb:/opt/pure/secure/pureftpd.pdb -j -E