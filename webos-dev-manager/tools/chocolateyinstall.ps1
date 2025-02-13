$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.7/webOS.Dev.Manager_1.99.7_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.7/webOS.Dev.Manager_1.99.7_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'a1e92f1cb49fb17168487ac0df472feccd7271f270072eb4ff72bdf90895190e'
  checksum64    = '9091d1c60d2d5f4916990cfd75930879ef2ff4b29b7054157bc427de9fbe0a2a'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
