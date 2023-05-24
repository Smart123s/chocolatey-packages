$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.891.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'https://dl.google.com/release2/Nearby/acyk7w4jl3q5kswdntu27uuwtcza_1.0.891.0/better_together.msi'
  checksum64             = '1117ea68d80f498c43ea6c3979e060ab3189950938b8116a56d1025f5a9d5b59'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
