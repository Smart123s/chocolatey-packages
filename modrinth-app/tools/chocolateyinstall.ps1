$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.10/windows/Modrinth%20App_0.13.10_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'bcb4b59752b6a67cd5b5b9b61639aae974f55a2084a7d44c5ecef976d42e09b7'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
