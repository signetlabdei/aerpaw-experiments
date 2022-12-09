#!/bin/bash

export AERPAW_REPO=${AERPAW_REPO:-/root/AERPAW-Dev}
export AERPAW_PYTHON=${AERPAW_PYTHON:-python3.7}
export LAUNCH_MODE=${LAUNCH_MODE:-'TESTBED'}
export EXP_NUMBER=${EXP_NUMBER:-1}

export TS_FORMAT="${TS_FORMAT:-'[%Y-%m-%d %H:%M:%.S]'}"
export LOG_PREFIX="$(date +%Y-%m-%d_%H:%M:%S)"

export PROFILE_DIR=$AERPAW_REPO"/AHN/E-VM/Profile_software"
cd $PROFILE_DIR"/ProfileScripts"

# model 1450:       flow number 1
# model 1451x1451:  flow number 2 and 3
# model 1450x1450:  flow numbers 4 and 5

mdl="1450" # default application model to run
vehicle="drone" # default vehicle to use

while getopts "m:v:" option; do
   case $option in
      m) # choose the application model
        mdl=$OPTARG;;
      v) # choose vehicle
        vehicle=$OPTARG;;
     \?) # Invalid option
        echo "Error: Invalid option"
        exit;;
   esac
done

# create a dedicated folder for the results of this experiments  
mkdir -p "/root/Results/$vehicle/model$mdl"
export RESULTS_DIR="${RESULTS_DIR:-/root/Results/$vehicle/model$mdl}"

./Radio/startRadio.sh
./Traffic/startTraffic.sh

### WARNING: remember to always move the .pcap file in the correct folder 

