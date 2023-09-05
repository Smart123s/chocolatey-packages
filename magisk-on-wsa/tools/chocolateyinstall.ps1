$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation  = "$toolsDir"

  url64         = 'https://github.com/YT-Advanced/WSA-Script/releases/download/v2023-09-03/WSA_2307.40000.6.0_x64_Release-Nightly-with-Magisk-26.1-stable-MindTheGapps-13.0-as-Pixel-5-RemovedAmazon.7z'
  checksum64    = 'c3aa0dd50926a42890e77eda6c5bd5f66a6fdfb3a612dc3986797edcf710d0b2'

  checksumType  = 'sha256'

}

# Check Windows version (min: 22000)
if ( [Environment]::OSVersion.Version.Build -lt 22000) {
  Write-Host "  ** Windows 11 22000 or later is required." -ForeGround Red
  throw
}

Install-ChocolateyZipPackage @packageArgs

# Get name of install script
$installScript = Join-Path "$toolsDir" "Install.ps1"

# Make installer silent
(Get-Content $installScript).Replace('$null = $Host.UI.RawUI.ReadKey' + "('NoEcho,IncludeKeyDown')", '') `
  -Replace 'Start-Process "wsa://com.topjohnwu.magisk"', '' `
  -Replace 'Start-Process "wsa://com.android.vending"', '' `
  -Replace 'Clear-Host', '' | Set-Content $installScript

# Execute install script
cd "$toolsDir" 
./Install.ps1
