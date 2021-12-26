$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.blueskied.com/Fruits_setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Frozen Fruits 1.4'

  checksum      = 'bf0b101cceb359f30eb313d7604184820b15a46bf99265c281b3878e09638dd7'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/SILENT'
}

Install-ChocolateyPackage @packageArgs

# Remove advertisement that links to the developers website
Remove-Item "$HOME\Desktop\Blueskied Games.lnk"

# Remove Desktop shortcut, if requested
If ( $PackageParameters.NoDesktopShortcut ) {
  Remove-Item "$HOME\Desktop\Frozen Fruits.lnk"
}