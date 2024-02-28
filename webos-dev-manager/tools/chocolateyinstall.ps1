$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.4/webOS.Dev.Manager_1.12.4_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.4/webOS.Dev.Manager_1.12.4_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'd5b26604e34c16d01b5c85b14dd001aedbbf2f280a3aba971e62f3474c5705b3'
  checksum64    = 'c6d2f0dfc9dfd4177c4f3d9bed1ef60831d9ca2057d0859e452346af40ad348d'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
