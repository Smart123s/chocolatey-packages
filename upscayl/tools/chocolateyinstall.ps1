$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.15.0/upscayl-2.15.1-win.exe'
  checksum64    = '1ffad9e18ac4fd6ad3731ad708b13a8d60214ddd6a2764444e36df2d7d716acf'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
