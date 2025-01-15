$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v132.0.6834.79-1/naiveproxy-v132.0.6834.79-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v132.0.6834.79-1/naiveproxy-v132.0.6834.79-1-win-x64.zip'

  checksum      = 'b589da7157bc47c05bdf8a07881014e1dfb7015e4375bcf5051dcc0727c16983'
  checksum64    = '75dc8c1d6dc20563ff2859a8d2955c52475bb60257a3dc470af80bede6a04495'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
