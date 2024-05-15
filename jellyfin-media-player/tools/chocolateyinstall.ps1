$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.10.0/JellyfinMediaPlayer-1.10.0-windows-x86.exe'
  checksum      = '5e4963d3f3d2f4a1fccec5e5fc0cfd192cfd1bfcb1c0a48d3eab483db610d3b5'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.10.0/JellyfinMediaPlayer-1.10.0-windows-x64.exe'
  checksum64    = '4b38efe02a4a526317bda2ff4b9522657442213e9eebc844be9431a88d841006'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
