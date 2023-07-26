$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.17/webOS.Dev.Manager_1.11.17_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.17/webOS.Dev.Manager_1.11.17_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '3b9ee54ad03ad75598e18dd40ba491d48fb2a2f0d6e4775c9f943d319f734e24'
  checksum64    = '5a058d7bb509e25d33944a3512b913edc60ff1e045d1065ce08fdb5a5bb75aab'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
