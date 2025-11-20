$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.20/windows/Modrinth%20App_0.10.20_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '6cfdb44913085810589a291cdfaaec3733c87399f397160229a979744bd3d4e7'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
