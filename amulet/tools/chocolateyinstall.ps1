$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir
  
  url32         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.5/Amulet-v0.10.5-Windows-x86.zip'
  checksum32    = '4fc2bcd57c36cfef67ae7b23f0c25c733020861168da3d6ee9a04ba5356d64b2'

  url64         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.5/Amulet-v0.10.5-Windows-x64.zip'
  checksum64    = 'bf8de2144cccdf38d2e2e73adcf4781122a8245a2c0f1947e5981c57d8253ca4'

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
