$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.23.0/windows/Modrinth%20App_0.23.0_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '3b10437749b61665e762a0ef0a7b4b15d6bec651840f9a3220089ccbf08d9611'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
