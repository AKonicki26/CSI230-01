$validResponses = @("all", "stopped", "running")

Do {
    $input = Read-Host -Prompt "Would you like to see all, running, or stopped services"
} While (!($input -in $validResponses))

if ($input -eq "all") {
    Get-Service
} else {
    Get-Service | where { $_.Status -ilike $input }
}