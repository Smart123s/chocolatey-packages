$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.8/webOS.Dev.Manager_1.99.8_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.8/webOS.Dev.Manager_1.99.8_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '91a2d4a55bde279773c3184d93911cb2fc75254f89e209c33092490d4a35e6f2'
  checksum64    = '688bec21cefcca167ac8ecf7c39d2b14d27a091f21d57f5062506f9c9b2803f7'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
