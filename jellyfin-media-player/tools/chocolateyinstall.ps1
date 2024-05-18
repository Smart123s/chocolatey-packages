$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.10.1/JellyfinMediaPlayer-1.10.1-windows-x86.exe'
  checksum      = '4f5a1659052452b44054a75ac7e52d540e2fe7443a070062840d7bcd30eb1816'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.10.1/JellyfinMediaPlayer-1.10.1-windows-x64.exe'
  checksum64    = '56613a23e532a1aa39ff0b259d13fbc8427aac797ff06700017eb464bff34d03'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
