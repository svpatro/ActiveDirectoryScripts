# This script removes the computer with the name "EXAMPLE_ from AD"

$adcomputerinfo = Get-ADComputer -Filter 'Name -Like "E*"'

$adcomputerinfo

Remove-ADComputer -Identity "Example_"

Write-Host "Computer has successfully been removed."
