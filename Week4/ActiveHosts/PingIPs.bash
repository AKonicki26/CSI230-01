# Read from possibleips.txt
# ping all ips in the file
# if ping was successful, append to activehosts.txt

pingIP() {
IP="$1"
if [[ $(ping -c 1 "$IP" | grep '1 received') != '' ]]
then
	echo "$IP" >> activehosts.txt
fi
}

>activehosts.txt

ips=$(cat 'possibleips.txt')
for line in $ips; do
	echo $line
	pingIP $line
done
