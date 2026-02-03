$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir
  
  url64         = 'https://github.com/r4dius/Iso2God/releases/download/1.6.0/iso2god-v1.6.0.zip'
  checksum64    = '7288a31b884332d6436c9fb00e4573b58ea53062b21cbd3b828d8af651d759ac'
  
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Find the executable
$exePath = Get-ChildItem -Path $toolsDir -Recurse -Filter "Iso2God.exe" | Select-Object -First 1 -ExpandProperty FullName

if ($null -eq $exePath) {
    throw "Could not find Iso2God.exe in $toolsDir"
}

# Determine the directory where the exe lives to place CSVs next to it
$installDir = Split-Path -Parent $exePath

# Determine the directory where the exe lives to place CSVs next to it
$installDir = Split-Path -Parent $exePath

# Download gamelist_xbox360.csv
Get-ChocolateyWebFile -PackageName "$env:ChocolateyPackageName (gamelist_xbox360.csv)" `
                      -FileFullPath (Join-Path $installDir 'gamelist_xbox360.csv') `
                      -Url 'https://cdn.jsdelivr.net/gh/r4dius/Iso2God@67a620251025ee79a86061b6c16e481b3279413c/gamelist_xbox360.csv' `
                      -Checksum 'AF2365A1E05B1E96C854059A96EC9859662D6C20E5A53ABA956E36E43921D89F' `
                      -ChecksumType 'sha256'

# Download gamelist_xbox.csv
Get-ChocolateyWebFile -PackageName "$env:ChocolateyPackageName (gamelist_xbox.csv)" `
                      -FileFullPath (Join-Path $installDir 'gamelist_xbox.csv') `
                      -Url 'https://cdn.jsdelivr.net/gh/r4dius/Iso2God@67a620251025ee79a86061b6c16e481b3279413c/gamelist_xbox.csv' `
                      -Checksum 'DF1B7B596A2C25D55D330AD33C3C70798B7F1B46AB6F84800F9AF1304980FFEE' `
                      -ChecksumType 'sha256'

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Iso2God.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$exePath" -WorkingDirectory "$installDir"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = "$Env:USERPROFILE\Desktop\Iso2God.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$exePath" -WorkingDirectory "$installDir"
}
