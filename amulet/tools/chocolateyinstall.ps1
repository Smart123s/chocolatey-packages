$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir
  
  url32         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.8/Amulet-v0.10.8-Windows-x86.zip'
  checksum32    = 'c64adf90a8fb808862c9079362a1937e0ee212024c405dd92d31c9d72473ffa8'

  url64         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.8/Amulet-v0.10.8-Windows-x64.zip'
  checksum64    = 'eedac34a15494d682f55b2a15ffc20fa4c8acca7be68745e772a988be6f95556'

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
