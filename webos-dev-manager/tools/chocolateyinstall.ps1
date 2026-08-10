$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.19/webOS.Dev.Manager_1.99.19_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.19/webOS.Dev.Manager_1.99.19_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'cef00cdb9b45f4613b2f5d4a72ac97f7b717506eb618fe849207b23165b6d701'
  checksum64    = '5d112133f013fabdf290b1a6045f9e7586623babb82859f03ffde76240fa9bb7'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
