$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v131.0.6778.86-1/naiveproxy-v131.0.6778.86-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v131.0.6778.86-1/naiveproxy-v131.0.6778.86-1-win-x64.zip'

  checksum      = '58dac204d89d19594a96c1744bd29926349777087c2bcd36456f12cf2eac7d70'
  checksum64    = '951ff09b381b4e32159741d6d2fd3d34378e1fced6fb47d0e5a1d38ebb6e4960'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
