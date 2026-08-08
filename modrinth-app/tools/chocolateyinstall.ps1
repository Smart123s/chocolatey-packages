$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.17.4/windows/Modrinth%20App_0.17.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '5ff1e5a3f2bb1c44a3277130699699a674f2823bec6a97d438da659b4b4f218d'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
