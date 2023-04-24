$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Jellyfin Media Player'

  url           = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.9.1/JellyfinMediaPlayer-1.9.1-windows-x86.exe'
  checksum      = '82eaa72dc5d759a0cdc305fb174f918a0aa74f80483c32012a481d4ccb7a9870'

  url64         = 'https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.9.1/JellyfinMediaPlayer-1.9.1-windows-x64.exe'
  checksum64    = 'cf1fafb6c7b5caf9d7cff0eb9669771b0072fd8ac4689114b65d63942b645624'

  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
