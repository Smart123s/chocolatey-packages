$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.20/windows/Modrinth%20App_0.13.20_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '5931949a5d4a31c208eee9f4e83231ac2623055d15e71de80cf3ad4f7737e33a'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
