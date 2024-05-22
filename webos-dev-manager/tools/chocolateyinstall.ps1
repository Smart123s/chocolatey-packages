$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.3/webOS.Dev.Manager_1.99.3_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.3/webOS.Dev.Manager_1.99.3_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'b5e11fe7343f16d43ca727e27838fc06b3849c187489e9bf5cc5383bceb4cbb6'
  checksum64    = '674f1d85f3290ea4a0a019824e8ee3cf270b18929138b40273dfd7d4da80c442'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
