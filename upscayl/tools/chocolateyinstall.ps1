$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.8.5/upscayl-2.8.5-win.exe'
  checksum64    = '7df8785d5ce586564cd654df8adbadf466f40cf5e8788af756d5015e2dd5ac6c'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
