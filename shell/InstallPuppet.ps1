$ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin\cinst"
$PuppetInstallPath = "$env:SystemDrive\Program Files\Puppet Labs\Puppet\bin\puppet.bat"

if (!(Test-Path $PuppetInstallPath)) {

  certutil -v -addstore Root "$env:SystemDrive\vagrant\shell\geotrustglobalca.pem"

  & $ChocoInstallPath puppet -y

  & $PuppetInstallPath module install --force chocolatey-chocolatey

}