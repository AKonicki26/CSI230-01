listIPs() {
	printf '%s\n' $(cat "/var/log/apache2/access.log.1" | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort --unique) > clientIPs.txt
}
#-----------------------------------------------------------------
visitors() {
	clientIPs=$(cat './clientIPs.txt')
	date_filter=$(date +"%d/%b/%Y")
	for line in $clientIPs; do
		echo $(cat "/var/log/apache2/access.log.1" | grep "${date_filter}" | egrep -o $line | sort | uniq -c)
	done
}
#-----------------------------------------------------------------
bad_clients() {
	>blacklisted.txt
	clientIPs=$(cat './clientIPs.txt')
        date_filter=$(date +"%d/%b/%Y")
	current_time_filter=$(date +"%H")
	later_time_filter=$((current_time_filter+1))
	for line in $clientIPs; do
                bads=$(cat "/var/log/apache2/access.log.1" | egrep "${date_filter}:${current_time_filter}" | grep -e "400" -e "403" -e "404" | egrep -o $line | sort | uniq -c | awk ' {print $1 } ')
		if [[ $bads > 3 ]]
		then
			echo $line>>blacklisted.txt
		fi
        done

}
#-----------------------------------------------------------------
histogram() {
	printf "%s\n" $(cat "/var/log/apache2/access.log.1" | grep "200" | egrep -o "(0?[1-9]|[12][0-9]|3[01])/[A-Za-z]+/[0-9]+" | sort | uniq -c)
}
#-----------------------------------------------------------------
block() {
	blacklist=$(cat "./blacklisted.txt")
	for line in $blacklist; do
		iptables -A INPUT -s $line -j DROP
	done
	iptables -L INPUT -v -n
}
#-----------------------------------------------------------------
reset_blocks() {
	iptables -F
	echo $(iptables -L INPUT -v -n)
}
#-----------------------------------------------------------------
GetInput() {

read UserInput

echo ""

if [[ "$UserInput" == "1" ]]
then
	listIPs
elif [[ "$UserInput" == "2" ]]
then    
	visitors
elif [[ "$UserInput" == "3" ]]
then
	bad_clients
elif [[ "$UserInput" == "4" ]]
then
	block
elif [[ "$UserInput" == "5" ]]
then
	reset_blocks
elif [[ "$UserInput" == "6" ]]
then
	histogram
else
	exit 0
fi
}
#-----------------------------------------------------------

# Main Loop
while true
do

echo "1 - Number of Visitors"
echo "2 - Display Visitors"
echo "3 - Show Bad Visits"
echo "4 - Block Bad Visits"
echo "5 - Reset Block Rules"
echo "6 - Show Visit Histogram"
echo "7 - Quit"

echo ""
GetInput
echo ""
done

