$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.11/webOS.Dev.Manager_1.99.11_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.11/webOS.Dev.Manager_1.99.11_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'd68c9bc40a7bb01c739cb6760df86c5e3f9628a015ed3a6160497f834b951dfa'
  checksum64    = '785b46480766ec90a192815104374a0109884b11b44fd164fb634d2c011e0c72'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
