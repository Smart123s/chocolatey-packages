$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.7.0-pre4/JellyfinMediaPlayer-1.7.0-pre4-windows-x86.exe'
  checksum      = '55e82a293b0994ca090e765efc3e30e3e4a115e5a874d542c456b5614d8f7631'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.7.0-pre4/JellyfinMediaPlayer-1.7.0-pre4-windows-x64.exe'
  checksum64    = '47936dc78b4640193c2cb91e5d988685c638b5b17db96ee8a836df120af2c978'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
