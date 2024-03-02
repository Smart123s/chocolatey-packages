$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.5/webOS.Dev.Manager_1.12.5_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.5/webOS.Dev.Manager_1.12.5_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '950d4fb985bafe4beb30cd440bd423712286a93832e3fad31eaeeb16c2616811'
  checksum64    = '90beddc189153e5b0e95a1db61ed71b4a99d102810778687e46c1b224248f0d4'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
