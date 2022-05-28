$ErrorActionPreference = 'Stop';
$url        = 'https://github.com/MultiMC/MultiMC5/releases/download/0.6.13/mmc-stable-win32.zip'
$toolsDir   = "$(Get-ToolsLocation)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'multimc*'
  checksum      = '27573d52e735ec1030a35a723eacb211513757930a99f8178a65d38407008a33'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Write-Host "Creating Start Menu and Desktop shortcuts"
$startmenu = Join-Path $env:programdata "Microsoft\Windows\Start Menu\Programs"
Install-ChocolateyShortcut -ShortcutFilePath $(Join-Path $startmenu "MultiMC.lnk") -TargetPath $(Join-Path $toolsDir "MultiMC\MultiMC.exe")
$desktop = [Environment]::GetFolderPath("Desktop")
Install-ChocolateyShortcut -ShortcutFilePath $(Join-Path $desktop "MultiMC.lnk") -TargetPath $(Join-Path $toolsDir "MultiMC\MultiMC.exe")