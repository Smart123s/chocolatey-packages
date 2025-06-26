$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v138.0.7204.35-1/naiveproxy-v138.0.7204.35-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v138.0.7204.35-1/naiveproxy-v138.0.7204.35-1-win-x64.zip'

  checksum      = '963f77c974b7c15e3d2c872f068831ae75c67f3e83a8f1bd381210afedfc28b8'
  checksum64    = '306c5e067a8150bcf5132cdf8605d29d40c5e318523a61d5e22c75317431caa0'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
