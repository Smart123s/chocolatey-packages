$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.21/webOS.Dev.Manager_1.99.21_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.21/webOS.Dev.Manager_1.99.21_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '15d8550eb45eac6145e451abee526fcf13c2ea91b9d473c140df97e93f7efea1'
  checksum64    = '8dab4ef7876bcb78a92d15e9d59836278e2365a32584b6af4c8501299bcff78d'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
