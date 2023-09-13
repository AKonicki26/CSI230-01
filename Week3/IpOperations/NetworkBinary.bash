ip=$(bash IPinBinary.bash)
prefix=$(bash GetIPPrefix.bash)

network="${ip:0:$prefix}"

remainder=$((32-prefix))

for i in $(eval echo "{1..$remainder}")
do
        network="${network}0"
done

echo "$network"

