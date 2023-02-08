$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.7/webOS.Dev.Manager_1.9.7_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.7/webOS.Dev.Manager_1.9.7_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '4e41bb0340517d1a6fb4671e6b86a2e0da60f542c20491580d330cd87d67c0c8'
  checksum64    = 'dcb5b537d8cfefa0ab9d0d730d214d91fe3f69f528a5f8cd24b0596728f148f3'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
