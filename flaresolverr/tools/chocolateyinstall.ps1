$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url64         = 'https://github.com/FlareSolverr/FlareSolverr/releases/download/v3.4.2/flaresolverr_windows_x64.zip'
  checksum64    = 'c69b8fcb60bdbcfbf3987a63a17591a68e911ec466c81c0224f396c2ce6d9595'
  checksumType  = 'sha256'
  UnzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs

# Disable shims for chromium executables
$files = Get-ChildItem $toolsDir -include *.exe -recurse
foreach ($file in $files) {
  if (!($file.Name.Contains("flaresolverr.exe"))) {
    #generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
  }
}

Remove-Item -ea 0 -force -path $toolsDir\flaresolverr.zip

$targetPath = Join-Path (Join-Path $toolsDir "flaresolverr") "flaresolverr.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$env:chocolateyPackageName.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = "$Env:USERPROFILE\Desktop\$env:chocolateyPackageName.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}
