$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.8.0/JellyfinMediaPlayer-1.8.0-windows-x86.exe'
  checksum      = 'e362193d3789882d07f941ca98f99d7c9e628aa0d0b9bb06b1aca7eab56aa11c'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.8.0/JellyfinMediaPlayer-1.8.0-windows-x64.exe'
  checksum64    = '9d339212b330995db04439b138d99e865ae422d9f58f3bc180c95c5c48d8c45f'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
