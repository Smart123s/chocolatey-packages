$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.6/windows/Modrinth%20App_0.13.6_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'cfdbbe94272382a9022fc21d1d503b1858b50037b0eec1b8600aa31242dc56c6'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
