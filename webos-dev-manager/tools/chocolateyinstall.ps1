$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.18/webOS.Dev.Manager_1.11.18_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.18/webOS.Dev.Manager_1.11.18_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '38ae8bf9297f1ee0d5fc59c2c83f99f2296a79016dbd5ea8d06c9f9753c17fb0'
  checksum64    = '1a207f66cd1e8ebfc2c5c2073a042874a0db03b0d9aed7b3b24a257db25de139'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
