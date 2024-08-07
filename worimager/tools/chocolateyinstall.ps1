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
  
  url           = 'https://github.com/worproject/dldserv-mirror/releases/download/13/02/2024/WoR_Release_2.3.1.zip'
  checksum      = 'fc3f6a98e1744adaa8c514514c35176805aac8bb44e16514c2a979683fa0ae1f'
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

