$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.18/webOS.Dev.Manager_1.99.18_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.18/webOS.Dev.Manager_1.99.18_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '39684ed535c6ea397b0e251d6983fb54585a6e0cb731d1bdbd6c8f9d6e71145e'
  checksum64    = '83aa4e171ee4436366bfa0a116f73c951b0009b8316009c92d3d75ee393aa955'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
