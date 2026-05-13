$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.17/windows/Modrinth%20App_0.13.17_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '7afb4a36b193191254d461d985f51083b5bf284d8aa00b7dff3044f2b6de1a7f'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
