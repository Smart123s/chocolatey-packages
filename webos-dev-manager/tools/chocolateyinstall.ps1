$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.0/webOS.Dev.Manager_1.12.0_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.0/webOS.Dev.Manager_1.12.0_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '502c1c59f7d9db710b6b0a81442cdad1960bd8c310ac1fe0b827b1b3a7d0a46b'
  checksum64    = '4ed19c4f076aa71ebda63647043a3986809445c26da06f41d2c42b5f1d59e449'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
