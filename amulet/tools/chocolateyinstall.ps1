$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir

  url64         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.46/Amulet-v0.10.46-Windows-x64.zip'
  checksum64    = '2d2a950d5b5e5e8cdfe324750d226c1bf5f5f6388cd0e5eb8c6296773c494341'

  checksumType  = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path "$toolsDir\Amulet" "amulet_app.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Amulet.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath" -WorkingDirectory $toolsDir
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = "$Env:USERPROFILE\Desktop\Amulet.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath" -WorkingDirectory $toolsDir 
}
