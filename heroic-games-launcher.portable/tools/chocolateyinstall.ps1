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

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.22.3/Heroic-2.22.3-Portable-x64.exe'
  checksum64     = '9425ff65c16aa67338248bdad29342f766c216b95e12e762483d53f521698ea5'

  checksumType   = 'sha256'

  shortcutFilePath = "$ProgsFolder\Heroic.lnk"
  targetPath       = "$file64Location"
}

Get-ChocolateyWebFile @packageArgs
Install-ChocolateyShortcut @packageArgs
