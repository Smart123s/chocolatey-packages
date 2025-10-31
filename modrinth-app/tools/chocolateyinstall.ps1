$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.16/windows/Modrinth%20App_0.10.16_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'eb880d831c4dc61773285f93407c025d6616e558a968b8de8111570371cb9678'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
