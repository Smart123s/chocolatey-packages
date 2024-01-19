$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1439.0'
if ($version -eq (Get-NearbyShareVersion)) {
  Write-Host "Nearby Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Nearby Share'
  fileType               = 'MSI'
  url64                  = 'https://edgedl.me.gvt1.com/edgedl/release2/Nearby/lbwkksm5ue76nax4xzsqjohtl4_1.0.1439.0/better_together.msi'
  checksum64             = '6e572d2f665a9e5080c443deba366a5536fb350bff94e1af98af7d01225be5e2'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
