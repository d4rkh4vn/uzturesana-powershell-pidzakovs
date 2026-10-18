Measure-Command -Expression {
    Get-Service -Name "Spooler"
}

Measure-Command -Expression {
    Get-CimInstance -ClassName Win32_Service -Filter "Name='Spooler'"
}
