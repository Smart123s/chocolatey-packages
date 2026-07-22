$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.15.17/windows/Modrinth%20App_0.15.17_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'dacdaa159a8242e3db8781828d2839d356c1f3f4148fba1189d26d89a4709aa5'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
