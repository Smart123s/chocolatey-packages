$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.13.0/webOS.Dev.Manager_1.13.0_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.13.0/webOS.Dev.Manager_1.13.0_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '92b943385b0f4986b8de09b567f9c4c20dcde2c3e3d88387886d281dd95d0c81'
  checksum64    = '064c32e7baa09e5a4f217ee08d53ef381701cbc952a8a76858bffe040af7477b'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
