$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.787.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'https://www.google.com/dl/release2/Nearby/acuoy3ppt3op4nop46bcpcgxyj4a_1.0.787.0/better_together.msi'
  checksum64             = 'c135eb23fe4cebf4ba6a3b6f1c986aea366b050d0846f56c01c2cc7339217c0e'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
