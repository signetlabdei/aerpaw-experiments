#!/bin/bash
# create subfolder for the results of the specific experiment

screen -S traffic -dm \
       bash -c "./ueMgenHelperCLArguments.sh $1 \
       | ts $TS_FORMAT \
       | tee $RESULTS_DIR/$LOG_PREFIX\_ue_traffic_log.txt"
