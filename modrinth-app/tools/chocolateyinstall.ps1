$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.17.6/windows/Modrinth%20App_0.17.6_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'ef9c0efa624686ce3d8c87525659a7eba4ca6eb014980c45161ed8c488663b65'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
