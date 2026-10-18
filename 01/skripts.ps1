Write-Output "Datora nosaukums: " (Get-CimInstance -ClassName Win32_ComputerSystem).Name
Write-Output "Operētājsistēmas nosaukums: " (Get-CimInstance -ClassName Win32_OperatingSystem).Caption
Write-Output "Būvējuma numurs: " (Get-CimInstance -ClassName Win32_OperatingSystem).BuildNumber
Write-Output "PowerShell versija: " $PSVersionTable.PSVersion
Write-Output "Pašreizējais datums un laiks: " (Get-Date)
Write-Output "Aktīvo procesu skaits: " (Get-Process).Count
