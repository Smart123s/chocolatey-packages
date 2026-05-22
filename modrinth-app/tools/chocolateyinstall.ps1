$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.21/windows/Modrinth%20App_0.13.21_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'bd4710bda51cc7040c16b7fcd0c073f19b4ff2cdace4d93bb0701a1865ce593b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
