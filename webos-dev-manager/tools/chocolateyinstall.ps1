$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.5/webOS.Dev.Manager_1.99.5_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.5/webOS.Dev.Manager_1.99.5_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '6cee0acca299a8fac67360cf59fec5c13188c7e92fd12fb9c6fb463a656a47df'
  checksum64    = '906e947dafb76c1eebb1ddb5142c7ebb5c0699d930f55a95b9916a40755d1459'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
