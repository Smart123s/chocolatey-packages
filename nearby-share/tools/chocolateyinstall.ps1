$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1307.2'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'http://dl.google.com/release2/Nearby/adkh6mub7nq64khy5awufhbdhpea_1.0.1307.2/better_together.msi'
  checksum64             = '44a01bae0a2942919cdb3060472a3ea14d75bc1fdbb9c548d38386337ab73b7b'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
