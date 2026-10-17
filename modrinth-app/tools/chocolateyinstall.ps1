$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.10/windows/Modrinth%20App_0.21.10_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'afcd82366f881dcc1456f54b7d3a5a8a0535d70b3d55cee8c5ec1b9d1e7f4751'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
