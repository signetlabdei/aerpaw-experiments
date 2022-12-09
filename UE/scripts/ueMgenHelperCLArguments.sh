#!/bin/bash
#
# This script will start an MGEN flow to the specified destination
#

# Destination IP address
DESTINATION="${DESTINATION:-172.16.0.1}"

while ((1)) ; do 
  echo "Looking for connection..."
  ping  -c 1 -W 1 $DESTINATION >& /dev/null
  rv=$?;
  if (test $rv -eq 0); then
     echo "Got it"
     break;
  fi
  sleep 1;
done

# select file modelX.mgn where X corresponds to the type of traffic of interest
mgen input $PROFILE_DIR"/ProfileScripts/Traffic/model$1.mgn"
