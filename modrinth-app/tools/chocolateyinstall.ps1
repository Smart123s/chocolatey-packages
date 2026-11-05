$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.23.1/windows/Modrinth%20App_0.23.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'd4f20ea66b0b0af22394690729116901709bc24951172f9d46740bc4c16cb008'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
