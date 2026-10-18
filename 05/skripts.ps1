$events = Get-WinEvent -FilterHashtable @{ LogName = 'System'; Level = 2; StartTime = (Get-Date).AddHours(-48) } -ErrorAction SilentlyContinue

if ($null -eq $events) {
    Write-Output "0"
} else {
    Write-Output "Kļūdu skaits: $($events.Count)"
    $events | Group-Object -Property ProviderName | Sort-Object -Property Count -Descending | Select-Object -First 1
}
