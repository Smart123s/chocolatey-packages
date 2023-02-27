$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.10.1/webOS.Dev.Manager_1.10.1_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.10.1/webOS.Dev.Manager_1.10.1_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '0cfe5a5b776991b0e03066780df3aec55e42967180df23259485a285cc194cd5'
  checksum64    = 'e71617875e02268c0327337805c5da172210a151a8bac547ac62c60c61ede263'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
