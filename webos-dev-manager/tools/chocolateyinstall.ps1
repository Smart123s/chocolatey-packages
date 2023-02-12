$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.8/webOS.Dev.Manager_1.9.8_x86_en-US.msi'
  url64         = 'https://github.com/webosbrew/dev-manager-desktop/releases/download/v1.9.8/webOS.Dev.Manager_1.9.8_x64_en-US.msi'

  softwareName  = 'webOS Dev Manager'

  checksum      = 'a20bf3f839dedf2388080e39aec38581cf4e20549aa450246e41aa767e1774d3'
  checksum64    = 'aaa456b2f1fb4836fa0b702f158af44d048c155348314d89655f2f6e76ce7a0b'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
