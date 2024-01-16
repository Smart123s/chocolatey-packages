$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.9.8/upscayl-2.9.8-win.exe'
  checksum64    = '9fb867159886603e08de1e4aaeb0e77bd39eb6bdd765654d9c6bc1d4fc208da9'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
