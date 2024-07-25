$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://mullvad.net/media/app/MullvadVPN-2024.4.exe'

  checksum64    = '40b6c1d8cb9259d944c737d9e3cdb483bf425335069fd2685cf13629334cc938'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
