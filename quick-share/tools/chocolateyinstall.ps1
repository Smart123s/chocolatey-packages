$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2527.0'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://dl.google.com/release2/Nearby/o2jg3mmmruq4r5vmifvettngce_1.0.2527.0/better_together.msi'
  checksum64             = '615c5760ce1c556f19ba40ac0a2ccc706a8639f30ea42f66478608cd0d68581a'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
