$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.23.2/windows/Modrinth%20App_0.23.2_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'f122efed7afffa26548fbeabcbc29876d60b4c8e96978b44eb2871b07c8253c2'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
