$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  softwareName   = 'Heroic 2.16.1'

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.16.1/Heroic-2.16.1-Setup-x64.exe'
  checksum64     = '4f7ccbb76c11fee5d01715c4691db507d41bd4b38901f5f318ae6559046bf72a'

  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
