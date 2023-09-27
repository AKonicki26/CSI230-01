# Count how many times people intruded me

date_filter=$(date +"%d/%b/%Y")

intruders=$(cat /var/log/apache2/access.log | grep $date_filter | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c)
echo "$intruders"
