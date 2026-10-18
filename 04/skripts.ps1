$services = Get-Service | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -eq 'Stopped' }

if ($null -eq $services) {
    Write-Output "0"
} else {
    Write-Output "Atrasto servisu skaits: $($services.Count)"
    # Run with -WhatIf first (save to whatif.txt), then remove -WhatIf for izvade.txt:
    Get-Service -Name $services.Name | Start-Service -WhatIf
}
