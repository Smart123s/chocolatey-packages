$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.5/webOS.Dev.Manager_1.11.5_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.5/webOS.Dev.Manager_1.11.5_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'aad9504f98077947fa3778216e0a5c283921ef3f69bcbb9c4a90bc968dc65701'
  checksum64    = 'a8d5fdcc3ffd3102d83ffab316b192c2793a308004ffd8c869b9b0e3e9f69e22'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
