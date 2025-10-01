$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$version = '1.0.2351.1'
if ($version -eq (Get-QuickShareVersion)) {
  Write-Host "Quick Share $version is already installed."
  return
}

$packageArgs = @{
  packageName            = 'Quick Share from Google'
  fileType               = 'MSI'
  url64                  = 'https://edgedl.me.gvt1.com/edgedl/release2/Nearby/nzycihmex74ey4qip3kn2navfq_1.0.2351.1/better_together.msi'
  checksum64             = 'bbba569461c8339acd7b23aec6a21095abb955db3cccbe91af26efcca07e39a9'
  checksumType64         = 'sha256'
  silentArgs             = "/quiet /norestart"
  validExitCodes         = @(0)
}

Install-ChocolateyPackage @packageArgs
