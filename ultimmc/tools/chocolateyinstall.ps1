$ErrorActionPreference = 'Stop';
$url        = 'https://nightly.link/AfoninZ/UltimMC/actions/runs/2374155324/mmc-cracked-win32.zip'
$toolsDir   = "$(Get-ToolsLocation)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'multimc*'
  checksum      = '0d5cf3a76ce6bff17daeb86235523df278a53e67834cfe2b8b05a531ef5d6f0c'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Write-Host "Creating Start Menu and Desktop shortcuts"
$startmenu = Join-Path $env:programdata "Microsoft\Windows\Start Menu\Programs"
Install-ChocolateyShortcut -ShortcutFilePath $(Join-Path $startmenu "MultiMC.lnk") -TargetPath $(Join-Path $toolsDir "MultiMC\MultiMC.exe")
$desktop = [Environment]::GetFolderPath("Desktop")
Install-ChocolateyShortcut -ShortcutFilePath $(Join-Path $desktop "MultiMC.lnk") -TargetPath $(Join-Path $toolsDir "MultiMC\MultiMC.exe")
