$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v135.0.7049.38-1/naiveproxy-v135.0.7049.38-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v135.0.7049.38-1/naiveproxy-v135.0.7049.38-1-win-x64.zip'

  checksum      = 'cbb16acf964f217b3085e6d7dfc4e4f578c5c0c68043674ac11fce6bb1f69edc'
  checksum64    = 'f31d3acd25a64e5579f35bd747cab37c6c16c5c91da964acf6e646478e0e32e3'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
