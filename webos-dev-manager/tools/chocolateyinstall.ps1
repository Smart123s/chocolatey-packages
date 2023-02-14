$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.9/webOS.Dev.Manager_1.9.9_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.9/webOS.Dev.Manager_1.9.9_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '009681f2f974daab6c11b593bf261a3f061fe70398eb110eeb83ab98a8bf1560'
  checksum64    = 'df27a57a4108d3926c476417911a0422fd676d7d64e4f8a500ac554a3c721f6f'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
