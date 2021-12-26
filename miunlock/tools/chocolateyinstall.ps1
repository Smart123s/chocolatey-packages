$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://miuirom.xiaomi.com/rom/u1106245679/5.5.224.24/miflash_unlock-en-5.5.224.24.zip'
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
  checksum      = 'B88807222879891BCCD2A74FFA10C220F3C51431B794EC94B19646EF0A9E1971'
  checksumType  = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path "$installDir" "batch_unlock.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
  $programsFilePath = Join-Path "$programsPath" "Mi Unlock.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
  $programsFilePath = Join-Path "$programsPath" "Mi Unlock.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsFilePath" -targetPath "$targetPath"
}

