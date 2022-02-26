$ErrorActionPreference = 'Stop';

# Remove start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Turn Off Xbox 360 Controller.lnk"
if (Test-Path "$programsPath") { Remove-Item "$programsPath" }

# Remove desktop icon
$shortcutFilePath = "$Env:USERPROFILE\Desktop\Turn Off Xbox 360 Controller.lnk"
if (Test-Path "$shortcutFilePath") { Remove-Item "$shortcutFilePath" }

# Remove auto start from registry
$regPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
Remove-ItemProperty -Path "$regPath" -Name "$env:ChocolateyPackageName" -ErrorAction SilentlyContinue