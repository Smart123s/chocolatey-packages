$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.4/windows/Modrinth%20App_0.21.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'e3d6b1d86629270462e2d04886a1ed59817ef517a992ba3da6dbc641c57b8663'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
