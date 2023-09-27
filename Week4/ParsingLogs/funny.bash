# get all active hosts and intrude them A LOT

intrude() {
IP="$1"
bash intruder.bash "$1"
}

activeIPs=$(cat './../ActiveHosts/activehosts.txt')
for line in $activeIPs; do
	intrude $line
done
