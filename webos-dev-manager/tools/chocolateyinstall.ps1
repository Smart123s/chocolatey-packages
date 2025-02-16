$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.9/webOS.Dev.Manager_1.99.9_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.9/webOS.Dev.Manager_1.99.9_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '6e381da2c500615b09662cd7b945a76c01b99bf0f52381463c3b076069df0dab'
  checksum64    = '6efa8a447f9af42008b9c01b0bf8e4f8f83153d5e9381341d11607f4a51e026d'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
