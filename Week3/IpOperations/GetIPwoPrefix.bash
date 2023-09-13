#! /bin/bash
# Gets full IP from GetIP.bash
# Truncates prefix and echos it

ip=$(bash GetIP.bash | cut -d "/" -f 1)
echo "${ip}"
