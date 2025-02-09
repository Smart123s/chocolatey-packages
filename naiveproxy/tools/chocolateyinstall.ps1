$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v133.0.6943.49-1/naiveproxy-v133.0.6943.49-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v133.0.6943.49-1/naiveproxy-v133.0.6943.49-1-win-x64.zip'

  checksum      = 'd36682b02af7108d7f7357d2ee79f67448f7b27f1c057b86db1c0aafa0fe945c'
  checksum64    = '3de29cd453d15432778b4e342f9abda36211a48c9a0980798b572aee2a0433d9'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
