$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.9.0/JellyfinMediaPlayer-1.9.0-windows-x86.exe'
  checksum      = '24d4a33a9b6b24b63e6080b4d7b8e8cbe5756bac72bffe1fdc1ff70d49aaaca2'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.9.0/JellyfinMediaPlayer-1.9.0-windows-x64.exe'
  checksum64    = '9a09d299fbb177735f68cc6ba0973e257102c86c5382417e0b5ca82770d0ae4c'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
