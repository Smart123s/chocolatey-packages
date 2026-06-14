$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v149.0.7827.114-1/naiveproxy-v149.0.7827.114-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v149.0.7827.114-1/naiveproxy-v149.0.7827.114-1-win-x64.zip'

  checksum      = 'bee258d060fbe366b5f947af2279e099339254de36b4f09638c7f8731be43820'
  checksum64    = '50f8138a1cfaeaf28866cb9f7ff25fbd92d2b3bd642885e95131f7d56ebf1086'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
