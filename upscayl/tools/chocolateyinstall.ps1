$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.9.9/upscayl-2.9.9-win.exe'
  checksum64    = 'fde36c91f547ac2f10a8eb5fe96c24819cbfbd294036412d60d3ad2f41c44b99'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
