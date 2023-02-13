$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.8.1/JellyfinMediaPlayer-1.8.1-windows-x86.exe'
  checksum      = '980c4789f49d56d7a1f43ceeecaddd6fb95a95608e3e3d02769ee52220bee618'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.8.1/JellyfinMediaPlayer-1.8.1-windows-x64.exe'
  checksum64    = '829e797ecd9bbde5c362cad90730caed5e89406eb01d13913ffbafe019bbeabd'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
