$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1533.13'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'http://www.google.com/dl/release2/Nearby/acngz3ub57cmgs7f7m7aov6rhbka_1.0.1533.13/better_together.msi'
  checksum64             = 'aab29487107ecb4d4642638a4a94b46fae17e5d6846bc4f2d8f805fe70db63bb'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
