# For IP address $1
# and for Prefix $2
# Write all possible IP addresses to textfile 
# From XXX.XXX.XXX.1 to XXX.XXX.XXX.254
# or XXX.XXX.0.1 to XXX.XXX.255.254

IPAddress="$1"
Prefix="$2"

> Output.txt 

if [[ "$Prefix" == "24" ]]
then
	BaseIP=$(bash GetIPatPrefix.bash "$IPAddress" "$Prefix")
	for i in {1..254}
	do
		echo "${BaseIP}$i" >> Output.txt
	done
elif [[ "$Prefix" == "16" ]]
then
	BaseIP=$(bash GetIPatPrefix.bash "$IPAddress" "$Prefix")
	for i in {0..255}
        do
                for j in {1..254}
                do
                        echo "${BaseIP}$i.$j" >> Output.txt
                done
        done

else
	echo "Invalid Input"
fi


