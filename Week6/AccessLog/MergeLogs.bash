>AllLogs.txt

logfiles=$(ls "/var/log/apache2/" | grep "access.log" | grep -v "other_vhosts")
for logfile in $logfiles; do
	cat "/var/log/apache2/${logfile}" >> AllLogs.txt
done
