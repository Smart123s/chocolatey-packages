$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.9.1/upscayl-2.9.1-win.exe'
  checksum64    = 'ddebee8fb28484d144ac8c7e07063354105534797ff0c38fbdbe0beb84a5ec91'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
