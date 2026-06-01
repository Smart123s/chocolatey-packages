$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.14.2/windows/Modrinth%20App_0.14.2_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'd988521d603a6655cc352332c6b4aa6e60fd225eb687cd253ca2ad5fd62fa1f5'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
