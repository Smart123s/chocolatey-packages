$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.23.3/windows/Modrinth%20App_0.23.3_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '6412ce814fdff0bd6020dd800a419ff1f206c1bc2d039a2ab15ff510275d0d12'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
