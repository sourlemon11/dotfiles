#!/bin/bash

# redshift. SAVE YOUR EYES!
# sleep 5;
# reset any previous redshift setting
redshift -x

#if [[ -z $(pgrep redshift) ]]; then
redshift -l 40.5:-74.5 -t 5000:4500
#> /dev/null 2>&1 &
#fi
