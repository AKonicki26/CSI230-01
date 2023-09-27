# get all active hosts and intrude them A LOT

intrude() {
IP="$1"
#echo $(curl -s --head "${IP}:80/helloworld.html")
if [[ $(curl -s --head "${IP}/helloworld.html" | egrep 'HTTP/.*' | awk ' {print $2} ' | grep "200") ]]
then
	echo "$IP">>webservers.txt
fi


}

>webservers.txt

activeIPs=$(cat './activehosts.txt')
for line in $activeIPs; do
	intrude $line
done
