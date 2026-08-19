$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.20/webOS.Dev.Manager_1.99.20_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.20/webOS.Dev.Manager_1.99.20_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '7f460042c1a224c4f336f1a6b8809582194131881acaf1e11b320c856f1671ac'
  checksum64    = '1b4de388a1c6eb03c902bb6d36bdcd717b4737660326ed1876c97fa8148049b7'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
