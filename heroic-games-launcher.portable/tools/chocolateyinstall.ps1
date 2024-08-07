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

  url64          = 'https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.14.1/Heroic-2.14.1-Portable-x64.exe'
  checksum64     = 'b07b7bcee68ec2f0bfdfe8c4b1b052d44538a407f5a0b0270c8c6bfc9c88c50e'

  checksumType   = 'sha256'

  shortcutFilePath = "$ProgsFolder\Heroic.lnk"
  targetPath       = "$file64Location"
}

Get-ChocolateyWebFile @packageArgs
Install-ChocolateyShortcut @packageArgs
