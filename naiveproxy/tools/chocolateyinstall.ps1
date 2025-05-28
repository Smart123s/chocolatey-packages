$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v137.0.7151.44-1/naiveproxy-v137.0.7151.44-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v137.0.7151.44-1/naiveproxy-v137.0.7151.44-1-win-x64.zip'

  checksum      = '55a20cc3a6d5ede87f7c0d907d28c317539d36cec6fdfd9a3437a94df9a37fb9'
  checksum64    = 'd54a70516c3b4adec9c595ec6f605a78890fb3e4245bf88401ac154cfd3a26d8'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
