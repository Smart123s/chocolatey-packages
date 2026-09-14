$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://github.com/mullvad/mullvadvpn-app/releases/download/2026.5/MullvadVPN-2026.5.exe'

  checksum64    = '6b462684336bc0b9b7964846b2635af1723fa9d5817211117e1532ef86a2adc0'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
