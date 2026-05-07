$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.13.11/windows/Modrinth%20App_0.13.11_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '8bb7e25a9b8a3d4261b7d0bf1caa013e791ea97c998779752f87257a377c0b9c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
