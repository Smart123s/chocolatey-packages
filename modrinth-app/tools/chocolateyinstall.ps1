$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.3/windows/Modrinth%20App_0.13.3_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '4a21402530a6180e31fde100584af09b2955391633373feb6e87012f3f6b8845'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
