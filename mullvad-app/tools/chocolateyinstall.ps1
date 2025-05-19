$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://github.com/mullvad/mullvadvpn-app/releases/download/2025.6/MullvadVPN-2025.6.exe'

  checksum64    = 'ed31237bb1d2907a659e55fb20a3406a363c9c5e3dd3d8add3fd86e4e4a1cb12'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
