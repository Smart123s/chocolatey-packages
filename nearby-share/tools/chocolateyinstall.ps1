$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1184.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'https://dl.google.com/release2/Nearby/n4prd7y3gcnr6jof65fenwlng4_1.0.1184.0/better_together.msi'
  checksum64             = 'f68b18de3aa9c49680185173d60990a31e01644b19800e4f3dc00b728f3010c0'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
