$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.orangedox.com/WoR-Release-2.2.2?dl=1'
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
  
  url           = $url
  checksum      = 'FF536EDB05CD36A528BA786CBEE7BD55993DB182F98DE7156D43C840EF44DC3A'
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

