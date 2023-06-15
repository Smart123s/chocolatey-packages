$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.972.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'http://www.google.com/dl/release2/Nearby/adz7rp4pwzxwm7b5t24jgw7lxclq_1.0.972.0/better_together.msi'
  checksum64             = '42a266f48af4521e7526481f9a2438965ae98fc22bb3e180d84108c9efd57069'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
