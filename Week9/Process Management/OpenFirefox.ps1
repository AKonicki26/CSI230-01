$Current_FireFoxes = Get-Process | where { $_.Name -eq "firefox" } | Select-Object Name
if ($Current_FireFoxes -ne $null) {
    Stop-Process -Name firefox
} else {
    Write-Host "No Firefox open, opening Champlain.Edu"
    [system.diagnostics.process]::Start("firefox", "https://Champlain.edu")
}
