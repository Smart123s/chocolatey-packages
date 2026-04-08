$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v147.0.7727.49-1/naiveproxy-v147.0.7727.49-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v147.0.7727.49-1/naiveproxy-v147.0.7727.49-1-win-x64.zip'

  checksum      = 'd6440d9a1a80ba11bcb9238c73243542f10697edfcacf8e5bbc6e1458fc0dcde'
  checksum64    = '2de2cf78bec5d1cd58e5f57d1aa3b6c03b62039aaff1937f427a2dc466b46cbd'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
