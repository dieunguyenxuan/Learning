#!/bin/bash                                                                    

sn=${1:-192.168.6}

for host in $(seq 1 255); do
                            
    ttlstr=$(ping -c1 -w1 $sn.$host | grep -o 'ttl=[0-9][0-9]*') || {
        printf "%s is Offline\n" "$sn.$host"
        continue;
    }
    ttl="${ttlstr#*=}"           
    printf "%s is Online, ttl=%d\n" "$sn.$host" "$ttl"
    if [ $ttl -eq 64 ]
            then
                echo "Operating is Linux"
            elif [ $ttl -eq 128 ]
            then
                echo "Operating is Windows"
            else
                echo "Operating is IOS"
                fi

done
