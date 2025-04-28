$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.14/webOS.Dev.Manager_1.99.14_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.14/webOS.Dev.Manager_1.99.14_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '8f0e35856919952b0e75640c9c434a6eea889482d9004f6f2423c47e7291fcfe'
  checksum64    = '02948245dc9da37bbfeb4ddafee5a3f8e7bb1f46bbb865b709bcb79c01ed676c'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
