$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2757.0'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://dl.google.com/release2/Nearby/adxmodzecvn47pv26t6p7cldf2ja_1.0.2757.0/better_together.msi'
  checksum64             = '9b1c6f99fa9e317622a969f5a25e4187263be26891ad849daa58e254279574b1'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
