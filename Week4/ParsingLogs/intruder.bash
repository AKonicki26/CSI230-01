IP="192.168.3.43"
count=0

for i in {1..20}
do
	if [[ $(curl -s --head "${IP}/helloworld.html"| grep "200") ]]
	then
		count=$((count+1))
	fi
done

echo "Intruded ${IP} ${count} times"
