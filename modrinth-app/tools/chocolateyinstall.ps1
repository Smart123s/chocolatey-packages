$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.24/windows/Modrinth%20App_0.13.24_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'c18bae0178a7de5e5fd7c5e44c0178450e951f52bd7a354278e4d517d73e7545'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
