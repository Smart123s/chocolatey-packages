$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.1939.4'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://dl.google.com/release2/Nearby/p6ywwl6cbdf47k5snmemcfcpcm_1.0.1939.4/better_together.msi'
  checksum64             = 'd0950d9f530ad37e2d35e069962d1fa19e6694e69ee660b5f92a20eef7ede8d5'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
