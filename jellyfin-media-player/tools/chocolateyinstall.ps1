$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.7.1/JellyfinMediaPlayer-1.7.1-windows-x86.exe'
  checksum      = '6fc7e1f5313f17170d48297d0f9c5a05107cf81ccc1db14286ab73377db364d4'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.7.1/JellyfinMediaPlayer-1.7.1-windows-x64.exe'
  checksum64    = '27151aee03cefea6d220348b3275b9474aa169a850745d9066b0f4290a5ff24e'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
