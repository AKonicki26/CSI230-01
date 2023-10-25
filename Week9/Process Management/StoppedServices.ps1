Get-Process |
where { $_.ProcessName.StartsWith("c") -or $_.ProcessName.StartsWith("C") } |
where { $_.StartTime -gt (Get-Date).AddHours(-1) } |
Select name, StartTime 