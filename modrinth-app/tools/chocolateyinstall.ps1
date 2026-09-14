$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.0/windows/Modrinth%20App_0.21.0_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '631db68bf5cec669b9bbfad792f7c4c039823c9d12a711c4036ef00aab57231a'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
