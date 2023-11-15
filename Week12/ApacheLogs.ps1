Write-Host "`n1. List all apache logs of XAMPP:`n"
gc C:\xampp\apache\logs\access.log

Write-Host "`n2. List only last 5 apache logs of XAMPP:`n"
gc C:\xampp\apache\logs\access.log -Tail 5

Write-Host "`n3. Display only logs that contain 404 (Not Found) or 400 (Bad Request):`n"
$BadRequests = gc C:\xampp\apache\logs\access.log | Select-String "404" , "400"
$BadRequests

Write-Host "`n4. Display only logs that does NOT contain 200 (OK):`n"
gc C:\xampp\apache\logs\access.log | Select-String "200" -NotMatch

Write-Host "`n5.  From every file with .log extension in the directory, only get logs that contain the word 'error':`n"
$files = gc C:\xampp\apache\logs\*.log | Select-String "error"
$files[5..-1]

Write-Host "`n6. Display only IP addresses from the query you had in Number 4:`n"
$regex = [regex]"[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
$ips = $regex.Matches($BadRequests) | select @{Name="IP"; Expression={ $_. Value } }
$ips

Write-Host "`n7. Count ips from Number 6:`n"
$counts = $ips | Group -Property 'IP' -NoElement
$counts | select Name, Count

Write-Host "`n8. Add a custom column to IP counting. If the count is greater than 3, it will be abnormal, otherwise normal`n"
$CustomCounts = $counts | select Name, Count, @{Name="Decision"; Expression={ if ($_.count -gt 3) {"Abnormal"} else {"Normal"} }}
$CustomCounts

Write-Host "`nBlocking IPs`n"
foreach($ip in $CustomCounts) {
    if ([string] $ip.Decision -eq "Abnormal") {
        $name = [string]$ip.Name
        Write-Host "Blocking $name"
        New-NetFirewallRule -DisplayName "Bad IPs $name" `
        -Direction Inbound -Action Block -RemoteAddress $name

    }
}