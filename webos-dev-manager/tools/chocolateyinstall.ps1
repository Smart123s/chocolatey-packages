$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.10/webOS.Dev.Manager_1.11.10_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.10/webOS.Dev.Manager_1.11.10_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '778c712b356e1452cbf3364dc9b0b1a974b61107e90385bfd74e008e6efd2198'
  checksum64    = 'a07ed039552ba80290488993e1e282de0d26c9a830eb0f9d6232f1a57b2aefd2'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
