# Create a PowerShell script that asks user 
#which logs to export (like in the slides), 
# then exports to a csv file.

cd C:\Users\champuser\Desktop\

Get-Eventlog -list

$readLog = Read-host -Prompt "Please select a log to output to a CSV file"

Get-Eventlog -LogName $readLog | Export-Csv -NoTypeInformation -Path "C:\Users\champuser\CSI230-01\Week8\$readLog.csv"