#!/bin/bash
#
# Keepalived check script / Check if services are running on the localhost
#
# Usage: keepcheck.sh [service's! you want to have checked]
# Example: keepcheck.sh sshd nginx mariadb your_custom_script
# Place the script somewhere ( /usr/local/bin/ )
# Prints 0 for "Ok" and 1 for "service is broken"

CHECK=$0
SERVICE=$1

# For each service provided check if it's running
for word in "$@";
do
   # Get state
   OUTPUT=$(ps aux | grep -v grep | grep -v $CHECK |grep $word)
   # If its running $STATE = 1
   if [ "${#OUTPUT}" -gt 0 ] ; then 
      STATE=0
      # If it's not running print 0 and exit
	  else 
	     echo '1'
	  exit 1
   fi
done

# Lastly check if the state is 0/OK! if so print 0
if [ "$STATE" = '0' ]; then
   echo '0'
fi
