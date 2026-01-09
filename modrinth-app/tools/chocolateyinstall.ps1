$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.25/windows/Modrinth%20App_0.10.25_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'ae7d6a242406c845eaebb698a97f9160410e9c80c4f2b8e136515243ed16c9f1'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
