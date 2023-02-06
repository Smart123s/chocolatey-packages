$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.6/webOS.Dev.Manager_1.9.6_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.6/webOS.Dev.Manager_1.9.6_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '4811e2d38f60c4661c6c9f0ffc09285f7befa34640bee27104a0c4b4cd00eb2b'
  checksum64    = '872bfa320b66bbd7253fda351a68ff19c669e1d609d718414ad732d7f0241728'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
