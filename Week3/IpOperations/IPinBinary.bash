ip=$(bash GetIPwoPrefix.bash)

IFS='.' read -r -a array <<< "$ip"

for index in "${!array[@]}"
do
	array[index]=$(echo "obase=2;${array[$index]}" | bc)
done

printf '%08d' "${array[@]}"
echo ""
