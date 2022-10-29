$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir
  
  url32         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.3/Amulet-v0.10.3-Windows-x86.zip'
  checksum32    = '87da25f15c01411e154e7cf8de287416a74906fd8f9dc6ee67d22019706086f7'

  url64         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.3/Amulet-v0.10.3-Windows-x64.zip'
  checksum64    = '946efa9c41b3c69a140870770b7b489adbe09ffb037dfb0600246fb992494143'

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
