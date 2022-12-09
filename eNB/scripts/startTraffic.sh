#!/bin/bash

screen -S traffic -dm \
       bash -c "mgen input enb-script.mgn \
       | ts $TS_FORMAT \
       | tee $RESULTS_DIR/$LOG_PREFIX\_enb_traffic_log.txt"
