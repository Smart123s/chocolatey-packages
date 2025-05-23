$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file64Location = "$toolsDir\Heroic.exe"

# Place shortcuts in appropriate location
$ProgsFolder = [environment]::getfolderpath('Programs')
If ( Test-ProcessAdminRights ) {
  $ProgsFolder = Join-Path ([environment]::getfolderpath('CommonApplicationData')) "Microsoft\Windows\Start Menu\Programs"
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = $file64Location

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.17.0/Heroic-2.17.0-Portable-x64.exe'
  checksum64     = '9b29ee3c0824e490b4a19b234835503590dc9084c75cd47b37fc151c13e499eb'

  checksumType   = 'sha256'

  shortcutFilePath = "$ProgsFolder\Heroic.lnk"
  targetPath       = "$file64Location"
}

Get-ChocolateyWebFile @packageArgs
Install-ChocolateyShortcut @packageArgs
