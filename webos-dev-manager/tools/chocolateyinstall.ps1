$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.14/webOS.Dev.Manager_1.11.14_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.11.14/webOS.Dev.Manager_1.11.14_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'f5e4a72ca51c571b6694ed14b7327a130e40eb66558d349def9da4cdca00acec'
  checksum64    = 'c29525501266d4257fed0055c1781c6da84ddd1018b47096edb0feb4e8f63614'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
