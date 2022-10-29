$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation  = "$toolsDir"

  url64         = 'https://github.com/wxy1343/MagiskOnWSALocal/releases/download/0701d30/WSA-with-magisk-stable-OpenGApps-pico_2207.40000.8.0_x64_Release-Nightly.7z'
  checksum64    = 'E62BD4690E31C471F2FDD7837476E21894CCDA79429B5C0C9A47630D7A7878FA'

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

Start-ChocolateyProcessAsAdmin -WorkingDirectory "$toolsDir" "$installScript"
