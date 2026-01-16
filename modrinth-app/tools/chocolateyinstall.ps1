$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.26/windows/Modrinth%20App_0.10.26_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '280e26cb07fec253ef6e735ff279d7ff106819d15b790f6eccfa289fecd57c0b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
