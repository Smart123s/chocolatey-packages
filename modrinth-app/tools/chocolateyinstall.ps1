$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.20.5/windows/Modrinth%20App_0.20.5_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '4e6aa17970ba21bd5d4ae89e44bed7fe3f2e2cbd758931993dd57d29c4f45c0e'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
