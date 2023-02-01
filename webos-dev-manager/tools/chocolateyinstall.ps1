$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.4/webOS.Dev.Manager_1.9.4_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.4/webOS.Dev.Manager_1.9.4_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '8a284c2afb087040c24e5c28ba7ad5c06ba5952ae0baaa096ac37289af754927'
  checksum64    = 'ef22420d04c8bcbeb166da85a5963e780d63f8c4008b15dfa4f5a62d1e5f4228'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
