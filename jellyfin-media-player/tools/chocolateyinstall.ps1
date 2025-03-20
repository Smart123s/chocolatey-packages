$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.12.0/JellyfinMediaPlayer-1.12.0-windows-x86.exe'
  checksum      = 'b8de23543a8797f48ada6ac657cf48f2fdd306170d045afb06edbc5432ef0eb6'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.12.0/JellyfinMediaPlayer-1.12.0-windows-x64.exe'
  checksum64    = 'ad1e39a997bcaca481e54f026f04bca324aecf7a84d00da1e7c43d1eb5ee7014'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
