$ErrorActionPreference = 'Stop';
Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName "Amulet*.zip"

# Remove start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Amulet.lnk"
if (Test-Path "$programsPath") { Remove-Item "$programsPath" }

# Remove desktop icon
$shortcutFilePath = "$Env:USERPROFILE\Desktop\Amulet.lnk"
if (Test-Path "$shortcutFilePath") { Remove-Item "$shortcutFilePath" }
