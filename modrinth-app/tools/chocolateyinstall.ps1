$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.20/windows/Modrinth%20App_0.15.20_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '001067788422ed71257074399e93fcf95cbbdc02a32793b96da913fc76f790cb'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
