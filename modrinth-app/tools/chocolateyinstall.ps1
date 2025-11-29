$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.21/windows/Modrinth%20App_0.10.21_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'b006ac992507cf4c6c31bb68c52358bea610b43bc15469c59b328209d454346c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
