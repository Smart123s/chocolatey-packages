﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

### PARAMETERS
If ($PackageParameters.InstallDir) {
  $installDir = $PackageParameters.InstallDir
} Else {
  $installDir = "$toolsDir"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $targetDir = $installDir
  
  url           = 'https://dl.orangedox.com/WoR-Release-2.2.3?dl=1'
  checksum      = '756eaa61e0f7147362800d031e6cc25a8d4de4e050c1381bca4b8c9e732cb58a'
  checksumType  = 'sha256'

}

# Check Windows version (min: 1703)
if ( [Environment]::OSVersion.Version.Build -lt 16299) {
  Write-Host "  ** Windows 10 build 1703 or later is required." -ForeGround Red
  throw
}

Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path "$installDir" "WoR.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
  $programsFilePath = Join-Path "$programsPath" "Windows on Raspberry imager.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath" -WorkingDirectory "$installDir"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
  $programsFilePath = Join-Path "$programsPath" "Windows on Raspberry imager.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath" -WorkingDirectory "$installDir"
}
