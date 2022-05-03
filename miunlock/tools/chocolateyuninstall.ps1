$ErrorActionPreference = 'Stop'
Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'miflash_unlock-en-6.5.224.28.zip'

# Remove start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$programsFilePath = Join-Path $programsPath "Mi Unlock.lnk"
if (Test-Path "$programsFilePath") { Remove-Item "$programsFilePath" }

# Remove desktop icon
$programsPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
$shortcutFilePath = Join-Path "$programsPath" "Mi Unlock.lnk"
if (Test-Path "$shortcutFilePath") { Remove-Item "$shortcutFilePath" }
