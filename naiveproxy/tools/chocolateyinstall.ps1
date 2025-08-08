$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v139.0.7258.62-1/naiveproxy-v139.0.7258.62-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v139.0.7258.62-1/naiveproxy-v139.0.7258.62-1-win-x64.zip'

  checksum      = '1aa376b3bfe987481061dc378657a47a38c19df40011759c07985bc617ab9726'
  checksum64    = '96e7c22d152f6c7107725f01dfb23d2694ceb1b66dd9f6a8f2fa6ca6b479fdaa'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
