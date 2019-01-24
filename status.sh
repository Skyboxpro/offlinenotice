#!/bin/bash

# Check if skywire node process is running
# -x flag only match processes whose name (or command line if -f is
# specified) exactly match the pattern. 

isonline() {

if pgrep -x "node" > /dev/null
then
    status="$HOSTNAME is online"
else
    status="$HOSTNAME is offline"
fi
}

isonline
echo $status
