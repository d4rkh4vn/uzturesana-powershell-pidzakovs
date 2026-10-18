Get-CimInstance -ClassName Win32_PnPSignedDriver | Where-Object { $_.Manufacturer -notlike "*Microsoft*" -and $_.Manufacturer -ne $null } | Select-Object DeviceName, Manufacturer, DriverVersion | Export-Csv -Path ".\draiveri.csv" -NoTypeInformation -Encoding utf8

(Get-Content -Path ".\draiveri.csv").Count
