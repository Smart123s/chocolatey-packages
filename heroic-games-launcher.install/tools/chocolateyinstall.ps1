$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  softwareName   = 'Heroic 2.15.1'

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.15.1/Heroic-2.15.1-Setup-x64.exe'
  checksum64     = '0c3ae59491066948a29e01b54d27444833ec86176ef69ad427240885390a17dd'

  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
