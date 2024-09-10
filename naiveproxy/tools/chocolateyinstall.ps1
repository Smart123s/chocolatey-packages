$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v128.0.6613.40-1/naiveproxy-v128.0.6613.40-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v128.0.6613.40-1/naiveproxy-v128.0.6613.40-1-win-x64.zip'

  checksum      = 'a0ac0aab80528d2b6be3946197c423d5316b7d327ebf09cbb2c3865a01d7ffbb'
  checksum64    = 'e5bf67060fcfe6eeb839e06eb2f84d9800ed51008eac3218c254525a6c1af30a'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
