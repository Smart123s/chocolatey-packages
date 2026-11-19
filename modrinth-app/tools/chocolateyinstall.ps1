$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.23.4/windows/Modrinth%20App_0.23.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '982c0275cacb6d50fecdd45bfcff434988f486de1486102b3538ebc23c376af8'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
