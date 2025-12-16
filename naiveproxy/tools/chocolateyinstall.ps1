$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v143.0.7499.109-1/naiveproxy-v143.0.7499.109-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v143.0.7499.109-1/naiveproxy-v143.0.7499.109-1-win-x64.zip'

  checksum      = '023534610f2d0f035e940507a504148ec6e163642f43103e7ef3754eb382385c'
  checksum64    = 'af43d355af48a7b108a24f4a8526989adc7bdff89a3f5586afd7ab1d5c24626b'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
