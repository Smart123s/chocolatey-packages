$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/toolbox4minecraft/amidst/releases/download/v4.7/amidst-v4-7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath64= Get-Item $toolsDir\*.exe

  softwareName  = 'Amidst'

  checksum      = '1AB1FC63EC206BFC196177F4E1F4EC0FAD539F1F836B08AA3D6B2239A09C35C6'
  checksumType  = 'sha256'
}

$targetPath = Join-Path "$toolsDir" "amidst-v4-7.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
  $programsFilePath = Join-Path "$programsPath" "Amidst.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
  $programsFilePath = Join-Path "$programsPath" "Amidst.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath"
}