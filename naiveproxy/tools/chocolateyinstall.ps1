$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v154.0.8037.49-1/naiveproxy-v154.0.8037.49-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v154.0.8037.49-1/naiveproxy-v154.0.8037.49-1-win-x64.zip'

  checksum      = 'd2de461365e3a841b57d30eab0fee9214133ea7b0db6ceecb1ea5698ca7b396e'
  checksum64    = 'f467cf9e99698edf09ece0fc52bfef5d059cd84af6623ab91ea6c770ad121e3a'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
