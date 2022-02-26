$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters

$toolsDir   =	"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$targetPath = Join-Path "$toolsDir" "fabric-installer.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Fabric Installer.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = "$Env:USERPROFILE\Desktop\Fabric Installer.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}
