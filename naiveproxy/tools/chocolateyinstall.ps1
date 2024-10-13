$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v130.0.6723.40-1/naiveproxy-v130.0.6723.40-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v130.0.6723.40-1/naiveproxy-v130.0.6723.40-1-win-x64.zip'

  checksum      = '89955ec271604103bf4a41d79b9eb00db4393d667d419962305e5b2e06b848ff'
  checksum64    = 'da2eecd58d20cc3855e9159c4dac2dcad5d6d379913e0ac72b882742f82bfcc7'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
