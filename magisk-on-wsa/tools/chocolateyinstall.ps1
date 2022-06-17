$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir

  url64         = 'https://nightly.link/LSPosed/MagiskOnWSA/actions/runs/2515625391/WSA-with-magisk-GApps-pico_2204.40000.19.0_x64_Release-Nightly.zip'
  checksum64    = 'b6ce9d4e0fefe0dd67ae1d0b3f342e34891f09816ebec8705aab0a41a5792ed2'

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
