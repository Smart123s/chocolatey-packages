$ErrorActionPreference = 'Stop'
Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'WoR_Release_2.2.3.zip'

# Remove start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$programsFilePath = Join-Path $programsPath "Windows on Raspberry imager.lnk"
if (Test-Path "$programsFilePath") { Remove-Item "$programsFilePath" }

# Remove desktop icon
$programsPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
$shortcutFilePath = Join-Path "$programsPath" "Windows on Raspberry imager.lnk"
if (Test-Path "$shortcutFilePath") { Remove-Item "$shortcutFilePath" }
