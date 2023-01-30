$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.3/webOS.Dev.Manager_1.9.3_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.3/webOS.Dev.Manager_1.9.3_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '9ae1198034288c9342b803dd3c39033fb9e7ac641f987605dcff22a80dfd9ac7'
  checksum64    = '8d3a217bee89a26ec73d5be8a55a226c525f8ad3f12bca88698f688b738b2082'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
