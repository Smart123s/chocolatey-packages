$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.993.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'https://www.google.com/dl/release2/Nearby/acyrqme3i6smszcjbr5fyot54xqa_1.0.993.0/better_together.msi'
  checksum64             = 'efbd1e6064fc7544c37033f9f382f9a53480a7c9e1bfb2f3bcb9c653f833f22a'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
