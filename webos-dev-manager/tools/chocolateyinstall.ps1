$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.13/webOS.Dev.Manager_1.11.13_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.13/webOS.Dev.Manager_1.11.13_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '6182988e5215c4bb340522150656f3a89346d6cb04fac364a714e4f2a5474926'
  checksum64    = '27e03f76ec5b73d738a404acffd73a80585a8fb3fef217276b0c3197bc936365'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
