$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir

  url64         = 'https://nightly.link/Howard20181/MagiskOnWSA/actions/runs/2529993418/WSA-with-magisk-GApps-MindTheGapps_2204.40000.19.0_x64_Release-Nightly.zip'
  checksum64    = 'f8cf2daca3b8d178effc92a8418d78ef1699ed88e3eb4b7189970494ed423f3f'

  checksumType  = 'sha256'

}

# Check Windows version (min: 22000)
if ( [Environment]::OSVersion.Version.Build -lt 22000) {
  Write-Host "  ** Windows 11 22000 or later is required." -ForeGround Red
  throw
}

Install-ChocolateyZipPackage @packageArgs

$installScript = Join-Path $toolsDir "Install.ps1"

# Make installer silent
(Get-Content $installScript).Replace('$null = $Host.UI.RawUI.ReadKey' + "('NoEcho,IncludeKeyDown')", '') `
  -Replace 'Start-Process "wsa://com.topjohnwu.magisk"', '' `
  -Replace 'Start-Process "wsa://com.android.vending"', '' `
  -Replace 'Clear-Host', '' | Set-Content $installScript

Start-ChocolateyProcessAsAdmin -WorkingDirectory "$toolsDir" "$installScript"
