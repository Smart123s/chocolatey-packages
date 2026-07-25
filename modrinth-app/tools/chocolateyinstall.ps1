$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.16.1/windows/Modrinth%20App_0.16.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '0b99a17a0aa068351a1e3fc498a4d0a7f026de8f6af59a574b41f47a2cd75f2a'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
