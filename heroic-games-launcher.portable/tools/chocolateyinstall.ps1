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

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.20.0/Heroic-2.20.0-Portable-x64.exe'
  checksum64     = 'ef45c922741b575e67562b0371ed4908fe5993f629558b15a626d8c8405bb112'

  checksumType   = 'sha256'

  shortcutFilePath = "$ProgsFolder\Heroic.lnk"
  targetPath       = "$file64Location"
}

Get-ChocolateyWebFile @packageArgs
Install-ChocolateyShortcut @packageArgs
