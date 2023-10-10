$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://mullvad.net/media/app/MullvadVPN-2023.5.exe'

  checksum64    = '60589fcbeb1c26ec028be1ee1f1d8ee105b0262f5ec9daa841cb016c1980283d'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
