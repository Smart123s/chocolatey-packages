$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v140.0.7339.123-1/naiveproxy-v140.0.7339.123-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v140.0.7339.123-1/naiveproxy-v140.0.7339.123-1-win-x64.zip'

  checksum      = '96a1f833008f2473d1b3a6e44d48a8f5445f088afda64723235975b1add5d272'
  checksum64    = '59d3003793174bbad63fa16e94c4a9cb0a8fd3d12f3a55377cba7c311817590d'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
