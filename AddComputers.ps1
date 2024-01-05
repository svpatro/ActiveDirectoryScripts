#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted 
#$excel = New-Object -ComObject excel.application
#$excel.visible = $True

# Comment: If your computer is connected to a domain, this script will add 5 computers to the Computers AD Directory
# The computers will be named accordingly:
# EXAMPLE_1
# EXAMPLE_12
# EXAMPLE_123
# EXAMPLE_1234
# EXAMPLE_12345

Import-Module ActiveDirectory

$computerName = "EXAMPLE_"
$computersContainerPath = (Get-ADDomain).ComputersContainer

for ($i; $i -le 5; $i++){

    $computerName = $computerName += $i

    $newComputer = New-ADComputer -Name $computerName -Path $computersContainerPath -Enabled $True -PassThru -ErrorAction Stop
    Write-Host "Computer Object '$computerName' created successully in '$computersContainerPath'."

}

# These commands will retrieve and print those objects from AD, if they exist.

$adcomputerinfo = Get-ADComputer -Filter 'Name -Like "E*"'

$adcomputerinfo