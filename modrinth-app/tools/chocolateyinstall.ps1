$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.20.0/windows/Modrinth%20App_0.20.0_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'ee81c10f79a238d6b31a0535b889a4b651991ce2231d5d57a9bc9bede2049f3c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
