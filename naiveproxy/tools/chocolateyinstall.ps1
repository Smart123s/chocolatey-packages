$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/klzgrad/naiveproxy/releases/download/v136.0.7103.44-1/naiveproxy-v136.0.7103.44-1-win-x86.zip'
  url64         = 'https://github.com/klzgrad/naiveproxy/releases/download/v136.0.7103.44-1/naiveproxy-v136.0.7103.44-1-win-x64.zip'

  checksum      = 'c78d638d5413444f49b0784695644d3deba5611392c8de90b086fa3fe34edc04'
  checksum64    = '09ff6651a6be4472ef3c4dac2eea3bbf90bb5a49419a938503990a8937aec9f1'
  checksumType  = 'sha256'

  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
