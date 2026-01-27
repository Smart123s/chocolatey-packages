$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  softwareName   = 'Heroic 2.19.0'

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.19.0/Heroic-2.19.0-Setup-x64.exe'
  checksum64     = 'f23794ff0f3828e7bf35923fb051cdee0db38f97454ebdd243bef224d1bb2cb1'

  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
