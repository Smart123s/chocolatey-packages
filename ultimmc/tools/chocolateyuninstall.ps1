Write-Host "Removing Start Menu and Desktop shortcuts"
$StartMenuShortcut = Join-Path $env:programdata "Microsoft\Windows\Start Menu\Programs\MultiMC.lnk"
$DesktopShortcut = Join-Path $([Environment]::GetFolderPath("Desktop")) "MultiMC.lnk"
if (Test-Path $StartMenuShortcut) 
{
  Remove-Item $StartMenuShortcut
}
if (Test-Path $DesktopShortcut)
{
  Remove-Item $DesktopShortcut
}

$multimcdir = Join-Path "$(Get-ToolsLocation)" MultiMC
if(Test-Path $multimcdir)
{
  Write-Host "Your instances will be deleted (if they live in the MultiMC directory: $multimcdir)" -ForegroundColor Black -BackgroundColor Yellow
  Write-Host "Ctrl-C to cancel" -ForegroundColor Black -BackgroundColor Yellow
  timeout 10
  Remove-Item -path "$multimcdir" -recurse
}