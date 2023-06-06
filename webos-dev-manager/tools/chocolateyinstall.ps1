$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.15/webOS.Dev.Manager_1.11.15_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.15/webOS.Dev.Manager_1.11.15_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'a0149bec69ba84b26b168a806f9dfb1378b00474cf3f23e5a924e0a297100447'
  checksum64    = 'adbce28b6ddbcf25693fb49f5fd1025e206780f165d343a445f159e4cd15d9f1'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
