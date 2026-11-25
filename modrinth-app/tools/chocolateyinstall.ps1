$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.23.5/windows/Modrinth%20App_0.23.5_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'd4e59bf0ee1da227ba593d4614018b2084417980813db1efb4f02478f51299e3'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
