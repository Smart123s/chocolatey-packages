$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$packageArgs = @{
    packageName    = "$env:chocolateyPackageName"
    destination    = $toolsDir
    FileFullPath64 = Join-Path $toolsDir 'nekoray.zip'
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -ea 0 -force -path $toolsDir\*.zip

$nekorayConfigDir = Join-Path $toolsDir "nekoray\config"
if (-Not (Test-Path $nekorayConfigDir)) {
  New-Item -ItemType Directory -Path $nekorayConfigDir | Out-Null
}

# Make the directory writable by regular users
$acl = Get-Acl $nekorayConfigDir
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Users", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.SetAccessRule($accessRule)
Set-Acl -Path $nekorayConfigDir -AclObject $acl

$targetPath = Join-Path (Join-Path $toolsDir "nekoray") "nekobox.exe"

# Add StartMenu shortcut
If (-Not( $PackageParameters.NoStartMenuShortcut )) {
  $programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\nekoray.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}

# Add Desktop shortcut
If (-Not( $PackageParameters.NoDesktopShortcut )) {
  $programsPath = "$Env:USERPROFILE\Desktop\nekoray.lnk"
  Install-ChocolateyShortcut -shortcutFilePath "$programsPath" -targetPath "$targetPath"
}
