$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.12/webOS.Dev.Manager_1.99.12_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.12/webOS.Dev.Manager_1.99.12_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '9284fd9d2a8db0dbd47f449460d3b98d655d89ec6f814a439acc7f06db12889e'
  checksum64    = '4d8625fb4c370a5e620b3851ad667c5dc5483376edd15d101fd06e413068f5cf'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
