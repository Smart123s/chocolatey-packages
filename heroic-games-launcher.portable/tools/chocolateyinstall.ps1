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

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.18.0/Heroic-2.18.0-Portable-x64.exe'
  checksum64     = 'e2085377fdf7fbaafa952ba1e180c892e08ef7ad5c345425e6827cc3bfab6e15'

  checksumType   = 'sha256'

  shortcutFilePath = "$ProgsFolder\Heroic.lnk"
  targetPath       = "$file64Location"
}

Get-ChocolateyWebFile @packageArgs
Install-ChocolateyShortcut @packageArgs
