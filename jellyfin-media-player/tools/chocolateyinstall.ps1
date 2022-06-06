$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.6.1/JellyfinMediaPlayer-1.6.1-windows-x86.exe'
  checksum      = '5d6d5c8b3765013a95ef8ae15f70c3e05bcd29a55c7da86cf3799872d521f88d'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.6.1/JellyfinMediaPlayer-1.6.1-windows-x64.exe'
  checksum64    = 'cc830a386d07218bcc6a1c95b1f9e105a8c517381a7e3c34677dc2b0f83f63a3'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
