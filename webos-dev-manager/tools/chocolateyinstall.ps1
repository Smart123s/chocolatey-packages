$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.3/webOS.Dev.Manager_1.12.3_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.3/webOS.Dev.Manager_1.12.3_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '2407373fffacd1636562d57f5316b947544cd236d30a6fcb5945d0f022d88a82'
  checksum64    = '2e3bfffe77db86c0a2f5bf9e4df0f206d2b41546a71ee621d581d78ac55d25d2'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
