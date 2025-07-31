$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2268.3'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://dl.google.com/release2/Nearby/ad7jwucicsxkyg4jgpbcwpytykya_1.0.2268.3/better_together.msi'
  checksum64             = '422ce12c9fcbaa30cf28fc49137d2f51283c346560a7c3b16e5a06fbc2ea5787'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
