$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.7/windows/Modrinth%20App_0.10.7_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'a329f825984ec42c23cf983400b3304f10eb44ac4da36caacfafbb09813410b6'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
