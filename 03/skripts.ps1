$runningCount = 0
$stoppedCount = 0

foreach ($service in Get-Service) {
    if ($service.Status -eq 'Running') {
        $runningCount++
    }
    elseif ($service.Status -eq 'Stopped') {
        $stoppedCount++
    }
}

Write-Output "Strādājošie servisi: $runningCount"
Write-Output "Apturētie servisi: $stoppedCount"
Write-Output "Kopējā summa: $($runningCount + $stoppedCount)"
