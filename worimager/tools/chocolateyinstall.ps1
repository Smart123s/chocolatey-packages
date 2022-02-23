$ErrorActionPreference = 'Stop';
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
  UnzipLocation = $installDir
  
  url           = 'https://dl.orangedox.com/WoR-Release-2.3.0?dl=1'
  checksum      = '022d8274513030fa7d166837bf34e1489f2963f851dfe011655ed9124d545c59'
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

