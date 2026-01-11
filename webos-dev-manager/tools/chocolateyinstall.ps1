$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.17/webOS.Dev.Manager_1.99.17_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.17/webOS.Dev.Manager_1.99.17_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '8ca44f319a934975e4d4e5c8c0eee4e79bfd12ce51de038ab812699d56b859e1'
  checksum64    = '8651b3c4f7c9365c9acd1349f7b0e3143f8cf2f9931f4fefc6db48750e15295d'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
