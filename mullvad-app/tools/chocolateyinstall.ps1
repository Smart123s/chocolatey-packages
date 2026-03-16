$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://github.com/mullvad/mullvadvpn-app/releases/download/2026.1/MullvadVPN-2026.1.exe'

  checksum64    = 'e0259b0257696b54bc4005f757f8be37f35b6e30f6aa111c240c7ce53edb7b6d'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
