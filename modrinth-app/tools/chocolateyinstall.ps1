$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.10.30/windows/Modrinth%20App_0.10.30_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = '6af2b8d2f908fed38cff103ec1cffd14a3bad173a36b6f0eff6a0e9f85f842aa'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
