$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher.hytale.com/builds/release/windows/amd64/hytale-launcher-installer-latest.exe'

  softwareName  = 'Hytale Launcher'

  checksum64    = '58E7450F39C4AEA892D4CCD96756F8F7B169AB485A69A4374B5A95C1894CA3A2'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
