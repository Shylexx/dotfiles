#!/bin/bash
SEARCH="Razer Razer Viper Ultimate Dongle"
if [ "$SEARCH" = "" ]; then 
    exit 1
fi
ids=$(xinput --list | rg pointer | awk -v search="$SEARCH" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )

for i in $ids
do
    xinput set-prop $i "Coordinate Transformation Matrix" 0.3 0 0 0 0.3 0 0 0 1
done
