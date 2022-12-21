$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir
  
  url32         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.7/Amulet-v0.10.7-Windows-x86.zip'
  checksum32    = '79ca9556758f977518e57e75ac5df99c4a458a2669ae0fb1438a87cf980e5644'

  url64         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.7/Amulet-v0.10.7-Windows-x64.zip'
  checksum64    = 'c0d3a05b6e30efd631c8a2b7e5ff2e6463024f3a4483be4972444cb0bf56c2f2'

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
