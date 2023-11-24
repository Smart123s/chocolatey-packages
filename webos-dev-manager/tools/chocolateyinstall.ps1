$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.1/webOS.Dev.Manager_1.12.1_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.12.1/webOS.Dev.Manager_1.12.1_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '1ea2f4ecfbc8fe1f732290bca3a652b622ebba0a665fde08b6f7286c92257098'
  checksum64    = '4aab1013b6e5c3808e36d6eab1a3314e0fb2c022a1ff9eeeaf5032f397d1df0d'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
