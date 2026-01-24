$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher.hytale.com/builds/release/windows/amd64/hytale-launcher-installer-latest.exe'

  softwareName  = 'Hytale Launcher'

  checksum64    = 'D7AC9D5683C1B8ECAE48E6E9D02F14AF6804F35DE2FDB26A75A6B02FCB034DAB'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
