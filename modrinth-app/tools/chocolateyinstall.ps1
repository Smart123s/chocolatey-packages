$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.7/windows/Modrinth%20App_0.13.7_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '0129cc995eb0be8b1a5506b73c1829a383e433d603b00728aac03bf593b4cacc'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
