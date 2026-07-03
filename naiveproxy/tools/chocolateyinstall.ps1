$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v150.0.7871.63-1/naiveproxy-v150.0.7871.63-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v150.0.7871.63-1/naiveproxy-v150.0.7871.63-1-win-x64.zip'

  checksum      = '8059c126fd98a117d89d9d5b54a07756fe944c3257013866c302b9999c02c530'
  checksum64    = 'd09e35f9fde6206a775a1b930d7d8252053bee1408ee1c910b5681346c68d1a1'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
