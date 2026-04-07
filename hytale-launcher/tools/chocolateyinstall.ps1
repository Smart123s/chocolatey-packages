$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher.hytale.com/builds/release/windows/amd64/hytale-launcher-installer-latest.exe'

  softwareName  = 'Hytale Launcher'

  checksum64    = 'ECAA3E924619E4AAAC3F2DD66B9B04864A5DEB698080BC67398CBBC8ED81ACF5'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
