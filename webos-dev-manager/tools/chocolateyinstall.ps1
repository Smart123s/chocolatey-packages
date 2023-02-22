$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.10.0/webOS.Dev.Manager_1.10.0_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.10.0/webOS.Dev.Manager_1.10.0_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '7452eb9a6b4a4bfda7cf8969875562bd4f0534896078e0663653b063ec669343'
  checksum64    = '54c1f56442cab6282b09d3da5c6aa7d12ade80920fe7931d2d75065565d2ebb4'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
