$ErrorActionPreference = 'Stop'
Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'cubeworld-20130624.zip'

# Remove start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$programsFilePath = Join-Path $programsPath "Cube World.lnk"
if (Test-Path "$programsFilePath") { Remove-Item "$programsFilePath" }

# Remove desktop icon
$programsPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
$shortcutFilePath = Join-Path "$programsPath" "Cube World.lnk"
if (Test-Path "$shortcutFilePath") { Remove-Item "$shortcutFilePath" }
