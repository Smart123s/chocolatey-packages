$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.9/windows/Modrinth%20App_0.13.9_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'b8649b9709542cdd61c05b2429f0e45a9a9860f72f425fc309c897328c65855d'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
