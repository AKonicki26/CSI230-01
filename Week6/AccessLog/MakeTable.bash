AllLogs=$(cat AllLogs.txt)

echo "<html>">table.html
echo "<style> table, th, td { border: 1px solid black; } </style>" >> table.html
echo "<body>">>table.html
echo '<table style="width:100%">'>>table.html

#----------------------------------
# Make Headers
echo "<tr>" >> table.html
headers=("IP" "Time" "RequestedPage" "UserAgent")
for header in "${headers[@]}"; do
    echo "<th>${header}</th>" >> table.html
done
echo "</tr>" >> table.html
#----------------------------------
#Fill Table
echo "<tr>" >> table.html
IFS=$'\n'
for log in $AllLogs; do
    echo "<tr>" >> table.html
    # IP
    echo "<td>" >> table.html
    echo $(echo $log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | head -1) >> table.html
    echo "</td>" >> table.html
    # Time
    echo "<td>" >> table.html
    echo $(echo $log | grep -o -E "(0?[1-9]|[12][0-9]|3[01])/[A-Za-z]+/[0-9]+" | head -1) >> table.html
    echo "</td>" >> table.html
    # Requested Page
    echo "<td>" >> table.html
    echo $(echo $log | awk '{print $7}' | head -1) >> table.html
    echo "</td>" >> table.html
    # Agent
    echo "<td>" >> table.html
    echo $(echo $log | grep -o -e "Safari" -e "Mozilla" -e "Chrome" -e "Edge" -e "curl" | head -1) >> table.html
    echo "</td>" >> table.html

    echo "</tr>" >> table.html
done

#----------------------------------

echo "</table>">>table.html
echo "</body>">>table.html
echo "</html>">>table.html

cp table.html /var/www/html/table.html

echo "Done!"
