$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.16/webOS.Dev.Manager_1.11.16_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.16/webOS.Dev.Manager_1.11.16_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '1d1e44dcc78953a49c2c427312f186ee1a7aeb8317fec177e01198bb83c71c93'
  checksum64    = '3a130e67dba442df5cadd428e2bcd7e2b8bf02696003c8365650790627bdee8c'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
