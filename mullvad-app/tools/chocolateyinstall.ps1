$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://github.com/mullvad/mullvadvpn-app/releases/download/2025.12/MullvadVPN-2025.12.exe'

  checksum64    = '6d462d2d1848613c4e7cfc1cfc628e8221dd07ece3a680e1acbb22dfb28af580'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
