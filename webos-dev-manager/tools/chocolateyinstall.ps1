$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.10/webOS.Dev.Manager_1.99.10_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.10/webOS.Dev.Manager_1.99.10_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '38040cafccd6160eb1457f1c109af3f536e4a3150c3dc2c8a3ddced8dbcc2347'
  checksum64    = '92903c51b325f1ae3c5f1d2ed783b01331bda35e8b35d39aeb56151ca6ba1d1c'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
