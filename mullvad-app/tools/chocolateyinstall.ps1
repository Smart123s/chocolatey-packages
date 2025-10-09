$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://github.com/mullvad/mullvadvpn-app/releases/download/2025.10/MullvadVPN-2025.10.exe'

  checksum64    = '0d20898b1c4f5b4e2b9ebc37deadc0abf569666d6fd51e4aa22e8847ebce4ee6'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
