$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.6/webOS.Dev.Manager_1.11.6_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.6/webOS.Dev.Manager_1.11.6_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '5304910f7163bacaff6c3add3ba310b6befc47928898f04d8e824e334caa99cf'
  checksum64    = '6c25c2a03a31f59c6c69d3d01c578da4c71f8b104489923d73f1e900223f1c44'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
