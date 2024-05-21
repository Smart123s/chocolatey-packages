$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.2/webOS.Dev.Manager_1.99.2_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.2/webOS.Dev.Manager_1.99.2_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'da3f0b73bdc898ba9f22af679779ff971bc9c6e5f65615ed48ddaa0f15dca645'
  checksum64    = '504a8dabfe9132d8d19a4c75843689d74801e435c15bd7442857a768b2ee8f4f'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
