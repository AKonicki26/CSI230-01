GetInput() {

read UserInput

echo ""

if [[ "$UserInput" == "1" ]]
then
	echo $(bash GetIPwoPrefix.bash)
elif [[ "$UserInput" == "2" ]]
then    
	echo $(bash IPinBinary.bash)
elif [[ "$UserInput" == "3" ]]
then
	echo $(bash MaskBinary.bash)
elif [[ "$UserInput" == "4" ]]
then
	echo $(bash NetworkBinary.bash)
elif [[ "$UserInput" == "5" ]]
then
	echo "Enter an IP to Convert: "
	read IPtoConvert
	echo $(bash BinaryIPtoIP.bash "$IPtoConvert")
else
	exit 0
fi
}

while true
do

echo "1 - Print your IP Address"
echo "2 - Print your IP Address in Binary"
echo "3 - Print your Network Mask in Binary"
echo "4 - Print your Network Address in Binary"
echo "5 - Convert a binary address to an IP Address"
echo "6 - Quit"

echo ""
GetInput
echo ""
done


