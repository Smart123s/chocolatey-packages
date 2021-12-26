$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.blueskied.com/Fruits2_setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Frozen Fruits 2'

  checksum      = '4B2D65A04C66E1C91A21F2BB47771109ACC2F46305F3902A2C5F8FD5EDFF3E5A'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/SILENT'
}

Install-ChocolateyPackage @packageArgs

# Remove advertisement that links to the developers website
Remove-Item "$HOME\Desktop\Blueskied Games.lnk"

# Remove Desktop shortcut, if requested
If ( $PackageParameters.NoDesktopShortcut ) {
  Remove-Item "$HOME\Desktop\Frozen Fruits 2.lnk"
}