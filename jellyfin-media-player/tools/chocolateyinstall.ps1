$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.11.1/JellyfinMediaPlayer-1.11.1-windows-x86.exe'
  checksum      = 'e83e93e73534ba978881b52759eb9988f0f16d00104853b76337f62623d2b393'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.11.1/JellyfinMediaPlayer-1.11.1-windows-x64.exe'
  checksum64    = '80160fdacd333a3986cfe8d817dce77825bf91413d506d3b5fe628ed4f1d7774'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
