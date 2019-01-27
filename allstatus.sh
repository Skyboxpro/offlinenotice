#!/bin/bash

# Check if skywire node process is running
# -x flag only match processes whose name (or command line if -f is
# specified) exactly match the pattern.


./status.sh

iplist="/home/pi/ips.txt"
while IFS= read -r ip
do
        ssh $ip bash -s <<-EOF
        ./status.sh
EOF

done < "$iplist"
