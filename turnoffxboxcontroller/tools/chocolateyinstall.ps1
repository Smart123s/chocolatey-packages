$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters

# https://stackoverflow.com/a/25682508/9767089
Function IIf($If, $Right, $Wrong) {If ($If) {$Right} Else {$Wrong}}

$bits = ( Iif [Environment]::Is64BitOperatingSystem 64 32)

$toolsDir   =	"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$targetPath = Join-Path "$toolsDir" "Turn.Off.Xbox.360.Controller_x$bits.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Turn Off Xbox 360 Controller.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = "$Env:USERPROFILE\Desktop\Turn Off Xbox 360 Controller.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}
