$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.7.0/JellyfinMediaPlayer-1.7.0-windows-x86.exe'
  checksum      = 'd80e9dba488e0d461f2f7c97e66bc4783354167dcb092062f8d043570a2b4bbc'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.7.0/JellyfinMediaPlayer-1.7.0-windows-x64.exe'
  checksum64    = 'ffe42f3b47f2e6220a3345d6fbe0eecfa102deccf509c6c3696bd1fc8d8efedd'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
