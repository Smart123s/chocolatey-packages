$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.11.3/windows/Modrinth%20App_0.11.3_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '427a697a8778c368a0228c83ff18f51b74afd0da8130f82178d8463e000b6993'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
