$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.13.3/webOS.Dev.Manager_1.13.3_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.13.3/webOS.Dev.Manager_1.13.3_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '28da5332daec386973f25906f1e6436e08230d6088a8ca713fb186e61c6a3033'
  checksum64    = 'f5e0a6cc46e4f74c7ea1bffd0e75d5a6de3a2c70376c4025c01417ecbd2284e4'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
