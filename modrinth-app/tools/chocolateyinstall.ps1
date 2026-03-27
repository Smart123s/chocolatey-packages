$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.12.5/windows/Modrinth%20App_0.12.5_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '9abfda5d0efe15f6bf90b0007bb15a8d5a78da96c614a684a225dbfb7ad0ece4'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
