cd 'C:\Users\champuser\CSI230-01\Week9\Process Management'
ls | where { $_.Name.EndsWith(".ps1") } | Sort -Property CreationTime |
Select-Object Name, CreationTime