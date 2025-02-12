$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.6/webOS.Dev.Manager_1.99.6_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.6/webOS.Dev.Manager_1.99.6_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '1c5e616a827370829d1959e6941dde5269671fb4e3d8b2f7738cadb6068e0dde'
  checksum64    = '2ff89e56eaf59ed6fdbb37984a374d23e266b8829976f6210a86ac700f1da215'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
