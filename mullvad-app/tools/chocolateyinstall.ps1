$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://mullvad.net/media/app/MullvadVPN-2023.4.exe'

  checksum64    = 'a3dfb832cc4d29a5e2ea70956819d4d6e6b28acf2cce4e7c40d96ad46a53c8a7'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
