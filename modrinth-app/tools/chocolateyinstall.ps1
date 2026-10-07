$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.8/windows/Modrinth%20App_0.21.8_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '2214a646d97fce6e94410de760c2060385654345bd00e16579df4d2fc0049545'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
