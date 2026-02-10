$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.29/windows/Modrinth%20App_0.10.29_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'e4f0263fb561823ffd1d5c362467c80925052c91604c2fe809a9a2c2d0761447'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
