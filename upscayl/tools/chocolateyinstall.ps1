$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.11.0/upscayl-2.11.0-win.exe'
  checksum64    = '8b715b2bbd7d3edd8e8dbcd3a662ea5ed7427fbab23a5e86605068c88e836258'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
