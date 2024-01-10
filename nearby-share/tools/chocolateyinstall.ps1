$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1417.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'http://dl.google.com/release2/Nearby/lzfyfffdbxz5d77pmqebsehaau_1.0.1417.0/better_together.msi'
  checksum64             = '8abcd92559bd3e367c1f787ea5a4bde25b9ca3b4c9d868707f49435a92177500'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
