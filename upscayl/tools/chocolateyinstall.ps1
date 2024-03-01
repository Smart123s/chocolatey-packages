$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.10.0/upscayl-2.10.0-win.exe'
  checksum64    = 'c4a0b2d4829bf425d24a514d3edfc291a9bca3a06daa27a7e6b99e2cb107b9b6'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
