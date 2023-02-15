$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.10/webOS.Dev.Manager_1.9.10_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.10/webOS.Dev.Manager_1.9.10_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = '4842569a358923a21a2201e49f52270a11de999d1a603e78c8d9054baa009c8d'
  checksum64    = '5909673c8c0cd22fa1829291fd936ed49fef6a86ec49b61b208896141ea75873'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
