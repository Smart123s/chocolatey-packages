$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.16/webOS.Dev.Manager_1.99.16_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.16/webOS.Dev.Manager_1.99.16_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'd54d9051aa0fb097282c3e19c14600f0a1ae7faa9b4ee0bf4954cfe759fc9be0'
  checksum64    = '5e8d5245219184ee645a6db445dd6cb6e5eccadba2555b1125f0eb7033596f3f'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
