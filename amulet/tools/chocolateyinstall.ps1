$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir
  
  url32         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.2/Amulet-v0.10.2-Windows-x86.zip'
  checksum32    = '72ec064a55110a6e52af373d9b738f521582ab2022c331baa9f88114ce7c8c5f'

  url64         = 'https://github.com/Amulet-Team/Amulet-Map-Editor/releases/download/0.10.2/Amulet-v0.10.2-Windows-x64.zip'
  checksum64    = '4444ddf856e054dc045806f5edb0ea25ae54d748017ac9e8edecd87af0fdca57'

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
