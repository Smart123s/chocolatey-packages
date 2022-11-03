$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64bit      = 'https://mullvad.net/media/app/MullvadVPN-2022.5.exe'

  checksum64    = 'ff5813895e951467e761e24d12d74f49f0b81573961b8388c305afc28c50e7c6'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
