IPtoConvert="$1"

ip1=$((2#"${IPtoConvert:0:8}"))
ip2=$((2#"${IPtoConvert:8:8}"))
ip3=$((2#"${IPtoConvert:16:8}"))
ip4=$((2#"${IPtoConvert:24:8}"))

echo "$ip1"."$ip2"."$ip3"."$ip4"



