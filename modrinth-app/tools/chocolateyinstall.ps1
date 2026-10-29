$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.22.1/windows/Modrinth%20App_0.22.1_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '87f867ca0cfb2cb1808f9b6003e744d13595f77d69d00b72f06f811e23958017'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
