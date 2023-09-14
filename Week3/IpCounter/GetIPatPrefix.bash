# Given IP Address $1 and Prefix $2
# Get just address bits of data from IP

IPAddress="$1"
Prefix="$2"

if [[ "$Prefix" == "24" ]]
then 
	IPFromPrefix=$(echo "$IPAddress" | awk -F '.' '{print $1"."$2"."$3"."}')
elif [[ "$Prefix" == "16" ]]
then
        IPFromPrefix=$(echo "$IPAddress" | awk -F '.' '{print $1"."$2"."}')
else
        IPFromPrefix="Invalid Input"
fi

echo "$IPFromPrefix"
