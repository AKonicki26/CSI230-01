Write-Host "#1: Get IP Address from ethernet Interface"
(Get-NetIPAddress -AddressFamily IPv4 | where { $_.InterfaceAlias -ilike "Ethernet0" }).IPAddress

Write-Host "----------------------------------------------------"
Write-Host "#2: Get PrefixLength from ethernet Interface"
(Get-NetIPAddress -AddressFamily IPv4 | where { $_.InterfaceAlias -ilike "Ethernet0" }).PrefixLength

Write-Host "----------------------------------------------------"
Write-Host "#3: Get Win32 library classes that start with net"
Get-WmiObject -list | where { $_.Name.Contains("Win32_Net") } | sort -Property Name

Write-Host "----------------------------------------------------"
Write-Host "#4: Get DHCP Server IP"
Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer 

Write-Host "----------------------------------------------------"
Write-Host "#5: Only Display first DNS server IP"
Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer `
| Format-Table -HideTableHeaders



Write-Host "-----------------Directory Listings-----------------"
Write-Host "#1: Only Display first DNS server IP"

cd "C:\Users\champuser\CSI230-01\Week9\Process Management"

$files = ls

for ($i = 0; $i -le $files.Length; $i++) {
    if ($files[$i].Extension -eq ".ps1") {
        Write-Host $files[$i].Name
    }
}

Write-Host "----------------------------------------------------"
Write-Host "#2: Create Folder if it doesn't already exist"

$folderPath = "C:\Users\champuser\CSI230-01\Week9\PowerShell Basic Lab 1\outfolder\"
if (!(Test-Path -Path $folderPath)) {
    New-Item -ItemType Directory $folderPath
} else {
    Write-Host "Folder Already Exists"
}

Write-Host "----------------------------------------------------"
Write-Host "#3: List all .ps1 files into outfolder csv"

cd "C:\Users\champuser\CSI230-01\Week9\Process Management"

ls | where { $_.Extension.Equals(".ps1") } | 
Export-Csv "..\PowerShell Basic Lab 1\outfolder\ps1Files.csv"

Write-Host "----------------------------------------------------"
Write-Host "#4: Find all CSV files recursivly and change their extensions to .log"

cd "C:\Users\champuser\CSI230-01\Week9\"

$files = Get-ChildItem -Recurse -File
$files | where { $_.Extension.Equals(".csv") } | 
Rename-Item -NewName { [io.path]::ChangeExtension($_.name, "log") }
Get-ChildItem -Recurse -File