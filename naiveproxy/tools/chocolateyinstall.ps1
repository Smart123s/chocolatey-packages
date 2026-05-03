$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v148.0.7778.96-2/naiveproxy-v148.0.7778.96-2-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v148.0.7778.96-2/naiveproxy-v148.0.7778.96-2-win-x64.zip'

  checksum      = 'c03fea6905430d0b4a3fbb1fb20d160605b31f6272f17a7bc8dff82345707652'
  checksum64    = '0dfcbe6d3d44ebf2c6ffea1e2b9ef40324888845cef9202fbdb3e2bce09e3ddc'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
