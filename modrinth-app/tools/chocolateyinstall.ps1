$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.17.2/windows/Modrinth%20App_0.17.2_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '65bc9ccb3111f640fea3bd138f3b2a73017b9614430dcfe7947a9e43b12dce04'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
