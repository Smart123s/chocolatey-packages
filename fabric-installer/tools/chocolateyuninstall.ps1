$ErrorActionPreference = 'Stop';

# Remove start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Fabric Installer.lnk"
if (Test-Path "$programsPath") { Remove-Item "$programsPath" }

# Remove desktop icon
$shortcutFilePath = "$Env:USERPROFILE\Desktop\Fabric Installer.lnk"
if (Test-Path "$shortcutFilePath") { Remove-Item "$shortcutFilePath" }
