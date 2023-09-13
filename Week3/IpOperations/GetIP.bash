# Script that runs ip addr and returns only IP address
# ###.###.###.###/24

# Run ipp addr command
# filter for inet
# filter again for brd
# get second "word" in the filter, which is the ip address
# output ip address

ip_address="$(echo "$(ip addr)" | grep inet | grep brd | awk ' { print $2 }')"
echo "$ip_address"
