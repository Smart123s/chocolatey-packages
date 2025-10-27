$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.15/windows/Modrinth%20App_0.10.15_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '7d69c689538c0d7b963016da7a45993d2dd2b46943c97fb00b4a099e703bcacc'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
