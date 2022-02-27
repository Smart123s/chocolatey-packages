$ErrorActionPreference = 'Stop';
$PackageParameters = Get-PackageParameters

$toolsDir   =	"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$targetPath = Join-Path "$toolsDir" "Turn.Off.Xbox.360.Controller_x$(Get-ProcessorBits).exe"

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

# Add auto start to registry
If (-Not( $PackageParameters.NoAutoStart )) {
  $regPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
  New-ItemProperty -Path "$regPath" -Name "$env:ChocolateyPackageName" -PropertyType String -Value "$targetPath"
}
