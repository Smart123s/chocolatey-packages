$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://mullvad.net/media/app/MullvadVPN-2023.6.exe'

  checksum64    = '1a212857d3edcfe44cfdf0ac50db27a1fb325721f7fd9aa9a1e8fcc8b4bda64c'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
