$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v129.0.6668.81-1/naiveproxy-v129.0.6668.81-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v129.0.6668.81-1/naiveproxy-v129.0.6668.81-1-win-x64.zip'

  checksum      = 'c2bbef731718017d284b719a5fb1e78b44ef01bebb4aab869dd956844728f9c3'
  checksum64    = '69aefa99a38a18722f1c809c66dcad7d13cf30fed345842d2357dcc4158f9390'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
