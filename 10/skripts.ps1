Write-Output "Process count: $((Get-Process).Count)"

$run = 0
$stop = 0
foreach ($s in Get-Service) {
    if ($s.Status -eq 'Running') { $run++ }
    elseif ($s.Status -eq 'Stopped') { $stop++ }
}
Write-Output "Running services: $run, Stopped services: $stop"

$err = Get-WinEvent -FilterHashtable @{ LogName = 'System'; Level = 2; StartTime = (Get-Date).AddHours(-48) } -ErrorAction SilentlyContinue
Write-Output "Error count (48h): $(if ($null -eq $err) { 0 } else { $err.Count })"

Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    Write-Output "Disk $($_.DeviceID) free space: $([Math]::Round($_.FreeSpace / 1GB, 2)) GB"
}
