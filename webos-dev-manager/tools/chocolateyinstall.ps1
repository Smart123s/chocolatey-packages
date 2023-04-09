$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.9/webOS.Dev.Manager_1.11.9_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.9/webOS.Dev.Manager_1.11.9_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '949604a573a1486a2218feafeb641ba1707403d6ccc16d0170aa11ac62bcc330'
  checksum64    = 'e02c1bf778f59b478139820bdde0a0bcbf101f42d3faaf4fd4607e88ade09e03'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
