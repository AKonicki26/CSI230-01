cd "C:\Users\champuser\CSI230-01\Week9\Process Management"
ls | where { $_.CreationTime -gt (Get-Date -Year 2023 -Month 9 -Day 24) } | 
Select-Object Name, CreationTime |
Export-Csv ".\NewFiles.csv" -NoTypeInformation