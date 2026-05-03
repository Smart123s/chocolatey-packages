$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.8/windows/Modrinth%20App_0.13.8_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '56e9245703ae9c2c10bc20ebafc5cb4bc51e8efdf6563242a3a942ac4ea0cd74'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
