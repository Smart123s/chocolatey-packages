$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v2.8.1/upscayl-2.8.1-win.exe'
  checksum64    = '8dee28fe129980a101d6ee6c7ee422927573abe8b23dd1889c80b22dc711ece3'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
