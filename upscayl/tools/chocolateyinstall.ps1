$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.15.0/upscayl-2.15.0-win.exe'
  checksum64    = '203e4479c37547d1c5492a7bf2cbf98c6a40a61a9276eadacf04299e36f8a6ca'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
