$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Upscaly'

  url64         = 'https://github.com/upscayl/upscayl/releases/download/v1.5.5/Upscayl-Setup-1.5.5.exe'
  checksum64    = '68c7798a67d5481d96e6c0dbe0740cbc3bb7d2a7da23928aae0b9586e7e58bda'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
