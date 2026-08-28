$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.19.1/windows/Modrinth%20App_0.19.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'ee3ba68249c0fc81ddabd6c7bfa7f3b967911a1b142e4414f6fbccede411e406'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
