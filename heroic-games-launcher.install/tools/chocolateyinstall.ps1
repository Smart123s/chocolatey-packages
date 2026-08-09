$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  softwareName   = 'Heroic 2.22.1'

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.22.1/Heroic-2.22.1-Setup-x64.exe'
  checksum64     = '67d0693e113dde712a2fe1e0449b27e59c260bbc8554f30941b492b0362ca6d2'

  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
