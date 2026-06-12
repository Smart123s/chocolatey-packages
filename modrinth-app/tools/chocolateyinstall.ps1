$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.14.6/windows/Modrinth%20App_0.14.6_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '72a2a30db7255f14638f345b0eeab3ccbe7a7edeb8b0cfe93d05ebd4a56037ce'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
