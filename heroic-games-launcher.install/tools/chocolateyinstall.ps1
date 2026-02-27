$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  softwareName   = 'Heroic 2.20.1'

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.20.1/Heroic-2.20.1-Setup-x64.exe'
  checksum64     = '4599777ecd631a52674d30e4a4cb3271067c1bae7f6db285be68b1e520f90231'

  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
