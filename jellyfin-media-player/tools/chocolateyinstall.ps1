$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.11.0/JellyfinMediaPlayer-1.11.0-windows-x86.exe'
  checksum      = '116ce71910d4fbb0b492766cffbdb274bb312a6d84cd977c9aa5229ee3c7c91f'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.11.0/JellyfinMediaPlayer-1.11.0-windows-x64.exe'
  checksum64    = 'ac3095aab00bb99336f8a3bd30e89cb54b2c59e523c7da1d735bb2ad81f2cded'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
