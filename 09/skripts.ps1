try {
    Get-CimInstance -ClassName Win32_Process | ForEach-Object {
        $_.GetOwner()
    }
}
catch {
    Write-Error "Error due to permission limitations."
    Write-Output $_.Exception.Message
}
