$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.14.4/windows/Modrinth%20App_0.14.4_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '3f921b0d65ae6d4cde00e6de13d626e99dc125f41773e84d87ac18928f4d3985'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
