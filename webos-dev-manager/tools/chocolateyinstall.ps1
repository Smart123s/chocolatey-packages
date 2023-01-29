$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.2/webOS.Dev.Manager_1.9.2_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.2/webOS.Dev.Manager_1.9.2_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'f7b387e8fe4b8a9347a6e1a567ce5622a9637b9ec87813705817a18a4798df14'
  checksum64    = '11ac1b0daf08efe475b4a0c8030a2dcb1e0b068ba0c304deb5694a131152a704'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
