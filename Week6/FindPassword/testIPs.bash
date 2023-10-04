
>GoodIPs.txt

IP_List=$(cat IP_List.txt)
for IP in $IP_List; do
	if [[ $(curl $IP | grep -v "Failed") ]]
	then
		echo $IP >> GoodIPs.txt
	fi
done
