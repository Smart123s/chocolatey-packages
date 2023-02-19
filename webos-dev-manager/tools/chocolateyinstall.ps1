$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.11/webOS.Dev.Manager_1.9.11_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.11/webOS.Dev.Manager_1.9.11_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '6f871b781cb31c16a55adf3a1fb346edd828e17bd7e8b332f4995abffa5ece3f'
  checksum64    = 'ddc304477c6fa7e16e20579c01b6d811493338d4c52cf29a270c327d7d2869d8'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
