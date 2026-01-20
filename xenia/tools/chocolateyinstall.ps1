$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    destination    = $toolsDir
    FileFullPath64 = Join-Path $toolsDir 'xenia_master.zip'
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -ea 0 -force -path $toolsDir\*.zip

$targetPath = Join-Path $toolsDir "xenia.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\xenia.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = "$Env:USERPROFILE\Desktop\xenia.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}
