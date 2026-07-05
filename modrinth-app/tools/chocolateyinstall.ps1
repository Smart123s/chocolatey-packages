$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.6/windows/Modrinth%20App_0.15.6_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '34a1e3a7e4dfed4a94d254a379bf92188ebe88b68396e08c6a34dba7e8e08e05'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
