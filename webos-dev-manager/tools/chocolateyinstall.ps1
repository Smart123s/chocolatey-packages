$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.8/webOS.Dev.Manager_1.11.8_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.8/webOS.Dev.Manager_1.11.8_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '0731ec31702c993866d23589d2a8ad180e7a6cc73e20bfe075a48b4e8471e1f4'
  checksum64    = '3493964ab49d19f9cb51a15ef37a9f8529bd6d46bca03da3e4256dc957d69ea5'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
