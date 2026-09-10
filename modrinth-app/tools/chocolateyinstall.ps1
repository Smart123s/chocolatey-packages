$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.20.1/windows/Modrinth%20App_0.20.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '39d5a07f79977ad4d537cba85200d195c11f6cf9b0e5444deaf527dc2428ac08'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
