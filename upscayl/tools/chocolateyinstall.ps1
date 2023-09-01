$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.7.5/upscayl-2.7.5-win.exe'
  checksum64    = '34c54ead3884f16f5f48d50bdc7d65d89d3d2fd3e71bc6cc08f3f68093ff637e'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
