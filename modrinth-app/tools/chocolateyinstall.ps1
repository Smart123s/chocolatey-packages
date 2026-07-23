$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.19/windows/Modrinth%20App_0.15.19_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'b79f7d743ccfe568b3a75f6ad5b1338654c5363fff592588f3824efcf3dc4bb4'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
