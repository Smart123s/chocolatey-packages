$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v134.0.6998.39-1/naiveproxy-v134.0.6998.39-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v134.0.6998.39-1/naiveproxy-v134.0.6998.39-1-win-x64.zip'

  checksum      = '2a7f74b6bfe05d05379bcb58b20729e8bda3271c70e207ab5172e645bafa8ab4'
  checksum64    = 'd9d03f430fbc6589954cb28d0b488b99b9ea42fc0ab0ca1ae189938bc438a99f'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
