﻿$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation  = "$toolsDir"

  url64         = 'https://github.com/wxy1343/MagiskOnWSALocal/releases/download/2119dcf/WSA-with-magisk-stable-OpenGApps-pico_2208.40000.5.0_x64_Release-Nightly.7z'
  checksum64    = 'dfc5746c123be0ed72d8d0a286a048b795853083759b4e39e8c5346bc45e3616'

  checksumType  = 'sha256'

}

# Check Windows version (min: 22000)
if ( [Environment]::OSVersion.Version.Build -lt 22000) {
  Write-Host "  ** Windows 11 22000 or later is required." -ForeGround Red
  throw
}

Install-ChocolateyZipPackage @packageArgs

# Get the name of the extracted folder
$folderName = ($packageArgs.url64 -Split '/' | Select -Last 1).Replace('.7z', '')

# Get name of install script
$installScript = Join-Path "$toolsDir\$folderName" "Install.ps1"

# Make installer silent
(Get-Content $installScript).Replace('$null = $Host.UI.RawUI.ReadKey' + "('NoEcho,IncludeKeyDown')", '') `
  -Replace 'Start-Process "wsa://com.topjohnwu.magisk"', '' `
  -Replace 'Start-Process "wsa://com.android.vending"', '' `
  -Replace 'Clear-Host', '' | Set-Content $installScript

Start-ChocolateyProcessAsAdmin -WorkingDirectory "$toolsDir\$folderName" "$installScript"
