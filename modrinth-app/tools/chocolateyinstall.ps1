$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.12/windows/Modrinth%20App_0.10.12_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'ddab39391bec4ae696d234344a2e3d9275240971a1c6f57f0ab5d6be59d550d0'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
