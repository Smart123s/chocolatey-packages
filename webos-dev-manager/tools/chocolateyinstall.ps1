$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.13/webOS.Dev.Manager_1.99.13_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.13/webOS.Dev.Manager_1.99.13_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '6458c42f0102b35f261be2bd8a76f88f7a7259e0e17a75965b478fbdcc453a0d'
  checksum64    = '68d963647ef07da260c596273b2ff8cbda3c2533d4cb5c48e405637ac6d9fe61'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
