$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2002.2'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://www.google.com/dl/release2/Nearby/n5wvbxjbele4gfuhbyviiyftdm_1.0.2002.2/better_together.msi'
  checksum64             = '1c8c66116f604026564e5d342057d29787ac805e83d97564dc38db710234b833'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
