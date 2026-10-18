Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    Write-Output "Disks: $($_.DeviceID)"
    Write-Output "Kopējais izmērs: $([Math]::Round($_.Size / 1GB, 2)) GB"
    Write-Output "Brīvā vieta: $([Math]::Round($_.FreeSpace / 1GB, 2)) GB"
    
    if (($_.FreeSpace / 1GB) -lt 20) {
        Write-Warning "BRĪDINĀJUMS: Brīvā vieta diskā $($_.DeviceID) ir zem 20 GB!"
    }
}
