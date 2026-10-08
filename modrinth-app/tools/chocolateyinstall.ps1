$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.21.9/windows/Modrinth%20App_0.21.9_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '8dd3ea4c9f2a190e2d1b6e21b3e6a065501ffbddc990297c4c0a7f64e16dbd50'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
