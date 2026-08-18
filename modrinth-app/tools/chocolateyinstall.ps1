$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64         = 'https://launcher-files.modrinth.com/versions/0.18.0/windows/Modrinth%20App_0.18.0_x64-setup.exe'

  softwareName  = 'Modrinth App'

  checksum64    = 'a82e7433bf1a6361121c61cf23239e93b7d08dedef3b8af5b94995a04605324b'
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs
