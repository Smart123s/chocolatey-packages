$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://github.com/mymonero/mymonero-app-js/releases/download/v1.3.3/MyMonero-Setup-1.3.3.exe'

  softwareName  = 'MyMonero *'

  checksum64    = '125e8086530e66e08ff8aa738e24cd4f83fe7f1efdcef3536739d2c7c5c2d7c2'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
