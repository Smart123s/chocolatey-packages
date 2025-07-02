$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.15/webOS.Dev.Manager_1.99.15_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.99.15/webOS.Dev.Manager_1.99.15_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'b748d4168057d44e63ce9317a64c76db9973967b0dad9f43993350dec593d3de'
  checksum64    = '3638b638096a92fef0340f3dad859b099eb8d940cded151c6fd394a08539e234'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
