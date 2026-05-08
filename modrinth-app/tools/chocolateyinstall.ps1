$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.12/windows/Modrinth%20App_0.13.12_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '490c1988fe606dd0f84b11deb2a5c0bbb75df8298a6df834c9985ad7ecae7b12'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
