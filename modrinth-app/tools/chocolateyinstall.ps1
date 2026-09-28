$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.6/windows/Modrinth%20App_0.21.6_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '5a555f48c357eeced711ef4728585d2c33e25c265167eca8d56398bc76bd01a5'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
