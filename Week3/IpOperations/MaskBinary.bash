
prefix=$(bash GetIPPrefix.bash)

submask=""
for i in $(eval echo "{1..$prefix}")

do
	submask="${submask}1"
done

remainder=$((32-prefix))

for i in $(eval echo "{1..$remainder}")
do
	submask="${submask}0"
done

echo "$submask"
