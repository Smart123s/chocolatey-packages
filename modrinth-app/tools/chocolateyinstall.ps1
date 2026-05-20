$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.19/windows/Modrinth%20App_0.13.19_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '67246a7b73226c57ea4c2e388c11f1e92ff9ee5138181b59cab9ae97e462ffb1'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
